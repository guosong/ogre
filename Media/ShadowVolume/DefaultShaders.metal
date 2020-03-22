// full screen quad as triangle list
constant float2 vtx[] = {{-1, 1}, {-1, -1}, {1, -1}, {-1, 1}, {1, -1}, {1, 1}};

struct RasterizerData
{
  float4 pos [[position]];
  float4 col;
};

vertex RasterizerData default_vp(
  const device packed_float3* vertex_array [[ buffer(0) ]],
  const device packed_float2* uv_array [[ buffer(1) ]],
  uint vId [[vertex_id]])
{
  RasterizerData out;
  out.pos = float4(vertex_array[vId], 1);
  out.col = float4(uv_array[vId].xy,1,1);
  return out;
}

fragment float4 default_fp(RasterizerData in [[stage_in]])
{
  return in.col;
}