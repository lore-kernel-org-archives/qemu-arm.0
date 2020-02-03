Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4279145lfp;
        Mon, 3 Feb 2020 10:46:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqz3U75dutOTIh8yeV2ATmR7ICLmDkYLwAYIhDtEHO7V/dWkyYxsWj1yj29UG7n0Wlozy/5T
X-Received: by 2002:ae9:ebd8:: with SMTP id b207mr8598589qkg.353.1580755590827;
        Mon, 03 Feb 2020 10:46:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580755590; cv=none;
        d=google.com; s=arc-20160816;
        b=EDKWzrFT3iFjPRl8ewsJfWO/qMRE/47RUX3V4dYMrJsNvjo74SLAW6/Pf7oEF+R2DJ
         zz0qK/pksv5JG79CNuSF3jLLBN22Ebbdc4BN6ijQ+yEsIF7ebf6fDQOobUZCFPtQSjdi
         DuLg2PxtF5OW72GYfJf/410gO63uIWNvy/T4sSaB4a+jF9PoeaLMU1vxVWm7iAHKHDse
         OkQcuYWdaq2V+RWJS9PIcZEtYbcm0ToGFA/jM6nBUd/Pq1frJJxaydBSIrmyUzthDocW
         TvlcFoVwbD4tEcKPlKHxZ5KH/c/SBd635KH+hWtHAu7J3vIDtW5bxkQaLWJBhpnEAMgH
         9G2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=z5jVWNOHWCY+eraD2JJMk+Tdfe0AGEFHy4MnViFqQTA=;
        b=F7+NshDS6Yq0jQ+MnowhfoZMRiQXHzPWESRYL11/Sw2E0uqotfXF8zFK+U5AjJA5B3
         wFGSCbSDwjXqK8Du9xc0RmkqywZKwSPPP7bwnGqhu0NKPE8WePF+HIU26a6k6k2Kho4r
         J3V9os1/tt8hRbrUplWhPUr+CuKAt1cqtjGWG8tTgwHy0CiwEg4TiQ96+ZINKOCojusm
         pH6+1z6E9iIpdjI58AcjV6rzWTVyOjXtfoblIFyEjfGU1K9XMANGZ1AawNaZ82/pjxpk
         zIQ2ZSaUnPhsuJDg/fZ7vaJL1d2dQ5XUJjw//5etGIovpy5npN4Ci69I7rjIsleKpMSI
         hYmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Df9UW8xs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si12010723qto.220.2020.02.03.10.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 10:46:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Df9UW8xs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iygju-0007Zg-9M
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 13:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iygj2-000787-1B
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 13:45:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iygj0-0007uF-CV
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 13:45:35 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:42405)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iygj0-0007qB-3q; Mon, 03 Feb 2020 13:45:34 -0500
Received: by mail-lf1-x144.google.com with SMTP id y19so10426514lfl.9;
 Mon, 03 Feb 2020 10:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z5jVWNOHWCY+eraD2JJMk+Tdfe0AGEFHy4MnViFqQTA=;
 b=Df9UW8xsa9AhH+7W9Id+Znk+jTS8It66gEvrKoumePSsBYA7W03vpvypAXeVUQac04
 MhlAsilBa8Z6C056z1ZHlj15pwFq8ylpLD1FtviR2ioStNAZtCx1UB1YJrY6JMK9gcor
 aB9nIuxzHFHwRSBJ2Ax+uruzWZ3mk8XluLuGZX6RhDhhKptC5vwExidGkGfBhbI3V4gT
 +Whauf7zu3+ysMyqmgIWCm5hKXURx2xkUP2fUUTODoerZ4AghzHBWKnDpA14PYl9tuc7
 wBq7ZdNcVvcx3MQMMCsH2ITip0d4esY4LZiFTmDplMe89gCUTEf0W5uGFpgdhGj0k1Xk
 aiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z5jVWNOHWCY+eraD2JJMk+Tdfe0AGEFHy4MnViFqQTA=;
 b=KfcJ3Loblfqfo8k6eE+cTrE1vodGjABk4ZE6ncPVjtg+5BetGZtuY5/3jwr2mgDJvO
 tMc3ULDVidhEl6PStX45FEAcbyvwVC0Vr2g/YRFVUkryg8B7nrsDed2xHKppalq2lTE0
 GFpw6/kRp8Macv6GkAtMsv5Rq6rc2YUT8RqMjkRi5ORnBH3MrC0dBPSh0Bh23gvCRvhF
 ByO47Hw391Qlhs+XQxRBrW9W1jWfa7ax+fTcIRn9zCe1vdnRgSUCPvb4N8KoeJL/UUGo
 8sMx9+dHzqvvEfF7RKodRrisJ8IODTpI1mj3XODJVsRC81EHaRveXN6IUtea8mG+oyF5
 ReBQ==
X-Gm-Message-State: APjAAAU73aLTf4TqFs+jlrx0oNLwWbKr3YKwLvwoFFaVv3rdg0Eh+k5A
 5SSHvzqo+OvtJawiDP/QDb8Y9ojg/jW/wjfGZz8=
X-Received: by 2002:a05:6512:15d:: with SMTP id
 m29mr12963561lfo.51.1580755531549; 
 Mon, 03 Feb 2020 10:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20200203082619.7426-1-f4bug@amsat.org>
 <20200203082619.7426-2-f4bug@amsat.org>
