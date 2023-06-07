Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp82902ejb;
        Wed, 7 Jun 2023 01:05:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ66sKiFdxnx6xSflwszMCIRxnLSWcI5m4nr9kewmU/XfHsLz0dm+meD+TiY0NoYLeecVMUB
X-Received: by 2002:ac8:5989:0:b0:3f5:47c9:e0e with SMTP id e9-20020ac85989000000b003f547c90e0emr2783068qte.31.1686125146763;
        Wed, 07 Jun 2023 01:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686125146; cv=none;
        d=google.com; s=arc-20160816;
        b=UBvaUDTqLAhQAxw7kmyVHQv5ZWeIzEtkhVvZly9vnrLOvbeEF9eg/1y+qG5bdEbgw9
         UHjvU97+7BoyNWqIPDPMwmhSZVRb2ERjZaxXcfVepG9xwhRwWr7yPYnWvfwXDmuKhJId
         CEW2A1Mo0th68I7QaAYJZ5ZAlXBVXt5exyUUQIfVbS1emZgTFd852jAHFsQIt0cZ5LZc
         a/uen3fyKIM3hBb7uc9cfPu0nHVUG3qfDo2bq60uLD+sOW72rAnuVhnV1zHem/5DUiS0
         Nt+vwfUt2xBFzj1yxLmNZ2HYYACYftMfUnLsLaChSsk5BF+eJK0bpijxWI1RN3OFyIGz
         YKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=r4DudlWtOGcG2W35ZmNqz55d+WKC0X2Tmtyl5HiywPQ=;
        b=p0uevUQH0MzQq+AjFO74tgBk9dZIu2a54kFfu7gJEihc+owRmNs+Mq4om8nr7tXraC
         /a4yOBniyV7m6BsFZuIixkS+GV5vIZ1WxHtKUQf/pxUqI3QBMFMzAbpbaN/ePhbs0FFi
         9hEN6nY+OS9PyHLLT/WIp+DX9308F48yqBdKNq5zeTat1tS1rwlDtrxiXjx2XzUOXgGy
         WfijTF/gdJVw2iITnerEBYNeuzXFNbZYu+RQ5uY9jmpazlIk69UMv6OZwkHfRkmlra68
         kjdWlffT2AXZBQWkfouA6IGPClPlFqQEEgzqH33y9jWpV7hpskRAv8D62NGQMqSM1QLy
         flOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=GaV85uAn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020ac858cb000000b003f2266d4aa3si7338958qta.724.2023.06.07.01.05.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 01:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=GaV85uAn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6oAY-0006e1-AD; Wed, 07 Jun 2023 04:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6oAG-0006WK-Q4; Wed, 07 Jun 2023 04:05:08 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6oAE-0006jo-Kn; Wed, 07 Jun 2023 04:05:08 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9786c67ec32so287819866b.1; 
 Wed, 07 Jun 2023 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1686125105; x=1688717105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4DudlWtOGcG2W35ZmNqz55d+WKC0X2Tmtyl5HiywPQ=;
 b=GaV85uAn7Cq0qDpLbojQRD1Jl7N369T6MAvHzKg5D75OgZ653ximKMkUiDx1iRAJyN
 s2wV/oDAD1+aTVUj4WH5qn5Z7JK0rXXnXsNwDhckXSNWvBDctZ/tg3MURSqVOKxrbFgv
 V63BAlO1n50TrAm+7pdgxSalb+OaZn/aOJ8Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686125105; x=1688717105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4DudlWtOGcG2W35ZmNqz55d+WKC0X2Tmtyl5HiywPQ=;
 b=KEatZFm1qLLI5wB7/wnhKT01KZD07ulu3gwYROfy5/6Pfmsk7fCy9CRkGuSLN6JU+g
 he0Qxq7xTmFIc+hSFaptoSiElyH5q37KvJsHXmfYlJEp+lQi2mpSvEQYYwbuH2sMbhxg
 IXdufpXx+036djrh1psBD8g9a5Dx5CdM0Lo/8ts4+V6oCZRTBCUI+MJ8Og3TBy82gYMN
 44MOZpnqOkNPkCdFKnRCXa8Hv4KR0XetoK2jm5J69R77EX67UrM9SIw1MqnJQVGorjnW
 YSlIbrI4H+YA28LnYCSYBCWtGTriajm4BkYHngH3/LN2fUp0Acw8YfFFsMZbxFkBG4Uc
 sK5g==
