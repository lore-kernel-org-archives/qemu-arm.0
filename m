Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp350117njk;
        Wed, 16 Apr 2025 13:25:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIPku+L6oNFHq5vYER3W+q7IwD0LgF9F6DGR6g7h0YOZPiIzsB/DEV3l0NS+8LSZ6OrRHCJ927mgo5Yg==@linaro.org
X-Google-Smtp-Source: AGHT+IFB6dRG5i8EwxVT8akqejgyMC9Mu1XfWpJXv0n36m+4gnetTLdBDwuZiA1mIPZgvjhRuzHS
X-Received: by 2002:ac8:7f92:0:b0:476:6a3d:de2e with SMTP id d75a77b69052e-47ad80b2c8emr46941451cf.14.1744835117878;
        Wed, 16 Apr 2025 13:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744835117; cv=none;
        d=google.com; s=arc-20240605;
        b=VdmpN/e3adtQkk5zsko/ps1K+rQF5bO6sEnmA+t/5fRu3DBAiHBnvr12cu2ZgTYe7d
         oAHK1ydLm+BmPzsmYWukIt6ypodf8PO5WC35us8UehZwSmb6sN55QNnWSHPYY0Cl8G6o
         GJyG4+7sd9vkMd9/niser4pRCkvMGz35XlpddKHUj10Vw/Q6SOHqtOuh0wSACrxQYtB3
         a7NZbs4ius/j9hnNRae0dM2FflFcKy5Gu78Uyi5OsZH+ekeKE+h78f+txYVczNN+Wc6N
         lLD/4AcUUP7bEH4Mrd5NkKTWK+MY3ORvmUqsRMfmdnrruijuouxoZiU8iJdOZPcp+Slt
         xesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=dbRjehg7BDu5aLWRv9UwWcITpA9l3iDZFOySPlh+RlE=;
        fh=1bI/JLenLI0qJHizA+wAQhlPk5HZoOclJEqO6vCqjXk=;
        b=XzFvT3N9tg0IgF24PrAQWdEca83LcK4aN7tFeTpyH2IL89I6WpiLFgHig8NWloy6P3
         vCCeEi0tuO4co9hYuMwlxjO0MlrjHdiPH0lAODkdw6cGRGBGsHXi3mavqVMVOOnkEWqH
         WfI6bnDLhfDXqi0hHj/08lz397rIAz3olSR/gv7MuyiILWEIJD67/5VaFmf/SUdHoIUf
         a6cK79x/SguPC0+0QDPdAbAIYl0eY8Xdjgf2kucPu/CQ5r19htau8Dw3GkB7TpKMYZrG
         eSxT1l7nIfbwtgOvDvABP9C/NLwEQzoqwA2clkk2hBPd9aHn73G1kIStciAK5jzYGsy4
         dlBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="qpD/0gcC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edd7965si138795911cf.464.2025.04.16.13.25.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 13:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="qpD/0gcC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u59JJ-00073a-Lu; Wed, 16 Apr 2025 16:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u59JB-00071l-94
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 16:24:33 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u59J9-0002IG-Fi
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 16:24:32 -0400
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-47666573242so114311cf.0
 for <qemu-arm@nongnu.org>; Wed, 16 Apr 2025 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744835070; x=1745439870; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dbRjehg7BDu5aLWRv9UwWcITpA9l3iDZFOySPlh+RlE=;
 b=qpD/0gcCJ4UvievklwX3AqAUtYLR86PKUC4dcW5PBmCdt54eVk3b1LKU+xsFGnOhbm
 +8yZA/e42SZgJvoRGLFEHTfy8ZTgPxBW25vi8LifHheMWRXs3gKBhOnUkTMuUtjWLO+B
 UuCAlFpVSk6s1jHQiNSC+iAjuZ4+YqINbt1zgC0ZP5iTLIGNLRVbADiNYfSgtmnN4Hva
 7pRs3btMr72fCdhSDh+K/RGE5cZ7tVRbed7o2G/MzpfRVj7+v5/qOnTUt+bCczBDtOwK
 MjARGDHoLZF6Gl+hQaMdITHKdRQKD4516NzYZs2BJU8oE8Y/I5AHFJOKFyYq/lZHavVv
 bmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744835070; x=1745439870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbRjehg7BDu5aLWRv9UwWcITpA9l3iDZFOySPlh+RlE=;
 b=HI3ZdOSoKVAFu+4OD72hBH1mRRc3h3RT0B0ZR5Ml62mkxOohCYp4P+cgA9bz6xL0ug
 mGDXQHzhZaUCO2yo0xc5yVqQ6ttKmbO1JuRwvB8f5KDvWqi0WgvyVRcLoRMXXs4now1e
 f+ygRI8hY/AXjnva9vWFpko155okLr713Db00z6ohaM8xpFCKtSJ3YGUjrwhkLzCnWXH
 Sv6X5376XkpusvAyfTC4hPSKabSuAkAFL2XrMqWgZ+FC0v/sS0vshQs6lxx2Xsmh0yC9
 opqZKM/J2Npbu910+MJnwLKs5Nuh7Pk+5mqc8cR6ikw8Kibx79Zl1k8K/OQI32o0TaQy
 CPaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZjvvRQIdOPW8cq5lePTw4JKCJ0fkgsde9/Gf2AxcC9HhzFWUS72EIXg3sjRQp8JhAiTPVCe+QeQ==@nongnu.org
X-Gm-Message-State: AOJu0YzRa3S3fLyrZZZ5DLw4tbpvUq1Q/fMAVFGyKSQw59RZeqt4tqQ/
 2evOZfDPVKMgvtxZhC6eKCSPS+3sx3o7Mas8QJQvvHXUTNDKzVhnDoB3MlidA+HA7yE2yf73bSw
 H8iyupWgk1G7JRZU3QmaCg1QF4kcFsqeJKAP1yEM3Jx+W0svC6e39vvM=
