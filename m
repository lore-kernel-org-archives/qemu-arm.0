Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1795684wro;
        Fri, 2 Nov 2018 00:47:17 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d7Zo+m1o6JGbDQN6Z8A4gZXY6ig1kvLC/6DdBuXgdPYkEY4SsQXEMGHMmbotDdybttSH8F
X-Received: by 2002:a37:b101:: with SMTP id a1-v6mr9489256qkf.222.1541144837752;
        Fri, 02 Nov 2018 00:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541144837; cv=none;
        d=google.com; s=arc-20160816;
        b=hFHm1y8TwHQnLS8z5RldXIKahA2COkbQ15sqLc8hk/lrk4WXf1+7ez1pzb7wwZka3V
         9mejEAI3y6yQfZ7kO56xd+qHVQ6y+p1DXcnd/erJws5g2CfUV8I4uzPngXKtGDFGLFHR
         EIoCxBHXSbpzOVv52qbA5t+J38wwEZsJkq1QwuGUZNFlkKZWx8f9+vfXlLNla6ehfend
         DEJr6irPUCbm0tnIHbSyskBZbcBdVAWqMaG/jaH/YzTwnw9na8MelM9f8iEOx5fF21PD
         m7tJNY+3pPkJjiDVnMrg8GBkNgMtL5kmPpw628VPaR1kLCch+0yvBDnin0bO3gCH9ipF
         R2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=9cbei8qXiXP0sPaTulor+NTVtUBQe151OK1OHYZig+M=;
        b=x4HaxFDaMhZe1uA6WQnbcdYSK1haqMJNUjGtBEWNKTwHrLL/jMKz5FUAUUUQ0VhXFm
         LPvzmAuYWAThh3cZbtIQBlmksjkK2Uqo5bVnOmHaMZqu/K+zi8hMCtBbq0VfMpetN+Wl
         f+b45YfQXt7ByK+Rkt9ueN068iJ/u/8yeQX7J3EYR0D5K43orkElh8Kq+GCALv74XOAB
         uF3qXDr2BGbUeMnVfTloLs1KFFO2zSlPP2QRSy27kVa/YbNP89jHmnh3nysLVXlHJkZi
         /lzdrtljqLbavvvpUjB2T3hBeod0KFkdXARvvZiWqT2snOE/OwZql/0/OwRRF9ECt6nc
         5wYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32-v6si4080372qtf.198.2018.11.02.00.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 00:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIUAn-0007wz-8Z
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 03:47:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIUAR-0007pW-KA
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 03:46:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gITwE-00048c-7y
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 03:32:18 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:44665)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gITwD-00046u-OK; Fri, 02 Nov 2018 03:32:14 -0400
Received: by mail-yw1-f65.google.com with SMTP id k6-v6so404490ywa.11;
	Fri, 02 Nov 2018 00:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9cbei8qXiXP0sPaTulor+NTVtUBQe151OK1OHYZig+M=;
	b=bS0fDhXpNzRFmt4KVWncDSavz1LlHi0glCBacLU5imUSm7n3ft51uziZvJvm+W6vTA
	RTUU8GER9NGsVMP1AjTVgGAWb3ogjEtGxFqLOpRUSdl1LV5cPcHY4WTUhdf1jkYLvxic
	ouJDTAyuX4oefPkTEQmTtAQxsDRPO1+8GVN6TiLkSjMZteQoo3YmlLbAyeqEdRN62fqD
	gxtV2i+Qphm01RdiCdG9DqFuihZ98RH29l+utAXoD65zHeVQwgpg+OcDEhHS6JttLyCM
	lWhG/NlWxuvL9an574+a+RDYiEuYrlqf1efWOrqKm39ZFS14jk7/UmkX1M4lnnCr4VZ6
	YdBg==
X-Gm-Message-State: AGRZ1gI+gPjquHroajYsK+tSorykA5PZ+8PaeYVGT1prH585Y9Uqej0A
	bK2oiH+O8AZuAOjO1nuqvPqVH4+2cprbXchGTnw=
X-Received: by 2002:a81:94c6:: with SMTP id
	l189-v6mr4467109ywg.136.1541143932883; 
	Fri, 02 Nov 2018 00:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20181102001303.32640-1-f4bug@amsat.org>
	<b32bf2a0-08ac-6b16-6372-455f9a239f9f@roeck-us.net>
In-Reply-To: <b32bf2a0-08ac-6b16-6372-455f9a239f9f@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 2 Nov 2018 08:32:00 +0100
Message-ID: <CAAdtpL6VCf+hyK7GGtoiC8KLAL2DJtaYomwhcY7Mz2OxMg2AiA@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.65
Subject: Re: [Qemu-devel] [PATCH for 3.2 v2 0/7] hw/arm/bcm2835: Add basic
 support for cprman (clock subsystem)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KekvCQubYHmS

