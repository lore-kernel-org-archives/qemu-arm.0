Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1857530njb;
        Mon, 7 Oct 2024 04:08:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSHg+GgN7tzOpidks8Qikp2zjYig+8iQXBB0UjdkTGXdbBVTpaS+gLCZ5xmU2tcKD6z08X5BRIq0FlEw==@linaro.org
X-Google-Smtp-Source: AGHT+IGDrOSwLFY6Kh22Xph2QC5TFHdjEa2nFxnVhlxTlqx7ydQ/pGCqMKAWo1fXWHExPK58ktBd
X-Received: by 2002:a05:6902:842:b0:e13:d23d:425 with SMTP id 3f1490d57ef6-e28939018a6mr8908464276.1.1728299309677;
        Mon, 07 Oct 2024 04:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728299309; cv=none;
        d=google.com; s=arc-20240605;
        b=QeY/PoDho6TEDMYMt9Oi1FwZuVsAHxxV9omVQC5lY6kSq0aEQZKbT05SUwA/kjtMio
         OCljSx0P8F94GA9LPem/2OOb//12liznAt/C4zKcWju9XR3MBrN4HEdPg2Dz0gaKuYZX
         wwnVyAuW2RpxL1yUJTeEKPs+UQJQjips3X94rsljw/hJb+ucyXaYUctclvMv87b/bz1o
         9ynavjKyt8OOPf4dc3mY/TVGTRUQvdwcUfpFBUDKO/Leu1ONqSDJnHrvyTAgQ31onKTq
         e42Dohuwv8RcOfldpH05vwxGg5UxF6g/UBwKTBBuNEXKawIhQJsDCbUr90oROKngC6/+
         vnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=iFxtl0KynOzk1bHa1Us5qiEsvCcIe/khMpjLBfpIJtI=;
        fh=lIQK4w5u8hPKTUFD1dgvaVT/MYYXdD5M0XwdCDzhkt4=;
        b=e/1ellrfmMa50tDegud5eDMtNnA+6RuIyze+I7o6DAvi8tMn38HSsgmU7FWsMfyxut
         Hv3BO2UcJWP5mSpjzIBCbCzZN/qj3nuPHCCU6A1AyHqr06EaGOKc88hBP/bCznZ29lxU
         B05t21iX/ww+/ROrEpv6TV2+E6U+ITCEQbdRMkngv2CvIuirWJryjLe6uktEKS8ZtMTe
         92pEaDA9sSe5GAtXD0hF0makGsotxxQEr77Ez3ji4MltVL+xIxSe0zepyXldL03w7p57
         x0NNq0llmVmVhceoprv15/Nm2lBA9dfyxVLRee6cFwLxWeJrtgNsgvtVSTnWv1v+1VdE
         u2Og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=APSRRAdn;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.14])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba475bbe9si60887576d6.190.2024.10.07.04.08.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 04:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.14 as permitted sender) client-ip=198.175.65.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=APSRRAdn;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728299309; x=1759835309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hpwrGxuedAeKuZjTNzgbaWYzvlowhimdFInbSjmkp9g=;
  b=APSRRAdnoCbbnoVvuRNHfctEGUsXj/hABoahyjLpCDsy3Ug3CprNjj8/
   m++KXmyz5OTE1spR3kzj9eeA9rFw9VXZZnJbA1glVtUPUaIvzzwGsEQLV
   TlDCQ0RHffvP/Q8qx36k/GgT//Ulry0+6AIdFHHBPM+3G4UbewUBbqcvp
   cdTS2xcUVrFHRCEgQAsA+MHIYjVg9Wux2yFHpfIxignrZxjXyfUx3AKAN
   6XshHzVGVWshGD7hMt6kRA90EZcfvBe/GumH+g1/vpFmjqNVwtw2gTvpl
   JE2kpao8HjFfL/QW1q3w/l0vdvfd4Y6mpkv5DNxOdVbgbFrtZ1ytdzyaN
   w==;
X-CSE-ConnectionGUID: 4RRX4SikTd2StEpBm06z6A==
X-CSE-MsgGUID: szGEUq6mTviZA2Zx6jok4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="31233865"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="31233865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 04:08:27 -0700
X-CSE-ConnectionGUID: AQYZDfABQIaxfDs9ei+I9g==
X-CSE-MsgGUID: h8O7y00TS2SmBdz6F04s3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75875239"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa007.jf.intel.com with ESMTP; 07 Oct 2024 04:08:22 -0700
Date: Mon, 7 Oct 2024 19:24:33 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S.Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v2 5/7] i386/cpu: Support thread and module level cache
 topology
Message-ID: <ZwPE8foi2qviMQSB@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
 <20240908125920.1160236-6-zhao1.liu@intel.com>
 <20240917100508.00001907@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917100508.00001907@Huawei.com>
X-TUID: pOHlDpjjkW2w

On Tue, Sep 17, 2024 at 10:05:08AM +0100, Jonathan Cameron wrote:
> Date: Tue, 17 Sep 2024 10:05:08 +0100
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [PATCH v2 5/7] i386/cpu: Support thread and module level cache
>  topology
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> On Sun,  8 Sep 2024 20:59:18 +0800
> Zhao Liu <zhao1.liu@intel.com> wrote:
> 
> > Allow cache to be defined at the thread and module level. This
> > increases flexibility for x86 users to customize their cache topology.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > Tested-by: Yongwei Ma <yongwei.ma@intel.com>
>
> Will be interesting to see if anyone uses the thread level, but
> no harm in supporting it.

x86 CPU has a legacy property "x-l1-cache-per-thread". This is the old
QEMU cache topology behavior, kept for compatibility. Now add thread
level and I can refactor the code for this thread level.

> I guess this would be a case of RDT
> / MPAM etc as I'm not sure I've seen an SMT processor with
> private caches. Some old papers seems to suggest that it might
> make sense for smt 8 and above.

Thanks for the hint, I'll think about whether some of the RDT / MPAM
cases can be applied here.

> Anyhow, patch is fine
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks!

-Zhao
