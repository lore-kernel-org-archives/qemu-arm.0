Received: by 10.25.87.130 with SMTP id l124csp96426lfb;
        Thu, 1 Sep 2016 03:19:34 -0700 (PDT)
X-Received: by 10.55.163.211 with SMTP id m202mr13320247qke.68.1472725174374;
        Thu, 01 Sep 2016 03:19:34 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s12si3657704qks.124.2016.09.01.03.19.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Sep 2016 03:19:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 560578123E;
	Thu,  1 Sep 2016 10:19:33 +0000 (UTC)
Received: from localhost.localdomain (vpn1-5-216.ams2.redhat.com [10.36.5.216])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u81AJT32012354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Sep 2016 06:19:30 -0400
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v3 05/10] arm/arm64: irq
 enable/disable
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, alex.bennee@linaro.org
References: <1468587641-7300-1-git-send-email-drjones@redhat.com>
 <1468587641-7300-6-git-send-email-drjones@redhat.com>
Cc: marc.zyngier@arm.com, wei@redhat.com, christoffer.dall@linaro.org
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c4a8a1c7-4636-de98-2c1f-c45cc4b37501@redhat.com>
Date: Thu, 1 Sep 2016 12:19:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1468587641-7300-6-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Thu, 01 Sep 2016 10:19:33 +0000 (UTC)
X-TUID: GSz30joDorvv

Hi,

On 15/07/2016 15:00, Andrew Jones wrote:
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  lib/arm/asm/processor.h   | 10 ++++++++++
>  lib/arm64/asm/processor.h | 10 ++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
> index afc903ca7d4ab..75a8d08b89330 100644
> --- a/lib/arm/asm/processor.h
> +++ b/lib/arm/asm/processor.h
> @@ -35,6 +35,16 @@ static inline unsigned long current_cpsr(void)
>  
>  #define current_mode() (current_cpsr() & MODE_MASK)
>  
> +static inline void local_irq_enable(void)
> +{
> +	asm volatile("cpsie i" : : : "memory", "cc");
> +}
> +
> +static inline void local_irq_disable(void)
> +{
> +	asm volatile("cpsid i" : : : "memory", "cc");
> +}
> +
>  static inline unsigned int get_mpidr(void)
>  {
>  	unsigned int mpidr;
> diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
> index 94f7ce35b65c1..d54a4ed1c1876 100644
> --- a/lib/arm64/asm/processor.h
> +++ b/lib/arm64/asm/processor.h
> @@ -68,6 +68,16 @@ static inline unsigned long current_level(void)
>  	return el & 0xc;
>  }
>  
> +static inline void local_irq_enable(void)
> +{
> +	asm volatile("msr daifclr, #2" : : : "memory");
> +}
> +
> +static inline void local_irq_disable(void)
> +{
> +	asm volatile("msr daifset, #2" : : : "memory");
> +}
> +
>  #define DEFINE_GET_SYSREG(reg, type)				\
>  static inline type get_##reg(void)				\
>  {								\
> 
Besides the non existing commit msg - looks like the kvm-unit-tests
practices are different from kernel ones ;-)-,

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
