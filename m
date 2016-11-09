Received: by 10.25.150.194 with SMTP id y185csp136081lfd;
        Wed, 9 Nov 2016 00:33:55 -0800 (PST)
X-Received: by 10.55.167.88 with SMTP id q85mr17299523qke.61.1478680435149;
        Wed, 09 Nov 2016 00:33:55 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y187si22875654qkd.87.2016.11.09.00.33.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Nov 2016 00:33:55 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23DB331B332;
	Wed,  9 Nov 2016 08:33:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uA98XnvJ002701
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 9 Nov 2016 03:33:51 -0500
Date: Wed, 9 Nov 2016 09:33:49 +0100
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: pbonzini@redhat.com, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com,
        christoffer.dall@linaro.org
Subject: Re: [kvm-unit-tests PATCH v4 10/11] arm/arm64: gicv3: add an IPI test
Message-ID: <20161109083349.fhomosnrnj7wkmm7@kamzik.brq.redhat.com>
References: <1478636499-14339-1-git-send-email-drjones@redhat.com>
 <1478636499-14339-11-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478636499-14339-11-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 09 Nov 2016 08:33:54 +0000 (UTC)
X-TUID: 3XXWMnVPcQj7


Argh. I forgot to compile/test arm32/gicv3... Just did now and found
a copy+paste error.

On Tue, Nov 08, 2016 at 09:21:38PM +0100, Andrew Jones wrote:
[...]
> diff --git a/lib/arm/asm/arch_gicv3.h b/lib/arm/asm/arch_gicv3.h
> index 81a1e5f6c29c..cbcec024a2a6 100644
> --- a/lib/arm/asm/arch_gicv3.h
> +++ b/lib/arm/asm/arch_gicv3.h
> @@ -16,10 +16,28 @@
>  #define __stringify xstr
>  
>  #define __ACCESS_CP15(CRn, Op1, CRm, Op2)	p15, Op1, %0, CRn, CRm, Op2
> +#define __ACCESS_CP15_64(Op1, CRm)		p15, Op1, %Q0, %R0, CRm
>  
> +#define ICC_EOIR1			__ACCESS_CP15(c12, 0, c12, 1)
> +#define ICC_IAR1			__ACCESS_CP15(c12, 0, c12, 0)
> +#define ICC_SGI1R			__ACCESS_CP15_64(0, c12)
>  #define ICC_PMR				__ACCESS_CP15(c4, 0, c6, 0)
>  #define ICC_IGRPEN1			__ACCESS_CP15(c12, 0, c12, 7)
>  
> +static inline void gicv3_write_eoir(u32 irq)
> +{
> +	asm volatile("mcr " __stringify(ICC_EOIR1) : : "r" (val));
                                              should be irq ^^
> +	isb();
> +}
> +
[...]

I've pushed an arm/gic-v5 branch[*] to github, and removed the broken
arm/gic-v4 branch.

[*] https://github.com/rhdrjones/kvm-unit-tests/commits/arm/gic-v5

drew
