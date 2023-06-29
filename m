Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp276009ejy;
        Thu, 29 Jun 2023 04:10:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6sKAEXhO/QQ0bXRu4ncT3BR6YbE1u1R6nTVCLRhSrt4YoSSoYYVfr5TQDD474IovbAcB7A
X-Received: by 2002:ac8:59d4:0:b0:402:531f:79d5 with SMTP id f20-20020ac859d4000000b00402531f79d5mr10227420qtf.64.1688037001299;
        Thu, 29 Jun 2023 04:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688037001; cv=none;
        d=google.com; s=arc-20160816;
        b=Nud930t4QtuPhcyJubryB5fjBNz6cdkslvbuucJEtzKoDQNcwqoG9uHhsbBS251hhJ
         Kydso7mT4QjARmo8bxIkVOaJhNgXfw66fy/UN+L5+dFKaQ421Zz7n/qymlTnvyJfBPAQ
         d1e+a7UBXcti+Ml0rng8xy4s5MMnnm1BES1LEcEj/OBD5jBXS7YThGTmarkSHWHsfeN2
         J2BjgqqsYTwJw9sklr9jkbKnvBYqFQ9aivxKUH+Siv/T2/WKfWz9cl/gklkcmYtrIDZK
         BwXk+qDAsbAd6AKK+LObj+hzq6YPwuGnw5xCYIZD3j1roNBjSh9tL03/qSzXAlbaQXrE
         W0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gRcv+ZzcoX26ZXS1E7GP0WZ4GsluHrifbtcvwEDB2Bk=;
        fh=VsZ4lyhF6vnwbcan3TdztcaVki62kT3jgH2dY4+hXd0=;
        b=NTyn0TvkzDSsoFMkZGnX+phipsXDHmlH2jopHdrx2oHTtDFKWghnDJONQWGiJsA3O2
         mxuAjGuOUYRy7YWtDxo1v3b/S6I9rFak402xzoVU7bos6cnR4E6IyJ0Ezp0J1AUFRGIT
         9oZJeLrNVs6x5iddPYxY2ZEwxlgBL0itBHp+HsojHaS2cenEuc3epo6yMMHdfhEFSGWl
         DFkd9WiD0MrcItIFEN/yqTD9vFTDvvtaCi4KKn55P7HCluWPaLfZZqrgUeI3Dmcx4MA0
         IVCXG8eEhPfL/bwYlhtMQXySPJSRtcj7qmpiKrikeNna3OSerWl/1bZXTvoLyk5aG0OT
         HRwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FmPVsRox;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4-20020a05622a008400b003f7fd063e35si1712614qtw.359.2023.06.29.04.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jun 2023 04:10:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FmPVsRox;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qEpWx-000179-Um; Thu, 29 Jun 2023 07:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEpWv-00016l-19
 for qemu-arm@nongnu.org; Thu, 29 Jun 2023 07:09:41 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEpWt-0004eT-AH
 for qemu-arm@nongnu.org; Thu, 29 Jun 2023 07:09:40 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb41682472so828124e87.2
 for <qemu-arm@nongnu.org>; Thu, 29 Jun 2023 04:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688036976; x=1690628976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gRcv+ZzcoX26ZXS1E7GP0WZ4GsluHrifbtcvwEDB2Bk=;
 b=FmPVsRoxwKrxGpGBekRXCuybm+A4HgBkaJ8VFU8I+h4zYtCNMLd058JcJGzgYGgT72
 jI6Oo17/Xo7QUJxZzmxlCzloKlKFhgFeRHP1jgbGE0XvLil2YI8NmgNL7Rf2DFPVoRmK
 ikR7g0XlgBWSqnpmsz9DbGDco0m0fSwdHW3aNhwNrqoq6tp9s4tOq+qWTCur9rCPq0td
 Qn9Yxkh9R/+sFdwk0Fqqo/nbnG+HInxRNGwndkM3aZtOTagmLyZVI4y7GL86f350N9b6
 BzWad+0Ham54juYynqpGvgJ6ZAfcG+7Rc7WJ6yWHPxko7vW/qoahQM83TWVZul5px/EZ
 +8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688036976; x=1690628976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gRcv+ZzcoX26ZXS1E7GP0WZ4GsluHrifbtcvwEDB2Bk=;
 b=Y4TkXeTSW5fKCxvWmar+6slx9mMey5HYGFpPWgiCj5rGDbm4c8Dce5PDNozQin5lpV
 j9uvv+4djBrv22wwc4bpG1Hb4RLB0ovNBlisoEy6KhDyiUw0SRS0bLXksrieO9IahoF8
 Ya6qvNLHjGvAZqOJa3CNx+GH2bYTp8v82EEYPZGzDnj6S0J3J90Qy2HQkfOvLcisLWpM
 7pH/PqpfeoOACKnPKdAwA66C694Mf6fI1rjmS+gH1CBhyE79MURjNEqBmRW9De87xAGv
 hbJsDocugdartmrkwkBDBGvM9s+LnJEONEio9f08NSM/WGrSb+zkiA214Gg3RPb/UUOD
 bHTg==
