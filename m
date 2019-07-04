Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2011371wru;
        Thu, 4 Jul 2019 06:08:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwADk+Jfv6xx8jfmraDb3oJeuwe7EFiOqmiOUqHJlXh5retX9NIZxfJcaOWJFLt2USGIPSD
X-Received: by 2002:a50:9107:: with SMTP id e7mr48897660eda.280.1562245739216;
        Thu, 04 Jul 2019 06:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562245739; cv=none;
        d=google.com; s=arc-20160816;
        b=X/viyMxK898UIIT6ENGAq8MwFWD6+BUcAgPIcz+XeCJ4/4Amgh4ZrFhuu+IIRAiBZw
         pEvD47ZnIzfsCZLh1bXJUfBoaz4cCp28YWfkQBVCt1nb1KhDswJgUQxTTSyvHRMZM43S
         DknSONZzz1ajqo/FlElfTZ04NfBE+JneiEDaMiC7T00Rsa4secwsdJharPEEHZhQ/zkc
         4MQp2OOwZyjBbBRgXpC9vZ/U9v9cxbcOpdp1HyV370qAsAchOux6AMYrn+iI0FG0Og38
         UZ6nwOCDQRyOPwb6iuGFCx5xjmKaSVXxa+BidZCLtHqWw6bNbDyl4wo6HzbYdRDdLlNn
         3aRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Rs6zRJeUQE19QRdvqv0nWAusH67o0A4RvKI6AFFZ8No=;
        b=WX+7myDafE/+vSiU+a7T5dj4J3LwnwScYYH09jnDUMETvzh+tUNqsiG85syVXerKTK
         l/jT3duL6HrdTYvFeO5ZoidHNP7/OKhqTybV/ms9oNXPziR4Xc5lQd7uO7IZSDiGjQD3
         GrNsz1rRitxMubSZ2xl4QaDb8iNED8FxZtXBLulhU+dwbIcxw6zID9f9YNuww+UEW0lZ
         ItHMJO3tVtaQSuxQtOS2qiicoLBWWoQ19lfbQ9m226MHBPI3KJJ5PMauK0X9rp7F0aE8
         qjB0sUFaElhABWiIQD6EkWPnjnAm6RWNVkk5ZW/yOKURm5j7cDd8nliiB7Sj0m7gQQXY
         eRWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gNzF7Uce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si4776849edd.121.2019.07.04.06.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 06:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gNzF7Uce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hj1Tu-0003Rd-BX
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 09:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hj1TZ-0003PY-Kn
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 09:08:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hj1TX-0007dI-QA
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 09:08:37 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38578)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hj1TW-0007bu-DA
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 09:08:34 -0400
Received: by mail-ot1-x341.google.com with SMTP id d17so5920723oth.5
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2019 06:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rs6zRJeUQE19QRdvqv0nWAusH67o0A4RvKI6AFFZ8No=;
 b=gNzF7Uceon3eGq9lxRj8H2MXTUSXqKUOjQKsPu0rOn2FEzwVsKYVgLb7y9Vbtq+Ft6
 zMyiHc2R7etcKgyDlf7eB9u1TcZhtnIk2MNIIzQq3nswlSf36gteUG7lJSuyIK1wFL+b
 uixJ1JuuMbEf/lLHhqwPL/DqRSkR3jYH202D4hXsQxC79bCRp7Mf5JALSml1D67wAibK
 q31gA51gktJVzr26t5FSuXHOGeIeCKWNZQdbth32GMnNHAJCWO3UgYIYMf/KIGZ+hp4j
 mHyDXj7QB5alq3EsxcyZBULtbB0qS6w9rtjqdr8DAFoWuMGct9MBNprTZaVVHL2dHiXP
 09cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rs6zRJeUQE19QRdvqv0nWAusH67o0A4RvKI6AFFZ8No=;
 b=V/Mgk/Z6vRH5EWWlIiPoTx/xm1D9sNXj8+yVfnZoPy3KPB7b/ckEQWoho8a0qnqG8M
 2ZaRAvprtBQKZyNDPYJ7FckHrNbuo6f2nRNJjw8OucCm/zVo71MDGUo10J+i2+R4aLMs
 F06J0SmAYzBhe2cALO51FmRn6r+MpVeDBj0m13Vw+A7jvuddXPziIMm+fGahS8THmbK4
 eKdq1SropMXhP0J1QV+e1f3qj3qytaNEzWOObHVLUG8rWbnmYOyOSGg1DxVOdY2n2e/S
 yNpxF7MrRnmdmghO53uzaBTsZwR1/e8Zf26uOjc4W7+X/8TZyai16Nm6LQzwD4/gYZsM
 Cg/w==