X-Gm-Message-State: AC+VfDy/Pu4GzjoZ/AYFQYLxOYNetNpDGXkEJIqXGPoFWGKvTwiqFeRY
 6twR8OQr1WIhtgGG0NFHS1neEbQmY104ou15iUk=
X-Received: by 2002:a17:906:4fc7:b0:977:4b19:97a with SMTP id
 i7-20020a1709064fc700b009774b19097amr5341723ejw.73.1686125104404; Wed, 07 Jun
 2023 01:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-3-clg@kaod.org>
In-Reply-To: <20230607043943.1837186-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Jun 2023 08:04:51 +0000
Message-ID: <CACPK8Xd5YmYfVY08sV_K9JMWH-bXuFUx84y1y00r5P-D_79ddA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] aspeed: Introduce a boot_rom region at the
 machine level
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T/X3AwVHh66x

On Wed, 7 Jun 2023 at 04:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> This should also avoid Coverity to report a memory leak warning when
> the QEMU process exits. See CID 1508061.

Ok, so now our layout is this if booted with a mtd device (rainier-bmc):

address-space: memory
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-000000000fffffff (prio 0, i/o): aspeed.spi_boot_contai=
ner
      0000000000000000-0000000007ffffff (prio 1, rom): aspeed.boot_rom
      0000000000000000-0000000007ffffff (prio 0, i/o): alias
aspeed.spi_boot @aspeed.smc.flash.0 0000000000000000-0000000007ffffff


Reviewed-by: Joel Stanley <joel@jms.id.au>


>
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index bfc2070bd2ed..76a1e7303de1 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -40,6 +40,7 @@ struct AspeedMachineState {
>      /* Public */
>
>      AspeedSoCState soc;
> +    MemoryRegion boot_rom;
>      bool mmio_exec;
>      char *fmc_model;
>      char *spi_model;
> @@ -275,15 +276,15 @@ static void write_boot_rom(BlockBackend *blk, hwadd=
r addr, size_t rom_size,
>   * Create a ROM and copy the flash contents at the expected address
>   * (0x0). Boots faster than execute-in-place.
>   */
> -static void aspeed_install_boot_rom(AspeedSoCState *soc, BlockBackend *b=
lk,
> +static void aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBacken=
d *blk,
>                                      uint64_t rom_size)
>  {
> -    MemoryRegion *boot_rom =3D g_new(MemoryRegion, 1);
> +    AspeedSoCState *soc =3D &bmc->soc;
>
> -    memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom", rom_size,
> +    memory_region_init_rom(&bmc->boot_rom, NULL, "aspeed.boot_rom", rom_=
size,
>                             &error_abort);
>      memory_region_add_subregion_overlap(&soc->spi_boot_container, 0,
> -                                        boot_rom, 1);
> +                                        &bmc->boot_rom, 1);
>      write_boot_rom(blk, ASPEED_SOC_SPI_BOOT_ADDR, rom_size, &error_abort=
);
>  }
>
> @@ -431,8 +432,7 @@ static void aspeed_machine_init(MachineState *machine=
)
>
>          if (mtd0) {
>              uint64_t rom_size =3D memory_region_size(&bmc->soc.spi_boot)=
;
> -            aspeed_install_boot_rom(&bmc->soc, blk_by_legacy_dinfo(mtd0)=
,
> -                                    rom_size);
> +            aspeed_install_boot_rom(bmc, blk_by_legacy_dinfo(mtd0), rom_=
size);
>          }
>      }
>
> --
> 2.40.1
>
