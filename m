Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp680796wri;
        Wed, 6 Nov 2019 04:17:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqw7Ibr1MGC+NG7pntUrEWCONI1NbMXn7X3qi/mfp9qsy/Smm6FTmOjPPtB3la7Sop/NLUgo
X-Received: by 2002:a05:6402:4c5:: with SMTP id n5mr2309941edw.157.1573042657924;
        Wed, 06 Nov 2019 04:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573042657; cv=none;
        d=google.com; s=arc-20160816;
        b=O3T018tESDfYBpDLKxOzpXdE1QklD1sUXj8I1DtNnnmsmIhT/sIusY5s7Ael5rRgba
         l8i1NIFKB/pg+LqwQF/lBeO+E7fr/nw7jz9jg0jD+witz512433Hqm/o5Tck09X4aAUG
         rI/lh2zdm2DlHEknxjzegSgmF2S2sAMLBJ5guVEHC1E0svEg/e6hjQKaqGxVRCAEbuN4
         uKzv0/qW1qdRvbXNR5/fwZUVq1ofw6IGgmsTzAn1PZoqv+fQmwXNj1NDIDkP2RkPhksq
         OzNAMnToTGzlqpFzeZUD0wYRP3nQjn0SgDf590ZBCSIMU+KSPa1fqQ6ZumqXD9CA5DXt
         Hnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E5f7yJDEfCAgFVKUWkOfy4uXLIoQ6YyDDtEuUHAFD2k=;
        b=g0Wyf5HX5eX+LCtx2ljqwJXY+LjaJIK9YwBaK5Q28P1GGIruraCSU7Qk1+A96rVKs5
         a0zacJzu9LJEhOyyC+Y55sBEf8/TtQR+lGEIN6vtI8OKcCBPUVKDW8VReiALmEuzPrMn
         06abBc1YE+iiHz5GA/1EkYH+rDpsHW+kFIlJAAaWufTknWNEl7PgD7l5fjpcDkOcTPQz
         F4Djfl7xIhoU+MzUdLfEoAkKQ4hN1tZ5udAktlJ6MGQlJTl3sD4ddKyoFa5xZySbHPJD
         Z2+xkZordyW7YYNJYcYsyLk4XgSAPhlieI30a2s785i6yS6TaLcu/oPhrW7qhbm874E5
         E9+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hPEWmncY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a30si12402747eda.259.2019.11.06.04.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 04:17:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hPEWmncY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSKFl-0002i6-0N
	for alex.bennee@linaro.org; Wed, 06 Nov 2019 07:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wissem.yahiaouii@gmail.com>) id 1iSKF1-0002Ly-Vs
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 07:16:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wissem.yahiaouii@gmail.com>) id 1iSKF0-0000jU-0A
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 07:16:51 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:42156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <wissem.yahiaouii@gmail.com>)
 id 1iSKEy-0000i7-9h
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 07:16:48 -0500
Received: by mail-oi1-x22b.google.com with SMTP id i185so20730474oif.9
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2019 04:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=E5f7yJDEfCAgFVKUWkOfy4uXLIoQ6YyDDtEuUHAFD2k=;
 b=hPEWmncY4Dm6EXmoNdv7/UrK6+bhqIqm9kErPwrn+tQ/ijSHkbvWsnC/z2pAUNUw8Y
 OitroirT4MvuwVpUfJpY5TGJdNpYftU5jIx9yuqHXlhxiN9Kipv7ZebLLnqgJd04Q/t9
 mC0BUMlIsnct0bT+6YxEOztJN2hvvytDZQ4aNIkvMFsRB9Tf17pU064cAoj3vrDGy2Us
 LsxiJer6jkjYXkeOJSKM0ooXG2XvbIOJOtg2fnokbWXl38n4EXLgzYaHaksi3xBvCB8U
 UREtRyBbojrdeXKX/E6xflJ48pn/Y9SFDSgMDJLoRRahSgArUFhUkJjpGnzzidx0Xllq
 geQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=E5f7yJDEfCAgFVKUWkOfy4uXLIoQ6YyDDtEuUHAFD2k=;
 b=XTf6lIZK+bhK1P9PFWqI/X8Kjl1FtGKvFxEo523xchsqU7c+dytn8/8X52Nye/76U9
 d/uwF7iIiqUj0+rR6/jB+C5rFRN4c/rkGNG4vVIJdhX89SE++ylKSakC807PQE/g72KG
 t6SBWp5xsfw9aZWCjFkP+XUHOKVCu0b+W2a7e5aCP0OLd0fLSmh9146I7WSqrrwhvtAV
 HG5Q/wrHmRJ0pKUuf6cMXfe0M1qvz0NWnHirL3DBcWFE2GgMyJXRrEtYZy5oG7OYaCc5
 9LKIRROi0Kvkc2c1mC4/i3VCqeZpuOTCN+wbtQIM4/jKbx4GT0dUQ71RYKusPVwEMPgZ
 tkyg==
