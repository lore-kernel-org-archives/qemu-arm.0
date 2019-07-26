Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11737093wrv;
        Fri, 26 Jul 2019 03:34:13 -0700 (PDT)
X-Received: by 2002:a9d:68d7:: with SMTP id i23mr17877053oto.124.1564137253684;
        Fri, 26 Jul 2019 03:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564137253; cv=none;
        d=google.com; s=arc-20160816;
        b=CbyE4yYbieOu2iapQtMLpI0js8NAEZ2y2TdDJcO9Z/YP6KDGU6EaYS8UVhcwqLptxe
         b8+FNpaJJvyeMqmlYfUQzWWoz3qiLjLoVMJ/YMtKeeTrTYof5J1Sbi0xl0OELneCt/qX
         aIO9bR39okqXHQT3t1XdCr568FWuC8aIgDE2TQSqZnjyY8e8SzmyxUOZv1uRksWoMQAv
         MJsQdSN4WlJZ5dMJhTnoQlfLmP6a0etkjJVLduHDTw/0G4GSX+Hx+QtDbp4XARRkEKb/
         Au9RHnYdXNGP553Pt8VxUkK1apFp98Rl2ovB9jUOC3x/E8qOtVRuB74De6XnQgSK/AGA
         qLkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OoLRuocXcyae0c39AfRGFFWkG6eGTv2vwCCtYPEVV7Y=;
        b=PYH/mZWKBtNz4PRkXL9eSK7X8m95nq6iiZY1/81XNw9WdDfk8K4qifTNG2GVJ0fMRc
         IWxC/rIZGhCCIwT5ntheGLGZ9VObQHryhUgfZMdshNsBqYmpvSglM4+GuBSsMI6jUHe+
         kZndOenu7pkBq3pMV0Yf0GmN/vEObFBGbSL6rYjdLg+CaM6zjzjUtw/pjbwVXG5We1m+
         n3PQdwZ7PuePLzXxvou//k2vspOTHZQcxaS1J4mE0b4FRPd+EMmRrBZmOCW3U3d8kq3z
         3zztkPrCpc/r0Jt0QYvZwcr2GKilwtTQF5bLTFWWZVOg7SYZ8ytT7672z2mRPUad3WaI
         JUNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iM0KPVuq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t20sor27256266otq.132.2019.07.26.03.34.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 03:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iM0KPVuq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OoLRuocXcyae0c39AfRGFFWkG6eGTv2vwCCtYPEVV7Y=;
        b=iM0KPVuqOXCUwMVOHQkNDQk0jL1aDjxuz2N3JNymmtzQiM/c0suNjHmhtpfZH9hYHb
         LKXdpfo2vm4jpFEjBSu4TUi915Df6hIfUdowOgrtF//o9LuKSbKnq/cOGcH/FT1ksey0
         5idTtyr35a4sB+pbZqttCzBSZtLT1Pfo/BSwPxAKrdpIZezDl5WwyIBGKxCr2ZyG+5rA
         XCDxojeXbPQDksG3mwZgfoKqNEXCVLMq1lxtA6gU0HwmPO1cLajftGKG6sp3DohgmEEU
         xVy9WpGL3V+B36xbZZY7+20HNN122D1OyTCP+aBsyKGyzeDPsMoRvw5UhNH1Au4smYpl
         A6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OoLRuocXcyae0c39AfRGFFWkG6eGTv2vwCCtYPEVV7Y=;
        b=SeJLGgh+fk1QTWW8T1NOBBEfPAg5yWVeNO5uyEHdyOIAxa4FF8SFMzv8+aj4fULAH+
         xuywX5fN1tHseKyiX6SZAGKBmIJCrylf7N5t3S4ftLVkwQ94JFD8AQKBwzCNgmHsnS2T
         gTFeATuzsNn0bPRctvVnGCMkRxlzgcD4DvMb4AtjuhzdNx/dYm41cEH49i8i8fGG56Fa
         Ab26QLtwK1yjM9NVhwuM8YZzCwCm3xTOVV18tUIOBGgWoWy5V77zwjf2xEJwhakOZxC9
         cs6+fxS6gymuYHc55lCP5xT+b2zfreoKecX13sqDcHZshPwmo6qy/JcUQKapWsc6AB8D
         VO3w==
X-Gm-Message-State: APjAAAWOC98Y2eygwChs8oa9edgB1ukmQmxOLF8Qrc3+E05j7Pq7bLpR
	jOdxS/ci8xyUOTrtwwx6m/ASUftLP9etGXKxisk7MVBws0KdrQ==
X-Google-Smtp-Source: APXvYqw5MARY2qQ8WkEFlLREabgLfbbvcsqXA+W8g4Iy+qm5lQyVqZT0uzwcZvOA7UApbezemJl6zrK10BSvS5exFkA=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr21177301otk.221.1564137253030;
 Fri, 26 Jul 2019 03:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190726103010.31741-1-alex.bennee@linaro.org> <CAFEAcA9ioE_XcSuU_MXZAW=v-7Me6Nq_z9A830i+RswfNxGjcA@mail.gmail.com>
In-Reply-To: <CAFEAcA9ioE_XcSuU_MXZAW=v-7Me6Nq_z9A830i+RswfNxGjcA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 11:34:02 +0100
Message-ID: <CAFEAcA9q1=_faoFSJ0QFWuiN6h4WsOCK5LGfeo=OwO65vW6SSA@mail.gmail.com>
Subject: Re: [PATCH v4] target/arm: generate a custom MIDR for -cpu max
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: AW4hPObAqpf3

On Fri, 26 Jul 2019 at 11:30, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Fri, 26 Jul 2019 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> > While most features are now detected by probing the ID_* registers
> > kernels can (and do) use MIDR_EL1 for working out of they have to
> > apply errata. This can trip up warnings in the kernel as it tries to
> > work out if it should apply workarounds to features that don't
> > actually exist in the reported CPU type.
> >
> > Avoid this problem by synthesising our own MIDR value.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> > +        /*
> > +         * Reset MIDR so the guest doesn't mistake our 'max' CPU type =
for a real
> > +         * one and try to apply errata workarounds or use impdef featu=
res we
> > +         * don't provide.
> > +         * An IMPLEMENTER field of 0 means "reserved for software use"=
;
> > +         * ARCHITECTURE must be 0xf indicating "v7 or later, check ID =
registers
> > +         * to see which features are present";
> > +         * the VARIANT, PARTNUM and REVISION fields are all implementa=
tion
> > +         * defined and we choose to define VARIANT and set the others =
to zero.
> > +         */
> > +        t =3D FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
> > +        t =3D FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
> > +        t =3D FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
> > +        t =3D FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
> > +        t =3D FIELD_DP64(t, MIDR_EL1, REVISION, 0);
>
> Comment still says we set VARIANT but code says we set PARTNUM...

I guess we might also briefly mention why we set PARTNUM
("just in case guest code needs to distinguish this QEMU CPU from
other software implementations, though this shouldn't be needed",
or some such.)

thanks
-- PMM
