Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2060634wrq;
        Thu, 24 Oct 2019 02:05:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4paCgGZfYeqzT38N2HOVPH2sFrLzqxe/rXO9bu6cHj9UQEYBUw9HB+AcWJtgSxSjx1lPW
X-Received: by 2002:a50:b634:: with SMTP id b49mr25665190ede.77.1571907951045;
        Thu, 24 Oct 2019 02:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571907951; cv=none;
        d=google.com; s=arc-20160816;
        b=kvxwnDkKsO3Y/tN3eG/KIY/bjRp+Tsr4sMjXH3S5e8ZOdyB9UR+IJBV9Xo2O3R8TvI
         nV/CIzV2lrAaOdhUoi2H6/LaFHM0Fc9IevMs6dfS7dPSIbUqgEkrf23FGH0MBWpRz4wF
         JxLu3F++xLMg4F5xMZXbXNOZwJ4TJiF0tU0PQxFFO679NqzZVfcu5At3ksi9zDnnSDt5
         1B/YoGNUlS6qgwnjHFRO7z+BVEmq7A0+T3iE38BetT2Vf+gZ+T0iyFQTyTBHrRJ3LRDU
         WgbtbGtBhIRCZaDh2Az1zwPCWX7ACHppVgT+SZIkxlo0KnHp6VD+EO/H5Oj15v2si5XX
         EuTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=VAqQalthoG+xbrZURmZhEGl6mSw37NtdImucMDrxq9c=;
        b=nUAP4NBhN3Lc0chOUBeDelFTiQQmGpeTeB/w4RML6JcbfUOvq8eRIrv3xCEI4SiSs5
         SKctbBvdYroTkrb0TJJc5gG75TzrOS8jZ/iuPbuZ7xGzUDQWe8wSBQyJEM61A4T/1DSM
         S5BZ+lr73Hf3l4UhH9i582DTuuq2mbmaaphhniTJO0MSltAiEzrZNCilPLuhU0zb23Ts
         N4xUhrfIMg2lz+C6DojBB6a+/sIQC1NvqLdm7007UUGG7ADqfdSssCaLCaNi7qXQQaGP
         kOCMvsbv/qPxH7O3NfRNQFXdVgwoYidYwV65RVOMW+XID+PS6FBkFHxPQt02OiBeK470
         WgFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PDWJcV+P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si14429804ejt.219.2019.10.24.02.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 02:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PDWJcV+P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNZ42-00011F-0T
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 05:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43009)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iNZ3p-0000xN-Es
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 05:05:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iNZ3n-0000fo-Be
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 05:05:37 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44432)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iNZ3k-0000cO-RW; Thu, 24 Oct 2019 05:05:32 -0400
Received: by mail-wr1-x444.google.com with SMTP id z11so1776898wro.11;
 Thu, 24 Oct 2019 02:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=VAqQalthoG+xbrZURmZhEGl6mSw37NtdImucMDrxq9c=;
 b=PDWJcV+P+qfaTI4Uk9WRKGz1XZ203NYg01OliYBmrrFXFRzkVXtznWDoTWEZy37umI
 wL3rKi/e1/qDbBC54UrxrKRT8gjMZn/N7ADbJ2V3AT5TECH/0/w6z7u11xg9muSuZ8WX
 PB5fSuKU+vW6kPhAp5f4RjQFHdSZ2ni6YCvIqqZnBUmEfsgyLGDg2bY7xnLc4IfNXR1H
 hIf8aJrKkRo+kWvhAYPlHVXkAvNz3DxdAg1h0n0+2QgxNBFGu2WzK+jolf9aW9VDKBqJ
 HlXvHSArd2zq4v3xIlLlhv/wyZMemCXS4Jjwy4QhHMZkiHlUp5mhXuuWOfGdOjCLISNR
 hWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=VAqQalthoG+xbrZURmZhEGl6mSw37NtdImucMDrxq9c=;
 b=teDp0nZ4kYqQmbZesGjGEJjJd/pK3zxmCVK9kqLz933BahVuQ11alchYMyrZ1ijHQs
 13INZd4uW6w7ghBBD49w/xRaya59tKEd0ve4tkfalv3RUcGIkPrJvfgLOdUV1nDSuyG8
 ROX5n+KA8oaQk1390Kbva56lf0pMVaQgg5Iv3Uflj7YDYZjaj0FstK7mO5Z6pAnlVHdq
 4G7R0dPk2P0A06yi5ZNisug+KgaQ0gOIckSC9tdPt6KXQTSoECY4n5wo3WlpOcKpuoRr
 0Ni0ZpGOce/q/bV1MfQwG54tWqjxzZNvl1NhTNbvvNBKDKwzIhF6nukramQ4kZzULvX4
 9gPQ==
