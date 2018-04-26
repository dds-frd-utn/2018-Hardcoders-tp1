/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utn.frd.Hardcoders.sessions;

import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Root;
import utn.frd.Hardcoders.entities.Cuenta;
import utn.frd.Hardcoders.entities.Movimiento;

/**
 *
 * @author Damian
 */
@Stateless
public class MovimientoFacade extends AbstractFacade<Movimiento> {

    @PersistenceContext(unitName = "utn.frd_Hardcoders_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MovimientoFacade() {
        super(Movimiento.class);
    }

    public List<Movimiento> lastTenMovements(Long idCuenta) {

        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        Root<Movimiento> movimiento = cq.from(Movimiento.class);
        cq.select(movimiento)
                .where(cb.equal(movimiento.get("idCuenta"), idCuenta))
                .orderBy(cb.desc(movimiento.get("id")));
        return getEntityManager().createQuery(cq).setMaxResults(10).getResultList();
    }

    public List<Movimiento> findMovementsByStatusId(Long idCuenta, Long idEstado) {
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        Root<Movimiento> movimiento = cq.from(Movimiento.class);
        cq.select(movimiento)
                .where(
                        cb.and(
                                cb.equal(movimiento.get("idCuenta"), idCuenta), 
                                cb.equal(movimiento.get("estado"), idEstado)));
        return getEntityManager().createQuery(cq).getResultList();
    }

    public List<Movimiento> findMovementsByDescription(Long idCuenta, String descripcion) {
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        Root<Movimiento> movimiento = cq.from(Movimiento.class);
        cq.select(movimiento)
                .where(
                        cb.and(
                                cb.equal(movimiento.get("idCuenta"), idCuenta), 
                                cb.like(movimiento.get("descripcion").as(String.class), descripcion)));
        return getEntityManager().createQuery(cq).getResultList();
    }

    public Double processAccountMovements(Long idCuenta) {
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();

        Root<Movimiento> movimiento = cq.from(Movimiento.class);
        Root<Cuenta> cuenta = cq.from(Cuenta.class);

        cq.select(cb.sumAsDouble(movimiento.get("importe").as(Float.class)))
                .where(
                        cb.and(
                                cb.equal(movimiento.get("idCuenta"), idCuenta),
                                cb.isNull(movimiento.get("procesado"))));

        Double result = (Double) getEntityManager().createQuery(cq).getSingleResult();

        if (result != null) {

            CriteriaUpdate<Movimiento> updMovs = cb.createCriteriaUpdate(Movimiento.class)
                    .set("procesado", new Date())
                    .set("estado", 2)
                    .where(
                            cb.and(
                                    cb.equal(movimiento.get("idCuenta"), idCuenta),
                                    cb.isNull(movimiento.get("procesado"))));

            getEntityManager().createQuery(updMovs).executeUpdate();

            Cuenta instance = getEntityManager().find(Cuenta.class, idCuenta);
            instance.setSaldo(result);
            getEntityManager().merge(instance);

        }
        return result;

    }

}
