import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listFinancing(query) {
  return request({
    url: '/system/financing/list',
    method: 'get',
    params: query
  })
}



// 查询【请填写功能名称】详细
export function getFinancing(id) {
  return request({
    url: '/system/financing/' + id,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addFinancing(data) {
  return request({
    url: '/system/financing',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updateFinancing(data) {
  return request({
    url: '/system/financing',
    method: 'put',
    data: data
  })
}
// 删除【请填写功能名称】
export function contributive(id) {
  return request({
    url: '/system/financing/contributive/' + id,
    method: 'get'
  })
}
// 删除【请填写功能名称】
export function delFinancing(id) {
  return request({
    url: '/system/financing/' + id,
    method: 'delete'
  })
}
//详情删除
export function MyFinancingInfo(id) {
  return request({
    url: '/system/financing/MyFinancingInfo/' + id,
    method: 'delete'
  })
}

// 删除图片http://localhost:8080
export function getDelete(path) {
  return request({
    url: '/fastDfs/fastDfs/' + path,
    method: 'delete'
  })
}
