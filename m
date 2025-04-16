Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp350367njk;
        Wed, 16 Apr 2025 13:25:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWJrsmTSuaouaeTJXlVKSgtC1tQpJYc3+hmNM7pJFeHMnq9+7RRWXF3/En167sMOOjU7UaIDyLLHbxwA==@linaro.org
X-Google-Smtp-Source: AGHT+IGKYkTNrzXmpBoNXXfCSkTma3WW3q17QepgTld/OOQjJKvZUZ1JcPymeaRxgLMceSZGIM5K
X-Received: by 2002:a05:622a:1984:b0:472:1225:bd98 with SMTP id d75a77b69052e-47ad816909bmr50421251cf.50.1744835149048;
        Wed, 16 Apr 2025 13:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744835149; cv=none;
        d=google.com; s=arc-20240605;
        b=cle59V4bYLcevg/AQMfAZ3DFdBGS0kI44079Rq+6xJDAaWqr9Zez0Wtp8zA+c9MDtd
         EPpz+5dsu1nWjEvxaz6t1DSO/jyZKlYhufQD83NMRGP5bfMPM/Ygax5ItG01qaRIW8Lx
         +f4Oh13ED3SgNGG8tekhOJljxJUoA6ZqNUQTQIwS6RfKYofWhMDnsMM7068RP88SGmcy
         N3MGI5w5UoPHeF0BNXA3lCXdRe1soI3Py8B863gtYyjwBuO5QF5SxcNheRu27k+TEpWg
         1EVRd67RNOeAZsy4M2hvz+31yi6UIKgUSAIi15EiD2H3NKLwQOBO533LrRXv+QnjDH83
         pt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Xq388DhXZB9hNvxukWG3QesZ8hs+pPdsydsNVKIkg9E=;
        fh=kQdy2ZB8npsFfBs004vi39FIkYm4WbSXkrUsQevhb5Q=;
        b=F1mJObp7isV/QSShKduSv+mDHsVVhIJG1vGZw1k40yp8unoLbPc3BeguFrQCVkri26
         BfKbvH9bKJ+8GObCPkU0wIp0RfxynA32M4SC5bsoqa75NjsjHRys3mvw8ikG3lb8u4UA
         EUkmr2xHJv09uYRG2TUU0MqiLv9pqqRWDTqYV+DceAuwU5AOafxqsSfI+uhJdf0HRcwS
         +O73VgxmfvaduZ2qxaR8d92RqpVThYzUxcDPEZvg2pHmMCOK2slZ5bT3JPdSWaOwnamI
         cDY3AwZKXay+kDKjqJMUOUsq5CVq1bpNFnKqafULsB2w53VD8vS8mWo1R9++Jsmq6HjQ
         W9+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=eec+e2kB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796eb0d6c9si142935031cf.27.2025.04.16.13.25.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 13:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=eec+e2kB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u59JE-000732-4O; Wed, 16 Apr 2025 16:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u59J9-00070q-O4
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 16:24:31 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u59J7-0002Gv-LS
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 16:24:31 -0400
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-4769e30af66so21011cf.1
 for <qemu-arm@nongnu.org>; Wed, 16 Apr 2025 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744835068; x=1745439868; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xq388DhXZB9hNvxukWG3QesZ8hs+pPdsydsNVKIkg9E=;
 b=eec+e2kBpZSXqlN6fTOI2qZId4264Mi9et/EcRVidYIUezM1IhT/5dJBGNAYL3WtCE
 C4jKvShCD4HZgIHbzuESxaHu2VEYsmd1WG3bMovKWJ+oZOh41w+QL5T+ImQNgxlalNdG
 NQucsie6gbzdvJk5+XVlyvKyOWwGYQfTxoBhD9zm/wFJiUzuUuCmWMnnZurMwNyAtoIM
 W+bDWtnVFLPy7+fcvMNrn+T4VbcKV6Kr07CBBP0B3R9OunMduFhBGFiQcCEZVe9BZ6FS
 m3e66qz0mAWPxNU5VzpJAdFG1jcVZhSjYrBOAiCjaU93QJ5ajuX1FruXPN/qtlos/NRo
 iszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744835068; x=1745439868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xq388DhXZB9hNvxukWG3QesZ8hs+pPdsydsNVKIkg9E=;
 b=U4oUigXcabKzAos2Hllwm3euwaH3v6Ia6pLZ+WZGpfobP3wDJ9r0k1u/TCWDgJN6rl
 dXfDF3mxXcdkdzqlUZ2rRfj74Ep1AeIZ0DX0B6nszh9X4UNaWM3WB5eQj+HzarS/M/Nt
 rtY/8yv5DAKA2GejxmtIMnX1HNxu4q+PAPBKtrYjNXg78YGv3bCeAXlDTLtOfIDs2/lU
 w0mvHyaPmwO4BnVvV67kn7lDBuq1viEy1IuGUkIPSmulTOhocyGYPgMuqZpmSeI0WEpR
 vmoX1jCgJeZ+itJrXv2/TOafwXWz2NOcAOduFuQFOMpNqqbTdg9YNphG6klYVRWTVrK+
 T56A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdYtX7zcH736Ur9v4mm4CVbzv9FCLQl2sddZ8zyOlGqINh1KqAElFWyA27vOYaD1adGeJJw4KA7A==@nongnu.org
