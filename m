Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp261051lfb;
        Thu, 12 Nov 2020 01:09:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR6IHI9+L2PKtCScXYaEf+xk0wMbxvUkLoSzUD+DEx8TTEMcIhuiONrjhJ4xW4jxEDIQHZ
X-Received: by 2002:a25:aea0:: with SMTP id b32mr8789821ybj.282.1605172160052;
        Thu, 12 Nov 2020 01:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605172160; cv=none;
        d=google.com; s=arc-20160816;
        b=ckdAN+50EKoUAfRWdvNs1fN3AytIp3oTi4Sq9QfehMT5HEa15TzeyyZUKftGx6HgcC
         68be8RlibfR7iZ3Ap/QBF30JwcReXDL7CM1iKIsrt1zqo1RYZauNBjAaQmGVunMcDket
         XK4gOhpM5XDSqxytC6/+cG5mToafvPy0BenA3eJRv+2wIFGCyN93mGDv0sKoFBobi3rf
         5pAiX54KN1tMaCKYkcUDVV72Z2U31Zn0+k5XmLamnvEguFpY6d2C3sujWjszBbo15rzM
         6IF28+dPFTbD0wTTJ5DDS+twi0UupMfG8P22+T0BPaYXbVKf4z47sIxE+32zyknP0QQV
         SVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=sRKKXkKDt15wH4KI+U2Et+EQ3dd6GR4VMsqu4927bEI=;
        b=krySH3RySa/cLs8iu9QIOwhXdPMORNkI5b72W2HW+PNhuBgRtJN767moR2XjI6DxCn
         fYwjTnilrP175RmQcm4oC2LjQhszOeuOuhosZ6Pyev/b8Yl9C+XXI1xWWUaDZqgWj4JM
         hxLQfZstTaKlKAs0bWIMzUug3SirGSmY7SK7ggyQ4X5sgHgHFrz/PPMXeDG3V/WcO+eH
         AUIxeZFkNezxbN65fUhCQQrSG6zxqalKXTdZXqEewLqG/RxhTjmxibm2ytPqSIfmnGUS
         XkUD9HMSqhxuf0k6vBIWnKwpqIa55T+ZrPsCUUf9z9eZxdBZBBU88qNwrH3TArMRzRHr
         E/5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y184si5064041ybc.198.2020.11.12.01.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Nov 2020 01:09:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kd8bX-0005Y3-FU
	for alex.bennee@linaro.org; Thu, 12 Nov 2020 04:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kd8aF-0004lN-94
 for qemu-arm@nongnu.org; Thu, 12 Nov 2020 04:07:59 -0500
Received: from 1.mo51.mail-out.ovh.net ([178.32.121.110]:57294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kd8aD-0001yL-Ct
 for qemu-arm@nongnu.org; Thu, 12 Nov 2020 04:07:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 9862C2337EF;
 Thu, 12 Nov 2020 10:07:46 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 12 Nov
 2020 10:07:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0029d081ea3-fba7-4f4f-bfa5-463d8a805b36,
 52E2ECA475D190B70181DB61C9ABB7F7A86F4E17) smtp.auth=clg@kaod.org
Subject: Re: [PATCH] ast2600: SRAM is 89KB
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20201112012113.835858-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e2dc28b3-592d-e17b-bdd7-e577e6d90880@kaod.org>
Date: Thu, 12 Nov 2020 10:07:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201112012113.835858-1-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 636661d6-1422-49cb-a54c-fb256dbec80b
X-Ovh-Tracer-Id: 18114040651568483235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedruddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo51.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 04:07:48
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pwqs8ff+B2jg

On 11/12/20 2:21 AM, Joel Stanley wrote:
> On the AST2600A1, the SRAM size was increased to 89KB.
> 
> Fixes: 7582591ae745 ("aspeed: Support AST2600A1 silicon revision")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 1450bde7cf26..12e4a16d3765 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -481,7 +481,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>      sc->name         = "ast2600-a1";
>      sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
>      sc->silicon_rev  = AST2600_A1_SILICON_REV;
> -    sc->sram_size    = 0x10000;
> +    sc->sram_size    = 0x16400;
>      sc->spis_num     = 2;
>      sc->ehcis_num    = 2;
>      sc->wdts_num     = 4;
> 

