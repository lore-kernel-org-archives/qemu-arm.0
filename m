Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp958724ejc;
        Sun, 10 Mar 2024 20:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBgZJ4LmgXqq64u7a7IV2p96m8T2rIpqIjOuOB+/8niyqmZnZHP1b80h3J+w+ocdWJTraxr7jBuAWxdlel7cgi2SPC1pOU
X-Google-Smtp-Source: AGHT+IFJ2YZioAdZRh7hAnzTvqLPfbD2JfMYmUzP/w+1PWq3n1cfNLiJR12LGzRa8xkZNVgNDzOB
X-Received: by 2002:a05:620a:222a:b0:788:622e:abd7 with SMTP id n10-20020a05620a222a00b00788622eabd7mr6019902qkh.17.1710128284673;
        Sun, 10 Mar 2024 20:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710128284; cv=none;
        d=google.com; s=arc-20160816;
        b=CMNP905dvddLLXDlp9GacQ2i8/cxeMKZZLVCUrNyc9PM3XMzCaC0TY+XrAEvwddSd4
         yQ4125Nr4E3EM4JO3o57mdafJwWKjY89xWkLs/3xUXbsW8utA1cCJOlxsGtC3fat5RcM
         QAQXkOfnNH4UqQWvL0nONdFTP/d/YyvkUhOP9AVDjaxkD8puNnUp4z/GYpstCvJXT4W0
         OanvdD1Sw8mjjwkzWAnYE+xj7GG+0PsfEnxIzez4Yegbc9T95lF1t9cAplja0YpC2G3u
         PDowSO8Y+0PRShBqwHNWN6RYGAgUKWht6Xli8aqoI1sSLBHgBzj+utjanJNhDVWq2Otn
         8Oug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=vvGGFVJEoqCSt2UELBbxAI2Hdwp7s+IBcX3lk4I2G4Q=;
        fh=F/+aazgUkcuEB85IkChJOBeDaP6ay9x/f/gTMzKcruU=;
        b=oNTRLKKTClEb8Yk27AnvvF0ZLtmuBzQJWPm4oIePIrWyrtVAu1MODM6h8GChwxxkHi
         DlOa+nlSoycr7ODKJNZGuS9FzsuIkJCUpXdUgtEmh6tmf5Mwb9McUM5aH+sSKBJ2r1WS
         t/ZZ6EeA07DgkfqjPCGhsdZ3Zz+tg2QpeoU5Nho+Qpeq/TLsP5Ni+3ZyaCyQiFaOrnE8
         zN42bFiq5ihnEXco4XjCGWYaEh8ZfAxscRytjSHM8TI0PfZ2WOOWfk/mIcxGPrOEU44Z
         tDim0n65FxxsKa76IBWsYrEL3T2t7gyHnOVLP0HUdUOpiodPFQTiPOKYNxpe7sdB8O2z
         uzoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZuPK7RIV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id xy7-20020a05620a5dc700b007883906f41dsi4577476qkn.332.2024.03.10.20.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2024 20:38:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZuPK7RIV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjWTm-0008RE-8d; Sun, 10 Mar 2024 23:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rjWTj-0008Qg-Nb; Sun, 10 Mar 2024 23:37:31 -0400
