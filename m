Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp798403wrp;
        Wed, 4 Sep 2019 07:35:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlmdP1fjlJ8HGB5k4Q7ZDZTF4H5QNzU/PMaSf0Y6r96udioeGep4LaqIsDHpDSQnX3sXw3
X-Received: by 2002:a37:682:: with SMTP id 124mr38863772qkg.393.1567607752809;
        Wed, 04 Sep 2019 07:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567607752; cv=none;
        d=google.com; s=arc-20160816;
        b=bBfVWMYblMF2JD8n6K+18LjksvHoDvTop8EX3eExRbaJB4Vv1rBp+Ek9A1E9gRD3sM
         FbGCmvWvPRl/vBo0h6/qT4J21XZx9N4W8hvZUD0mjtdMl32b+rxn3HGiOTjzNUUX/Jqt
         UGTd4fbIchJ29B0zuFQ4Cx3jEeYby1f83f2Pv2stvpr+K1wKvK8G09/gzkWJCmA6o/dG
         tE/L2yArTvueBqYCjAZH8biR/cJi9khTy7stueZd7SeRdTPktKFnR90oPhk6JtqQGuuW
         r+t+zICZIiuZu08u2dRmQdKJ0jOSa49sU/2TlwtsmK5cSIhkU6tgKzSkM96+JqFcgl52
         GDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=BmEPdb1oB0u36r/ovuXbG9rGaeZqBa/uC6Qz3sXBV34=;
        b=XfRdQPzCa3BvT4dRNCVtrqoc83RVm+LAHyDTmf+jV8ZYuMea0GN/54yM0tmBn8OFu3
         S9z+rSyDLkd6Qybicxf2cmTqgMbkArv4Nuk4ZmyLFabJj07nhWo8GMC49Ys+dJBg/UL3
         R+iVZEg/vcX+uIUgsX4SHMVWvJWlRdET3N/0C3A9rsu7g4rO2Cd4hy3iYGpQxPRIq31x
         29V6HG27XHnNyJalc1GE+4RfK8DNiQvZCqae4/wcLOFnmgHExNq+PC3S06pThDP0cesQ
         X7PteWxrgIyQMhGMXnVqkflk4AON3ZIBKgIyyqxVCFQ90OibwO+tUsRbKiTErnyrSNyx
         cwRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="nPXPfFE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si12160586qta.136.2019.09.04.07.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 07:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="nPXPfFE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5WO0-0004nS-6a
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 10:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bztemail@gmail.com>) id 1i5WNr-0004l6-3h
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 10:35:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bztemail@gmail.com>) id 1i5WNp-0002G4-PS
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 10:35:43 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:41952)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bztemail@gmail.com>)
 id 1i5WNm-0002CM-Iq; Wed, 04 Sep 2019 10:35:38 -0400
Received: by mail-lf1-x142.google.com with SMTP id j4so16133172lfh.8;
 Wed, 04 Sep 2019 07:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BmEPdb1oB0u36r/ovuXbG9rGaeZqBa/uC6Qz3sXBV34=;
 b=nPXPfFE/Kv6gqoQyM2OofGr5Oj0DM/f6S17Lj7FTqBo0saEk8L+0FooNAQwXN9yph1
 A6VtFGXA4/cK3F8jEvBFBOMZL0hRI4VrLjtfdEeLzMF42tp6W7tkKsv35B/AUTQLAoaM
 bH9LGJ7TNx8BMtvbWCTx64rYyHaLtuPo5JMmed/vk3FW4fKH0xsRGXAEGTNOrMKv/Ww0
 PwR0claPcGDvbDvMaEAV1LLTlVbJI2dHmXY5J6ZYqXVEm7MBRk3stANzP3TJstoQbtBh
 +WiZM2h59mAOEwV8zHsIR54WZF8v9YYeJMZpxfG8UGc4hRz8v11GslzQq9m5RsXMEqGS
 HN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BmEPdb1oB0u36r/ovuXbG9rGaeZqBa/uC6Qz3sXBV34=;
 b=tT+nRgpouJrNq6JT/kaF2JJJ3fr8ZkjykZ2XMDy5Toc9UjGKGTf5Vip3X1uImxCcpK
 5qde5xza3nEd3q2m+t8cFfoMvYes1F1NICNkTb43ipYu73l931bz4JYJ1TNVRyrnZQOp
 L2DEqW2vWumCEFY/QOfrmQS1fQf4GTocIzjk12DGPTtf3oGsEi6wr5p84LcO6naqECFt
 o0L0H4Bd41ZgnQg7jbvnwFp4PwPWfXGVHEoEmF2NMXIEm2fM/SW53qK9JNg3E+K/Sy7M
 Kk2pQTPnF4t45YsGp50syrQa+4KHsSpM8ciA/sikhu06rKgUiPeemL9PlfNbA7q24FG9
 KSQQ==
X-Gm-Message-State: APjAAAUYhlikjtfT0m9uMvpm05M20sWc5ye83C5vWwt5aK2SWWvUOfKA
 6X/qma2qjj67dvlxjiaf2Gg6TYPBztzeTUrMw4I=
X-Received: by 2002:a19:5d53:: with SMTP id p19mr23458836lfj.109.1567607736499; 
 Wed, 04 Sep 2019 07:35:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3e1a:0:0:0:0:0 with HTTP;
 Wed, 4 Sep 2019 07:35:35 -0700 (PDT)
