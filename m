Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2671528lft;
        Wed, 22 Jun 2022 22:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sEfdXIm9biBmMPVqaUn/6BOAvpEvp15WEabAfoKPp12SMcTU8OXjDiXLXNpO6pt48lUKJ9
X-Received: by 2002:a05:620a:2584:b0:6ab:91fd:15dd with SMTP id x4-20020a05620a258400b006ab91fd15ddmr5060469qko.287.1655962384229;
        Wed, 22 Jun 2022 22:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655962384; cv=none;
        d=google.com; s=arc-20160816;
        b=VAjdA4CIl6YzFQ78THDw6NHYsK4De9FJqBynYv3KKGuD1WsHIgs+Y5pTC2/GV6qHP6
         Guxx4G9bUQrY+2Zktdj9yOOwTmRiK5BMyxenVx1k3wiMCqSxo69I+1akEMgP+FfhJnZA
         IDZuEs8yAbf/X9yMM8QxnMWkEevxbxVpMS3YT/8ZvLx0s34IhqIChPEIqys+GlnPMFEk
         4rsadR0vKuhor8eaa1EjGgm5gSbQi2qbE1dgLIlFGhLNheJTx7I1JfnuEWQLYyQ5NUMJ
         QDc4NHAOabcCYQwL1kvyQpK2GFDIgs3SEj4mA7KjB9uNB1KgCIW+KYk68KQh6Sz4hBCG
         bbMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hd//IKengoQDseyXtqsqh8Bu5uUyi1meP0Nyo4qw+Wo=;
        b=rzRuvZ3zxO4j4urcjPbHdzssEztv9sgjy1poQOnALRI1KChifnfDOOuEv8Xu58ae9q
         VgK2DQOe981Cmn3CwNjELsl3bbyjmuYgk2Iiyva4vBacKTm/HLHM7SWmF2n+06WWxkLJ
         Vw/feKJkGzqhU98fEvIXBJXgwjbtPp0PQRYT3NCf7Pah0RrmkbbgNLwTJxR2gjnXck9u
         An6XV8AB1+GJs69TMA+cJIjGdZMzE8cbJ9nUB5XB7z0eR8gXrpCInwRqQRBwDjaKkrkV
         a5JVznoTxuwFYywXxCY2ptajtEeOO2/F+8aATTK3loQRv0gC2Sn+VmdnPApkpPcg2gzN
         BIJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=lQ0k1rKD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if9-20020a0562141c4900b004707800ef67si1086417qvb.280.2022.06.22.22.33.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 22:33:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=lQ0k1rKD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4FSh-0001DQ-K9
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 01:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o4FNK-0007KW-Au; Thu, 23 Jun 2022 01:27:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o4FNI-00023d-PB; Thu, 23 Jun 2022 01:27:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id i10so22515515wrc.0;
 Wed, 22 Jun 2022 22:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hd//IKengoQDseyXtqsqh8Bu5uUyi1meP0Nyo4qw+Wo=;
 b=lQ0k1rKDw4Q481QSPrpnKs1omLecrE2XpV/NoHKgk4zfAlm6qlzXa9hUUcPBMuXdqX
 E+e1EOt2Cbr9YCb/jDhSnnfBu4YGfnGpwe4FowRrFjmJZAeyEl3tIWbbndIrq36M5yvX
 9owk0zQBP9lgZ8czKAEeG7PMgkNGSH+19TpGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hd//IKengoQDseyXtqsqh8Bu5uUyi1meP0Nyo4qw+Wo=;
 b=idNavUoxlH49OErHInKipTaAGkRYKz9g32kfC8pS2sc2nuQVsgfTQGX+QsZWDi70om
 JMsSLym/IWwZ+cutRrt8qUdY1COff8opZyZnAgRheaCkFiGNDi38GklG1iDTEHMH3run
 KFim2Pvf45REF3TKYRIpBh/76aJNO0Xi4hbk3J/pw7F9T6TLe39tSib9VAhj6d/ahgpZ
 OP+wQutS55QYaMj8nfXVFypiyisurOdMQ4c+pUs1E1iU+a/TqedDGUBymIJnbMW1wfyg
 nwQUaWtI+A76c6OCNUu43mY31TLZUm2793Tfsmh7YQ52yNqEDFLxUMnuC570jnDLhhbS
 HKKQ==
X-Gm-Message-State: AJIora/3HO0jz4LA9MM8jqsn7Fr3v6n+YzibRiHsqRs+qKhJFBpq4RJ5
 AYQ8G+4/xbsyBH7REogbnbwUpuHpqj66k1HnLro=
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id
 o9-20020a5d47c9000000b0020fe7da6a48mr6583913wrc.315.1655962047045; Wed, 22
 Jun 2022 22:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-10-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220622172830.101210-10-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2022 05:27:14 +0000
Message-ID: <CACPK8XdtsfsV8_L9C_XZ+AHZ0wAwdxgXmSxW5bZ3YHOr72Qvkg@mail.gmail.com>
Subject: Re: [PATCH 9/9] hw/arm/aspeed: firework: add I2C MUXes for VR channels
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Titus Rwantare <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x2Ayj3LJ15Qe

On Wed, 22 Jun 2022 at 17:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> Add 2-level cascaded I2C MUXes for SOC VR channels into the Firework
> machine.
>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
>  hw/arm/aspeed.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 526f3b651a9f..866a60cf7b4e 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1038,7 +1038,7 @@ static void qcom_firework_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
>  static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
> -    I2CSlave *mux;
> +    I2CSlave *therm_mux, *cpuvr_mux;
>
>      /* Create the generic DC-SCM hardware */
>      qcom_dc_scm_bmc_i2c_init(bmc);
> @@ -1048,16 +1048,24 @@ static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>      /* I2C4 */
>      qcom_firework_fru_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x50, 128 * 1024);
>
> -    /* I2C - 8 Thermal Diodes*/
> -    mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9548",
> -                                  0x70);
> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 0), TYPE_LM75, 0x4C);
> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 1), TYPE_LM75, 0x4C);
> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 2), TYPE_TMP75, 0x48);
> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 3), TYPE_TMP75, 0x48);
> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 4), TYPE_TMP75, 0x48);
> -

You only just added this. If you modify the previous patch to call the
"mux" variable "therm_mux" then you don't need to modify it in this
patch.

or just squash them both together. I don't think there's much value in
having two separate patches.

> -    /* I2C-9 Fan Controller (MAX31785) */
> +    /* I2C7 CPUVR MUX */
> +    cpuvr_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7),
> +                                        "pca9546", 0x70);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 0), "pca9548", 0x72);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 1), "pca9548", 0x72);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 2), "pca9548", 0x72);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 3), "pca9548", 0x72);
> +
> +    /* I2C8 Thermal Diodes*/
> +    therm_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
> +                                        "pca9548", 0x70);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 0), TYPE_LM75, 0x4C);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 1), TYPE_LM75, 0x4C);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 2), TYPE_LM75, 0x48);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 3), TYPE_LM75, 0x48);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 4), TYPE_LM75, 0x48);
> +
> +    /* I2C9 Fan Controller (MAX31785) */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x52);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x54);
>  }
> --
> 2.25.1
>
