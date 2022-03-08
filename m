Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2110911lfo;
        Mon, 7 Mar 2022 22:43:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxn44BtP7gfIaXA9F3Tu0556fszaZgiyaDeVA9yvsoTA33fcC8s0vAr7XodvgZpDHunHj/C
X-Received: by 2002:a25:9846:0:b0:61a:3deb:4d39 with SMTP id k6-20020a259846000000b0061a3deb4d39mr10890120ybo.537.1646721801719;
        Mon, 07 Mar 2022 22:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646721801; cv=none;
        d=google.com; s=arc-20160816;
        b=RFNzU7IaZyHmhfJUmyHZn5kCsW82cyj9caPVCDP38AOYqSRDlq+asFUdhUKG7vbaN4
         r4LVDSh+Pt2p76i9nMNdGBBo8X05LWR7X/1Txn7W2brxzsQw1Gpsw7RGo3OTC7PZjioc
         nVbjwaMI8h9VoHpXMEf3mTxdMiqNjqIQOKHFZvAhCRmVN40JvhBbodMcQZ5nStZZiQK7
         hY0yZ3F0giunEOpw2NQCqCLI0e3BHmM3u8mZuJYX9sq9ZyL06ONLzzXNB+8ljby1SE9i
         UCyWjhR16kbHMueu3LOdETtYrPjILDOcp0/8TpI1EnZt7/E05N8eHt3zF2n2hUWTMuaR
         qcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wwQxHg87rgATAIFN138+byD8xJcNZiHztfaTuelWFkw=;
        b=QoBzwAFmNtQrlFN+LGlpOatY4zqJ8Of8+GxqZsu/CDnjoCbT9Lhq93kL1nrtYJR+dK
         8pUjo7tGkjs6QHWiYT+v7qEwhq3q5NHaFJsooLk0MwJCMyeCGwMq4WiK3ms0GGQPd0ZF
         ozWc3suvYVEmFbiS4O5DOvKMu01JkEo4/+TaDHPpeppTMKhiRgY7WmryGNP0KRr0S/fy
         Wm0QGzYRKzM9HiSWihwrA96hMXQ0iapvzjTQNxvv9/B7yjVJFFhDfy2ENpyQsyKJaOk+
         bto+IQY+qtet3ZCYRs/uj8MW/IwP8Jqc4J9ZpExi2GjGw+OSsvPV264PVSdprKdAA1pK
         gm3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="Bop/v+ja";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j72-20020a81234b000000b002d0ccee7736si9096275ywj.203.2022.03.07.22.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 22:43:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="Bop/v+ja";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRTZ3-000773-5N
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 01:43:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRTYB-000769-FV; Tue, 08 Mar 2022 01:42:28 -0500
Received: from [2607:f8b0:4864:20::d36] (port=36576
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRTY8-0000YA-BT; Tue, 08 Mar 2022 01:42:26 -0500
Received: by mail-io1-xd36.google.com with SMTP id b16so5529369ioz.3;
 Mon, 07 Mar 2022 22:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wwQxHg87rgATAIFN138+byD8xJcNZiHztfaTuelWFkw=;
 b=Bop/v+jasDb1TtUO99hPPyV/57Z5oB0YyD2SB1dIZLD3Pcd4FXj2GEUOM83nxitrEF
 NXp5XhlNHFFhw2vCQQcFmcoN8hi/eg3JPCqNfCmXpaZe8V0pclcjygOXHjr3MzuGRlIo
 bv+AwYPtb9DYsCqCwWTi6STzcaA4IUBq3ym2XgLBgsm4hnIX9t/eiU0ghErnVhSr2TuT
 /1AA956DKRW5Ptoo/4+TpxlIesPN6WhB90S8G571L+ClBWHg6pqFkceXALDW0AT0ZKV9
 PJ3F0Togv90xRpkAJ04vVGv8ZOiTD3acZ5InPVXiVGzdAHCYGx10t0UHDpturkF73AmX
 7oQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wwQxHg87rgATAIFN138+byD8xJcNZiHztfaTuelWFkw=;
 b=c5eWt9/TXnXK3FLcSYzuHZYMU5HhQ4vCrV1VSPdG2f6SRnQ/Q+/hgcfypBHNxe37vs
 zg/SWL24KFnzkmdkbZtE86NsmQhY2h2cmUZUT+a1xQ3FBPuEM7TyleFr9Z1TlV/RdeL0
 s2xhNVHlyLkvKyyS/tLSUhbcRQfnNtxYX0d/sQ3TZ1dncYOkAYYoLBqp8D9rv8VwVTAA
 dofCAys6SnQ4cVakUNQw5JxW8MgfXk/yClhByROmFUq6kv6h6xfAvpacMU2pfkike4KM
 JkyC+nan3fuXnw8osgcQpG7lHZ6ZpTUUOFGMutJnlgfB5s0rHNEOwriBMQIW+PPnIEiU
 AWXg==
X-Gm-Message-State: AOAM530aiOd+8LXc3MHCunnQ+rjTY7PCqERgBgZ3uPpkoblfpdfxPe2p
 wpHEl+DBguQwlqsfINhac/9ZoGGWvAAP9J0bVo8=
X-Received: by 2002:a05:6638:15ce:b0:317:b681:157b with SMTP id
 i14-20020a05663815ce00b00317b681157bmr9521743jat.66.1646721742176; Mon, 07
 Mar 2022 22:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-6-clg@kaod.org>
In-Reply-To: <20220307071856.1410731-6-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Mar 2022 16:41:56 +1000
Message-ID: <CAKmqyKOxi+0VJUd+a2oJCoRoz1=3RE335BySrO8p5UsYM45ofg@mail.gmail.com>
Subject: Re: [PATCH 5/6] aspeed/smc: Let the SSI core layer define the bus name
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aOjNzn7NELmp

On Mon, Mar 7, 2022 at 5:34 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> If no id is provided, qdev automatically assigns a unique ename with
> the following pattern "<type>.<index>".
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/aspeed_smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index f194182beacf..113f31899a6b 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -1130,7 +1130,7 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
>      /* DMA irq. Keep it first for the initialization in the SoC */
>      sysbus_init_irq(sbd, &s->irq);
>
> -    s->spi =3D ssi_create_bus(dev, "spi");
> +    s->spi =3D ssi_create_bus(dev, NULL);
>
>      /* Setup cs_lines for peripherals */
>      s->cs_lines =3D g_new0(qemu_irq, asc->max_cs);
> --
> 2.34.1
>
>
