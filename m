Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2788835lfb;
        Fri, 8 May 2020 02:26:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypJrxbcqUkKvQEkTtzoX3/RekxbKj6nMcvkA/4OhDUVKN9c1r5dVQdMhmuXDvBYwM4Wis53v
X-Received: by 2002:a37:4895:: with SMTP id v143mr1625925qka.363.1588929991903;
        Fri, 08 May 2020 02:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588929991; cv=none;
        d=google.com; s=arc-20160816;
        b=YH2kTjefNd0dl2MwKxEj+yYPlAteF0KCP5zIMTGsSOpPs9g+i3mhnQbHjwZ/u6Op5K
         Co95W2ftY6DBb/T6Px8HnDIRHLLSfkxgrIfvlXf1b84CVQ0gdvNPljPOSPXB4/Pfe7H1
         48O1pkubW9X1RA1ZbFEd2KPe69ob4KmtXg+XTUa0ZOLJenkt+SGQEgU9+MtoMhkeeFD1
         F4GmKqj5iQQcQYrWgcGKIQQraX+QeF3dppbO5g/+Vt+W2hZbGytlyCrblfqhwBPTQD8D
         fI8FQjISmkXcyKI+37PCz5/FhjA6KEn9hY/cCWKE3INb7fUlyhc2dtNfkNX5ZZMGTnym
         qi0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=VmMh+jqzek/DyUAQYhooLKmziQFLl0vhpC/AJ9Ek3Pk=;
        b=BsQSVxjrcuCToEq04/TMgdhQ2rIj7At1DkT6yc69lJaO4uXclHkgqIQdQ1MFqfAEF1
         eogCQ8Q8GD6EGg3iDWxV5MlC1YTLuJmmiq0Iw0O4ZWLswKXuVST/9B3PxKSBYhsM+hV+
         zT5+gN/qK92YQqQcPG+XA3YvFtoEfPEpmANX9TaIST3lb61Akg8p5OEgPulpJu0Rn138
         GQLHGMbj4fAhbZ/hNvFejzpv8LhhzhBKLjdBWRz1CFjqdiQcQxB11YtmSBECBEh1m0HR
         OcFDLWx62Ph7oDQqPd16Tbx9Yg8wCAuOq2JU6umPrLkbdPWVSiQakEx5/UaiwG12D/+Z
         I53g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="V/xk8vft";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id b4si910445qvq.209.2020.05.08.02.26.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 02:26:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="V/xk8vft";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWzH4-0008He-4A
	for alex.bennee@linaro.org; Fri, 08 May 2020 05:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1jWzGu-0008GO-JC
 for qemu-arm@nongnu.org; Fri, 08 May 2020 05:26:20 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1jWzGr-00087e-CF
 for qemu-arm@nongnu.org; Fri, 08 May 2020 05:26:20 -0400
Received: by mail-wm1-x341.google.com with SMTP id u16so9817506wmc.5
 for <qemu-arm@nongnu.org>; Fri, 08 May 2020 02:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VmMh+jqzek/DyUAQYhooLKmziQFLl0vhpC/AJ9Ek3Pk=;
 b=V/xk8vfttyJH58ce0xNpateZn8QZp7BxrDDE+ldwiszwzYbRux5W8yVEQHgUBSnB41
 wUTIFmuk2WZGiUbtWD30d9796qnUDBTP04M1k9w4WSFWCKCAsNtsFa8jR5quCZzis1c3
 GtYzrj5DUZMPh/Tl+jolQTTBS3b3yUDr+UXHXDu4uCEtmkAXwm/iUxzVnjfW4hYXSsuH
 lsCsCSoTmCu5YM8DIjZU+NGF7L/y/O1ghldCqq5BLymhOmtSx45VPYqU/sTIH04054R4
 Zf0noITMOwVBktMeeRdgWm1y3Mwarytt7X2EmrfPP6OLsXUe/gofvxedERqDHXr1/ChU
 IpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VmMh+jqzek/DyUAQYhooLKmziQFLl0vhpC/AJ9Ek3Pk=;
 b=DzepB52zsK0bYu/HQ/n6iuC2m1HuP83q4yU2lMuTq86P9Oagi44XEWeKdu6sS1aP3e
 c/86HQhIcteOTAHOQoQkv6LGqEZgI7VLMIy9R1rOA8BYLebCqRWDGvfZndjumyyGRlEO
 RAO6N4723k82Vx8Il1WsXJgZCgETYfRpMrdmFb3QAlUUuDS9z4IywaR/NOqhTq3JiBZO
 X3ZB4ewDTymXlz3CSWw+xBhLRhDtzMrtTpPuxo+EWJ01fnHC0mdLPzjEdKJ6z4orz4Ts
 kki9aqiwCwyYp+bXweVoHqfisz5lFr3rmtjw38gFYPLm16zdBoKk19zAGmWFKWT2zrVu
 wGVw==
X-Gm-Message-State: AGi0PuZKNyvTCsTaA4C/+3zFtsccozBjjzqE5kp2iGRBYyXB6R6f6NWC
 ajGLCXX/Z5bGHUIygNM8driZBg==
X-Received: by 2002:a1c:9816:: with SMTP id a22mr14401471wme.125.1588929975824; 
 Fri, 08 May 2020 02:26:15 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id 77sm2137641wrc.6.2020.05.08.02.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 02:26:15 -0700 (PDT)
