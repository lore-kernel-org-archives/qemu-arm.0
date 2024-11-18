Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2334992njc;
        Sun, 17 Nov 2024 18:35:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXHyRXU1b9S7kHFSiABmGsIMYfIkAjyoNOI1ONm6LjK0768wtEFzlnQiQIDrnCxgvyyRBwiMr6yc8kB9w==@linaro.org
X-Google-Smtp-Source: AGHT+IE5QcC+l48ZM0bC7UHr0TjjuzGTeiCFdrIzKaxmWS6kQEH8E/5sXbTJeQCz8Vg+/CVGfenA
X-Received: by 2002:a05:620a:f11:b0:7b1:4f1f:a194 with SMTP id af79cd13be357-7b3622b9735mr1568724485a.6.1731897342713;
        Sun, 17 Nov 2024 18:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731897342; cv=none;
        d=google.com; s=arc-20240605;
        b=cJrqpEHRbuMwop/h9Eng9L0hsa39SWx7OxQvvretl+cUa3/mYlZp91x8uHu+VSbl16
         txO7Wu/k41rPeU3/pF2/fT+Gthx8DlzFf1vyKDpQRPEFyUz6dyOYnVL3CpWWUAUiZGZb
         kqczRGVDERlnfkuFA0N0idWQLhDw5LflIJ8tgrACmnFzV2c3JJwx7QE9WiqeQScHsqFk
         eX4pl1nTrtIIQb/CJynZCEPZu0xcKILVY65XgkAvvtN9ad/WDadVRhp03j6bd/mrOwyq
         sHEy+GH1+yBlB1/ujZ9SK7ApbQWz+rA1ZZov7BnMMhkb3qIaP+Ab1zMZXbQjuv0hKvgM
         x3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PDhkR8LmHatlTom55ZykQ8zrqjy00iBivM6oEtjIx+I=;
        fh=ligLCZm4HSVnEuXIGDJ59ED/Ys4cx8Y7lbX6z/D8Kv0=;
        b=duxHqDhFiBGyqcPjUxmQGz7HszJhmMV4PmdZ0MoHicXLL4CDPHecMVXl1a3guPnIe2
         lYz50CoVExw9aHSxHUp2Z1rfzcjpIBvLdLURE8I89lw0MTwrR+TI7uHeu+0Yj2cTHw1U
         5m27Hlp0JERSAdOiju81Ipu2WVzcGO4Zx8rmxMTPgosjnT9va/b/fvWHNMATnLrGXePz
         zlGPM4i+E9bpCNRQveBZfLzNxKMbpdUX3kbGCxumubYmVIbjbtrAAchacoD9uC6kbXqD
         q25nWSt4J1JQcy4fgsLDfHLzNWeYL3P2rlLKFHYl4PqgOoPPIZHl+q1odiB7zTdK2Zld
         z34g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ghut1fnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635a9cb1eesi92957851cf.181.2024.11.17.18.35.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Nov 2024 18:35:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ghut1fnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tCrbw-0006F6-4C; Sun, 17 Nov 2024 21:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1tCrbr-0006Dg-GZ; Sun, 17 Nov 2024 21:35:28 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1tCrbo-00038f-AN; Sun, 17 Nov 2024 21:35:26 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2ea49a1b4c8so631254a91.2; 
 Sun, 17 Nov 2024 18:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731897321; x=1732502121; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDhkR8LmHatlTom55ZykQ8zrqjy00iBivM6oEtjIx+I=;
 b=ghut1fnpQQ/tGR5mCWkv8OMQHDzx1mMs1ZlcpQKl8DOZN+bltcOtPr8TZTnAnSLOcB
 CHJFBgCXmP+C9jmU2QrMhQMZB740uOv0KX88llA5x8N4xQnKgDZy1uv/UiIAMmpUHai5
 AF3aV82zfrTnwtO953rz/hGoSqZHgTbNF/bWXJN+XZ66uPjn8lUH6tF02M/fSzk56Gc1
 qAvts0xBkgd03RlecraDJe935htlP6TOLo/nFCAHJMHDCdgiUniHpb06jb0hGc4MyCDe
 fsizYVmrjwvaFC1fjjKE6Us7cMEEXwJFUUsRJX8Gc6gbPEY5Ot/REQbeeR92p5vMHKSJ
 ec9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731897321; x=1732502121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PDhkR8LmHatlTom55ZykQ8zrqjy00iBivM6oEtjIx+I=;
 b=pOQns91OYFDzr7GQ2PliJrkAedgCu++OLrk+wOVi71Pgklv6fi4O4YtxFkGmcS3agO
 CIPXDcGGsluquvMYNM1P0nRwR3P/LElJPnMRFYmZbxlJGz5NSwG82m5WqIfxP+q8flsG
 7iIWgKW6ytD3Q4OspHzoatasqBKmY1crYhbK1gdp5lJetDo1jyTHp21eldOp230yLb34
 AzDMGvmiXWGRVu6k3t13bSXddjbLUy1gVg0Mb8T0AAi5MDipMWfPfUsod4kgjyUCvorR
 97oCsPMeAgJeGL8BSqEFXw9gUeA5lvKbO/cNSWbbDqCdIELYOi8y++f3m+MNbnZFuhcb
 0oPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+y9eLHZPxr+FTEWz+ruimTemP9hJJOtWduFutJ7ogWYRV/F7t/D2NIgM33pM60bsgLnBYRlOIBIV7Lw==@nongnu.org,
 AJvYcCWdGqHIBXje2CqCCCH/TCjc89VpiryjqI5CnoGOJwPqtNfGxRFoQmHk5ys8LoKhRbjRajN0K0BZWQ==@nongnu.org
