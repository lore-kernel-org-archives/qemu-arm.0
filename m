Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp127240lfo;
        Fri, 4 Mar 2022 15:59:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypH3bMyoluRV/aoRRyDhmc/xfhM0gJDCkyYiFzQnQQp3hr5vZPno+Yzrna+RNyqG+BptDH
X-Received: by 2002:a25:a467:0:b0:61e:1b4a:7700 with SMTP id f94-20020a25a467000000b0061e1b4a7700mr875993ybi.390.1646438363949;
        Fri, 04 Mar 2022 15:59:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646438363; cv=none;
        d=google.com; s=arc-20160816;
        b=tohtM7B2uOzvFVUlVj+NZNdDdbn4AsMXOOBTaZh/EDXqMFopwt7WXSj3K+NorPzPg4
         fnzKyV5N7qMY4WRBl5vYdhaTfALssASqXSRWTEC/hK1d/jQnm32ui2Oo3jC6lcRYihlz
         B+kZfQzT3augRhhfqN2BmpKm61C8ZEIofAlHyCa/jwqAnuePJ+LkK5T39T0R/GuU7CQ9
         nI0g51KnkyeEjruSEpC/GONoQjDG73lax4zPg/bVNnblB9ufxpPG/kyl62KXw1MI5Ny6
         +uRfFZhNbwH4CkFiPCAGaIgrkxQzWcyzZzg498yhTLlB+n7XYtcKATJeNbH/raPE3NVB
         tGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=JfpcnmRo4C/HCi7FLviAnjoZgweNbrh6NEQj1KHT/zg=;
        b=PwzTkIW90OxEgjGv3hp7bTHwtjvjAiZzYv1tG4K1JtUNhPtEa8JNbyg11xMPkzoeXP
         pgNnxcUFyvg/bLN7yy8VzLb+ddnjz1lMLRNaXrlX8XGD9CzIkID6yNoXN2XQn1l976Tp
         0Opt8mLqDyoWiGN3r5nklcCOdwhtsDHUw3IvXI3wgQTjuIBjCbEx0LTNqMxFZolf9ugV
         /rcMiMhDf2fTUy7KPJpe+ZT1a1U5GLdBBoBAlxU1Z4PcucwYp8e/SXVxbTmDilZOnWdL
         HjK7At9Dmh0VYkkAv3XlltWawHZIvRGSMQ5l8dEw6SL6VHVl1U1pa7Q1rqwmQdalhvVl
         X8ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=gixd6+88;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a259b84000000b00623f331fd94si5385998ybo.263.2022.03.04.15.59.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 15:59:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=gixd6+88;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQHpT-0005tD-BJ
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 18:59:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHov-0005t0-KT; Fri, 04 Mar 2022 18:58:49 -0500
Received: from [2607:f8b0:4864:20::62e] (port=44923
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHou-0003Pl-33; Fri, 04 Mar 2022 18:58:49 -0500
Received: by mail-pl1-x62e.google.com with SMTP id q11so9089534pln.11;
 Fri, 04 Mar 2022 15:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JfpcnmRo4C/HCi7FLviAnjoZgweNbrh6NEQj1KHT/zg=;
 b=gixd6+88mJZB7UzUdck3aycRi6uc3+9WbZmal9tvzwhs33C2zlKUa04JDV5qr6Q3mx
 ROOExdg86DQiB7xtrZBcqD9yr1AB6BnjyaBfYJAG3JCqPNv7gcaTpMdHeeh8LQL5WwbI
 DUqmtPzdgKfBp6l+vP7AXcoTFUcnsUg1ohqNkHCx6ZGXmSaLnznZXRaTrhBg3+hScDTU
 uAeZF2Mkhto/xcYpdHQfILEAn0bPJ62QlVljjpyxi+xDEZvT3vf+TT09A/dTGsAYC/BQ
 KtnJuQWThUqedafBiCZbLXYmBSKBz5oQSJIi6FPr+KT/muDkxPQO5KdnzMMH0jPC4Xq7
 brsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JfpcnmRo4C/HCi7FLviAnjoZgweNbrh6NEQj1KHT/zg=;
 b=ubToVc1k0KXN1ail4DTe9lZO0vGg6tQ06t1VbXo73XG6d1kcfb9xEqZIZYVWd2r8Wn
 h5EctMOGW/h3GekFPP8eCeiS/DPT++OilyZ52F6XUr60LsgcEMdNHInUu6Us/kgLQ6z8
 5MDcrn7amQTf5v8gZL7gdGFKR0ugHQUYGMzfD89bWJ+IG4/ILRKk0c+Rt+nROLiQ+47e
 gf/JNgrm0+wJc8Tlcjvc6YYE6hXA54/nXqLuFgFnBg+rpH9B6Ly5p53Qzk3dW51KmmQj
 c3c55plTrHkGhSlEWcgvlOVwSXYAxP5QxqcGSzlG2qd+A45SvaMykqMEjIpsyhqVMNGP
 HzPA==
X-Gm-Message-State: AOAM53060j6jtDr0KRdBLs1IHc7hRU6+q9pjfUUV9S9ntmrqGcD5hn8i
 0eF0YQhiBmsnWREKTCUkjkA=
X-Received: by 2002:a17:903:2285:b0:151:4b38:298e with SMTP id
 b5-20020a170903228500b001514b38298emr1033596plh.36.1646438326270; 
 Fri, 04 Mar 2022 15:58:46 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056a000b5000b004f669806cd9sm7136805pfo.87.2022.03.04.15.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 15:58:45 -0800 (PST)
Message-ID: <bd27a91d-5e8c-3cef-7eaa-577a0940469e@gmail.com>
Date: Sat, 5 Mar 2022 00:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 9/9] hw/sensor: add Renesas raa228000 device
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-10-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302015053.1984165-10-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ad5zqQzRlh8l

