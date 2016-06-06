Received: by 10.25.27.66 with SMTP id b63csp1580167lfb;
        Mon, 6 Jun 2016 09:32:58 -0700 (PDT)
X-Received: by 10.98.27.216 with SMTP id b207mr26374041pfb.111.1465230778542;
        Mon, 06 Jun 2016 09:32:58 -0700 (PDT)
Return-Path: <mark.rutland@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id s6si27421672pal.9.2016.06.06.09.32.58
        for <alex.bennee@linaro.org>;
        Mon, 06 Jun 2016 09:32:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.rutland@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mark.rutland@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=mark.rutland@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 660F1F;
	Mon,  6 Jun 2016 09:33:31 -0700 (PDT)
Received: from leverpostej (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 444653F253;
	Mon,  6 Jun 2016 09:32:56 -0700 (PDT)
Date: Mon, 6 Jun 2016 17:32:38 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
	marc.zyngier@arm.com, andre.przywara@arm.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, pbonzini@redhat.com,
	kvmarm@lists.cs.columbia.edu
Subject: Re: [kvm-unit-tests PATCH v2 03/10] arm/arm64: smp: support more
 than 8 cpus
Message-ID: <20160606163238.GB23505@leverpostej>
References: <1465064165-14885-4-git-send-email-drjones@redhat.com>
 <8737oqi8x2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8737oqi8x2.fsf@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: CHeCJ9QL63UR

On Mon, Jun 06, 2016 at 05:22:49PM +0100, Alex Bennée wrote:
> Andrew Jones <drjones@redhat.com> writes:
> > +#define MPIDR_LEVEL_SHIFT(level) \
> > +	(((1 << level) >> 1) << 3)
> > +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
> > +	((mpidr >> MPIDR_LEVEL_SHIFT(level)) & 0xff)
> 
> Doesn't Aff3 break this little macro? It sits at 32:39 with a gap for
> MT, RES0, U, RES1 for bits 25:31

It works, it's just a little bit magic:

(gdb) p (((1 << 0) >> 1) << 3)
$1 = 0
(gdb) p (((1 << 1) >> 1) << 3)
$2 = 8
(gdb) p (((1 << 2) >> 1) << 3)
$3 = 16
(gdb) p (((1 << 3) >> 1) << 3)
$4 = 32
(gdb) 

We do the same in arch/arm64/include/asm/cputype.h since b058450f38c337d1
("arm64: kernel: add MPIDR_EL1 accessors macros").

Thanks,
Mark.