In-Reply-To: <CAAdtpL7ZRxLS=wbKKQrxQ_Ob8sLJFGvsqPWXmgtCGWKdJ-Ga9g@mail.gmail.com>
References: <20180216070201.4271-1-penberg@iki.fi>
 <20180216070201.4271-3-penberg@iki.fi>
 <CAAdtpL7ZRxLS=wbKKQrxQ_Ob8sLJFGvsqPWXmgtCGWKdJ-Ga9g@mail.gmail.com>
From: bzt <bztemail@gmail.com>
Date: Wed, 4 Sep 2019 16:35:35 +0200
Message-ID: <CADYoBw39KN6dzgJO2yG5hCTxNR2_R1175oqaFbdOdQ-oQeyo1A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/3] raspi: Raspberry Pi 3
 support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 Pekka Enberg <penberg@iki.fi>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RtAirYAHk4fW

Dear Phil,

As you can see, the board ids are quite controversial, and bcm2837 is
not listed at all. Therefore 0xc44 is just a constant to identify qemu
"board". Feel free to change the id if you'd like.

About the r1 register, you've liked the wrong firmware. That's for
AArch32 mode, not for AArch64 mode which the raspi3 machine type uses.
In AArch64 mode, the firmware
https://github.com/raspberrypi/tools/blob/920c7ed2ee/armstubs/armstub8.S
passes only the device tree pointer in x0 and only for the primary
CPU, no board id of any kind.

Yes I know that the real firmware can start a hw raspi3 board in 32
bit mode, but it's better to have 64 bit as default, as raspi2 is 32
bit only anyway. Unfortunately there's no way to autodetect if the
image passed to the -kernel argument was compiled for AArch32 or
AArch64 mode, the instructions are way to similarly encoded and
there's no magic in raw binaries. Real hw board differentiates by
checking the file name of the kernel file on the boot partition (named
kernel7.img vs. kernel8.img) and parsing config.txt for arm specific
options. This is not an option for qemu as it does not emulate VC GPU
bootcode nor does it receive an entire boot partition with the -kernel
argument. Another reason to use AArch64 for raspi3 machine is if a
real board finds both kernel7.img and kernel8.img on the boot
partition, then it will load the AArch64 kernel.

Cheers,
bzt

On 9/3/19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> Hi Pekka and Zolt=C3=A1n,
>
> On Fri, Feb 16, 2018 at 8:04 AM Pekka Enberg <penberg@iki.fi> wrote:
>>
>> This patch adds Raspberry Pi 3 support to hw/arm/raspi.c. The
>> differences to Pi 2 are:
>>
>>  - Firmware address
>>  - Board ID
>>  - Board revision
>>
>> The CPU is different too, but that's going to be configured as part of
>> the machine default CPU when we introduce a new machine type.
>>
>> The patch was written from scratch by me but the logic is similar to
>> Zolt=C3=A1n Baldaszti's previous work, which I used as a reference (with
>> permission from the author):
>>
>>   https://github.com/bztsrc/qemu-raspi3
>>
>> Signed-off-by: Pekka Enberg <penberg@iki.fi>
>> ---
>>  hw/arm/raspi.c | 31 +++++++++++++++++++++----------
>>  1 file changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>> index c24a4a1b14..66fe10e376 100644
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -5,6 +5,9 @@
>>   * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
>>   * Written by Andrew Baumann
>>   *
>> + * Raspberry Pi 3 emulation Copyright (c) 2018 Zolt=C3=A1n Baldaszti
>> + * Upstream code cleanup (c) 2018 Pekka Enberg
>> + *
>>   * This code is licensed under the GNU GPLv2 and later.
>>   */
>>
>> @@ -22,10 +25,11 @@
>>  #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATA=
GS
>> */
>>  #define MVBAR_ADDR      0x400 /* secure vectors */
>>  #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
>> -#define FIRMWARE_ADDR   0x8000 /* Pi loads kernel.img here by default *=
/
>> +#define FIRMWARE_ADDR_2 0x8000 /* Pi 2 loads kernel.img here by default
>> */
>> +#define FIRMWARE_ADDR_3 0x80000 /* Pi 3 loads kernel.img here by defaul=
t
>> */
>>
>>  /* Table of Linux board IDs for different Pi versions */
>> -static const int raspi_boardid[] =3D {[1] =3D 0xc42, [2] =3D 0xc43};
>> +static const int raspi_boardid[] =3D {[1] =3D 0xc42, [2] =3D 0xc43, [3]=
 =3D
>> 0xc44};
>
> Where does the value 0xc44 comes from?
>
> I can only find 0xc42/0xc43 defined:
> https://github.com/raspberrypi/linux/blob/rpi-3.18.y/arch/arm/tools/mach-=
types#L525
>
> 0xc43 seems controversial, see
> http://lists.infradead.org/pipermail/linux-rpi-kernel/2015-February/00126=
8.html
> addition:
> https://github.com/raspberrypi/linux/commit/d9fac63adac#diff-6722037d7957=
0df5b392a49e0e006573R526
>
> Looking at the firmware source, the r1 register is always set to the
> BCM2708 machine id before calling the kernel:
> https://github.com/raspberrypi/tools/blob/920c7ed2ee/armstubs/armstub7.S#=
L133
>
> Thanks,
>
> Phil.
>
