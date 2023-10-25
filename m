Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2546040ejb;
        Wed, 25 Oct 2023 00:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbh3sz5HTcV3y2J4htSx8rP0pSh5De92gQFwjDW2RMK3eP/xiVpe5izWoSX4gukHvqY7XE
X-Received: by 2002:a05:600c:1c97:b0:401:d803:6243 with SMTP id k23-20020a05600c1c9700b00401d8036243mr11032863wms.32.1698217663012;
        Wed, 25 Oct 2023 00:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698217663; cv=none;
        d=google.com; s=arc-20160816;
        b=utYJaJLFPyAx/unj4HYdINxiHMYr7qANisom0tTSWbSHfe4sWMU30yPiHw+4EluwvL
         ckJCDlc8bl8BCrS2JTub4xKr1whUXab4uuJejmglvuwc5YaQMxxIAFyNTl1w15pnhmNf
         JvJKCDVudUzzpf5b3a7DDunBL13GBgNPqd7GHXL3TjyjfOuSjEL8tYjrLClngh57x4Sy
         ijwYFF9tM+9jurIgXu0tS3QreHM6WEoUUq8EUe5lu6ySU3d9/i/7UGqKTRVk88Zk/H8Y
         8si7w7CMos5s1tSH+73tMB1vZbTaT932HLrZHnQ6hGwt70Cay185Pn0rlpUQNdmYzDPY
         yKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=vG6w4xxGA2Z8kLBORyUWKbgtL7fuYWaYBz9cdH4QjQE=;
        fh=keE2KatKG8lbgXGZXmt3WBgtkhQ6uEw33ggpupitLEY=;
        b=nMT+tU/hltLYuyzZAab5c1YQruYJl9R9gM6dS/3s6fno9gGRolgnYYQqhn9uwjI92/
         pR+60KaOBNJRcIaZ9QSwEr3pcafy9zaGmkUx3sZsG1r/YDHUOVuHehpdI9EBidVS5aCy
         ra6xH4utW5MaKrTgBPus0Drr+nuomy8+dfTx48pS0rxSB4ezpXECAqlDowxF2gwSX4hu
         eSgnrhP7nYbaFb+nxpZBTWs5Kn3iKAGz1Ui7Q3GJgwLckYQJqRnHyMuH5JueDvbQ4QQN
         +vWhr3Ik+hZq2AYPU6dXSmJ4sux2+3AnJA5qlmemOOVwjT3BsMGkraUF/ltI69sgira6
         yxZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020a05600c474b00b004084d8e163fsi7167340wmo.52.2023.10.25.00.07.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 00:07:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvXzL-0002Xt-Iq; Wed, 25 Oct 2023 03:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvXzF-0002P8-Io; Wed, 25 Oct 2023 03:07:30 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvXzB-0000s2-Qr; Wed, 25 Oct 2023 03:07:27 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFg3b4Dh8z4wx7;
 Wed, 25 Oct 2023 18:07:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFg3Y2GYYz4wx5;
 Wed, 25 Oct 2023 18:07:21 +1100 (AEDT)
Message-ID: <e43f1bb7-acc4-471d-afb9-7ccedb811e4a@kaod.org>
Date: Wed, 25 Oct 2023 09:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] hw/arm/aspeed: Rename aspeed_soc_realize() as
 AST2400/2500 specific
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20231024162423.40206-1-philmd@linaro.org>
 <20231024162423.40206-4-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231024162423.40206-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=4l40=GH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: g7Eh+9vlv6Wk

On 10/24/23 18:24, Philippe Mathieu-Daudé wrote:
> Keep aspeed_soc_class_init() generic, set the realize handler
> to aspeed_ast2400_soc_realize() in each 2400/2500 class_init.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed_soc.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index bb377e9e6e..191276a320 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -239,7 +239,7 @@ static void aspeed_ast2400_soc_init(Object *obj)
>       object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
>   }
>   
> -static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> +static void aspeed_ast2400_soc_realize(DeviceState *dev, Error **errp)
>   {
>       int i;
>       AspeedSoCState *s = ASPEED_SOC(dev);
> @@ -509,9 +509,6 @@ static void aspeed_soc_class_init(ObjectClass *oc, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(oc);
>   
> -    dc->realize = aspeed_soc_realize;
> -    /* Reason: Uses serial_hds and nd_table in realize() directly */
> -    dc->user_creatable = false;
>       device_class_set_props(dc, aspeed_soc_properties);
>   }
>   
> @@ -527,6 +524,11 @@ static const TypeInfo aspeed_soc_type_info = {
>   static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>   {
>       AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = aspeed_ast2400_soc_realize;
> +    /* Reason: Uses serial_hds and nd_table in realize() directly */
> +    dc->user_creatable = false;
>   
>       sc->name         = "ast2400-a1";
>       sc->cpu_type     = ARM_CPU_TYPE_NAME("arm926");
> @@ -554,6 +556,11 @@ static const TypeInfo aspeed_soc_ast2400_type_info = {
>   static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>   {
>       AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = aspeed_ast2400_soc_realize;
> +    /* Reason: Uses serial_hds and nd_table in realize() directly */
> +    dc->user_creatable = false;
>   
>       sc->name         = "ast2500-a1";
>       sc->cpu_type     = ARM_CPU_TYPE_NAME("arm1176");

