Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp132257lff;
        Wed, 16 Jun 2021 02:11:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVZj4tNmSpyCG4Xlox+LLRm5GQrGzaVxAffAV8n+eNf31f0Pb/GyX8Q9P8p6zIxlUh5sA3
X-Received: by 2002:ab0:2690:: with SMTP id t16mr3496026uao.9.1623834660957;
        Wed, 16 Jun 2021 02:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623834660; cv=none;
        d=google.com; s=arc-20160816;
        b=tDHf4MEWUuUgOVS1vfL0YE3RgT09TFdS3q6oKJf0deTBEV6L7tT7pKT9aNIiYNni4p
         bbDIgQE/SH95NwDadRhoDxrugnyLWUBcjplpqjuJBnkimB4d1zFI/jtw6z5LwrfsrBgK
         6hyZUTNrIeyddnB2pt6jkZor3q5aUrrCfL3iM/raY0LdpDBrs80FOdCBizVox1bUzzCy
         UJWn9h40E2+cHi64wU4gJTpFXnfwDbnMzkmZB+ijYWjGGHO015h1eB47aWGcRL2MT+6S
         9Bukfdvuw/1OfO03wZ3Abn1S9L5g/roLczpC2gZLECrZevlQNtkTbAq9CQTQoD9kmRAP
         pbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=PW2mEXSGUSKM5i7BG1YiRujcUFGHbNGQrkLGU6RFsRA=;
        b=vDDqvtQFqlzV9HdHqGhOuceWqT8kiW5uCeTs0sOgIYiNUbnzXYCUarlWKE8N44+9Rd
         ca0S6VretgyzVQ/gA7CAZa7A4qzXR3D7Z0PONMu8KR739gEcAPIdclVqkagmYFrHNvYe
         mDgUiN0uw3MRVpflEipN4uyxBQY6RyO658n7JBfi9DMdaJjdWPaFCtpuEQxA06ZD5PiU
         8jBMbStNxTJictaK22g6/C1q4XkorhIX2l8LlGct6koquNA1SSh2LggAhWOcBPQ37C+T
         YKoe3OyPTja/yEUPGoBQhi8F2vQKkTTzB+moODKSV3/YIH6sTcZkkKz8YZYIie4MH1JS
         J4eA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s24si856549vsa.335.2021.06.16.02.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 02:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltRZc-0002Cc-9m
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 05:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ltRUm-0003Ci-4y
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 05:06:00 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:58721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ltRUk-0008Ie-2k
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 05:05:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id D1BC5140063;
 Wed, 16 Jun 2021 09:05:56 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 16 Jun
 2021 11:05:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0017a1e7aa1-d5aa-4c46-a22e-844a23ee9202,
 06345D7E1B8C8FAD34147FE460F0DA442DB8F7FD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH v2 2/2] arm/aspeed: Add DPS310 to Witherspoon and Rainier
To: Joel Stanley <joel@jms.id.au>
References: <20210616073358.750472-1-joel@jms.id.au>
 <20210616073358.750472-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a68c1d97-935d-bb4f-8097-0ff51ec97b9f@kaod.org>
Date: Wed, 16 Jun 2021 11:05:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616073358.750472-3-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 96bc10b8-3011-421a-9b51-6ef646dbceac
X-Ovh-Tracer-Id: 13759622762689432544
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
 RCVD_IN_BL_SPAMCOP_NET=1.347, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iiSrLlEVUO0O

On 6/16/21 9:33 AM, Joel Stanley wrote:
> Witherspoon uses the DPS310 as a temperature sensor. Rainier uses it as
> a temperature and humidity sensor.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>  hw/arm/aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 0eafc791540d..619ad869dd71 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -597,7 +597,6 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>  
>      /* Bus 3: TODO bmp280@77 */
>      /* Bus 3: TODO max31785@52 */
> -    /* Bus 3: TODO dps310@76 */
>      dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
>      qdev_prop_set_string(dev, "description", "pca1");
>      i2c_slave_realize_and_unref(I2C_SLAVE(dev),
> @@ -612,6 +611,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>          qdev_connect_gpio_out(dev, pca1_leds[i].gpio_id,
>                                qdev_get_gpio_in(DEVICE(led), 0));
>      }
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "dps310", 0x76);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
>  
> @@ -693,9 +693,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
>                       0x4b);
>  
> -    /* Bus 7: TODO dps310@76 */
>      /* Bus 7: TODO max31785@52 */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552", 0x61);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "dps310", 0x76);
>      /* Bus 7: TODO si7021-a20@20 */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
>                       0x48);
> 

