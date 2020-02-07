Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp664575lfp;
        Fri, 7 Feb 2020 06:54:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqx9rAB1VbT1FQJTc/EMG9Ioe83pKxhd+kw7s/jwelkaNu+tVjJcfQXralpYonXwtFu3mCMb
X-Received: by 2002:a05:620a:14ac:: with SMTP id x12mr7627213qkj.83.1581087255984;
        Fri, 07 Feb 2020 06:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581087255; cv=none;
        d=google.com; s=arc-20160816;
        b=Zv/Nna3QZ8+3i8EfwLFV75h3sLc2wpFX6u4jor7GXxdsKBrqJniMMFix64Vjii4sN3
         gxdxSlPjzGeR5cr7svKv25igRMhrkZKd7flxpK6J97Vh5P4dbAbl/TEG1PUkswDy0qET
         Hgk4AOZqjyQOG5mltMyoHODoFkjkwaTvZH7QFHmFZkuF00BizHWMQRBKKWHMwF9YGgcu
         fRGBXZFHgP+jkmcgKtl1+tOHHARrE+/QxQTH05Z9C6KJYrMDKZ8xk5mF/HtcOGV57gs0
         mmDi6GKsK85ChTmQfJ5uoXh6d+dTCFcJ55+tu5YX++cRuP7IsAuT0AuaF4vcSywEcg64
         x0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Etu+e6wnyQadgfiGxFspn3QHheGkw+su2bPnv99yeeg=;
        b=D7xwOmQYvnfgtaHeGJZEQ+XmRXUdaCx9Po1bwA3niBn5+LEJsG3d8YgoDxDqz6rNnO
         +i3zwjPfjwwtXQAbFcHD179MILcXAITU0Hw8PzcTp2QKQOhQ5QupAcNJIjhrdTPw3f5S
         777eumcXJ9dRqCrolhFp1FO6avwtNA1OcDBohJ7Tr2WHQYkXbverRjf8j6ydxjb5GMk3
         1cNFcdZlmTcilLyhVMdYm/EK1yimCrwAT7C3kFcmXL/++HnxnMobgRQh+tZPwqulqrzi
         t0/nokvZmjsEgVF4CFNTykTzhj2P+lx/C1VjypuE784CFODg805fuQl2sQOG1bhzriBm
         RfRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iki1y105;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si1225426qvp.78.2020.02.07.06.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 06:54:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iki1y105;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j051L-0003qJ-BX
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 09:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56665)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j04yY-00043Z-RT
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 09:51:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j04yX-000856-5V
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 09:51:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59515
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j04yX-00082u-27
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 09:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581087079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Etu+e6wnyQadgfiGxFspn3QHheGkw+su2bPnv99yeeg=;
 b=iki1y1054F7kcTj0+Ib/Kr3kQaSXa4NzE+NXyW/LW/EXdV4FL/htEp8lGtVS2jumZSKjZU
 +KWchg2OMwBkwHWu0PGNwwrsrr99OHV2ay/gmj9XzcYJEvk7/JySJxThO6eOvXR7CTVYqA
 0w7gKM5raZnGRY6SIRkfQcoR5Bs88qE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-5mQMhFJiM9OtEqRssfq_mQ-1; Fri, 07 Feb 2020 09:51:01 -0500
Received: by mail-wm1-f70.google.com with SMTP id p26so797223wmg.5
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2020 06:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F0bDqJaWXN6Pb+0pVpT7tYDPcHahpbtor1ZQURosJAk=;
 b=fEB953UMQCKJreW3K+/xPu0l036R+pMMF/xzH4lhPclFAPF77GqetJpb9wrc5IHZb9
 E6HnWaOs2UsMLzwgGlvCzKZpsa8nKUTP9imRUXggvkM2YIU3ZaC9TNHhcvMiar+UUEUA
 wjlgwV+EP5o3GM5mqYCvU3X2Of2bzpebqtcJKuevucLRL674C3AkHS+Mwfz+riNJxeun
 DbHf2BPmWpkFb2QD0twnzKeNpbjV63zm41Eqh0MaK3532LkCI8SdY39btUfv7FUs47JG
 GfkneEssCZyF6RfqBo6/mvaHQV/2gbVr5jP8AwjY88Ka21OgW7B1lHApLh7QRjfu1qQC
 GGUQ==
