Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp127219ejc;
        Wed, 11 Oct 2023 07:27:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBnLKeAfO82HfMAVK+uOyKjg/sk2vHgPjSi72C5IFqEd0RQQ3Vjakz/qk0MFa4HyibVlvm
X-Received: by 2002:a9d:68c6:0:b0:6c4:81d6:171b with SMTP id i6-20020a9d68c6000000b006c481d6171bmr24103537oto.21.1697034475985;
        Wed, 11 Oct 2023 07:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697034475; cv=none;
        d=google.com; s=arc-20160816;
        b=zZnrAyrKv/jrKtema9DZWZKsJRM8bxArFwMALfIa0iVvPTPTfIogLIlu9PoGH3QXKG
         K/Z4VvLss/Gb8sxgMFe44i8EgFRp42mPXDqb99nr9xpy0yjWjCF+Lsp3LrW5ZudcS4OJ
         4aweipdh7lDLTLf4GYEWAKqlbXvwybHEs1Q5u8My3+8V/2XQhO/hKpf3M5NnProody1o
         G8lW+wSDEbcJgu1Wut8rpqJo4tuOH0ggKdScihfCODneJisB4YIpJhvD792Hc4HcySDm
         128+ZDsVPPUoTLGDvGvGjfEnS9VvyqGf4+IKSaPtl0DeGGjrAVY5S9khojSUJa5xIsmV
         oxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=cUFzJyd3B7W5flM0RVcsuOQvIYHlmafj+jKnshsFDVQ=;
        fh=bmz7anJfKqMSsDWhxfnSZRenMyErtdC3t8rqDso+AN4=;
        b=AOc8UdE7dkQ2ZOpURGffA9JoNj1OdZbv1gXnShRoLgn3ckWcYRFfBqoWCM8mLW6s7k
         IPeiBJI0oJyUIG+Q8bntB8BVVuRaQZ6mHLh9DuweqlhSlA3SRZk+v+S8kDb43+Qykt06
         VVAALaGVs5FGMz+2gZyNEoxjcubkhBTrPtMNFzeL+NX0x6WKoTBWEVEFLg2QFq9Zp+k2
         SeRWI6NCgVVO/xhS7b3ajv2fVCAzVemxw/y6tXRSFflq8t/TiL0CmiIKy9FipsP9lYcL
         O1I/OcyqD+kR3chA4rG+1tDtxWYoZUHQf/6r+LWD/hInnZp4HAYVhBAhhW7HmQMQCkfB
         VeyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a05622a134700b0041805eb9513si9447803qtk.31.2023.10.11.07.27.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 07:27:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqaBg-0001Ik-9A; Wed, 11 Oct 2023 10:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=T27U=FZ=kaod.org=clg@ozlabs.org>)
 id 1qqaBd-0001Hz-7V; Wed, 11 Oct 2023 10:27:45 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=T27U=FZ=kaod.org=clg@ozlabs.org>)
 id 1qqaBY-0003Mp-W4; Wed, 11 Oct 2023 10:27:43 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4S5FTv3n7mz4xZl;
 Thu, 12 Oct 2023 01:27:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S5FTs6HmMz4xWt;
 Thu, 12 Oct 2023 01:27:29 +1100 (AEDT)
Message-ID: <e5d37f40-fcf1-5843-ea66-d50fa2353424@kaod.org>
Date: Wed, 11 Oct 2023 16:27:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] misc/pca9552: Fix inverted input status
Content-Language: en-US
To: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, andrew@codeconstruct.com.au,
 Joel Stanley <joel@jms.id.au>
References: <20230927203221.3286895-1-milesg@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230927203221.3286895-1-milesg@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=T27U=FZ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-TUID: TehVAjUFEavZ

On 9/27/23 22:32, Glenn Miles wrote:
> The pca9552 INPUT0 and INPUT1 registers are supposed to
> hold the logical values of the LED pins.  A logical 0
> should be seen in the INPUT0/1 registers for a pin when
> its corresponding LSn bits are set to 0, which is also
> the state needed for turning on an LED in a typical
> usage scenario.  Existing code was doing the opposite
> and setting INPUT0/1 bit to a 1 when the LSn bit was
> set to 0, so this commit fixes that.
> 
> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>

Looks OK to me.

May be you could mention that the ON/OFF values are reversed on
the pca953x family. This is good to know if one wants to model
these devices one day.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/misc/pca9552.c          | 13 +++++++++----
>   tests/qtest/pca9552-test.c |  6 +++---
>   2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index fff19e369a..ad811fb249 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -112,13 +112,18 @@ static void pca955x_update_pin_input(PCA955xState *s)
>   
>           switch (config) {
>           case PCA9552_LED_ON:
> -            qemu_set_irq(s->gpio[i], 1);
> -            s->regs[input_reg] |= 1 << input_shift;
> -            break;
> -        case PCA9552_LED_OFF:
> +            /* Pin is set to 0V to turn on LED */
>               qemu_set_irq(s->gpio[i], 0);
>               s->regs[input_reg] &= ~(1 << input_shift);
>               break;
> +        case PCA9552_LED_OFF:
> +            /*
> +             * Pin is set to Hi-Z to turn off LED and
> +             * pullup sets it to a logical 1.
> +             */
> +            qemu_set_irq(s->gpio[i], 1);
> +            s->regs[input_reg] |= 1 << input_shift;
> +            break;
>           case PCA9552_LED_PWM0:
>           case PCA9552_LED_PWM1:
>               /* TODO */
> diff --git a/tests/qtest/pca9552-test.c b/tests/qtest/pca9552-test.c
> index d80ed93cd3..ccca2b3d91 100644
> --- a/tests/qtest/pca9552-test.c
> +++ b/tests/qtest/pca9552-test.c
> @@ -60,7 +60,7 @@ static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
>       g_assert_cmphex(value, ==, 0x55);
>   
>       value = i2c_get8(i2cdev, PCA9552_INPUT0);
> -    g_assert_cmphex(value, ==, 0x0);
> +    g_assert_cmphex(value, ==, 0xFF);
>   
>       pca9552_init(i2cdev);
>   
> @@ -68,13 +68,13 @@ static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
>       g_assert_cmphex(value, ==, 0x54);
>   
>       value = i2c_get8(i2cdev, PCA9552_INPUT0);
> -    g_assert_cmphex(value, ==, 0x01);
> +    g_assert_cmphex(value, ==, 0xFE);
>   
>       value = i2c_get8(i2cdev, PCA9552_LS3);
>       g_assert_cmphex(value, ==, 0x54);
>   
>       value = i2c_get8(i2cdev, PCA9552_INPUT1);
> -    g_assert_cmphex(value, ==, 0x10);
> +    g_assert_cmphex(value, ==, 0xEF);
>   }
>   
>   static void pca9552_register_nodes(void)

