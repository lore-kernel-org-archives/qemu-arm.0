Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2073886wrs;
        Thu, 15 Aug 2019 06:54:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwjo1vsM2k7qJjYx/SLpOo5aPA+YTqkE8bDcc15XlzPUN9ptq3bf/xICp5iPNi0TfJIzC8k
X-Received: by 2002:ac8:53cd:: with SMTP id c13mr3939886qtq.361.1565877268061;
        Thu, 15 Aug 2019 06:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565877268; cv=none;
        d=google.com; s=arc-20160816;
        b=VhddOhHzT13PIV/NyD5ZH1G9rlffGjE/osUJQf0bVBHaImFgkNA7vN3p7z2C37vkgg
         wkjK6T8LUKCPvipQjP6iKZB4T5XhkdZ8w26/OTMxqfcpTWCLxU83ph/vvuet1V2MlW2U
         Wpm2KU5CRzNe6qwK0kCnJfehm9dbw5f4OK7aqGo57kIZSHVCIanSPQt+S65Vtq7YZeMO
         rd3lm25XDGxHMfMukCoj7clwfHFzlDFzcPW6PZl2/NmhYQnz64zGpvVhl6uZtOJqnw+b
         r6moVHC5bTriplyCVkH7H0z8RbvVoo39ALoBPqrUVXYtY85H5FNhNUo2V44kGSmBv2Po
         tscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=D5d7UKjZK1DIN4VHoZOYfjri0arMQikd3DYAbT6818w=;
        b=dJKCku/NMa7XPQKotdDEr66ZoGVHRiJrNnEAWw0UnKpwO881IhZH7UJ3m5tizzVwLA
         39LiS3CgVz+UR4b3g312lwlrQxYXAhBZeVMhaysTmgLC2LtekfXJwR66YmWa2flu2CiV
         HIMU95tP03lHa03RAMj0skiAFh+px+o7EWhXTRWgbkryGiGWM6BJ/IA+CQbIqI3osPF+
         VIVsLV+FtuETmy1mGWFS7YcDs4Nvti6KiWEYDV7RK+ii+bNbzrnZi9FPg+wDYDjQGRJy
         5lv4cJegk7hSJy2sPoF+VPpIzMOvj5Nn6evNhDiZFep0JDfx3H+pb5JmrulWFZmew0Gr
         sIIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w41si1515489qtw.315.2019.08.15.06.54.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2019 06:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyGCx-0005ut-Iy
	for alex.bennee@linaro.org; Thu, 15 Aug 2019 09:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1hyGCn-0005qC-KX
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 09:54:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hyGCk-0000a9-UU
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 09:54:17 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46830)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hyGCk-0000Vk-OI
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 09:54:14 -0400
Received: by mail-pl1-f195.google.com with SMTP id c2so1090055plz.13
 for <qemu-arm@nongnu.org>; Thu, 15 Aug 2019 06:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D5d7UKjZK1DIN4VHoZOYfjri0arMQikd3DYAbT6818w=;
 b=reqHWyYwqk/WHwA8/amHdxzj514iQ7HAfwkOd8pSpM5Vgaqkj8NyOi08a198JMshza
 5a/elKkyqlAmrc9a5pJfQk1AW6E7QvC+b/eGugQBxyijPEDF5G4v/+Wqq+eOd0HSTZ8O
 tPhWKjuaf0DQNpBK5/cL7c3tPviI5GNFr5xniQsGpa0Qdjv5JAf1/3iYj39MCWEdSUuH
 /9eHJNoJQ8hKyMw8PToAchmxWJIz+PDa0HmLtGTN8Ltpn0FYPHOs+Unp5A1PeaBsebn3
 RvXD8BlkhMlh3C0g1KWpjn0/k1B9g9/FK3dKEGT5PxQBwo0sz8fa7n2flvobIkv3tTTq
 y6tw==
X-Gm-Message-State: APjAAAUa3uEIjaxybmJ8dmLlYHIxDWdNAo6wvj0QjI3N2OkDDqVDc+BC
 aTAZ7JvtfWKFmVMon+HqI2POsg==
