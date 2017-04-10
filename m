Received: by 10.25.0.144 with SMTP id 138csp909798lfa;
        Mon, 10 Apr 2017 08:16:17 -0700 (PDT)
X-Received: by 10.237.55.99 with SMTP id i90mr51074894qtb.262.1491837377634;
        Mon, 10 Apr 2017 08:16:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m26si3622146qtb.229.2017.04.10.08.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 08:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxb38-0002eA-73
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 11:16:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxb2z-0002cG-75
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 11:16:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxb2y-0005kE-3Q
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 11:16:05 -0400
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:33669)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cxb2x-0005jw-TF
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 11:16:04 -0400
Received: by mail-wr0-x233.google.com with SMTP id l28so21709679wre.0
	for <qemu-arm@nongnu.org>; Mon, 10 Apr 2017 08:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x4FG4Eecqze7WkVmGVqFAZMQZiLnp/zHmr1hj5nZ8Ts=;
	b=Jykipw9yU7Jf04k+uwza1Kh9Z70y2zO27y0YVj/QUMbjyHHGfxJQd/yWfZDIWghuDH
	GxqzO4/A4PdWuxlDEjIHzt/qdOBqabxZWjOUTGKmbnDYoPseGMyZtmi/5wnsGWh1EsTW
	Bz1Mzj2u51svoQ8ymdp8GLmDMj0VUiUVmyCq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x4FG4Eecqze7WkVmGVqFAZMQZiLnp/zHmr1hj5nZ8Ts=;
	b=JrqhwxCOzOQQ7n6EHA1O17EIEA8jsS+/o8HSzRr66ZgXlTAvxXbLDcCtPonwifzsC6
	/UOYgUXIObu5FDt6qhWNPn+QBvPGH9vZ68blGbxxOsMqBxhYLba02kBoPjBgoMkKdI1y
	naEhhvpa8rGBJENYel/Lpwu800TfG9+NXMZoyJE2FWqLsGfOz5Tvi2UcQAxTmgwPSoLw
	5BvXdGQ3DyhbdpQOl7lFldzZTO1XDQczETX/K8ZKSYP6AKiu7/UpHvegV5VGE43S88gj
	jcZxgZZpTpmZUZ0dm5laPx3wUrI8bk7fXqO6hKJOvg4xOahXMiGI5DiSscEcGVZNXiNa
	ygig==
X-Gm-Message-State: AN3rC/5Bcm3NCJJtxNv7bpWmliNgR2wVmdDDxmT9irK8wp4vGS6LXQ11uzrHuObialjDdR7dB+qVLqSdDSw0GMiF
X-Received: by 10.223.136.246 with SMTP id g51mr10428969wrg.187.1491837362802; 
	Mon, 10 Apr 2017 08:16:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Mon, 10 Apr 2017 08:15:42 -0700 (PDT)
In-Reply-To: <20170404143121.GA6421@kozik-book>
References: <20170318192509.15499-1-krzk@kernel.org>
	<CAFEAcA8WGoa=DYXRH4MHfnHmUR_5-xERdmcuqrsk=bmS7GBCmg@mail.gmail.com>
	<20170404134402.GA4196@kozik-book>
	<CAFEAcA9UGEVVUfL3--goP4mVU+ezegWPcoka41XM8d_E2yyJkQ@mail.gmail.com>
	<20170404143121.GA6421@kozik-book>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Apr 2017 16:15:42 +0100
Message-ID: <CAFEAcA_DaW_DdcYweHPGpJrMNMP+Sd-Bw6W_OM7tCF5cMyh4aQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
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
X-TUID: bYXc4gUSkQYA

On 4 April 2017 at 15:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Apr 04, 2017 at 03:05:09PM +0100, Peter Maydell wrote:
>> On 4 April 2017 at 14:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> > On Tue, Apr 04, 2017 at 01:09:08PM +0100, Peter Maydell wrote:
>> >> Is there a data sheet that describes this RNG? I had a quick google
>> >> but couldn't find anything in the 4210 manual you can get from Samsung.
>> >
>> > Official and public datasheet - I never heard about it... AFAIK, Samsung
>> > never released any datasheet... But recently I found a copy of
>> > Exynos4412 datasheet published on FriendlyArm website:
>> > http://wiki.friendlyarm.com/wiki/index.php/NanoPC-T1
>> > (at the bottom in "Resources").
>> >
>> > Some blocks in Exynos4412, including the RNG, are the same as in
>> > Exynos4210. However, you should not expect too much data about the RNG
>> > in the datasheet...
>> >
>> >> In particular I'm not sure we want to use GRand here.
>> >
>> > Now, I am not sure neither. :)
>>
>> The last RNG we added was hw/misc/bcm2835_rng.c, which uses
>> qcrypto_random_bytes() to get cryptographically-random bytes
>> from the host. On the other hand it sounds like this Exynos
>> hardware is a PRNG without true-random input...
>
> Yes, I think that is the case. The PRNG block looks the same on all
> Exynos SoCs. At least from datasheet perspective and registers.
> The difference came with Exynos5420 with introducing another block -
> True RNG - which could be chained to PRNG as seed. However the PRNG
> stays the same (according to datasheet).
>
> Unfortunately I could not verify too much of this because on Exynos5420
> apparently the PRNG block is locked by SecureMonitor.
>
> At some point I will probably get back to Exynos5420 (and True RNG) but
> till then, the choice of GRand repeatable random sequences makes some
> sense to me.

I was talking to Dan on IRC and his suggestion was that we should just
use qcrypto_random_bytes() for everything. On the other hand I'm
not totally sure that's the right approach.

I think my core issue here is that we really don't understand what
the hardware is doing or what the properties of its randomness
actually are. To me that says "Linux should not trust this thing
at all and shouldn't use it" which in turn makes implementing a
model in QEMU less important :-)

thanks
-- PMM