X-Gm-Message-State: AOJu0YynB/lG6EVOWHuWquZOO4BHGCSVi1nVBHJEb9xdWn7ziOICMYQF
 ycp6iByUoK9RG8KryZFeRRuEY9kdw9APJ/qMZJYQ2d9YDiCOcOsp/TIe9E/l8aV5GlhIP2DXM9I
 CNZBE9RqgsFq6iG05cJO/IpMNYhg=
X-Received: by 2002:a17:90b:3ecb:b0:2ea:5823:c153 with SMTP id
 98e67ed59e1d1-2ea5823c73dmr5121008a91.19.1731897321212; Sun, 17 Nov 2024
 18:35:21 -0800 (PST)
MIME-Version: 1.0
References: <20241118021820.4928-1-joel@jms.id.au>
In-Reply-To: <20241118021820.4928-1-joel@jms.id.au>
From: Troy Lee <leetroy@gmail.com>
Date: Mon, 18 Nov 2024 10:35:12 +0800
Message-ID: <CAN9Jwz1YvLdUsW+YW4avAGaMheGpt5p=5ur=YQUXpyMqeoNhew@mail.gmail.com>
Subject: Re: [PATCH] hw/aspeed: Correct minimum access size for all models
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, BMC-SW@aspeedtech.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=leetroy@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wGTHNH0m7op8

