Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2727603ejs;
        Mon, 3 Jun 2024 23:11:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVS7lBJVsWoQTFf2BKpRB0Z6pYeGka0OTwgB5pty7lolwyRt/a8/X3IiFUH6Tc7FhB5jeiwbtWBWfhS/cy2jyJ2kBmzVtrY
X-Google-Smtp-Source: AGHT+IEbGhHg6U/+mEFhL3DKtZZFDOUJPfaJk5nDxV9mdMYOQlO5XRQm8eQ1C3HsFaDGxzwSZvjj
X-Received: by 2002:a05:620a:2483:b0:795:19b:e13b with SMTP id af79cd13be357-795019bebd1mr1026998785a.28.1717481506510;
        Mon, 03 Jun 2024 23:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717481506; cv=none;
        d=google.com; s=arc-20160816;
        b=tIVdiS5JJ5yYYXm+VwPy/DNi0wkiyLlEoh+USERsoJd1qeRN5prKukOe9ulkiVj1Ss
         Rhja6s5ZCnEu3PM77P65zPK5TLZtT/kbosXphSV1cNM1ywywikv9XPKrAfaH88iN4hbV
         BPMPKVTJlY/rRyo4+qjzLQf7bJGOI7kpBmUzr7wKr9g+pn3gm8CGy1uW0MAogsYcxMh/
         wg/GlnKUy1e1F7TpmGeTR0avsOu6jJVeqDJTrNbrtiPXL9AEJ9IIfOz/KBGJUbmE9bKD
         cmFO5KVPz9FW4tdFXUsyH2S0QBX8sI673DJQwfhT6xSjPip8pQ8LmSrcOkQAEcHSbjuA
         1Iqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=cbopC/+1CG/xwwvQRJyJgO2OtxUogJAfPwUc0x8JmRU=;
        fh=dkl4W7Ty5DQDYblIuR6iwQV8rfkW6Bl5VLJjLin9mSc=;
        b=tKmXmabj15qzDqYlcfnPCsXorRgApOyVePha0uTEizRpsiBysYQETgvaF2GFxlFRTn
         CxwiD1IYgGiutbVUMNlUERc1XHv8zzXI4yAnQRCJ3JgDjhrwnGhtMTBHVRDvh1YwFOQ3
         aWDI0+W0CAc5XUVla2eUugZeUzrTceAPCsA06npBCNdFS5x+nzW0t+mIjEE3dyXwx4mU
         t+1YjXDa53xZryrsWKruoaUnPUay+ATI3wM/xzWneWBn0OqOp8bPbKXes4cpM5x8u3Y6
         3tHBCNatnGPpW7+CrI9fH2SKw8XxZxWkHEWXsi5baa5X96OgNL3AUL7uvK0nFV15VWzi
         yDbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f2f055d1si1129684485a.119.2024.06.03.23.11.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 23:11:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sENOa-0007bj-CM; Tue, 04 Jun 2024 02:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OW7X=NG=kaod.org=clg@ozlabs.org>)
 id 1sENOZ-0007bU-00; Tue, 04 Jun 2024 02:11:43 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OW7X=NG=kaod.org=clg@ozlabs.org>)
 id 1sENOU-0002Ie-EP; Tue, 04 Jun 2024 02:11:42 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4VtgGG3VRcz4x2f;
 Tue,  4 Jun 2024 16:11:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VtgG95zVgz4x2L;
 Tue,  4 Jun 2024 16:11:29 +1000 (AEST)
Message-ID: <80b37a86-a667-4e35-9799-f57e278c3d52@kaod.org>
Date: Tue, 4 Jun 2024 08:11:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/17] aspeed/smc: support different memory region ops
 for SMC flash region
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
 <20240604054438.3424349-10-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240604054438.3424349-10-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=OW7X=NG=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: 7sgIUggpmOqi

