Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp190940ejc;
        Tue, 23 Jan 2024 01:04:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1K+yY/6vaAt05e6+m6LZ0M1QwRHoWi7YuxT15/TNolidtuFoK4iNFH1fJ5wqs21TfDzCm
X-Received: by 2002:a9d:73d6:0:b0:6dd:ddd8:51e5 with SMTP id m22-20020a9d73d6000000b006ddddd851e5mr5125583otk.43.1706000653165;
        Tue, 23 Jan 2024 01:04:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706000653; cv=none;
        d=google.com; s=arc-20160816;
        b=eggcMuiZgapS+wq+r8Ou3GEy2nRQx+4OiLZ2SW2mj2/MygdkW4lXWzi3tLELxmmZZ1
         JaeU5fQDQOIIUHOB/jlJcPoD3XOBCG5RWbqXH5xJ/+pPDlLS13vOPNyNG2f9o1UkJP1u
         04HQBnlDLQM6ef5e5E2V9hGbDIXDB4Mu6C/UeEEjuDWpRkM02eqkuF4tkXopXqGDSm2k
         KzkjfvLHycgEwzJoQZSJMBU1PKbcK0HHjoFPwm2wnFqQDbQyAT7qyXvY2kRhzTk4iuJU
         ZANXE0kyPia4LAx/OHeYU1BLz5ApqFGQPR6EeY1GH7YD44ZtVJuR4y3rBu1mrQjt82rV
         oIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ZwqT9H6R0Y9hY0MtabauQpDfUCDV4nnYBHE39VGP+54=;
        fh=CjqoZpSay6rskVZIzd7DmHmGQlvZ+7x6x29uJZc5v74=;
        b=prQYRP39OYIV6JiNZaU4lYVLXyUSKddX3eLgIwIzNTYklaZgeXviKXwbMYWElMrs8M
         qNjg7nrFFryVHoeDR61r7JCMk8xkUDlZLxT/s/qWaAeXy9OaPeVFXidQ3o1FCRwGVaLo
         3PiFprkzPtiv703Ef2cj6Il97OehzUOVdO7EjIJOJ0y9qR1AyjG9jErRKVNKsrADupxE
         xJ6WYxdbSTM9BUuV1/UWQ7v3ZuGrqOG9swR0dA93ZSeet42Ofdzt9FXrO+p8qJqfLMrU
         9Ud93V3z6Dr5VjqLdyO/OtNRnzyYnnKQsY4p5tSb5RZATzWlWD1oeOIyhbsI1hIq87DD
         Uc+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020ac85755000000b0042a2a04c12bsi7524930qtx.515.2024.01.23.01.04.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 01:04:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSCh7-000329-Rb; Tue, 23 Jan 2024 04:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=9HdW=JB=kaod.org=clg@ozlabs.org>)
 id 1rSCh6-00030s-5w; Tue, 23 Jan 2024 04:03:44 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=9HdW=JB=kaod.org=clg@ozlabs.org>)
 id 1rSCgy-0007zL-Bj; Tue, 23 Jan 2024 04:03:43 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TK1N20sWgz4wcX;
 Tue, 23 Jan 2024 20:03:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TK1My2hGkz4wc6;
 Tue, 23 Jan 2024 20:03:26 +1100 (AEDT)
Message-ID: <14f2245c-ef63-454f-8ea2-eb5f21808100@kaod.org>
Date: Tue, 23 Jan 2024 10:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] hw/arm/aspeed/2400: Check for CPU types in
 machine_run_board_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Gavin Shan <gshan@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>
References: <20240123063842.35255-1-philmd@linaro.org>
 <20240123063842.35255-5-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240123063842.35255-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=9HdW=JB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: RiQAaGcByo1Z

On 1/23/24 07:38, Philippe Mathieu-Daudé wrote:
> Restrict MachineClass::valid_cpu_types[] to the single
> valid CPU type.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index cc59176563..e0e0877b1d 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1147,6 +1147,11 @@ static int aspeed_soc_num_cpus(const char *soc_name)
>      return sc->num_cpus;
>   }
>   
> +static const char * const ast2400_a1_valid_cpu_types[] = {
> +    ARM_CPU_TYPE_NAME("arm926"),
> +    NULL
> +};
> +
>   static void aspeed_machine_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1175,6 +1180,7 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
>       amc->spi_model = "mx25l25635f";
>       amc->num_cs    = 1;
>       amc->i2c_init  = palmetto_bmc_i2c_init;
> +    mc->valid_cpu_types = ast2400_a1_valid_cpu_types;
>       mc->default_ram_size       = 256 * MiB;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
> @@ -1192,6 +1198,7 @@ static void aspeed_machine_quanta_q71l_class_init(ObjectClass *oc, void *data)
>       amc->spi_model = "mx25l25635e";
>       amc->num_cs    = 1;
>       amc->i2c_init  = quanta_q71l_bmc_i2c_init;
> +    mc->valid_cpu_types = ast2400_a1_valid_cpu_types;
>       mc->default_ram_size       = 128 * MiB;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
> @@ -1211,6 +1218,7 @@ static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
>       amc->num_cs    = 1;
>       amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
>       amc->i2c_init  = palmetto_bmc_i2c_init;
> +    mc->valid_cpu_types = ast2400_a1_valid_cpu_types;
>       mc->default_ram_size = 256 * MiB;
>   }
>   

