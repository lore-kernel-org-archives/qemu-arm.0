Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp12007810njk;
        Mon, 6 Jan 2025 12:15:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXS4qTCnHgay7kIvHPc9Dfbiu9spCY6TJjoDmdDIeZm9xCJRkIHKunxm+wQXbqRJBRN+vyJAjp7A2tsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHkGaFLN7Ri8trNoXb7G7p951ppv1ZJRlcISZdeHRzY9Z/wPQuRFTUa3JoER8eSdC0S/FCR
X-Received: by 2002:a05:622a:1a8d:b0:468:f80b:c5d7 with SMTP id d75a77b69052e-46a4a8c1c64mr957621181cf.1.1736194546918;
        Mon, 06 Jan 2025 12:15:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736194546; cv=none;
        d=google.com; s=arc-20240605;
        b=AuHPG4Gho44+2qBuERiD4ki9wq4QdXzYhxvgMziaBwm+uKh1qyiCkJCplM8NYShm6G
         O0bkrqw7n3zC2avJ9X85nAer83QAt/VApoiHozLYXKbZ6IACFKQ5LLReJq7GtwK72U6U
         4abg37MdJ4Ehy++FK9nPv2T6ppahJwY2rxcfqjgaipy10jBf3OjSCdPzGolJQZaiqV7B
         mvQUXpSVtLi/lIQpbffXJNA8YDVwzn2+Qz2EdpIpW+kxzJYza6YmVf/PrL45DZkZ32uk
         k/EYAPFsuZdEzLem48tTG44i/U3IVP/Cix8yzzEeqTrxNM6hdZJJRO8TYCIQyG5v/q5o
         vnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=DlI62BJub4BdTeNvRspjlRb9urbaLpzCeHPPUjxorK4=;
        fh=ojCa2pw/689AzcQ45OwnHyuM8afx9fDgwsjjpQ22Shk=;
        b=lZg8VuUbE/LdpdrcQbXaL6R37RRRBLgv5s60Lg/KPAyOOsIWekEayM6howeajcVV8Q
         xuaaDIGaa5C0Oh1jY6zjpuumZNOiKzW76uqLFQttIa3O2Dr3YZbklWSRqkR4KmTMCQi7
         /yC50zmFil+BTUP4zt4AZWkMF89mnhiBUm9TffpVq836K2KpomPONV0GTtnSRBDUZQV0
         qQaFocPzoHyH4Ed3RODT7GAunrT6Xa7ECrQZQbQrXeOkBqEiVBd29Y/zXl3M9YiRT6IA
         Sp5gFWksGykmDW9LqE0YuVtRKwIaNJaNTqyFTqj4kRLnqvoJkzR1BeXYvDbwantSHah/
         +uSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=J4gL5MaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3e67ef74si469523291cf.134.2025.01.06.12.15.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2025 12:15:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=J4gL5MaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tUtVX-00017o-6Z; Mon, 06 Jan 2025 15:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.ibm.com>)
 id 1tUtVO-00016a-RI; Mon, 06 Jan 2025 15:15:18 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.ibm.com>)
 id 1tUtVL-0004pw-LB; Mon, 06 Jan 2025 15:15:18 -0500
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506E6sj7002701;
 Mon, 6 Jan 2025 20:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=pp1;
 bh=DlI62BJub4BdTeNvRspjlRb9urbaLpzCeHPPUjxorK4=; b=J4gL5MaVd82M
 hOyQ9OGMDBi/WYI3MjB5VPRafg43SFxwQmUbJgr7Rf6RFv8dTOA/O+DDMBeDE/Dz
 a3EsDF1Hd1jTsU+yVIIEnWCuW0ag6m4ncg3EfcpyjxfnAi/bUH8f4njoDZUbYfdx
 KRHTPt57uO2WB7IbXnGSgsq51E4bmcEOVSBsN1VhZ+HcE3khwZjIAQfks+xhnwcV
 pUIws38esAAnDqrot7W4SmJeQozqDh91Ozk/YBEF0+NU9ZwYsan0tfYddI+Bh+6v
 dh3M/dhGrSwv3T/XHDrjDyyTT/6Vm0pDbkqkJzWDN42L2ADkhCGE2lWyhbd60VVd
 IR4RgRiUBA==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440gn51k11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 20:15:09 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 506KB09T017297;
 Mon, 6 Jan 2025 20:15:09 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440gn51k10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 20:15:09 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 506I56g5004143;
 Mon, 6 Jan 2025 20:15:08 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfasyfag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 20:15:08 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 506KF7tD31654622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2025 20:15:08 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D91895805B;
 Mon,  6 Jan 2025 20:15:07 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CA975805F;
 Mon,  6 Jan 2025 20:15:07 +0000 (GMT)
