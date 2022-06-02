Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4723749lfh;
        Thu, 2 Jun 2022 00:31:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdtBCaKA3NrDsTHoODHEfVebbbGMXJCgvVdizAM/fAraohbvVD6O4J6MFb+Qa7oiN+I3/w
X-Received: by 2002:a05:622a:199c:b0:304:b912:7917 with SMTP id u28-20020a05622a199c00b00304b9127917mr2609074qtc.271.1654155096539;
        Thu, 02 Jun 2022 00:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654155096; cv=none;
        d=google.com; s=arc-20160816;
        b=rM0CkErucThio3BAP7iJnEz3JNx1p/zeL/KY5jmdaJKddN6+t4GOhTwxC+E6SHIP6c
         MbAsBwcLL1WPcbFeScCjPVAB6HXGJJRuEjHwO92A+qiRGcOZvWPQnVdLb9Rz9gMHZGwz
         fQtkxIPeZ/mitd9V7dQp7UDaVWPDslhsqez6aI3HWjv+Ty7OHQk4j+9HG1gqH3yVHUXb
         DhW8HLXf4fwMcKOjIGfv79JJqRlBl++I00eRHDArLX68PEys1jMXEJEIw5zvV/ktVFA3
         8VV5S5nbFNzB+AM8K2bJGYrhljye9ArHNNd7NrEgIzUIpHa4+R1zNWg7vp0D59S0ODp9
         A8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=sRf6Rr8SfL4DCfB9DUA6JVUd//O3sUMxj/Q4nxvHt4I=;
        b=ZVod6fsr2zuLhKaXHx04G/9g7+6WGkXMoblYMtWndO9vgeJcbWGOeqmVHBVWoLEyMT
         VF0j7wY8jTqecP9ijLRgtwm2KbMlJMzsZix0MAtAiboDuTD1lPXPyrdn/8Lp2neEZHsu
         P+knipVqVNaAc7rXTr3YytKCiT1SH+fuapIb+WPpxkPkMF+8BY+ZODZ5B8CTwJfHk4ht
         Dt1U1+9/HoKSUDf2yr/6tt32yCs03VD/YLc/DHULPHb0E5iRG2aQZdfRNKbcMPUkmzCP
         ILfEmbjOx5sxWWkIPmRxik2OwH6rG5tPvTFaaLuO3+ka/d2jNCDegSpTk5eERahaqMD9
         Qgvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020a37ef11000000b006a0cdc7a466si1782671qkk.400.2022.06.02.00.31.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 00:31:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwfIt-0007Qd-Vc
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 03:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nwfHr-0007QC-T3; Thu, 02 Jun 2022 03:30:31 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:53553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nwfHp-0002QQ-KQ; Thu, 02 Jun 2022 03:30:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8FE221FE4A;
 Thu,  2 Jun 2022 07:30:23 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 2 Jun 2022
 09:30:22 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004948d0309-3ff5-4317-bf9e-1071bc43af83,
 123C0E545D135716686AEE7B3F9DB382F3F098BA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <13946fb6-727e-3d84-6028-8941a7e1907d@kaod.org>
Date: Thu, 2 Jun 2022 09:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v2 2/6] hw/i2c/aspeed: add DEV_ADDR in old register
 mode
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <qemu-arm@nongnu.org>,
 Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Padmakar Kalghatgi
 <p.kalghatgi@samsung.com>, Damien Hedde <damien.hedde@greensocs.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Arun Kumar
 Kashinath Agasar <arun.kka@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <20220601210831.67259-3-its@irrelevant.dk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220601210831.67259-3-its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 98d74fc0-23b1-4dcf-998a-695a9deec4b3
X-Ovh-Tracer-Id: 7426154314636757947
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrledugdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehkrdhjvghnshgvnhesshgrmhhsuhhnghdrtghomhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RxlgX9CwEcb4

On 6/1/22 23:08, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add support for writing and reading the device address register in old
> register mode.
>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/i2c/aspeed_i2c.c         | 5 +++--
>   include/hw/i2c/aspeed_i2c.h | 8 ++++++++
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 576425898b09..5a7eb5579b01 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -104,6 +104,7 @@ static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset,
>       case A_I2CD_AC_TIMING2:
>       case A_I2CD_INTR_CTRL:
>       case A_I2CD_INTR_STS:
> +    case A_I2CD_DEV_ADDR:
>       case A_I2CD_POOL_CTRL:
>       case A_I2CD_BYTE_BUF:
>           /* Value is already set, don't do anything. */
> @@ -741,8 +742,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
>           }
>           break;
>       case A_I2CD_DEV_ADDR:
> -        qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
> -                      __func__);
> +        bus->regs[R_I2CD_DEV_ADDR] = value;
>           break;
>       case A_I2CD_POOL_CTRL:
>           bus->regs[R_I2CD_POOL_CTRL] &= ~0xffffff;
> @@ -1060,6 +1060,7 @@ static void aspeed_i2c_bus_reset(DeviceState *dev)
>   
>       s->regs[R_I2CD_INTR_CTRL] = 0;
>       s->regs[R_I2CD_INTR_STS] = 0;
> +    s->regs[R_I2CD_DEV_ADDR] = 0;
>       s->regs[R_I2CD_CMD] = 0;
>       s->regs[R_I2CD_BYTE_BUF] = 0;
>       s->regs[R_I2CD_DMA_ADDR] = 0;
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index 79c6779c6c1e..03fe829a3a57 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -297,6 +297,14 @@ static inline uint32_t aspeed_i2c_bus_cmd_offset(AspeedI2CBus *bus)
>       return R_I2CD_CMD;
>   }
>   
> +static inline uint32_t aspeed_i2c_bus_dev_addr_offset(AspeedI2CBus *bus)

This routine seems unused.

Thanks,

C.

> +{
> +    if (aspeed_i2c_is_new_mode(bus->controller)) {
> +        return R_I2CS_DEV_ADDR;
> +    }
> +    return R_I2CD_DEV_ADDR;
> +}
> +
>   static inline uint32_t aspeed_i2c_bus_intr_ctrl_offset(AspeedI2CBus *bus)
>   {
>       if (aspeed_i2c_is_new_mode(bus->controller)) {

