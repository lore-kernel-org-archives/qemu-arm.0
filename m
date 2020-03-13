Received: by 2002:a0c:f8c8:0:0:0:0:0 with SMTP id h8csp1046208qvo;
        Fri, 13 Mar 2020 09:06:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs/WygGQCxeG9695mM1j30FT2dqgTTP7wbBBrWN4tfwCPFSG+HxzToCCC8wLrSWw8PmXRNV
X-Received: by 2002:a37:cc5:: with SMTP id 188mr6284093qkm.161.1584115560341;
        Fri, 13 Mar 2020 09:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584115560; cv=none;
        d=google.com; s=arc-20160816;
        b=MleDapayHmy46bp/Kbhf2nQ554sTMdzIsVIJYprTenZ1wscOFQDVmVrZLGVpG8nhFS
         kT3HiZnbiEApOQzvrRJUcobcdciO/6o5cVd7wiPlnjNTQ9Invv+/z5/gHMiaorkhbFX6
         9mO/J00trmvV+O0NxuLmwp8UJe1r9ibnQy82WxzTGiBeKG1b+09dV7Vx0WDn+PU22Chn
         hT1sB5OBWsc7Y0sWskVt6OCam0JtXxSbvfPXL/qUuU3TGvBY9PSX9AnzA6VNx3H1FNrv
         wNkqmezRbqqI/8riESEawm2KEj5kJcgYZDXBk0mlUTwzWX2e/JX19cXSCqXknfP43qev
         xT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=wZQoDpLygMdQKzla3lR2CAyFmBmJm4i3oZSp30uMkk0=;
        b=bzNnx/2a3Hij4y1GtZXYHh6MbCsQxuVtLZjDj5ezPwwMZZ0qwRGPIugC+CZiW0rnuV
         RqD4qE/vaEm9j1wv+gaW9nazXYmyy14V73wNUHc6HR8m2hWUc6eHiw2M43NLamYNybFE
         aVdirrYtPRCtybKsSHYCjol6OfkQ+K9YIkYD8ZGUS5YKtRcSnWOs/PMXiG0lyYgUcfGA
         gnlADaje4bp+CP05ZQNES/HjLK/jArXDvlZ2svjjMsBbP3ZDRl/4siWgvo8iPFYgIwdg
         1ERXP8UdbwgepYT/wuzMdy+W2u99m0Wr5WmAcBuVDA2Bw78ejm1snvJEH4yjrX4F6XZh
         B9tA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si4576940qvr.129.2020.03.13.09.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 09:06:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCmox-0005Yd-Qc
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 12:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1jCmom-0005UD-Db
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 12:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <remi@remlab.net>) id 1jCmol-0005Kq-4u
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 12:05:48 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:51078
 helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <remi@remlab.net>)
 id 1jCmok-0005EG-V9; Fri, 13 Mar 2020 12:05:47 -0400
Received: from basile.remlab.net (87-92-31-51.bb.dnainternet.fi [87.92.31.51])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 169F25FD2A;
 Fri, 13 Mar 2020 17:05:45 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC] [PATCH 0/5] ARMv8.5-MemTag disassembly
Date: Fri, 13 Mar 2020 18:05:44 +0200
Message-ID: <2232346.Qcd0NKbubf@basile.remlab.net>
Organization: Remlab
In-Reply-To: <886d0295-9fed-2e81-ce5e-54668755029e@linaro.org>
References: <2159383.tmy0LfLZHX@basile.remlab.net>
 <886d0295-9fed-2e81-ce5e-54668755029e@linaro.org>
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UcdB3XTFxIWY

Le perjantaina 13. maaliskuuta 2020, 17.49.06 EET Richard Henderson a =C3=
=A9crit :
> On 3/13/20 6:59 AM, R=C3=A9mi Denis-Courmont wrote:
> > For proper storage and checking of memory tags, MTE =3D=3D 2 would be
> > necessary. I have some code (on top of this RFC but not included) to add
> > the tag allocation logic. But I have no clue how to actually store the
> > tags in QEMU system mode at this point, so it's mostly dead code.
>=20
> I have implemented this, and posted version 6 yesterday.
> Peter gave you the link.

Yes, I'm sure it's feasible on the system mode. Physical indexing is not a=
=20
problem there.

> > In user mode, it seems impossible anyway, as tags are indexed by physic=
al,
> > not virtual address and QEMU cannot know which virtual memory address m=
ay
> > physically alias another within the user process.
>=20
> When I update my mte user branch, I will only support anonymous memory,
> since I cannot share my on-the-side data structure for tags between
> aarch64-linux-user processes, whether or not they are in a tmpfs
> filesystem.

Oh, absolutely: if you only support anonymous memory, then the user mode ca=
se=20
is easy as you can index tags on virtual address - much easier than system=
=20
mode in all likelihood. I already had kludgy implementation of that a year=
=20
ago, but that was not in a level of code quality that I'd ever submit publi=
cly=20
to an OSS project. It works fine as long as there's no named mappings in th=
e=20
tested code. My point was *only* that I can't think of a reasonable way to=
=20
implement user mode *correctly*, no more.

And given that it was neither correct nor fast, it seemed doubly questionab=
le=20
in QEMU. AFAIU, QEMU tries to optimize for speed anyway (hence that it does=
=20
not trigger SP alignment exception, for instance).

=2D-=20
=E9=9B=B7=E7=B1=B3=E2=80=A7=E5=BE=B7=E5=B0=BC-=E5=BA=93=E5=B0=94=E8=92=99
http://www.remlab.net/



