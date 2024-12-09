# LAB 2: Cantilever with thin-walled cross-section

$$I_{xx} = 2 B t_f \left(\frac{h}{2}\right)^2 + \frac{h^3t_w}{12} = \frac{bt_fh^2}{2} + \frac{t_w h^3}{12}$$
$$I_{yy} = 2\frac{t_fb^3}{3}$$
$$I_{xy} = 0$$
$$q_{0\rightarrow 1} = \frac{S_y}{I_{xx}} \int^{s}_{0} t_f \frac{h}{2}ds = -\frac{S_y}{I_{xx}}\frac{t_h}{2}s$$

$$J = \sum \frac{st^3}{3} = 2\frac{b t_f^3}{3}+\frac{ht_w^3}{3}$$
### Shear center
	Rotation over 0

$$-S_y \xi_s=2\int^{b}_{0} -\frac{S_y}{I_xx}\frac{t_f h}{2}s * \frac{h}{2} ds = \frac{2S_y}{I_{xx}}\frac{t_f h^2}{2}\frac{b^2}{2}$$
$$\xi_s = \frac{t_f b^2}{2(bt_f + \frac{t_wh}{6})}$$
$$M_z = -\xi_s S_y; \qquad \qquad M_y = 0; \qquad \qquad M_x=P(L-z)$$

### Distortions
$$u'' = 0; \qquad \qquad v'' = \frac{-M_x I_{yy}}{E(I_{xx}I_{yy})} = -\frac{M_x}{E I_{xx}} = \frac{S_y \xi_s}{I_{xx}}$$
___
$$\qquad u= Az+B = 0 $$
$$u(0) = 0; \qquad u'(0) = 0 \qquad\rightarrow\qquad A = 0; B= 0$$

$$u = 0$$
___
$$v = -\frac{P}{EI_{xx}}\left(\frac{Lz^2}{2}-\frac{z^3}{6}\right)+Cz+D$$
$$v(0) = 0;\qquad v'(0) = 0 \qquad \rightarrow\qquad C = 0; D= 0$$
$$v(L) = \frac{-P L^3}{3 E I_{xx}}$$
___
$$M_z = -P\xi_s = \frac{d \theta}{d z}GJ$$
$$\theta = \frac{-P\xi_s}{GJ}z+F$$
$$\theta(0) = 0 \rightarrow F = 0$$
$$\theta(L) = \frac{-P\xi_s L}{GJ}$$

### Shear flow
$$q_{0\rightarrow 1} = \frac{P}{I_{xx}} \int^{s1}_{0} t_f \frac{h}{2}ds1 = \frac{P}{I_{xx}}\frac{t_h}{2}s$$
$$q_{1\rightarrow 2} = \frac{P}{I_{xx}} \int^{s}_{0} t_f \frac{h}{2}ds2 = \frac{P}{I_{xx}}(t_w(\frac{h s_{2}}{2} - \frac{s_2^2}{2}) + \frac{t_h b}{2})$$

### Results
#### Analytical
$$I_{xx} = 1.26e-7$$
$$I_{yy} = 8e-9$$
$$I_0 = 1.758e-7$$
$$\xi_s = 0.0086 $$
$$x_c = 0.0067$$
$$x_s = 0.0152$$





