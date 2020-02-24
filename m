Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp804056lfg;
        Mon, 24 Feb 2020 13:34:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcVgmyaL5OOwj03q2Dqri02LFuq9uI+e7iC0f6Hfk+S0eKmncZZdRK4X1Id8jMa7VEtuHa
X-Received: by 2002:ad4:4e04:: with SMTP id dl4mr44883066qvb.150.1582580081286;
        Mon, 24 Feb 2020 13:34:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580081; cv=none;
        d=google.com; s=arc-20160816;
        b=QJ62bH7OqAP+WeRzyWxHD0cmF2uU7qiwsEvD69yQTlO6Veig1Cq84CqtCUXRAWXnJV
         nxa7yMSGNUqvo4BYlEzzJ8Ax1Pcu6MzWNUWEmGlHHbszYvSKam21GkKqkBdiGWfgPXRx
         BS+kZkOKk/liFccxPU/0nYw5576gYBjY9bijwNbppf1cBlr+KLnFrtCzpZd0UthSECbO
         t/TUCRrnIP8Yb9s4TzQz0s04XjssDlPiIMZlnvCnVvNUKo2DB8c1F3oLaWcz8xbp9QL7
         nDCBXpSB0azpK3ROhbedhSa6z+9akvhAXLPUyDo/zbTitos09pSRYxrhONOYZJzWtmy3
         EEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3PAZFGKX8bAlTMnssUbYxm+Yr9ej4zeJyuNTmFdnjaY=;
        b=TZ3Y7zGPArSQtuJmcXBy8EVDvv4Qf4CrN6q3YjT8WEb2rV901Uoms2E4yWhEcQQyFo
         tREPlEVX8Jwc9pQpz/aALNQ1aizdpGDez641f0yV6xGPssUcxc6gSNZTjFMjU+6GT7ay
         LPu3zIyRsOEDjYqbXRhPqppHoZIdDGz4gA7v/q6UMDjwLbKrUnGbatDPfpBDTLx+MhLO
         /CQ+l+Gna7QLaSGHcHAbVo1paJg246XeDMhCewbquo7HqBMZjiAQvSPRNI09jvGYUX5X
         D1WAjFykwHVXHFE3VQ6FcIAv4sPki3oN4qxvbwqPXJZoFb5jRv1XR7nSNfiOcItLJKZC
         pNYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d8aD68Tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19si6655870qtb.292.2020.02.24.13.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:34:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d8aD68Tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LNA-0005Ui-Iz
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j6LGW-0002Mn-Cn
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:27:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j6LGU-0001fK-Uq
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:27:48 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:37759)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j6LGO-0001Te-N0; Mon, 24 Feb 2020 16:27:40 -0500
Received: by mail-lj1-x243.google.com with SMTP id q23so11765485ljm.4;
 Mon, 24 Feb 2020 13:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3PAZFGKX8bAlTMnssUbYxm+Yr9ej4zeJyuNTmFdnjaY=;
 b=d8aD68TgYftRkSO8GLD9OWf5kVrnsEccRTtMrZO3I1BF+pKyMMf2dG526sPdScDahN
 LiZUtB6xzcTcNGGu+JYR3vl+4okQXtwSUMFNRQKSLB1T6j6MWyUUa6O4+Y5kuWOnOcgP
 mJUr3mqIgIrypgH0wdwumWb0mGqC0LqKE3hMi/EmVeZ3MpXmQ0u02Cpe5z6YBXJNbrck
 El3K173IG62xu1/t0B146vLrVwKNg2ruY4b3rVgwiTqlGQV/gjZxdLDYPO1mXDdl8OTg
 H9W3FdXy1KfrUmentwGNAAGRhpIHKdWXA5cN6d8rd/TAa6PF0IyHZR7PaKS5m77yqEy3
 pzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3PAZFGKX8bAlTMnssUbYxm+Yr9ej4zeJyuNTmFdnjaY=;
 b=Kpq6OgeCC5cHdGTU5SxLRfIDuSHr/USLjdUXCaaEW8C3iJrBkRgcEFMQgFzu8IuXDZ
 wGnbXLnGNEA4csj8RrCB8iQm00At7j7g4FzM/b5vDzgQ0ANqSSOs+3Da51TRLAxbHaKV
 8sWUTDwRWm+70cqOENvhGnS2XatKJX/aH/UC/FUmC892Ti3nxH1Vs7iZ8OL4OJOk+UFa
 IYPqSgJqn/DC0QFMVcgVyz1FAM1h45AOLl6DfRqvSUKs/aTUxXusEWMyyudMknMFHpDz
 WEq2V2eWxPgrzCT9mYgB2eSDwf6hOno0u7IhyhifUu6HC3AP09VQVepSnvpZ+oyXlmhc
 Gxkg==
