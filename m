Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99549D3B9AB
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 23:02:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTTB8-0006EF-Gq; Wed, 10 Dec 2025 18:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vTTB6-0006D0-5H
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 18:01:00 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vTTB4-0006Ww-Jc
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 18:00:59 -0500
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-4edb8d6e98aso206211cf.0
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 15:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765407657; cv=none;
 d=google.com; s=arc-20240605;
 b=UQrS60Day6Ebje3Zs0npBuye6Ye0uDD1+/exCLrKnw8CH1lDLZ9IbJHhjCcgt7T0Eb
 fcdjsQvEBfi5DJWd3rWD2WwTwDUdcstASyX+loxkilIHsVseqQ/6JCYECnGDWgSrXvEw
 xdQL75C8qE8JBZRMtTwSG7n45kgUF0KjTCYlwPcsjPHfVspew3zJsQGfI4dnFtLdgunk
 EezyBdG3ZehSK7FKcYsIndWukhaQuci8LsMvhDFqaisBgDmm2Bi6JmPBll+AsIP7W9sw
 3IgSKwLEhZOifInrSV9Izi5OmhQJMvAnEvQzxxj/idNF+eKaCRrwYbARRl3A4goy1xTj
 c9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Hm0IOTG2G5675/h26bvJU6kW4LaWvamaY/sywK1kIGQ=;
 fh=cjrREfIHAzxFqsuq+fA8/KNVtuKyHUSNm8+yFyPmIxo=;
 b=JQCvmsPVph4GeZKsIK4xLlxnEahkIffxT0MX9DE0w3K0IHU8XGCYhusr6Vtzyhq1YU
 7HpHwcW1kz+Mk3MIrdcK908eNDJSbPVPNg59oPzOWnnIGm02dFSoqPg/VrEJkCZoY62f
 /7OSdj9MI3IdqtihE2mP40bM5hby0ZRH7hyE7jIolFjyKrkfoW9Ob6nfSrF7J29t908s
 NBY9X7B7wQLstpMbF2TN+xJOEyZyA8V+N/HrPq0fNvZ3+JIjI3IyO2W48mAqIddRSVqY
 J8ovvJ/MQYqjwFaa1RAxA5JOtwqWWXvDbfVh4IVH/ZxYZoKBbiow2p7CAV4ztk5ksOXR
 u+wQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1765407657; x=1766012457; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hm0IOTG2G5675/h26bvJU6kW4LaWvamaY/sywK1kIGQ=;
 b=a5mqwCw0hjI9noyUi37TEbx2yMkdlurAeXJmcY4CGbsz9N9CaM6ZuMPOFogIlDslbi
 dH51FI1kuKR1lkUH5zwP1Z/Ujbpnd4R8HnlQxyIuigCuQxCGpLdgPiyE43l4FJqDp+WW
 /KLnWEHs5Dyo8qC9taJyutk23uUm65BFtfoeuDx9umxp4p53rOjuDSsLenudAVZzx+/b
 iiKLgja5lMpPRvJhsaXhQgzEWWuhYSw1kbRHBW5hC6oIO20S8OaYyv0aQo2csr9aHrec
 HqTLzZ8NlPKEHni4gMpIChg5QoSLv/vBtabrW7mp2PQwLpRFwzfTGWgIbakKE7zM4nFz
 sh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765407657; x=1766012457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hm0IOTG2G5675/h26bvJU6kW4LaWvamaY/sywK1kIGQ=;
 b=NkORRWxFqnyrYLFv0mQK5pjICiuUG840mzhBytcaLbO2aSlpiGG7K52jTRqtRWh9Cg
 z04vyOx32An9IyIiMfF/fk5GloTZRAhxSLAfxTMJY5CdT9aepxsrF2sJ8O4xfQZ9mLr7
 dv8QhW3yNccLDPoU9qrFVzTpT1Cn7BVfhYlmddlgO+1D2sXRg02/NFCbedSBQE1HfTyo
 E0VAPP39vJE77GYE0S+tDopARNtmho8sBSFhG0BLv5TW1qJ5az1DzcwF0m9LuFGvGIqL
 28+K8yY/JukvqlRcmKy+j3WN6Xy3sXUUNFCQD/MSriRhd9jBq3ysmnyUKh5xT5gNVmvH
 zVlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh7P4GQ8yo6HfaP3863t3716DzivAAJa1I4gzVfaPXlchZulVzsAwrNodXtrfYk61M/WbOX7gzUQ==@nongnu.org
