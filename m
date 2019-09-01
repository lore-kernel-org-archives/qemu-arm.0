Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2693493wrs;
        Sat, 31 Aug 2019 23:38:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3PzSGiVQ1svcsKkk+kyqc02DtwO8GdW+8ytdo3UW7oDPul/L5jmx5qcNm25uN3rKit2mQ
X-Received: by 2002:ac8:f33:: with SMTP id e48mr6785064qtk.123.1567319907523;
        Sat, 31 Aug 2019 23:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567319907; cv=none;
        d=google.com; s=arc-20160816;
        b=RCtJ24JQFU+1a4g0OzzBQ9k9Su1/wYBmpWo9OsL/xZxNDhJplI5qbQFsbCzXS/0CRv
         7GdBF0DsOT4xkffDdjstvnCiTtVlbWmzS45ozEoogAJYbo/VAapTYqjaeea+CDR2YvxX
         6JclDDMYyMclBmzNK5pJbE7WbeRdkABj9SsPt0xh45wDvOOgAU1iUm3Ci65QGkIOiKcY
         22sYvrmLFKW268Il49Xp9Gh6BagRAMaFG9v3TVEtBrDOJTQ3CWJWB5Lms5Nhl6XK1kcY
         Cc1IOA9ITN3s6jr4F+JXos0ZyqZ+CULbFmOd0AQ3KTnWABr88qdWKLEPGZ1AiQFAw6Af
         wfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=rq0DpYBJB8j8ZbzZncVpaa9gLbGM3m9PJgoZO2coneQ=;
        b=go8R4uLg9ds6v04JEXtGGJ5WBHCpUDACxpxnC0/9wnHb695GQpddZ051Sbwys2PKjn
         huGWBrycjVTFW5baIIHGWwcSTLfu0Zo/eBasUDPd30AGcWfKVugGel6oJUJyGghbkTCr
         IoECWENRBShJeP3F75UHTIOoQBflTKwVQaOgPFlomuj7aEkd5aX1lsgJOP+3CjKfX8/Z
         DidlVAjdxkrNObjoDeDxlTPQFvI7i6+A55sYZkFCmqa19BakM8diOtn15g6dXJPlC+MD
         w0T6HOFNPMAc36dTjIuO4aln/Xl/9ejSJ7MPJZcmHZJ9LfQKtlq9yhu1iJMrgRNq7O7B
         zHfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x28si7676985qtk.81.2019.08.31.23.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Aug 2019 23:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i4JVK-0002Bm-KA
	for alex.bennee@linaro.org; Sun, 01 Sep 2019 02:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1i4JV7-00028D-Fw
 for qemu-arm@nongnu.org; Sun, 01 Sep 2019 02:38:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1i4JV5-0000NQ-FX
 for qemu-arm@nongnu.org; Sun, 01 Sep 2019 02:38:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57952)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1i4JV5-0000LA-8d
 for qemu-arm@nongnu.org; Sun, 01 Sep 2019 02:38:11 -0400
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DE85B8553B
 for <qemu-arm@nongnu.org>; Sun,  1 Sep 2019 06:38:08 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id z2so12303034qkf.2
 for <qemu-arm@nongnu.org>; Sat, 31 Aug 2019 23:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rq0DpYBJB8j8ZbzZncVpaa9gLbGM3m9PJgoZO2coneQ=;
 b=k+x4F7loJPjbldJ3htm5KueKrdekiaJUU+Dxfhp8wwT110unbIBhOWdR+hQo0mbSm4
 pHm9dekOyAl70Na1H4pwXHDY/ewYtsoahtCrbheGrmS2li10YrPaAvQn7bCkVggHi0IS
 9v04lO2V11NWxFIPn2j03gpmLZJsu141Mlv8Sld/oMgKuYmpC8z2xtyvklGIEo351e14
 ltTlrtVRMPE1lzvvLyTU9aNG9HNcTh53pClqxIOPqGyrdHoiCPrYny1Y2tisXMGc5o68
 8wIXpT2cUDZdFwqWE2Pm5Ipw9c7IvZtVhsnArkoa0sKIRWdgKroIkjo2ThcPG1aICw+K
 WQkQ==
X-Gm-Message-State: APjAAAVlRXav+3ZG+g7dErNDvVmeOX68tqQnFkW7tFHE81bqqaG3UNiq
 hInPtZnHh5ydcGe9adA9ZlyNcI86p4IPk7vCKaNstrjx2b92QDRsEk7T/nX90BFi04P9EWGerqv
 VMNYufuVg3Uzv
X-Received: by 2002:a0c:d959:: with SMTP id t25mr933918qvj.19.1567319888212;
 Sat, 31 Aug 2019 23:38:08 -0700 (PDT)
X-Received: by 2002:a0c:d959:: with SMTP id t25mr933907qvj.19.1567319888009;
 Sat, 31 Aug 2019 23:38:08 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
 by smtp.gmail.com with ESMTPSA id h1sm6329583qtc.92.2019.08.31.23.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2019 23:38:07 -0700 (PDT)
Date: Sun, 1 Sep 2019 02:38:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190901023751-mutt-send-email-mst@kernel.org>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-14-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730172137.23114-14-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 13/15] virtio_iommu: Handle
 reserved regions in translation process
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
X-TUID: CzSoPdjU84wO

On Tue, Jul 30, 2019 at 07:21:35PM +0200, Eric Auger wrote:
> When translating an address we need to check if it belongs to
> a reserved virtual address range. If it does, there are 2 cases:
> 
> - it belongs to a RESERVED region: the guest should neither use
>   this address in a MAP not instruct the end-point to DMA on
>   them. We report an error
> 
> - It belongs to an MSI region: we bypass the translation.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

something wrong with the subject here.

> ---
> 
> v9 -> v10:
> - in case of MSI region, we immediatly return
> ---
>  hw/virtio/virtio-iommu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 8e54a17227..20d92b7ab0 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -711,6 +711,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      viommu_interval interval;
>      bool bypass_allowed;
>      bool read_fault, write_fault;
> +    struct virtio_iommu_probe_resv_mem *reg;
>  
>      interval.low = addr;
>      interval.high = addr + 1;
> @@ -743,6 +744,21 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          goto unlock;
>      }
>  
> +    reg = g_tree_lookup(ep->reserved_regions, (gpointer)(&interval));
> +    if (reg) {
> +        switch (reg->subtype) {
> +        case VIRTIO_IOMMU_RESV_MEM_T_MSI:
> +            entry.perm = flag;
> +            return entry;
> +        case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:
> +        default:
> +            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
> +                                      0, sid, addr);
> +            break;
> +        }
> +        goto unlock;
> +    }
> +
>      if (!ep->domain) {
>          if (!bypass_allowed) {
>              qemu_log_mask(LOG_GUEST_ERROR,
> -- 
> 2.20.1
