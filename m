Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6045985lff;
        Tue, 10 Dec 2019 08:32:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqzCEGqUVYmPJSsspACyV6Ezvowsieg4218oaCgWHYzmi7j+SbZuXNKaeGUng9ZB/bplKfrP
X-Received: by 2002:a0c:e14f:: with SMTP id c15mr28541050qvl.169.1575995537420;
        Tue, 10 Dec 2019 08:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575995537; cv=none;
        d=google.com; s=arc-20160816;
        b=cDgQwq3EE+aERMBLT2ZoRalthOy41IAuWCzhVlinBYbSDNv7JGKjf2Z2XwSj5AKf77
         tMkuCg5EFGKWTtbX8LHV//Sr/MCsoTpMTp4TFen2/6BSXE1hola0GOdrG8gOAAmQGRSE
         pJS+4snalPvmcy4Pw75LMHVXnyILNCdpT+4PIO1CAqlSx6ONzL5F50vdrOimXGoiPvVG
         2sL+JhyWQbjszIzJH4wQU0YQmpv+JZng1JR1kG6678SMhlAQ9Y/EfQ/gKviY41Rwhnh7
         JTrRIRBBJmzNyJZ5s7Jroysiq950LSDwei1dIDLrFnz3NGTHOZoZfbx3wUTt0QMrFjX+
         gorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=yFJvEW6PL4Wk9dE8Q8kwfKDDjO3R418aBjP/+OttZ5A=;
        b=cdurPj+vlOn57o3dmQIVatnUNhX111ybwaJ6WVoiE98UeUApAj0Uj3iGaRcC/7H739
         ZOGlDWqB4QYcewjnsxdPMZ4MekOJjmgO48jS5DooWopakUjvuWdfM5ZfnqyhIguf+9FI
         o1thQj8J/h0QPXh2yR3thS1ernpHma3c59tNkoK7pr9UAjkJMEJXwctePOeY/xSKWbR/
         rVZuZ1GJCGszBcZsX6yWEe6FoHgFlhXcQzftFSSspd3O7qb0mn7cxnAZk71Zk0jGOS0f
         avKGUCbzS9/zF7a5Ialaxuj6GK6svAQhDD6/TZ0yfoELM3sqzLkc2o7aAoftVIPUiaDq
         aKIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QL3B9wwz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s48si2228143qtc.141.2019.12.10.08.32.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:32:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QL3B9wwz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieiQq-0007AT-JT
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieiQd-00079w-Or
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:32:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieiQc-0007gd-Lr
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:32:03 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42458)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieiQc-0007fy-E8
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:32:02 -0500
Received: by mail-wr1-x442.google.com with SMTP id a15so20801589wrf.9
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yFJvEW6PL4Wk9dE8Q8kwfKDDjO3R418aBjP/+OttZ5A=;
 b=QL3B9wwzzN9AcFnvQWPzk69I2vS9i13JtB5K3ng8EPET4KlE2XDjpWJ2fNy2dAbjNQ
 dHflE7wG8NvhZUEAU+fT630hhR7x70Xr7zTrYIOrgfefmzOhrf7kPav7fqTy/RzNILrA
 3bCH0f6ptEdJE+iPzvDm1Bb3BcwUo+Eg7lTaadOOOk6TQPeIVy5vIZ11epYqvV5pHM5w
 YpbBaDswRn29senin0FPUedkNbM794QSWPO2h4Pgr2eoAMVZrfrKrDrO3hjbpFU3rg+X
 Jr4MZkuLZ1y8fpfhdhg6JDdB8IFXgH5lFw7A+fGmuqMf7J/YfGIlr/oSJB2X2mT8iStN
 0nBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yFJvEW6PL4Wk9dE8Q8kwfKDDjO3R418aBjP/+OttZ5A=;
 b=d/xFjwBBuEh4QjBav1ue5JVzr7puyQX9CF5v8L6Fu5HEwHRIWTNU10pxMtRvETm4e/
 CWaPRQEg59bnSoayCNLZ/qIQx4OsXGwNRMdgWgTYknV4YxnCuB+PizTfJ7PT5JO/WGip
 RiuOCZTcf/H5TmCm1kLs7S8uqG+XLnv7sbIF5Ev4lfbsdy62e9cOqLdtuDjxIHWHWqGN
 MbXJYklaWBaPxevSANKMyBsh5i0kUN36g7sv5C2e65XfBvI/Kc4FmpEfcDIoMW7X5e3c
 EwBUgsU3b4E8I6D4EQxSsIQWeM3UofMWvdNg8/9sHwnO3mxIbMkLTB/A/jBgSnPI6Y3E
 QgGw==
X-Gm-Message-State: APjAAAVOR4wna9V7sRQ1zZpwUfkGtnwRLtoLwdDmwOvavjX9DYFBQqAG
 l1btRE2CKM763lfaj/GGJpiNMQ==
X-Received: by 2002:adf:db41:: with SMTP id f1mr4380682wrj.392.1575995520619; 
 Tue, 10 Dec 2019 08:32:00 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id x17sm3807881wrt.74.2019.12.10.08.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:31:59 -0800 (PST)
Date: Tue, 10 Dec 2019 17:31:55 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 02/20] virtio-iommu: Add skeleton
Message-ID: <20191210163155.GA277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-3-eric.auger@redhat.com>
X-TUID: R5VuvOPQQhfH
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>

Hi Eric,

On Fri, Nov 22, 2019 at 07:29:25PM +0100, Eric Auger wrote:
> +typedef struct VirtIOIOMMU {
> +    VirtIODevice parent_obj;
> +    VirtQueue *req_vq;
> +    VirtQueue *event_vq;
> +    struct virtio_iommu_config config;
> +    uint64_t features;
> +    uint64_t acked_features;

We already have guest_features in the parent object.

> +    GHashTable *as_by_busptr;
> +    IOMMUPciBus *as_by_bus_num[IOMMU_PCI_BUS_MAX];

Doesn't seem used anymore.

Thanks,
Jean

> +    PCIBus *primary_bus;
> +    GTree *domains;
> +    QemuMutex mutex;
> +    GTree *endpoints;
> +} VirtIOIOMMU;
> +
> +#endif
> -- 
> 2.20.1
> 
> 
