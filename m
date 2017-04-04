Received: by 10.25.15.230 with SMTP id 99csp236593lfp;
        Tue, 4 Apr 2017 07:31:38 -0700 (PDT)
X-Received: by 10.200.58.163 with SMTP id x32mr25736363qte.123.1491316298613;
        Tue, 04 Apr 2017 07:31:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s70si15126736qka.198.2017.04.04.07.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Apr 2017 07:31:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cvPUg-0000gx-3d
	for alex.bennee@linaro.org; Tue, 04 Apr 2017 10:31:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1cvPUW-0000gS-I3
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 10:31:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1cvPUT-0005iG-DA
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 10:31:28 -0400
Received: from mail-wr0-f176.google.com ([209.85.128.176]:36627)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1cvPUT-0005gx-7W; Tue, 04 Apr 2017 10:31:25 -0400
Received: by mail-wr0-f176.google.com with SMTP id w11so214874291wrc.3;
	Tue, 04 Apr 2017 07:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SeGatCBAwZukTv1lnPzi57wbzUxe8DEnJDDKVB6fMiw=;
	b=lkekEXzW49IhbSp2QLiLmZzqmeMRFjH6ktyHGRmJZK6hDyLgrSOcH5w6AGn05vR1M/
	psthVIGYHSCagOGNljHjx7aXYvHymPpESj0IuasrgUPg/VWgbbhcDGdO8nPTHLgfHToV
	1bS4yXc94cVRyR/+2sBkzolZOWn50Lh5hPTv0f4684d2j/3DxWc0eCLvWLhOwFgnFGZ2
	WEEfzdXig5EpsSCeHr3/fK9lUZ5YLSwxw+SETNQ9X2XF/HQ4Z3pknshXb3Q8gsZ+wOte
	apHxQXF7VNwh5TvDYwx4gB4kUACsgfm4Xjd9hSfq/g2fOyd+qfsCq1QvdwwKl/194Ow5
	aNNQ==
X-Gm-Message-State: AFeK/H3tXybIzirZWjwVdB1mT9Rf+7ShLO67v4hvvd6PUD9xMrg+Cvo4Z3LxXPCRLrIbyg==
X-Received: by 10.223.183.6 with SMTP id l6mr21659821wre.192.1491316284012;
	Tue, 04 Apr 2017 07:31:24 -0700 (PDT)
Received: from kozik-book ([212.203.117.2])
	by smtp.googlemail.com with ESMTPSA id
	o15sm22510391wra.61.2017.04.04.07.31.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Apr 2017 07:31:23 -0700 (PDT)
Date: Tue, 4 Apr 2017 16:31:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170404143121.GA6421@kozik-book>
References: <20170318192509.15499-1-krzk@kernel.org>
	<CAFEAcA8WGoa=DYXRH4MHfnHmUR_5-xERdmcuqrsk=bmS7GBCmg@mail.gmail.com>
	<20170404134402.GA4196@kozik-book>
	<CAFEAcA9UGEVVUfL3--goP4mVU+ezegWPcoka41XM8d_E2yyJkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9UGEVVUfL3--goP4mVU+ezegWPcoka41XM8d_E2yyJkQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.176
Subject: Re: [Qemu-arm] [PATCH v2] hw/misc: Add Exynos4210 Pseudo Random
 Number Generator
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yQAsuc9mFvJi

On Tue, Apr 04, 2017 at 03:05:09PM +0100, Peter Maydell wrote:
> On 4 April 2017 at 14:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Tue, Apr 04, 2017 at 01:09:08PM +0100, Peter Maydell wrote:
> >> On 18 March 2017 at 19:25, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> > Add emulation for Exynos4210 Pseudo Random Number Generator which could
> >> > work on fixed seeds or with seeds provided by True Random Number
> >> > Generator block inside the SoC.
> >> >
> >> > Implement only the fixed seeds part of it in polling mode (no
> >> > interrupts).  Simple testing:
> >> >     # echo "exynos" > /sys/class/misc/hw_random/rng_current
> >> >     # dd if=/dev/hwrng of=/dev/null bs=1 count=16
> >> >
> >> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >> >
> >> > ---
> >> >
> >> > Changes since v1:
> >> > 1. Use GRand-like functions to fix build on MingW32 (this adds also
> >> >    finalize).
> >> > 2. Add DPRINTF macro.
> >> > 3. Use HWADDR_PRIx and family for printing values.
> >>
> >> Is there a data sheet that describes this RNG? I had a quick google
> >> but couldn't find anything in the 4210 manual you can get from Samsung.
> >
> > Official and public datasheet - I never heard about it... AFAIK, Samsung
> > never released any datasheet... But recently I found a copy of
> > Exynos4412 datasheet published on FriendlyArm website:
> > http://wiki.friendlyarm.com/wiki/index.php/NanoPC-T1
> > (at the bottom in "Resources").
> >
> > Some blocks in Exynos4412, including the RNG, are the same as in
> > Exynos4210. However, you should not expect too much data about the RNG
> > in the datasheet...
> >
> >> In particular I'm not sure we want to use GRand here.
> >
> > Now, I am not sure neither. :)
> 
> The last RNG we added was hw/misc/bcm2835_rng.c, which uses
> qcrypto_random_bytes() to get cryptographically-random bytes
> from the host. On the other hand it sounds like this Exynos
> hardware is a PRNG without true-random input...

Yes, I think that is the case. The PRNG block looks the same on all
Exynos SoCs. At least from datasheet perspective and registers.
The difference came with Exynos5420 with introducing another block -
True RNG - which could be chained to PRNG as seed. However the PRNG
stays the same (according to datasheet).

Unfortunately I could not verify too much of this because on Exynos5420
apparently the PRNG block is locked by SecureMonitor.

At some point I will probably get back to Exynos5420 (and True RNG) but
till then, the choice of GRand repeatable random sequences makes some
sense to me.

The remaining issue with this QEMU patch, brought to light during
discussions on LKML, is that it does not accept multiple seeds. From
what I understood, a good PRNG should be able to consume more seeds
at one pass (into same registers) thus. In other words these cases
should produce different results:
1. Seed(a), random
2. Seed(b), Seed(a), random

As of now, I think GRand will not allow this.

The hardware on Exynos4412 behaves like this plus it generates random
numbers even for the same seed after reboot (which could mean that it
was seeded by bootloader or Secure OS).

Best regards,
Krzysztof

