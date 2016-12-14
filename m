Received: by 10.25.205.13 with SMTP id d13csp313694lfg;
        Wed, 14 Dec 2016 09:11:33 -0800 (PST)
X-Received: by 10.55.67.74 with SMTP id q71mr9198765qka.292.1481735493842;
        Wed, 14 Dec 2016 09:11:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k32si30371060qtc.136.2016.12.14.09.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Dec 2016 09:11:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHD5W-000384-TE
	for alex.bennee@linaro.org; Wed, 14 Dec 2016 12:11:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHD5R-0002tH-2B
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:11:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHD5N-0001OX-22
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:11:25 -0500
Received: from mail-vk0-f46.google.com ([209.85.213.46]:34549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHD5M-0001O0-LD
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:11:20 -0500
Received: by mail-vk0-f46.google.com with SMTP id x186so37554871vkd.1
	for <qemu-arm@nongnu.org>; Wed, 14 Dec 2016 09:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=j0XfZNaIwKfm5A3os5kkzcKFkwSq0ealV3zbqtaHITk=;
	b=Oz56L7olvcPnhfmu44uPphaio7W9yazXx5wojND5tRn6SZHowHMf9Ng+jeZDyFlyV/
	52paF0HlBq5nabvN8eDEBf0uex3IJaOJZ78+miUTkanH1AMQIEzlKf3qbOJjM8SZgEkz
	6oACx7jQZqmV50XVSvwhUVKmlZL0wKeJB4cgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=j0XfZNaIwKfm5A3os5kkzcKFkwSq0ealV3zbqtaHITk=;
	b=BkQiD/Reub6Et14LMKZRUE8l4qXG7j4ZKkrHrMPmJ/mSrBk9923W7HvEejogk8baYp
	31Vgf2sidxFLEV1lVXQqFfqfNPG8zwbySqJ7kibRLAKFLMvZj1A+o2UZTITk0mPOVzhG
	VEkQ2CFrJpNOIwpKphJcekU/CLqMKP+6GLEZ/3yHMOIO9opxdN5H5D/WQhuEfuu633z/
	NSb3ljDgAHVvgYw5Crt0qOHnEproqX0lIp/JU6Piq9udJdeq6f86mbIuiw/7uIOTaRPV
	6h9qyE8mtVFktogby4byX/F3TNcANhWnQcmxU1r06U/Cf9X/qTSkwL1hF8xUfK0mPcEV
	3Kvg==
X-Gm-Message-State: AKaTC01mgBnAz40Ob0oYxbi+vEoYTx25GzmnC4bgwv/L7Ug22EEZ7x7wqNu6jFDiT92mLpbCqt0hpRZB/NimDMld
X-Received: by 10.31.16.36 with SMTP id g36mr39647419vki.170.1481735420027;
	Wed, 14 Dec 2016 09:10:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Wed, 14 Dec 2016 09:09:59 -0800 (PST)
In-Reply-To: <1480434248-27138-15-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-15-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Dec 2016 17:09:59 +0000
Message-ID: <CAFEAcA-E9Uq5YjSOGu9uNwbhAefqbs-0V7sVbCeeeg85NtSugQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.46
Subject: Re: [Qemu-arm] [PATCH for-2.9 14/30] aspeed/smc: rework the
 prototype of the AspeedSMCFlash helper routines
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DrJi4JeGjmlS

On 29 November 2016 at 15:43, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Change the routines prototype to use a 'AspeedSMCFlash *' instead of
> 'AspeedSMCState *'. The result will help in making future changes
> clearer.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

This patch breaks 'make check' because the palmetto-bmc
model now segfaults on startup:

gdb --args ./build/x86/arm-softmmu/qemu-system-arm -M palmetto-bmc
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.04) 7.11.1
[...]
(gdb) r
Starting program:
/home/petmay01/linaro/qemu-from-laptop/qemu/build/x86/arm-softmmu/qemu-syst=
em-arm
-M palmetto-bmc
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[New Thread 0x7fffd1270700 (LWP 30296)]
[New Thread 0x7fffcfb97700 (LWP 30297)]
[New Thread 0x7fffcf396700 (LWP 30298)]
[New Thread 0x7fffceb95700 (LWP 30299)]
[New Thread 0x7fffbf709700 (LWP 30300)]

