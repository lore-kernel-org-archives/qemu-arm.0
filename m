Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2450527ejb;
        Tue, 30 May 2023 14:23:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6v8H9YXBYDfRIohZDfWSndP66nMIJC7kS5gm6kgjRiL5bAr6n10KPYoBGBkytLAz5hDgpg
X-Received: by 2002:a05:6214:2a46:b0:626:3802:9338 with SMTP id jf6-20020a0562142a4600b0062638029338mr3872044qvb.43.1685481795502;
        Tue, 30 May 2023 14:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685481795; cv=none;
        d=google.com; s=arc-20160816;
        b=SJwRT3PcsGFsuD+2fMQus9LpNzXK9YLHJN2G49ptVOGDp8tc/8SVMZcet1kqcb+0LO
         0Sce096xFYPOqVt6K+c0LCB7Lh+D5A7lZYXVNzwztDeHym1Ac4MJH6cIUnvtZx61F4wg
         rzh9PD4APWhg+GQbb1pB7DcylBXTX1NrTgKR/U/vqcTa3gS9LbmZox/LtRvExW6UYdSG
         KAdXa3LtMg65ogc1+Hfsk6odYwZiGGkV4onaNNIjXc+wjztbqVqIOrHu/yMIfQUTkciU
         eisjDVlYVibFPb2sQMBZDBchc/EQfoW1ESl5lvZLUncaXwJCo1J9IV1+0OHhhYd6H3kX
         jPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=K6McnNGu0zx0eWB77FzW1sKdj2sdIosCIzYb0YwR/sE=;
        b=nOPUDB9/Jk9eK/FOCjVpp9aqXjCFOXhiUXhRZgWBGS3JosmEfNDa6sxr/c9N/mIEEV
         bdj3sur/1VfRih+iZwXPPISIrLSGZl7oMGzZwoWRSRWoQtF/fy6qYKC0poas+VFhW5wO
         5SSOmmXrrOeMHlpU8stj9y3Ppzvm0Vxbx/eDSGjrWgU2y2V6/ZHnpGZxjIAsQEyim29A
         77ZCqIuRgqAVbH+thESKMe3dH2IEAahD/NLIcBWdM9cFkAc8EXINQAg+OqOcpdKj/rlI
         c+dMQTez/OJXjECa2XGBoYv9E9b2EqQdQDy1ttPBKTbduFdp4B32WkPhvgvW4qubZf8o
         /nig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F5zWRQyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv4-20020a056214262400b006261fd34847si3782687qvb.574.2023.05.30.14.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 14:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F5zWRQyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q46ns-0008Rq-7y; Tue, 30 May 2023 17:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46np-0008Qv-MA
 for qemu-arm@nongnu.org; Tue, 30 May 2023 17:22:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46nn-0005l9-QD
 for qemu-arm@nongnu.org; Tue, 30 May 2023 17:22:49 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-307d20548adso3426222f8f.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 14:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685481766; x=1688073766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K6McnNGu0zx0eWB77FzW1sKdj2sdIosCIzYb0YwR/sE=;
 b=F5zWRQyLVYc/DITe5JFyrkZIoq0OHL8zUTd/i4s+dky1YRtj53Wmh3vGVVSHVT6klj
 Dbl4bGtujo46foC8t3n+HiBKyGl+iX3t41IlnTIE19YhmMnUEPWHhmFGroVMO4ugc4dD
 +Ccp0rDHCo0xRVe8MTDE8cYXMZkghnZ2Adbk2Vr+Wqs50lyI6JHkZ6ZPwcYZ2uPsYuQo
 dOMgz3zMEj4I4PhoLNDVmD/UzHdyGGzGWmwpOShvzJ6uWbo3LufbPRpWEGOToak/87YN
 0aiJrN+CEW0+Sx1KaaPkBhtd7JyIRZZQ30C371FMc9F7OGMR/TLB4XRpM/mlBtiv6X1c
 ofaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685481766; x=1688073766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K6McnNGu0zx0eWB77FzW1sKdj2sdIosCIzYb0YwR/sE=;
 b=XZU5G/ZIBfI3x+V7zALFaGwFdwaVByZSNa0Fws3Zd8AkXKjy1/lwZUDnUTISC6e7vc
 aFfjVKbsI8YYmpQz7cIgZDtkC0VE+oGsbCIY7SyQYqq7ngkzf5PsQvPZZNebxXzeZ2hh
 MD4ogkfQE1O592BkgI9MjnSQsbEJOotRYkItHTjwkACOlr+jUU+3MhUVUVUHRMFDXrbD
 Mxjriedg/iuETAdzM16s+KrHVbACHBIk6ZOJ/zsVA7v7RTTiVuX7lQHjpno6B5kfCiw8
 Y1uC0iXQxweEDO9BOk82Mq2ZmIJYotMLiVoWqUXPtStpoIacpBWE2OShwlApPfXtOZfa
 4pSQ==
X-Gm-Message-State: AC+VfDyv9nZ0UWBkUQGnX2PxbPkM4X3fCZvRMyJ3Hsh2Nr57RknYNh0L
 2StgMiSoEQP+M5UUCHNBvnttYg==
X-Received: by 2002:adf:dfcf:0:b0:306:43ad:b34e with SMTP id
 q15-20020adfdfcf000000b0030643adb34emr2370800wrn.18.1685481766059; 
 Tue, 30 May 2023 14:22:46 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 o11-20020adfeacb000000b0030ae7bd1737sm4473072wrn.45.2023.05.30.14.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 14:22:45 -0700 (PDT)
