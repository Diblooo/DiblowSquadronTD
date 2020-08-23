Shader "Custom/Mobile Color Shader" {
Properties {
    _Color("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
}
SubShader {
    Tags 
{ 
    "RenderType"="Opaque"
}
    LOD 150

    CGPROGRAM
	#include"Assets/Battlehub/HorizonBending/Shaders/CGIncludes/HB_Core.cginc"

    // Physically based Standard lighting model, and enable shadows on all light types
    #pragma surface surf Lambert noforwardadd vertex:hb_vert

    float4 _Color;

    struct Input {
        half color : COLOR;
    };
    void surf (Input IN, inout SurfaceOutput o) {
        o.Albedo = _Color;
    }
    ENDCG
}
FallBack "Diffuse"  }
