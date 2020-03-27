Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2940976lfi;
        Fri, 27 Mar 2020 01:35:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtgi7vHx9aEdENGdzOYNZ7B9WnGw6MQB8oJeBW7hHaL1oLDgr41tVSMlMtQx9p8Gumg2isY
X-Received: by 2002:ad4:49d1:: with SMTP id j17mr12737586qvy.80.1585298100616;
        Fri, 27 Mar 2020 01:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585298100; cv=none;
        d=google.com; s=arc-20160816;
        b=cqm7yiV8ICU0gJUpKB+lkeQx+3BN3/6A0JQvCzG4diyfC9meH3I7NbDGfO0PuerKnT
         ofqV/bTu9hIXBg/P9eGQyH7NoPAbDDgWJ9ylJ+obFZ7uSvExcDl9s2/fjxJJ2MLnCwr2
         qId+ESh3A0vSDB6kxlp380CW/2bFOSuyDRqe+zBKKGVBuYkaxp8ezboVztNZPKb8XnT4
         Kem8qgtGjRo9bkh2hpSj/vU+Vdj3Et/BNsWiag7f2H9M+wcTffZUwqWAooTlYRjbpMdq
         /6RMEPl2XjydjrJoyO87aoZSIB2+eJZu6jVPG6aoI+RqVtg27fmHKHX0UjNRtNMcAVwi
         9Kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ppIcqAk73wiVFeQXZAAPXpZzBhKa+o+IArtasKiEFas=;
        b=J2X7wacpyxjBv6g3PZvTc4/G0FrC/5V8RLWoc+qzgrKZswcfm2ljgIztCSzVXAQHUf
         71wBLDasP2q46LMO8Pd+6Ji+zgzzmxIomAwUYJjcmvZdErGyzwcTWaYcZuR6gEPqIGXz
         lpqq4QAfRPiV57dwGxnSnecXE+AuFlxVaNXC2hHtXmgYPyg/HMBSt7GXSD6IEAJW4zol
         QbLgmbrBeFberrRidolOSMI6bctB5SClf1AC7mSDSmo8BH9n1ZsOej7KNFWO2CDhXhsG
         zj5gzsCwGmX1gMrZ+MH7Fmd9dOGNNugWHeaYAaFiTMra9S1n+4JPbNLSJ1UWiYB9nXHh
         XBFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T67WGWRa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22si3036956qtb.204.2020.03.27.01.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 01:35:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T67WGWRa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHkSC-0007ig-0C
	for alex.bennee@linaro.org; Fri, 27 Mar 2020 04:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jHkS1-0007hr-Mf
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 04:34:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jHkRy-00071w-Fr
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 04:34:49 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:52695)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jHkRy-000702-5y
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 04:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585298085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppIcqAk73wiVFeQXZAAPXpZzBhKa+o+IArtasKiEFas=;
 b=T67WGWRaUHlY2uomfXjyDFseOt2P/YxhYn23ODVsQNV5NcXuZayPPrs2VWiiH/pj9ggchy
 HYyIFPD7sD9E3a4qIVobYVgC4H85+RppBEWScEEPYf+Q1bM9MOrcE85U5l0StmidWivqt7
 jXg2UItdm1EPWYyr3HZCexKVzlCM+jo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-8M7FVoXxO_WOGm99FV-Krg-1; Fri, 27 Mar 2020 04:34:41 -0400
X-MC-Unique: 8M7FVoXxO_WOGm99FV-Krg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0BE11B18BF6;
 Fri, 27 Mar 2020 08:34:39 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6028E19C69;
 Fri, 27 Mar 2020 08:34:26 +0000 (UTC)