On Mon, Nov 18, 2024 at 10:18=E2=80=AFAM Joel Stanley <joel@jms.id.au> wrot=
e:
>
> Guest code was performing a byte load to the SCU MMIO region, leading to
> the guest code crashing (it should be using proper accessors, but
> that is not Qemu's bug). Hardware and the documentation[1] both agree tha=
t
> byte loads are okay, so change all of the aspeed devices to accept a
> minimum access size of 1.
>
> [1] See the 'ARM Address Space Mapping' table in the ASPEED docs. This
> is section 6.1 in the ast2400 and ast2700, and 7.1 in the ast2500 and
> ast2600 datasheets.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2636
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Troy Lee <leetroy@gmail.com>

Troy Lee

> ---
>  hw/fsi/aspeed_apb2opb.c  | 2 +-
>  hw/gpio/aspeed_gpio.c    | 4 ++--
>  hw/intc/aspeed_vic.c     | 2 +-
>  hw/misc/aspeed_scu.c     | 4 ++--
>  hw/misc/aspeed_sdmc.c    | 2 +-
>  hw/misc/aspeed_xdma.c    | 2 +-
>  hw/net/ftgmac100.c       | 4 ++--
>  hw/sd/aspeed_sdhci.c     | 2 +-
>  hw/timer/aspeed_timer.c  | 2 +-
>  hw/watchdog/wdt_aspeed.c | 2 +-
>  10 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/hw/fsi/aspeed_apb2opb.c b/hw/fsi/aspeed_apb2opb.c
> index 0e2cc143f105..855dccf6094c 100644
> --- a/hw/fsi/aspeed_apb2opb.c
> +++ b/hw/fsi/aspeed_apb2opb.c
> @@ -259,7 +259,7 @@ static const struct MemoryRegionOps aspeed_apb2opb_op=
s =3D {
>      .read =3D fsi_aspeed_apb2opb_read,
>      .write =3D fsi_aspeed_apb2opb_write,
>      .valid.max_access_size =3D 4,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .impl.max_access_size =3D 4,
>      .impl.min_access_size =3D 4,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index a5b3f454e800..c8bb7e590696 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -1372,7 +1372,7 @@ static const MemoryRegionOps aspeed_gpio_ops =3D {
>      .read       =3D aspeed_gpio_read,
>      .write      =3D aspeed_gpio_write,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>  };
>
> @@ -1380,7 +1380,7 @@ static const MemoryRegionOps aspeed_gpio_2700_ops =
=3D {
>      .read       =3D aspeed_gpio_2700_read,
>      .write      =3D aspeed_gpio_2700_write,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>  };
>
> diff --git a/hw/intc/aspeed_vic.c b/hw/intc/aspeed_vic.c
> index 55fe51a6675f..8ee662064469 100644
> --- a/hw/intc/aspeed_vic.c
> +++ b/hw/intc/aspeed_vic.c
> @@ -286,7 +286,7 @@ static const MemoryRegionOps aspeed_vic_ops =3D {
>      .read =3D aspeed_vic_read,
>      .write =3D aspeed_vic_write,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .valid.unaligned =3D false,
>  };
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 2c919349cfc0..b7a62da45907 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -436,7 +436,7 @@ static const MemoryRegionOps aspeed_ast2500_scu_ops =
=3D {
>      .read =3D aspeed_scu_read,
>      .write =3D aspeed_ast2500_scu_write,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .valid.unaligned =3D false,
>  };
> @@ -777,7 +777,7 @@ static const MemoryRegionOps aspeed_ast2600_scu_ops =
=3D {
>      .read =3D aspeed_ast2600_scu_read,
>      .write =3D aspeed_ast2600_scu_write,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .valid.unaligned =3D false,
>  };
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index 4bc9faf691d6..ba700b008e5e 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -195,7 +195,7 @@ static const MemoryRegionOps aspeed_sdmc_ops =3D {
>      .read =3D aspeed_sdmc_read,
>      .write =3D aspeed_sdmc_write,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>  };
>
> diff --git a/hw/misc/aspeed_xdma.c b/hw/misc/aspeed_xdma.c
> index 1dd32f72f453..f222c632c099 100644
> --- a/hw/misc/aspeed_xdma.c
> +++ b/hw/misc/aspeed_xdma.c
> @@ -114,7 +114,7 @@ static const MemoryRegionOps aspeed_xdma_ops =3D {
>      .read =3D aspeed_xdma_read,
>      .write =3D aspeed_xdma_write,
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>  };
>
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 478356ee3e10..c8f6e1138ed0 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -1150,7 +1150,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc=
, const uint8_t *buf,
>  static const MemoryRegionOps ftgmac100_ops =3D {
>      .read =3D ftgmac100_read,
>      .write =3D ftgmac100_write,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
>  };
> @@ -1158,7 +1158,7 @@ static const MemoryRegionOps ftgmac100_ops =3D {
>  static const MemoryRegionOps ftgmac100_high_ops =3D {
>      .read =3D ftgmac100_high_read,
>      .write =3D ftgmac100_high_write,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
>  };
> diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
> index 98d5460905df..85e3f05e438f 100644
> --- a/hw/sd/aspeed_sdhci.c
> +++ b/hw/sd/aspeed_sdhci.c
> @@ -123,7 +123,7 @@ static const MemoryRegionOps aspeed_sdhci_ops =3D {
>      .read =3D aspeed_sdhci_read,
>      .write =3D aspeed_sdhci_write,
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>  };
>
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 149f7cc5a6aa..a116488aa2dd 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -460,7 +460,7 @@ static const MemoryRegionOps aspeed_timer_ops =3D {
>      .read =3D aspeed_timer_read,
>      .write =3D aspeed_timer_write,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .valid.unaligned =3D false,
>  };
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 39c3f362a833..d9fd6fc9079f 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -229,7 +229,7 @@ static const MemoryRegionOps aspeed_wdt_ops =3D {
>      .read =3D aspeed_wdt_read,
>      .write =3D aspeed_wdt_write,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .valid.unaligned =3D false,
>  };
> --
> 2.45.2
>