X-Gm-Message-State: AOJu0YyIDXcVe1Dl0a6aawp295zPy2peH30G1lG/WJc1jfRnevZh5JqT
 gLnyLoXjBv/2l9mntAiGgkIyzAtNxxx6VoxoGY/bYGU8oNr7O3b7x7g4EQzZybs1UvYvcQB63EU
 OOlqpz0ABBPm4Hp8Z86qMYs+FHX+usfEXMP2y
X-Gm-Gg: ASbGnctZkYxAjTBSZt7RMiCagk1iYxLzI0Ub+K+j8+o6q0HWsbI1cd1aag00PgPGdSU
 t+JLaaB8AUQJlsdabMenYtg0CRJjzOJQXHJaGvveTbbkBZMvoOIzxxThXqmcA34/+i9FZdI2GD3
 9/QrqPXazhqLxe973HsJKTP5s23KyPkhpfzhTadkNI/Ds1tWP1oKkU
X-Received: by 2002:a05:622a:14d4:b0:479:973:46f1 with SMTP id
 d75a77b69052e-47ade6ac501mr965301cf.22.1744835068400; Wed, 16 Apr 2025
 13:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
 <20250416034327.315714-4-jamin_lin@aspeedtech.com>
In-Reply-To: <20250416034327.315714-4-jamin_lin@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Wed, 16 Apr 2025 13:24:16 -0700
X-Gm-Features: ATxdqUGzMUpbSUdHOBu1xoXj518eftjerrPMnQNDiUOFR192a8s55Im3UDVqj_0
Message-ID: <CA+QoejUwtpNrDLfQrxv5u-3eDeD+McT=+WVwrPp84hm-bXT5-A@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] hw/arm/aspeed: Add vbootrom support on AST2700
 EVB machines
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82c.google.com
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
X-TUID: v24ZcUyxzAd1

On Tue, Apr 15, 2025 at 8:43=E2=80=AFPM Jamin Lin <jamin_lin@aspeedtech.com=
> wrote:
>
> Introduce a new "vbootrom" field in the AspeedMachineClass to indicate wh=
ether
> a machine supports the virtual boot ROM region.
>
> Set this field to true by default for the AST2700-A0 and AST2700-A1 EVB
> machines.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>

> ---
>  include/hw/arm/aspeed.h | 1 +
>  hw/arm/aspeed.c         | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index 9cae45a1c9..973277bea6 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -40,6 +40,7 @@ struct AspeedMachineClass {
>      void (*i2c_init)(AspeedMachineState *bmc);
>      uint32_t uart_default;
>      bool sdhci_wp_inverted;
> +    bool vbootrom;
>  };
>
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 82f42582fa..e852bbc4cb 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1689,6 +1689,7 @@ static void aspeed_machine_ast2700a0_evb_class_init=
(ObjectClass *oc, void *data)
>      amc->macs_mask =3D ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
>      amc->uart_default =3D ASPEED_DEV_UART12;
>      amc->i2c_init  =3D ast2700_evb_i2c_init;
> +    amc->vbootrom =3D true;
>      mc->auto_create_sdcard =3D true;
>      mc->default_ram_size =3D 1 * GiB;
>      aspeed_machine_class_init_cpus_defaults(mc);
> @@ -1709,6 +1710,7 @@ static void aspeed_machine_ast2700a1_evb_class_init=
(ObjectClass *oc, void *data)
>      amc->macs_mask =3D ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
>      amc->uart_default =3D ASPEED_DEV_UART12;
>      amc->i2c_init  =3D ast2700_evb_i2c_init;
> +    amc->vbootrom =3D true;
>      mc->auto_create_sdcard =3D true;
>      mc->default_ram_size =3D 1 * GiB;
>      aspeed_machine_class_init_cpus_defaults(mc);
> --
> 2.43.0
>
