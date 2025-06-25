Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp745800dyb;
        Wed, 25 Jun 2025 03:14:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIzFJG4BZrqy0OGOrqfYzJX7aW1I26Z1hsl57SQq9MofKwdJ5adfAqTufTM622eh8D6wdkIqQCTlyknQ==@linaro.org
X-Received: by 2002:a05:690c:6ac6:b0:714:2f2:5aa1 with SMTP id 00721157ae682-71406e06e14mr28719177b3.38.1750846469005;
        Wed, 25 Jun 2025 03:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750846468; cv=none;
        d=google.com; s=arc-20240605;
        b=KjxEXREvrvIoY1tC9/B8RT2OhyH7sgCqWWr4V/EfLw9/y64M9BSjQLUo2WGoCfEUE0
         8OyVJB4PhaXADQls33s+Lj74hdSU/gaEiZHZAs9W/U43NSSq6D2yhyAdhQfiG6KXNGzQ
         B1QGPjMZDCSFsVAwwDjoKJFPqMHKRAXZiaRRUrw73Ru2Qn0wM3zLECNihMFYmrZlWgu0
         ZSmgB6l6A1cf59fAjiTgBjtxFhcA0M4EDua7otLcaf/Z5fdxqGTVzqtJFQHvEgYTY1OL
         07Z4UYvlUHizXS/ct1JEzIKGCUui8ygS6V9i2xFxpoRqYCybWFu4St0grF4qCpzGXF8C
         CsnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WHpZf1BrPFAlqXFuHdOtTQ7ioXief2ue4zEdYR2QIM4=;
        fh=H599Vls2+M6EHxdIWiqqbPyHa2Cs314ltfydtght7ZQ=;
        b=QNYdyuQCypTzdNiwLXQglQD1Zuq4T97igQ0HUUBnc/UwO2P5b3BBr2pGeVkK1pfTk1
         lqsEQM+JcJvGuxXWBkJyWjpKBx1PYpttW6r5ZW5xTRkKdhhR6Y+KoSH38kHEj682dJnq
         ZbpOycX4U+FlQmdXXFIxD0uw+K4j79bXaaI5GPxXhK7/CAdD2/VaI9OMt8YmdowWi7XR
         7XS+4gFmlI67+ahe9txNEgJqLp40FlJPOXpmqHbDw6TcOmBTcQXIfDl6XtrOjutWhOTf
         Dg618cDkwgPAq0lBEQmDMMRetrT18uugia9946LgucA+pVjAlE8PMrjA7EjGgR5n1qx4
         HMzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aYDQ6bcG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71401139a93sor10732267b3.9.2025.06.25.03.14.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jun 2025 03:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aYDQ6bcG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750846468; x=1751451268; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WHpZf1BrPFAlqXFuHdOtTQ7ioXief2ue4zEdYR2QIM4=;
        b=aYDQ6bcGTZWRQz4Fq1xf12gmTFqjg2Xe4WzwljvDHZhw0QGB+AJEY29aphMbDvQvlr
         RRu71wopSdgMX36lZ+WHeoW1827XSsQkY97Ny3smYC+Nx8jGEnBEpWKAVt80tZdjcIYO
         VjiJWJCT2m0V5CQW1fjMFZfRgCjQQ4Jw8Rqw3B5H2cJIi41l3IVW1/eM5YSojpR5/fV1
         mciDJmszUYc2h/ia9OnA8YjhrGgQlGY5ZivKWTrDenSFwGC+TqJiubUEQ+DWP/U3o0bP
         BnWFnEbmxVuK0ohFS7YSKTtg91borFopWTt5IM+XxFOiwckcdNY4OplqG/bVxOz/jfC7
         9+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846468; x=1751451268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHpZf1BrPFAlqXFuHdOtTQ7ioXief2ue4zEdYR2QIM4=;
        b=HGXQYvjQxVN9bAH9wMpN4riwe8yODscl6xeqmJjXGV38PMnbRgLbexzbUv0IOzxPLG
         xT/2q2cIhEHXq97c+m43hcy+3ah41nfz50ZnD5LUBkzb/31bbRbrOvmMZlqIRQlG9zhg
         uE5CbpthWn9f9NwyT2o9BZVm3aISMztudAyLN64nLuq0i3ofpDAprdI0hMtvKVsYqgqo
         s5ajWyrLKZnw1C2ThOf7H/d+htQmVMlkg72QweMpO2SSYfyBqA2+JFuTSJ//w/d2BhEX
         MFCADt0Ozpn3aGJmKaAwcKKrDYFtNBFwI7/WeQUSYLbKfwUYGLHLPYfEI0mQ9gUjAIIA
         p6qw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Jz/yPcVaG8XxNYKEPxee0rlAy8PJ22rsaAmYb5IWNOCa5MVQoccoLoF887lDhQoUIpj/fnA9DunpKQ==@linaro.org
X-Gm-Message-State: AOJu0YxzWZtPPhHwWncuwnk5lQ69HgjvRvR2j7tObAoXJ5Z0H/sM5lnZ
	suVbqdkEUfQPecLgNBgHDk5aPIztvAlGbWAcZfg8PT1DQ3Nekp6CPTUTyt5K5u6cZKwWslovahh
	3GYzqXMH/ON9cwPGeNUTsz0MJWkBbKgayESF6yNr3FNGv