Date: Fri, 8 May 2020 11:26:05 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/5] virtio-iommu: Implement RESV_MEM probe request
Message-ID: <20200508092605.GB1770804@myrica>
References: <20200507143201.31080-1-eric.auger@redhat.com>
 <20200507143201.31080-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507143201.31080-3-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkZIrkjDw946

On Thu, May 07, 2020 at 04:31:58PM +0200, Eric Auger wrote:
> +static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
> +                                               uint8_t *buf, size_t free)
> +{
> +    struct virtio_iommu_probe_resv_mem prop = {};
> +    size_t size = sizeof(prop), length = size - sizeof(prop.head), total;
> +    int i;
> +
> +    total = size * s->nb_reserved_regions;
> +
> +    if (total > free) {
> +        return -ENOSPC;
> +    }
> +
> +    for (i = 0; i < s->nb_reserved_regions; i++) {
> +        prop.head.type = VIRTIO_IOMMU_PROBE_T_RESV_MEM;

cpu_to_le16

> +        prop.head.length = cpu_to_le64(length);

same here

> +        prop.subtype = cpu_to_le64(s->reserved_regions[i].type);

and subtype is a byte

> +        prop.start = cpu_to_le64(s->reserved_regions[i].low);
> +        prop.end = cpu_to_le64(s->reserved_regions[i].high);
> +
> +        memcpy(buf, &prop, size);
> +
> +        trace_virtio_iommu_fill_resv_property(ep, prop.subtype,
> +                                              prop.start, prop.end);
> +        buf += size;
> +    }
> +    return total;
> +}
> +
> +/**
> + * virtio_iommu_probe - Fill the probe request buffer with
> + * the properties the device is able to return and add a NONE
> + * property at the end.
> + */
> +static int virtio_iommu_probe(VirtIOIOMMU *s,
> +                              struct virtio_iommu_req_probe *req,
> +                              uint8_t *buf)
> +{
> +    uint32_t ep_id = le32_to_cpu(req->endpoint);

I think we should check that the endpoint ID is sane even if we're not
using it at the moment (it is a SHOULD in the spec, and the page size mask
patch will need the ep anyway).

> +    struct virtio_iommu_probe_property last = {};
> +    size_t free = VIOMMU_PROBE_SIZE - sizeof(last);

last isn't needed, you can fill the whole probe buffer with valid
properties

> +    ssize_t count;
> +
> +    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, free);
> +    if (count < 0) {
> +            return VIRTIO_IOMMU_S_INVAL;

indentation?

Thanks,
Jean

> +    }
> +    buf += count;
> +    free -= count;
> +
> +    /* Fill the rest with zeroes */
> +    memset(buf, 0, free);
> +
> +    return VIRTIO_IOMMU_S_OK;
> +}
> +
>  static int virtio_iommu_iov_to_req(struct iovec *iov,
>                                     unsigned int iov_cnt,
>                                     void *req, size_t req_sz)
> @@ -407,6 +464,17 @@ virtio_iommu_handle_req(detach)
>  virtio_iommu_handle_req(map)
>  virtio_iommu_handle_req(unmap)
>  
> +static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
> +                                     struct iovec *iov,
> +                                     unsigned int iov_cnt,
> +                                     uint8_t *buf)
> +{
> +    struct virtio_iommu_req_probe req;
> +    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req));
> +
> +    return ret ? ret : virtio_iommu_probe(s, &req, buf);
> +}
> +
>  static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
> @@ -452,17 +520,33 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>          case VIRTIO_IOMMU_T_UNMAP:
>              tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
>              break;
> +        case VIRTIO_IOMMU_T_PROBE:
> +        {
> +            struct virtio_iommu_req_tail *ptail;
> +            uint8_t *buf = g_malloc0(s->config.probe_size + sizeof(tail));
> +
> +            ptail = (struct virtio_iommu_req_tail *)
> +                        (buf + s->config.probe_size);
> +            ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
> +
> +            sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
> +                              buf, s->config.probe_size + sizeof(tail));
> +            g_free(buf);
> +            assert(sz == s->config.probe_size + sizeof(tail));
> +            goto push;
> +        }
>          default:
>              tail.status = VIRTIO_IOMMU_S_UNSUPP;
>          }
> -        qemu_mutex_unlock(&s->mutex);
>  
>  out:
>          sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
>                            &tail, sizeof(tail));
>          assert(sz == sizeof(tail));
>  
> -        virtqueue_push(vq, elem, sizeof(tail));
> +push:
> +        qemu_mutex_unlock(&s->mutex);
> +        virtqueue_push(vq, elem, sz);
>          virtio_notify(vdev, vq);
>          g_free(elem);
>      }
> @@ -667,6 +751,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      s->config.page_size_mask = TARGET_PAGE_MASK;
>      s->config.input_range.end = -1UL;
>      s->config.domain_range.end = 32;
> +    s->config.probe_size = VIOMMU_PROBE_SIZE;
>  
>      virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
>      virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC);
> @@ -676,6 +761,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
>  
>      qemu_mutex_init(&s->mutex);
>  
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index e83500bee9..5550475691 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -73,3 +73,4 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
>  virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
>  virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
>  virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
> +virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t start, uint64_t end) "dev= %d, type=%d start=0x%"PRIx64" end=0x%"PRIx64
> -- 
> 2.20.1
> 
