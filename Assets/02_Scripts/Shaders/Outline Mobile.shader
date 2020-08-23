Shader "Custom/Outline Mobile"
{
    Properties
    {
        _Color("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
        _OutlineColor ("Outline Color", Color) = (1, 1, 1, 1)
        _Outline ("Outline", Float) = 0.1
    }
 
    SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 150
 
        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Front
            ZWrite On
 
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
 
            uniform half4 _OutlineColor;
            uniform half _Outline;
 
            struct vertexInput
            {
                float4 vertex : POSITION;
            };
 
            struct vertexOutput
            {
                float4 pos : SV_POSITION;
            };
 
            float4 Outline(float4 vertPos, float outline)
            {
                float4x4 scaleMatrix;
                scaleMatrix[0][0] = 1.0 + outline;
                scaleMatrix[0][1] = 0.0;
                scaleMatrix[0][2] = 0.0;
                scaleMatrix[0][3] = 0.0;
                scaleMatrix[1][0] = 0.0;
                scaleMatrix[1][1] = 1.0 + outline;
                scaleMatrix[1][2] = 0.0;
                scaleMatrix[1][3] = 0.0;
                scaleMatrix[2][0] = 0.0;
                scaleMatrix[2][1] = 0.0;
                scaleMatrix[2][2] = 1.0 + outline;
                scaleMatrix[2][3] = 0.0;
                scaleMatrix[3][0] = 0.0;
                scaleMatrix[3][1] = 0.0;
                scaleMatrix[3][2] = 0.0;
                scaleMatrix[3][3] = 1.0;
 
                return mul(scaleMatrix, vertPos);
            }
 
            vertexOutput vert(vertexInput v)
            {
                vertexOutput o;
                o.pos = UnityObjectToClipPos(Outline(v.vertex, _Outline));
                return o;
            }
 
            half4 frag(vertexOutput i) : COLOR
            {
                return _OutlineColor;
            }
 
            ENDCG
        }  
 
        CGPROGRAM
        #pragma surface surf Lambert noforwardadd
 
        float4 _Color;
 
        struct Input {
            half color : COLOR;
        };
 
        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = _Color;
        }
        ENDCG
    }
 
    Fallback "Mobile/VertexLit"
}

