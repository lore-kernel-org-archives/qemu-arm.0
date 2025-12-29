Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6723E92FD0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:40:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ5I-0005Q7-Kr; Mon, 29 Dec 2025 14:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4Z-0004TE-7c
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:31 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4X-0000Kk-ER
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:30 -0500
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-4edb8d6e98aso4444811cf.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:38:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037108; cv=none;
 d=google.com; s=arc-20240605;
 b=J/HUXyzkbuTlChEz4/QZvAn77z2xn88hi13Ra6QDl+8uroihEK5yLceKRzCjoAqejD
 XZuY9XsO8W0SWR1nmplFaIWRdFmxQIzbcz5hseGUOVdkjuRNT5+9PjecOpIgKKV38HRF
 08fw3PZ9hgNPwfbskS0hwpW+SZkc5cvI+O3LkYxeTot/F+4TlLhhwcE50/W1lTrAM4It
 CZUlJfTPnpVDLbVc3FkHv3CR+fUJO/ZWRO8f1POvD8slOH6MOcDjl/TnwJBrDgEHx3dS
 yjNaKIGHHb2KiMWD/jfez/0UQPd4xR1mpCscwDOQHEH40nSv+tGqZLBgxbcXvjWXjF5V
 3flA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qv0jCg2159mDZHHBdB7dewdacOELInSCXp4slgil/GQ=;
 fh=nQ8ZHYPqIYWhgnYPqITS4rOzmQQ6UwE+xMcx8smTLHE=;
 b=PwK51cFf0eEHoUBXveKLmAaf2UGmQPdYh18lWsh//X5V5EIHXBXCeMWaY3vYb0jYKT
 lJcoTX83v40FWKLqx+KTUm59b+GuxKEapU9PhBxmy/retTGecNJ/5xoEBI5FqyZeTQwL
 Da+IADW8WA6js/rEGu3a8BWOpo74IiNINxXBUkL0e5Xe++YJWJ6o4pLG3FOGuFHPQA0j
 UGMQlChGcAmkjJ0TdUghhbQSdu6DinSSEz44ZZ9AtRWMJTh/a28WlNTc77pJaoi1eFRc
 r2zzuXznOY0ivht3YGNPWKJCb2/pzFbyxwVAQayqMtxKjkbb9N+tZgdV+BWcDYsYmOqQ
 Wy0g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037108; x=1767641908; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qv0jCg2159mDZHHBdB7dewdacOELInSCXp4slgil/GQ=;
 b=IUGE1PK7aDNSvTk5h6Stpm5exK0iU5yYZbRki5OZFPVWXBuj14pTgwxjO8q8O3n0yr
 CaoHD+lhefxQ9jUzJtXddarl3GJErOsmjHyIcpgOgR5qAKaQavuCvKmZ2bOoZSM78HjP
 O7eRDD/gJcnZRKn784ALAQ4nNeJJoQWkSztT5I30jnB6LEw7zWqGeNCmrhxXA1TKOAy3
 KmsKqZKpGu7id5He7O7Pjb0jB6ETssvptZBLDmIHjpOmiNfJmq6jEvk01bZ0yU+SjdGQ
 cSNgkCf/ofK3nT/f/vQAntARc2Is6hf61Zhizf/GcxQHANE9zzrd6xeOIapqpQa9XHi1
 YkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037108; x=1767641908;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qv0jCg2159mDZHHBdB7dewdacOELInSCXp4slgil/GQ=;
 b=Xn5fhCjHpC0EU/GTKTW3MbIvioG4PrTxlJQR7ObW8fwz39QLjc3HDUMvtITYhxP0Y1
 ASllCSiov4NNm4lr7wHjXB3ihtYXylDrLqtKuKeFTHTT07FzbzGmGUOV6y2f6a+liN+9
 nCjmC3keIF/7q6Z6JD4qYIe88/HQO8n19B9VLo/QOh6/HL4L3atG2jzq4aZTx+aXf2Hi
 SP52d8OdrrF/BeEXTIO6SuYFtItlS2cgNqks1o3JeGjFxdspyIKHWevDjfqwsfjG6+dQ
 ivqa5gbp+4LV81+fD2L9PgNW5TdwYrh1m74p+IvOYT1PfNh2P25JaXObuDx130j9mlNy
 RZ9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWETD3RKxfoEpS9tFFhl3vTU3IpRdwmpnk7bq/ds89JNyM+bfKn7tK9qyJHkxjohJIjLPQcfEKwYA==@nongnu.org
