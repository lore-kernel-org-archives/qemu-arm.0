Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2067953wrs;
        Thu, 29 Aug 2019 05:19:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDZ4WbvK9+oEG0zbzyAFDckzouc+5UM1+gDzeDqGZSmEkSbmDpvWr9dI096SDqpUlYSxzJ
X-Received: by 2002:a05:620a:16dc:: with SMTP id a28mr8400204qkn.200.1567081150125;
        Thu, 29 Aug 2019 05:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567081150; cv=none;
        d=google.com; s=arc-20160816;
        b=PWflf5POXHMbkBAZgOl0lbYjub8FYCmRB9+AYOf5FcHtzJnGgmd6mUFJ0FGdFRsoA7
         jazO9w1uOe/w9KakThTLXzjZNQX5UcPQxjVgOvK0JrGXEdl+BmAoF2K9F2ICyZjarDCE
         EDNpJxjz1hRdkvYpMidAT46+/C7kBJfpPRwLDcrkdrLg4H66MvysvJi3S1+dKIxKWVKn
         vOnitUxBCQc1T6b+JCw5bZI/zz6JJ2nksZ3446rY9/6dQRmKSGBgvarqh9n+i9dJWMNN
         pC03WjANUNS0JTslLCc/nsjtUhkDjETIOfd7pPSS46h69qVftJxv9kMIVx2QMH/f7Npr
         CfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=3CtoasSRoWWxMk1Grbp5xm25irbRPUEwCY+ptWgLjds=;
        b=leQJm+foBNLygEJq9LYxRpNuc2L3W5Y8j/A2cd7EDH0JPzrGFCfPoBtp49PHt7siME
         mYVk2RyHNBjGb+wH3LhQ5aotjaguLZAhh0BtPIGVfeJrvRY4qOqQ+ixHPw5WYgUpfjkg
         VBxTNowSXWDfFyQx7feLWUalrx23V4w4tcgZuLhchkejREfMMchgYWui2cqW3OKaAlY9
         2NxtP6XdqjD5vP8IXcQEXhxO2qWHXk+bS5HobZPrB/XWfTnUzOIVFhUCRzzAIezSZEr1
         Q7PkLrl/fGcZpaMY6ZnSYUNt8TzjXF8hDcIdsTpGnmHAjBvx3GCXLSI9s5oxo3SzUp6v
         VMHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si1579212qtb.241.2019.08.29.05.19.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 05:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3JOP-0003Qe-Hl
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 08:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i3JOB-0003QL-Eg
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 08:18:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i3JO9-0003Pu-UI
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 08:18:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51366)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i3JO9-0003Mx-L3; Thu, 29 Aug 2019 08:18:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D1727308A9E0;
 Thu, 29 Aug 2019 12:18:52 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1DD85F7DA;
 Thu, 29 Aug 2019 12:18:43 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-4-eric.auger@redhat.com> <20190815135400.GC8463@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f6a3b750-8439-7934-565b-37e1001f84d4@redhat.com>
Date: Thu, 29 Aug 2019 14:18:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190815135400.GC8463@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 29 Aug 2019 12:18:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-TUID: 7XII/Lo11Rsu

Hi Peter,