Received: from mambor8.rchland.ibm.com (unknown [9.10.239.198])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jan 2025 20:15:07 +0000 (GMT)
Message-ID: <43e8dde9c0605526a4ae796b7dc090aaa8e59b65.camel@linux.ibm.com>
Subject: Re: [PATCH 26/71] hw/gpio: Constify all Property
From: Miles Glenn <milesg@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Tyrone Ting
 <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Samuel Tardieu <sam@rfc1149.net>, "open list:i.MX31
 (kzm)" <qemu-arm@nongnu.org>, "open list:pca955x" <qemu-ppc@nongnu.org>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Date: Mon, 06 Jan 2025 14:15:06 -0600
In-Reply-To: <20241213190750.2513964-31-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213190750.2513964-31-richard.henderson@linaro.org>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8_8.2) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: E2zrYNGCyRt_j5RA3Pgzv7hIcm1YZ2E9
X-Proofpoint-GUID: amMgKoZRH-N6hREDOiNz2xcG2gDOi_Yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=984 spamscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501060174
Received-SPF: pass client-ip=148.163.158.5; envelope-from=milesg@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: milesg@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7yYH+RdJW0Ju

Reviewed-by: Glenn Miles <milesg@linux.ibm.com>

On Fri, 2024-12-13 at 13:07 -0600, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/gpio/imx_gpio.c       | 2 +-
>  hw/gpio/npcm7xx_gpio.c   | 2 +-
>  hw/gpio/omap_gpio.c      | 2 +-
>  hw/gpio/pca9552.c        | 2 +-
>  hw/gpio/pca9554.c        | 2 +-
>  hw/gpio/pl061.c          | 2 +-
>  hw/gpio/sifive_gpio.c    | 2 +-
>  hw/gpio/stm32l4x5_gpio.c | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/gpio/imx_gpio.c b/hw/gpio/imx_gpio.c
> index 27535a577f..919d53701f 100644
> --- a/hw/gpio/imx_gpio.c
> +++ b/hw/gpio/imx_gpio.c
> @@ -290,7 +290,7 @@ static const VMStateDescription vmstate_imx_gpio
> = {
>      }
>  };
>  
> -static Property imx_gpio_properties[] = {
> +static const Property imx_gpio_properties[] = {
>      DEFINE_PROP_BOOL("has-edge-sel", IMXGPIOState, has_edge_sel,
> true),
>      DEFINE_PROP_BOOL("has-upper-pin-irq", IMXGPIOState,
> has_upper_pin_irq,
>                       false),
> diff --git a/hw/gpio/npcm7xx_gpio.c b/hw/gpio/npcm7xx_gpio.c
> index ba19b9ebad..db6792b2ad 100644
> --- a/hw/gpio/npcm7xx_gpio.c
> +++ b/hw/gpio/npcm7xx_gpio.c
> @@ -386,7 +386,7 @@ static const VMStateDescription
> vmstate_npcm7xx_gpio = {
>      },
>  };
>  
> -static Property npcm7xx_gpio_properties[] = {
> +static const Property npcm7xx_gpio_properties[] = {
>      /* Bit n set => pin n has pullup enabled by default. */
>      DEFINE_PROP_UINT32("reset-pullup", NPCM7xxGPIOState, reset_pu,
> 0),
>      /* Bit n set => pin n has pulldown enabled by default. */
> diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
> index a47a2167a6..03ee9e47c6 100644
> --- a/hw/gpio/omap_gpio.c
> +++ b/hw/gpio/omap_gpio.c
> @@ -225,7 +225,7 @@ void omap_gpio_set_clk(Omap1GpioState *gpio,
> omap_clk clk)
>      gpio->clk = clk;
>  }
>  
> -static Property omap_gpio_properties[] = {
> +static const Property omap_gpio_properties[] = {
>      DEFINE_PROP_INT32("mpu_model", Omap1GpioState, mpu_model, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> diff --git a/hw/gpio/pca9552.c b/hw/gpio/pca9552.c
> index 59b233339a..427419d218 100644
> --- a/hw/gpio/pca9552.c
> +++ b/hw/gpio/pca9552.c
> @@ -428,7 +428,7 @@ static void pca955x_realize(DeviceState *dev,
> Error **errp)
>      qdev_init_gpio_in(dev, pca955x_gpio_in_handler, k->pin_count);
>  }
>  
> -static Property pca955x_properties[] = {
> +static const Property pca955x_properties[] = {
>      DEFINE_PROP_STRING("description", PCA955xState, description),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> diff --git a/hw/gpio/pca9554.c b/hw/gpio/pca9554.c
> index 68cc9e1de4..e8b0458aac 100644
> --- a/hw/gpio/pca9554.c
> +++ b/hw/gpio/pca9554.c
> @@ -291,7 +291,7 @@ static void pca9554_realize(DeviceState *dev,
> Error **errp)
>      qdev_init_gpio_in(dev, pca9554_gpio_in_handler,
> PCA9554_PIN_COUNT);
>  }
>  
> -static Property pca9554_properties[] = {
> +static const Property pca9554_properties[] = {
>      DEFINE_PROP_STRING("description", PCA9554State, description),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index d5838b8e98..9b8ca6de32 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -562,7 +562,7 @@ static void pl061_realize(DeviceState *dev, Error
> **errp)
>      }
>  }
>  
> -static Property pl061_props[] = {
> +static const Property pl061_props[] = {
>      DEFINE_PROP_UINT32("pullups", PL061State, pullups, 0xff),
>      DEFINE_PROP_UINT32("pulldowns", PL061State, pulldowns, 0x0),
>      DEFINE_PROP_END_OF_LIST()
> diff --git a/hw/gpio/sifive_gpio.c b/hw/gpio/sifive_gpio.c
> index e85c0406a2..5603f0c235 100644
> --- a/hw/gpio/sifive_gpio.c
> +++ b/hw/gpio/sifive_gpio.c
> @@ -349,7 +349,7 @@ static const VMStateDescription
> vmstate_sifive_gpio = {
>      }
>  };
>  
> -static Property sifive_gpio_properties[] = {
> +static const Property sifive_gpio_properties[] = {
>      DEFINE_PROP_UINT32("ngpio", SIFIVEGPIOState, ngpio,
> SIFIVE_GPIO_PINS),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> diff --git a/hw/gpio/stm32l4x5_gpio.c b/hw/gpio/stm32l4x5_gpio.c
> index 30d8d6cba4..d1394f3f55 100644
> --- a/hw/gpio/stm32l4x5_gpio.c
> +++ b/hw/gpio/stm32l4x5_gpio.c
> @@ -447,7 +447,7 @@ static const VMStateDescription
> vmstate_stm32l4x5_gpio = {
>      }
>  };
>  
> -static Property stm32l4x5_gpio_properties[] = {
> +static const Property stm32l4x5_gpio_properties[] = {
>      DEFINE_PROP_STRING("name", Stm32l4x5GpioState, name),
>      DEFINE_PROP_UINT32("mode-reset", Stm32l4x5GpioState,
> moder_reset, 0),
>      DEFINE_PROP_UINT32("ospeed-reset", Stm32l4x5GpioState,
> ospeedr_reset, 0),