Thread 1 "qemu-system-arm" received signal SIGSEGV, Segmentation fault.
0x0000555555b2fce8 in aspeed_smc_flash_update_cs (fl=3D0x0)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/hw/ssi/aspeed_smc.c:413
413         AspeedSMCState *s =3D fl->controller;
(gdb) bt
#0  0x0000555555b2fce8 in aspeed_smc_flash_update_cs (fl=3D0x0)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/hw/ssi/aspeed_smc.c:413
#1  0x0000555555b2fd6a in aspeed_smc_update_cs (s=3D0x7fffcc3924c0)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/hw/ssi/aspeed_smc.c:422
#2  0x0000555555b2febc in aspeed_smc_reset (d=3D0x7fffcc3924c0)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/hw/ssi/aspeed_smc.c:447
#3  0x0000555555b304a6 in aspeed_smc_realize (dev=3D0x7fffcc3924c0,
errp=3D0x7fffffffdcf0) at
/home/petmay01/linaro/qemu-from-laptop/qemu/hw/ssi/aspeed_smc.c:556
#4  0x0000555555a19329 in device_set_realized (obj=3D0x7fffcc3924c0,
value=3Dtrue, errp=3D0x7fffffffde98) at
/home/petmay01/linaro/qemu-from-laptop/qemu/hw/core/qdev.c:918
#5  0x0000555555c17e50 in property_set_bool (obj=3D0x7fffcc3924c0, v=3D
    0x555556ea9d90, name=3D0x555555d639e7 "realized",
opaque=3D0x5555569cafb0, errp=3D0x7fffffffde98) at
/home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:1854
#6  0x0000555555c1635b in object_property_set (obj=3D0x7fffcc3924c0, v=3D
    0x555556ea9d90, name=3D0x555555d639e7 "realized", errp=3D0x7fffffffde98=
)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:1088
#7  0x0000555555c19183 in object_property_set_qobject
(obj=3D0x7fffcc3924c0, value=3D0x555556ea9c80, name=3D0x555555d639e7
"realized", errp=3D0x7fffffffde98)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/qom/qom-qobject.c:27
#8  0x0000555555c165fe in object_property_set_bool
(obj=3D0x7fffcc3924c0, value=3Dtrue, name=3D0x555555d639e7 "realized",
errp=3D0x7fffffffde98)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:1157
#9  0x00005555558da673 in aspeed_soc_realize (dev=3D0x7fffcc371010,
errp=3D0x7fffffffdf20) at
/home/petmay01/linaro/qemu-from-laptop/qemu/hw/arm/aspeed_soc.c:256
#10 0x0000555555a19329 in device_set_realized (obj=3D0x7fffcc371010,
value=3Dtrue, errp=3D0x555556849518 <error_abort>)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/hw/core/qdev.c:918
#11 0x0000555555c17e50 in property_set_bool (obj=3D0x7fffcc371010, v=3D
    0x5555569cc5b0, name=3D0x555555d63b5c "realized",
opaque=3D0x5555569be320, errp=3D0x555556849518 <error_abort>)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:1854
#12 0x0000555555c1635b in object_property_set (obj=3D0x7fffcc371010, v=3D
    0x5555569cc5b0, name=3D0x555555d63b5c "realized",
errp=3D0x555556849518 <error_abort>) at
/home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:1088
#13 0x0000555555c19183 in object_property_set_qobject
(obj=3D0x7fffcc371010, value=3D0x5555569cc3a0, name=3D0x555555d63b5c
"realized", errp=3D0x555556849518 <error_abort>)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/qom/qom-qobject.c:27
#14 0x0000555555c165fe in object_property_set_bool
(obj=3D0x7fffcc371010, value=3Dtrue, name=3D0x555555d63b5c "realized",
errp=3D0x555556849518 <error_abort>)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:1157
#15 0x00005555558dadfe in aspeed_board_init (machine=3D0x55555693d8a0,
cfg=3D0x555556184fe0 <aspeed_boards>)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/hw/arm/aspeed.c:152
#16 0x00005555558daf9c in palmetto_bmc_init (machine=3D0x55555693d8a0)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/hw/arm/aspeed.c:182
#17 0x000055555596af75 in main (argc=3D3, argv=3D0x7fffffffe4c8,
envp=3D0x7fffffffe4e8)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/vl.c:4548

Calling reset from realize is probably a bad idea (reset gets
called later anyway), and calling qemu_set_irq() from reset
isn't recommended either. These may or may not be the cause
of the crash though.

thanks
-- PMM