In-Reply-To: <20200203082619.7426-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Feb 2020 10:38:24 -0800
Message-ID: <CAKmqyKN_y660pVMWexeALGJx9KgaR=623Tex+15sq-_6GozhVQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/arm/raspi: Use BCM2708 machine type with pre
 Device Tree kernels
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Warren <swarren@nvidia.com>,
 =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jeremy Linton <lintonrjeremy@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pete Batard <pete@akeo.ie>, Igor Mammedov <imammedo@redhat.com>,
 Michael Chan <michael.chan@broadcom.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Kshitij Soni <kshitij.soni@broadcom.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DPqkWWUuqWyy

On Mon, Feb 3, 2020 at 12:28 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> When booting without device tree, the Linux kernels uses the $R1
> register to determine the machine type. The list of values is
> registered at [1].
>
> There are two entries for the Raspberry Pi:
>
> - https://www.arm.linux.org.uk/developer/machines/list.php?mid=3D3138
>   name: MACH_TYPE_BCM2708
>   value: 0xc42 (3138)
>   status: Active, not mainlined
>   date: 15 Oct 2010
>
> - https://www.arm.linux.org.uk/developer/machines/list.php?mid=3D4828
>   name: MACH_TYPE_BCM2835
>   value: 4828
>   status: Active, mainlined
>   date: 6 Dec 2013
>
> QEMU always used the non-mainlined type MACH_TYPE_BCM2708.
> The value 0xc43 is registered to 'MX51_GGC' (processor i.MX51), and
> 0xc44 to 'Western Digital Sharespace NAS' (processor Marvell 88F5182).
>
> The Raspberry Pi foundation bootloader only sets the BCM2708 machine
> type, see [2] or [3]:
>
>  133 9:
>  134     mov r0, #0
>  135     ldr r1, =3D3138       @ BCM2708 machine id
>  136     ldr r2, atags       @ ATAGS
>  137     bx  r4
>
> U-Boot only uses MACH_TYPE_BCM2708 (see [4]):
>
>  25 /*
>  26  * 2835 is a SKU in a series for which the 2708 is the first or prima=
ry SoC,
>  27  * so 2708 has historically been used rather than a dedicated 2835 ID=
.
>  28  *
>  29  * We don't define a machine type for bcm2709/bcm2836 since the RPi F=
oundation
>  30  * chose to use someone else's previously registered machine ID (3139=
, MX51_GGC)
>  31  * rather than obtaining a valid ID:-/
>  32  *
>  33  * For the bcm2837, hopefully a machine type is not needed, since eve=
rything
>  34  * is DT.
>  35  */
>
> While the definition MACH_BCM2709 with value 0xc43 was introduced in
> a commit described "Add 2709 platform for Raspberry Pi 2" out of the
> mainline Linux kernel, it does not seem used, and the platform is
> introduced with Device Tree support anyway (see [5] and [6]).
>
> Remove the unused values (0xc43 introduced in commit 1df7d1f9303aef
> "raspi: add raspberry pi 2 machine" and 0xc44 in commit bade58166f4
> "raspi: Raspberry Pi 3 support"), keeping only MACH_TYPE_BCM2708.
>
> [1] https://www.arm.linux.org.uk/developer/machines/
> [2] https://github.com/raspberrypi/tools/blob/920c7ed2e/armstubs/armstub7=
.S#L135
> [3] https://github.com/raspberrypi/tools/blob/49719d554/armstubs/armstub7=
.S#L64
> [4] https://gitlab.denx.de/u-boot/u-boot/blob/v2015.04/include/configs/rp=
i-common.h#L18
> [5] https://github.com/raspberrypi/linux/commit/d9fac63adac#diff-6722037d=
79570df5b392a49e0e006573R526
> [6] http://lists.infradead.org/pipermail/linux-rpi-kernel/2015-February/0=
01268.html
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Zolt=C3=A1n Baldaszti <bztemail@gmail.com>
> Cc: Pekka Enberg <penberg@iki.fi>
> Cc: Stephen Warren <swarren@nvidia.com>
> Cc: Kshitij Soni <kshitij.soni@broadcom.com>
> Cc: Michael Chan <michael.chan@broadcom.com>
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Cc: Jeremy Linton <lintonrjeremy@gmail.com>
> Cc: Pete Batard <pete@akeo.ie>
> ---
>  hw/arm/raspi.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 3996f6c63a..ef76a27f33 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -29,8 +29,7 @@
>  #define FIRMWARE_ADDR_3 0x80000 /* Pi 3 loads kernel.img here by default=
 */
>  #define SPINTABLE_ADDR  0xd8 /* Pi 3 bootloader spintable */
>
> -/* Table of Linux board IDs for different Pi versions */
> -static const int raspi_boardid[] =3D {[1] =3D 0xc42, [2] =3D 0xc43, [3] =
=3D 0xc44};
> +#define MACH_TYPE_BCM2708   3138 /* Linux board IDs */
>
>  typedef struct RasPiState {
>      BCM283XState soc;
> @@ -116,7 +115,7 @@ static void setup_boot(MachineState *machine, int ver=
sion, size_t ram_size)
>      static struct arm_boot_info binfo;
>      int r;
>
> -    binfo.board_id =3D raspi_boardid[version];
> +    binfo.board_id =3D MACH_TYPE_BCM2708;
>      binfo.ram_size =3D ram_size;
>      binfo.nb_cpus =3D machine->smp.cpus;
>
> --
> 2.21.1
>
>