Hi Guenter,

On Fri, Nov 2, 2018 at 3:52 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/1/18 5:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi,
> >
> > This series is a mix of a previous work I had for the raspi, and a patc=
h from
> > Guenter: https://lists.gnu.org/archive/html/qemu-devel/2018-07/msg03153=
.html
> >
> > The final patch keep Guenter ideas and comments, but is mostly a rewrit=
e.
> > I dropped the A2W code from this work, it doesn't seems unuseful to me.
> >
> > Guenter can you test this series?
> >
>
> arm/raspi2 works, but aarch64/raspi3 stalls.

Thanks for testing it!

So I suppose the A2W is required. And I'm probably using a too old kernel,
I'm using the Buster preview following Peter's post [1]:

[    0.000000] Linux version 4.14.0-3-arm64
(debian-kernel@lists.debian.org) (gcc version 7.2.0 (Debian 7.2.0-18))
#1 SMP Debian 4.14.12-2 (2018-01-06)
[    0.000000] Machine model: Raspberry Pi 3 Model B
[...]
[    8.044215] systemd[1]: Detected architecture arm64.
Welcome to Debian GNU/Linux buster/sid!

Debian GNU/Linux buster/sid rpi3 ttyAMA0

rpi3 login: root
Password:
Linux rpi3 4.14.0-3-arm64 #1 SMP Debian 4.14.12-2 (2018-01-06) aarch64
root@rpi3:~#

I'll look for a newer kernel.

BTW I use these QEMU command line options while testing:

qemu-system-aarch64 \
  -d unimp,guest_errors \
  -trace bcm2835_cprman_rd_\* -trace bcm2835_cprman_wr_\* \
  ...

And the cmdline suggested by Peter:

  -append "rw earlycon=3Dpl011,0x3f201000 console=3DttyAMA0 loglevel=3D8
root=3D/dev/mmcblk0p2 fsck.repair=3Dyes net.ifnames=3D0 rootwait memtest=3D=
1"

[1] https://translatedcode.wordpress.com/2018/04/25/debian-on-qemus-raspber=
ry-pi-3-model/

>
> [   45.683302] Run /sbin/init as init process
> [   50.745961] random: dd: uninitialized urandom read (512 bytes read)
> [   77.478266] Writes:  Total: 2074828  Max/Min: 0/0   Fail: 0
>
> ... then nothing else until I abort the session.
>
> This is with the series applied on top of master.
>
> Guenter
>
> > I kept Guenter S-o-b and (C), is that OK? (Guenter?, Peter?)
> >
> > - patches 1, 7: obvious updates in MAINTAINERS
> > - patches 3, 4: simple cleanups
> > - patches 2, 5: add UNIMP code
> > - patch 6: add the cprman (KISS init values from Guenter)
> >
> > Peter: can you take patch #1 for 3.1?
> >
> > Regards,
> >
> > Phil.
> >
> > Philippe Mathieu-Daud=C3=A9 (7):
> >    MAINTAINERS: Add an entry for the Raspberry Pi machines
> >    hw/misc/bcm2835_property: Handle the 'domain state' property
> >    hw/arm/bcm2835: Use 0x prefix for hex numbers
> >    hw/arm/bcm2835: Rename some definitions
> >    hw/arm/bcm2835: Add various unimplemented peripherals
> >    hw/arm/bcm2835: Add basic support for cprman (clock subsystem)
> >    MAINTAINERS: Volunteer to review Raspi patches
> >
> >   MAINTAINERS                          |   7 +
> >   hw/arm/bcm2835_peripherals.c         |  42 +++-
> >   hw/char/bcm2835_aux.c                |   2 +-
> >   hw/intc/bcm2836_control.c            |   4 +-
> >   hw/misc/Makefile.objs                |   1 +
> >   hw/misc/bcm2835_cprman.c             | 277 ++++++++++++++++++++++++++=
+
> >   hw/misc/bcm2835_property.c           |   8 +-
> >   hw/misc/trace-events                 |   8 +
> >   include/hw/arm/bcm2835_peripherals.h |  11 ++
> >   include/hw/arm/raspi_platform.h      |   6 +-
> >   include/hw/misc/bcm2835_cprman.h     |  28 +++
> >   11 files changed, 387 insertions(+), 7 deletions(-)
> >   create mode 100644 hw/misc/bcm2835_cprman.c
> >   create mode 100644 include/hw/misc/bcm2835_cprman.h
> >
>
