Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1463291lfc;
        Tue, 3 Dec 2019 04:54:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqxP8NzTFdU5KYpmFChg9OhA7mIJgj44p+h+DHmGBbSV+bXgNsxfOy9vuONRuz9BXVrhBOnK
X-Received: by 2002:a0c:8445:: with SMTP id l63mr4824996qva.161.1575377667915;
        Tue, 03 Dec 2019 04:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575377667; cv=none;
        d=google.com; s=arc-20160816;
        b=j0rTn5r6FdqbS+V2n3a0ghkSZwgxMTcahyRRuFYxJsxkAWFGBjQy2DZmPxVCe7Jfxq
         EzMdJt4rPa+hr6KIRjAheDB7v1ci2TnJa16pe3NHYPR0aYFeK8dvkpMklIJiOkseg+Ly
         TqzJc7XFDxP1DM66MjE83kyAl2W6QT437noFLiWsiUO3Gyoo77I3tdxex9atYVqqy6x6
         zoQ0oZGjGuA3ewfn6dA6p+Ka5zanxXRo6LkWv6GJcGluBAK6r1S90Sr2hT17euoyn+dB
         zGwJMXGh2/NgTEiskzWq6/hXsSRRGHU5UtX/ZoVRu9gYCe9tjtrnFTnfvQ/78Lps9uqi
         HJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:from:date:references:in-reply-to:message-id:mime-version
         :user-agent:dkim-signature:dkim-signature;
        bh=ACyzvu8ZpyXA+VrmBvFkqbpxOAuy1IEd+giaDT4RTUU=;
        b=0ELL0Fdzxyx5qAJ9rldhdjkCXGZTS9aQWxDK0EOUwSh4db1ABZk8o+A9RUdzJhWedA
         mvVqTCrnFFyriIMGrEbT5DqEZacnCdY6fTyHlNxZzewIVJh3SKJTXuXKcyTrC661Po03
         LIzOoT3BTaQL/P5mm1hQMvCFhUniUUVoSya2MCD41CKqQ81WxwYePGiTjNJ8vCU3LimM
         KAixWr7oAp08f+qroUNgSd9Qe6sJcMMMHPBjwucWnr4EN+HKSpRdfUbuypYi5Uu/AH6D
         073T9wAGHt9HjW3z2DBnCfLN4HQD3Wqwj05Fkv5QOGVzxYzjgHAxLQ57/JhIMFGDJdGI
         70zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=mtJL4cwM;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=Xq592oAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g36si1042996qta.207.2019.12.03.04.54.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 04:54:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=mtJL4cwM;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=Xq592oAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic7h5-0003vd-K1
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 07:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45207)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ic7ab-0002El-9z
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:47:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ic7aW-0005Ld-Vb
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:47:34 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45533)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ic7aW-0004x5-4l; Tue, 03 Dec 2019 07:47:32 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 77D5A223CC;
 Tue,  3 Dec 2019 07:47:26 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 03 Dec 2019 07:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=ACyzv
 u8ZpyXA+VrmBvFkqbpxOAuy1IEd+giaDT4RTUU=; b=mtJL4cwMAKcQfuAhUeg0G
 I48vGdUdfrMLeBwdL0xpQLX0rpC8xdgfRF3DiePAiDJN/HerMWiIlJ8E3tA1uFeY
 D5N/2N+vu9G2fepnub8Vo/esgIoEr9vZuEQREgOdCYDr77nyhEx7wte6YeYtlcGU
 U5IW5EYGK9TcdjOwq6det43kh2e2wf+aK90B3B5vLBRgJyJ6zV4CfIFgDi8YMc/t
 kcuTf16G38dX7rp2BhlXkOT3PMZCsIa8Yhj+qMlWdYhGt6Tqriou24nYVQVdZqTW
 n8YOo7WQ+Gbp92/vy7YD8sDFMMTpLWPeB5Dzwu5Gt1eJv/46IRP/vlQFvfel9/ma
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=ACyzvu8ZpyXA+VrmBvFkqbpxOAuy1IEd+giaDT4RT
 UU=; b=Xq592oAbWL8is3ySXBuzMXG7fILlblARzoO3uDhxow79/26coJ/+gMZX8
 AFmJYGpMkGFhS+V6KHKYkzfvi+hVE472hddL2TOfpwC4LEackCuxJ7pnhy4QHl7o
 nNo5TAh/+NFFY2+Fo2k8P7Y8G8W6394xatiolsNPqFQiSS5rxKUNYruegs4IyeH3
 Fhr1mzby1oAqKmxSacpUBz48TbK5lqVh01Krsm3Kg1a3mhsYxfu4gNREAjJLuO4A
 nKQigtSF0mt4xogw/nRWZinmeTT5ZNgBPwfcB5ADkjD0siK26//jeOdp0L+JD5RP
 W6tcOU1hutzTw2Bpb4Q3TuibYtysw==
