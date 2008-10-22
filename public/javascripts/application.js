window.onload = function()
{
    menu_curves = {
        tl: { radius: 0 },
        tr: { radius: 0 },
        bl: { radius: 8 },
        br: { radius: 8 },
        antiAlias: true,
        autoPad: true,
        validTags: ["div"]
    }

    fieldset_curves = {
        tl: { radius: 8 },
        tr: { radius: 8 },
        bl: { radius: 8 },
        br: { radius: 8 },
        antiAlias: true,
        autoPad: true,
        validTags: ["fieldset"]
    }
    
    legend_curves = {
        tl: { radius: 5 },
        tr: { radius: 5 },
        bl: { radius: 5 },
        br: { radius: 1 },
        antiAlias: true,
        autoPad: true,
        validTags: ["legend"]
    }
    
    flash_curves = {
        tl: { radius: 1 },
        tr: { radius: 6 },
        bl: { radius: 1 },
        br: { radius: 6 },
        antiAlias: true,
        autoPad: true,
        validTags: ["div"]
    }
    
    indicator_curves = {
        tl: { radius: 5 },
        tr: { radius: 5 },
        bl: { radius: 5 },
        br: { radius: 5 },
        antiAlias: true,
        autoPad: true,
        validTags: ["div"]
    }
    
    var menu_corners = new curvyCorners(menu_curves, "page-menu");
    menu_corners.applyCornersToAll();

    var fieldset_corners = new curvyCorners(fieldset_curves, "page-fieldset");
    fieldset_corners.applyCornersToAll();
    
    var legend_corners = new curvyCorners(legend_curves, "page-legend");
    legend_corners.applyCornersToAll();
    
    var flash_corners = new curvyCorners(flash_curves, "flash-messages");
    flash_corners.applyCornersToAll();
    
    var indicator_corners = new curvyCorners(indicator_curves, "indicator");
    indicator_corners.applyCornersToAll();
}