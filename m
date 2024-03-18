Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp497028ejb;
        Mon, 18 Mar 2024 01:34:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHWtqb5qlR69t7DOY8l6Nywu9to/d+Zisa7nEvj7auozSvRFCDuU6DVUNCN6B4KczEN6X+7z/SEIWvlURfdCFdr+EX2QP9
X-Google-Smtp-Source: AGHT+IF/95rHTEjbto5nolv2mdbpmpHs0oExYVAvRvDY/4ChrIeZ6vMLFkaYbJjJOLZeYF+EA0f7
X-Received: by 2002:a25:8392:0:b0:dc7:347e:c6f4 with SMTP id t18-20020a258392000000b00dc7347ec6f4mr8730039ybk.32.1710750854314;
        Mon, 18 Mar 2024 01:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710750854; cv=none;
        d=google.com; s=arc-20160816;
        b=OdYVWz6JTNyksmrconeunq7PYm46QBbYYpkiZPoLJjYIFblA3zhbX/KWeo4/5PgAhc
         QyQJO1qhdTjJEXdTORHG/UNgAGmnSeK5CS+7D6PjohcRuGi1Dn882ixHisqLCCEyuvf3
         NvZb14lauIJGN9uTUJiJUccJ2CLz0G4IgWy722NC3HYe+EGvUj+lAkweQiqzhglcBW2Q
         7CPKn+83/q7AlQfBJdLofYM6AxKs5ikz57oo8DPB/uze3hohVGlTGyf16Q9Dc+ZrRoJC
         zki7IquUYZL0z09HL6IsUsEHKiEvwPLu0MYwmFo9Kdg/FdeIRCedPu+ccURJ0V1WCvBy
         cZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=YM3gWSA13daDPNnf1kdqYExfI+6UUWGYoPW8/rLY7rQ=;
        fh=h+fJd2As8+s4f5Y4rqG5S9cUovhplWBLROGJ3VOcl04=;
        b=H18JvdAZTntpuqChnJcnToYGlr/twaa+vtZJ5dbM5reattHzu5LQrV5yV0GZJArdmh
         tJuVvHsyZXwsuvbGiw46p8uS56fOi5XSixrnxZlsgOu/ljPGsm+eTvC1XlGH3AhBMZy5
         RgeoLaLH9zLh3ZfHOBo2HYZgunLXbfBlsidByLnwJTV8iDUQ6PuuNy0fZf8KSbMNMsYP
         5eB+yB+8DteFT3lJbFNr4VBQmOgG3SrVys2v152MCgpUEde6YdsrNzyP06tONLbRQ44n
         q/XwAfizHQELRKVFgrqIi/qZGVRWV1EKVAK4g8qZA2F7emYEVtuEavWBAyQvucl8PibF
         983Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=nKJQ5b4n;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.10])
        by mx.google.com with ESMTPS id h3-20020a05622a170300b00430b697a8c8si6021980qtk.67.2024.03.18.01.34.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2024 01:34:14 -0700 (PDT)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=nKJQ5b4n;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710750854; x=1742286854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JUZW5gGldw4BXTAwUQ0eaRr94wgH03/4Fmcn9iVi/8o=;
  b=nKJQ5b4nr7Otg9c/XTeGvJBZ/r/uK7sd6bBUUk1LWdT6bFP8Xuj8Ugac
   4y56m0DRp86Oqj2Wad6SahJAI0/okXK5cUie5oU9hczuF7xOUpObgO0b9
   uLblRKT0VAv8kUSGPrRuu6N79/bSrSXZWrCyh++gD3Ca8ZaI5+BTC445n
   nnPkEDcnD476DogoLMQdPcRJWgfV62F1ZL405ylg0EJvhjd340BDjfaZI
   EWqY2APJ8EWLYF3UGNoSXU2RnrcQKPZ6LSmdnNTWuuRex7IL1OhxSp1A2
   pgbzmFgtRCk9h71wKUO2s7yvuPHZiuZhq6nzzGveZbNXQeZsqlc+SoP93
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16951487"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="16951487"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 01:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="13286825"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2024 01:34:07 -0700
Date: Mon, 18 Mar 2024 16:47:59 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH-for-9.1 06/21] target/i386: Make X86_CPU common to new
 I386_CPU / X86_64_CPU types
Message-ID: <Zff/v7aK182oxbM2@intel.com>
References: <20240315130910.15750-1-philmd@linaro.org>
 <20240315130910.15750-7-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315130910.15750-7-philmd@linaro.org>
