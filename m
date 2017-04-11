Received: by 10.25.0.144 with SMTP id 138csp1268388lfa;
        Tue, 11 Apr 2017 05:02:35 -0700 (PDT)
X-Received: by 10.55.4.6 with SMTP id 6mr9084660qke.222.1491912155320;
        Tue, 11 Apr 2017 05:02:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si16202622qth.121.2017.04.11.05.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Apr 2017 05:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxuVE-0004MZ-OR
	for alex.bennee@linaro.org; Tue, 11 Apr 2017 08:02:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cxuV9-0004HR-JI
	for qemu-arm@nongnu.org; Tue, 11 Apr 2017 08:02:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cxuV5-000065-I5
	for qemu-arm@nongnu.org; Tue, 11 Apr 2017 08:02:27 -0400
Received: from mail.kernel.org ([198.145.29.136]:42714)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cxuV5-00005i-8Y; Tue, 11 Apr 2017 08:02:23 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id B2705201BC;
	Tue, 11 Apr 2017 12:02:19 +0000 (UTC)
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 83C5120173;
	Tue, 11 Apr 2017 12:02:13 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id r16so75977308ioi.2;
	Tue, 11 Apr 2017 05:02:13 -0700 (PDT)
X-Gm-Message-State: AFeK/H07KIwSqAijYSDO/PafJfT1XSirzVDCqUiWIF3OvKpFCpn7MCyxU0/elLfieXtZZ+QJEpMzhudROWd7ZQ==
X-Received: by 10.107.4.74 with SMTP id 71mr60415170ioe.87.1491912132694; Tue,
	11 Apr 2017 05:02:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.62.196 with HTTP; Tue, 11 Apr 2017 05:02:12 -0700 (PDT)
In-Reply-To: <CAFEAcA_DaW_DdcYweHPGpJrMNMP+Sd-Bw6W_OM7tCF5cMyh4aQ@mail.gmail.com>
References: <20170318192509.15499-1-krzk@kernel.org>
	<CAFEAcA8WGoa=DYXRH4MHfnHmUR_5-xERdmcuqrsk=bmS7GBCmg@mail.gmail.com>
	<20170404134402.GA4196@kozik-book>
	<CAFEAcA9UGEVVUfL3--goP4mVU+ezegWPcoka41XM8d_E2yyJkQ@mail.gmail.com>
	<20170404143121.GA6421@kozik-book>
	<CAFEAcA_DaW_DdcYweHPGpJrMNMP+Sd-Bw6W_OM7tCF5cMyh4aQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 11 Apr 2017 14:02:12 +0200
X-Gmail-Original-Message-ID: <CAJKOXPecitJXUxfzPut-nt+TzMEfncNpHHshCbAeZ-4pe_S4Xw@mail.gmail.com>
Message-ID: <CAJKOXPecitJXUxfzPut-nt+TzMEfncNpHHshCbAeZ-4pe_S4Xw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
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
	"Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vyKNNs+XH04U

On Mon, Apr 10, 2017 at 5:15 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 4 April 2017 at 15:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Tue, Apr 04, 2017 at 03:05:09PM +0100, Peter Maydell wrote:
>>> On 4 April 2017 at 14:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>> > On Tue, Apr 04, 2017 at 01:09:08PM +0100, Peter Maydell wrote:
>>> >> Is there a data sheet that describes this RNG? I had a quick google
>>> >> but couldn't find anything in the 4210 manual you can get from Samsung.
>>> >
>>> > Official and public datasheet - I never heard about it... AFAIK, Samsung
>>> > never released any datasheet... But recently I found a copy of
>>> > Exynos4412 datasheet published on FriendlyArm website:
>>> > http://wiki.friendlyarm.com/wiki/index.php/NanoPC-T1
>>> > (at the bottom in "Resources").
>>> >
>>> > Some blocks in Exynos4412, including the RNG, are the same as in
>>> > Exynos4210. However, you should not expect too much data about the RNG
>>> > in the datasheet...
>>> >
>>> >> In particular I'm not sure we want to use GRand here.
>>> >
>>> > Now, I am not sure neither. :)
>>>
>>> The last RNG we added was hw/misc/bcm2835_rng.c, which uses
>>> qcrypto_random_bytes() to get cryptographically-random bytes
>>> from the host. On the other hand it sounds like this Exynos
>>> hardware is a PRNG without true-random input...
>>
>> Yes, I think that is the case. The PRNG block looks the same on all
>> Exynos SoCs. At least from datasheet perspective and registers.
>> The difference came with Exynos5420 with introducing another block -
>> True RNG - which could be chained to PRNG as seed. However the PRNG
>> stays the same (according to datasheet).
>>
>> Unfortunately I could not verify too much of this because on Exynos5420
>> apparently the PRNG block is locked by SecureMonitor.
>>
>> At some point I will probably get back to Exynos5420 (and True RNG) but
>> till then, the choice of GRand repeatable random sequences makes some
>> sense to me.
>
> I was talking to Dan on IRC and his suggestion was that we should just
> use qcrypto_random_bytes() for everything. On the other hand I'm
> not totally sure that's the right approach.
>
> I think my core issue here is that we really don't understand what
> the hardware is doing or what the properties of its randomness
> actually are. To me that says "Linux should not trust this thing
> at all and shouldn't use it" which in turn makes implementing a
> model in QEMU less important :-)

That makes sense. I can only guess by experiments how the hardware
really behaves. As I wrote, it seems it is not a reproducible PRNG so
using qcrypto_random_bytes() should be fine.

I'll switch to that interface.

But first I need to setup proper booting image + rootfs instead of
only initramfs. The sdhci node is failing (missing regulators or
capabilities) so essentially there is no storage now.

How do you access any kind of disk image in case of other boards?

Best regards,
Krzysztof
