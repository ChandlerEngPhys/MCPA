function[] = MonteCarlo()

    x = [0,0];
    v1 = [0,0];
    v2 = [0,0];
    d = [0,0];
    Vsum = [0,0];
    Drift = [0,0];
    n = 0;
    N=100;
    ts = 0.1;
    F=1;
    m=1;
    figure(1)
    xlim([0 100]);
    for t=0.1:ts:N
        n = n+1;
        v2(1) = F/m + v1(1);
        v1(1) = v2(1);
        d(1) = v2(1)*ts;
        x(1) = x(1) + d(1);
        Vsum(1) = Vsum(1) + v1(1);
        Drift(1) = Vsum(1)/n;
        
        %Displacement vs time
        subplot(4,1,1);
        plot(t,x(1),'.','MarkerFaceColor','b');
        xlabel('Time');
        ylabel('Displacement');
        title(['Drift Velocity = ',num2str(Drift(1))]);
        hold on
        
        %Velocity vs time
        subplot(4,1,2);
        plot(t,v2(1),'.','MarkerFaceColor','b');
        xlabel('Time');
        ylabel('Velocity');
        hold on
        
        v2(2) = F/m + v1(2);
        v1(2) = v2(2);
        d(2) = v2(2)*ts;
        x(2) = x(2) + d(2);
        Vsum(2) = Vsum(2) + v1(2);
        Drift(2) = Vsum(2)/n;
        
        scatter = rand();
        if (scatter <= 0.05)
            v1(1)=0;
        end
        
        %Displacement vs time
        subplot(4,1,3);
        plot(t,x(2),'.','MarkerFaceColor','b');
        xlabel('Time');
        ylabel('Displacement');
        title(['Drift Velocity = ',num2str(Drift(2))]);
        hold on
        %Velocity vs time
        subplot(4,1,4);
        plot(t,v2(2),'.','MarkerFaceColor','b');
        xlabel('Time');
        ylabel('Velocity');
        hold on
        
        
        scatter = rand();
        if (scatter <= 0.05)
            v1(2)=0;
        end
        pause(0.001);
    end
    clear var
end