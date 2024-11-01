Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp163150njc;
        Thu, 31 Oct 2024 19:21:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2ooFoOcnIePPGkWABzOCbmb9FtNdfp/hqoMNhZH0yqyx1dtTNnpeVeeyBhoTEtVjCMzEwl3t8iC9zCw==@linaro.org
X-Google-Smtp-Source: AGHT+IF4JzrE7qmGtQcg8McNaHaOTKYPrIyAFLQZ2SBj0gnu+ZsIWBMeKnRbbu14l4DTHVoXCrQu
X-Received: by 2002:a05:6214:5d89:b0:6cb:ae4e:20de with SMTP id 6a1803df08f44-6d18583239bmr246690336d6.32.1730427672757;
        Thu, 31 Oct 2024 19:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730427672; cv=none;
        d=google.com; s=arc-20240605;
        b=YQ9ZWrEWUND+/9/6RumFkZiEFHJaLqJJnzAgdwMl1aek2HsdPbKNiNruW5hEFTApO2
         BJqc5IJhRxI1OnJsX9ldYBVW83tPDUzcXXtAdpiwoIyw4Gm3AI411LobFWI2iORQ6eb3
         vf70WYhWadhksuo3A4OWjqFaaOkV3hlPLO/Qv9VKYPw1vui7iz3C1U1rrlaet+fF5ZWy
         8yPNcjJdKmfK+3FTpKNO76CNHwiTBRlYzD9l7rprjycqMIk0nKKHDeMAeQEwrOkYZKDO
         rZ0dcW39lJQ8eOPwFmoNBMGbFHzqA8Zi9rIEKeUgJu2uKoqrOqLBBwYn89V8kewyV2vq
         m2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Sa1K4V57llOapFCz3juQdZ6z9JyBHYmppvq4jOzd5U0=;
        fh=sU9YK+uiemBFTCP6fdChdeyfH96xQGE0UPbnPSLj5yU=;
        b=SooSxXLaWBj6VnJHbANa0aJJOoDPRKnZ5MyS7cTHxnig5BI016G6wcHFvV7bL8rm27
         G0+Ji4jNVs6/SszdXjhAGvKardKpoyHuJKFPxdjzSA339O7E5rI2hUg/H8QcCYOXJ+l4
         VvbO/dPzVGAhp2EazrqHSxoFLLMsl5d/6ZJDiKbJj0MGt8eW0lrv8UUkgAKAgCvzZV+0
         oTcRgQvapwZTR+6PAFEJ+IXdYRuQXNXR/Jlr3cKz3ILXe6WyLWlvuuoeXh+JggOCCklr
         JaAuScz+Aqd7suz/HhGEZo9VjG1ttEsCAN6FtWoxn7LXwLjFuLaek5ZJuPrqsSnPcakG
         DzVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Zy0G9VoI;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f39f1f2csi330635785a.27.2024.10.31.19.21.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2024 19:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Zy0G9VoI;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730427673; x=1761963673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=f5edtnaWl0000c3Tv65SjcYIpMNCaJtIb4m9wYByLX8=;
  b=Zy0G9VoIbIXBu3UkT9pN8d1AnMlnekSgxs1DSVaRdTBFBjOKOZ6JPWo4
   ZYIlE2DmZ5d++/D7tO44ADdUyrI4/wd5e+Si1jnbQ/8FDRSUK0sK6PRs0
   xBm2707yydXlzur4csFHWpyUZRjeIigrePU/PO2wDk5Y6Cx4HyrwNCTGQ
   5ANbB5w/Q9SDtbIjuhJTLwFEgzOEzpa2GY9riecAU8tmuC1qxPwaU2ATh
   5jzR6qD7UT2+1EcP0UfywbsEx5LRD79Lq0HUOEHT9Ze1o1ygfbUlKXxBN
   0Esbp9Fd99gtXpdjfOvVQGpS7gQ/JZMGxBwJa5bTUzT8bK+B8z9GBBrCu
   w==;
X-CSE-ConnectionGUID: Xq7NLMshQ9SPMnMivrkclA==
X-CSE-MsgGUID: qhDLFJpARtundvt8yJXPMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30082689"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="30082689"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 19:21:11 -0700
X-CSE-ConnectionGUID: FmrdQIZqQ9a0t/TsjpyEKg==
X-CSE-MsgGUID: nzCFyinlQqu3gqOKIYVunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82502436"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2024 19:21:05 -0700
Date: Fri, 1 Nov 2024 10:38:56 +0800
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
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH v4 2/9] hw/core: Make CPU topology enumeration
 arch-agnostic
Message-ID: <ZyQ/QJnTPvo9wO+H@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
 <20241022135151.2052198-3-zhao1.liu@intel.com>
 <31e8dc51-f70f-44eb-a768-61cfa50eed5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31e8dc51-f70f-44eb-a768-61cfa50eed5b@linaro.org>
X-TUID: oZt9vjz9ynd+

Hi Phil,

> > -static uint32_t cpuid1f_topo_type(enum CPUTopoLevel topo_level)
> > +static uint32_t cpuid1f_topo_type(enum CpuTopologyLevel topo_level)
> >   {
> >       switch (topo_level) {
> > -    case CPU_TOPO_LEVEL_INVALID:
> > +    case CPU_TOPOLOGY_LEVEL_INVALID:
> 
> Since we use an enum, I'd rather directly use CPU_TOPOLOGY_LEVEL__MAX.
>
> Or maybe in this case ...
> 
> >           return CPUID_1F_ECX_TOPO_LEVEL_INVALID;
> > -    case CPU_TOPO_LEVEL_SMT:
> > +    case CPU_TOPOLOGY_LEVEL_THREAD:
> >           return CPUID_1F_ECX_TOPO_LEVEL_SMT;
> > -    case CPU_TOPO_LEVEL_CORE:
> > +    case CPU_TOPOLOGY_LEVEL_CORE:
> >           return CPUID_1F_ECX_TOPO_LEVEL_CORE;
> > -    case CPU_TOPO_LEVEL_MODULE:
> > +    case CPU_TOPOLOGY_LEVEL_MODULE:
> >           return CPUID_1F_ECX_TOPO_LEVEL_MODULE;
> > -    case CPU_TOPO_LEVEL_DIE:
> > +    case CPU_TOPOLOGY_LEVEL_DIE:
> >           return CPUID_1F_ECX_TOPO_LEVEL_DIE;
> >       default:
>            /* Other types are not supported in QEMU. */
>            g_assert_not_reached();
> 
> ... return CPUID_1F_ECX_TOPO_LEVEL_INVALID as default.

I prefer the first way you mentioned since I want "default" to keep
to detact unimplemented levels.

> Can be cleaned on top, so:

Yes, I'll rebase (now there's the conflict) with this fixed.

> Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

Regards,
Zhao
