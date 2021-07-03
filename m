Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp2364705lfi;
        Sat, 3 Jul 2021 09:31:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw27tSYHC78qBPL2v2TCukTAyTDUppBMIZ8O3BpcZ0wCQUFrTNAdE9PQhpxFu8MItGzmKSs
X-Received: by 2002:ab0:4597:: with SMTP id u23mr2368491uau.32.1625329917987;
        Sat, 03 Jul 2021 09:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625329917; cv=none;
        d=google.com; s=arc-20160816;
        b=j2R4A71pkUpDSDPggdLQdpZ4FpbngLJjgxl0l0JllPVgnXjNQCpKe1W8NOJKuxfzA2
         8RtE5wizNLoT8j82ZlNXN1HXX3R9+Xp41xVHL3uBLInp9Yk1Gsd8oXzKuOAIGkIwosqv
         W4/v1mRkxdA7dWzTPnfIV7LWEaKM791J1s4qaFqbvTODsQszbC3zDoT10UM0y27RxlP1
         ddsd3sqD8YtibYkj/w/QirJRlsPssvK5fJNL4GEZcUrbpWiLXf07sECjMS3RgYaDRGjb
         4OQCOJc/TxE3epZ+BmemWGlXpANerXtWy0/q9VYAag27t4Sg8xweZQZHe6IeirG4yv/z
         QeDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=aslCUlFMZs5lt4Gh9ItxHs0sfysX0g8iXM6xPa9MnrA=;
        b=yEOtHxYychZcOOCPGL5eukyNuIv+1k37cfZpSa4EeQrJi9vaOncZb0VnCJenhKaED+
         ztNiQQ74LdoSir5NNRhj0S25gJQOsBIeBvX0hU1zOftCg4rEAfZ6hvwO7BCUQ8ldgr+j
         EXSQoftvNi+eGxHcf3MhwTsOFMk4hJXu9YA6CWL1gptIMuljyc+ngFpN5hgZbyJxUgBL
         UwDav3SeGPUoVvLySb0T6wCMjzMrYrpD1Jd5dFWalWDYgRPw5+l3HamLaFaF3FuIOkDu
         vDj0QtrwXvzK/BToyZkPpdhsArE9frGWnujfC6FWIJE6smHWRQxBJcrEcPVOa7n38M9q
         NmAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZjbST/LJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u23si5833987vsp.359.2021.07.03.09.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jul 2021 09:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZjbST/LJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lziYf-0004bb-97
	for alex.bennee@linaro.org; Sat, 03 Jul 2021 12:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lziYS-0004bI-5W
 for qemu-arm@nongnu.org; Sat, 03 Jul 2021 12:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lziYP-0002M1-6a
 for qemu-arm@nongnu.org; Sat, 03 Jul 2021 12:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625329900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aslCUlFMZs5lt4Gh9ItxHs0sfysX0g8iXM6xPa9MnrA=;
 b=ZjbST/LJ9eULPJPevB3EGKtSS2r9NhQ60u3FMoOcK3I/hyn1l8lv3lQNVA4/ZOAGoOSFhy
 GnMKhs/L3tklfy41ateyTWuZYdgc3KwRq7vnTBXz4cEu4wJKMcLWUMJ/wijL+4VkcAnaGZ
 WvOZQkNIQl7NTz4Ai/d/OYOuGlPDLro=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297--oSek03SMVGQcaSSJPEkWQ-1; Sat, 03 Jul 2021 12:31:37 -0400