X-Gm-Message-State: APjAAAWZcprCpYyXUBddyVOwz/CD+Ouf1kCCSDgCboQHZ6/1Hhos46MF
 Rn7LLmHZ+tTah6ptRiBRTWPSNdHGTLp6DuG6ngc=
X-Received: by 2002:a2e:8119:: with SMTP id d25mr32063176ljg.76.1582579659099; 
 Mon, 24 Feb 2020 13:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20200224204828.23167-1-philmd@redhat.com>
 <20200224204828.23167-6-philmd@redhat.com>
In-Reply-To: <20200224204828.23167-6-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Feb 2020 13:20:05 -0800
Message-ID: <CAKmqyKPcWkN4fhu+kmU8d+wsPLt_4BJB74Tao-P7nJpBQa1jZA@mail.gmail.com>
Subject: Re: [PATCH v2 05/32] hw/arm: Use memory_region_init_rom() with
 read-only regions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Qemu-block <qemu-block@nongnu.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8kmDR8zIw7Ho

On Mon, Feb 24, 2020 at 12:51 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> This commit was produced with the Coccinelle script
> scripts/coccinelle/memory-region-housekeeping.cocci.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

This looks good for the ROM regions, for the flash regions this
doesn't change the current functionality but I'm not sure it's any
clearer.