On 6/4/24 07:44, Jamin Lin wrote:
> It set "aspeed_smc_flash_ops" struct which containing
> read and write callbacks to be used when I/O is performed
> on the SMC flash region. And it set the valid max_access_size 4
> by default for all ASPEED SMC models.
> 
> However, the valid max_access_size 4 only support 32 bits CPUs.
> To support all ASPEED SMC model, introduce a new
> "const MemoryRegionOps *" attribute in AspeedSMCClass and
> use it in aspeed_smc_flash_realize function.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/ssi/aspeed_smc.c         | 14 +++++++++++++-
>   include/hw/ssi/aspeed_smc.h |  1 +
>   2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index df0c63469c..129d06690d 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -1316,7 +1316,7 @@ static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
>        * Use the default segment value to size the memory region. This
>        * can be changed by FW at runtime.
>        */
> -    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_flash_ops,
> +    memory_region_init_io(&s->mmio, OBJECT(s), s->asc->reg_ops,
>                             s, name, s->asc->segments[s->cs].size);
>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>   }
> @@ -1391,6 +1391,7 @@ static void aspeed_2400_smc_class_init(ObjectClass *klass, void *data)
>       asc->segment_to_reg    = aspeed_smc_segment_to_reg;
>       asc->reg_to_segment    = aspeed_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_smc_dma_ctrl;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_2400_smc_info = {
> @@ -1441,6 +1442,7 @@ static void aspeed_2400_fmc_class_init(ObjectClass *klass, void *data)
>       asc->segment_to_reg    = aspeed_smc_segment_to_reg;
>       asc->reg_to_segment    = aspeed_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_smc_dma_ctrl;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_2400_fmc_info = {
> @@ -1480,6 +1482,7 @@ static void aspeed_2400_spi1_class_init(ObjectClass *klass, void *data)
>       asc->reg_to_segment    = aspeed_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_smc_dma_ctrl;
>       asc->addr_width        = aspeed_2400_spi1_addr_width;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_2400_spi1_info = {
> @@ -1525,6 +1528,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass *klass, void *data)
>       asc->segment_to_reg    = aspeed_smc_segment_to_reg;
>       asc->reg_to_segment    = aspeed_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_smc_dma_ctrl;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_2500_fmc_info = {
> @@ -1560,6 +1564,7 @@ static void aspeed_2500_spi1_class_init(ObjectClass *klass, void *data)
>       asc->segment_to_reg    = aspeed_smc_segment_to_reg;
>       asc->reg_to_segment    = aspeed_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_smc_dma_ctrl;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_2500_spi1_info = {
> @@ -1595,6 +1600,7 @@ static void aspeed_2500_spi2_class_init(ObjectClass *klass, void *data)
>       asc->segment_to_reg    = aspeed_smc_segment_to_reg;
>       asc->reg_to_segment    = aspeed_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_smc_dma_ctrl;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_2500_spi2_info = {
> @@ -1682,6 +1688,7 @@ static void aspeed_2600_fmc_class_init(ObjectClass *klass, void *data)
>       asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
>       asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_2600_fmc_info = {
> @@ -1721,6 +1728,7 @@ static void aspeed_2600_spi1_class_init(ObjectClass *klass, void *data)
>       asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
>       asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_2600_spi1_info = {
> @@ -1761,6 +1769,7 @@ static void aspeed_2600_spi2_class_init(ObjectClass *klass, void *data)
>       asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
>       asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_2600_spi2_info = {
> @@ -1843,6 +1852,7 @@ static void aspeed_1030_fmc_class_init(ObjectClass *klass, void *data)
>       asc->segment_to_reg    = aspeed_1030_smc_segment_to_reg;
>       asc->reg_to_segment    = aspeed_1030_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_1030_fmc_info = {
> @@ -1881,6 +1891,7 @@ static void aspeed_1030_spi1_class_init(ObjectClass *klass, void *data)
>       asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
>       asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_1030_spi1_info = {
> @@ -1918,6 +1929,7 @@ static void aspeed_1030_spi2_class_init(ObjectClass *klass, void *data)
>       asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
>       asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
>       asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +    asc->reg_ops           = &aspeed_smc_flash_ops;
>   }
>   
>   static const TypeInfo aspeed_1030_spi2_info = {
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index d305ce2e2f..234dca32b0 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -115,6 +115,7 @@ struct AspeedSMCClass {
>                              AspeedSegments *seg);
>       void (*dma_ctrl)(AspeedSMCState *s, uint32_t value);
>       int (*addr_width)(const AspeedSMCState *s);
> +    const MemoryRegionOps *reg_ops;
>   };
>   
>   #endif /* ASPEED_SMC_H */