X-MC-Unique: -oSek03SMVGQcaSSJPEkWQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 bz12-20020a1709070aacb02904cae86564c7so4302238ejc.6
 for <qemu-arm@nongnu.org>; Sat, 03 Jul 2021 09:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aslCUlFMZs5lt4Gh9ItxHs0sfysX0g8iXM6xPa9MnrA=;
 b=WK3cxTDY/jv5hcDPc+Hw5NMc9hmKVZyzJGgSQDZnzpQlDbiiqFBQf2VJKfaaxfSfaA
 IT9tkbjg5ac57i5CGUBzuqbs6N4u3DPgQhlc+f2TCjHl5XpNWqvgLKM/aQ8jGPLhI8Ny
 52sAlpDf9khQWlew++iafCxKCPNeq++ScSf0Sm65HzHcHFg2ZbDGgyGPoXYYsSXgQWML
 tN8MNyrzMjyQ9XoE+l0KC+PPSpepi+L+4sA1rVn6q0MxTiXitZdIUcOSo7nAw64A9x15
 WdmUFP/fBYwDUK9Yh6qc5oo9Xez5Q0HKduZ3OWNzuHELnqxqdlyBMCWDKc/ntx8wTd1H
 Styw==
X-Gm-Message-State: AOAM5320K4TmtOFbCCfnjhu7fuckRCawfhAZidTdrhHZ39LknlDVCK96
 AM2UZTNHVkpDHtBGrNu59d8fgKYXjNAbVEo2fQ2knKEim0X9dOHWnkAfbMVhsYewfXXdCSfltIw
 upUHTu6ZVJp1q
X-Received: by 2002:a50:f0ce:: with SMTP id a14mr5389703edm.176.1625329895852; 
 Sat, 03 Jul 2021 09:31:35 -0700 (PDT)
X-Received: by 2002:a50:f0ce:: with SMTP id a14mr5389686edm.176.1625329895571; 
 Sat, 03 Jul 2021 09:31:35 -0700 (PDT)
Received: from redhat.com ([77.126.110.253])
 by smtp.gmail.com with ESMTPSA id b15sm2275530eja.82.2021.07.03.09.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 09:31:34 -0700 (PDT)
Date: Sat, 3 Jul 2021 12:31:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v7 2/5] virtio-iommu: Implement RESV_MEM probe request
Message-ID: <20210703123113-mutt-send-email-mst@kernel.org>
References: <20200629070404.10969-1-eric.auger@redhat.com>
 <20200629070404.10969-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200629070404.10969-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QE6VSfaLcXmI

