Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3444534lfg;
        Mon, 1 Mar 2021 02:35:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6iBRDJ8kRbkC4B3NC4F2RRlMU+OKAO9VdGN6cySWCE0Boro/Y4Z1L5todhgTXCwEQgpn1
X-Received: by 2002:a5d:854b:: with SMTP id b11mr12904419ios.105.1614594956035;
        Mon, 01 Mar 2021 02:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614594956; cv=none;
        d=google.com; s=arc-20160816;
        b=s+iJ5yXgI92uIJuXaKVOL7FwfbdscooCNa6yzlsyS6kkn0CsnTjc3wlgqdrkYkdwNv
         agAAOwzvpXDoZJOPYsSkVzSeX8pUvgyHez7xet8jtQ8UdQyryaJHN7YFCrLlDRNNmIzs
         ANqNS6wrv6Ek2omhLv8Ht94+86CHvyFdurvtoPKQhmU31o9HKiyvAtHqFjMm4k/sqtSW
         zo4Qst3G3ghkNTFzDXoyNm68gAmBRTJzbjCeZ2HmYHVHn8Am6H9hcotsQCWbEPeNSJ39
         AEhYhiMlxcNz0S/YposVm6SBYYLt5OTDo100OeZBlqGJAvMBVTLSe+YjELMl5Ul8mA/9
         yPXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=sdkcv6r3cLX6gAv5zSOK6cqjWN4DM1XxyMtyTWlHO3E=;
        b=0GwQMedJRwE87P2kSOVeVALxYn3E5NE+M59WyG2f8F2NODfDNNKTvOmF6vBjDfX5RQ
         DzCgRL7nEXIoP2e3cvg2hzawThgSQXsz9zPUxryfwqR8euyqga5wpF6OuGESA5WlWGBh
         otGnjvKzV9OaWUUh6E30R6XzLHLMpqjfAofGCrq9u5vads3JM60406sTmVILN0v9xb0q
         ij6w2yZZvkAF0Cvd+c/Rp1tyDC0sQH7QybX+CA//MSGK3TpTYaFuchjsIyoBvMtm8BUH
         EUP2gfbbV7lpvZ8UM/ANpSSyI8kZ4Ixm66UB9VNv0CZ0XKJjjhotHPs+7+Bc6uEZfnrm
         XTFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si16838992ilq.120.2021.03.01.02.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 02:35:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGfu7-0005Jv-BK
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 05:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGftl-0005Iy-M8; Mon, 01 Mar 2021 05:35:33 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:48093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGftj-000290-N2; Mon, 01 Mar 2021 05:35:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.250])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F01448C015C7;
 Mon,  1 Mar 2021 11:35:15 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 11:35:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003e05e2a1c-c082-4c7c-bb2e-fd73d94c8e1e,
 79E354DF6B7F793720F6EA4F82BCB5A412373A8E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 2/5] hw/arm: ast2600: Set AST2600_MAX_IRQ to value from
 datasheet
To: Andrew Jeffery <andrew@aj.id.au>, <qemu-arm@nongnu.org>
References: <20210301010610.355702-1-andrew@aj.id.au>
 <20210301010610.355702-3-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4ea97dcf-43ec-8cc6-242f-cf474c0290a9@kaod.org>
Date: Mon, 1 Mar 2021 11:35:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210301010610.355702-3-andrew@aj.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c63f2861-c7a2-4b35-adaf-0a565a3d6456
X-Ovh-Tracer-Id: 14079096862087089004
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghnughrvgifsegrjhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 f4bug@amsat.org, qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PwwVIalnorJM

On 3/1/21 2:06 AM, Andrew Jeffery wrote:
> The datasheet says we have 197 IRQs allocated, and we need more than 128
> to describe IRQs from LPC devices. Raise the value now to allow
> modelling of the LPC devices.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index bc0eeb058b24..22fcb5b0edbe 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -65,7 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>  
>  #define ASPEED_A7MPCORE_ADDR 0x40460000
>  
> -#define AST2600_MAX_IRQ 128
> +#define AST2600_MAX_IRQ 197
>  
>  /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
>  static const int aspeed_soc_ast2600_irqmap[] = {
> 

