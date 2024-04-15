Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1108800ejc;
        Mon, 15 Apr 2024 02:41:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfqVDuC2mWNpL+SP7vZfsuxoeOz+v2iO4XE1vYxGElAy4A9O8k94tf2qaCn+z4FHNhPZEhzbiqleob3dnN7bb+4BZA+P3J
X-Google-Smtp-Source: AGHT+IGiCVm47v+D83Qj3J6XBJliuFJgbLP0vU2LuKqqRcN2Cah0CVEpDCQkL5cy/jTWy1AmP8ay
X-Received: by 2002:a05:620a:15a7:b0:78d:6295:2978 with SMTP id f7-20020a05620a15a700b0078d62952978mr10561255qkk.23.1713174103629;
        Mon, 15 Apr 2024 02:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713174103; cv=none;
        d=google.com; s=arc-20160816;
        b=OuMgaIPXGlBNEVKsuKLczBTWcY8OS0sloTa/z2pDHK2hoOzvgZxVbCzDPVdUuLW4+N
         iGaXNQNEQ+KD6Skq+06tRXExA9TTJESeTTziIthPACmeCrvBhiVcWhN+P64Bi4IowHsY
         RDayCavRPZ354wY3MElMaTrGziDEtaJaPCfyOiKdx+jNgZZwCV7ULDSKJZd3mLXwOEjc
         60NLFpqfNq9vyuS6gEIEZbrU2rNihuGgGCfjVFTcZYgothvtpy27ebqOh7bEeE/OS8vp
         4tEQa8kKW8MII+9yH2T9bcC+yzS1TM9XudE2T0v0vO/PacvXGgOdejAoVREzkCZgpIuW
         /IOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CmaCiUrvyVtRYi9Y9EJpG/Va5Q4CHt5H8x2chPqH73g=;
        fh=p0CC61q5sC6uHFyhRyQSa71islr6sRw9CWB3E2PzoFY=;
        b=BpCeL6mRsluz9dIrwT6+IWWQMZ0lwb28Uw+zHB0tMHVGiABjH+1p8zZqqhsGJ7187R
         PaHVKgzFEFYPJUuXDIz7ugpC2c85aDOY3ZD7PverCDfK5nhbKCEN4nh/8ybwACZXhh7+
         VdMy8G/95Fwcwo6nMfu0YU3JFE9w+3SC34YoxjcDedbzJo+jAgIH29c/zOxCbJ+vgpgH
         9j92tWpHLXZ8TkRvY9u/0fVdk9AhGUvai1JAYBaGzel+me5K2nicAEFz+XZgH/uqqGrj
         ZJ3MVDnjpzoMjVULnOfmHxzIxRcWa5Gdo83oVSByo4EgxJcy8gy9jS8aAu//2I80Ht91
         VIXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wTPgWQaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1-20020ae9f441000000b0078d78c9d23bsi9910553qkl.762.2024.04.15.02.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Apr 2024 02:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wTPgWQaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwIqA-0003u1-Vf; Mon, 15 Apr 2024 05:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwIq4-0003tM-H0
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 05:41:25 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwIpw-0005js-Sx
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 05:41:23 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d6ff0422a2so37158541fa.2
 for <qemu-arm@nongnu.org>; Mon, 15 Apr 2024 02:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713174075; x=1713778875; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CmaCiUrvyVtRYi9Y9EJpG/Va5Q4CHt5H8x2chPqH73g=;
 b=wTPgWQajlmetO2G3iUq5bHCd/TSg59g+yopRV3Bs/SH9elblk+p66iapJQBMvpvDuG
 8sZXafgN8hubkzVh796P7M1L/e462yyszc11QKmaVUfEVYmgCFAACGxliV+kFEQcZeul
 tOIPRhsGKGEBQXL4gtI/frz4OZQuYdys17kP/ihvZDbHyDJ4SHkkvMZ8iScTb9sAurAX
 rUTI3uWNX1qwyJcNV6EBwbznud5j6ftAn38RF8QlYRW5ks5uWVi+FPq+4zvkZMKKaWd9
 Iwm5BWVnI4LzAELIXpQS/Cszglc8P1TTahV5+ZY1Zt1J/bi0KLIBSq+BG3nfIS46u7kc
 Wzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713174075; x=1713778875;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CmaCiUrvyVtRYi9Y9EJpG/Va5Q4CHt5H8x2chPqH73g=;
 b=WNpTiAil0rK8H5xKe2EXFax+n5sA2LNga6m+1Fq72J4mmtNFr0tYyob15HGYFEVYQx
 BOEXntBAO/WQ+lPdB4Kst17asifEh3vQ/NZHT2EkZx+gSo6w+x7+t/E7KuryLg0QvES5
 Te49OJi6JSjBj1HX+mC+U1BAnHeCA5jLBie97joKG7UtIomu8xy/Z4+B/s3gzpxFVQNp
 lLk3SYfhFf9Tm1zOoTRimpQe8TuWWa6FrtgtlJ/OuehxlnO/qj3hi4jmoW4Dbg68jC6a
 /jaUYmqmfdIhjfZxR5GTJyBRcTbwiKiQSBIat04q3JDHSwWhcRkWAHB7elXFeGzhZv/a
 9PWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrEMTDLPKEBBfVnb6q5qQ/fyOjlqzvbPl0/8NvB8BVBaNs6VMSpDJyOFL+e9FT74Kf6T1qhojBCclQSbAQsinuE1CP
