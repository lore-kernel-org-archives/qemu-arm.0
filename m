Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3366634ejc;
        Fri, 29 Sep 2023 09:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6xg/+Xga9vvMQ3IfYyIqTkOkLYTMk9FS4FSHY4/HWQKufYxbr6D0GSAY268ythE1h+1El
X-Received: by 2002:a9d:6a03:0:b0:6bf:2476:a97e with SMTP id g3-20020a9d6a03000000b006bf2476a97emr5054131otn.5.1696004193795;
        Fri, 29 Sep 2023 09:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696004193; cv=none;
        d=google.com; s=arc-20160816;
        b=YX9yLElZcnJ4aH17pPGHp1zfXPzV8aT8sEkpcs6rWyX+EwGFmOULJjZ6kYspewalfR
         Lc3+sZsTrRangNpdnu06teElSp0yrjnrt4ruZdaLBt9teSkd7QdcAtSN14XXbqeVYXgo
         mETWA4/d2VV66jfpp4A6As6u1Z6UvVlztFCbj7Ji9JVMfioVVKvyOFQQ4yHJWJbdAAM8
         M/4QLy7MWG2NltshGqwfxBToBKyN2AxW0SPHlfZSm+rJz1/vxUNblaPzfUMy19Qhy2aY
         CqL2AvTa028E2Jk0JF+OBya1LUY1GB6dYT9o2khf+3DsparAG2fWk6Bm9MNp7r5Y72gu
         VB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=XmjgxynS7T2huqwYRCz4Z4N+aHQaM/GLyfynKvGw/lc=;
        fh=bFpS87vmp7mzhl4ICK4mDM62TwFUbgTYVuM7QVH8Hes=;
        b=PV3uokKdWyj7XsENX2Iw27vOdQlL0A1yCQAtGR6JSurJnUij4OLcWwSaax4E9BmdPd
         7KS7Da57fM+5kRKGZAK6h+NuQmmLZfGsCp39GQEfNo+ncQRpnMLanJzneGQKzwwaBt5r
         w2jg1ZGB7sTqQdkNrNK9aTeqx2V8aTO7WHSrfhXaWYDFgbmGYNlciZVYgVrbFVGbE1Uy
         gH4rKcRfm7Aapopv/4YANuIJNngAjVCjLhv3CSHVGyzJX8oBWNPoMbUmdIGCcSBI30wl
         ZpDCmcaR2Lcm8GyGaC8rFQ002d8zgYiX/wXnkv4Au68U8pCPlf408CuvZ8kwviL8amw1
         EWlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWWaYnTb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020a0ce0c9000000b0064df3c750b2si2520495qvk.335.2023.09.29.09.16.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Sep 2023 09:16:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWWaYnTb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qmG9k-0002IM-Ie; Fri, 29 Sep 2023 12:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qmG9f-0002Bl-HT
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 12:15:55 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qmG9b-00068L-Ru
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 12:15:50 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40652e570d9so19402785e9.1
 for <qemu-arm@nongnu.org>; Fri, 29 Sep 2023 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696004143; x=1696608943; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XmjgxynS7T2huqwYRCz4Z4N+aHQaM/GLyfynKvGw/lc=;
 b=uWWaYnTbLA3yZNej1pqHX66LR0BH5Ty42UPqHXrogjS5qc4XxS6BXm/whlsizx6RMf
 IVzWbyBtligB/tDuG/KEQIatV28dPr8RnS0FEmLCnqptfMsXwSQleL8Xjic6jXNwc74h
 9FSh6Qbaa4Cxpz5yzFxcPpdV2SFzSn8NcJHmytfPAOOy/sZj4IUtfEyDZRsGg+Vq/UNu
 YRbuDhqXCDvixvyz2yiL5PHWBPC4eq+j364z2CvEJJwfc6iu1gIXITq7e4WcYEGhdJgw
 M7ZbQKdR/G7zrp3jLYpbTY1a8022PgM/ewaejvcSipkBTUFZ+hmIohnlunpcrH29kJMD
 QE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696004143; x=1696608943;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XmjgxynS7T2huqwYRCz4Z4N+aHQaM/GLyfynKvGw/lc=;
 b=kgYIr2dYf3vP7iIqYkItw0d0ZDUXSiZaFi/a9WQ2k9dnYytObIuDjhCqATXJMOSZOt
 QOUeAqDq1fcMG2APoWsMBJFwAosRkmROXFniSaocuJKA6dyq4dyQ5IYJzu1oRQybvGWU
 eIhNugyyIbegPw8/1EERLvR0E+pFTbgBPjW3NN3g6hO1VEsEiDvotCvZ7jEq4rtdpRL8
 Qk/QycatGTuT35qd5W4LmuPUL8TWBkB9AmEPHrTXbKr/IbVpEZlQGxMe+aucc8r5JfhK
 QxHkiKWvAXzOilsoj5VqFKlERXOjdO9QlaM4j0alcG/khZKIEE8nvOL5p/3vj6dSqYkL
 Frsg==