Message-ID: <d0dedd1a-e2b7-5db9-d710-595e94b084a0@linaro.org>
Date: Tue, 30 May 2023 23:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 11/12] aspeed: Introduce a "uart" machine option
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Abhishek Singh Dagur <abhishek@drut.io>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-12-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230508075859.3326566-12-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: tQfLsU7GAR60

On 8/5/23 09:58, Cédric Le Goater wrote:
> Most of the Aspeed machines use the UART5 device for the boot console,
> and QEMU connects the first serial Chardev to this SoC device for this
> purpose. See routine connect_serial_hds_to_uarts().
> 
> Nevertheless, some machines use another boot console, such as the fuji,
> and commit 5d63d0c76c ("hw/arm/aspeed: Allow machine to set UART
> default") introduced a SoC class attribute 'uart_default' and property
> to be able to change the boot console device. It was later changed by
> commit d2b3eaefb4 ("aspeed: Refactor UART init for multi-SoC machines").
> 
> The "uart" machine option goes a step further and lets the user define
> the UART device from the QEMU command line without introducing a new
> machine definition. For instance, to use device UART3 (mapped on
> /dev/ttyS2 under Linux) instead of the default UART5, one would use :
> 
>    -M ast2500-evb,uart=uart3
> 
> Cc: Abhishek Singh Dagur <abhishek@drut.io>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   docs/system/arm/aspeed.rst | 10 ++++++++++
>   hw/arm/aspeed.c            | 39 ++++++++++++++++++++++++++++++++++++--
>   2 files changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index d4e293e7f9..e70f0aeea3 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -122,6 +122,10 @@ Options specific to Aspeed machines are :
>   
>    * ``spi-model`` to change the SPI Flash model.
>   
> + * ``uart`` to change the default console device. Most of the machines
> +   use the ``UART5`` device for a boot console, which is mapped on
> +   ``/dev/ttyS4`` under Linux, but it is not always the case.

This comment ...

>   For instance, to start the ``ast2500-evb`` machine with a different
>   FMC chip and a bigger (64M) SPI chip, use :
>   
> @@ -129,6 +133,12 @@ FMC chip and a bigger (64M) SPI chip, use :
>   
>     -M ast2500-evb,fmc-model=mx25l25635e,spi-model=mx66u51235f
>   
> +To change the boot console and use device ``UART3`` (``/dev/ttyS2``
> +under Linux), use :

... and this one suggest 'boot-console' could be a better name.

Or 'boot-console-index'.

> +.. code-block:: bash
> +
> +  -M ast2500-evb,uart=uart3
>   
>   Aspeed minibmc family boards (``ast1030-evb``)
>   ==================================================================
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 3d5488faf7..6c32f674b9 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -43,6 +43,7 @@ struct AspeedMachineState {
>       AspeedSoCState soc;
>       MemoryRegion boot_rom;
>       bool mmio_exec;
> +    uint32_t uart_chosen;
>       char *fmc_model;
>       char *spi_model;
>   };
> @@ -331,10 +332,11 @@ static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
>       AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
>       AspeedSoCState *s = &bmc->soc;
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> +    int uart_chosen = bmc->uart_chosen ? bmc->uart_chosen : amc->uart_default;
>   
> -    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
> +    aspeed_soc_uart_set_chr(s, uart_chosen, serial_hd(0));
>       for (int i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
> -        if (uart == amc->uart_default) {
> +        if (uart == uart_chosen) {
>               continue;
>           }
>           aspeed_soc_uart_set_chr(s, uart, serial_hd(i));
> @@ -1077,6 +1079,35 @@ static void aspeed_set_spi_model(Object *obj, const char *value, Error **errp)
>       bmc->spi_model = g_strdup(value);
>   }
>   
> +static char *aspeed_get_uart(Object *obj, Error **errp)
> +{
> +    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
> +    int uart_chosen = bmc->uart_chosen ? bmc->uart_chosen : amc->uart_default;
> +
> +    return g_strdup_printf("uart%d", uart_chosen - ASPEED_DEV_UART1 + 1);
> +}
> +
> +static void aspeed_set_uart(Object *obj, const char *value, Error **errp)
> +{
> +    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
> +    AspeedSoCClass *sc = ASPEED_SOC_CLASS(object_class_by_name(amc->soc_name));
> +    int val;
> +
> +    if (sscanf(value, "uart%u", &val) != 1) {
> +        error_setg(errp, "Bad value for \"uart\" property");

Why are you asking for a string and not an index?

> +        return;
> +    }
> +
> +    /* The number of UART depends on the SoC */
> +    if (val < 1 || val > sc->uarts_num) {
> +        error_setg(errp, "\"uart\" should be in range [1 - %d]", sc->uarts_num);
> +        return;
> +    }
> +    bmc->uart_chosen = ASPEED_DEV_UART1 + val - 1;
> +}
> +
>   static void aspeed_machine_class_props_init(ObjectClass *oc)
>   {
>       object_class_property_add_bool(oc, "execute-in-place",
> @@ -1085,6 +1116,10 @@ static void aspeed_machine_class_props_init(ObjectClass *oc)
>       object_class_property_set_description(oc, "execute-in-place",
>                              "boot directly from CE0 flash device");
>   
> +    object_class_property_add_str(oc, "uart", aspeed_get_uart, aspeed_set_uart);
> +    object_class_property_set_description(oc, "uart",
> +                           "Change the default UART to \"uartX\"");
> +
>       object_class_property_add_str(oc, "fmc-model", aspeed_get_fmc_model,
>                                      aspeed_set_fmc_model);
>       object_class_property_set_description(oc, "fmc-model",

