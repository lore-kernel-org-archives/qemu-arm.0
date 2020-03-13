Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2267148lfc;
        Fri, 13 Mar 2020 08:17:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuO6Q5IjbYvP+DXFuIfbrDGZpLw2L8vsZ85S8iFIYqaVU8Qo+Yh2Y0/1BMNZm6naAFZ9h1e
X-Received: by 2002:aed:38c8:: with SMTP id k66mr13172913qte.50.1584112637859;
        Fri, 13 Mar 2020 08:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584112637; cv=none;
        d=google.com; s=arc-20160816;
        b=emQQqfpv0oWsBi+z9A1utMWHMaQuh72Yf6r0ohWKzsQyN6bgk1DjGH1TWmGYPizu1U
         oWeIz4Q6wqdbC+BDybDXwuzfXRIAEXP896W1cEQTluCMEU+J13Y2aspr2YCFoyZAJkpU
         AzEVN6fXjmWxMjD8AAOJceWMBGcHdR52QAQ3fhmZMu1auj7W6Lwt4rJ6bs66CH/Dgnor
         lqVpGPdZMLwnE6+95PGa/WCEoCsojylfMe4Qjg2mI67NvV7xzu3msur8Qcw2GPRKCjYA
         wcwF4KuQNg/hLok3wOh/oXyZHt/VT8tiie5WmuPY+QhJsNNk/dKWJaWYFK2nq2zQK742
         U7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=De1I6C/X6XdJ4CS1YF5eb9P8yzhcS3Xr7HIk4b/gQ74=;
        b=rMlIIUHg5t2y37RhnSqV2B53jC23FUW6kJExmf4xJynWYrmtbr/KbsKoJmE60K1fd7
         +lZLsJ7TF4V/BRn+GQg6GFGFak3lrrPIxFimkAa4pn6eqAKdZY45kYPNReLCMn7xQgNa
         MX7pq0wUhoqyxXdMG+Kxx1DkOdFy/9iXZbjYMEwe8VVnU7XQc7VvAahCqM+r0fBqWK3D
         M64ngP1YfwYYjY3/3p/INf2nkYC5mTXak0VcEiso25UxMVjl+UWDBmq3agtIqBYKjmuD
         wr1+Gm94aELfs8AvcWDmdFK6FqOpE8vAsBjJHr1Fzthd/KU6KbpcleYyG9YVUGMmWTKy
         vbmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g24si5446469qte.107.2020.03.13.08.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 08:17:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCm3p-0002fn-6w
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 11:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1jCm3b-0002fP-EI
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 11:17:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <remi@remlab.net>) id 1jCm3a-00057S-4G
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 11:17:03 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:50552
 helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <remi@remlab.net>)
 id 1jCm3Z-000545-Tx; Fri, 13 Mar 2020 11:17:02 -0400
Received: from basile.remlab.net (87-92-31-51.bb.dnainternet.fi [87.92.31.51])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 8C15F5FB07;
 Fri, 13 Mar 2020 16:16:59 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: Re: [RFC] [PATCH 0/5] ARMv8.5-MemTag disassembly
Date: Fri, 13 Mar 2020 17:16:58 +0200
Message-ID: <3125680.9OkiO6kEAj@basile.remlab.net>
Organization: Remlab
In-Reply-To: <CAFEAcA_nGY4_UQ7jMdxuZXR=_rpVZVCAMX+UzEoFtSpcCVy9Dg@mail.gmail.com>
References: <2159383.tmy0LfLZHX@basile.remlab.net>
 <CAFEAcA_nGY4_UQ7jMdxuZXR=_rpVZVCAMX+UzEoFtSpcCVy9Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41d0:2:5a1a::
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TGjs0YJ1lCri

Le perjantaina 13. maaliskuuta 2020, 16.03.36 EET Peter Maydell a =C3=A9cri=
t :
> On Fri, 13 Mar 2020 at 13:59, R=C3=A9mi Denis-Courmont <remi@remlab.net> =
wrote:
> >         Hello,
> >=20
> > The following changes since commit=20
d4f7d56759f7c75270c13d5f3f5f736a9558929c:
> >   Merge remote-tracking branch
> >   'remotes/pmaydell/tags/pull-target-arm-20200312' into staging
> >   (2020-03-12 17:34:34 +0000)>=20
> > adds support for the ARM MTE compatibility subset (which does not seem =
to
> > have an official name) to QEMU user mode and system mode on "max" CPU.
> > This corresponds to MTE =3D=3D 1 in the instruction set feature field, =
and
> > allows running code with MTE instructions without actual tag storage.
>=20
> Hi; how does this interact with Richard's series for MemTag ?
> https://patchew.org/QEMU/20200312194219.24406-1-richard.henderson@linaro.=
org

It does not. I don't know about that seriers. The patches are part of the=20
patchset that lead to my PAuth fixes a year ago. At that time, only beta sp=
ec=20
was available, including obvious bugs (sysregs with duplicate opcodes),=20
suspicious things (TCO being EL3) and generally being a beta. I thus sat on=
=20
that part of the work until I now got time to rebase, clean and update to t=
he=20
released spec.

Meanwhile if there's a high-profile developer working on the same thing, I=
=20
guess there's no point for me to carry on.

=2D-=20
=E9=9B=B7=E7=B1=B3=E2=80=A7=E5=BE=B7=E5=B0=BC-=E5=BA=93=E5=B0=94=E8=92=99
http://www.remlab.net/



