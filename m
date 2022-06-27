Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2501749lft;
        Mon, 27 Jun 2022 09:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sCXEQlAVLx/6KETwzka5jWvAIUaO/DwuxYj/QIHiH2L9K9hmVtKgGAW9HvErzb5+HNvdxJ
X-Received: by 2002:ad4:5c69:0:b0:470:3fee:e97d with SMTP id i9-20020ad45c69000000b004703feee97dmr260075qvh.124.1656347207367;
        Mon, 27 Jun 2022 09:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656347207; cv=none;
        d=google.com; s=arc-20160816;
        b=yk15AfEK/IANIZS92pumJS7mYbih/miLj3y/3OZP/zX2t8fh8pFNxUy7M1La8snu6o
         tVWQXa937jHowzXtlA2FxL/dIEF3FLAMX0XabXroU2N97FYUhRsgB6+xUuE0Vz1i2ioH
         SdKT/RECOcw6/5VWO2jf6sGO62b8GisVzhJUNCs5HHwP3XYMtkLQ/+VvZZ/8y8UHWVIR
         psQA0zj3/uelO0OB+P2ER3J4C/NSY3nL5mHGCHrfcKcXo4kDNbAOgndz+1vXujUtMW+A
         +nLElmpYBPsmq03URMm95LCKEGObQtfWoGpIfIBXEYVInyhSMBiVr70V2YrRsMJxNCc2
         JBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=rGb4cwMhCTzV4AMgRX/1OMb77agZ20sn+btmZSinb4k=;
        b=oKgDkGRW3leoNaxVtXGdXCTZpPWs9CN4YXtz0TRdGvJvXUv4MLZie74IpYzs2bZ3fu
         CF6uY0ZhxrUbRc7cLWqeOTg0P4TebAzTKCoLJUFT4CvX92z/L24gCB26ZNh/2pvDNvls
         CEJLFxouiuRBH67E6CU3erAN0aC5xzeFkXeEbdzsqqGjNKPogcyIi/S8QAbY76ghTt/I
         MhBxcki3UBbUTP1fBMnOt2X4tMS+ky0ghWJD6oRA2A7VmypeOYBYFlrFdTDbVIhP1OXp
         2Q/0obm3a2c0dLpJIQ47DEOTuTSSzEK7etny5Fpg+j97QWYi33f/y83FvbHudxXWei3C
         bXYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl33-20020a05620a1aa100b006af09fd6966si4733798qkb.656.2022.06.27.09.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 09:26:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5rZW-0001FJ-Rl
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 12:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rDP-0001gN-I7
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:03:56 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:49969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rDN-0007sz-7T
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:03:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.120])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 11F7A21AB4;
 Mon, 27 Jun 2022 16:03:50 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 27 Jun
 2022 18:03:49 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001ef8f3f8e-8a36-48cd-b993-53c51bdff81b,
 D5BAD815273CE4794DDBC5929823026F491AE39B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3796dfc6-00c3-f63c-0ee4-9e4d9c69bd5d@kaod.org>
Date: Mon, 27 Jun 2022 18:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 5/7] hw/arm/aspeed: Add MAX31785 Fan controllers
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Patrick Venture
 <venture@google.com>, Hao Wu <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
 <20220627154703.148943-6-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627154703.148943-6-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d02aea0e-9560-439c-8153-bfc4885fcd95
X-Ovh-Tracer-Id: 15340949184269159413
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4EBqlIwX89m9

On 6/27/22 17:47, Jae Hyun Yoo wrote:
> From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> 
> Add MAX31785 fan controllers in machines so that the Linux driver
> populates the sysfs interface.
> 
> Firework has two MAX31785 Fan controllers at 0x52, and 0x54 on bus 9.
> Witherspoon has one at 0x52 on bus 3.
> Rainier has one at 0x52 on bus 7.


Joel, can I have your Ack for the IBM systems please ?


> 
> Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> Changes in v2:
> * Added PMBUS and MAX31785 config selection under ASPEED_SOC. (Titus)
> * Moved machine updating part from the previous patch. (Cedric)
> 
>   hw/arm/Kconfig  | 2 ++
>   hw/arm/aspeed.c | 8 ++++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 219262a8da36..15fa79afd33a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -455,6 +455,8 @@ config ASPEED_SOC
>       select EMC141X
>       select UNIMP
>       select LED
> +    select PMBUS
> +    select MAX31785
>   
>   config MPS2
>       bool
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 342cf39c9747..9c07db70f2fc 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -619,7 +619,6 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>       LEDState *led;
>   
>       /* Bus 3: TODO bmp280@77 */
> -    /* Bus 3: TODO max31785@52 */
>       dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
>       qdev_prop_set_string(dev, "description", "pca1");
>       i2c_slave_realize_and_unref(I2C_SLAVE(dev),
> @@ -635,6 +634,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>                                 qdev_get_gpio_in(DEVICE(led), 0));
>       }
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "dps310", 0x76);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "max31785", 0x52);
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
>   
> @@ -779,13 +779,13 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>       create_pca9552(soc, 7, 0x31);
>       create_pca9552(soc, 7, 0x32);
>       create_pca9552(soc, 7, 0x33);
> -    /* Bus 7: TODO max31785@52 */
>       create_pca9552(soc, 7, 0x60);
>       create_pca9552(soc, 7, 0x61);
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "dps310", 0x76);
>       /* Bus 7: TODO si7021-a20@20 */
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
>                        0x48);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "max31785", 0x52);
>       aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
>       aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
>   
> @@ -1007,6 +1007,10 @@ static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>       qcom_dc_scm_bmc_i2c_init(bmc);
>   
>       /* Now create the Firework specific hardware */
> +
> +    /* I2C9 Fan Controller (MAX31785) */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x52);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x54);
>   }
>   
>   static bool aspeed_get_mmio_exec(Object *obj, Error **errp)

