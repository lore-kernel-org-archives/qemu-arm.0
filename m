Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1308767njk;
        Thu, 18 Jul 2024 01:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1JqL1+oDuoQUzurSnABgzyIbmE/Z7sT7ryVVKWzokapchVZw3AGpRxXDsmbo4njdoOeZzDXEX/1PiOYvi/YBCPQ252KHG
X-Google-Smtp-Source: AGHT+IGtW/qcA+WhCZYqYbPj1KkuEzFV5D45yGGDrXkrSJ74s0zf0MHs/DiHuT9DtF3+4CLCv5r9
X-Received: by 2002:a05:6102:2c18:b0:491:e5b:72d5 with SMTP id ada2fe7eead31-491598ab71amr6353037137.10.1721292983459;
        Thu, 18 Jul 2024 01:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721292983; cv=none;
        d=google.com; s=arc-20160816;
        b=ZfufrrEeARV95Vev+FhVP34JRFobZQCLZa4/b2oATbyCzG1pn4qLainYcWQWFDxw6G
         yym6PCqeoUm+RDyBPIah4uSVxt5LCpNlTR3eMWeloVZAPieI3NPP1IpioMxQecCSaVNe
         OZHOFwp5amWbPI5QPRVUGpFTS171JZNuqyHOWW7p3dL1J7s825bj6m3J0x2An7MJf6jt
         /KXz0ZNL33CQEtcSvFanS83NQtSHiPEXx6ga7rR04iGFw1tSdx6i+IahjVqbT0ms7k6m
         +GqQ+gFecPuInQsAAo1PtDcO2rUJ0i/zSrzNdVPaGm4hyiZYa8PcUA8aX50oxF47wXl0
         N8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=F6UOA4Y9AP/xr0VfDL57XA7cOOZ1AknsipaA66xx8dI=;
        fh=vpv4dibz543bPaX9Fq9ZvnJ9J5iREE2VOWA/tGZmS3U=;
        b=Jxz3HK7POheSDngQ0OLepxPCl+kFgFi3v/6S1BPNBOwDiMPcHYcScWhl6d3qyJXFRX
         2NXOcQMyox38P2YGyKZ+rIpy8ZccYPgHHH7raLTSZpLQn6EWbmLRWyZ/+atMWeC1/b7L
         xvrUth/XZHfYCglD78r12Hzca56npgcTkFXcwbseyTonBfMkS/YFklVt/qeVppvvbeIi
         Vn4zE/Ww/x2iMrDjx2J/FZSftGONWZmAPZDM6H7Gc2HYA2isXBOClxfOyIGmIA4Ag437
         6KjnNKhoCUGhf83VezG+HWy9p8rw+/uL8lV6FSrXFWeWqTz/+1ujmogGZVufdxp9ky0v
         iuFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f96a6a7besi967171cf.527.2024.07.18.01.56.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 01:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sUMvm-0002u8-6F; Thu, 18 Jul 2024 04:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUMvk-0002nn-A7; Thu, 18 Jul 2024 04:56:04 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUMvi-0002Oc-Dq; Thu, 18 Jul 2024 04:56:04 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WPmqg0pwrz4x04;
 Thu, 18 Jul 2024 18:55:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPmqZ486Kz4w2N;
 Thu, 18 Jul 2024 18:55:54 +1000 (AEST)
Message-ID: <25c98896-64ff-4cfc-9364-454b5a2501a5@kaod.org>
Date: Thu, 18 Jul 2024 10:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/15] aspeed: add tmp105 in i2c bus 0 for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
 <20240718064925.1846074-16-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240718064925.1846074-16-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=3riu=OS=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Q/Q+5JMPOvSE

On 7/18/24 08:49, Jamin Lin wrote:
> ASPEED SDK add lm75 in i2c bus 0 for AST2700.
> LM75 is compatible with TMP105 driver.
> 
> Introduce a new i2c init function and
> add tmp105 device model in i2c bus 0.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

As a followup, you could modify test_aarch64_ast2700_evb_sdk_v09_02
to read the sensor value.

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index f8766ea462..ed98758708 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1604,6 +1604,15 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>   }
>   
>   #ifdef TARGET_AARCH64
> +static void ast2700_evb_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = bmc->soc;
> +
> +    /* LM75 is compatible with TMP105 driver */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 0),
> +                            TYPE_TMP105, 0x4d);
> +}
> +
>   static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1618,6 +1627,7 @@ static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
>       amc->num_cs    = 2;
>       amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
>       amc->uart_default = ASPEED_DEV_UART12;
> +    amc->i2c_init  = ast2700_evb_i2c_init;
>       mc->default_ram_size = 1 * GiB;
>       aspeed_machine_class_init_cpus_defaults(mc);
>   }