X-ME-Sender: <xms:XVnmXVtuODptq35HzzbnZWVOREJ_lt05ob6dtb-Buuwwrs2sZIQ-qQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejjedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:XVnmXd0VReQaErilutzjD8OIMbwyzsn4wm9nnCEiI1FBTLU7humBsw>
 <xmx:XVnmXbVJpNLqhfq3C94FRwtnanEHNCiNaqeIETB3_cL-Lh47g7Oamw>
 <xmx:XVnmXdbEZ18F5iHfXWUzjkD16Vh9zoGRhGDVmiKmkAEINqLjpXtJ8A>
 <xmx:XlnmXd7ff-kjJ_nBw8fCAnJaCzLmekYFd2YpZJget5llmBAoD1P9gw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7DA3DE00A2; Tue,  3 Dec 2019 07:47:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-612-g13027cc-fmstable-20191203v1
Mime-Version: 1.0
Message-Id: <4e90d36d-aa13-441f-9298-56f83a5bff6a@www.fastmail.com>
In-Reply-To: <283c152b-b1c7-551e-bec0-c087b14de996@redhat.com>
References: <20191203041440.6275-1-andrew@aj.id.au>
 <20191203041440.6275-3-andrew@aj.id.au>
 <283c152b-b1c7-551e-bec0-c087b14de996@redhat.com>
Date: Tue, 03 Dec 2019 23:18:59 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 2/4] target/arm: Abstract the generic timer frequency
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 66.111.4.26
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: naja/YmPIrF2



On Tue, 3 Dec 2019, at 16:39, Philippe Mathieu-Daud=C3=A9 wrote:
> On 12/3/19 5:14 AM, Andrew Jeffery wrote:
> > Prepare for SoCs such as the ASPEED AST2600 whose firmware configure=
s
> > CNTFRQ to values significantly larger than the static 62.5MHz value
> > currently derived from GTIMER_SCALE. As the OS potentially derives i=
ts
> > timer periods from the CNTFRQ value the lack of support for running
> > QEMUTimers at the appropriate rate leads to sticky behaviour in the
> > guest.
> >=20
> > Substitute the GTIMER_SCALE constant with use of a helper to derive =
the
> > period from gt_cntfrq stored in struct ARMCPU. Initially set gt_cntf=
rq
> > to the frequency associated with GTIMER_SCALE so current behaviour i=
s
> > maintained.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   target/arm/cpu.c    |  2 ++
> >   target/arm/cpu.h    | 10 ++++++++++
> >   target/arm/helper.c | 10 +++++++---
> >   3 files changed, 19 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 7a4ac9339bf9..5698a74061bb 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -974,6 +974,8 @@ static void arm_cpu_initfn(Object *obj)
> >       if (tcg_enabled()) {
> >           cpu->psci_version =3D 2; /* TCG implements PSCI 0.2 */
> >       }
> > +
> > +    cpu->gt_cntfrq =3D NANOSECONDS_PER_SECOND / GTIMER_SCALE;
> >   }
> >  =20
> >   static Property arm_cpu_reset_cbar_property =3D
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 83a809d4bac4..666c03871fdf 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -932,8 +932,18 @@ struct ARMCPU {
> >        */
> >       DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ);
> >       DECLARE_BITMAP(sve_vq_init, ARM_MAX_VQ);
> > +
> > +    /* Generic timer counter frequency, in Hz */
> > +    uint64_t gt_cntfrq;
>=20
> You can also explicit the unit by calling it 'gt_cntfrq_hz'.

Fair call, I'll fix that.

>=20
> >   };
> >  =20
> > +static inline unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
> > +{
> > +    /* XXX: Could include qemu/timer.h to get NANOSECONDS_PER_SECON=
D? */
>=20
> Why inline this call? I doubt there is a significant performance gain.=


It wasn't so much performance. It started out as a macro for a simple ca=
lculation
because I didn't want to duplicate it across a number of places, then I =
wanted type
safety for the pointer so  I switched the macro in the header to an inli=
ne function. So
it is an evolution of the patch rather than something that came from an =
explicit goal
of e.g. performance.

Andrew
