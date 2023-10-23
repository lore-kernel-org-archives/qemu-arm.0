Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1703519ejb;
        Mon, 23 Oct 2023 16:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8w2nWh+HZlFNOmui4LNC4XFid0GTJ51Tkcx8zcpyMA/rg7fVxExj3tZHNEMD1nG5rPgv6
X-Received: by 2002:a05:620a:460b:b0:778:ba73:1650 with SMTP id br11-20020a05620a460b00b00778ba731650mr7349199qkb.30.1698104657539;
        Mon, 23 Oct 2023 16:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698104657; cv=none;
        d=google.com; s=arc-20160816;
        b=CirnopO3+ucOnX+9gS68nnAsi2HL5byypdMGkPpmnnh4gPQx8WSyk8hj8pR5qinlug
         y4piQnCxl1LobHOSdUdk0qVntwwCnFMV7L0+LzGNgxTMghQRDbntgtKmCdJG0oYmE2BZ
         38kOF7IukrdY5RvlaMq+/+O9Um1yMv5wgM1G5tIYJnI2sdey1Rg9YHr6HRk++bi6vbWX
         hFze2tGz1YTi2CysvlS0E+hQ8g7SqdQSsIjqvDTJrFY4zkCjDOhbrWqggUAWfJbQbbIz
         YuGaDz59WBLmHyeyWKJOI/ndxfF/ba9if1zUObiElQFea1uRbDJOFaSG3j07NjBIuVgs
         oaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=vVQ6R0s6mgvK7aJB8O+3GzfbNvo+mvSprNLad1Ie9pc=;
        fh=/SviTIaqxTzHHYPxkjS8pq1bWql+bndpuOeJjhZ9g24=;
        b=DOQfkxKsIm1ZRVSnlXYIDM2hMeeHE7fUBrWwLUmVPaGAI9k+hEasIF91rftxkeJj0m
         nzvoDodiAO+fkOLj5COlckQytaoWSRAngrfcLOz14DAYTS9OoQdsFaQOWdMSyzMs6Jm2
         qx1d7tTjkA941DEw14yiyWAyitZbNxac9+qlBIjJ/yQGe1ZR9qclgqygp2nHfLN6VWzy
         Lf6KHP1UHQh4K4u/gdNFbX5mMCcyTfGxNd4daWaqxza9/6gkF2FO5+UJQNaLy4ej0nT5
         8b26Eo5xWuo3wgVZEcGKjew42DveqA9o2tQiE9BnJmaef/IsKziwjZSrcXh7y2ctSYLt
         0hqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=Py08vbpP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22-20020a05620a071600b0077263dd03f3si6205018qkc.33.2023.10.23.16.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 16:44:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=Py08vbpP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qv4aR-0001Aj-5T; Mon, 23 Oct 2023 19:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qv4aO-0001AM-Tq; Mon, 23 Oct 2023 19:43:53 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qv4aM-0002Dv-LO; Mon, 23 Oct 2023 19:43:52 -0400
Received: from [192.168.68.112]
 (ppp118-210-136-142.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.136.142])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 50ACE20059;
 Tue, 24 Oct 2023 07:43:43 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1698104623;
 bh=vVQ6R0s6mgvK7aJB8O+3GzfbNvo+mvSprNLad1Ie9pc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=Py08vbpPh/l4MVZELML74anp3r4p/ewMSNNgkF4mm6MKtqfnuj5J49f/3DA6HLv2q
 7w1/pCSIy+gGKditQCfSsF8vOONhVIorleVfXhlz1uCYsTrWmsySOTVcwiIiWdEhB6
 mMTEgNYtzOL8saZyDzNDRrdxUkDcTvW3hEwHnH3uZ+OFsm65KGk1tx6bf1mnf0O7de
 pu49orJIuRNCCs+LewCoNcZkwhwgNJKYui6OnGu4OlJ01tZ+dpZy7pTbkv93QloYvN
 bb0w32qO8VWRspkhu7dVmv49t1jxDPwRKFkCIEeW3LnpvhweHdt9NzYlZ0jkKv5pMS
 5QupV5MARpa5A==
Message-ID: <7ba3d0298be8edbfbbc16882aa17fa38e70662be.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 3/3] misc/pca9552: Only update output GPIOs if state
 changed
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, philmd@linaro.org
Date: Tue, 24 Oct 2023 10:13:41 +1030
In-Reply-To: <20231020182321.163109-4-milesg@linux.vnet.ibm.com>
References: <20231020182321.163109-1-milesg@linux.vnet.ibm.com>
 <20231020182321.163109-4-milesg@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
X-TUID: grj3uPaVgJ8W

On Fri, 2023-10-20 at 13:23 -0500, Glenn Miles wrote:
> The pca9552 code was updating output GPIO states whenever
> the pin state was updated even if the state did not change.
> This commit adds a check so that we only update the GPIO
> output when the pin state actually changes.

Given this is intertwined with patch 2/3 that adds the input mode
capability, I think they should be squashed together?

>=20
> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> ---
>=20
> New commit in v2
>=20
>  hw/misc/pca9552.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index ed814d1f98..4ed6903404 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -112,14 +112,15 @@ static void pca955x_update_pin_input(PCA955xState *=
s)
> =20
>      for (i =3D 0; i < k->pin_count; i++) {
>          uint8_t input_reg =3D PCA9552_INPUT0 + (i / 8);
> -        uint8_t input_shift =3D (i % 8);
> +        uint8_t bit_mask =3D 1 << (i % 8);
>          uint8_t config =3D pca955x_pin_get_config(s, i);
> +        uint8_t old_value =3D s->regs[input_reg] & bit_mask;
> +        uint8_t new_value;
> =20
>          switch (config) {
>          case PCA9552_LED_ON:
>              /* Pin is set to 0V to turn on LED */
> -            qemu_set_irq(s->gpio_out[i], 0);
> -            s->regs[input_reg] &=3D ~(1 << input_shift);
> +            s->regs[input_reg] &=3D ~bit_mask;
>              break;
>          case PCA9552_LED_OFF:
>              /*
> @@ -128,11 +129,9 @@ static void pca955x_update_pin_input(PCA955xState *s=
)
>               * external device drives it low.
>               */
>              if (s->ext_state[i] =3D=3D PCA9552_PIN_LOW) {
> -                qemu_set_irq(s->gpio_out[i], 0);
> -                s->regs[input_reg] &=3D ~(1 << input_shift);
> +                s->regs[input_reg] &=3D ~bit_mask;
>              } else {
> -                qemu_set_irq(s->gpio_out[i], 1);
> -                s->regs[input_reg] |=3D 1 << input_shift;
> +                s->regs[input_reg] |=3D  bit_mask;
>              }
>              break;
>          case PCA9552_LED_PWM0:
> @@ -141,6 +140,18 @@ static void pca955x_update_pin_input(PCA955xState *s=
)
>          default:
>              break;
>          }
> +
> +        /* update irq state only if pin state changed */
> +        new_value =3D s->regs[input_reg] & bit_mask;
> +        if (new_value !=3D old_value) {
> +            if (new_value) {
> +                /* changed from 0 to 1 */
> +                qemu_set_irq(s->gpio_out[i], 1);
> +            } else {
> +                /* changed from 1 to 0 */
> +                qemu_set_irq(s->gpio_out[i], 0);
> +            }

Slightly code-golf-y, but the inner if-else here may be compressed to:

    qemu_set_irq(s->gpio_out[i], !!new_value);

Andrew