X-Gm-Message-State: AOJu0YwOzvB4fuCI2BclMHddLYZdrzMhsv5ZWYaYGI6BdhPDH1OLpmLV
 XJuGuyCgtqcqqsnmvpdU6ZU/mQR5EPifdFYuv0JPODRx2epV9IBPcyrSCC8FVEZjFVdnoohN4N5
 VOtaNyWYJmk4VsFd5ylzAg1rnpSAW/VhF5tI9MsFt
X-Gm-Gg: AY/fxX5uol0hc2wYcb5oJa/PnO3m1DhjVu/A3x237dVgNDtBquPCO6xmCk2OCzt9hvH
 f87dUQzjCb4qRNE3HqKq8cZ1GfUaSvoFbSKCoZ7Ngf/wnXJ2d9ia/owvWfwvujUJ3GXwb+tstnT
 PYmozBNMPuUwsJbxA50h1+QZoaM1GdFKOz6LgL6ucDy0YAkhm6tDmWkrF+ysZuHITzZE78mWdof
 BeVFE3+dTLSXihTBxvEy/bpVy5swarvVoydbf2sJAi/Lx7ZYxuOxRQ/WcCu4AFAVfbMfihfS5t1
 HS2CdFDh1flWRfRLObOekanBtw==
X-Google-Smtp-Source: AGHT+IFltA75U6hBVtYBQKo5a8T7YYz4REkaWWi7G9FtsoWW9ooij3iNzPoW94aUnGU0DYTngsJHbChgk0Exoqe5TuA=
X-Received: by 2002:a05:622a:307:b0:4f3:5474:3cb9 with SMTP id
 d75a77b69052e-4f4e4e2b98bmr40539251cf.14.1767037108223; Mon, 29 Dec 2025
 11:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-13-kane_chen@aspeedtech.com>
In-Reply-To: <20251224014203.756264-13-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:38:17 -0800
X-Gm-Features: AQt7F2oXzmSJqnU0sb2-dfutCYSSeAap9wjitSSYkqyQfHRE9KscjofE_unNvTY
Message-ID: <CA+QoejV1LAmXR5ygafjuQg0G2A1KLn6sGREMBr6uHWeUL8=31w@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] hw/arm/aspeed: Attach SCU device to AST1700 model
To: Kane Chen <kane_chen@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Dec 23, 2025 at 5:42=E2=80=AFPM Kane Chen <kane_chen@aspeedtech.com=
> wrote:
>
> From: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> Connect the SCU device to AST1700 model.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>