X-Gm-Message-State: APjAAAVHuaTiDPfWcZEDYYQGrpqNehxEjpUgq6hzuzitz02uVh6kv74T
 koPQiu1lEzkJUtk9JFT9ZRH0S6BAeLR4TU6XYGw=
X-Received: by 2002:aca:d8c5:: with SMTP id p188mr1872502oig.140.1573042607121; 
 Wed, 06 Nov 2019 04:16:47 -0800 (PST)
MIME-Version: 1.0
References: <CAA8B=UR4KOcSeYv2sKsf8mbbvjuZ_Eqiupk=H0JW6+SQ4uE=mA@mail.gmail.com>
 <CAFEAcA8=yvd_OadDZaa3Um2K4RTrrJ34ZdTXokEDfYk08F1Wqg@mail.gmail.com>
 <CAA8B=UTMXMOKsMjDQ3oCP1J8QdL+UXLM3Paf81w=E5sV=RDg=Q@mail.gmail.com>
 <CAFEAcA9w5be6HO+ghPHrJsy4KxhBZ1MNLdPOQ4kE4nHqFKneUg@mail.gmail.com>
 <CAA8B=URoKnQTZdQar_D-xrid-JoaF_mz-EYr0SasprPpvXznoQ@mail.gmail.com>
 <CAFEAcA9WYCmD+oGHtM=g8pxyCmYt=12NchojdtgPufQUwWFRpg@mail.gmail.com>
 <CAA8B=UTcsW7R6hskd312cH5=M6hqfWXrVKLW+WkVXvn5KsLoOg@mail.gmail.com>
 <CAFEAcA-jOxu1eZ1b47F5NtOouX0dPPWhb7zGLg25+SqM4wkjxQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-jOxu1eZ1b47F5NtOouX0dPPWhb7zGLg25+SqM4wkjxQ@mail.gmail.com>
From: Wissem Yahiaoui <wissem.yahiaouii@gmail.com>
Date: Wed, 6 Nov 2019 13:16:36 +0100
Message-ID: <CAA8B=UQN_cYkij5eYwhbefF0om08R+BO2Zvj0bT3Kex_Sx79ww@mail.gmail.com>
Subject: Re: Aarch64-qemu
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d069550596ac8562"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22b
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hcsUY5li18MW

--000000000000d069550596ac8562
Content-Type: text/plain; charset="UTF-8"

Hi Peter & Qemu Team,


Actually, I also tried it after you send me the documentation. but it will
be also an segmentation fault. Here, it a screenshot on how I did use it.


Thanks,

On Wed, 6 Nov 2019 at 12:55, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 6 Nov 2019 at 11:44, Wissem Yahiaoui <wissem.yahiaouii@gmail.com>
> wrote:
> >
> > Hi Qemu team,
> >
> > As I sent you in the first email, that the SVE specific registers in
> aarch64-qemu results an core dumped/segmentation fault. I Tried the
> ZCR_EL1, ZCR_EL2 and ZCR_EL12, it compiles fine with the gnu toolchain, but
> it doesn't run in qemu. I need to simulate the length check at run-time, I
> am using Qemu but apparently I am missing some step/s.
>
> You need to use the prctl() that I suggested, you cannot directly
> access any of those registers from userspace. If you have a
> simple test program which tries to use the prctl() but does not
> work then I can have a look at what is going wrong.
>
> thanks
> -- PMM
>

--000000000000d069550596ac8562
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Peter &amp; Qemu Team,=C2=A0<br><br><br>Actually, =
I also tried it after you send me the documentation. but it will be also an=
 segmentation fault. Here, it a screenshot on how I did use it.=C2=A0<div><=
br></div><div><br></div><div>Thanks,</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 6 Nov 2019 at 12:55, Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Wed, 6 Nov 2019 at 11:44, Wissem Yahiaoui &lt;<a href=3D"mailto:w=
issem.yahiaouii@gmail.com" target=3D"_blank">wissem.yahiaouii@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; Hi Qemu team,<br>
&gt;<br>
&gt; As I sent you in the first email, that the SVE specific registers in a=
arch64-qemu results an core dumped/segmentation fault. I Tried the ZCR_EL1,=
 ZCR_EL2 and ZCR_EL12, it compiles fine with the gnu toolchain, but it does=
n&#39;t run in qemu. I need to simulate the length check at run-time, I am =
using Qemu but apparently I am missing some step/s.<br>
<br>
You need to use the prctl() that I suggested, you cannot directly<br>
access any of those registers from userspace. If you have a<br>
simple test program which tries to use the prctl() but does not<br>
work then I can have a look at what is going wrong.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000d069550596ac8562--
