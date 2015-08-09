function plot(vi::VolumeImage; colorbar_title::String = vi.units, plotting_units = Milli * Meter, kwargs...)

    debug("Plotting volume image with $(size(vi.data, 4)) time instances")

    x = [x / (1 * plotting_units) for x in vi.x]
    y = [y / (1 * plotting_units) for y in vi.y]
    z = [z / (1 * plotting_units) for z in vi.z]
    s = squeeze(mean(vi.data, 4), 4)

    # List comprehension returns type any which needs to be changed
    x = convert(Array{FloatingPoint}, x)
    y = convert(Array{FloatingPoint}, y)
    z = convert(Array{FloatingPoint}, z)
    s = convert(Array{Float64, 3}, s)

    if plotting_units == Milli * Meter
        units = "mm"
    else
        units = "??"
    end

    plot_dat(x, y, z, s, colorbar_title = colorbar_title, units = units; kwargs...)
end
