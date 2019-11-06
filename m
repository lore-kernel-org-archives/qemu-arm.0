Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp645823wri;
        Wed, 6 Nov 2019 03:45:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqwAxTnRCYEMy5Dn0bjDsyT2r4EisCnGJxSImEeclhw+FzQ13FhXDIJp4fVNDm2asTEEKHC3
X-Received: by 2002:a50:898a:: with SMTP id g10mr2107465edg.191.1573040701710;
        Wed, 06 Nov 2019 03:45:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573040701; cv=none;
        d=google.com; s=arc-20160816;
        b=vBC2Q9QmPzCKcQeRowRm6cQgL8/u7Eay2tHl6b7wyvDC0RDMIjHK/WYgsT693grbsq
         rb7RLy6ravySoqaGO2aveA0EvRCHK21uUMp5JbyZGxN5EAi6JCxQqwAQRmBhWfba/3zw
         3d7GMKBj1fCS8ML/wWn1pdx5nIUTIZUuuEpVxt8C3bIN7KhLyBKsU0XBQRZIfgZ7n3b4
         LGbSrQlohVf0rN9hUIq5CQKBwEdmoCp5YPgkufHrdokaSxOEKXhVSw89ka9zNvXiSQkf
         V13kHw6ryYpdoXL+YQAk4YRzHvdMHJJ/uECPzLuvUqVBlsXhx1t5k/KcFsOIIhur8Mri
         UFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4pq83KGYtKS9rL50++ANLJjTm68JHUeol29cCbTd20=;
        b=h5f9bjvDVCAC3oiDD4eCAT+xtFtupbo3z8WihG9uHNbgXF3841XtUg12tcBG7uQ98i
         E5G1Vm3f8ajvRMdVQQMGCb+IvVTUgvkONFJZVeZYyiUb77vrXv0CZqxCkAy4cvRJPABq
         X8hltejDKIKbmtVBVoW+nEAxzpiqOcwdB94O5SPkodiW/AV5fGoELInBPVDy7CzqvIFv
         /nSJm+dwUCkdDfrT/sstqHr9DztRMB15lJHtzlmhiydjY4quafPGSQjc64DM5W+eCoY9
         0w4v1VIJRdkVumW6k5BXpjjjpXTBkmkq3To/YObxfRi1tV8Kp7M/mfYaRjHZPcgJxig3
         HJ1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sSBA5UwH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si11807901edc.246.2019.11.06.03.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 03:45:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sSBA5UwH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSJkC-0001Cg-1K
	for alex.bennee@linaro.org; Wed, 06 Nov 2019 06:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wissem.yahiaouii@gmail.com>) id 1iSJjx-00017I-Ru
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 06:44:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wissem.yahiaouii@gmail.com>) id 1iSJjw-0006Uq-OD
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 06:44:45 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:43722)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <wissem.yahiaouii@gmail.com>)
 id 1iSJjw-0006Si-G6
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 06:44:44 -0500
Received: by mail-oi1-x230.google.com with SMTP id l20so8577118oie.10
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2019 03:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=z4pq83KGYtKS9rL50++ANLJjTm68JHUeol29cCbTd20=;
 b=sSBA5UwH8hgNhGn40jy9Vtj1VHAxclX3Yy0c0uBS9P1l6NTYWpkmVmMkvNMKjXz+ED
 h7GJge3TKO9dFsRIr6UBlBEyzEusMKR68RN0hYcEOjWXSDcKUEC22usbehByWAqf63HN
 /+jpaZFu/U2wAOaZ5jVNouByz+aNqcgnrQGvyleyleyXcK0nUU3faVHeDqERoAOUf9Xk
 ENSUiQu3XAs3qKMMX+hHEgBx7u4wdoLL1bOyT+wypj9M+E0fc2eJ0MuQ67jybe0HTT35
 /ED6gP3WaatnhdNicQ9Oc6bjjyNsBkom7aBjFcpnDIBOR4lpGZF+O9bFwSdk/wL2gylG
 ZX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=z4pq83KGYtKS9rL50++ANLJjTm68JHUeol29cCbTd20=;
 b=DNyPDU0WyY+pvyIZgGfb3bDDUynsB6iAW4+f0JOALFJowCsqg8OzxJhITfwDsH6ZTO
 jX3cEBPwB0sqqOrCwxa+GCtAyjNESFRuGf+GtLUs7iCarbj38dOEn2ieIP+e1rfqp3Bp
 mUBeuOk33mRpSxw5AoWGCfMktmgGoenr9Yv7pOpP+VAaihUD/CNir/r2pBsHypRLCdm+
 BFPp02LIMB/ovmvVaNUyqsQJ01VsbL7+dKViDZ1NHflwjst/2XcSvmfDjykLgf6NEdID
 gwgZoBGHMAJ6yGFHYWIzeQ0Xk91CqZE/gL/A+Ib1jZnQzhnMq4q17joQ1kjEZq+l+j4o
 hlMg==