X-Received: by 2002:a17:902:b084:: with SMTP id
 p4mr4352728plr.309.1565877252870; 
 Thu, 15 Aug 2019 06:54:12 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c26sm2626103pfr.172.2019.08.15.06.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 06:54:12 -0700 (PDT)
Date: Thu, 15 Aug 2019 21:54:00 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190815135400.GC8463@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190730172137.23114-4-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.195
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 03/15] virtio-iommu: Add skeleton
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 tn@semihalf.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QYGGFWS89EP2

On Tue, Jul 30, 2019 at 07:21:25PM +0200, Eric Auger wrote:
> +static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
> +{
> +    VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
> +    struct virtio_iommu_req_head head;
> +    struct virtio_iommu_req_tail tail;

[1]

> +    VirtQueueElement *elem;
> +    unsigned int iov_cnt;
> +    struct iovec *iov;
> +    size_t sz;
> +
> +    for (;;) {
> +        elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
> +        if (!elem) {
> +            return;
> +        }
> +
> +        if (iov_size(elem->in_sg, elem->in_num) < sizeof(tail) ||
> +            iov_size(elem->out_sg, elem->out_num) < sizeof(head)) {
> +            virtio_error(vdev, "virtio-iommu bad head/tail size");
> +            virtqueue_detach_element(vq, elem, 0);
> +            g_free(elem);
> +            break;
> +        }
> +
> +        iov_cnt = elem->out_num;
> +        iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);

Could I ask why memdup is needed here?

> +        sz = iov_to_buf(iov, iov_cnt, 0, &head, sizeof(head));
> +        if (unlikely(sz != sizeof(head))) {
> +            tail.status = VIRTIO_IOMMU_S_DEVERR;

Do you need to zero the reserved bits to make sure it won't contain
garbage?  Same question to below uses of tail.

> +            goto out;
> +        }
> +        qemu_mutex_lock(&s->mutex);
> +        switch (head.type) {
> +        case VIRTIO_IOMMU_T_ATTACH:
> +            tail.status = virtio_iommu_handle_attach(s, iov, iov_cnt);
> +            break;
> +        case VIRTIO_IOMMU_T_DETACH:
> +            tail.status = virtio_iommu_handle_detach(s, iov, iov_cnt);
> +            break;
> +        case VIRTIO_IOMMU_T_MAP:
> +            tail.status = virtio_iommu_handle_map(s, iov, iov_cnt);
> +            break;
> +        case VIRTIO_IOMMU_T_UNMAP:
> +            tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
> +            break;
> +        default:
> +            tail.status = VIRTIO_IOMMU_S_UNSUPP;
> +        }
> +        qemu_mutex_unlock(&s->mutex);
> +
> +out:
> +        sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
> +                          &tail, sizeof(tail));
> +        assert(sz == sizeof(tail));
> +
> +        virtqueue_push(vq, elem, sizeof(tail));

s/tail/head/ (though they are the same size)?

> +        virtio_notify(vdev, vq);
> +        g_free(elem);
> +    }
> +}

[...]

> +static void virtio_iommu_set_features(VirtIODevice *vdev, uint64_t val)
> +{
> +    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
> +
> +    dev->acked_features = val;
> +    trace_virtio_iommu_set_features(dev->acked_features);
> +}
> +
> +static const VMStateDescription vmstate_virtio_iommu_device = {
> +    .name = "virtio-iommu-device",
> +    .unmigratable = 1,

Curious, is there explicit reason to not support migration from the
first version? :)

> +};
> +
> +static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> +    VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
> +
> +    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
> +                sizeof(struct virtio_iommu_config));
> +
> +    s->req_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE,
> +                             virtio_iommu_handle_command);
> +    s->event_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE, NULL);
> +
> +    s->config.page_size_mask = TARGET_PAGE_MASK;
> +    s->config.input_range.end = -1UL;
> +    s->config.domain_range.start = 0;

Zero input_range.start = 0?  After all domain_range.start is zeroed.

> +    s->config.domain_range.end = 32;
> +
> +    virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
> +    virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC);
> +    virtio_add_feature(&s->features, VIRTIO_F_VERSION_1);
> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_RANGE);
> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
> +}

Regards,

-- 
Peter Xu
