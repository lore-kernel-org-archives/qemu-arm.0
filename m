Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1127267wrt;
        Fri, 25 Jan 2019 22:36:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4moAgeS8RyC4fY9o7k18Whpo4STzpTda908QqiSLRByVOUAajkUerr4domcOSxdEjm2XZl
X-Received: by 2002:a5d:548d:: with SMTP id h13mr13401388wrv.80.1548484589403;
        Fri, 25 Jan 2019 22:36:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548484589; cv=none;
        d=google.com; s=arc-20160816;
        b=vwB0csESaG7mCNRG3Y7QlHhpjNWSM9z+fKEmBKppDQiLNhiTVlPe4zIM49qm+R2U7T
         vKPO/EsHDOPh9RoYmxvntTR73FFjWJTfE56pCj+ydSGPp62OheXYRr58gU0WqjSHIunm
         xha+dBgKF/Hyho6nHa1QUUcJUBXPJYWA3LWmkArtJyIRX6jdjnf9R4tuI6T/o8dGIRT2
         qdMmKe5v390rKNR/OUIsFzZzAcoHceJ21t+PqbV6mzP0YomYJgeyIpZC0eDj5+37SyEm
         oZjbYFZCRJE0huVdhw7jnrV0r40JKPCZhbQ16AOTXDnNVRHwSDWlZFsPqorVuP/9vmLo
         q5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :organization:message-id:date:to:from;
        bh=SgjCaAPcjHl5H5bK7ejRsWxPdeopYy4mLAdS0QqNeTA=;
        b=YCKiUvoIyYRFND6neXw8qGDX2NuZiSattqc4N0gN/C/90RCLAR6Gur37afUMl5/+fG
         veSD800Eaagi6xNrFcpjA7w7koSByz9bkwk3MIbBVxDWeKS0qd5prst89TlSjVUOSfsY
         16HjNJk62HqieW5j4QCdaXFSv5VIk5mvpmWguYZl1swWoahyPBe+WU4v31g1uihN6nWY
         3dczQytOIQdrR6W9jGA5vk1JPqzYA5rVEs1GiCdLX4I5u5VdMbaz26C/ZVkq3OqdLM7M
         kD7bs6/fEsS0o5nL7rfkYxmFba+RU71x7tp0/ZzKSXEL3opaijwZJx9WttV5kZ7pEsPd
         NdWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si41715858wmf.11.2019.01.25.22.36.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 22:36:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnHZs-0001MR-Gq
	for alex.bennee@linaro.org; Sat, 26 Jan 2019 01:36:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gnHZc-0001M8-0I
	for qemu-arm@nongnu.org; Sat, 26 Jan 2019 01:36:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gnHZa-0003V2-P3
	for qemu-arm@nongnu.org; Sat, 26 Jan 2019 01:36:11 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:48014
	helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>)
	id 1gnHZa-0003Sa-DO; Sat, 26 Jan 2019 01:36:10 -0500
Received: from basile.remlab.net (dbfyyyyy6f5dmhghlbr-t-3.rev.dnainternet.fi
	[IPv6:2001:14ba:900:0:1a26:46a3:14c9:bbf])
	(Authenticated sender: remi)
	by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id E61F45FA43;
	Sat, 26 Jan 2019 07:36:05 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Date: Sat, 26 Jan 2019 08:36:00 +0200
Message-ID: <1738864.GFcTaivyIR@basile.remlab.net>
Organization: Remlab
In-Reply-To: <02a680e1-c20c-2ecb-2926-6250fddf9e76@linaro.org>
References: <1648289.tQCHxfjYn9@basile.remlab.net>
	<20190125214926.3204-1-remi@remlab.net>
	<02a680e1-c20c-2ecb-2926-6250fddf9e76@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:41d0:2:5a1a::
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] target/arm: fix AArch64
 virtual address space size
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jY91u1tprqSy

	Hi,

Le lauantaina 26. tammikuuta 2019, 1.29.27 EET Richard Henderson a =C3=A9cr=
it :
> On 1/25/19 1:49 PM, R=C3=A9mi Denis-Courmont wrote:
> > From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> >=20
> > Since QEMU does not support the ARMv8.2-LVA, Large Virtual Address,
> > extension (yet), the VA address space is signed 48-bits. User mode can
> > only handle the positive half of the address space, so that makes a
> > limit of 47 bits.
> >=20
> > (With LVA, it would be 52 and 51 bits respectively.)
> >=20
> > The incorrectly large address space conflicts with PAuth instructions,
> > which bits 48-54 and 56-63 for the pointer authentication code. This
> > also conflicts with (as yet unsupported by QEMU) data tagging and with
> > the ARMv8.5-MTE extension.
> >=20
> > Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> > ---
> >=20
> >  target/arm/cpu.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index ff81db420d..2ccd04b8f7 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -2503,7 +2503,7 @@ bool write_cpustate_to_list(ARMCPU *cpu);
> >=20
> >  #if defined(TARGET_AARCH64)
> >  #  define TARGET_PHYS_ADDR_SPACE_BITS 48
> >=20
> > -#  define TARGET_VIRT_ADDR_SPACE_BITS 64
> > +#  define TARGET_VIRT_ADDR_SPACE_BITS 47
> >=20
> >  #else
> >  #  define TARGET_PHYS_ADDR_SPACE_BITS 40
> >  #  define TARGET_VIRT_ADDR_SPACE_BITS 32
>=20
> This doesn't really conflict, as this doesn't affect much besides the siz=
ing
> of the PageDesc for page_find.

Uh, that value controls the range of target virtual addresses user mode map=
s=20
to host virtual addresses. Without this patch, AFAICT, there are no=20
guarantees, only chance, that emulated system calls such as mmap() will not=
=20
allocate architecturally invalid addresses.

> It's true adjusting this is worthwhile.  The current setting requires 7
> levels (6 * 10 bits + 1 * 4 bits), whereas a 48-bit address space only
> requires 5 levels (4 * 10 bits + 8 bits).  Even for LVA it will be (4 * 10
> + 1 * 12 bits).

LVA only works with 64 KiB page size and user mode forces 4 KiB page size a=
t=20
the moment. And I somewhat doubt that somebody would ever need LVA in QEMU=
=20
user mode. So that's highly hypothetical.

> This will both save memory and reduce the time required for TranlationBlo=
ck
> maintenance.
>=20
> Your choice of 47 is wrong.  This value is also used for system mode,

No, it is not. System mode uses the other value, TARGET_PHYS_ADDR_SPACE_BIT=
S,=20
which this patch leaves untouched.

> and
> the kernel does use the negative half of the address space, so we need to
> have all 48 bits here.

I believe that TARGET_PHYS_ADDR_SPACE_BITS could be reduced to 56 bits.=20
Anything less would presumably break handling of the address "sign" bit 55.

However, that would merely constitute an optimization, as there are no risk=
 of=20
generating architecturally invalid addresses at run-time in system mode.

=2D-=20
R=C3=A9mi Denis-Courmont
http://www.remlab.net/



