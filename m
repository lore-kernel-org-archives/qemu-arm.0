Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3241735njc;
        Tue, 5 Nov 2024 18:22:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVDiR40Q3SxdtLmh7/TxnhO1I4ypD8rdb6BBoeJ6vZjKgzNaoQb4XIYV1gp5GotnKEEaHQeaTmpENdfAg==@linaro.org
X-Google-Smtp-Source: AGHT+IFDQwEKO5706z1sqb+/g0fVcmHBlno6UyAkJjge7xJg5SxDLKHhjmpek3QsCThpNM2K2VQ2
X-Received: by 2002:ac8:7d48:0:b0:460:edba:3696 with SMTP id d75a77b69052e-462ab281d7dmr317408431cf.29.1730859759203;
        Tue, 05 Nov 2024 18:22:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730859759; cv=none;
        d=google.com; s=arc-20240605;
        b=deTNzPmN0qQm8YxXgx2p3+CfGcIVo9VZeEQ9BbmVMkP95nCinZhlkcSebQ4X/5shfD
         zGZFyitBlDZ0X8+6hXYwzjmoLP/FV9gLyMGgjGHJgPvCmcNFnwXy/syHS6XTyFH9/UTb
         cmfeBbR2I/8vYJCUTDwnFKkbD91Dh1ifsdrMxhsNs1fdhpWfbwdSoE7ATomTFdJZmT+G
         5llMYXnJ+enNT+2nbwqcFoe9QbOnyY/SLD8XZE+75w5+sOpvKuPXHYM78CQEPIl5hDKx
         EzfU5RkFG9WfeokjiTxA3JIF+l8nr83CGX6ow+w31/ghVPofr165suitZCoCIC1HCumP
         poEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=xGqTXsNEGTcHl5quTzElhUHRgwNxsLOXa7kGxKh8f9w=;
        fh=i8xVSfGWIvugUOOsdQVJZDHuXtFwzngnEhoAkuGfmIc=;
        b=URT7kUmVecw8YpytgORsWyWQrdMWkoBGSfchxFaTG0UZMe9K+A71OhhIMeNe90bJp+
         XzKTBDUi4SoXtbIEnLm+qYvRiafb12dMFNOmiZgkC6xBC08S6fI/ZHsIvNiR4rwlTM/f
         oNy25UHlDlBYUgXRG2BvCneCpy0pOtmrMD8dgc9wK4xCzyK6CJ1A5hV89jFO3ZpP8o+T
         6rYGajp2onaBgjEsCrZliq2S4k1dohd22LkQHvK4fNOPHFAoCGEOKdFaU7ZIQKqb/NWG
         vOPBgNShTupG2dHso5X5QI4yoFjAJUWJJg68sBFEymTijV6TU0i9prl4gbTKmSFqbksb
         SYyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HnV5HaXq;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.14])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad2388b9si147667121cf.543.2024.11.05.18.22.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 18:22:39 -0800 (PST)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.14 as permitted sender) client-ip=192.198.163.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HnV5HaXq;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730859759; x=1762395759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/KCEcEIHXIG9K9E4TK1RWwzLaP/150mljJM4/TKE848=;
  b=HnV5HaXqRsqdXxQlCeOi5dvs5+Hn6/euRLnCvnFXdwcZA8FDgFgWQVKQ
   aFDYzC8DgBy/vk9tDWehE48FACpxnKrRYnZQ3/Htg2FkqOeA0s3hsGPyA
   ELr2F2nayLTTdywK+MCG0nlS8iRdIK1uwdqbsbYEVMnhJGkp2M4M1pgcR
   p9PskoHi0hW/nklq8Yb5Y5pJb4eU7MeTdQwPYjhUoqyPEKjDhCkLBUdl1
   g5M1DCPpwGXPXu9oLm77YTFgD907ZgBFmUVeDk1SoOrpqSZ+aXqYh3WM9
   nfmpn9zb7EJzQA/UwcZssjrlMyhZAGpfc4nQ8/zBrv+Tm0Ddo1yKSWBrg
   g==;
X-CSE-ConnectionGUID: MVWJhEVSRQ2lBxoNNfD98A==
X-CSE-MsgGUID: ex+AvNr1ShG1b4EaymApPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30859566"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30859566"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:22:37 -0800
X-CSE-ConnectionGUID: ZMKbsAMBSOWwOHuYvFepng==
X-CSE-MsgGUID: ZhO/mQhGT9Wl8MpmIjIr+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84365673"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 05 Nov 2024 18:22:33 -0800
Date: Wed, 6 Nov 2024 10:40:24 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Subject: Re: [PATCH v5 0/9] Introduce SMP Cache Topology
Message-ID: <ZyrXGPlVfAVUCfTO@intel.com>
References: <20241101083331.340178-1-zhao1.liu@intel.com>
 <1b00ec74-4dda-48d4-b74f-9ce45cf1a429@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b00ec74-4dda-48d4-b74f-9ce45cf1a429@linaro.org>
X-TUID: bwzGFtqoPlRW

Hi Philippe,

On Tue, Nov 05, 2024 at 10:54:07PM +0000, Philippe Mathieu-Daudé wrote:
> Date: Tue, 5 Nov 2024 22:54:07 +0000
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: Re: [PATCH v5 0/9] Introduce SMP Cache Topology
> 
> Hi Zhao,
> 
> On 1/11/24 09:33, Zhao Liu wrote:
> > Hi Paolo,
> > 
> > This is my v5, if you think it's okay, could this feature get the final
> > merge? (Before the 9.2 cycle ends) :-)
> 
> 
> > ---
> > Zhao Liu (8):
> >    i386/cpu: Don't enumerate the "invalid" CPU topology level
> >    hw/core: Make CPU topology enumeration arch-agnostic
> >    qapi/qom: Define cache enumeration and properties for machine
> >    hw/core: Check smp cache topology support for machine
> >    hw/core: Add a helper to check the cache topology level
> 
> Since the first patches aim to be generic I took the liberty to
> queue them via the hw-misc tree. The rest really belongs to the
> x86 tree.

Thank you! I'm glad I could catch the last train for version 9.2.

> >    i386/cpu: Support thread and module level cache topology
> >    i386/cpu: Update cache topology with machine's configuration
> >    i386/pc: Support cache topology in -machine for PC machine
> > Alireza Sanaee (1):
> >    i386/cpu: add has_caches flag to check smp_cache configuration
> >

I'll continue to push the rest during the merge window of v10.0.

Thanks,
Zhao