On 2/3/22 02:50, Titus Rwantare wrote:
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>   hw/sensor/isl_pmbus_vr.c         | 50 ++++++++++++++++++++
>   include/hw/sensor/isl_pmbus_vr.h |  1 +
>   tests/qtest/isl_pmbus_vr-test.c  | 78 ++++++++++++++++++++++++++++++--
>   3 files changed, 126 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> index e260faeac3..df7c003ea6 100644
> --- a/hw/sensor/isl_pmbus_vr.c
> +++ b/hw/sensor/isl_pmbus_vr.c
> @@ -89,6 +89,24 @@ static void isl_pmbus_vr_exit_reset(Object *obj)
>       }
>   }
>   
> +/* The raa228000 uses different direct mode coefficents from most isl devices */
> +static void raa228000_exit_reset(Object *obj)
> +{
> +    isl_pmbus_vr_exit_reset(obj);
> +
> +    PMBusDevice *pmdev = PMBUS_DEVICE(obj);

Per QEMU CodingStyle, variables are declared first.

> +    pmdev->pages[0].read_vout = 0;
> +    pmdev->pages[0].read_iout = 0;
> +    pmdev->pages[0].read_pout = 0;
> +    pmdev->pages[0].read_vin = 0;
> +    pmdev->pages[0].read_iin = 0;
> +    pmdev->pages[0].read_pin = 0;
> +    pmdev->pages[0].read_temperature_1 = 0;
> +    pmdev->pages[0].read_temperature_2 = 0;
> +    pmdev->pages[0].read_temperature_3 = 0;
> +}

>   /* test qmp access */
>   static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
>   {
> @@ -384,9 +448,6 @@ static void isl_pmbus_vr_register_nodes(void)
>       qos_node_create_driver("isl69260", i2c_device_create);
>       qos_node_consumes("isl69260", "i2c-bus", &opts);
>   
> -    qos_node_create_driver("raa229004", i2c_device_create);
> -    qos_node_consumes("raa229004", "i2c-bus", &opts);
> -
>       qos_add_test("test_defaults", "isl69260", test_defaults, NULL);
>       qos_add_test("test_tx_rx", "isl69260", test_tx_rx, NULL);
>       qos_add_test("test_rw_regs", "isl69260", test_rw_regs, NULL);
> @@ -394,9 +455,20 @@ static void isl_pmbus_vr_register_nodes(void)
>       qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
>       qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
>   
> +    qos_node_create_driver("raa229004", i2c_device_create);
> +    qos_node_consumes("raa229004", "i2c-bus", &opts);
> +

Squash in previous commit?

>       qos_add_test("test_tx_rx", "raa229004", test_tx_rx, NULL);
>       qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
>       qos_add_test("test_pages_rw", "raa229004", test_pages_rw, NULL);
>       qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL);

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