First of all, please forgive me for the delay.
On 8/15/19 3:54 PM, Peter Xu wrote:
> On Tue, Jul 30, 2019 at 07:21:25PM +0200, Eric Auger wrote:
>> +static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>> +{
>> +    VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>> +    struct virtio_iommu_req_head head;
>> +    struct virtio_iommu_req_tail tail;
> 
> [1]
> 
>> +    VirtQueueElement *elem;
>> +    unsigned int iov_cnt;
>> +    struct iovec *iov;
>> +    size_t sz;
>> +
>> +    for (;;) {
>> +        elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
>> +        if (!elem) {
>> +            return;
>> +        }
>> +
>> +        if (iov_size(elem->in_sg, elem->in_num) < sizeof(tail) ||
>> +            iov_size(elem->out_sg, elem->out_num) < sizeof(head)) {
>> +            virtio_error(vdev, "virtio-iommu bad head/tail size");
>> +            virtqueue_detach_element(vq, elem, 0);
>> +            g_free(elem);
>> +            break;
>> +        }
>> +
>> +        iov_cnt = elem->out_num;
>> +        iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
> 
> Could I ask why memdup is needed here?
Indeed I don't think it is needed and besides iov is not freed!

I got inspired from hw/net/virtio-net.c. To be honest I don't get why
the g_memdup is needed there either. The out_sg gets duplicated and
commands work on the duplicated data and not in place.
> 
>> +        sz = iov_to_buf(iov, iov_cnt, 0, &head, sizeof(head));
>> +        if (unlikely(sz != sizeof(head))) {
>> +            tail.status = VIRTIO_IOMMU_S_DEVERR;
> 
> Do you need to zero the reserved bits to make sure it won't contain
> garbage?  Same question to below uses of tail.
yes. I initialized tail.
> 
>> +            goto out;
>> +        }
>> +        qemu_mutex_lock(&s->mutex);
>> +        switch (head.type) {
>> +        case VIRTIO_IOMMU_T_ATTACH:
>> +            tail.status = virtio_iommu_handle_attach(s, iov, iov_cnt);
>> +            break;
>> +        case VIRTIO_IOMMU_T_DETACH:
>> +            tail.status = virtio_iommu_handle_detach(s, iov, iov_cnt);
>> +            break;
>> +        case VIRTIO_IOMMU_T_MAP:
>> +            tail.status = virtio_iommu_handle_map(s, iov, iov_cnt);
>> +            break;
>> +        case VIRTIO_IOMMU_T_UNMAP:
>> +            tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
>> +            break;
>> +        default:
>> +            tail.status = VIRTIO_IOMMU_S_UNSUPP;
>> +        }
>> +        qemu_mutex_unlock(&s->mutex);
>> +
>> +out:
>> +        sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
>> +                          &tail, sizeof(tail));
>> +        assert(sz == sizeof(tail));
>> +
>> +        virtqueue_push(vq, elem, sizeof(tail));
> 
> s/tail/head/ (though they are the same size)?
That's unclear to me. Similarly when checking against virtio-net.c, the
element is pushed back to the used ring and len is set to the size of
the status with:

/*
 * Control virtqueue data structures
 *
 * The control virtqueue expects a header in the first sg entry
 * and an ack/status response in the last entry.  Data for the
 * command goes in between.
 */
> 
>> +        virtio_notify(vdev, vq);
>> +        g_free(elem);
>> +    }
>> +}
> 
> [...]
> 
>> +static void virtio_iommu_set_features(VirtIODevice *vdev, uint64_t val)
>> +{
>> +    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
>> +
>> +    dev->acked_features = val;
>> +    trace_virtio_iommu_set_features(dev->acked_features);
>> +}
>> +
>> +static const VMStateDescription vmstate_virtio_iommu_device = {
>> +    .name = "virtio-iommu-device",
>> +    .unmigratable = 1,
> 
> Curious, is there explicit reason to not support migration from the
> first version? :)
The state is made of red black trees, lists. For the former there is no
VMSTATE* ready. I am working on it but I think this should be handled
separately
> 
>> +};
>> +
>> +static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>> +{
>> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> +    VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
>> +
>> +    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
>> +                sizeof(struct virtio_iommu_config));
>> +
>> +    s->req_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE,
>> +                             virtio_iommu_handle_command);
>> +    s->event_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE, NULL);
>> +
>> +    s->config.page_size_mask = TARGET_PAGE_MASK;
>> +    s->config.input_range.end = -1UL;
>> +    s->config.domain_range.start = 0;
> 
> Zero input_range.start = 0?  After all domain_range.start is zeroed.
virtio_init does:
    if (vdev->config_len) {
        vdev->config = g_malloc0(config_size);

but I should be homogeneous and then remove s->config.domain_range.start
= 0;
> 
>> +    s->config.domain_range.end = 32;
>> +
>> +    virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
>> +    virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC);
>> +    virtio_add_feature(&s->features, VIRTIO_F_VERSION_1);
>> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
>> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_RANGE);
>> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
>> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
>> +}
> 
> Regards,
> 
