Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2625142eja;
        Mon, 4 Mar 2024 06:33:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmwF6/uuxRA6O1uU2IIO+gLjh+SEkofZdLAw4zk3RUgOt/zugt4adw8jnrdsjte9Y5ToH9bfPaY5U/cNYRjdrR9p3FSNiZ
X-Google-Smtp-Source: AGHT+IFCDTH28KDlrBil7aslLzsE0+EY11jAnv7BErnMlo5K3OPLZ2tsW3CwNimDRz6l0CojWqL+
X-Received: by 2002:a05:6102:3706:b0:472:c7bd:9daa with SMTP id s6-20020a056102370600b00472c7bd9daamr2691106vst.19.1709562791084;
        Mon, 04 Mar 2024 06:33:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709562791; cv=none;
        d=google.com; s=arc-20160816;
        b=svjEMtAIf5h3+6zPbEQFEyQYAzmkyn4LIOzJ8YhvZ7GgjHYPoVBgx+FOovshB5kyD9
         h0zpwupdnR0m3tIAGeg6bw1U5zmCPF8qZ8Q/mgfQDhPHmCHsYUR6c9VVqHkjZ8iENPLc
         7VHCA4egtaunERxvqVVHrT2baFxq0CmjuRjJWZGVVzSxLpi7ano7lKgyJFH+zgWLO8f9
         +gNjks7fNgbG8jRPfnlJH/L30DyIpk0rpsmLowYURr97+fC70QmnWtDMmNouh6m8rA56
         xGHkyJoX0DrtI7FDULq1Lq5qAUhGyo1rYekHQ1agfKcRUojLntxNQv8g5kIPUZjtA/Yz
         seqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=W7eMdZROjtoXLb0gdRXZVYZ3H+3m7CsjJKhe6BhiMoM=;
        fh=X7FqJc9Q/d3HW4sohIQPglBEIAw7wozu40hVQBfqWeQ=;
        b=WqCOpONw0MLzJp9Jo2tpNRIojdIyukTazecrzTc6/G6PZz/GAH/Q1cglhJ7sDAo6zs
         XaUtErxa/HLnXOI300Qgifa1MPrBHgU4oS9qUacVK2odHHoKf/vTAaWnTXI6NxVcp558
         YoM68uvoS7lkTIxG3NI/nMxZI7dXOzHRNPScbDJDyZKT3Ksj7akuXznfLUx7wGqAJdbA
         E9r7r73Ij/F3sndpIal/e8HeoO9kzRJIIMifUuLtC/7ynG4Paw2bzJpNLiE3XJhOR53E
         o9VIdjFYPQKaxTHkqm6xK76ZBB67uM66SwBWfE408qa98uOz1EmXe1Fm8PIaniTIhFXJ
         pjOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jh6-20020a056102184600b00472a49045b5si691753vsb.660.2024.03.04.06.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 06:33:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh9NI-0001Q1-Ou; Mon, 04 Mar 2024 09:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=daq9=KK=kaod.org=clg@ozlabs.org>)
 id 1rh9NF-0001PS-1a; Mon, 04 Mar 2024 09:33:02 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=daq9=KK=kaod.org=clg@ozlabs.org>)
 id 1rh9N1-00045P-1g; Mon, 04 Mar 2024 09:32:56 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TpLks4CTPz4wnq;
 Tue,  5 Mar 2024 01:32:37 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TpLkp2mYcz4wcg;
 Tue,  5 Mar 2024 01:32:31 +1100 (AEDT)
Message-ID: <10fc74b2-7bab-4c97-9e55-8e73a38b7440@kaod.org>
Date: Mon, 4 Mar 2024 15:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] aspeed/wdt: Add AST2700 support
Content-Language: en-US, fr
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240304092934.1953198-1-jamin_lin@aspeedtech.com>
 <20240304092934.1953198-2-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240304092934.1953198-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=daq9=KK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: xiI+EJNgGaox

Hello Jamin,

On 3/4/24 10:29, Jamin Lin wrote:
> AST2700 wdt controller is similiar to AST2600's wdt, but
> the AST2700 has 8 watchdogs, and they each have a 0x80 of registers.

... they each have 0x80 registers.

> Introduce ast2700 object class and increse the number of regs(offset) of

.. increase ...

> ast2700 model.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/watchdog/wdt_aspeed.c         | 24 ++++++++++++++++++++++++
>   include/hw/watchdog/wdt_aspeed.h |  3 ++-
>   2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index d70b656f8e..75685c5647 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -422,12 +422,36 @@ static const TypeInfo aspeed_1030_wdt_info = {
>       .class_init = aspeed_1030_wdt_class_init,
>   };
>   
> +static void aspeed_2700_wdt_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
> +
> +    dc->desc = "ASPEED 2700 Watchdog Controller";
> +    awc->iosize = 0x80;
> +    awc->ext_pulse_width_mask = 0xfffff; /* TODO */
> +    awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
> +    awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
> +    awc->wdt_reload = aspeed_wdt_reload_1mhz;
> +    awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
> +    awc->default_status = 0x014FB180;
> +    awc->default_reload_value = 0x014FB180;
> +}
> +
> +static const TypeInfo aspeed_2700_wdt_info = {
> +    .name = TYPE_ASPEED_2700_WDT,
> +    .parent = TYPE_ASPEED_WDT,
> +    .instance_size = sizeof(AspeedWDTState),
> +    .class_init = aspeed_2700_wdt_class_init,
> +};
> +
>   static void wdt_aspeed_register_types(void)
>   {
>       type_register_static(&aspeed_wdt_info);
>       type_register_static(&aspeed_2400_wdt_info);
>       type_register_static(&aspeed_2500_wdt_info);
>       type_register_static(&aspeed_2600_wdt_info);
> +    type_register_static(&aspeed_2700_wdt_info);
>       type_register_static(&aspeed_1030_wdt_info);
>   }
>   
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
> index e90ef86651..830b0a7936 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -19,9 +19,10 @@ OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
>   #define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
>   #define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
>   #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
> +#define TYPE_ASPEED_2700_WDT TYPE_ASPEED_WDT "-ast2700"
>   #define TYPE_ASPEED_1030_WDT TYPE_ASPEED_WDT "-ast1030"
>   
> -#define ASPEED_WDT_REGS_MAX        (0x30 / 4)
> +#define ASPEED_WDT_REGS_MAX        (0x80 / 4)
>   
>   struct AspeedWDTState {
>       /*< private >*/