X-Gm-Message-State: APjAAAVFwo9XFOvs5+yrLj5lPSBOXK4DKtyYdiSk7NX9Tww33N8zYgIi
 JgQx4qkiZgKNkKrVzoqL+DrknMMLIzMg5KfmsO5COScHiHgKVFPMzCJ0KCoXz87rPCbkaqIxlsJ
 RkoAFdeYYvTNL
X-Received: by 2002:adf:e70d:: with SMTP id c13mr5034765wrm.248.1581087060046; 
 Fri, 07 Feb 2020 06:51:00 -0800 (PST)
X-Received: by 2002:adf:e70d:: with SMTP id c13mr5034751wrm.248.1581087059781; 
 Fri, 07 Feb 2020 06:50:59 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a198sm3624735wme.12.2020.02.07.06.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 06:50:59 -0800 (PST)
Subject: Re: [PATCH v2 01/30] hw/arm/raspi: Use BCM2708 machine type with pre
 Device Tree kernels
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
 <20200206011756.2413-2-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2002061320310.71431@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <27d1f0e2-941c-11ca-d736-f25af055d9da@redhat.com>
Date: Fri, 7 Feb 2020 15:50:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2002061320310.71431@zero.eik.bme.hu>
Content-Language: en-US
X-MC-Unique: 5mQMhFJiM9OtEqRssfq_mQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-TUID: zw4Y6jJ91LIW

Hi Zoltan,

