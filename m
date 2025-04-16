Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp350362njk;
        Wed, 16 Apr 2025 13:25:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhvTC4xD3r9KoMWUiW0OQ7uZmYPbgsvYjrJivsjsgPHXAIl36qplaR8M6ihw7ax9BggzF5olNzeUKS0g==@linaro.org
X-Google-Smtp-Source: AGHT+IFz6nBn6eyAxpyh15kUYRCHzZgtAfdUWw43vGz6b+FwFFa7Ca1B2Akf+fYrkxG0eo6D0kgh
X-Received: by 2002:a05:6214:258b:b0:6e1:6c94:b5c5 with SMTP id 6a1803df08f44-6f2b2f1f463mr52845376d6.4.1744835148802;
        Wed, 16 Apr 2025 13:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744835148; cv=none;
        d=google.com; s=arc-20240605;
        b=ly6xdKWegSyAynSDO7/2CTnm77CJEjU8tKH2WhKk+yTeNqmyWbtveyRg13P7RDCyYA
         RF1VMwEN+rbIq8a47eVCX0XmJe2sV4GAPITgA0KoHhvP2RfcCP/Jg2ZGGJJ8zUwmvRaC
         Q81Y5JlHWqCJ/GcIMa/I8FKcvdOwy4xPltKIb5DeC9QePd7wR8z4sTYuoaQ/KGKv1zh9
         /gWpeHsj1khJHAb1c2X/J/KzYIbQvxLWLn/t0ZxNtqxuxkRRQZgY2AS/P+kEcd+NGXst
         KAG7sr4XUUYItoIWCNlzhCHGreRalkOVXQxI0vP5M34af3G45k0Kstp5G3JEItXYbIE4
         QBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QdImBUd8+Y3gUuU+siH992oEhjyYPvebA76p06tGW50=;
        fh=8BjRvvQBNkmp8GAWFti0Je5eFxTp+2OkPYwJczaYCnk=;
        b=YMrS/sns5dtf7T/k8p4nWXGAlzdkL4PnYw8A0Buij1YPTUKvnbHGUYOxIyhP0KTd5o
         6YkDCHZfn80t7FpWsoretNhmJxrGlYlSc6kiDFeg9lOtQubo1t33l8agqu4gtGYeNq/w
         UIRcCWxqON1leBQ29wwZRJu8H9W3meRmUnVhT2d6sqrPXv6Y0vBJryrURaxW3sp9RmFt
         AxSq1BcZ6QbliyWi9K2IoXd0FdHJygE0SdzZBJvJCaoBoQewRnJtdCTkFKta+1eeP0zL
         1UjrGkoYQk1qyX6cK1u7sJr0YVqgFrXN5JPt02E1GyNRToNw47d12MuaJHBYTpECHSa0
         fhgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JYnUvT7d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de9eaf79si158979056d6.276.2025.04.16.13.25.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 13:25:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JYnUvT7d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u59JB-00071m-CL; Wed, 16 Apr 2025 16:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u59J7-0006zW-Kh
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 16:24:29 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u59J5-0002Fs-Ge
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 16:24:29 -0400
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-47681dba807so12881cf.1
 for <qemu-arm@nongnu.org>; Wed, 16 Apr 2025 13:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744835066; x=1745439866; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QdImBUd8+Y3gUuU+siH992oEhjyYPvebA76p06tGW50=;
 b=JYnUvT7dGOTMMibG4KWnCv11a1vTCp8Vb5xGo6QhpmCSQrTGcitnu5IdKSI+Bd4hPo
 qGP+2A53NajPPKPANW5yD9PHCL5rjd2Wnrn03kS1jcU9qJjdGcalQpF2l5E+ge48b/ql
 3V3gRUc2BJAuvPL9Go7GU6+4pTE9VFg1bwaUrgOxjJ7jTNTYBA3HjvEre7jX0wddanXD
 tYFa+JazaXLhOINHUomtfR9AFxO0qbFSx3bQpj6pZE89FxxKnxxfBby15VO2Rt3cxN8Q
 9sXaQIPhMNtYt67OCzhzywDO87VI3HFkOW9vgDkBUiXBWvi7BKy0t/cPFVx7A1+TtxU0
 KqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744835066; x=1745439866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QdImBUd8+Y3gUuU+siH992oEhjyYPvebA76p06tGW50=;
 b=bPmtlITAsmfgpaXPDPZLvsleIZ3G6+INSdVvNsDfKpLiMc9Z5Nxrt0pBMh+MHTrqs4
 LomgKlO23zVmzTTNRrBF88WW4yGI/0+JG6aq2pAK7FUajBjhQZf6MArUbbgb9S1/eJOR
 JXMrWstfmOOGqwwDnkGNGFY8JjVNGDZ2a6IDLbSOQWvoW7Em83RnmKDCFeoxa0YJwqW1
 EZZwtdgDUXazcFF95bhBL73LI4FQb9bTxTAJrOC7jNjahNvt0oZf/GkzC/R1gWOttbgU
 2Ck7w8P8xJaBQ5e7GyhDTcey8lNpe2I/agAHJeLgwFJnt5Qpze8zJ1+Gb3GMPUjpLCdM
 yD/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHm/7OXIc9F9Nbl/K9AvM5ZCFsFGm9mr1Gk3q5EA8DTVg4bI2hCX9w0dQLR3nvAjHdC2ldZ9cAtA==@nongnu.org