Either way though:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/exynos4210.c | 3 +--
>  hw/arm/mainstone.c  | 3 +--
>  hw/arm/omap_sx1.c   | 6 ++----
>  hw/arm/palm.c       | 3 +--
>  hw/arm/spitz.c      | 3 +--
>  hw/arm/stellaris.c  | 3 +--
>  hw/arm/tosa.c       | 3 +--
>  7 files changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 59a27bdd68..3af6502a5e 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -311,9 +311,8 @@ static void exynos4210_realize(DeviceState *socdev, E=
rror **errp)
>                                  &s->chipid_mem);
>
>      /* Internal ROM */
> -    memory_region_init_ram(&s->irom_mem, NULL, "exynos4210.irom",
> +    memory_region_init_rom(&s->irom_mem, NULL, "exynos4210.irom",
>                             EXYNOS4210_IROM_SIZE, &error_fatal);
> -    memory_region_set_readonly(&s->irom_mem, true);
>      memory_region_add_subregion(system_mem, EXYNOS4210_IROM_BASE_ADDR,
>                                  &s->irom_mem);
>      /* mirror of iROM */
> diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
> index 6e64dfab50..05a806b422 100644
> --- a/hw/arm/mainstone.c
> +++ b/hw/arm/mainstone.c
> @@ -125,9 +125,8 @@ static void mainstone_common_init(MemoryRegion *addre=
ss_space_mem,
>      /* Setup CPU & memory */
>      mpu =3D pxa270_init(address_space_mem, mainstone_binfo.ram_size,
>                        machine->cpu_type);
> -    memory_region_init_ram(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
> +    memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
>                             &error_fatal);
> -    memory_region_set_readonly(rom, true);
>      memory_region_add_subregion(address_space_mem, 0, rom);
>
>  #ifdef TARGET_WORDS_BIGENDIAN
> diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
> index be245714db..6c3fd1b271 100644
> --- a/hw/arm/omap_sx1.c
> +++ b/hw/arm/omap_sx1.c
> @@ -126,9 +126,8 @@ static void sx1_init(MachineState *machine, const int=
 version)
>      mpu =3D omap310_mpu_init(dram, machine->cpu_type);
>
>      /* External Flash (EMIFS) */
> -    memory_region_init_ram(flash, NULL, "omap_sx1.flash0-0", flash_size,
> +    memory_region_init_rom(flash, NULL, "omap_sx1.flash0-0", flash_size,
>                             &error_fatal);
> -    memory_region_set_readonly(flash, true);
>      memory_region_add_subregion(address_space, OMAP_CS0_BASE, flash);
>
>      memory_region_init_io(&cs[0], NULL, &static_ops, &cs0val,
> @@ -168,9 +167,8 @@ static void sx1_init(MachineState *machine, const int=
 version)
>      if ((version =3D=3D 1) &&
>              (dinfo =3D drive_get(IF_PFLASH, 0, fl_idx)) !=3D NULL) {
>          MemoryRegion *flash_1 =3D g_new(MemoryRegion, 1);
> -        memory_region_init_ram(flash_1, NULL, "omap_sx1.flash1-0",
> +        memory_region_init_rom(flash_1, NULL, "omap_sx1.flash1-0",
>                                 flash1_size, &error_fatal);
> -        memory_region_set_readonly(flash_1, true);
>          memory_region_add_subregion(address_space, OMAP_CS1_BASE, flash_=
1);
>
>          memory_region_init_io(&cs[1], NULL, &static_ops, &cs1val,
> diff --git a/hw/arm/palm.c b/hw/arm/palm.c
> index 72eca8cc55..265d5891a6 100644
> --- a/hw/arm/palm.c
> +++ b/hw/arm/palm.c
> @@ -206,9 +206,8 @@ static void palmte_init(MachineState *machine)
>      mpu =3D omap310_mpu_init(dram, machine->cpu_type);
>
>      /* External Flash (EMIFS) */
> -    memory_region_init_ram(flash, NULL, "palmte.flash", flash_size,
> +    memory_region_init_rom(flash, NULL, "palmte.flash", flash_size,
>                             &error_fatal);
> -    memory_region_set_readonly(flash, true);
>      memory_region_add_subregion(address_space_mem, OMAP_CS0_BASE, flash)=
;
>
>      memory_region_init_io(&cs[0], NULL, &static_ops, &cs0val, "palmte-cs=
0",
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index e001088103..1d27399721 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -924,8 +924,7 @@ static void spitz_common_init(MachineState *machine,
>
>      sl_flash_register(mpu, (model =3D=3D spitz) ? FLASH_128M : FLASH_102=
4M);
>
> -    memory_region_init_ram(rom, NULL, "spitz.rom", SPITZ_ROM, &error_fat=
al);
> -    memory_region_set_readonly(rom, true);
> +    memory_region_init_rom(rom, NULL, "spitz.rom", SPITZ_ROM, &error_fat=
al);
>      memory_region_add_subregion(address_space_mem, 0, rom);
>
>      /* Setup peripherals */
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 221a78674e..d136ba1a92 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1300,9 +1300,8 @@ static void stellaris_init(MachineState *ms, stella=
ris_board_info *board)
>      sram_size =3D ((board->dc0 >> 18) + 1) * 1024;
>
>      /* Flash programming is done via the SCU, so pretend it is ROM.  */
> -    memory_region_init_ram(flash, NULL, "stellaris.flash", flash_size,
> +    memory_region_init_rom(flash, NULL, "stellaris.flash", flash_size,
>                             &error_fatal);
> -    memory_region_set_readonly(flash, true);
>      memory_region_add_subregion(system_memory, 0, flash);
>
>      memory_region_init_ram(sram, NULL, "stellaris.sram", sram_size,
> diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
> index 4d95a1f3e2..5dee2d76c6 100644
> --- a/hw/arm/tosa.c
> +++ b/hw/arm/tosa.c
> @@ -226,8 +226,7 @@ static void tosa_init(MachineState *machine)
>
>      mpu =3D pxa255_init(address_space_mem, tosa_binfo.ram_size);
>
> -    memory_region_init_ram(rom, NULL, "tosa.rom", TOSA_ROM, &error_fatal=
);
> -    memory_region_set_readonly(rom, true);
> +    memory_region_init_rom(rom, NULL, "tosa.rom", TOSA_ROM, &error_fatal=
);
>      memory_region_add_subregion(address_space_mem, 0, rom);
>
>      tmio =3D tc6393xb_init(address_space_mem, 0x10000000,
> --
> 2.21.1
>
>