X-Gm-Message-State: AOJu0Ywv8+76pHE7V4SD5tUsUf78gugiIhZg2d2Zzw6ARDvKGQTROT9g
 nvTX61qbUZSmMJOie0f4EihKs8Vbgzm2JRoqylq6qLv73GZMpKcbnCarePSMlV0=
X-Received: by 2002:a2e:9b49:0:b0:2d8:df61:9c6c with SMTP id
 o9-20020a2e9b49000000b002d8df619c6cmr5895426ljj.20.1713174074947; 
 Mon, 15 Apr 2024 02:41:14 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.132.126])
 by smtp.gmail.com with ESMTPSA id
 ay36-20020a05600c1e2400b004186df974f1sm1897343wmb.33.2024.04.15.02.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 02:41:14 -0700 (PDT)
Message-ID: <beef0bc3-7964-4f41-af51-374b84ba20aa@linaro.org>
Date: Mon, 15 Apr 2024 11:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] hw/arm : Connect DM163 to B-L475E-IOT01A
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Samuel Tardieu <sam@rfc1149.net>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240414130604.182059-1-ines.varhol@telecom-paris.fr>
 <20240414130604.182059-5-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240414130604.182059-5-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: sL/0CXaArBMe

On 14/4/24 15:05, Inès Varhol wrote:
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   hw/arm/b-l475e-iot01a.c | 59 +++++++++++++++++++++++++++++++++++++++--
>   hw/arm/Kconfig          |  1 +
>   2 files changed, 58 insertions(+), 2 deletions(-)


> +/*
> + * There are actually 14 input pins in the DM163 device.
> + * Here the DM163 input pin EN isn't connected to the STM32L4x5
> + * GPIOs as the IM120417002 colors shield doesn't actually use
> + * this pin to drive the RGB matrix.
> + */
> +#define NUM_DM163_INPUTS 13
> +
> +static const int dm163_input[NUM_DM163_INPUTS] = {

s/int/unsigned/

> +    1 * GPIO_NUM_PINS + 2,  /* ROW0  PB2       */
> +    0 * GPIO_NUM_PINS + 15, /* ROW1  PA15      */
> +    0 * GPIO_NUM_PINS + 2,  /* ROW2  PA2       */
> +    0 * GPIO_NUM_PINS + 7,  /* ROW3  PA7       */
> +    0 * GPIO_NUM_PINS + 6,  /* ROW4  PA6       */
> +    0 * GPIO_NUM_PINS + 5,  /* ROW5  PA5       */
> +    1 * GPIO_NUM_PINS + 0,  /* ROW6  PB0       */
> +    0 * GPIO_NUM_PINS + 3,  /* ROW7  PA3       */
> +    0 * GPIO_NUM_PINS + 4,  /* SIN (SDA) PA4   */
> +    1 * GPIO_NUM_PINS + 1,  /* DCK (SCK) PB1   */
> +    2 * GPIO_NUM_PINS + 3,  /* RST_B (RST) PC3 */
> +    2 * GPIO_NUM_PINS + 4,  /* LAT_B (LAT) PC4 */
> +    2 * GPIO_NUM_PINS + 5,  /* SELBK (SB)  PC5 */
> +};
>   
>   #define TYPE_B_L475E_IOT01A MACHINE_TYPE_NAME("b-l475e-iot01a")
>   OBJECT_DECLARE_SIMPLE_TYPE(Bl475eMachineState, B_L475E_IOT01A)
> @@ -39,12 +66,16 @@ typedef struct Bl475eMachineState {
>       MachineState parent_obj;
>   
>       Stm32l4x5SocState soc;
> +    SplitIRQ gpio_splitters[NUM_DM163_INPUTS];
> +    DM163State dm163;
>   } Bl475eMachineState;
>   
>   static void bl475e_init(MachineState *machine)
>   {
>       Bl475eMachineState *s = B_L475E_IOT01A(machine);
>       const Stm32l4x5SocClass *sc;
> +    DeviceState *dev, *gpio_out_splitter;
> +    int gpio, pin;

unsigned.

>   
>       object_initialize_child(OBJECT(machine), "soc", &s->soc,
>                               TYPE_STM32L4X5XG_SOC);
> @@ -53,6 +84,30 @@ static void bl475e_init(MachineState *machine)
>       sc = STM32L4X5_SOC_GET_CLASS(&s->soc);
>       armv7m_load_kernel(ARM_CPU(first_cpu),
>           machine->kernel_filename, 0, sc->flash_size);
> +
> +    if (object_class_by_name("dm163")) {

TYPE_DM163

> +        object_initialize_child(OBJECT(machine), "dm163",
> +                                &s->dm163, TYPE_DM163);
> +        dev = DEVICE(&s->dm163);
> +        qdev_realize(dev, NULL, &error_abort);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

