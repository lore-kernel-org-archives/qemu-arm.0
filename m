Received: by 10.25.15.230 with SMTP id 99csp215976lfp;
        Tue, 4 Apr 2017 06:44:36 -0700 (PDT)
X-Received: by 10.55.114.199 with SMTP id n190mr23225070qkc.229.1491313476715;
        Tue, 04 Apr 2017 06:44:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n128si15031436qkd.262.2017.04.04.06.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Apr 2017 06:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cvOlA-00038o-6n
	for alex.bennee@linaro.org; Tue, 04 Apr 2017 09:44:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1cvOl4-00038Y-En
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 09:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1cvOl1-00081E-2O
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 09:44:30 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:33558)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1cvOkg-0007wc-Mu; Tue, 04 Apr 2017 09:44:26 -0400
Received: by mail-wr0-f196.google.com with SMTP id u18so42391599wrc.0;
	Tue, 04 Apr 2017 06:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kuAweG/zdzGrafd41Bn9YP4uNv69rB+Zsm0HWZNfJPE=;
	b=m77ORsn8Ow0o54BvYb7Tn2YM5MrF6cghAvIaMxhbt6mrlfj6ffETHj+tMfr+ZpKKkr
	pfkMmoRP3IZVOyS9mP7M5EXNcgpS6ZLuJsQuGfNV28Z6wOJOhxph7CF7M3gYDR+OyzuB
	Caz8MIMgVLdkMVnCcgMW2OdmASFyLPv8M1mWn9bmwC7koRQqy3GC3kAxUFpzokFVUfb7
	Eg0Enw5vVyuMT3yyZeU9rbZpDKHaoskjxBlYY5iwLPhtLtdQKc85f/06grOnMX5TxsnF
	zhlx1yYQ5Rt2F2uqHsIMYIkSOpRJZ7chV2Fv4gVNqDZftF14zgO2L+u0NeEtHhIuBaS3
	qozw==
X-Gm-Message-State: AFeK/H1aKxSDaCivslXXKKLX1MUMhCRs6KP5OnTA9mfF1svqgjCK8N+TghV8MmmVA/apFg==
X-Received: by 10.223.164.2 with SMTP id d2mr19394017wra.47.1491313445223;
	Tue, 04 Apr 2017 06:44:05 -0700 (PDT)
Received: from kozik-book ([212.203.117.2])
	by smtp.googlemail.com with ESMTPSA id
	e21sm14657791wma.5.2017.04.04.06.44.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Apr 2017 06:44:04 -0700 (PDT)
Date: Tue, 4 Apr 2017 15:44:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170404134402.GA4196@kozik-book>
References: <20170318192509.15499-1-krzk@kernel.org>
	<CAFEAcA8WGoa=DYXRH4MHfnHmUR_5-xERdmcuqrsk=bmS7GBCmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8WGoa=DYXRH4MHfnHmUR_5-xERdmcuqrsk=bmS7GBCmg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.196
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
X-TUID: N7M8IOH+LQVl

On Tue, Apr 04, 2017 at 01:09:08PM +0100, Peter Maydell wrote:
> On 18 March 2017 at 19:25, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Add emulation for Exynos4210 Pseudo Random Number Generator which could
> > work on fixed seeds or with seeds provided by True Random Number
> > Generator block inside the SoC.
> >
> > Implement only the fixed seeds part of it in polling mode (no
> > interrupts).  Simple testing:
> >     # echo "exynos" > /sys/class/misc/hw_random/rng_current
> >     # dd if=/dev/hwrng of=/dev/null bs=1 count=16
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v1:
> > 1. Use GRand-like functions to fix build on MingW32 (this adds also
> >    finalize).
> > 2. Add DPRINTF macro.
> > 3. Use HWADDR_PRIx and family for printing values.
> 
> Is there a data sheet that describes this RNG? I had a quick google
> but couldn't find anything in the 4210 manual you can get from Samsung.

Official and public datasheet - I never heard about it... AFAIK, Samsung
never released any datasheet... But recently I found a copy of
Exynos4412 datasheet published on FriendlyArm website:
http://wiki.friendlyarm.com/wiki/index.php/NanoPC-T1
(at the bottom in "Resources").

Some blocks in Exynos4412, including the RNG, are the same as in
Exynos4210. However, you should not expect too much data about the RNG
in the datasheet...

> In particular I'm not sure we want to use GRand here.

Now, I am not sure neither. :) Let me describe the background:

Recently I started also improving the Linux kernel driver for RNG module
which ended in writing a new driver followed by discussions
from which I learnt a lot. See [1][2][3]

The datasheet is not saying too much how the RNG module works inside...
so it is all a guessing. I must admit that I wrote the QEMU RNG part mostly
looking at behavior of kernel driver and combining the knowledge with
information obtained from datasheet. Thus I used GRand to have
repeatable sequences for same seed.

During the discussions about new kernel driver, I found that this RNG
module (at least on Exynos4412 board) requires seeding but it is not
following the Pseudo RNG behavior - seeding with the same value produces
different results. This means that GRand would not be needed here.

The new driver (not merged yet) took this into account and it behaves
differently than previous one. Most notably it tries to be a better pseudo
random number generator in terms of randomness.

I did not test the new kernel driver with this QEMU RNG driver because
it uses different user-space API and I still did not configure full
Linux box in QEMU (mounting root, having some distro in the image). I am
booting the QEMU kernel to initramfs with some toolset included.

[1] https://www.spinics.net/lists/kernel/msg2474154.html
[2] https://www.spinics.net/lists/arm-kernel/msg571653.html
[3] https://www.spinics.net/lists/arm-kernel/msg571516.html


Best regards,
Krzysztof

