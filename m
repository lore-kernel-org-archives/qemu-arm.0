Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp266050ocg;
        Fri, 7 Oct 2022 00:29:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7HOX2eDzqmr/QmoiOkHIzS/MjeGbClKydRG2oKfUzFhTLAJtzWpI8z5ZAQhv1VygGZEutu
X-Received: by 2002:ad4:594e:0:b0:4ad:5d6d:137d with SMTP id eo14-20020ad4594e000000b004ad5d6d137dmr3246497qvb.125.1665127773721;
        Fri, 07 Oct 2022 00:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665127773; cv=none;
        d=google.com; s=arc-20160816;
        b=uQxUbs73bxve6PrtYWbP7kbA4CKO3cOd8iG0aKScwGjjc5ch2rmlHF1n4Cv0joAi6w
         eRnDYN41iZmImyJ2RS4U7iaur0Oeqo0P1jxDFy4+j0/OwBCA4WXcngDPVy/4ZHTd6+1v
         Z60bifcxgoJGQ/20cR0exiOny68mPIMCGC6Bkkx59IMz80Hh9wlmAvgA7AIB0WMRRsZ9
         NbvDvpgZEufDI+9KqTIV89Z5BGgHQyVNxjjkCjQ8AZeEuls/DI1H0gG+9+zptFfvXpuw
         UzLLfWs5gUeN0eJTc8ENxUc+53qI4CO4NolcG7+axPSjTE4ugoPZ1xE+361hdHdgcml/
         mUWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=S8fi6aufRZBt98rHEDd6eF1o3WBSyRcP75/9R9tT0fk=;
        b=ovS2bBdWkD7OmNbXxPnsRebBwZTrxlMQmjNawDC6zYT5bSJQ013HLsc8T8WH9jZS/u
         U8pOR5S6xtA8nlC3lYskoC2gZxloNqZnmM8qsGKwLmzP9YIy8WtlgT8T9O7v33QGMll8
         QmRKGntT1M/P+8hkI/sx5lf9aHI4ROXrtXhMqO5U5toDP0BLSjjYjShwOkh6xmAwAML3
         fbqIEeJM8qWuCGRlY2UxHrotF/5VSfIny7RgMZFuLvrMr8by0xzTS29CH5WBGhgYl5WE
         TtkrYGl9phPUsoT+51YTbjcvLWNes3nbem4+SFQdEZfN3Pkcv35z+Ncl6E7TWyX1JAOI
         r+Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132-20020a37088a000000b006e71fbc5c9bsi496358qki.514.2022.10.07.00.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 00:29:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oghnZ-0001rM-Aq
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 03:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oghma-0001ay-F1
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 03:28:32 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oghmW-00008X-Ab
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 03:28:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1133829365;
 Fri,  7 Oct 2022 07:28:11 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 7 Oct
 2022 09:28:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00567911643-ba4a-4811-9547-719dcf65ec5f,
 72EF84A86A0CAB1F8CEB0FBBC9371DA6A893A50B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <fb8c58b9-35d9-55ab-5164-a28530ba38a8@kaod.org>
Date: Fri, 7 Oct 2022 09:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] hw/arm/aspeed: increase Bletchley memory size
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>
References: <20221006225232.3558794-1-patrick@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221006225232.3558794-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 86072032-cf91-4133-86df-ff995d80de21
X-Ovh-Tracer-Id: 15351363756399889257
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -77
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeiiedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddvfedmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.435,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1MI4tWYhLAo1

On 10/7/22 00:52, Patrick Williams wrote:
> For the PVT-class hardware we have increased the memory size of
> this device to 2 GiB.  Adjust the device model accordingly.

You should add some defines similar to  :

     /* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
     #if HOST_LONG_BITS == 32
     #define FUJI_BMC_RAM_SIZE (1 * GiB)
     #else
     #define FUJI_BMC_RAM_SIZE (2 * GiB)
     #endif
     
or are we done with 32bit hosts ?

Thanks,

C.

> 
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>   hw/arm/aspeed.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 7d2162c6ed..ab5725fff1 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1344,7 +1344,7 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
>       amc->num_cs    = 2;
>       amc->macs_mask = ASPEED_MAC2_ON;
>       amc->i2c_init  = bletchley_bmc_i2c_init;
> -    mc->default_ram_size = 512 * MiB;
> +    mc->default_ram_size = 2 * GiB;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
>   }