X-Gm-Message-State: APjAAAWg8ea4r/gmR2hvpA/46PvBZJRnb07SW2W6xVhDrCwv6Oj4nPTh
 rrmBUX34rUfOyQrLt1r41pT87CCTtnrQEQ==
X-Received: by 2002:adf:aacc:: with SMTP id i12mr2796325wrc.15.1571907930926; 
 Thu, 24 Oct 2019 02:05:30 -0700 (PDT)
Received: from Icho (x590ef5e8.dyn.telefonica.de. [89.14.245.232])
 by smtp.gmail.com with ESMTPSA id w9sm17839792wrt.85.2019.10.24.02.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 02:05:30 -0700 (PDT)
Message-ID: <ff4e0bbb9bfdadace1e0442fee0fdcf7fc34ca4f.camel@gmail.com>
Subject: Re: [RFC PATCH 14/14] hw/arm/raspi: Add the Raspberry Pi 4B board
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>,  qemu-devel@nongnu.org, Pekka Enberg
 <penberg@iki.fi>,  =?ISO-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>
Date: Thu, 24 Oct 2019 11:01:29 +0200
In-Reply-To: <20190904171315.8354-15-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-15-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tfrxtK0VvNJ+

El mié, 04-09-2019 a las 19:13 +0200, Philippe Mathieu-Daudé escribió:
> The Raspberry Pi 4 uses a BCM2711 SoC (based on a BCM2838).
> The SoC can handle up to 8GiB of SDRAM, but we limit it to 4GiB
> (no 8GiB models in the market yet).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/raspi.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index b4db39661f..59ee2f82b4 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -39,11 +39,13 @@ enum BoardIdChip {
>      C_BCM2835 = 0,
>      C_BCM2836 = 1,
>      C_BCM2837 = 2,
> +    C_BCM2711 = 3,
>  };
>  
>  enum BoardIdType {
>      T_2B = 0x04,
>      T_3B = 0x08,
> +    T_4B = 0x11,
>  };
>  
>  enum BoardIdRevision {
> @@ -56,6 +58,7 @@ enum BoardIdRevision {
>  static const char *processor_typename[] = {
>      [C_BCM2836] = TYPE_BCM2836,
>      [C_BCM2837] = TYPE_BCM2837,
> +    [C_BCM2711] = TYPE_BCM2838,
>  };
>  
>  typedef struct BoardInfo BoardInfo;
> @@ -90,6 +93,12 @@ static const BoardInfo bcm283x_boards[] = {
>          .ram_size_min = 1 * GiB,
>          .ram_size_max = 1 * GiB,
>      },
> +    [4] = {
> +        .board_id = 0xc42,
> +        .board_rev = { T_4B, R_1_1, C_BCM2711, M_SONY_UK },
> +        .ram_size_min = 1 * GiB,
> +        .ram_size_max = 4 * GiB,
> +    },
>  };
>  
>  typedef struct RasPiState {
> @@ -336,4 +345,24 @@ static void raspi3_machine_init(MachineClass
> *mc)
>      mc->default_ram_size = 1 * GiB;
>  }
>  DEFINE_MACHINE("raspi3", raspi3_machine_init)
> -#endif
> +
> +static void raspi4_init(MachineState *machine)
> +{
> +    raspi_init(machine, 4);
> +}
> +
> +static void raspi4_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "Raspberry Pi 4B";
> +    mc->init = raspi4_init;
> +    mc->block_default_type = IF_SD;
> +    mc->no_parallel = 1;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;
> +    mc->max_cpus = BCM283X_NCPUS;
> +    mc->min_cpus = BCM283X_NCPUS;
> +    mc->default_cpus = BCM283X_NCPUS;
> +    mc->default_ram_size = 1 * GiB;
> +}
> +DEFINE_MACHINE("raspi4", raspi4_machine_init)
> +#endif /* TARGET_AARCH64 */
Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>

