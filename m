Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3156590njb;
        Tue, 9 Jul 2024 01:58:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYQPu004L1/LrTawXV5HGVkcbkshBEnGJS7wgy53DyrD7n1IjyJBJVt04c9iiMQY+Wd8Mh
X-Received: by 2002:a05:620a:d5c:b0:79f:f1:24 with SMTP id af79cd13be357-79f19be74femr183812685a.51.1720515512219;
        Tue, 09 Jul 2024 01:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720515512; cv=none;
        d=google.com; s=arc-20160816;
        b=yjWVTj338v1LraXKj6qfk2cQh/Qm9B6AEO+zC8E+B7wcP6L8HJlC9tvlOC6i7B+x9k
         UgLEFCUb1O3e39GmFrd0iyRVnk2KrWEJSCuIXVjMEOfyKSx3ikWkL1z4OJ/IIbJW1st6
         yeiTPK7+eQ1+0GGnK7BMdTh66lzL5pUWeQhFmxdbmX8Bhds4lrS2u6zrnl1+XTRgLD7R
         Akc8rhWuw0sJI1uIHQOmrzJlFWQT4DF/e+WxuxIcjjIqkdttrIUfE3rLFHebPfZaAbq0
         VrFswK3RAiBOgJ/aIZS3rM61y/vcJLq4RGarhMgdQ3kj4bKV8W9MId5QV8lFG4IpJRol
         8eQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date;
        bh=jqXioe8rP0kcguPeV/OEhkPqxrQeShIX/6Iy+KLcDO0=;
        fh=RKUNoLGdDHX5XrJVJ2FtJeOsaghvwr9pDl9hvWhCVzk=;
        b=I89mz/Xb8yHNaMmX0CEj/GQEJIz+4cjikUg0Izneb9ou45n/xnRCXj0mho8ra2yp8T
         3C7VXSDLK8a4KIN6YxL54XK13E/hi38k2PMcgK+8R7+wDGHkBPNgwwBPxWkIYN1i7PpV
         ymwulnCnq6MBoaycWhqd8yqfQx1gjlPCoDgTDvKRhmJPfGPlLwT6fzRbFQedtAE+qEJW
         TCzvZo3mKVVrDhg22rR57PcwJgiLuhTILLko+mvCghy3zXlZ+k8mQGofWDxNx6BvCQz8
         DUv1muPDCn9jVr730xVDtwwkXiRI20tOYiA1uosMjjpJ7TmleyLMa2qhIymdR3V7yv+i
         W9IQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of alexandru.elisei@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=alexandru.elisei@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
Return-Path: <alexandru.elisei@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id af79cd13be357-79f190bb637si166287585a.502.2024.07.09.01.58.32;
        Tue, 09 Jul 2024 01:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of alexandru.elisei@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of alexandru.elisei@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=alexandru.elisei@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 415581042;
	Tue,  9 Jul 2024 01:58:56 -0700 (PDT)
Received: from arm.com (e121798.manchester.arm.com [10.32.101.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 982653F766;
	Tue,  9 Jul 2024 01:58:28 -0700 (PDT)
Date: Tue, 9 Jul 2024 09:58:25 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: pbonzini@redhat.com, drjones@redhat.com, thuth@redhat.com,
	kvm@vger.kernel.org, qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com, maz@kernel.org,
	Anders Roxell <anders.roxell@linaro.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	Eric Auger <eric.auger@redhat.com>,
	"open list:ARM" <kvmarm@lists.linux.dev>
Subject: Re: [kvm-unit-tests PATCH v1 1/2] arm/pmu: skip the PMU
 introspection test if missing
Message-ID: <Zoz7sQNoC9ePXH7w@arm.com>
References: <20240702163515.1964784-1-alex.bennee@linaro.org>
 <20240702163515.1964784-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240702163515.1964784-2-alex.bennee@linaro.org>
X-TUID: 4UhccZZwd2PB

Hi,

On Tue, Jul 02, 2024 at 05:35:14PM +0100, Alex Bennée wrote:
> The test for number of events is not a substitute for properly
> checking the feature register. Fix the define and skip if PMUv3 is not
> available on the system. This includes emulator such as QEMU which
> don't implement PMU counters as a matter of policy.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arm/pmu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arm/pmu.c b/arm/pmu.c
> index 9ff7a301..66163a40 100644
> --- a/arm/pmu.c
> +++ b/arm/pmu.c
> @@ -200,7 +200,7 @@ static void test_overflow_interrupt(bool overflow_at_64bits) {}
>  #define ID_AA64DFR0_PERFMON_MASK  0xf
>  
>  #define ID_DFR0_PMU_NOTIMPL	0b0000
> -#define ID_DFR0_PMU_V3		0b0001
> +#define ID_DFR0_PMU_V3		0b0011
>  #define ID_DFR0_PMU_V3_8_1	0b0100
>  #define ID_DFR0_PMU_V3_8_4	0b0101
>  #define ID_DFR0_PMU_V3_8_5	0b0110
> @@ -286,6 +286,11 @@ static void test_event_introspection(void)
>  		return;
>  	}
>  
> +	if (pmu.version < ID_DFR0_PMU_V3) {
> +		report_skip("PMUv3 extensions not supported, skip ...");
> +		return;
> +	}
> +

I don't get this patch - test_event_introspection() is only run on 64bit. On
arm64, if there is a PMU present, that PMU is a PMUv3.  A prerequisite to
running any PMU tests is for pmu_probe() to succeed, and pmu_probe() fails if
there is no PMU implemented (PMUVer is either 0, or 0b1111). As a result, if
test_event_introspection() is executed, then a PMUv3 is present.

When does QEMU advertise FEAT_PMUv3*, but no event counters (other than the cycle
counter)?

If you want to be extra correct, you can add the above check to pmu_probe() for
32bit, since I doubt that the PMU tests were designed or tested on anything
other than a PMUv3 (and probably not much interest to maintain the tests for
PMUv1 or v2 either). If do do this, may I suggest:

#if defined(__arm__)
	if (pmu.version == ID_DFR0_PMU_V1 || pmu.version == ID_DFR0_PMU_V2)
		return false;
#endif

That way the check is self documenting.

Thanks,
Alex

>  	/* PMUv3 requires an implementation includes some common events */
>  	required_events = is_event_supported(SW_INCR, true) &&
>  			  is_event_supported(CPU_CYCLES, true) &&
> -- 
> 2.39.2
> 
