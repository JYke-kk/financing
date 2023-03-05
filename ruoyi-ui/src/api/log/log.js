import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listLog(query) {
  return request({
    url: '/system/log/list',
    method: 'get',
    params: query
  })
}

// 查询【请填写功能名称】详细
export function getLog(id) {
  return request({
    url: '/system/log/' + id,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addLog(data) {
  return request({
    url: '/system/log',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updateLog(data) {
  return request({
    url: '/system/log',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delLog(id) {
  return request({
    url: '/system/log/' + id,
    method: 'delete'
  })
}

// 删除【请填写功能名称】
export function auditSuccess(id) {
  return request({
    url: '/system/log/auditSuccess/' + id,
    method: 'get'
  })
}

export function auditFail(id) {
  return request({
    url: '/system/log/auditFail/' + id,
    method: 'get'
  })
}
