Shader "Custom/Mobile Transparency and Color"{
Properties {
    _Color ("Main Color", Color) = (1,1,1,1)
}

Category {
    Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
    ZWrite Off
    Alphatest Greater 0
    Blend SrcAlpha OneMinusSrcAlpha 
    SubShader {
        Material {
            Diffuse [_Color] 
        }
        Pass {
            ColorMaterial AmbientAndDiffuse
            Fog { Mode Off }
            Lighting Off
            SeparateSpecular On
            SetTexture [_MainTex] {
            Combine texture * primary, texture * primary
        }
        SetTexture [_MainTex] {
            constantColor [_Color]
            Combine previous * constant DOUBLE, previous * constant
        }  
        }
    } 
}
}
