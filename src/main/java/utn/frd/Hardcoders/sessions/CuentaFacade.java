/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utn.frd.Hardcoders.sessions;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import utn.frd.Hardcoders.entities.Cuenta;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author Damian
 */
@Stateless
public class CuentaFacade extends AbstractFacade<Cuenta> {

    @PersistenceContext(unitName = "utn.frd_Hardcoders_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CuentaFacade() {
        super(Cuenta.class);
    }
    
    public List<Cuenta> findByClientId(Long id) {
      CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
      CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
      Root<Cuenta> cuenta = cq.from(Cuenta.class);
      cq.select(cuenta).where(cb.equal(cuenta.get("idCliente"), id));
      return getEntityManager().createQuery(cq).getResultList();
    }
        
}
