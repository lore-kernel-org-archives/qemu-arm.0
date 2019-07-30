Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4742191wrv;
        Tue, 30 Jul 2019 12:38:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMh0YqsB3dFHM+RznfvbflvpZ+8a5qHsK22iMiLoe8eW/JwIjnemggRt017LwjGN9663l4
X-Received: by 2002:aa7:d909:: with SMTP id a9mr70092743edr.261.1564515509319;
        Tue, 30 Jul 2019 12:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564515509; cv=none;
        d=google.com; s=arc-20160816;
        b=b/Z8cGo0hgGV2WX6UPOyHMV+RICb5SxNNLQoEvURzcb/m9Np/CjgTvhxBRuZW6TjuV
         wD3DHFac6wjpqUHNalbHLVOj8OkSEZcq0hCc2Y3GDBd294uvZmU24tlPST74yOehpH+w
         3Ec9D67fm1twr6bC3yjKi+HLaqbkyPc4GlyC1NNsJvYGiutKpXxeMNB0+fHsa0CY08OK
         sttVJvXOD+YEmOIQzSUJcQ1z0xWkIoyQqlC72ub4lEtbthIgCNKMdSCSY88lD18/eFbu
         PWnUvc8g4DdAf4Zg0vRd360r3nabpCJxP6SftvPHckk3Rm95Qzhw1KgW+KtDLQdh7iJt
         JSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=BP/+nchjcS9kgbL7AsGw6LF48Cq7HEI9ZF+ZuhTotUI=;
        b=cTmISHbO4KLJZPkp8yl86mGJArCWVofUCL2/AaV5flAiOtEbXk8TPCeDiT4LRZFFR+
         FHReJQshdnPGWnTCzcQpa6gwbfmSmIDxLCeYtQp7jE3Wl+nKsuiNPb8WgQjkWcm4sz+l
         OsO0f7kFdH5xdY9Z4SR9h9dC0PxCJq1SgREYZfY5j/uqA33G1WT03FMh5dIF6uOrqh+c
         W+2vqo8kzDPItogYiju5i3/CXw0UC7UeyIBr9Vis7BxKS16QNYDvs6LefKv20aa3CGAv
         Boj8F/FAv50w462i8eNGD/CGObOu3BGbTce9nIBmxbKVUOIsFyluQ4hQbFfhbXsPyh41
         ZvSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x54si20173650edd.148.2019.07.30.12.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 12:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsXx6-0003mz-FT
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 15:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58495)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hsXwu-0003mm-Hy
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 15:38:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hsXwt-0000Sb-F1
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 15:38:16 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44388)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hsXwt-0000SR-AI
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 15:38:15 -0400
Received: by mail-vs1-f67.google.com with SMTP id v129so44415357vsb.11
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2019 12:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BP/+nchjcS9kgbL7AsGw6LF48Cq7HEI9ZF+ZuhTotUI=;
 b=Y/4aWqWX2F+EtcuXACDoAy6Lu+3r40aQQj5NYfDRzCXyK9PYXWTRO+azLWk7jxLs/d
 m5wBZbmJhJgeZ6IkhyO9zzL3Qize2/g8mt7XHb7IXUvdyETBwRLADcr4wl4Jx4NQyACe
 8nAEzXwXYGtI2fM1McXhm20BuVlIAh0/tF5Oc1Miqo6Vuxr+O5h46XKoV1RvtKls/yj7
 0aoct6yJGV72MBbyOL7KzN16uWcpOf8rfOvulWKpW4Re7J24BFHlMdCGD16zZnzjvtWl
 2sXlFjujEgv0e3To3v0Lme+AmRFb7M8Hi3f8o9nqhNp1xr5lpCj6k3OYaU8j7zBHaPbf
 GZ0Q==
X-Gm-Message-State: APjAAAV8UthXdQs0Rt2O0w0AeNYsJO86zy/5Dbg/zOckSO2fAZOBEio8
 EP7gDmVXUpS2mOIGtbC/iluhdg==
X-Received: by 2002:a67:f1d6:: with SMTP id v22mr72542410vsm.178.1564515494816; 
 Tue, 30 Jul 2019 12:38:14 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
 by smtp.gmail.com with ESMTPSA id
 d67sm19327804vkd.25.2019.07.30.12.38.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 12:38:14 -0700 (PDT)
