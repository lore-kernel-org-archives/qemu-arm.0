Received: by 10.25.15.230 with SMTP id 99csp225105lfp;
        Tue, 4 Apr 2017 07:06:24 -0700 (PDT)
X-Received: by 10.200.51.92 with SMTP id u28mr25248611qta.151.1491314783953;
        Tue, 04 Apr 2017 07:06:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n44si15111118qta.1.2017.04.04.07.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Apr 2017 07:06:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cvP6F-000251-Ep
	for alex.bennee@linaro.org; Tue, 04 Apr 2017 10:06:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cvP5Q-0001dN-Et
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 10:05:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cvP5P-00023W-Ba
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 10:05:32 -0400
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234]:34286)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cvP5P-00022Y-5Y
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 10:05:31 -0400
Received: by mail-wr0-x234.google.com with SMTP id t20so11973374wra.1
	for <qemu-arm@nongnu.org>; Tue, 04 Apr 2017 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H3knjsp16HCDYtYg36xMSVs8DoNVSYQxEN2rGKy4IJo=;
	b=O1uMtNvsO1oCftv4uNoAxNQs3WNl/IrTnlFbINbMAGZDFph8Np+r9IuZBQzqBEfil6
	Kg+pcryTzNsMq/XHStreiic4Fp0oxqNPNJXJJswQYRCfSTg9dBkM4RAFuk0MwA1GUaZa
	k8TTEzh5nnBI50j2tY59qyvOr0RCmCS5Fmc40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H3knjsp16HCDYtYg36xMSVs8DoNVSYQxEN2rGKy4IJo=;
	b=T4udtv8J8hnMEBN8+mCv8USURsMqkEZW6zfGjF9JUHAmSdPRvrGXuYrIbB1gtpm76u
	iIkNts/NTIYvTQzBHMQwAsoJ9jM4fbnj6yQJ3XIpHn7O7gofwKgLO+1JtWGcE+sTmB8Y
	fKHzVpt4BdUmCkOlS2fLOikVu2puvBqLni3yn2lMf7hmROP2DbEM3wRzV/Z3hbIsdCrq
	oLZZnzYgKISaPs9Xkad4joxZjmKKG+8VZBmrEOcAziKeZ6ulQlaFvHUHRO3uAiYBdU2D
	dIgdzUqwrmYaxpxz6iWVfmHlzJAl2LleO9iHPcGnytYyX6e5uhW43M2StxFZBVpvxXSB
	hh9g==
X-Gm-Message-State: AFeK/H2CAGYYC0F9vw3M81ABFe9qQI8u4zucynOXUw0CDbisdoM32qvxhia0uf9o8nJlPS96h2XjpL4BeU2nOqcr
X-Received: by 10.223.169.70 with SMTP id u64mr19673001wrc.187.1491314730010; 
	Tue, 04 Apr 2017 07:05:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Tue, 4 Apr 2017 07:05:09 -0700 (PDT)
In-Reply-To: <20170404134402.GA4196@kozik-book>
References: <20170318192509.15499-1-krzk@kernel.org>
	<CAFEAcA8WGoa=DYXRH4MHfnHmUR_5-xERdmcuqrsk=bmS7GBCmg@mail.gmail.com>
	<20170404134402.GA4196@kozik-book>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2017 15:05:09 +0100
Message-ID: <CAFEAcA9UGEVVUfL3--goP4mVU+ezegWPcoka41XM8d_E2yyJkQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::234
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
X-TUID: FQTpBB0YdOj0

On 4 April 2017 at 14:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Apr 04, 2017 at 01:09:08PM +0100, Peter Maydell wrote:
>> On 18 March 2017 at 19:25, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> > Add emulation for Exynos4210 Pseudo Random Number Generator which could
>> > work on fixed seeds or with seeds provided by True Random Number
>> > Generator block inside the SoC.
>> >
>> > Implement only the fixed seeds part of it in polling mode (no
>> > interrupts).  Simple testing:
>> >     # echo "exynos" > /sys/class/misc/hw_random/rng_current
>> >     # dd if=/dev/hwrng of=/dev/null bs=1 count=16
>> >
>> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> >
>> > ---
>> >
>> > Changes since v1:
>> > 1. Use GRand-like functions to fix build on MingW32 (this adds also
>> >    finalize).
>> > 2. Add DPRINTF macro.
>> > 3. Use HWADDR_PRIx and family for printing values.
>>
>> Is there a data sheet that describes this RNG? I had a quick google
>> but couldn't find anything in the 4210 manual you can get from Samsung.
>
> Official and public datasheet - I never heard about it... AFAIK, Samsung
> never released any datasheet... But recently I found a copy of
> Exynos4412 datasheet published on FriendlyArm website:
> http://wiki.friendlyarm.com/wiki/index.php/NanoPC-T1
> (at the bottom in "Resources").
>
> Some blocks in Exynos4412, including the RNG, are the same as in
> Exynos4210. However, you should not expect too much data about the RNG
> in the datasheet...
>
>> In particular I'm not sure we want to use GRand here.
>
> Now, I am not sure neither. :)

The last RNG we added was hw/misc/bcm2835_rng.c, which uses
qcrypto_random_bytes() to get cryptographically-random bytes
from the host. On the other hand it sounds like this Exynos
hardware is a PRNG without true-random input...

> During the discussions about new kernel driver, I found that this RNG
> module (at least on Exynos4412 board) requires seeding but it is not
> following the Pseudo RNG behavior - seeding with the same value produces
> different results. This means that GRand would not be needed here.

That's rather odd. You're right that the datasheet is hopelessly
uninformative about what's actually going on.

thanks
-- PMM
