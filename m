Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1857884njb;
        Mon, 7 Oct 2024 04:09:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVgSxcXChSsG6Vwus4uhNYcan0gAWqzSW4Y+NHsJYQxYZ7zd7By5wzlib7TZ6FUCFdGAo0KCPdYjT+Uw==@linaro.org
X-Google-Smtp-Source: AGHT+IHWfm6Az5FX5zOGexICqp/ezGjNW9CI2BisNPiVeoMinlKTJrr5QfAzQ2pdUYXzd9Bqm+fZ
X-Received: by 2002:a05:6871:b09:b0:261:1b66:5ab1 with SMTP id 586e51a60fabf-287c1e1018emr7798333fac.21.1728299353077;
        Mon, 07 Oct 2024 04:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728299353; cv=none;
        d=google.com; s=arc-20240605;
        b=feokebQgLxq5tJTSAWI4s6+35Tz2Ji32ZlTpBQ8N/M1kwNHWGZMFeLk8eTzAKX/vud
         anvzKsl0NDl8PBZty5O3V0V5Lv58lGlWml10BYavhoK1vrjZocPD1833wkOqleBdMq0D
         sFy0btEWR+oU9RfF+wHPQloLw8TVOrhhmzSHhv/SZM1+1ecI9Az9vypvYK19ZhdPThCV
         ymFrx9JLjiZ3DeZD8h9ixXsIE40FyqGjHLx8Zm7w5vSkVuqIhKeBxXclOkeilumQoaZg
         fl2Ey2vBw5I/bTZ4mJXg1ffzLy7/2l/hrAJ2wwYFb8dKwf3paEpEybVbSD2MxFUIiRmK
         jUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FVhyarwWUdklALzBAL9F6zHaBd6u9ktcUD1BGX4NuSc=;
        fh=lIQK4w5u8hPKTUFD1dgvaVT/MYYXdD5M0XwdCDzhkt4=;
        b=ZQRedIyzSVR2XX35VgLb8HpBHaXqBSPhjwwndod3BG3qZekLWE9sL7kHjFao275h/x
         jHTGTy6sSQjHuCua8Vu1D8J/ODz3mBab+HzSkDN/IFwyLLhwyNnZUrkkNP1St3JLgGfr
         4PEIbQRmtYHCOhur0OK6YbmmPqZMKXy9mN3RUgx18V+B678zrnKMc1sOslDzvAxPYXTc
         vQ/nq85QjMK5EAu2b4Og2W4dtZybTcgaSk9LGVWY6677GzWdlnl5kox910+m2kdOGoXp
         J9VvEL7oiNMuJmxlsV/4Mr/HivxvcSjPdMoYcT65DzRumc0aXavx5pQ0QUttd+21cdZ+
         nPmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=MqtehRRr;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae7562cb3csi599959685a.170.2024.10.07.04.09.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 04:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.17 as permitted sender) client-ip=198.175.65.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=MqtehRRr;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728299352; x=1759835352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mdl3O6UZDSmkKcS6mryVKnf7fIORJIf2348ydZdIMdU=;
  b=MqtehRRrMlcdSETlwixRrVVu3rKoYg/wGkUvATzV17yG7Ld2b2Ra9wUz
   fkp5GH+OuvpLDkT2z9KSFcBqYPKplOPEeVa4MQivZgBkUrKpguKM7nt1i
   eMrWdYHVn/HoMpgzG+23qfhj+mztDdYq99QjbBcIl0CtNPp7uUwQEW4rT
   tU6SsP8HLgGmQryuPhm+RnJOnzJUZkLSMziRNSg/qEaaXpvs7R/TVY+ry
   k/iRiFjsMe8CoHOsHAQmNqYeOBd8BPGShRkLsN/kcFozvFCAG8iLPTyIJ
   B/uaHoX+598vfJFAp9k5M1giQ9oD3LSbqiRbJ+lWMtZI+frRNWHgK9oVI
   A==;
X-CSE-ConnectionGUID: fsffoBreT2eixyLnYkvNAA==
X-CSE-MsgGUID: tNOMnIJwQESCc0cCS94tAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27567915"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27567915"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 04:09:11 -0700
X-CSE-ConnectionGUID: NG4iK1/SQZutev+AM5LZCQ==
X-CSE-MsgGUID: SRN2jDpjQQqXbhSdUU9EgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75413361"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 07 Oct 2024 04:09:05 -0700
Date: Mon, 7 Oct 2024 19:25:17 +0800
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
Subject: Re: [PATCH v2 6/7] i386/cpu: Update cache topology with machine's
 configuration
Message-ID: <ZwPFHZQA4ar1j2+0@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
 <20240908125920.1160236-7-zhao1.liu@intel.com>
 <20240917100641.000050a8@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917100641.000050a8@Huawei.com>
X-TUID: ywF7GzE9TD5h

On Tue, Sep 17, 2024 at 10:06:41AM +0100, Jonathan Cameron wrote:
> Date: Tue, 17 Sep 2024 10:06:41 +0100
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [PATCH v2 6/7] i386/cpu: Update cache topology with machine's
>  configuration
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> On Sun,  8 Sep 2024 20:59:19 +0800
> Zhao Liu <zhao1.liu@intel.com> wrote:
> 
> > User will configure smp cache topology via -machine smp-cache.
> > 
> > For this case, update the x86 CPUs' cache topology with user's
> > configuration in MachineState.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > Tested-by: Yongwei Ma <yongwei.ma@intel.com>
> Seems simple enough.
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks!

-Zhao

