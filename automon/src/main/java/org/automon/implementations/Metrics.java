package org.automon.implementations;

import com.codahale.metrics.MetricRegistry;
import com.codahale.metrics.Timer;
import org.aspectj.lang.JoinPoint;

import java.util.List;

import static com.codahale.metrics.MetricRegistry.name;

/**
 * {@link org.automon.implementations.OpenMon} implementation that uses Yammer Metrics to time methods, and count exceptions.
 */
public class Metrics extends OpenMonBase<Timer> {
    private static MetricRegistry metrics = new MetricRegistry();

    @Override
    public Timer start(JoinPoint.StaticPart jp) {
        return metrics.timer(name(jp.toString()));
    }

    @Override
    public void stop(Timer timer) {
        timer.time().stop();
    }

    @Override
    protected void trackException(JoinPoint jp, Throwable throwable) {
        List<String> labels = getLabels(throwable);
        for (String label : labels) {
            metrics.counter(label).inc();
        }
    }

    public static MetricRegistry getMetricRegistry() {
        return metrics;
    }

    public static void setMetricRegistry(MetricRegistry newMetricRegistry) {
        metrics = newMetricRegistry;
    }

}
