Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2732104lfo;
        Tue, 15 Mar 2022 02:26:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeb8fwl4k8/Inh2W9wSN1cxh3baBEdICgNa8QdNE7sVddAlynjqgx5dm2tFbZP2zazOKRE
X-Received: by 2002:ac8:5787:0:b0:2e1:c602:cff2 with SMTP id v7-20020ac85787000000b002e1c602cff2mr14372799qta.133.1647336394961;
        Tue, 15 Mar 2022 02:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647336394; cv=none;
        d=google.com; s=arc-20160816;
        b=zgaeMzBlG2OJMZp+v/XlPIbx/smAcH4uaPX9OVks8jCq5ihZINSi8EmU/UMwPTTxrx
         ujgIi0AXRp0aJqoTqH9Uwl6J2t/AgrYPZUw6IjpC+Msxv27gzJke8LzQJxRlxYmLoWo+
         aY2YHnAR3BubaPA7aKdUXfjVih2+nw4Xhg8Hh2bYdsNVyt59ToLws/NH2kPr3XrMUgfN
         mYG10uoWPn7KlhQpTGgQAY7B6s59U0xubXoxArZP79sMQVy4DOE7i1ld4A5KamP4aX7F
         3niKKAsxvNCTF+Lrb2DeizCmjc+1rejPPsviwNZ3c1SrEPuiLNC4DeVGLyVbDozOwTuH
         016Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=8Xss5jw9pco5VDHQMFKiIM3e8wykraCrgSORtIfqnMI=;
        b=zZ6TAprXjUVrBoFa6ViLig0ysWqLXt24VElRUjB2nG8C+8y0hsxBJCToUYN9dhfJ59
         KxlHJTq9Bt/R+2igArPFy9t12vdFJVIkidji+TfVFzC5ze99BWS3Z+fIAyaSo1xPkWUp
         QfWNHuRxLTGRXI20ncwiteYoNJ+gPfQVonYlGsOOHrFFi+YTtu5xfDEGwhTITnfHxWyW
         PDJlmRACNrtIN+sNvpp+uikRvtYwszzUceupdOfFTtn3j69M0IbZ36OXGv5SYwPPQUuN
         QMFlPz06+uMbeZyzuA/LjLb0BPxqIU9B0OLENtFH9Abxal/+Vxu+VvG3P2D3zUH1EbKe
         ygqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a05620a414c00b0067ddce1966bsi1871355qko.362.2022.03.15.02.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 02:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nU3Ro-0005aC-H3
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 05:26:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU2ok-0003RX-7v
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 04:46:10 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:52303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU2og-0005VR-Ui
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 04:46:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DC209EA19B91;
 Tue, 15 Mar 2022 09:46:02 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 15 Mar
 2022 09:46:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003976f5711-98e0-4acb-b8f3-43dc6153c14e,
 5DBA5639B77BD7FE35D3F16CFE7686729AB21D01) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <39ab9dc0-8581-8c27-698c-51ec2c65d104@kaod.org>
Date: Tue, 15 Mar 2022 09:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 2/2] hw: aspeed_scu: Introduce clkin_25Mhz attribute
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220315075753.8591-1-steven_lee@aspeedtech.com>
 <20220315075753.8591-3-steven_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220315075753.8591-3-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b168ada6-2129-4559-9348-38f960535b95
X-Ovh-Tracer-Id: 5929551860001573740
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvledguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: troy_lee@aspeedtech.com, jamin_lin@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9QB8s2grAlIk

On 3/15/22 08:57, Steven Lee wrote:
> AST2600 clkin is always 25MHz, introduce clkin_25Mhz attribute
> for aspeed_scu_get_clkin() to return the correct clkin for ast2600.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/misc/aspeed_scu.c         | 6 +++++-
>   include/hw/misc/aspeed_scu.h | 1 +
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index d65f86df3d..150567f98a 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -371,7 +371,8 @@ static const MemoryRegionOps aspeed_ast2500_scu_ops = {
>   
>   static uint32_t aspeed_scu_get_clkin(AspeedSCUState *s)
>   {
> -    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN) {
> +    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN ||
> +        ASPEED_SCU_GET_CLASS(s)->clkin_25Mhz) {
>           return 25000000;
>       } else if (s->hw_strap1 & SCU_HW_STRAP_CLK_48M_IN) {
>           return 48000000;
> @@ -562,6 +563,7 @@ static void aspeed_2400_scu_class_init(ObjectClass *klass, void *data)
>       asc->get_apb = aspeed_2400_scu_get_apb_freq;
>       asc->apb_divider = 2;
>       asc->nr_regs = ASPEED_SCU_NR_REGS;
> +    asc->clkin_25Mhz = false;
>       asc->ops = &aspeed_ast2400_scu_ops;
>   }
>   
> @@ -583,6 +585,7 @@ static void aspeed_2500_scu_class_init(ObjectClass *klass, void *data)
>       asc->get_apb = aspeed_2400_scu_get_apb_freq;
>       asc->apb_divider = 4;
>       asc->nr_regs = ASPEED_SCU_NR_REGS;
> +    asc->clkin_25Mhz = false;
>       asc->ops = &aspeed_ast2500_scu_ops;
>   }
>   
> @@ -756,6 +759,7 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
>       asc->get_apb = aspeed_2600_scu_get_apb_freq;
>       asc->apb_divider = 4;
>       asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
> +    asc->clkin_25Mhz = true;
>       asc->ops = &aspeed_ast2600_scu_ops;
>   }
>   
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> index 6bf67589e8..fdc721846c 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -59,6 +59,7 @@ struct AspeedSCUClass {
>       uint32_t (*get_apb)(AspeedSCUState *s);
>       uint32_t apb_divider;
>       uint32_t nr_regs;
> +    bool clkin_25Mhz;
>       const MemoryRegionOps *ops;
>   };
>   