X-Gm-Message-State: AOJu0YwSkbnZvsfNM8DFf9VWwaFYkRQvS86VAdQX+MX4SFR9pmM6i02t
 OYumvm3yon9z3P8JHmT1nbsLBJ3jC2xGFFznAMMNzy8Gvhd95wwF9QLOWK8zDiSwDge0nLmoBPL
 02U+FAlcnYQ14998AV6qseA/fipqiIa2XwdEEvr/1
X-Gm-Gg: ASbGncsH33iNTsaj3AEw83bdUnqQGEi/qEdEm4pBNRjwNmBqsgsOXYIyjvNlcguMukv
 yLoYe12FNc9LW9LPC07sqDl3EDFMsEJpMbp3Z1ZFO5LN1o0xd0xYEDVHsL1Ce+YqFr7MG7fYCnZ
 zEgjVwmwO5EZOak005SxJKytbmD0kSkvWI1NRu7ESRUxggIWNZSIH/zp6Z1TIxxZeVbGgk1tDRD
 7CBkbO1SNk5HjLnFc1vg7uiYuUZyExurfVhZF7EEOm+t1egPNdEMou67rXkQA34TRlq/EbFJOQ2
 T7u7l5rpg/TFhV9foKyoJq59Kymv
X-Google-Smtp-Source: AGHT+IEA7fWY7sNmSowmp8WZRO2yQuVguk6w54vs+u5TrvXYcWxnH7rEweMGjLtCrhhOza8w4a12c7Di2q3PBgEjjOw=
X-Received: by 2002:a05:622a:341:b0:4ed:a65c:88d0 with SMTP id
 d75a77b69052e-4f1bd86ad85mr4074121cf.6.1765407657054; Wed, 10 Dec 2025
 15:00:57 -0800 (PST)
MIME-Version: 1.0
References: <20251208074436.1871180-1-kane_chen@aspeedtech.com>
 <20251208074436.1871180-3-kane_chen@aspeedtech.com>
In-Reply-To: <20251208074436.1871180-3-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Wed, 10 Dec 2025 15:00:44 -0800
X-Gm-Features: AQt7F2ooJiX1we7OOLgJttgVpvA4KZOkNsGMqhVLiqcO5DEfyVxEYnPkhm_1S9o
Message-ID: <CA+QoejW+YugMO=uCJJzPt3tSdk63+HpYPXmh=s9JKtPXHdB=dw@mail.gmail.com>
Subject: Re: [PATCH v3 02/18] hw/arm/aspeed: Attach LTPI controller to AST27X0
 platform
