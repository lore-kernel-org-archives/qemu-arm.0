Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp303918lfq;
        Wed, 16 Sep 2020 02:36:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX7qX7DCy5UcATz+IgUDLXAsKWneFJEOPJmgHGz1JkOjfT47c2jllCsy7rUj69EFWyqUr7
X-Received: by 2002:a25:244a:: with SMTP id k71mr33361020ybk.504.1600248985900;
        Wed, 16 Sep 2020 02:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600248985; cv=none;
        d=google.com; s=arc-20160816;
        b=NRa/Shw2cVEfc8Gzf7fEvvUg8LOrRQoVAYxGp85poAx9mKl+3DcEbeTdVbbCGNp8HL
         6k4xQz+odNCNwUyhrIiF3ie+fXYValNKQICsaaLj462AwtCisY2JEnzwNBBJGpm18Xht
         OAh9xQzGmFkw3ImXc5zgW1DpSNx4gxIZsGsFdcmDo3Jt4np0H7ir5yNqPDD/VtHH4qM4
         a8GgVO/cWWVeH6YP98kETGLcDr5nvhd5anhk6g3S0G+nEF5QT2CkFGXXI072xPcqo7fo
         0GLAduj1jB2T7xJ17s8BdLNiLmxEfLI9n9wfEiWCvGAh2tWKuUiKSgHgiHVzUN8C60nR
         +3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=6IalBbAsl8mU1sXJI3D3j16n3JDqo+mECVt8QBgv7XI=;
        b=ASC9mEmUQnECUhHcDOdY2oF8rg5ale553sv9cETUq5xGnqr6aSTBYqpKK0CQ39dLXi
         bvRXnZ6vYiiMXxWffRBhwL7/Pej7FYcCqe/R4+8w4UfRfX5mOTXVho4+8N2BMku1lfOQ
         eUZMBYjW1UcVRwFG0mdMFrHOsSxhPGrz3NAbYLLltk4CzChrSc6tCU1x33Q3UXGq9Tx7
         lANjwosloAYokgSeInFE47fgee/sLzVvCbpE4KgRVtuLIz5gKtwHs/73KoDkSYhfiOd8
         jytrT9iMug9sSPH/Gmmsilo537+xwPSHnpr4wA4+9K2qOZqU2ax3taapTqR/4E2jtsCR
         6bzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23si18161373ybc.448.2020.09.16.02.36.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 02:36:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kITrV-0000cd-Au
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 05:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kITrH-0000cJ-Fy; Wed, 16 Sep 2020 05:36:11 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kITrF-0006oz-CY; Wed, 16 Sep 2020 05:36:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.5])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 47C095BA5584;
 Wed, 16 Sep 2020 11:36:05 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 16 Sep
 2020 11:36:04 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002d8faa596-42f9-4ba5-b35b-f4766ec82383,
 282F6B8BB580550643A9CB45D70726BD5CC915E6) smtp.auth=clg@kaod.org
Subject: Re: [PATCH] misc: aspeed_scu: Update AST2600 silicon id register
To: Joel Stanley <joel@jms.id.au>
References: <20200916082012.776628-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6d66e2ac-44d6-955b-7f67-6b2faf69aa43@kaod.org>
Date: Wed, 16 Sep 2020 11:36:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200916082012.776628-1-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5a4ea273-a2f0-4cc5-a380-35045013cd0b
X-Ovh-Tracer-Id: 15889825387306519459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrtddvgddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 05:36:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EtHGI5LsZ5Qj

On 9/16/20 10:20 AM, Joel Stanley wrote:
> Aspeed have released an updated datasheet (v7) containing the silicon id
> for the AST2600 A2. It looks like this:
> 
>               SCU004      SCU014
>   AST2600-A0  0x05000303  0x05000303
>   AST2600-A1  0x05010303  0x05010303
>   AST2600-A2  0x05010303  0x05020303
>   AST2620-A1  0x05010203  0x05010203
>   AST2620-A2  0x05010203  0x05020203
> 
> The SCU004 (silicon id 1) value matches SCU014 for A0, but for
> subsequent revisions it is hard coded to the A1 value.
> 
> Qemu effectively dropped support for the A0 in 7582591ae745 ("aspeed:
> Support AST2600A1 silicon revision") as the A0 reset table was removed,
> so it makes sense to only support the behaviour of A1 and onwards.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/misc/aspeed_scu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index dc6dd87c22f4..40a38ebd8549 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -670,7 +670,12 @@ static void aspeed_ast2600_scu_reset(DeviceState *dev)
>  
>      memcpy(s->regs, asc->resets, asc->nr_regs * 4);
>  
> -    s->regs[AST2600_SILICON_REV] = s->silicon_rev;
> +    /*
> +     * A0 reports A0 in _REV, but subsequent revisions report A1 regardless
> +     * of actual revision. QEMU and Linux only support A1 onwards so this is
> +     * sufficient.
> +     */
> +    s->regs[AST2600_SILICON_REV] = AST2600_A1_SILICON_REV;
>      s->regs[AST2600_SILICON_REV2] = s->silicon_rev;
>      s->regs[AST2600_HW_STRAP1] = s->hw_strap1;
>      s->regs[AST2600_HW_STRAP2] = s->hw_strap2;
> 

