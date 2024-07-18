Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1284171njk;
        Thu, 18 Jul 2024 00:52:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBXv0YQuGeVKfthND34FB5JZ8NRHi70IJ0ZTvRwuLc3Duq3iLr61xZB1RpCg6hCrl42ifec6rDw93ah3cagnONnN5O2J+H
X-Google-Smtp-Source: AGHT+IHpO5omifVTdyyTE+kITF+1QSK9ggVzB8xRX3TEzgYxeGXLD3CF+usndhdf5jR7fetF0aJm
X-Received: by 2002:a05:622a:102:b0:447:ed12:77ea with SMTP id d75a77b69052e-44f9696f474mr464011cf.11.1721289131487;
        Thu, 18 Jul 2024 00:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721289131; cv=none;
        d=google.com; s=arc-20160816;
        b=Ncfqlng+0cFx3qZ1UcJ3vXQEqZiN4neaRHI1iheCu3tlJIJM2z17aOqQjAQKSlFa3C
         zES3Ixp8Mnoy0C2E+A70iOVp7UXvk2lvsJNkVibGZPlMbuseblofkcAu+v9wJpZ9a3+h
         6ihCSf299n4OVwoVxf0EVY+OYJEINivK8zwpMCX5l6hs/CV0sA0AtxeO7s8+X+fkVGYY
         oJXUSW7tjdAb/1DARuXVmuNphiugDReKhAfcgpRmxBYynWBik7dgsSdth4c/9BElUm6P
         pjfOD0L4/NNfcw/TbvIIypQQ/+GtSxQGl+6AVXJYVbfKxXhCzM4Q0jEiaA9GSuN45U3V
         V7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=XiqG5dhS99lYN7ngYHwotC/NqiHbZwdHFyaJVeZVHcI=;
        fh=vpv4dibz543bPaX9Fq9ZvnJ9J5iREE2VOWA/tGZmS3U=;
        b=X3m8B86eg3rJjgJaw3YnNNZ4/vy6HRD9t9CaK1LbEFU27kgp27zb56PAVpYK9l0gaK
         uzqs86r9MxR+1RWuafuJiIc6FNfV16GKPU9C6f0kV666dbSrDjFx848+5Wr0vuhXXpKA
         ZYLYIY/gbOUh8XjqoWc4Pqln8QtSzv2GXb6S5fsr145OMMt86y2X6D9M1Zf9vQidsgIQ
         oVaoK1uheFkqkrEK0M04vG6ShQAOUXacbqLNDAxt3Lipy6nBtSL6yYmFLYauSQmCg5XC
         ogLBDq1gsatCGjGGI4Fp4UJPTahqATWyqZbyinJqd+1dr8pUzmZKRLaOMzIDWkoiH1Sk
         TSJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9696c99fsi254461cf.57.2024.07.18.00.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 00:52:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sULvk-0006NS-4a; Thu, 18 Jul 2024 03:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sULvi-0006Fd-Eh; Thu, 18 Jul 2024 03:51:58 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sULvg-0007sC-8q; Thu, 18 Jul 2024 03:51:58 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WPlPZ144zz4x04;
 Thu, 18 Jul 2024 17:51:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPlPT5jTJz4wxk;
 Thu, 18 Jul 2024 17:51:21 +1000 (AEST)
Message-ID: <3deb04d4-0db6-4b9b-a5c2-a2b9c329e638@kaod.org>
Date: Thu, 18 Jul 2024 09:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/15] aspeed/adc: Add AST2700 support
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
 <20240718064925.1846074-2-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240718064925.1846074-2-jamin_lin@aspeedtech.com>
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
X-TUID: mk+UUcjof/cg

On 7/18/24 08:49, Jamin Lin wrote:
> AST2700 and AST2600 ADC controllers are identical.
> Introduce ast2700 class and set 2 engines.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/adc/aspeed_adc.c         | 16 ++++++++++++++++
>   include/hw/adc/aspeed_adc.h |  1 +
>   2 files changed, 17 insertions(+)
> 
> diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
> index 68bdbc73b0..48328ef891 100644
> --- a/hw/adc/aspeed_adc.c
> +++ b/hw/adc/aspeed_adc.c
> @@ -398,6 +398,15 @@ static void aspeed_1030_adc_class_init(ObjectClass *klass, void *data)
>       aac->nr_engines = 2;
>   }
>   
> +static void aspeed_2700_adc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedADCClass *aac = ASPEED_ADC_CLASS(klass);
> +
> +    dc->desc = "ASPEED 2700 ADC Controller";
> +    aac->nr_engines = 2;
> +}
> +
>   static const TypeInfo aspeed_adc_info = {
>       .name = TYPE_ASPEED_ADC,
>       .parent = TYPE_SYS_BUS_DEVICE,
> @@ -430,6 +439,12 @@ static const TypeInfo aspeed_1030_adc_info = {
>       .class_init = aspeed_1030_adc_class_init, /* No change since AST2600 */
>   };
>   
> +static const TypeInfo aspeed_2700_adc_info = {
> +    .name = TYPE_ASPEED_2700_ADC,
> +    .parent = TYPE_ASPEED_ADC,
> +    .class_init = aspeed_2700_adc_class_init,
> +};
> +
>   static void aspeed_adc_register_types(void)
>   {
>       type_register_static(&aspeed_adc_engine_info);
> @@ -438,6 +453,7 @@ static void aspeed_adc_register_types(void)
>       type_register_static(&aspeed_2500_adc_info);
>       type_register_static(&aspeed_2600_adc_info);
>       type_register_static(&aspeed_1030_adc_info);
> +    type_register_static(&aspeed_2700_adc_info);
>   }
>   
>   type_init(aspeed_adc_register_types);
> diff --git a/include/hw/adc/aspeed_adc.h b/include/hw/adc/aspeed_adc.h
> index ff1d06ea91..f502f197ac 100644
> --- a/include/hw/adc/aspeed_adc.h
> +++ b/include/hw/adc/aspeed_adc.h
> @@ -18,6 +18,7 @@
>   #define TYPE_ASPEED_2500_ADC TYPE_ASPEED_ADC "-ast2500"
>   #define TYPE_ASPEED_2600_ADC TYPE_ASPEED_ADC "-ast2600"
>   #define TYPE_ASPEED_1030_ADC TYPE_ASPEED_ADC "-ast1030"
> +#define TYPE_ASPEED_2700_ADC TYPE_ASPEED_ADC "-ast2700"
>   OBJECT_DECLARE_TYPE(AspeedADCState, AspeedADCClass, ASPEED_ADC)
>   
>   #define TYPE_ASPEED_ADC_ENGINE "aspeed.adc.engine"