To: Kane Chen <kane_chen@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Sun, Dec 7, 2025 at 11:48=E2=80=AFPM Kane Chen via <qemu-devel@nongnu.or=
g> wrote:
>
> From: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> Connect the LTPI controller device (representing the AST1700 I/O
> expander) to the AST27X0 SoC model. This patch sets up the memory
> mapping and device registration according to the AST2700 SoC design,
> where the LTPI controller is exposed at fixed MMIO regions.
>
> This change only handles device instantiation and integration,
> without implementing the controller's internal logic.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> ---
>  include/hw/arm/aspeed_soc.h |  5 +++++
>  hw/arm/aspeed_ast27x0.c     | 21 +++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 18ff961a38..bca10c387b 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -43,6 +43,7 @@
>  #include "hw/fsi/aspeed_apb2opb.h"
>  #include "hw/char/serial-mm.h"
>  #include "hw/intc/arm_gicv3.h"
> +#include "hw/misc/aspeed_ltpi.h"
>
>  #define VBOOTROM_FILE_NAME  "ast27x0_bootrom.bin"
>
> @@ -55,6 +56,7 @@
>  #define ASPEED_UARTS_NUM 13
>  #define ASPEED_JTAG_NUM  2
>  #define ASPEED_PCIE_NUM  3
> +#define ASPEED_IOEXP_NUM 2
>
>  struct AspeedSoCState {
>      DeviceState parent;
> @@ -112,6 +114,7 @@ struct AspeedSoCState {
>      UnimplementedDeviceState ltpi;
>      UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
>      AspeedAPB2OPBState fsi[2];
> +    AspeedLTPIState ltpi_ctrl[ASPEED_IOEXP_NUM];
>  };
>
>  #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -279,6 +282,8 @@ enum {
>      ASPEED_GIC_REDIST,
>      ASPEED_DEV_IPC0,
>      ASPEED_DEV_IPC1,
> +    ASPEED_DEV_LTPI_CTRL1,
> +    ASPEED_DEV_LTPI_CTRL2,
>  };
>
>  const char *aspeed_soc_cpu_type(const char * const *valid_cpu_types);
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 70be3871bb..341b53189b 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -88,6 +88,8 @@ static const hwaddr aspeed_soc_ast2700_memmap[] =3D {
>      [ASPEED_DEV_UART10]    =3D  0x14C33900,
>      [ASPEED_DEV_UART11]    =3D  0x14C33A00,
>      [ASPEED_DEV_UART12]    =3D  0x14C33B00,
> +    [ASPEED_DEV_LTPI_CTRL1] =3D  0x14C34000,
> +    [ASPEED_DEV_LTPI_CTRL2] =3D  0x14C35000,
>      [ASPEED_DEV_WDT]       =3D  0x14C37000,
>      [ASPEED_DEV_LTPI]      =3D  0x30000000,
>      [ASPEED_DEV_PCIE_MMIO0] =3D 0x60000000,
> @@ -556,6 +558,11 @@ static void aspeed_soc_ast2700_init(Object *obj)
>          object_property_set_int(OBJECT(&s->pcie[i]), "id", i, &error_abo=
rt);
>      }
>
> +    for (i =3D 0; i < ASPEED_IOEXP_NUM; i++) {
> +        object_initialize_child(obj, "ltpi-ctrl[*]",
> +                                &s->ltpi_ctrl[i], TYPE_ASPEED_LTPI);
> +    }
> +
>      object_initialize_child(obj, "dpmcu", &s->dpmcu,
>                              TYPE_UNIMPLEMENTED_DEVICE);
>      object_initialize_child(obj, "ltpi", &s->ltpi,
> @@ -1047,6 +1054,20 @@ static void aspeed_soc_ast2700_realize(DeviceState=
 *dev, Error **errp)
>          return;
>      }
>
> +    /* LTPI controller */
> +    for (i =3D 0; i < ASPEED_IOEXP_NUM; i++) {
> +        AspeedLTPIState *ltpi_ctrl;
> +        hwaddr ltpi_base;
> +
> +        ltpi_ctrl =3D ASPEED_LTPI(&s->ltpi_ctrl[i]);
> +        ltpi_base =3D sc->memmap[ASPEED_DEV_LTPI_CTRL1 + i];
> +
> +        if (!sysbus_realize(SYS_BUS_DEVICE(ltpi_ctrl), errp)) {
> +            return;
> +        }
> +        aspeed_mmio_map(s->memory, SYS_BUS_DEVICE(ltpi_ctrl), 0, ltpi_ba=
se);
> +    }
> +
>      aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->dpmcu),
>                                    "aspeed.dpmcu",
>                                    sc->memmap[ASPEED_DEV_DPMCU],
> --
> 2.43.0
>
>