X-Gm-Message-State: AC+VfDzj+YhGo2H0HQ9kJFxThxUTP1tF7gpKu8pncRscVmeIuHZPOkhS
 eYYhVzO5liWXW6EgDfiPmgnuPbjYyIzWRusDgt8=
X-Received: by 2002:a05:6512:1094:b0:4f9:6965:4d61 with SMTP id
 j20-20020a056512109400b004f969654d61mr16072375lfg.42.1688036976341; 
 Thu, 29 Jun 2023 04:09:36 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a05600c1c8a00b003f9b3829269sm8976790wms.2.2023.06.29.04.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 04:09:35 -0700 (PDT)
Message-ID: <03d52281-22fb-5786-e321-71a47a198e19@linaro.org>
Date: Thu, 29 Jun 2023 13:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 05/12] hw/ssi: Introduce a ssi_get_cs() helper
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-6-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230607043943.1837186-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: ykYYKQKg2D5T

On 7/6/23 06:39, Cédric Le Goater wrote:
> Simple routine to retrieve a DeviceState object on a SPI bus using its
> address/cs. It will be useful for the board to wire the CS lines.
> 
> Cc: Alistair Francis <alistair@alistair23.me>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/ssi/ssi.h |  2 ++
>   hw/ssi/ssi.c         | 15 +++++++++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index 9e0706a5248c..01662521b09a 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -112,4 +112,6 @@ SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
>   
>   uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
>   
> +DeviceState *ssi_get_cs(SSIBus *bus, uint8_t addr);

Revisiting this patch, I now think this should be:

   qemu_irq ssi_get_cs(SSIBus *bus, uint8_t chipselect);


>   #endif
> diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
> index d4409535429c..7c71fce0db90 100644
> --- a/hw/ssi/ssi.c
> +++ b/hw/ssi/ssi.c
> @@ -27,6 +27,21 @@ struct SSIBus {
>   #define TYPE_SSI_BUS "SSI"
>   OBJECT_DECLARE_SIMPLE_TYPE(SSIBus, SSI_BUS)
>   
> +DeviceState *ssi_get_cs(SSIBus *bus, uint8_t addr)
> +{
> +    BusState *b = BUS(bus);
> +    BusChild *kid;
> +
> +    QTAILQ_FOREACH(kid, &b->children, sibling) {
> +        SSIPeripheral *kid_ssi = SSI_PERIPHERAL(kid->child);
> +        if (kid_ssi->addr == addr) {
> +            return kid->child;

and:

                return qdev_get_gpio_in_named(kid->child,
                                              SSI_GPIO_CS, 0);

> +        }
> +    }
> +
> +    return NULL;
> +}
> +
>   static const TypeInfo ssi_bus_info = {
>       .name = TYPE_SSI_BUS,
>       .parent = TYPE_BUS,