On 2/6/20 1:21 PM, BALATON Zoltan wrote:
> On Thu, 6 Feb 2020, Philippe Mathieu-Daud=C3=A9 wrote:
>> When booting without device tree, the Linux kernels uses the $R1
>> register to determine the machine type. The list of values is
>> registered at [1].
>>
>> There are two entries for the Raspberry Pi:
>>
>> - https://www.arm.linux.org.uk/developer/machines/list.php?mid=3D3138
>> =C2=A0name: MACH_TYPE_BCM2708
>> =C2=A0value: 0xc42 (3138)
>> =C2=A0status: Active, not mainlined
>> =C2=A0date: 15 Oct 2010
>>
>> - https://www.arm.linux.org.uk/developer/machines/list.php?mid=3D4828
>> =C2=A0name: MACH_TYPE_BCM2835
>> =C2=A0value: 4828
>> =C2=A0status: Active, mainlined
>> =C2=A0date: 6 Dec 2013
>>
>> QEMU always used the non-mainlined type MACH_TYPE_BCM2708.
>> The value 0xc43 is registered to 'MX51_GGC' (processor i.MX51), and
>> 0xc44 to 'Western Digital Sharespace NAS' (processor Marvell 88F5182).
>>
>> The Raspberry Pi foundation bootloader only sets the BCM2708 machine
>> type, see [2] or [3]:
>>
>> 133 9:
>> 134=C2=A0=C2=A0=C2=A0=C2=A0 mov r0, #0
>> 135=C2=A0=C2=A0=C2=A0=C2=A0 ldr r1, =3D3138=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 @ BCM2708 machine id
>> 136=C2=A0=C2=A0=C2=A0=C2=A0 ldr r2, atags=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 @ ATAGS
>> 137=C2=A0=C2=A0=C2=A0=C2=A0 bx=C2=A0 r4
>>
>> U-Boot only uses MACH_TYPE_BCM2708 (see [4]):
>>
>> 25 /*
>> 26=C2=A0 * 2835 is a SKU in a series for which the 2708 is the first or=
=20
>> primary SoC,
>> 27=C2=A0 * so 2708 has historically been used rather than a dedicated 28=
35 ID.
>> 28=C2=A0 *
>> 29=C2=A0 * We don't define a machine type for bcm2709/bcm2836 since the =
RPi=20
>> Foundation
>> 30=C2=A0 * chose to use someone else's previously registered machine ID=
=20
>> (3139, MX51_GGC)
>> 31=C2=A0 * rather than obtaining a valid ID:-/
>> 32=C2=A0 *
>> 33=C2=A0 * For the bcm2837, hopefully a machine type is not needed, sinc=
e=20
>> everything
>> 34=C2=A0 * is DT.
>> 35=C2=A0 */
>>
>> While the definition MACH_BCM2709 with value 0xc43 was introduced in
>> a commit described "Add 2709 platform for Raspberry Pi 2" out of the
>> mainline Linux kernel, it does not seem used, and the platform is
>> introduced with Device Tree support anyway (see [5] and [6]).
>>
>> Remove the unused values (0xc43 introduced in commit 1df7d1f9303aef
>> "raspi: add raspberry pi 2 machine" and 0xc44 in commit bade58166f4
>> "raspi: Raspberry Pi 3 support"), keeping only MACH_TYPE_BCM2708.
>>
>> [1] https://www.arm.linux.org.uk/developer/machines/
>> [2]=20
>> https://github.com/raspberrypi/tools/blob/920c7ed2e/armstubs/armstub7.S#=
L135=20
>>
>> [3]=20
>> https://github.com/raspberrypi/tools/blob/49719d554/armstubs/armstub7.S#=
L64=20
>>
>> [4]=20
>> https://gitlab.denx.de/u-boot/u-boot/blob/v2015.04/include/configs/rpi-c=
ommon.h#L18=20
>>
>> [5]=20
>> https://github.com/raspberrypi/linux/commit/d9fac63adac#diff-6722037d795=
70df5b392a49e0e006573R526=20
>>
>> [6]=20
>> http://lists.infradead.org/pipermail/linux-rpi-kernel/2015-February/0012=
68.html=20
>>
>>
>> Cc: Zolt=C3=A1n Baldaszti <bztemail@gmail.com>
>> Cc: Pekka Enberg <penberg@iki.fi>
>> Cc: Stephen Warren <swarren@nvidia.com>
>> Cc: Kshitij Soni <kshitij.soni@broadcom.com>
>> Cc: Michael Chan <michael.chan@broadcom.com>
>> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>> hw/arm/raspi.c | 5 ++---
>> 1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>> index 3996f6c63a..ef76a27f33 100644
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -29,8 +29,7 @@
>> #define FIRMWARE_ADDR_3 0x80000 /* Pi 3 loads kernel.img here by=20
>> default */
>> #define SPINTABLE_ADDR=C2=A0 0xd8 /* Pi 3 bootloader spintable */
>>
>> -/* Table of Linux board IDs for different Pi versions */
>> -static const int raspi_boardid[] =3D {[1] =3D 0xc42, [2] =3D 0xc43, [3]=
 =3D=20
>> 0xc44};
>=20
> Maybe worth a comment about why using this number (short, one line=20
> version of commit message).

You mean something like:

/* Registered machine type:
  * https://www.arm.linux.org.uk/developer/machines/list.php?mid=3D3138
  */

>=20
> Regards,
> BALATON Zoltan
>=20
>> +#define MACH_TYPE_BCM2708=C2=A0=C2=A0 3138 /* Linux board IDs */
>>
>> typedef struct RasPiState {
>> =C2=A0=C2=A0=C2=A0 BCM283XState soc;
>> @@ -116,7 +115,7 @@ static void setup_boot(MachineState *machine, int=20
>> version, size_t ram_size)
>> =C2=A0=C2=A0=C2=A0 static struct arm_boot_info binfo;
>> =C2=A0=C2=A0=C2=A0 int r;
>>
>> -=C2=A0=C2=A0=C2=A0 binfo.board_id =3D raspi_boardid[version];
>> +=C2=A0=C2=A0=C2=A0 binfo.board_id =3D MACH_TYPE_BCM2708;
>> =C2=A0=C2=A0=C2=A0 binfo.ram_size =3D ram_size;
>> =C2=A0=C2=A0=C2=A0 binfo.nb_cpus =3D machine->smp.cpus;
>>
>>