Received: from mgamail.intel.com ([198.175.65.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rjWTi-0002G3-4N; Sun, 10 Mar 2024 23:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710128250; x=1741664250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=THIQtj0cbhzBX/YSSKPVHrTAk3FEp8UrxmNkNvkosx0=;
 b=ZuPK7RIVL/18lorpQ3CkpQ2ftbDMh1FOTNo7nGmQUiJLVVP0cVWl9Hlf
 7X7nlJYkFklpwX61y0p0bIgibX56U4ymLqYqt74HyGVg1V0PMC0BHJWsi
 igr0y3Qje3iCSmLvA+HnvFsd2A+W5ji7zPns2By7Qls80vdov0I/rhWoQ
 o7Ha+i9fV8pv5CHnb0cW/IaJQmukFDmUXZ5UviEbF3up0WbhFFZqfglpr
 jxEM2b439hIt0gANrGJ2gPGeja+O1vyDA8hsqzq76zV+Ir459Z/9VgIZf
 uuIWKI0blZ5WTQ6arxSp8ngzBf3OnrMHzJQS8FqI5XESV20c4Rec8tVs2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15912653"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="15912653"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 20:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="11468176"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by orviesa007.jf.intel.com with ESMTP; 10 Mar 2024 20:37:23 -0700
Date: Mon, 11 Mar 2024 11:51:11 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v2 0/7] Cleanup and fix @errp dereference
Message-ID: <Ze5/r5EW9YsqVwtS@intel.com>
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
Received-SPF: none client-ip=198.175.65.13;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.945,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-TUID: 1Bh0SptoAyAx

Hi Michael & Philippe,

Could this series catch the last train of next releases? ;-)

Thanks,
Zhao

On Fri, Feb 23, 2024 at 04:56:46PM +0800, Zhao Liu wrote:
> Date: Fri, 23 Feb 2024 16:56:46 +0800
> From: Zhao Liu <zhao1.liu@linux.intel.com>
> Subject: [PATCH v2 0/7] Cleanup and fix @errp dereference
> X-Mailer: git-send-email 2.34.1
> 
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Hi all,
> 
> This is my v2 series to clean and fix @errp dereference.
> 
> Introduction
> ============
> 
> The patches 1-6 fix the cases that deference @errp without
> ERRP_GUARD(), and they are based on my previsous v1 [1].
> 
> The patch 7 is merged in this series from another single patch [2].
> 
> Based on v1, v2 mainly add more description about problematic codes to
> make review easier (with Markus' suggestion) and avoid dereferencing
> @errp in patch 3's special case.
> 
> 
> Future Work
> ===========
> 
> Additionally, I realized that my journey to fix @errp with ERRP_GUARD()
> is still not over, because @errp's second restriction said:
> 
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> ...
> * - It should not be passed to error_prepend() or
> *   error_append_hint(), because that doesn't work with &error_fatal.
> * ERRP_GUARD() lifts these restrictions.
> 
> With this restrication, there're still many places need to add missing
> ERRP_GUARD().
> 
> [1]: https://lore.kernel.org/qemu-devel/20240221094317.994454-1-zhao1.liu@linux.intel.com/
> [2]: https://lore.kernel.org/qemu-devel/20240221073948.768828-1-zhao1.liu@linux.intel.com/
> 
> Thanks and Best Regards,
> Zhao
> 
> ---
> Zhao Liu (7):
>   hw/cxl/cxl-host: Fix missing ERRP_GUARD() in
>     cxl_fixed_memory_window_config()
>   hw/display/macfb: Fix missing ERRP_GUARD() in macfb_nubus_realize()
>   hw/mem/cxl_type3: Fix missing ERRP_GUARD() in ct3_realize()
>   hw/misc/xlnx-versal-trng: Check returned bool in
>     trng_prop_fault_event_set()
>   hw/pci-bridge/cxl_upstream: Fix missing ERRP_GUARD() in
>     cxl_usp_realize()
>   hw/vfio/iommufd: Fix missing ERRP_GUARD() in iommufd_cdev_getfd()
>   hw/intc: Check @errp to handle the error of
>     IOAPICCommonClass.realize()
> 
>  hw/cxl/cxl-host.c            | 1 +
>  hw/display/macfb.c           | 1 +
>  hw/intc/ioapic_common.c      | 4 ++++
>  hw/mem/cxl_type3.c           | 1 +
>  hw/misc/xlnx-versal-trng.c   | 3 +--
>  hw/pci-bridge/cxl_upstream.c | 1 +
>  hw/vfio/iommufd.c            | 1 +
>  7 files changed, 10 insertions(+), 2 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