> ---
>  include/hw/arm/aspeed_ast1700.h |  3 +++
>  hw/arm/aspeed_ast1700.c         | 17 +++++++++++++++++
>  hw/arm/aspeed_ast27x0.c         |  2 ++
>  3 files changed, 22 insertions(+)
>
> diff --git a/include/hw/arm/aspeed_ast1700.h b/include/hw/arm/aspeed_ast1=
700.h
> index 0c1216c4ba..12c57145c6 100644
> --- a/include/hw/arm/aspeed_ast1700.h
> +++ b/include/hw/arm/aspeed_ast1700.h
> @@ -9,6 +9,7 @@
>  #define ASPEED_AST1700_H
>
>  #include "hw/sysbus.h"
> +#include "hw/misc/aspeed_scu.h"
>  #include "hw/adc/aspeed_adc.h"
>  #include "hw/misc/aspeed_ltpi.h"
>  #include "hw/ssi/aspeed_smc.h"
> @@ -23,12 +24,14 @@ struct AspeedAST1700SoCState {
>
>      MemoryRegion iomem;
>      uint8_t board_idx;
> +    uint32_t silicon_rev;
>
>      AspeedLTPIState ltpi;
>      SerialMM uart;
>      MemoryRegion sram;
>      AspeedSMCState spi;
>      AspeedADCState adc;
> +    AspeedSCUState scu;
>  };
>
>  #endif /* ASPEED_AST1700_H */
> diff --git a/hw/arm/aspeed_ast1700.c b/hw/arm/aspeed_ast1700.c
> index e4d206045f..6494a5c4eb 100644
> --- a/hw/arm/aspeed_ast1700.c
> +++ b/hw/arm/aspeed_ast1700.c
> @@ -20,6 +20,7 @@ enum {
>      ASPEED_AST1700_DEV_SPI0,
>      ASPEED_AST1700_DEV_SRAM,
>      ASPEED_AST1700_DEV_ADC,
> +    ASPEED_AST1700_DEV_SCU,
>      ASPEED_AST1700_DEV_UART12,
>      ASPEED_AST1700_DEV_LTPI_CTRL,
>      ASPEED_AST1700_DEV_SPI0_MEM,
> @@ -29,6 +30,7 @@ static const hwaddr aspeed_ast1700_io_memmap[] =3D {
>      [ASPEED_AST1700_DEV_SPI0]      =3D  0x00030000,
>      [ASPEED_AST1700_DEV_SRAM]      =3D  0x00BC0000,
>      [ASPEED_AST1700_DEV_ADC]       =3D  0x00C00000,
> +    [ASPEED_AST1700_DEV_SCU]       =3D  0x00C02000,
>      [ASPEED_AST1700_DEV_UART12]    =3D  0x00C33B00,
>      [ASPEED_AST1700_DEV_LTPI_CTRL] =3D  0x00C34000,
>      [ASPEED_AST1700_DEV_SPI0_MEM]  =3D  0x04000000,
> @@ -86,6 +88,16 @@ static void aspeed_ast1700_realize(DeviceState *dev, E=
rror **errp)
>                          aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_ADC]=
,
>                          sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->adc), =
0));
>
> +    /* SCU */
> +    qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
> +                         s->silicon_rev);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(&s->iomem,
> +                        aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_SCU]=
,
> +                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->scu), =
0));
> +
>      /* LTPI controller */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->ltpi), errp)) {
>          return;
> @@ -111,6 +123,10 @@ static void aspeed_ast1700_instance_init(Object *obj=
)
>      object_initialize_child(obj, "ioexp-adc[*]", &s->adc,
>                              "aspeed.adc-ast2700");
>
> +    /* SCU */
> +    object_initialize_child(obj, "ioexp-scu[*]", &s->scu,
> +                            TYPE_ASPEED_2700_SCU);
> +
>      /* LTPI controller */
>      object_initialize_child(obj, "ltpi-ctrl",
>                              &s->ltpi, TYPE_ASPEED_LTPI);
> @@ -120,6 +136,7 @@ static void aspeed_ast1700_instance_init(Object *obj)
>
>  static const Property aspeed_ast1700_props[] =3D {
>      DEFINE_PROP_UINT8("board-idx", AspeedAST1700SoCState, board_idx, 0),
> +    DEFINE_PROP_UINT32("silicon-rev", AspeedAST1700SoCState, silicon_rev=
, 0),
>  };
>
>  static void aspeed_ast1700_class_init(ObjectClass *klass, const void *da=
ta)
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 84ff8b5557..6b9ad328dc 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -573,6 +573,8 @@ static void aspeed_soc_ast2700_init(Object *obj)
>          /* AST1700 IOEXP */
>          object_initialize_child(obj, "ioexp[*]", &s->ioexp[i],
>                                  TYPE_ASPEED_AST1700);
> +        qdev_prop_set_uint32(DEVICE(&s->ioexp[i]), "silicon-rev",
> +                             sc->silicon_rev);
>      }
>
>      object_initialize_child(obj, "dpmcu", &s->dpmcu,
> --
> 2.43.0
>

