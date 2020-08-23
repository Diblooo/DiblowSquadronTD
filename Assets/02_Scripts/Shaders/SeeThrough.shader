Shader "Custom/SeeThrough"
{
	Properties
	{
		_Color("See through color", Color) = (1,1,1,1)
		_Color2("Normal Color", Color) = (1,1,1,1)
		_OutlineColor("Outline Color", Color) = (1, 1, 1, 1)
		_Outline("Outline", Float) = 0.1
	}

		Category
	{
		SubShader
		{
			Tags { "Queue" = "Transparent" "RenderType"="Transparent" }
			ZWrite Off
			Alphatest Greater 0
			Blend SrcAlpha OneMinusSrcAlpha

			Pass
			{
				ZTest Greater
				Lighting Off
				Color[_Color]

			}
			Pass
			{

				ZTest Less
				Lighting Off
				Color[_Color2]
			}
		}
	}

		FallBack "Specular", 1
}