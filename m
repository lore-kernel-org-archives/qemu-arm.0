Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp382804ejc;
        Wed, 18 Jan 2023 02:29:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvw5UIsrS157jC5+foBq+uysnUk4H0iQnLtMTiCLQntIWQd1QlwSMqG+4nYUWiKco1V6Wu5
X-Received: by 2002:ac8:48d9:0:b0:3b6:2f49:1acc with SMTP id l25-20020ac848d9000000b003b62f491accmr7855556qtr.16.1674037787031;
        Wed, 18 Jan 2023 02:29:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674037787; cv=none;
        d=google.com; s=arc-20160816;
        b=gZmKtww9Hq++d7+ZlWbc5tDhSyYWHnlUFGD/e3xcZKiidz+891ulqN51tQ/WumlATz
         c5xKpWcEIwDrPJlvf6R87VXc05/KxOP6iNF4ULzwyQWUlP5kmZ20q7ST3IvYUpBMPjFS
         193b3ZrmRkanNzeVmgUtao/lI3J7RMa841aLh6GecenpLYtUPthNKBwLzMwdWFVtEWnT
         brYs8Tqhue5r0Z7z3cbDMXSuBIuhkTI4i0PWPPASnVBc8ll5R0Xa5V5heg7LHEgSFy31
         gZsnputAZoRDz3ZlWHIwqAfpIHPZ3WWmKZv0TNHBtyYyyHfGFdCYBziWP0V5U2eFwkv8
         eoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=qbhKHRH09rQaq+IM3IEmKaS7XtdZaDqZEVTjVCH8EAo=;
        b=P2JScAU/jvFczNVhfzxEqLqJ58z1CZCZUc1frHWmf+k6Za+QH0k5ITrCw8py7pMewQ
         wlGecKgLiUWCAZDmgNdaWBdBhUG8gpT485olinebtFUqn4nQwdfw4h6gVxpPVdDjpRK6
         peVZAEI20pqGHSr6NUj7vUc3v9CBziRyzzqmrcTQoQOsTRCmxOfhbqhNbQhWA3ScH6JZ
         LTM7TeS7RHhUroo/wyANGxsyTJPqavPEE1lGO+lW+j5dU0gScAncjcdZZfyWPTy13ArP
         EBVfLohgM6i6YxJspp3A3nbUSWuTyX+dherB33Lq2k0SJjO6h0FFmq7c1/deIM5bKyIF
         85ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z184-20020a3797c1000000b007023e5ce511si19504519qkd.679.2023.01.18.02.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 02:29:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI5hC-0008DP-UZ; Wed, 18 Jan 2023 05:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pI5hB-0008DD-BT; Wed, 18 Jan 2023 05:29:29 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pI5h8-0002FH-NY; Wed, 18 Jan 2023 05:29:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.90])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 330C120E1C;
 Wed, 18 Jan 2023 10:29:19 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 18 Jan
 2023 11:29:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00153186219-7ab6-4826-a077-83ae56fc3367,
 B02C0E203F6A6AD140F658F33EDEBE178EEACDD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7db6e0dc-92bd-c7a4-0097-582bf5a0c6db@kaod.org>
Date: Wed, 18 Jan 2023 11:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 5/5] hw/nvram/eeprom_at24c: Make reset behavior more
 like hardware
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <hskinnemoen@google.com>, <kfting@nuvoton.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <philmd@linaro.org>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-6-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230118024214.14413-6-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 22bf9156-0f6d-4521-a65d-60ff5401b3f0
X-Ovh-Tracer-Id: 14555352521613085487
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtkedgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrsehpjhgurdguvghvpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhhshhkihhnnhgvmhhovghnsehgohhoghhlvgdrtghomhdpkhhfthhinhhgsehnuhhvohhtohhnrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmoh
 ehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Tvmx310kje8E

On 1/18/23 03:42, Peter Delevoryas wrote:
> EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
> I would expect the I2C state machine to be reset to default values, but I
> wouldn't really expect the memory to change at all.
> 
> The current implementation of the at24c EEPROM resets its internal memory on
> reset. This matches the specification in docs/devel/reset.rst:
> 
>    Cold reset is supported by every resettable object. In QEMU, it means we reset
>    to the initial state corresponding to the start of QEMU; this might differ
>    from what is a real hardware cold reset. It differs from other resets (like
>    warm or bus resets) which may keep certain parts untouched.
> 
> But differs from my intuition. For example, if someone writes some information
> to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
> retain that information. It's very useful to be able to test things like this
> in QEMU as well, to verify software instrumentation like determining the cause
> of a reboot.
> 
> Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index f8d751fa278d..5074776bff04 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -185,18 +185,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>       }
>   
>       ee->mem = g_malloc0(ee->rsize);
> -
> -}
> -
> -static
> -void at24c_eeprom_reset(DeviceState *state)
> -{
> -    EEPROMState *ee = AT24C_EE(state);
> -
> -    ee->changed = false;
> -    ee->cur = 0;
> -    ee->haveaddr = 0;
> -
>       memset(ee->mem, 0, ee->rsize);
>   
>       if (ee->init_rom) {
> @@ -214,6 +202,16 @@ void at24c_eeprom_reset(DeviceState *state)
>       }
>   }
>   
> +static
> +void at24c_eeprom_reset(DeviceState *state)
> +{
> +    EEPROMState *ee = AT24C_EE(state);
> +
> +    ee->changed = false;
> +    ee->cur = 0;
> +    ee->haveaddr = 0;
> +}
> +
>   static Property at24c_eeprom_props[] = {
>       DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
>       DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),

