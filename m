Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3973556lfc;
        Mon, 19 Jul 2021 09:03:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDY6lCqQLpd5LBBXVf/CM7La7kdAXn9oPkuSsmd7ZpBfw8lX5FULMqjgFx001iWrIDtipS
X-Received: by 2002:a25:ab41:: with SMTP id u59mr32638785ybi.218.1626710629460;
        Mon, 19 Jul 2021 09:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626710629; cv=none;
        d=google.com; s=arc-20160816;
        b=WWzW8Lz+M5ydHZAvQcrGTwCnhaMOevM7AJm02aVi3aDXalac8n+zYSfh9NcHSIYpuX
         fsBnnuX+ZDDbTR4BMN97lUBNE2oVnvSv6isldSXXaqtt58XBR4K9/bnznrgolrAT3aEM
         rlnPREvYBOtb6oXE8Pl5uO+KXmdyCOm0d0uoTBi9wNnZtwQOtioHmpNLG3Y/MAHUZHqF
         Cjcb9wNhD4rXElmXIM6ZcXI7ITeSjQRTokKM4SYaYc5xUvePgrSQ2gMCbukCU0MpRwRP
         Sy9CVADsdw67vTKfKbcMa9ZbMLeFrO24uZelZQjRLTpaJhBfih5KcD0MptNxwL0ufRh2
         TT4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Q44dXBTYlPph7io2z7ziWUEdCSDwlws2grm+1iWiyxs=;
        b=nEwT+GSohzeVt05K7kKINHZCu2Fbr8/DBnlwD30Q9arzsMpnmSCo16BTa6wfgJIFUQ
         qXW0GH7MyPcg/TckpXtcNwzCRGHQwvCRaSBXe5eRIKSLt7IAK+zrJ4IZMP8Uk0PSlwY3
         KCcf7m2gQCzkDZD2QRTFOmbkBUZ/8+EqTI+sLNv6Bc3dBlUyFMoy6O+IZUvvL2jc7DgP
         UfqgaL5MviWoCAUFoI8WXvS72Q8j+HlvMbKZfOBP0MOOrspYhoy13gaR/HqYhF/pwxVy
         +NSeHC19CMA3pc3WECuqMQZszJKTQsxP9/mRouZoc2TgKvjNDj7j0pLrhZZtBAAvIucZ
         /XLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r69si22664405ybc.348.2021.07.19.09.03.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jul 2021 09:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5VkC-0005mi-Q7
	for alex.bennee@linaro.org; Mon, 19 Jul 2021 12:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m5Vio-0004KZ-Qm; Mon, 19 Jul 2021 12:02:22 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:54447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m5Vil-0005id-1Z; Mon, 19 Jul 2021 12:02:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 26BDBB4DC49C;
 Mon, 19 Jul 2021 18:02:16 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 19 Jul
 2021 18:02:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002f879a1a2-cff8-4774-98e3-5633d380b57a,
 5C81DEF932CE68F5B4ADF8C6EB3FE0DC56E33E11) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [SPAM] [PATCH v2 2/3] hw: aspeed_gpio: Simplify 1.8V defines
To: Joel Stanley <joel@jms.id.au>
References: <20210713065854.134634-1-joel@jms.id.au>
 <20210713065854.134634-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <08d97715-7778-cf30-b9e1-debcad19f9e1@kaod.org>
Date: Mon, 19 Jul 2021 18:02:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713065854.134634-3-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8223f100-23fe-4335-8465-db37e34f779d
X-Ovh-Tracer-Id: 11675582037806779299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dGy4O6MkTkFZ

