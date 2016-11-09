Received: by 10.25.150.194 with SMTP id y185csp296562lfd;
        Wed, 9 Nov 2016 06:59:11 -0800 (PST)
X-Received: by 10.28.133.144 with SMTP id h138mr20261288wmd.12.1478703551825;
        Wed, 09 Nov 2016 06:59:11 -0800 (PST)
Return-Path: <andre.przywara@arm.com>
Received: from cam-admin0.cambridge.arm.com (cam-admin0.cambridge.arm.com. [217.140.96.50])
        by mx.google.com with ESMTP id j13si22719775wmf.109.2016.11.09.06.59.11;
        Wed, 09 Nov 2016 06:59:11 -0800 (PST)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) client-ip=217.140.96.50;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) smtp.mailfrom=andre.przywara@arm.com
Received: from [192.168.67.35] ([10.1.207.46])
	by cam-admin0.cambridge.arm.com (8.12.6/8.12.6) with ESMTP id uA9Ex9Wr015274;
	Wed, 9 Nov 2016 14:59:09 GMT
Subject: Re: [kvm-unit-tests PATCH v4 08/11] libcflat: add IS_ALIGNED() macro,
 and page sizes
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
   kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1478636499-14339-1-git-send-email-drjones@redhat.com>
 <1478636499-14339-9-git-send-email-drjones@redhat.com>
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
   marc.zyngier@arm.com, eric.auger@redhat.com, christoffer.dall@linaro.org,
   Peter Xu <peterx@redhat.com>
From: Andre Przywara <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <fc87f8e4-7746-734d-49e1-a3294c493920@arm.com>
Date: Wed, 9 Nov 2016 14:59:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478636499-14339-9-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: GtZtiV/EqLDt

Hi,

On 08/11/16 20:21, Andrew Jones wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> These macros will be useful to do page alignment checks.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre.

> Signed-off-by: Peter Xu <peterx@redhat.com>
> [drew: also added SZ_64K]
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  lib/libcflat.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/lib/libcflat.h b/lib/libcflat.h
> index 82005f5d014f..143fc53061fe 100644
> --- a/lib/libcflat.h
> +++ b/lib/libcflat.h
> @@ -33,6 +33,12 @@
>  #define __ALIGN_MASK(x, mask)	(((x) + (mask)) & ~(mask))
>  #define __ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a) - 1)
>  #define ALIGN(x, a)		__ALIGN((x), (a))
> +#define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) == 0)
> +
> +#define SZ_4K			(0x1000)
> +#define SZ_64K			(0x10000)
> +#define SZ_2M			(0x200000)
> +#define SZ_1G			(0x40000000)
>  
>  typedef uint8_t		u8;
>  typedef int8_t		s8;
> 
