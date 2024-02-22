Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp121286eja;
        Thu, 22 Feb 2024 01:12:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAanNrhXZq7pEG6ExQ/YGgyujttpRh74cKs7C28d/gJqfndAYp1h/oniGltDcQs/Yujsx/mUmdC/l4l6i+snYc6+iZWaZ6
X-Google-Smtp-Source: AGHT+IFLuCcAhAjW+s+3V5ZPlHey+1G2ZmoUuQeoN85+ZcQ2MT1BPh55b7SJcb3d2Zl2DYhLbqGo
X-Received: by 2002:ac8:5fd3:0:b0:42e:1299:3d6d with SMTP id k19-20020ac85fd3000000b0042e12993d6dmr11295693qta.19.1708593133604;
        Thu, 22 Feb 2024 01:12:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708593133; cv=none;
        d=google.com; s=arc-20160816;
        b=OZK/7BWd8YIYLkB1a2ZzzOtHM2kBSMCO2hRVOuiqSyabazVzTgNj/9PALDYV6GhZZS
         nePfrIIgPYre8ty5i1My9e9cjdZQxwjHeJIY/vQW6UwAqNwwFZaE4D1arMrycjSSlH/U
         AcXvrkbs7DtEGdvDMaZVwH1erRGPV/dPSE7uOjtpoC3xbnnv70CXoqjT2xpUo7NoijFt
         SP18JPIixU+EFyVDbz5Dy+Nnhtq4oQl9+kB/4L81Ga8UegBEyIXzJh+Nok1N4N1VOpp+
         pM+Sz5YpToWsmO+Fa00cDh6t4QbTOC7LusoR3AGaspsML+o0+oU5NlnUo2P6diHTSN9R
         1MmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=Yv6KYTRZywulRq/q/bBsrgVccuYRpv7YXgt2+QyuC6c=;
        fh=08Y8NipebI+FU6g12LieC5gvDAmYh7VFR6cLSAJhdlo=;
        b=uOajlGW9QBijDN/aBEH62yj7AJ3lXHkGAlMTTxaS6kgVpAsDPFsRcG2JG9yRvFNwJQ
         xwKarME4ZMt7xT5g9adp9Z8VCG55dGzBTvu5r3CGukzi/dXKJ2Lpg1I3IxzD56InbSsL
         JLA29GLTTF/UvIlVDrrsx7t0RM6Wkh7nWr/KifKau343BlTO2g1W/lzkbHF5V/jdOh6A
         U5RoSpxQvkfXzpXn8P7CGZrPYK7Olj0mzczijMq7fhrykd8qQzS5eMzr8xUkGJjdHQ1A
         /+DJzcssSGGovjQVslyThAZk2M3B72gHqhVrAHdyX6gyK02A91vUVUa8Rgr2emz7Dmeu
         3qbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=n5QCPuSw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18-20020ac85412000000b0042c2a78d9absi12207487qtq.373.2024.02.22.01.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 01:12:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=n5QCPuSw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd57I-00016x-19; Thu, 22 Feb 2024 04:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rd574-0000xX-J5; Thu, 22 Feb 2024 04:11:32 -0500
Received: from mgamail.intel.com ([192.198.163.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rd56x-0000JW-9b; Thu, 22 Feb 2024 04:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708593083; x=1740129083;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=csgdIDIEe+p+QSO7aSnhEL+gvYE3xf6SLHunqV3yQ9M=;
 b=n5QCPuSwCMgEeLz3hNrcMyntOmKcSDfKXUjIAY+T3F+Tmc0gD3WsBrth
 p8zf45SuBjU3hkD7I4wmtLsIhyFE7OJ2KCSMoaLIILwZORiWOQPiqX7/T
 dX5L8ImsmH2ISVFr81dB4ZTbdbOJyD5CY/dkmJULe82nEe2C5nyklT/7x
 0lJPTmftXEvNPKzbznIXGevsOdX29WndsbxlgOitOIB2GlrDzHJdCEfYS
 5l+yPs4mKMVNfcMkXYSMogW87HVxC5jGan6UrTqP0rFfTxp3Q0iKNVcUS
 wKTLe5be84NniScUTYVqO2QcVoEZDATsyvFb++LFCOeCzLqEBvdXVm7I+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2690449"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2690449"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 01:11:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5804246"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by orviesa008.jf.intel.com with ESMTP; 22 Feb 2024 01:11:10 -0800
Date: Thu, 22 Feb 2024 17:24:50 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 17/21] hw/i386/iommu: Prefer object_initialize_child over
 object_initialize
Message-ID: <ZdcS4qWnUt2vSqHT@intel.com>
References: <20240216110313.17039-1-philmd@linaro.org>
 <20240216110313.17039-18-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216110313.17039-18-philmd@linaro.org>
Received-SPF: pass client-ip=192.198.163.18; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ewjPl6ikXpgd

Hi Philippe,

On Fri, Feb 16, 2024 at 12:03:08PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Fri, 16 Feb 2024 12:03:08 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH 17/21] hw/i386/iommu: Prefer object_initialize_child over
>  object_initialize
> X-Mailer: git-send-email 2.41.0
> 
> When the QOM parent is available, prefer object_initialize_child()
> over object_initialize(), since it create the parent relationship.
> 
> Rename the 'klass' variable as 'obj' since the argument holds a
> reference to an instance object and not a class one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/i386/amd_iommu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 7329553ad3..c3afbc4130 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -1616,11 +1616,11 @@ static const VMStateDescription vmstate_amdvi_sysbus = {
>      .unmigratable = 1
>  };
>  
> -static void amdvi_sysbus_instance_init(Object *klass)
> +static void amdvi_sysbus_instance_init(Object *obj)
>  {
> -    AMDVIState *s = AMD_IOMMU_DEVICE(klass);
> +    AMDVIState *s = AMD_IOMMU_DEVICE(obj);
>  
> -    object_initialize(&s->pci, sizeof(s->pci), TYPE_AMD_IOMMU_PCI);
> +    object_initialize_child(obj, "iommu", &s->pci, TYPE_AMD_IOMMU_PCI);

What about this name "amd-iommu"?

This is more accurate and differentiates it from the other intel-iommu
related implementations.

>  }
>  
>  static void amdvi_sysbus_class_init(ObjectClass *klass, void *data)
> -- 
> 2.41.0
> 
> 