On 7/13/21 8:58 AM, Joel Stanley wrote:
> There's no need to define the registers relative to the 0x800 offset
> where the controller is mapped, as the device is instantiated as it's
> own model at the correct memory address.
> 
> Simplify the defines and remove the offset to save future confusion.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/gpio/aspeed_gpio.c | 73 +++++++++++++++++++++----------------------
>  1 file changed, 36 insertions(+), 37 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index b3dec4448009..dc721aec5da7 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -169,44 +169,43 @@
>  
>  /* AST2600 only - 1.8V gpios */
>  /*
> - * The AST2600 has same 3.6V gpios as the AST2400 (memory offsets 0x0-0x198)
> - * and additional 1.8V gpios (memory offsets 0x800-0x9D4).
> + * The AST2600 two copies of the GPIO controller: the same 3.6V gpios as the
> + * AST2400 (memory offsets 0x0-0x198) and a second controller with 1.8V gpios
> + * (memory offsets 0x800-0x9D4).
>   */
> -#define GPIO_1_8V_REG_OFFSET          0x800
> -#define GPIO_1_8V_ABCD_DATA_VALUE     ((0x800 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_DIRECTION      ((0x804 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INT_ENABLE     ((0x808 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INT_SENS_0     ((0x80C - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INT_SENS_1     ((0x810 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INT_SENS_2     ((0x814 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INT_STATUS     ((0x818 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_RESET_TOLERANT ((0x81C - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_DATA_VALUE        ((0x820 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_DIRECTION         ((0x824 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INT_ENABLE        ((0x828 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INT_SENS_0        ((0x82C - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INT_SENS_1        ((0x830 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INT_SENS_2        ((0x834 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INT_STATUS        ((0x838 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_RESET_TOLERANT    ((0x83C - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_DEBOUNCE_1     ((0x840 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_DEBOUNCE_2     ((0x844 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_DEBOUNCE_1        ((0x848 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_DEBOUNCE_2        ((0x84C - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_DEBOUNCE_TIME_1     ((0x850 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_DEBOUNCE_TIME_2     ((0x854 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_DEBOUNCE_TIME_3     ((0x858 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_COMMAND_SRC_0  ((0x860 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_COMMAND_SRC_1  ((0x864 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_COMMAND_SRC_0     ((0x868 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_COMMAND_SRC_1     ((0x86C - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_DATA_READ      ((0x8C0 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_DATA_READ         ((0x8C4 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INPUT_MASK     ((0x9D0 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INPUT_MASK        ((0x9D4 - GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_MEM_SIZE            0x9D8
> -#define GPIO_1_8V_REG_ARRAY_SIZE      ((GPIO_1_8V_MEM_SIZE - \
> -                                      GPIO_1_8V_REG_OFFSET) >> 2)
> +#define GPIO_1_8V_ABCD_DATA_VALUE     (0x000 >> 2)
> +#define GPIO_1_8V_ABCD_DIRECTION      (0x004 >> 2)
> +#define GPIO_1_8V_ABCD_INT_ENABLE     (0x008 >> 2)
> +#define GPIO_1_8V_ABCD_INT_SENS_0     (0x00C >> 2)
> +#define GPIO_1_8V_ABCD_INT_SENS_1     (0x010 >> 2)
> +#define GPIO_1_8V_ABCD_INT_SENS_2     (0x014 >> 2)
> +#define GPIO_1_8V_ABCD_INT_STATUS     (0x018 >> 2)
> +#define GPIO_1_8V_ABCD_RESET_TOLERANT (0x01C >> 2)
> +#define GPIO_1_8V_E_DATA_VALUE        (0x020 >> 2)
> +#define GPIO_1_8V_E_DIRECTION         (0x024 >> 2)
> +#define GPIO_1_8V_E_INT_ENABLE        (0x028 >> 2)
> +#define GPIO_1_8V_E_INT_SENS_0        (0x02C >> 2)
> +#define GPIO_1_8V_E_INT_SENS_1        (0x030 >> 2)
> +#define GPIO_1_8V_E_INT_SENS_2        (0x034 >> 2)
> +#define GPIO_1_8V_E_INT_STATUS        (0x038 >> 2)
> +#define GPIO_1_8V_E_RESET_TOLERANT    (0x03C >> 2)
> +#define GPIO_1_8V_ABCD_DEBOUNCE_1     (0x040 >> 2)
> +#define GPIO_1_8V_ABCD_DEBOUNCE_2     (0x044 >> 2)
> +#define GPIO_1_8V_E_DEBOUNCE_1        (0x048 >> 2)
> +#define GPIO_1_8V_E_DEBOUNCE_2        (0x04C >> 2)
> +#define GPIO_1_8V_DEBOUNCE_TIME_1     (0x050 >> 2)
> +#define GPIO_1_8V_DEBOUNCE_TIME_2     (0x054 >> 2)
> +#define GPIO_1_8V_DEBOUNCE_TIME_3     (0x058 >> 2)
> +#define GPIO_1_8V_ABCD_COMMAND_SRC_0  (0x060 >> 2)
> +#define GPIO_1_8V_ABCD_COMMAND_SRC_1  (0x064 >> 2)
> +#define GPIO_1_8V_E_COMMAND_SRC_0     (0x068 >> 2)
> +#define GPIO_1_8V_E_COMMAND_SRC_1     (0x06C >> 2)
> +#define GPIO_1_8V_ABCD_DATA_READ      (0x0C0 >> 2)
> +#define GPIO_1_8V_E_DATA_READ         (0x0C4 >> 2)
> +#define GPIO_1_8V_ABCD_INPUT_MASK     (0x1D0 >> 2)
> +#define GPIO_1_8V_E_INPUT_MASK        (0x1D4 >> 2)
> +#define GPIO_1_8V_MEM_SIZE            0x1D8
> +#define GPIO_1_8V_REG_ARRAY_SIZE      (GPIO_1_8V_MEM_SIZE >> 2)
>  
>  static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high, int gpio)
>  {
> 