X-Gm-Message-State: AOJu0YyY6RoBeC4KLgmVJd3f7eAYMRBu3i0DI9IWItHAcy6u1JwuZJNp
 /u2ghojTvhYfufBqcz4H9VWxfg==
X-Received: by 2002:a05:600c:3b0e:b0:406:53ab:a9af with SMTP id
 m14-20020a05600c3b0e00b0040653aba9afmr4128189wms.10.1696004143361; 
 Fri, 29 Sep 2023 09:15:43 -0700 (PDT)
Received: from myrica ([2a02:c7c:7290:b00:fd32:2b31:6755:400c])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b004065d67c3c9sm1666582wmq.8.2023.09.29.09.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 09:15:42 -0700 (PDT)
Date: Fri, 29 Sep 2023 17:15:47 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, clg@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v2 07/12] virtio-iommu: Implement set_iova_ranges()
 callback
Message-ID: <20230929161547.GB2957297@myrica>
References: <20230913080423.523953-1-eric.auger@redhat.com>
 <20230913080423.523953-8-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913080423.523953-8-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wLtubzMauAEQ

On Wed, Sep 13, 2023 at 10:01:42AM +0200, Eric Auger wrote:
> The implementation populates the array of per IOMMUDevice
> host reserved regions.
> 
> It is forbidden to have conflicting sets of host IOVA ranges
> to be applied onto the same IOMMU MR (implied by different
> host devices).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - Forbid conflicting sets of host resv regions
> ---
>  include/hw/virtio/virtio-iommu.h |  2 ++
>  hw/virtio/virtio-iommu.c         | 48 ++++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 70b8ace34d..31b69c8261 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -40,6 +40,8 @@ typedef struct IOMMUDevice {
>      MemoryRegion root;          /* The root container of the device */
>      MemoryRegion bypass_mr;     /* The alias of shared memory MR */
>      GList *resv_regions;
> +    Range *host_resv_regions;
> +    uint32_t nr_host_resv_regions;
>  } IOMMUDevice;
>  
>  typedef struct IOMMUPciBus {
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index ea359b586a..ed2df5116f 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -20,6 +20,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu/iov.h"
> +#include "qemu/range.h"
>  #include "exec/target_page.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/virtio/virtio.h"
> @@ -1158,6 +1159,52 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>      return 0;
>  }
>  
> +static int virtio_iommu_set_iova_ranges(IOMMUMemoryRegion *mr,
> +                                        uint32_t nr_ranges,
> +                                        struct Range *iova_ranges,
> +                                        Error **errp)
> +{
> +    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
> +    uint32_t nr_host_resv_regions;
> +    Range *host_resv_regions;
> +    int ret = -EINVAL;
> +
> +    if (!nr_ranges) {
> +        return 0;
> +    }
> +
> +    if (sdev->host_resv_regions) {
> +        range_inverse_array(nr_ranges, iova_ranges,
> +                            &nr_host_resv_regions, &host_resv_regions,
> +                            0, UINT64_MAX);
> +        if (nr_host_resv_regions != sdev->nr_host_resv_regions) {
> +            goto error;
> +        }
> +        for (int i = 0; i < nr_host_resv_regions; i++) {
> +            Range *new = &host_resv_regions[i];
> +            Range *existing = &sdev->host_resv_regions[i];
> +
> +            if (!range_contains_range(existing, new)) {
> +                goto error;
> +            }
> +        }
> +        ret = 0;
> +        goto out;
> +    }
> +
> +    range_inverse_array(nr_ranges, iova_ranges,
> +                        &sdev->nr_host_resv_regions, &sdev->host_resv_regions,
> +                        0, UINT64_MAX);

Can set_iova_ranges() only be called for the first time before the guest
has had a chance to issue a probe request?  Maybe we could add a
sanity-check that the guest hasn't issued a probe request yet, since we
can't notify about updated reserved regions.

I'm probably misremembering because I thought Linux set up IOMMU contexts
(including probe requests) before enabling DMA master in PCI which cause
QEMU VFIO to issue these calls. I'll double check.

Thanks,
Jean

> +
> +    return 0;
> +error:
> +    error_setg(errp, "IOMMU mr=%s Conflicting host reserved regions set!",
> +               mr->parent_obj.name);
> +out:
> +    g_free(host_resv_regions);
> +    return ret;
> +}
> +
>  static void virtio_iommu_system_reset(void *opaque)
>  {
>      VirtIOIOMMU *s = opaque;
> @@ -1453,6 +1500,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
>      imrc->replay = virtio_iommu_replay;
>      imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
>      imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
> +    imrc->iommu_set_iova_ranges = virtio_iommu_set_iova_ranges;
>  }
>  
>  static const TypeInfo virtio_iommu_info = {
> -- 
> 2.41.0
> 
