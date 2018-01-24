Received: by 10.28.71.27 with SMTP id u27csp439865wma;
        Wed, 24 Jan 2018 02:15:43 -0800 (PST)
X-Google-Smtp-Source: AH8x22494i1MbY4ehV2x0ZtdTnEMqE3EtYBO1LHQo3NFmU3oFydcBUL+F744I/ZeBbt92QsWuoJp
X-Received: by 10.129.114.215 with SMTP id n206mr4704698ywc.427.1516788943779;
        Wed, 24 Jan 2018 02:15:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516788943; cv=none;
        d=google.com; s=arc-20160816;
        b=aGk3doa5fQVFcJYdiPa29BSyV2UrPFZmigWHf8nIZ3ORaUjqhW6QKaTXzkJrxQ2unl
         uxkct5kjdiY6d5ObsiVkfEckcKQu1NoR4YSeoQkNTpUaL6sINY42BTiHmTZjjZz8gqC1
         eZnyI9SDmeNrbkUn3c1D6YzYYlBXZ84GPHtXBNK4HAsp81WklUbsKhS8uMGQGK6lk0+n
         2nv9WwPVj276s16wqeFKC+TGbyxmakGerZNEPSuMksWR3LQ+zOZhJm0aGlHue5cjMv+B
         l1+P/lW+GwyyJR1TJLTuA8rwg0IJVF5uD6F8jFFkTN5b9KW6r0lZm109yxM/QQJ9o0P8
         xcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=+TV7zNSIDHuy04qj+hfq8g1wReV3hx+HqroqxbtT4wU=;
        b=rXyo4y7VhaiVC77LaiOAVoSFpzDL0+wDRRsynwmoefy5oGJQtJ2oEjwqZQGGr42Gw8
         YUHQZZL/usYVzkwEAMINbm9kjbA5QCSc4DLdLPRI4j6mVz19oEgZPwgNUOG+oqzgX6GN
         mXsdtEkZdkrIaKwNi6KeUayoZt/gZf6cBjJPKqbPDodf/eiEn9ZrQXFd48Nx6uQGZ2NU
         H0kl50Oq5h+U9Usd5jjw2IE8/5QLKejWl8gzWcCSAZ7Vx5syuWb4r01L6+oj0qBwr4S/
         oW0yyqBgZ6n2Rku5bpEgjbZY+LBKmaCO0/sQgdq5BRC6HM4K6Vsr7xJSr+ZgM0E3lObV
         LMlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y123si4404722ywg.691.2018.01.24.02.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Jan 2018 02:15:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeI5n-0003zD-66
	for alex.bennee@linaro.org; Wed, 24 Jan 2018 05:15:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1eeI5Z-0003x0-P6
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 05:15:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1eeI5X-0004TO-W1
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 05:15:29 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:46953)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agx@sigxcpu.org>)
	id 1eeI5X-0004Sv-Ne; Wed, 24 Jan 2018 05:15:27 -0500
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id A1A48FB03;
	Wed, 24 Jan 2018 11:15:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ax4ZU_c7-xGK; Wed, 24 Jan 2018 11:15:25 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
	id 55E6545ED5; Wed, 24 Jan 2018 11:15:25 +0100 (CET)
Date: Wed, 24 Jan 2018 11:15:25 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20180124101525.GA4727@bogon.m.sigxcpu.org>
References: <39441aea4e2d05cc505ed3a373e81d3869eb994a.1516785202.git.agx@sigxcpu.org>
	<7a025be3-2f5c-2970-339e-1dee6d80d15b@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <7a025be3-2f5c-2970-339e-1dee6d80d15b@vivier.eu>
User-Agent: Mutt/1.9.2 (2017-12-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 24.134.29.49
Subject: Re: [Qemu-arm] [PATCH] linux-user: Fix register used for 6th
 syscall argument on aarch64
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
	Richard Henderson <richard.henderson@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cE1Be302HcL5

Hi,
On Wed, Jan 24, 2018 at 10:59:05AM +0100, Laurent Vivier wrote:
> Le 24/01/2018 =E0 10:14, Guido G=FCnther a =E9crit=A0:
> > Unbreaks the testcase from
> >=20
> >     http://lists.nongnu.org/archive/html/qemu-arm/2018-01/msg00514.ht=
ml
> >=20
> > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > ---
> >  linux-user/host/aarch64/safe-syscall.inc.S | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/linux-user/=
host/aarch64/safe-syscall.inc.S
> > index 58a2329b37..e4fbc31454 100644
> > --- a/linux-user/host/aarch64/safe-syscall.inc.S
> > +++ b/linux-user/host/aarch64/safe-syscall.inc.S
> > @@ -36,7 +36,7 @@ safe_syscall_base:
> >  	 *               and return the result in x0
> >  	 * and the syscall instruction needs
> >  	 *               x8 =3D=3D syscall number
> > -	 *               x0 ... x7 =3D=3D syscall arguments
> > +	 *               x0 ... x5 =3D=3D syscall arguments
> >  	 *               and returns the result in x0
> >  	 * Shuffle everything around appropriately.
> >  	 */
> > @@ -47,7 +47,7 @@ safe_syscall_base:
> >  	mov	x2, x4
> >  	mov	x3, x5
> >  	mov	x4, x6
> > -	mov	x6, x7
> > +	mov	x5, x7
> >  	ldr	x7, [sp]
> > =20
> >  	/* This next sequence of code works in conjunction with the
> >=20
>=20
> According to glibc/unix/sysv/linux/aarch64/syscall.S:
>=20
>   AArch64 system calls take between 0 and 7 arguments.
>   ... and any other system call arguments are in register x1..x7.
>=20
> And it seems for qemu last argument is on the stack.
> ...
>          x2 ... x7, (stack) =3D=3D syscall arguments
> ...
>=20
> Should we have something like this?
>=20
> @@ -47,8 +47,8 @@ safe_syscall_base:
>         mov     x2, x4
>         mov     x3, x5
>         mov     x4, x6
> -       mov     x6, x7
> -       ldr     x7, [sp]
> +       mov     x5, x7
> +       ldr     x6, [sp]
>=20
>         /* This next sequence of code works in conjunction with the
>          * rewind_if_safe_syscall_function(). If a signal is taken
>=20
> But do we need to set x7 from the stack too?

That makes sense. The maximum number of arguments in
linux-user/syscall.c is syscall6 so we won't notice but it's better to
have this correct, I'll send an updated patch.
Cheers
 -- Guido