X-Gm-Gg: ASbGnctDcXPWtWhmYNO2YNg4Tq+ZMFZP7atpBCeLTJU2cs6ABgO59Kv76DcV8vbdrKD
	viYJx8gtVi2AoBiJt0SnWy2AfSwNnbCXwuXu54uYkXoosGeNVauY8gxJpvZwV868yxdOHnOPA2A
	+uJ1AvTzJbhjF7PP7VVX5eaRFQFetx8JJRHgsfjby76QkB
X-Google-Smtp-Source: AGHT+IE1SVnC+PVyHxDE/ir8P+FbDaCZU32E1YBr9BGc5xKyUSgOrtzXwikzEk8hRx34R5EMJ5iKsQAo35GChbuPeag=
X-Received: by 2002:a05:690c:3682:b0:6fb:1c5a:80ea with SMTP id
 00721157ae682-71406dd8d3dmr34791687b3.32.1750846468296; Wed, 25 Jun 2025
 03:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250617153931.1330449-1-cohuck@redhat.com> <05e903b3-02bf-4c04-ac2b-cdec0b45fe3f@redhat.com>
In-Reply-To: <05e903b3-02bf-4c04-ac2b-cdec0b45fe3f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Jun 2025 11:14:17 +0100
X-Gm-Features: AX0GCFvttrY59WLT4gA3ZgqOqf9rMqxv_AGCgjo_0gmHPt678YKqjDvK8cpzp6o
Message-ID: <CAFEAcA95vCKpk1wXQh49xAWnqY=JZnKdr8NEQuYaRJr=jrKWyA@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] arm: rework id register storage
To: eric.auger@redhat.com
Cc: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, 
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: bvmcQykXExyz

On Wed, 25 Jun 2025 at 10:10, Eric Auger <eric.auger@redhat.com> wrote:
> However there are other checkpatch errors besides the one you reported, in
> 52873a54ad arm/cpu: Store aa64isar0/aa64zfr0 into the idregs arrays
> ERROR: line over 90 characters
> #388: FILE: target/arm/kvm.c:225:
> +    return ARM64_SYS_REG((sysreg & CP_REG_ARM64_SYSREG_OP0_MASK) >>
> CP_REG_ARM64_SYSREG_OP0_SHIFT,
>
> ERROR: line over 90 characters
> #389: FILE: target/arm/kvm.c:226:
> +                         (sysreg & CP_REG_ARM64_SYSREG_OP1_MASK) >>
> CP_REG_ARM64_SYSREG_OP1_SHIFT,
>
> ERROR: line over 90 characters
> #390: FILE: target/arm/kvm.c:227:
> +                         (sysreg & CP_REG_ARM64_SYSREG_CRN_MASK) >>
> CP_REG_ARM64_SYSREG_CRN_SHIFT,
>
> ERROR: line over 90 characters
> #391: FILE: target/arm/kvm.c:228:
> +                         (sysreg & CP_REG_ARM64_SYSREG_CRM_MASK) >>
> CP_REG_ARM64_SYSREG_CRM_SHIFT,
>
> ERROR: line over 90 characters
> #392: FILE: target/arm/kvm.c:229:
> +                         (sysreg & CP_REG_ARM64_SYSREG_OP2_MASK) >>
> CP_REG_ARM64_SYSREG_OP2_SHIFT);
>
> WARNING: line over 80 characters
> #396: FILE: target/arm/kvm.c:233:
> +static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf,
> ARMIDRegisterIdx index)

The last one of those is probably easily fixed, but note the general
remark in style.rst that it's better to have an overlong line than
one with an awkward and unreadable wrapping. (We ought to fix
checkpatch and style.rst to agree on whether to warn or error and
whether that should be at 90 chars or 100 chars, but that would require
reopening an old style argument and it's too much effort.)

> 5f15ebdf3f arm/cpu: Add sysreg definitions in cpu-sysregs.h
> ERROR: Macros with complex values should be enclosed in parenthesis
> #56: FILE: target/arm/cpu-sysregs.h:21:
> +#define DEF(NAME, OP0, OP1, CRN, CRM, OP2) NAME##_IDX,
>
> ERROR: Macros with complex values should be enclosed in parenthesis
> #64: FILE: target/arm/cpu-sysregs.h:29:
> +#define DEF(NAME, OP0, OP1, CRN, CRM, OP2) \
> +    SYS_##NAME = ENCODE_ID_REG(OP0, OP1, CRN, CRM, OP2),
>
> ERROR: Macros with complex values should be enclosed in parenthesis
> #203: FILE: target/arm/cpu64.c:40:
> +#define DEF(NAME, OP0, OP1, CRN, CRM, OP2)      \
> +    [NAME##_IDX] = SYS_##NAME,

This is checkpatch not being able to cope with more complex
uses of the preprocessor; the warning only makes sense for
"acts like a function" macros.

-- PMM