X-Gm-Gg: ASbGncvGtJ/ebGh8PNGySBSKUm/BEml8iA+saZhB9YfYx6ObYFoQJ3+qDptZBtW7JMj
 BK2H8v1TOM4w6Lwxm/8Hfu1OAwsMltaZoHyHaXp0fHwBr+2NMj7gaD3LBuwmporHEZwPWkPFFwx
 2HslJmrKEKQHsNTHxx51miMfqszDAeT19BSCq9B+6+nHKkEWmZEHqOTCEM6GUgJac=
X-Received: by 2002:a05:622a:2c5:b0:477:95a:ac57 with SMTP id
 d75a77b69052e-47ade63186emr836391cf.14.1744835070334; Wed, 16 Apr 2025
 13:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
 <20250416034327.315714-3-jamin_lin@aspeedtech.com>
In-Reply-To: <20250416034327.315714-3-jamin_lin@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Wed, 16 Apr 2025 13:24:19 -0700
X-Gm-Features: ATxdqUFq1ies6X_faHPMU06IjZSOxDjpJBR1rf9HQiubbulexA5x6RbYBnhWDAE
Message-ID: <CA+QoejXckB0N60DYXudiG12FN7jWZverWceYBXC5jpjHLP2hQg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] hw/arm/aspeed_ast27x0 Introduce vbootrom memory
 region
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -178
X-Spam_score: -17.9
X-Spam_bar: -----------------
X-Spam_report: (-17.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.268,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c0FZmQl6esih

On Tue, Apr 15, 2025 at 8:43=E2=80=AFPM Jamin Lin <jamin_lin@aspeedtech.com=
> wrote:
>
> Introduce a new vbootrom memory region. The region is mapped at address
> "0x00000000" and has a size of 128KB, identical to the SRAM region size.
> This memory region is intended for loading a vbootrom image file as part =
of the
> boot process.
>
> The vbootrom registered in the SoC's address space using the ASPEED_DEV_V=
BOOTROM
> index.
>
> Introduced a "vbootrom_size" attribute in "AspeedSoCClass" to define virt=
ual
> boot ROM size.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>

> ---
>  include/hw/arm/aspeed_soc.h |  3 +++
>  hw/arm/aspeed_ast27x0.c     | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index f069d17d16..9af8cfbc3e 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -59,6 +59,7 @@ struct AspeedSoCState {
>      MemoryRegion sram;
>      MemoryRegion spi_boot_container;
>      MemoryRegion spi_boot;
> +    MemoryRegion vbootrom;
>      AddressSpace dram_as;
>      AspeedRtcState rtc;
>      AspeedTimerCtrlState timerctrl;
> @@ -152,6 +153,7 @@ struct AspeedSoCClass {
>      const char * const *valid_cpu_types;
>      uint32_t silicon_rev;
>      uint64_t sram_size;
> +    uint64_t vbootrom_size;
>      uint64_t secsram_size;
>      int spis_num;
>      int ehcis_num;
> @@ -169,6 +171,7 @@ struct AspeedSoCClass {
>  const char *aspeed_soc_cpu_type(AspeedSoCClass *sc);
>
>  enum {
> +    ASPEED_DEV_VBOOTROM,
>      ASPEED_DEV_SPI_BOOT,
>      ASPEED_DEV_IOMEM,
>      ASPEED_DEV_UART0,
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index b05ed75ff4..7eece8e286 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -24,6 +24,7 @@
>  #include "qemu/log.h"
>
>  static const hwaddr aspeed_soc_ast2700_memmap[] =3D {
> +    [ASPEED_DEV_VBOOTROM]  =3D  0x00000000,
>      [ASPEED_DEV_SRAM]      =3D  0x10000000,
>      [ASPEED_DEV_HACE]      =3D  0x12070000,
>      [ASPEED_DEV_EMMC]      =3D  0x12090000,
> @@ -657,6 +658,15 @@ static void aspeed_soc_ast2700_realize(DeviceState *=
dev, Error **errp)
>      memory_region_add_subregion(s->memory,
>                                  sc->memmap[ASPEED_DEV_SRAM], &s->sram);
>
> +    /* VBOOTROM */
> +    name =3D g_strdup_printf("aspeed.vbootrom.%d", CPU(&a->cpu[0])->cpu_=
index);
> +    if (!memory_region_init_ram(&s->vbootrom, OBJECT(s), name,
> +                                sc->vbootrom_size, errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(s->memory,
> +                                sc->memmap[ASPEED_DEV_VBOOTROM], &s->vbo=
otrom);
> +
>      /* SCU */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
>          return;
> @@ -898,6 +908,7 @@ static void aspeed_soc_ast2700a0_class_init(ObjectCla=
ss *oc, void *data)
>
>      sc->valid_cpu_types =3D valid_cpu_types;
>      sc->silicon_rev  =3D AST2700_A0_SILICON_REV;
> +    sc->vbootrom_size =3D 0x20000;
>      sc->sram_size    =3D 0x20000;
>      sc->spis_num     =3D 3;
>      sc->wdts_num     =3D 8;
> @@ -925,6 +936,7 @@ static void aspeed_soc_ast2700a1_class_init(ObjectCla=
ss *oc, void *data)
>
>      sc->valid_cpu_types =3D valid_cpu_types;
>      sc->silicon_rev  =3D AST2700_A1_SILICON_REV;
> +    sc->vbootrom_size =3D 0x20000;
>      sc->sram_size    =3D 0x20000;
>      sc->spis_num     =3D 3;
>      sc->wdts_num     =3D 8;
> --
> 2.43.0
>
