function h = subplottight(n,m,i)
    [c,r] = ind2sub([m n], i);
    ax = subplot([(c-1)/m, 1-(r)/n, 1/m, 1/n], 'align')
    if(nargout > 0)
      h = ax;
    end