Subject: Re: [EXT] Re: [PATCH v9 8/9] virtio-iommu: Implement probe request
To: Bharat Bhushan <bbhushan2@marvell.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "mst@redhat.com" <mst@redhat.com>, "Tomasz Nowicki [C]"
 <tnowicki@marvell.com>, "drjones@redhat.com" <drjones@redhat.com>,
 "linuc.decode@gmail.com" <linuc.decode@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "bharatb.linux@gmail.com" <bharatb.linux@gmail.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "yang.zhong@intel.com" <yang.zhong@intel.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
 <20200323084617.1782-9-bbhushan2@marvell.com>
 <401ead7e-884e-e4a8-9e5a-ceaa3c868f61@redhat.com>
 <MWHPR1801MB196670FB91F76E7775BF597CE3CC0@MWHPR1801MB1966.namprd18.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d524bd3f-133d-a93f-9c58-3234d1947301@redhat.com>
Date: Fri, 27 Mar 2020 09:34:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <MWHPR1801MB196670FB91F76E7775BF597CE3CC0@MWHPR1801MB1966.namprd18.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PXVSMl4nBpfi

Hi Bharat,

On 3/27/20 6:40 AM, Bharat Bhushan wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Auger Eric <eric.auger@redhat.com>
>> Sent: Thursday, March 26, 2020 9:18 PM
>> To: Bharat Bhushan <bbhushan2@marvell.com>; peter.maydell@linaro.org;
>> peterx@redhat.com; eric.auger.pro@gmail.com; alex.williamson@redhat.com;
>> kevin.tian@intel.com; mst@redhat.com; Tomasz Nowicki [C]
>> <tnowicki@marvell.com>; drjones@redhat.com; linuc.decode@gmail.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; bharatb.linux@gmail.com; jean-
>> philippe@linaro.org; yang.zhong@intel.com
>> Subject: [EXT] Re: [PATCH v9 8/9] virtio-iommu: Implement probe request
>>
>> External Email
>>
>> ----------------------------------------------------------------------
>> Hi Bharat
>>
>> On 3/23/20 9:46 AM, Bharat Bhushan wrote:
>>> This patch implements the PROBE request. Currently supported page size
>>> mask per endpoint is returned. Also append a NONE property in the end.
>>>
>>> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>  include/standard-headers/linux/virtio_iommu.h |   6 +
>> Changes to virtio_iommu.h should be in a separate patch you should use
>> ./scripts/update-linux-headers.sh See for instance:
>> ddda37483d  linux-headers: update
>> until the uapi updates are not upstream you can link to your kernel branch and
>> mention this is a temporary linux header update or partial if you just want to pick
>> up the iommu.h changes.
> 
> yes, I am sorry.
no problem
> 
>>
>>>  hw/virtio/virtio-iommu.c                      | 161 +++++++++++++++++-
>>>  hw/virtio/trace-events                        |   2 +
>>>  3 files changed, 166 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/standard-headers/linux/virtio_iommu.h
>>> b/include/standard-headers/linux/virtio_iommu.h
>>> index b9443b83a1..8a0d47b907 100644
>>> --- a/include/standard-headers/linux/virtio_iommu.h
>>> +++ b/include/standard-headers/linux/virtio_iommu.h
>>> @@ -111,6 +111,7 @@ struct virtio_iommu_req_unmap {
>>>
>>>  #define VIRTIO_IOMMU_PROBE_T_NONE		0
>>>  #define VIRTIO_IOMMU_PROBE_T_RESV_MEM		1
>>> +#define VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK	2
>>>
>>>  #define VIRTIO_IOMMU_PROBE_T_MASK		0xfff
>>>
>>> @@ -130,6 +131,11 @@ struct virtio_iommu_probe_resv_mem {
>>>  	uint64_t					end;
>>>  };
>>>
>>> +struct virtio_iommu_probe_pgsize_mask {
>>> +	struct virtio_iommu_probe_property      head;
>>> +	uint64_t				pgsize_bitmap;
>>> +};
>>> +
>>>  struct virtio_iommu_req_probe {
>>>  	struct virtio_iommu_req_head		head;
>>>  	uint32_t					endpoint;
>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c index
>>> 747e3cf1da..63fbacdcdc 100644
>>> --- a/hw/virtio/virtio-iommu.c
>>> +++ b/hw/virtio/virtio-iommu.c
>>> @@ -38,6 +38,10 @@
>>>
>>>  /* Max size */
>>>  #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>>> +#define VIOMMU_PROBE_SIZE 512
>>> +
>>> +#define SUPPORTED_PROBE_PROPERTIES (\
>>> +    1 << VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK)
>>>
>>>  typedef struct VirtIOIOMMUDomain {
>>>      uint32_t id;
>>> @@ -62,6 +66,13 @@ typedef struct VirtIOIOMMUMapping {
>>>      uint32_t flags;
>>>  } VirtIOIOMMUMapping;
>>>
>>> +typedef struct VirtIOIOMMUPropBuffer {
>>> +    VirtIOIOMMUEndpoint *endpoint;
>>> +    size_t filled;
>>> +    uint8_t *start;
>>> +    bool error;
>>> +} VirtIOIOMMUPropBuffer;
>>> +
>>>  static inline uint16_t virtio_iommu_get_bdf(IOMMUDevice *dev)  {
>>>      return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn); @@
>>> -490,6 +501,114 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>>>      return ret;
>>>  }
>>>
>>> +static int virtio_iommu_fill_none_prop(VirtIOIOMMUPropBuffer
>>> +*bufstate) {
>>> +    struct virtio_iommu_probe_property *prop;
>>> +
>>> +    prop = (struct virtio_iommu_probe_property *)
>>> +                (bufstate->start + bufstate->filled);
>>> +    prop->type = 0;
>>> +    prop->length = 0;
>>> +    bufstate->filled += sizeof(*prop);
>>> +    trace_virtio_iommu_fill_none_property(bufstate->endpoint->id);
>>> +    return 0;
>>> +}
>>> +
>>> +static int virtio_iommu_fill_page_size_mask(VirtIOIOMMUPropBuffer
>>> +*bufstate) {
>>> +    struct virtio_iommu_probe_pgsize_mask *page_size_mask;
>>> +    size_t prop_size = sizeof(*page_size_mask);
>>> +    VirtIOIOMMUEndpoint *ep = bufstate->endpoint;
>>> +    VirtIOIOMMU *s = ep->viommu;
>>> +    IOMMUDevice *sdev;
>>> +
>>> +    if (bufstate->filled + prop_size >= VIOMMU_PROBE_SIZE) {
>>> +        bufstate->error = true;
>>> +        /* get the traversal stopped by returning true */
>>> +        return true;
>>> +    }
>>> +
>>> +    page_size_mask = (struct virtio_iommu_probe_pgsize_mask *)
>>> +                     (bufstate->start + bufstate->filled);
>>> +
>>> +    page_size_mask->head.type = VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK;
>>> +    page_size_mask->head.length = prop_size;
>>> +    QLIST_FOREACH(sdev, &s->notifiers_list, next) {
>>> +        if (ep->id == sdev->devfn) {
>>> +            page_size_mask->pgsize_bitmap = sdev->page_size_mask;
>>> +	}
>>> +    }
>>> +    bufstate->filled += sizeof(*page_size_mask);
>>> +    trace_virtio_iommu_fill_pgsize_mask_property(bufstate->endpoint->id,
>>> +                                                 page_size_mask->pgsize_bitmap,
>>> +                                                 bufstate->filled);
>>> +    return false;
>>> +}
>>> +
>>> +/* Fill the properties[] buffer with properties of type @type */
>>> +static int virtio_iommu_fill_property(int type,
>>> +                                      VirtIOIOMMUPropBuffer
>>> +*bufstate) {
>>> +    int ret = -ENOSPC;
>>> +
>>> +    if (bufstate->filled + sizeof(struct virtio_iommu_probe_property)
>>> +            >= VIOMMU_PROBE_SIZE) {
>>> +        /* no space left for the header */
>>> +        bufstate->error = true;
>>> +        goto out;
>>> +    }
>>> +
>>> +    switch (type) {
>>> +    case VIRTIO_IOMMU_PROBE_T_NONE:
>>> +        ret = virtio_iommu_fill_none_prop(bufstate);
>>> +        break;
>>> +    case VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK:
>>> +    {
>>> +        ret = virtio_iommu_fill_page_size_mask(bufstate);
>> I don't think you want to fill the property of each EP. Only for those whose sdev-
>>> page_size_mask was properly set. For instance if you mix virtio and vfio devices,
>> virtio ones won't have this field set.
> 
> This something I am looking for clarification ( asked in spec document patch). Copy pasting same here:
> 
> What some clarification about two page-size-mask configurations available.
>  - Global configuration for page-size-mask
>  - per endpoint page-size-mask configuration
> 
> PAGE_SIZE_MASK probe for and endpoint can return zero or non-zero value.
> If it returns non-zero value than it will override the global configuration.
> If PAGE_SIZE_MASK probe for and endpoint return zero value than global page-size-mask configuration will be used.
Hum, that's not my current understanding. I understand it would also
override the global page size mask with 0. Hence my suggestion to *not*
return the property in that case.

Thanks

Eric
> 
> Is that correct?
> 
> Thanks
> -Bharat
> 
>>> +	break;
>>> +    }
>>> +    default:
>>> +        ret = -ENOENT;
>>> +        break;
>>> +    }
>>> +out:
>>> +    if (ret) {
>>> +        error_report("%s property of type=%d could not be filled (%d),"
>>> +                     " remaining size = 0x%lx",
>>> +                     __func__, type, ret, bufstate->filled);
>>> +    }
>>> +    return ret;
>>> +}
>>> +
>>> +/**
>>> + * virtio_iommu_probe - Fill the probe request buffer with all
>>> + * the properties the device is able to return and add a NONE
>>> + * property at the end. @buf points to properties[].
>>> + */
>>> +static int virtio_iommu_probe(VirtIOIOMMU *s,
>>> +                              struct virtio_iommu_req_probe *req,
>>> +                              uint8_t *buf) {
>>> +    uint32_t ep_id = le32_to_cpu(req->endpoint);
>>> +    VirtIOIOMMUEndpoint *ep = virtio_iommu_get_endpoint(s, ep_id);
>>> +    int16_t prop_types = SUPPORTED_PROBE_PROPERTIES, type;
>>> +    VirtIOIOMMUPropBuffer bufstate = {.start = buf, .filled = 0,
>>> +                                       .error = false, .endpoint =
>>> +ep};
>>> +
>>> +    while ((type = ctz32(prop_types)) != 32) {
>>> +        if (virtio_iommu_fill_property(type, &bufstate)) {
>>> +            goto failure;
>>> +        }
>>> +        prop_types &= ~(1 << type);
>>> +    }
>>> +    if (virtio_iommu_fill_property(VIRTIO_IOMMU_PROBE_T_NONE, &bufstate))
>> {
>>> +        goto failure;
>>> +    }
>>> +    return VIRTIO_IOMMU_S_OK;
>>> +failure:
>>> +    return VIRTIO_IOMMU_S_INVAL;
>>> +}
>>> +
>>>  static int virtio_iommu_iov_to_req(struct iovec *iov,
>>>                                     unsigned int iov_cnt,
>>>                                     void *req, size_t req_sz) @@
>>> -519,6 +638,17 @@ virtio_iommu_handle_req(detach)
>>>  virtio_iommu_handle_req(map)
>>>  virtio_iommu_handle_req(unmap)
>>>
>>> +static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
>>> +                                     struct iovec *iov,
>>> +                                     unsigned int iov_cnt,
>>> +                                     uint8_t *buf) {
>>> +    struct virtio_iommu_req_probe req;
>>> +    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req,
>>> +sizeof(req));
>>> +
>>> +    return ret ? ret : virtio_iommu_probe(s, &req, buf); }
>>> +
>>>  static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue
>>> *vq)  {
>>>      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev); @@ -564,17 +694,33 @@ static
>>> void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>>>          case VIRTIO_IOMMU_T_UNMAP:
>>>              tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
>>>              break;
>>> +        case VIRTIO_IOMMU_T_PROBE:
>>> +        {
>>> +            struct virtio_iommu_req_tail *ptail;
>>> +            uint8_t *buf = g_malloc0(s->config.probe_size +
>>> + sizeof(tail));
>>> +
>>> +            ptail = (struct virtio_iommu_req_tail *)
>>> +                        (buf + s->config.probe_size);
>>> +            ptail->status = virtio_iommu_handle_probe(s, iov,
>>> + iov_cnt, buf);
>>> +
>>> +            sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
>>> +                              buf, s->config.probe_size + sizeof(tail));
>>> +            g_free(buf);
>>> +            assert(sz == s->config.probe_size + sizeof(tail));
>>> +            goto push;
>>> +        }
>>>          default:
>>>              tail.status = VIRTIO_IOMMU_S_UNSUPP;
>>>          }
>>> -        qemu_mutex_unlock(&s->mutex);
>>>
>>>  out:
>>>          sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
>>>                            &tail, sizeof(tail));
>>>          assert(sz == sizeof(tail));
>>>
>>> -        virtqueue_push(vq, elem, sizeof(tail));
>>> +push:
>>> +        qemu_mutex_unlock(&s->mutex);
>>> +        virtqueue_push(vq, elem, sz);
>>>          virtio_notify(vdev, vq);
>>>          g_free(elem);
>>>      }
>>> @@ -634,16 +780,23 @@ static IOMMUTLBEntry
>> virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>>      VirtIOIOMMUEndpoint *ep;
>>>      uint32_t sid, flags;
>>>      bool bypass_allowed;
>>> +    hwaddr addr_mask;
>>>      bool found;
>>>
>>>      interval.low = addr;
>>>      interval.high = addr + 1;
>>>
>>> +    if (sdev->page_size_mask) {
>>> +        addr_mask = (1 << ctz32(sdev->page_size_mask)) - 1;
>>> +    } else {
>>> +        addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1;
>>> +    }
>> This change does not belong ot this patch. Rather belongs to
>> "virtio-iommu: set supported page size mask"
> 
> Thanks for pointing, will change.
> 
> Thanks
> -Bharat
> 
>>> +
>>>      IOMMUTLBEntry entry = {
>>>          .target_as = &address_space_memory,
>>>          .iova = addr,
>>>          .translated_addr = addr,
>>> -        .addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1,
>>> +        .addr_mask = addr_mask,
>>>          .perm = IOMMU_NONE,
>>>      };
>>>
>>> @@ -831,6 +984,7 @@ static void virtio_iommu_device_realize(DeviceState
>> *dev, Error **errp)
>>>      s->config.page_size_mask = TARGET_PAGE_MASK;
>>>      s->config.input_range.end = -1UL;
>>>      s->config.domain_range.end = 32;
>>> +    s->config.probe_size = VIOMMU_PROBE_SIZE;
>>>
>>>      virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
>>>      virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC); @@
>>> -840,6 +994,7 @@ static void virtio_iommu_device_realize(DeviceState *dev,
>> Error **errp)
>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
>>> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
>>>
>>>      qemu_mutex_init(&s->mutex);
>>>
>>> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events index
>>> 8bae651191..b0a6e4bda3 100644
>>> --- a/hw/virtio/trace-events
>>> +++ b/hw/virtio/trace-events
>>> @@ -76,3 +76,5 @@ virtio_iommu_report_fault(uint8_t reason, uint32_t
>>> flags, uint32_t endpoint, uin  virtio_iommu_notify_map(const char
>>> *name, uint64_t iova, uint64_t paddr, uint64_t map_size) "mr=%s
>>> iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64
>> virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_size)
>> "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64  virtio_iommu_remap(uint64_t iova,
>> uint64_t pa, uint64_t size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
>>> +virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
>>> +virtio_iommu_fill_pgsize_mask_property(uint32_t devid, uint64_t pgsize_mask,
>> size_t filled) "dev= %d, pgsize_mask=0x%"PRIx64" filled=0x%lx"
>>>
>> Thanks
>>
>> Eric
> 