X-TUID: asKke3iLE75N

Hi Philippe,

On Fri, Mar 15, 2024 at 02:08:54PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Fri, 15 Mar 2024 14:08:54 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH-for-9.1 06/21] target/i386: Make X86_CPU common to new
>  I386_CPU / X86_64_CPU types
> X-Mailer: git-send-email 2.41.0
> 
> "target/foo/cpu-qom.h" can not use any target specific definitions.
> 
> Currently "target/i386/cpu-qom.h" defines TYPE_X86_CPU depending
> on the i386/x86_64 build type. This doesn't scale in a heterogeneous
> context where we need to access both types concurrently.

Does this mean that there would be a TCG case contains both 64-bit and
32-bit i386 core? ;-)

> In order to do that, introduce the new I386_CPU / X86_64_CPU
> types, both inheriting a common TYPE_X86_CPU base type.
> 
> Keep the current "base" and "max" CPU types as 32 or 64-bit,
> depending on the binary built.
> 
> Adapt the cpu-plug-test, since the 'base' architecture is now
> common to both 32/64-bit x86 targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/cpu-qom.h       | 16 ++++++++++------
>  target/i386/cpu.c           | 20 ++++++++++++++++++--
>  tests/qtest/cpu-plug-test.c |  2 +-
>  3 files changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
> index d4e216d000..de28d7ea20 100644
> --- a/target/i386/cpu-qom.h
> +++ b/target/i386/cpu-qom.h
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU x86 CPU
> + * QEMU x86 CPU QOM header (target agnostic)
>   *
>   * Copyright (c) 2012 SUSE LINUX Products GmbH
>   *
> @@ -22,14 +22,18 @@
>  
>  #include "hw/core/cpu.h"
>  
> -#ifdef TARGET_X86_64
> -#define TYPE_X86_CPU "x86_64-cpu"
> -#else
> -#define TYPE_X86_CPU "i386-cpu"
> -#endif
> +#define TYPE_X86_CPU    "x86-cpu"
> +#define TYPE_I386_CPU   "i386-cpu"
> +#define TYPE_X86_64_CPU "x86_64-cpu"
>  
>  OBJECT_DECLARE_CPU_TYPE(X86CPU, X86CPUClass, X86_CPU)
>  
> +OBJECT_DECLARE_CPU_TYPE(I386CPU, X86CPUClass, I386_CPU)
> +OBJECT_DECLARE_CPU_TYPE(X86_64CPU, X86CPUClass, X86_64_CPU)
> +
> +#define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
> +#define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
> +

X86_CPU_TYPE_NAME seems to be duplicated because the following line is
the existing X86_CPU_TYPE_NAME definition.

>  #define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
>  #define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
>  
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ebf555f50f..07f64c1ea5 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -8057,12 +8057,28 @@ static const TypeInfo x86_cpu_types[] = {
>          .class_size     = sizeof(X86CPUClass),
>          .class_init     = x86_cpu_common_class_init,
>      }, {
> -        .name           = X86_CPU_TYPE_NAME("base"),
> +        .name           = TYPE_I386_CPU,
>          .parent         = TYPE_X86_CPU,
> +        .abstract       = true,
> +    }, {
> +        .name           = TYPE_X86_64_CPU,
> +        .parent         = TYPE_X86_CPU,
> +        .abstract       = true,
> +    }, {

Should TYPE_I386_CPU/TYPE_X86_64_CPU be also wrapped with TARGET_X86_64?

Otherwise, we would keep the 32-bit CPU type definition of TYPE_I386_CPU
in the 64-bit case.

> +        .name           = X86_CPU_TYPE_NAME("base"),
> +#ifdef TARGET_X86_64
> +        .parent         = TYPE_X86_64_CPU,
> +#else
> +        .parent         = TYPE_I386_CPU,
> +#endif
>          .class_init     = x86_cpu_base_class_init,
>      }, {
>          .name           = X86_CPU_TYPE_NAME("max"),
> -        .parent         = TYPE_X86_CPU,
> +#ifdef TARGET_X86_64
> +        .parent         = TYPE_X86_64_CPU,
> +#else
> +        .parent         = TYPE_I386_CPU,
> +#endif
>          .instance_init  = max_x86_cpu_initfn,
>          .class_init     = max_x86_cpu_class_init,
>      }