X-Gm-Message-State: AOJu0Yx+abs6ztmsNi/7DmbH+IFiroRHc0bsyWcW48EmPRgDFZIbv93H
 RLiCmfLC/Q1azZP0flPQ6ubanB43j+G12XgG7RKbGpKB9wA91OBsNtCe4xS8gO5bW7HN2Y8TKua
 HUCGLzKbnM+c0R9OS9bpHHwL8a1L6yQOY+sKH
X-Gm-Gg: ASbGncsJPR/u5MGMDYaBm/m8kJNyIQ7s14ED5pBWARnLafnPxGPHUe6yFdhncEOOnA4
 M4wEbVaqDI7VZ+ORNwAOWLkZqxSlQN3V9AB6aMa4bLvtpiByqalG6I/YQRoewgAJE6SEWSncYhH
 eNhjpPrH4ZBrAY3SeIzNttQgjBjhkRrCU37/IMRZ/LHq5ZIcWXXT96
X-Received: by 2002:a05:622a:1903:b0:479:1958:d81a with SMTP id
 d75a77b69052e-47ade6170eemr806031cf.6.1744835066112; Wed, 16 Apr 2025
 13:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
 <20250416034327.315714-2-jamin_lin@aspeedtech.com>
In-Reply-To: <20250416034327.315714-2-jamin_lin@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Wed, 16 Apr 2025 13:24:14 -0700
X-Gm-Features: ATxdqUGkYVhDuwFt_ty5X90dDFxcR_vIYlceIt9E0absZVr1ZmxwBQEz8giN328
Message-ID: <CA+QoejXTjwpR_tW4JzD6=FoUhm3_Rftdr-8M4xDbRKGX_H4k2Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] hw/arm/aspeed_ast27x0: Rename variable sram_name
 to name in ast2700 realize
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, troy_lee@aspeedtech.com, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nwc2qWjrmwVa

On Tue, Apr 15, 2025 at 8:43=E2=80=AFPM Jamin Lin <jamin_lin@aspeedtech.com=
> wrote:
>
> The variable "sram_name" was only used for naming the SRAM memory region.
> Rename it to "name" for consistency with similar code and avoid unnecessa=
ry
> new local variable declarations.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>

> ---
>  hw/arm/aspeed_ast27x0.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index dce7255a2c..b05ed75ff4 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -577,7 +577,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *d=
ev, Error **errp)
>      AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
>      AspeedINTCClass *ic =3D ASPEED_INTC_GET_CLASS(&a->intc[0]);
>      AspeedINTCClass *icio =3D ASPEED_INTC_GET_CLASS(&a->intc[1]);
> -    g_autofree char *sram_name =3D NULL;
> +    g_autofree char *name =3D NULL;
>      qemu_irq irq;
>
>      /* Default boot region (SPI memory or ROMs) */
> @@ -649,9 +649,9 @@ static void aspeed_soc_ast2700_realize(DeviceState *d=
ev, Error **errp)
>      }
>
>      /* SRAM */
> -    sram_name =3D g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu=
_index);
> -    if (!memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram=
_size,
> -                                 errp)) {
> +    name =3D g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu_inde=
x);
> +    if (!memory_region_init_ram(&s->sram, OBJECT(s), name, sc->sram_size=
,
> +                                errp)) {
>          return;
>      }
>      memory_region_add_subregion(s->memory,
> --
> 2.43.0
>