X-Gm-Message-State: APjAAAVNFOgovLWqjCeiPWKXhvX6eNH/s7039cGHqckM3Ol+YHAqhSk2
 ZZYSYT7qyKA2VyfVmh+rVKGervbRY+7E/upUueeI+w==
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr11409364otk.221.1562245712526; 
 Thu, 04 Jul 2019 06:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-4-clg@kaod.org>
 <CAFEAcA_wCFE0BL_LjF+04MBPa2XnVgCKk4SP4nPrBjrcjmNVVQ@mail.gmail.com>
 <CACPK8XfdqDARHV4TupC+c-qsgscOn4kWjtYdpdR+GxOZQzNNMA@mail.gmail.com>
In-Reply-To: <CACPK8XfdqDARHV4TupC+c-qsgscOn4kWjtYdpdR+GxOZQzNNMA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2019 14:08:21 +0100
Message-ID: <CAFEAcA8W6moG+dPOpPazEKFXYg3Gp0COrks1uYz94hn9HHeV5A@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v2 03/21] hw: timer: Add ASPEED RTC device
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ak4sOyaigWFO

On Thu, 4 Jul 2019 at 08:49, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 2 Jul 2019 at 19:19, Peter Maydell <peter.maydell@linaro.org> wro=
te:
> >
> > On Tue, 18 Jun 2019 at 17:53, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> > >
> > > From: Joel Stanley <joel@jms.id.au>
> > >
> > > The RTC is modeled to provide time and date functionality. It is
> > > initialised at zero to match the hardware.
> > >
> > > There is no modelling of the alarm functionality, which includes the =
IRQ
> > > line. As there is no guest code to exercise this function that is
> > > acceptable for now.
> > >
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > Hi; Coverity complains about this function (CID 1402782):
> >
> > > +static void aspeed_rtc_calc_offset(AspeedRtcState *rtc)
> > > +{
> > > +    struct tm tm;
> > > +    uint32_t year, cent;
> > > +    uint32_t reg1 =3D rtc->reg[COUNTER1];
> > > +    uint32_t reg2 =3D rtc->reg[COUNTER2];
> > > +
> > > +    tm.tm_mday =3D (reg1 >> 24) & 0x1f;
> > > +    tm.tm_hour =3D (reg1 >> 16) & 0x1f;
> > > +    tm.tm_min =3D (reg1 >> 8) & 0x3f;
> > > +    tm.tm_sec =3D (reg1 >> 0) & 0x3f;
> > > +
> > > +    cent =3D (reg2 >> 16) & 0x1f;
> > > +    year =3D (reg2 >> 8) & 0x7f;
> > > +    tm.tm_mon =3D ((reg2 >>  0) & 0x0f) - 1;
> > > +    tm.tm_year =3D year + (cent * 100) - 1900;
> > > +
> > > +    rtc->offset =3D qemu_timedate_diff(&tm);
> > > +}
> >
> > because the tm_wday field of 'struct tm tm' is not initialized
> > before we call qemu_timedate_diff(). This is a false
> > positive because the "read" of this field is just the place
> > in qemu_timedate_diff() that does "struct tm tmp =3D *tm;"
> > before calling mktime(), and mktime() ignores tm_wday.
> > We could make Coverity happy by using a struct initializer
> > on 'tm' here; on the other hand we don't do that anywhere else
> > which calls qemu_timedate_diff(), so maybe I should just mark
> > this a false positive?
>
> I don't have an opinion on which option to take. Perhaps mark it as a
> false positive?

Yeah, seems reasonable.

-- PMM