X-Gm-Message-State: APjAAAV+KzOXNO1kt/U1Bfx+rktZ66n++GrLftJXyVVLsRpgoghSRW20
 uZH4/vfTMUgTKV/JyP6pF99SZyWqoGaHEvjIpHs=
X-Received: by 2002:aca:d8c5:: with SMTP id p188mr1754733oig.140.1573040683135; 
 Wed, 06 Nov 2019 03:44:43 -0800 (PST)
MIME-Version: 1.0
References: <CAA8B=UR4KOcSeYv2sKsf8mbbvjuZ_Eqiupk=H0JW6+SQ4uE=mA@mail.gmail.com>
 <CAFEAcA8=yvd_OadDZaa3Um2K4RTrrJ34ZdTXokEDfYk08F1Wqg@mail.gmail.com>
 <CAA8B=UTMXMOKsMjDQ3oCP1J8QdL+UXLM3Paf81w=E5sV=RDg=Q@mail.gmail.com>
 <CAFEAcA9w5be6HO+ghPHrJsy4KxhBZ1MNLdPOQ4kE4nHqFKneUg@mail.gmail.com>
 <CAA8B=URoKnQTZdQar_D-xrid-JoaF_mz-EYr0SasprPpvXznoQ@mail.gmail.com>
 <CAFEAcA9WYCmD+oGHtM=g8pxyCmYt=12NchojdtgPufQUwWFRpg@mail.gmail.com>
In-Reply-To: <CAFEAcA9WYCmD+oGHtM=g8pxyCmYt=12NchojdtgPufQUwWFRpg@mail.gmail.com>
From: Wissem Yahiaoui <wissem.yahiaouii@gmail.com>
Date: Wed, 6 Nov 2019 12:44:31 +0100
Message-ID: <CAA8B=UTcsW7R6hskd312cH5=M6hqfWXrVKLW+WkVXvn5KsLoOg@mail.gmail.com>
Subject: Re: Aarch64-qemu
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000022b8340596ac130a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::230
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
X-TUID: 7zIcnC9TaQPG

--00000000000022b8340596ac130a
Content-Type: text/plain; charset="UTF-8"

Hi Qemu team,

As I sent you in the first email, that the SVE specific registers in
aarch64-qemu results an core dumped/segmentation fault. I Tried the
ZCR_EL1, ZCR_EL2 and ZCR_EL12, it compiles fine with the gnu toolchain, but
it doesn't run in qemu. I need to simulate the length check at run-time, I
am using Qemu but apparently I am missing some step/s.

Can u please help me to achieve this task?

Regards,
Wissem Yahiaoui
Student at Technical University,




On Wed, 6 Nov 2019 at 10:59, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 5 Nov 2019 at 21:39, Wissem Yahiaoui <wissem.yahiaouii@gmail.com>
> wrote:
> >
> > Sure, I will do that. Actually it was my intention but i didn't find the
> link and it idn't possible to raise an issue in github. Can u please
> provide me a link?
>
> I'm confused, this is email, there are no links. Just
> use reply-to-all rather than reply so your replies go
> to both the person whose email you're replying to
> and also to the mailing list. (You'll have to go back
> and redo a reply to my original email which went to
> both the list and to you.)
>
> thanks
> - PMM
>

--00000000000022b8340596ac130a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Qemu team,=C2=A0<br><br>As I sent you in the first=C2=
=A0email, that the SVE specific registers in aarch64-qemu results an core d=
umped/segmentation fault. I Tried the ZCR_EL1, ZCR_EL2 and ZCR_EL12, it com=
piles fine with the gnu toolchain, but it doesn&#39;t run in qemu. I need t=
o simulate the length check at run-time, I am using Qemu but apparently=C2=
=A0I am missing some step/s.=C2=A0<div><br></div><div>Can u please help=C2=
=A0me to achieve this task?=C2=A0</div><div><br></div><div>Regards,=C2=A0<b=
r>Wissem Yahiaoui<br>Student at Technical University,</div><div><div><br></=
div><div><br></div><div><br></div></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 6 Nov 2019 at 10:59, Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Tue, 5 Nov 2019 at 21:39, Wissem Yahiaoui &lt;<a href=3D"mailto:wis=
sem.yahiaouii@gmail.com" target=3D"_blank">wissem.yahiaouii@gmail.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; Sure, I will do that. Actually it was my intention but i didn&#39;t fi=
nd the link and it idn&#39;t possible to raise an issue in github. Can u pl=
ease provide me a link?<br>
<br>
I&#39;m confused, this is email, there are no links. Just<br>
use reply-to-all rather than reply so your replies go<br>
to both the person whose email you&#39;re replying to<br>
and also to the mailing list. (You&#39;ll have to go back<br>
and redo a reply to my original email which went to<br>
both the list and to you.)<br>
<br>
thanks<br>
- PMM<br>
</blockquote></div>

--00000000000022b8340596ac130a--
