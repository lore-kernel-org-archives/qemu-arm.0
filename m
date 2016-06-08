Received: by 10.25.27.66 with SMTP id b63csp2436043lfb;
        Wed, 8 Jun 2016 03:00:40 -0700 (PDT)
X-Received: by 10.55.165.4 with SMTP id o4mr3651395qke.15.1465380040299;
        Wed, 08 Jun 2016 03:00:40 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id m184si191451qke.275.2016.06.08.03.00.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jun 2016 03:00:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BEBE6438E;
	Wed,  8 Jun 2016 10:00:39 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u58A0Y1D005884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 8 Jun 2016 06:00:37 -0400
Date: Wed, 8 Jun 2016 12:00:34 +0200
From: Andrew Jones <drjones@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
        andre.przywara@arm.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
        pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu,
        christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v2 00/10] arm/arm64: add gic
 framework
Message-ID: <20160608100034.l4ex6riemq7nyp2c@hawk.localdomain>
References: <87d1nweqsc.fsf@linaro.org>
 <87oa7chqge.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87oa7chqge.fsf@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 08 Jun 2016 10:00:39 +0000 (UTC)
X-TUID: /s4XlesYJj1G

On Tue, Jun 07, 2016 at 06:13:53PM +0100, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> > Andrew Jones <drjones@redhat.com> writes:
> >
> >> v2:
> >>  Rebased on on latest master + my "populate argv[0]" series (will
> >>  send a REPOST for that shortly. Additionally a few patches got
> >>  fixes/features;
> >>  07/10 got same fix as kernel 7c9b973061 "irqchip/gic-v3: Configure
> >>        all interrupts as non-secure Group-1" in order to continue
> >>        working over TCG, as the gicv3 code for TCG removed a hack
> >>        it had there to make Linux happy.
> >>  08/10 added more output for when things fail (if they fail)
> >>  09/10 switched gicv3 broadcast implementation to using IRM. This
> >>        found a bug in a recent (but not tip) kernel, which I was
> >>        about to fix, but then I saw MarcZ beat me to it.
> >>  10/10 actually check that the input irq is the received irq
> >
> > Cool stuff. I'll get to reviewing this next week as my kvm-unit-tests
> > queue is getting overly long I need to clean-up and re-submit.
> 
> OK I think I'm done for now. Sorry I've skipped the main bits of the GIC
> test but I'm not up to speed on the GIC layout so I'll defer to people
> who have a better understanding of it ;-)

OK, thanks for the review! May I ask that you also give it some testing?
I'd like some results for, at least, ACCEL=kvm,HOST=arm32 (which will
only be gicv2). I've already tested

HOST	BUILD	GICTEST	ACCEL
x86_64	arm32	gicv2	tcg
x86_64	arm32	gicv3	tcg
x86_64	arm64	gicv2	tcg
x86_64	arm64	gicv3	tcg
arm64	arm32	gicv2	kvm, -cpu host,aarch64=off	(mustang)
arm64	arm64	gicv2	kvm, -cpu host			(mustang)
arm64	arm64	gicv3	kvm, -cpu host			(thunderx)

(Note, the gicv3 broadcast test with ACCEL=kvm will fail, unless
 you have a host kernel with dd5f1b049 "irqchip/gic-v3: Fix
 ICC_SGI1R_EL1.INTID decoding mask")

Thanks,
drew 
