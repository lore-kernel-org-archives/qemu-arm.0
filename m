Received: by 10.25.159.131 with SMTP id i125csp1981166lfe;
        Tue, 6 Dec 2016 01:29:31 -0800 (PST)
X-Received: by 10.200.43.120 with SMTP id 53mr52344186qtv.253.1481016571406;
        Tue, 06 Dec 2016 01:29:31 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g65si11244689qtd.241.2016.12.06.01.29.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Dec 2016 01:29:31 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CD864E4E6;
	Tue,  6 Dec 2016 09:29:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB69TPMB004706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 6 Dec 2016 04:29:27 -0500
Date: Tue, 6 Dec 2016 10:29:25 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, marc.zyngier@arm.com, christoffer.dall@linaro.org,
        andre.przywara@arm.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        peter.maydell@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests RFC 05/15] arm/arm64: GICv3: add
 cpu count
Message-ID: <20161206092925.mk4gwx7jbomzxsfz@kamzik.brq.redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
 <1480974406-29345-6-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480974406-29345-6-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 06 Dec 2016 09:29:30 +0000 (UTC)
X-TUID: Hb6LmWHiMsVE

On Mon, Dec 05, 2016 at 10:46:36PM +0100, Eric Auger wrote:
> Add a new cpu_count field in gicv3_data indicating the
> number of redistributors. This will be useful for enumeration
> of their resources such as LPI pending tables.

I'm fine with the additional state, but just curious, will it
ever be possible for gicv3.cpu_count != nr_cpus?

> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  lib/arm/asm/gic-v3.h | 1 +
>  lib/arm/gic-v3.c     | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
> index ed330af..039b7c2 100644
> --- a/lib/arm/asm/gic-v3.h
> +++ b/lib/arm/asm/gic-v3.h
> @@ -58,6 +58,7 @@ struct gicv3_data {
>  	void *dist_base;
>  	void *redist_base[NR_CPUS];
>  	unsigned int irq_nr;
> +	unsigned int cpu_count;
>  };
>  extern struct gicv3_data gicv3_data;
>  
> diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
> index 6246221..9921f4d 100644
> --- a/lib/arm/gic-v3.c
> +++ b/lib/arm/gic-v3.c
> @@ -12,12 +12,14 @@ void gicv3_set_redist_base(size_t stride)
>  	void *ptr = gicv3_data.redist_base[0];
>  	u64 typer;
>  
> +	gicv3_data.cpu_count = 0;
>  	do {
>  		typer = gicv3_read_typer(ptr + GICR_TYPER);
>  		if ((typer >> 32) == aff) {
>  			gicv3_redist_base() = ptr;
>  			return;
>  		}
> +		gicv3_data.cpu_count++;
>  		ptr += stride; /* skip RD_base, SGI_base, etc. */
>  	} while (!(typer & GICR_TYPER_LAST));
>  
> -- 
> 2.5.5
> 
> 