Date: Tue, 30 Jul 2019 15:38:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190730153628-mutt-send-email-mst@kernel.org>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-12-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730172137.23114-12-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.217.67
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 11/15] virtio-iommu: Expose the
 IOAPIC MSI reserved region when relevant
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
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, peter.maydell@linaro.org,
 tn@semihalf.com, qemu-devel@nongnu.org, peterx@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SxUXWa7F3nZz

On Tue, Jul 30, 2019 at 07:21:33PM +0200, Eric Auger wrote:
> We introduce a new msi_bypass field which indicates whether
> the IOAPIC MSI window [0xFEE00000 - 0xFEEFFFFF] must be exposed
> as a reserved region. By default the field is set to true at
> instantiation time. Later on we will introduce a property at
> virtio pci proxy level to turn it off.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v8 -> v9:
> - pass IOAPIC_RANGE_END to virtio_iommu_register_resv_region
> - take into account the change in the struct virtio_iommu_probe_resv_mem
>   definition
> - We just introduce the field here. A property will be introduced later on
>   at pci proxy level.
> ---
>  hw/virtio/virtio-iommu.c         | 36 ++++++++++++++++++++++++++++++++
>  include/hw/virtio/virtio-iommu.h |  1 +
>  2 files changed, 37 insertions(+)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 66be9a4627..74038288b0 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -39,6 +39,9 @@
>  #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>  #define VIOMMU_PROBE_SIZE 512
>  
> +#define IOAPIC_RANGE_START      (0xfee00000)
> +#define IOAPIC_RANGE_END        (0xfeefffff)
> +
>  #define SUPPORTED_PROBE_PROPERTIES (\
>      1 << VIRTIO_IOMMU_PROBE_T_RESV_MEM)
>  

Sorry where are these numbers coming from?
Does this really work on all platforms?
With all guests?

> @@ -100,6 +103,30 @@ static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
>      ep->domain = NULL;
>  }
>  
> +static void virtio_iommu_register_resv_region(viommu_endpoint *ep,
> +                                              uint8_t subtype,
> +                                              uint64_t start, uint64_t end)
> +{
> +    viommu_interval *interval;
> +    struct virtio_iommu_probe_resv_mem *resv_reg_prop;
> +    size_t prop_size = sizeof(struct virtio_iommu_probe_resv_mem);
> +    size_t value_size = prop_size -
> +                sizeof(struct virtio_iommu_probe_property);
> +
> +    interval = g_malloc0(sizeof(*interval));
> +    interval->low = start;
> +    interval->high = end;
> +
> +    resv_reg_prop = g_malloc0(prop_size);
> +    resv_reg_prop->head.type = VIRTIO_IOMMU_PROBE_T_RESV_MEM;
> +    resv_reg_prop->head.length = cpu_to_le64(value_size);
> +    resv_reg_prop->subtype = cpu_to_le64(subtype);
> +    resv_reg_prop->start = cpu_to_le64(start);
> +    resv_reg_prop->end = cpu_to_le64(end);
> +
> +    g_tree_insert(ep->reserved_regions, interval, resv_reg_prop);
> +}
> +
>  static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
>                                                    uint32_t ep_id)
>  {
> @@ -117,6 +144,12 @@ static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
>      ep->reserved_regions = g_tree_new_full((GCompareDataFunc)interval_cmp,
>                                              NULL, (GDestroyNotify)g_free,
>                                              (GDestroyNotify)g_free);
> +    if (s->msi_bypass) {
> +        virtio_iommu_register_resv_region(ep, VIRTIO_IOMMU_RESV_MEM_T_MSI,
> +                                          IOAPIC_RANGE_START,
> +                                          IOAPIC_RANGE_END);
> +    }
> +
>      return ep;
>  }
>  
> @@ -822,6 +855,9 @@ static void virtio_iommu_set_status(VirtIODevice *vdev, uint8_t status)
>  
>  static void virtio_iommu_instance_init(Object *obj)
>  {
> +    VirtIOIOMMU *s = VIRTIO_IOMMU(obj);
> +
> +    s->msi_bypass = true;
>  }
>  
>  static const VMStateDescription vmstate_virtio_iommu = {
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index f55f48d304..56c8b4e57f 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -59,6 +59,7 @@ typedef struct VirtIOIOMMU {
>      GTree *domains;
>      QemuMutex mutex;
>      GTree *endpoints;
> +    bool msi_bypass;
>  } VirtIOIOMMU;
>  
>  #endif
> -- 
> 2.20.1