On Mon, Jun 29, 2020 at 09:04:01AM +0200, Eric Auger wrote:
> This patch implements the PROBE request. At the moment,
> only THE RESV_MEM property is handled. The first goal is
> to report iommu wide reserved regions such as the MSI regions
> set by the machine code. On x86 this will be the IOAPIC MSI
> region, [0xFEE00000 - 0xFEEFFFFF], on ARM this may be the ITS
> doorbell.
> 
> In the future we may introduce per device reserved regions.
> This will be useful when protecting host assigned devices
> which may expose their own reserved regions
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> ---
> 
> v6 -> v7:
> - put the assert again to make it clear there is no risk
>   of truncation
> 
> v5 -> v6:
> - removed validation of s->reserved_regions[i].type in the
>   probe request as it should rather happen in the realize()
> 
> v4 -> v5:
> - assert if reserved region type is different from RESERVED or
>   MSI
> 
> v3 -> v4:
> - removed any reference to the NONE property that does not
>   exist anymore.
> 
> v2 -> v3:
> - on probe, do not fill the reminder of the buffer with zeroes
>   as the buffer was already zero initialized (Bharat)
> 
> v1 -> v2:
> - move the unlock back to the same place
> - remove the push label and factorize the code after the out label
> - fix a bunch of cpu_to_leX according to the latest spec revision
> - do not remove sizeof(last) from free space
> - check the ep exists
> ---
>  include/hw/virtio/virtio-iommu.h |  2 +
>  hw/virtio/virtio-iommu.c         | 94 ++++++++++++++++++++++++++++++--
>  hw/virtio/trace-events           |  1 +
>  3 files changed, 93 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index e653004d7c..49eb105cd8 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -53,6 +53,8 @@ typedef struct VirtIOIOMMU {
>      GHashTable *as_by_busptr;
>      IOMMUPciBus *iommu_pcibus_by_bus_num[PCI_BUS_MAX];
>      PCIBus *primary_bus;
> +    ReservedRegion *reserved_regions;
> +    uint32_t nb_reserved_regions;
>      GTree *domains;
>      QemuMutex mutex;
>      GTree *endpoints;
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 483883ec1d..2cdaa1969b 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -38,6 +38,7 @@
>  
>  /* Max size */
>  #define VIOMMU_DEFAULT_QUEUE_SIZE 256
> +#define VIOMMU_PROBE_SIZE 512
>  
>  typedef struct VirtIOIOMMUDomain {
>      uint32_t id;
> @@ -378,6 +379,65 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>      return ret;
>  }
>  
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
> +        unsigned subtype = s->reserved_regions[i].type;
> +
> +        assert(subtype == VIRTIO_IOMMU_RESV_MEM_T_RESERVED ||
> +               subtype == VIRTIO_IOMMU_RESV_MEM_T_MSI);
> +        prop.head.type = cpu_to_le16(VIRTIO_IOMMU_PROBE_T_RESV_MEM);
> +        prop.head.length = cpu_to_le16(length);
> +        prop.subtype = subtype;
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
> + * the properties the device is able to return
> + */
> +static int virtio_iommu_probe(VirtIOIOMMU *s,
> +                              struct virtio_iommu_req_probe *req,
> +                              uint8_t *buf)
> +{
> +    uint32_t ep_id = le32_to_cpu(req->endpoint);
> +    size_t free = VIOMMU_PROBE_SIZE;
> +    ssize_t count;
> +
> +    if (!virtio_iommu_mr(s, ep_id)) {
> +        return VIRTIO_IOMMU_S_NOENT;
> +    }
> +
> +    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, free);
> +    if (count < 0) {
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
> +    buf += count;
> +    free -= count;
> +
> +    return VIRTIO_IOMMU_S_OK;
> +}
> +
>  static int virtio_iommu_iov_to_req(struct iovec *iov,
>                                     unsigned int iov_cnt,
>                                     void *req, size_t req_sz)
> @@ -407,15 +467,27 @@ virtio_iommu_handle_req(detach)
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
>      struct virtio_iommu_req_head head;
>      struct virtio_iommu_req_tail tail = {};
> +    size_t output_size = sizeof(tail), sz;
>      VirtQueueElement *elem;
>      unsigned int iov_cnt;
>      struct iovec *iov;
> -    size_t sz;
> +    void *buf = NULL;
>  
>      for (;;) {
>          elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
> @@ -452,6 +524,17 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>          case VIRTIO_IOMMU_T_UNMAP:
>              tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
>              break;
> +        case VIRTIO_IOMMU_T_PROBE:
> +        {
> +            struct virtio_iommu_req_tail *ptail;
> +
> +            output_size = s->config.probe_size + sizeof(tail);
> +            buf = g_malloc0(output_size);
> +
> +            ptail = (struct virtio_iommu_req_tail *)
> +                        (buf + s->config.probe_size);
> +            ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
> +        }
>          default:
>              tail.status = VIRTIO_IOMMU_S_UNSUPP;
>          }
> @@ -459,12 +542,13 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>  
>  out:
>          sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
> -                          &tail, sizeof(tail));
> -        assert(sz == sizeof(tail));
> +                          buf ? buf : &tail, output_size);
> +        assert(sz == output_size);
>  
> -        virtqueue_push(vq, elem, sizeof(tail));
> +        virtqueue_push(vq, elem, sz);
>          virtio_notify(vdev, vq);
>          g_free(elem);
> +        g_free(buf);
>      }
>  }
>  
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

Don't we need to disable this for existing machine types?

  
>      qemu_mutex_init(&s->mutex);
>  
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 6427a0047d..23109f69bb 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -74,3 +74,4 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
>  virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
>  virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
>  virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
> +virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t start, uint64_t end) "dev= %d, type=%d start=0x%"PRIx64" end=0x%"PRIx64
> -- 
> 2.20.1

