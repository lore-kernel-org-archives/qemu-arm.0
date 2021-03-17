Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp675640lfg;
        Wed, 17 Mar 2021 11:48:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO4bRxW3A16LBR8yc32nJQAQnN39n6i1D8HJbwLvE358PbM2tKvfx1Y1W8yKp6SNABxauR
X-Received: by 2002:a5b:9d2:: with SMTP id y18mr5955092ybq.173.1616006882366;
        Wed, 17 Mar 2021 11:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616006882; cv=none;
        d=google.com; s=arc-20160816;
        b=qc/6caMq0wgjzlFzTVHHBP+Qg9vPHZUhmhC56trjxK6RnKpfP7AAUMxA9LUY66uqAL
         oNxgUwAPQcLd893rSnFcjGs5WdkNDbsigpREQMbBMKksuhpNt91YfFa7OlMWEZUDq9Vj
         GDlXEcoFOYWjWZRlBJW6K5Qax3L9VDgdKRK5WyFyWL3b8ggrZc86cQhgQ5qrK5WyjrL6
         BWP2e2jd2p6uyO+aqYQVUGob+a9fcxq8XN/FYMzGc/7dAgaWUxrJKCUqYnyjpnywk2Hq
         f1QbHRJLKIrKAw1rqcFE8Ti5LoHY2QdAwDQY/vy9PK1eBiCGS5I9NwS9VJuNnvsvgcZc
         6oMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=SDQ5nrmHPiMjoPa0bw/eOLPJ4zKgPymDEp1YRIwjJHI=;
        b=IPgTj8+2achpR3+GAehgqnLXYW1ft40RQLSSgbGo/ffq8fCOENpUqWlu7M4o9GN0iL
         C1oQh7pOye2fRww5g2sRDQ9rBd6oFZLpstg4Kpz10gah3VvwaEKsf4ghqRIYUwZHsm/C
         bAWm7wPgt21vEHpA2N+eh+syYhS5wihlB9Jg7Jl70C+fwlOJdx8p8354Wjdh2L0s1SPC
         /a3kq7pGhJ6qLV5SZ3/GqOMzLVXGo4gd/ozjt5/+MAbQXz3JDSWqsS2P4IxTpgUpZdpc
         0BsadG7G7p7KN3sNoMf51ZpJ4lhUpDXdWjO2RjqYx8Qvydw6+kNtkFrRztbohMQaPKgu
         sDkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si21325833ybk.317.2021.03.17.11.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 11:48:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMbD7-0003Zc-IZ
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 14:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lMawj-0004Fy-9N; Wed, 17 Mar 2021 14:31:06 -0400
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:46672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lMawY-0007oN-0Q; Wed, 17 Mar 2021 14:31:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 87CA427467D;
 Wed, 17 Mar 2021 19:30:48 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 19:30:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003b08b4680-14d8-4d46-a9e1-cc5150ffa689,
 10040688A1AB5364447EAD88D88247B833C1D39B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Do not sysbus-map mmio flash region
 directly, use alias
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-3-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <871fce3d-8b3c-bcce-6170-9010b1ed7d5c@kaod.org>
Date: Wed, 17 Mar 2021 19:30:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210312182851.1922972-3-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ad04cc7a-db81-4044-a38c-59d6b0348b08
X-Ovh-Tracer-Id: 5393060554337848251
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V4+rkCakmXLg

On 3/12/21 7:28 PM, Philippe Mathieu-Daudé wrote:
> The flash mmio region is exposed as an AddressSpace.
> AddressSpaces must not be sysbus-mapped, therefore map
> the region using an alias.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

That does the trick but you need an extra change in the model. 

The fixes are in my aspeed-6.0 branch on GH and they survive the last
patch of your series :

  [PATCH 5/5] memory: Make sure root MR won't be added as subregion

I will upstream for 6.1.

Thanks,

C. 

> ---
>  include/hw/ssi/aspeed_smc.h | 1 +
>  hw/ssi/aspeed_smc.c         | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 16c03fe64f3..e3c96cecbd8 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -84,6 +84,7 @@ struct AspeedSMCState {
>  
>      MemoryRegion mmio;
>      MemoryRegion mmio_flash;
> +    MemoryRegion mmio_flash_alias;
>  
>      qemu_irq irq;
>      int irqline;
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 16addee4dc8..aa26578bdac 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -1386,7 +1386,9 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>      memory_region_init_io(&s->mmio_flash, OBJECT(s),
>                            &aspeed_smc_flash_default_ops, s, name,
>                            s->ctrl->flash_window_size);
> -    sysbus_init_mmio(sbd, &s->mmio_flash);
> +    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s), name,
> +                             &s->mmio_flash, 0, s->ctrl->flash_window_size);
> +    sysbus_init_mmio(sbd, &s->mmio_flash_alias);
>  
>      s->flashes = g_new0(AspeedSMCFlash, s->ctrl->max_peripherals);
>  
> 

