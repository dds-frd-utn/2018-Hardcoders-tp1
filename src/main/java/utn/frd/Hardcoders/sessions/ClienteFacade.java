/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utn.frd.Hardcoders.sessions;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import utn.frd.Hardcoders.entities.Cliente;

/**
 *
 * @author Damian
 */
@Stateless
public class ClienteFacade extends AbstractFacade<Cliente> {

    @PersistenceContext(unitName = "utn.frd_Hardcoders_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ClienteFacade() {
        super(Cliente.class);
    }

    public Cliente findByCUIL(Long cuil) {
        try {
            CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
            CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
            Root<Cliente> cliente = cq.from(Cliente.class);
            cq.select(cliente).where(cb.equal(cliente.get("cuil"), cuil));
            return (Cliente) getEntityManager().createQuery(cq).getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (Exception e){
            throw e;
        }
    }

}
