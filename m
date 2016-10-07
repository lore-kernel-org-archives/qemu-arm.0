Received: by 10.80.163.71 with SMTP id 65csp3810973edn;
        Fri, 7 Oct 2016 07:52:05 -0700 (PDT)
X-Received: by 10.55.135.6 with SMTP id j6mr20892038qkd.270.1475851925353;
        Fri, 07 Oct 2016 07:52:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t15si10287159qkt.124.2016.10.07.07.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Oct 2016 07:52:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsWUh-000374-2u
	for alex.bennee@linaro.org; Fri, 07 Oct 2016 10:51:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jonatan.okagao@gmail.com>) id 1bsWUc-000359-Bi
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 10:51:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jonatan.okagao@gmail.com>) id 1bsWUb-0007sQ-FR
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 10:51:22 -0400
Received: from mail-io0-x233.google.com ([2607:f8b0:4001:c06::233]:34688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jonatan.okagao@gmail.com>) id 1bsWUb-0007rU-6w
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 10:51:21 -0400
Received: by mail-io0-x233.google.com with SMTP id r30so49409589ioi.1
	for <qemu-arm@nongnu.org>; Fri, 07 Oct 2016 07:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=onugeVMI/qR0QmyORqEVidns0GtgX1U9YH3vemeKkFI=;
	b=d9T1ES6dXTRM6LFThmtcQhZMyBYi2bnVtcX0Swi1FMPeg2LHhTCsqUL73IyeAY0Bpy
	IR87NAj+Xal/anMZPl7Tgh1aDgjnFPM7ZHsEsiFJATkaTK9aCVnGg5ZrEyYwJcIjV2ga
	HtO1oi9R2hvH/LzB59rHAOyrdGsrcVxRNgcPWR6x1Wx2V0zBnjqnEUxY4S2zLSPF7p1n
	cKmaPcovAZXEOIBVU8sQpyDODAAl3JdqAza/s9efzOQnY5yzJI1kXdRFaz5m+AMV92Ou
	IAev4g+I/TL1ugzH8oPBcO1CuO4qx09z8tGGb+lPmJLYteZDh1rcXnadQ/UCqeOBgi49
	3gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=onugeVMI/qR0QmyORqEVidns0GtgX1U9YH3vemeKkFI=;
	b=M17fgsiQVSStXQVgq81MCzr40iXafyOgsT+VCyo6b56bWW2jj2Cmqjiw+zw45Q071g
	pH67QWEubD/oa7cQxQPXIwWYAXRopRtGd3SEy5tR3eDOczvbZMglF6FZ0saVs7XmFKcT
	yCov0OlCgExU7U3JgEWnTk8uGBTDKwYBUB2GCyF43XVsTL3dpa8AEV5DKS7MlZZP85tr
	Q9X22r4s3hFBzUQFxYruysXmcyPFsRxA0IymBgK8P1gUG7zXg9OR2MNz9voYOPgAL7wG
	7BQtVptaZE0fdOhmnxsv+BrBZ4a0HBNWctOhzCyQhMZNgHP2C9dCzzEZ2n4gOsRrT3Zb
	ekVg==
X-Gm-Message-State: AA6/9RnRY/ysIXMkGfn501Bm+HLUmAaLkeQolYCDIxKAT/nVIXBYwTQVSfd/CvxakWDHThTJYMOlWWi8JyL7vQ==
X-Received: by 10.107.161.81 with SMTP id k78mr24693869ioe.39.1475851879739;
	Fri, 07 Oct 2016 07:51:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.164.92 with HTTP; Fri, 7 Oct 2016 07:51:19 -0700 (PDT)
In-Reply-To: <CACOEKj0QS2wMT=+i9fM_rO5mK-6ihuJ=u9n_r8E=+uu2wsBZKg@mail.gmail.com>
References: <CACOEKj0QS2wMT=+i9fM_rO5mK-6ihuJ=u9n_r8E=+uu2wsBZKg@mail.gmail.com>
From: jonatan okagao <jonatan.okagao@gmail.com>
Date: Fri, 7 Oct 2016 15:51:19 +0100
Message-ID: <CACOEKj0KWpwmvsrUviC3yRJKBG7OddSJUmkpP7sjqGLWuYk_0A@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a1140fa12088a88053e478bc3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::233
Subject: Re: [Qemu-arm] Reading coprocessors registers and dumping physical
 addresses.
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wQdECTnWW7zk

--001a1140fa12088a88053e478bc3
Content-Type: text/plain; charset=UTF-8

Can anyone help me please?

2016-10-04 16:57 GMT+01:00 jonatan okagao <jonatan.okagao@gmail.com>:

> Hi all,
>
> I'm using qemu-system-arm and I want to read the values of coprocessors
> registers like (CP15,...) and to dump some physical addresses directly via
> gdb (gdb_stub).
> Is this possible?
> Should I modify the Qemu source code (especially the gdbstub.c) or is
> there an exciting solution for that?
>
> After a long search on the internet I only found the information that
> there is a method of using xml and target description, but I didn't find
> further information on how to do so !!
>
> Any help please?
>
> Best regards,
> Jonatan
>

--001a1140fa12088a88053e478bc3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can anyone help me please?<br></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">2016-10-04 16:57 GMT+01:00 jonatan okag=
ao <span dir=3D"ltr">&lt;<a href=3D"mailto:jonatan.okagao@gmail.com" target=
=3D"_blank">jonatan.okagao@gmail.com</a>&gt;</span>:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div>Hi all,<br><br></div><div>I&#39;m using=
 qemu-system-arm and I want to read the values of coprocessors registers li=
ke (CP15,...) and to dump some physical addresses directly via gdb (gdb_stu=
b).<br></div><div>Is this possible?<br></div><div>Should I modify the Qemu =
source code (especially the gdbstub.c) or is there an exciting solution for=
 that?<br><br></div><div>After a long search on the internet I only found t=
he information that there is a method of using xml and target description, =
but I didn&#39;t find further information on how to do so !!<br><br></div><=
div>Any help please?<br></div><div><br></div><div>Best regards,<br>Jonatan<=
br></div></div>
</blockquote></div><br></div>

--001a1140fa12088a88053e478bc3--
