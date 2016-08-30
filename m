Received: by 10.25.21.156 with SMTP id 28csp2282906lfv;
        Tue, 30 Aug 2016 07:28:24 -0700 (PDT)
X-Received: by 10.55.178.196 with SMTP id b187mr4559434qkf.121.1472567303862;
        Tue, 30 Aug 2016 07:28:23 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c65si27626243qkg.168.2016.08.30.07.28.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Aug 2016 07:28:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2CA5A756F;
	Tue, 30 Aug 2016 14:28:22 +0000 (UTC)
Received: from localhost.localdomain (vpn1-4-213.ams2.redhat.com [10.36.4.213])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u7UESIkp000884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 30 Aug 2016 10:28:20 -0400
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v3 02/10] arm64: fix
 get_"sysreg32" and make MPIDR 64bit
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, alex.bennee@linaro.org
References: <1468587641-7300-1-git-send-email-drjones@redhat.com>
 <1468587641-7300-3-git-send-email-drjones@redhat.com>
Cc: marc.zyngier@arm.com, wei@redhat.com, christoffer.dall@linaro.org
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d3c66b41-bf8a-cb9c-b5ae-87298e8a0835@redhat.com>
Date: Tue, 30 Aug 2016 16:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1468587641-7300-3-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 30 Aug 2016 14:28:23 +0000 (UTC)
X-TUID: p+r1q5buMsc0

Hi,

On 15/07/2016 15:00, Andrew Jones wrote:
> mrs is always 64bit, so we should always use a 64bit register.
> Sometimes we'll only want to return the lower 32, but not for
> MPIDR, as that does define fields in the upper 32.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  lib/arm64/asm/processor.h | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
> index 84d5c7ce752b0..9a208ff729b7e 100644
> --- a/lib/arm64/asm/processor.h
> +++ b/lib/arm64/asm/processor.h
> @@ -66,14 +66,17 @@ static inline unsigned long current_level(void)
>  	return el & 0xc;
>  }
>  
> -#define DEFINE_GET_SYSREG32(reg)				\
> -static inline unsigned int get_##reg(void)			\
> +#define DEFINE_GET_SYSREG(reg, type)				\
> +static inline type get_##reg(void)				\
>  {								\
> -	unsigned int reg;					\
> -	asm volatile("mrs %0, " #reg "_el1" : "=r" (reg));	\
> -	return reg;						\
> +	unsigned long r;					\
> +	asm volatile("mrs %0, " #reg "_el1" : "=r" (r));	\
> +	return (type)r;						\
>  }
> -DEFINE_GET_SYSREG32(mpidr)
> +#define DEFINE_GET_SYSREG32(reg) DEFINE_GET_SYSREG(reg, unsigned int)
> +#define DEFINE_GET_SYSREG64(reg) DEFINE_GET_SYSREG(reg, unsigned long)
> +
> +DEFINE_GET_SYSREG64(mpidr)
>  
>  /* Only support Aff0 for now, gicv2 only */
>  #define mpidr_to_cpu(mpidr) ((int)((mpidr) & 0xff))
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
