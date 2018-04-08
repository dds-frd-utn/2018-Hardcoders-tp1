/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utn.frd.Hardcoders.sessions;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import utn.frd.Hardcoders.entities.EstadoMovimiento;

/**
 *
 * @author Damian
 */
@Stateless
public class EstadoMovimientoFacade extends AbstractFacade<EstadoMovimiento> {

    @PersistenceContext(unitName = "utn.frd_Hardcoders_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EstadoMovimientoFacade() {
        super(EstadoMovimiento.class);
    }
    
}
