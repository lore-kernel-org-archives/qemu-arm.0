Received: by 10.25.0.147 with SMTP id 141csp1472162lfa;
        Mon, 6 Mar 2017 09:24:08 -0800 (PST)
X-Received: by 10.237.62.176 with SMTP id n45mr18335639qtf.39.1488821048041;
        Mon, 06 Mar 2017 09:24:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si15907112qkg.228.2017.03.06.09.24.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 09:24:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckwMf-0001hc-Bc
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 12:24:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ckwMc-0001hX-L9
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 12:24:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ckwMX-0004xA-Lb
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 12:24:02 -0500
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33637)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1ckwMX-0004wq-FG; Mon, 06 Mar 2017 12:23:57 -0500
Received: by mail-wm0-f65.google.com with SMTP id n11so14882568wma.0;
	Mon, 06 Mar 2017 09:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=6gqg2riHxr277y80sJVCxHeL0cAUKlbDFQHuHc9uRyE=;
	b=KGORZPobBdfiOhF6lLhWDiU1lj/Ek556HnhucudmoFuEyawPnlxYgPqcEQ2Zl4Omar
	hb5eQ9yeklJzjDvFSRC5BpeT2+bmD7qEayvtIvbZ38OVjTqBlKiFwj0SRY8PQBXJmXQP
	j2pZoJqI1V6/+RwSjyQtUcWCGN+XEnEtg2cvB26p2ZQkuWkWam0DDEAAzKr2VS2TvIVI
	IgD+CWBvim3bDAKikAfvZVkwbR4018RyAc6kcVo2UlnCOHGw6pN6F3jWd7mjbigWx6C3
	bknhtSuQWtSQSETO4L2nYylenYaNO/AQX6GhCa1XglVhWdg3Qiv2hOHLBvK9KAxR2WqW
	GekQ==
X-Gm-Message-State: AMke39m19ZLsYDahoDRf9Cd7cHX3smR8j5hBkfw5eqRDjdJgROVVOBd4b+DGd6yzxSWqPg==
X-Received: by 10.28.198.132 with SMTP id w126mr14744564wmf.69.1488821036255; 
	Mon, 06 Mar 2017 09:23:56 -0800 (PST)
Received: from kozik-lap (bzq-109-67-52-244.red.bezeqint.net. [109.67.52.244])
	by smtp.googlemail.com with ESMTPSA id
	t103sm27881317wrc.43.2017.03.06.09.23.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Mar 2017 09:23:55 -0800 (PST)
Date: Mon, 6 Mar 2017 19:23:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-ID: <20170306172346.2f7guqfhzzlzmnfq@kozik-lap>
References: <20170305214857.9510-1-krzk@kernel.org>
	<20170305214857.9510-3-krzk@kernel.org>
	<2130c1b2-0f81-13f6-a1f8-c0a2e294e3f0@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2130c1b2-0f81-13f6-a1f8-c0a2e294e3f0@amsat.org>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
Subject: Re: [Qemu-arm] [PATCH 3/3] hw/misc/exynos4210_pmu: Reorder local
 variables for readability
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g0T6iE5Mi2as

On Mon, Mar 06, 2017 at 01:06:29AM -0300, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Krzysztof,
>=20
> On 03/05/2017 06:48 PM, Krzysztof Kozlowski wrote:
> > Short declaration of 'i' was in the middle of declarations with
> > assignments.  Make it a little bit more readable.  No functional change.
> >=20
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  hw/misc/exynos4210_pmu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
> > index cbdfa0614600..60d1545c0baa 100644
> > --- a/hw/misc/exynos4210_pmu.c
> > +++ b/hw/misc/exynos4210_pmu.c
> > @@ -401,8 +401,8 @@ static uint64_t exynos4210_pmu_read(void *opaque, h=
waddr offset,
> >                                      unsigned size)
> >  {
> >      const Exynos4210PmuState *s =3D (Exynos4210PmuState *)opaque;
> > -    unsigned i;
> >      const Exynos4210PmuReg *reg_p =3D exynos4210_pmu_regs;
> > +    unsigned i;
>=20
> your change seems OK but while you are here, 'unsigned' is considered
> harmful since more than a decade. why not use 'size_t i' since
> PMU_NUM_OF_REGISTERS is indeed an ARRAY_SIZE()?

It is a loop counter. I think "unsigned int" for loop counters is the
most common pattern - easy to understand the true meaning of variable.
I can expand it to "unsigned int" but that wouldn't change much...

Let's look at current style:
$ git grep "unsigned int i[,;$]" | wc -l
188

$ git grep "unsigned i[,;$]" | wc -l
92

$ git grep "size_t i[,;$]" | wc -l
114

=2E.. where do we go now?



Best regards,
Krzysztof

