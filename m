Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2689408lfk;
        Tue, 19 Apr 2022 14:37:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiOQ7s2SZtm6r7+uBhoGs5XbZSC577DAw7ljYcUR/r19FYlmTpmO9/74YbNZTicUX63yNH
X-Received: by 2002:a25:bdd4:0:b0:63d:e354:c550 with SMTP id g20-20020a25bdd4000000b0063de354c550mr17360723ybk.63.1650404232043;
        Tue, 19 Apr 2022 14:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650404232; cv=none;
        d=google.com; s=arc-20160816;
        b=R+1mN9mTmwHXiuOEinWQyqsSpQnBaBMIPuwsWHFUTPkywexeRW7oFomLS+EnQC8Ygh
         C5Kw97D199+SbISoefGmjI/CfTlvc/Cx5EUVUsqaXdeS31ZFQwMXLW9GsWHMhb+1I/zl
         qmZIW683efeHdqBTxnZ/+SOj3I/EVTp80mx6O0fkgOh8Ia7zdthNsLov23r/LgEFkG6w
         Q+QZvf2DfMDSSCIte1fg9WWBpPc05MZLuItCrBdt8WIQaeQ3xY6dpsn75ChW1CSt49zk
         zBup6wlBk8D6WKqq0W9Ci5wwhJyKs0GSfiy9rpqabUmsKh+hNzPCaDjkOCC0Tcga9dMo
         C8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=azbCh481xc1EKfjNxJ92imofTk7ATY/y7NY+LsJbtco=;
        b=JdNl8g86g6JnQGLA7cqFtDhJ62gg+lDuRbt1uGVwfd+v9gv2ZqdTV4NQogQ+x18NOs
         AnS5/sEuAJlLuB89VXxl1WHzleOpKsxhllw2hrSjhH78uq1WLJLk44KP8WQAQ0fZOp+D
         ppp5B9lmgsH1xV6pSQYYIshcO/5GCDchaKSOVqEojeXUL3Gf6XY8fM4bRQXGPVpEEuJC
         AKEeY/syTb3XetsylTv7wPDcXtHig4cYU06/U3N7A+uazl6LC/v+hGMQ13us0nt8wVFd
         nSFaeMJHH2HsrLQ5YN2VO+ZpJcngER00tC+yd5yCAsF0AJIbIXYejFQiQIkXjp9Xs958
         MMTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v128-20020a816186000000b002ef541aff5bsi35706ywb.264.2022.04.19.14.37.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Apr 2022 14:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ngvX5-0004HJ-FN
	for alex.bennee@linaro.org; Tue, 19 Apr 2022 17:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ngvVs-0003KE-O9
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 17:35:56 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:45021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ngvVq-0002CN-Em
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 17:35:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.250])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9909C22A08;
 Tue, 19 Apr 2022 21:35:42 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 19 Apr
 2022 23:35:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0012a6ae089-295f-4644-b203-cc2ecf52b2c9,
 8178BE1DD4A2FCC93E6442F7737FB2433BB7237A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9121ad88-c040-1ffc-48fc-fc063bc7b66c@kaod.org>
Date: Tue, 19 Apr 2022 23:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/3] aspeed/hace: Support HMAC Key Buffer register.
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20220331074844.30065-1-steven_lee@aspeedtech.com>
 <20220331074844.30065-2-steven_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220331074844.30065-2-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0ed1ab0f-515c-4373-8992-2651716fcd8e
X-Ovh-Tracer-Id: 3111424395817356277
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: troy_lee@aspeedtech.com, jamin_lin@aspeedtech.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 63VHYrwr6TDJ

On 3/31/22 09:48, Steven Lee wrote:
> Support HACE28: Hash HMAC Key Buffer Base Address Register.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
> ---
>   hw/misc/aspeed_hace.c         | 7 +++++++
>   include/hw/misc/aspeed_hace.h | 1 +
>   2 files changed, 8 insertions(+)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 10f00e65f4..59fe5bfca2 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -27,6 +27,7 @@
>   
>   #define R_HASH_SRC      (0x20 / 4)
>   #define R_HASH_DEST     (0x24 / 4)
> +#define R_HASH_KEY_BUFF (0x28 / 4)
>   #define R_HASH_SRC_LEN  (0x2c / 4)
>   
>   #define R_HASH_CMD      (0x30 / 4)
> @@ -210,6 +211,9 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>       case R_HASH_DEST:
>           data &= ahc->dest_mask;
>           break;
> +    case R_HASH_KEY_BUFF:
> +        data &= ahc->key_mask;
> +        break;
>       case R_HASH_SRC_LEN:
>           data &= 0x0FFFFFFF;
>           break;
> @@ -333,6 +337,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
>   
>       ahc->src_mask = 0x0FFFFFFF;
>       ahc->dest_mask = 0x0FFFFFF8;
> +    ahc->key_mask = 0x0FFFFFC0;
>       ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>   }
>   
> @@ -351,6 +356,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
>   
>       ahc->src_mask = 0x3fffffff;
>       ahc->dest_mask = 0x3ffffff8;
> +    ahc->key_mask = 0x3FFFFFC0;
>       ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>   }
>   
> @@ -369,6 +375,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
>   
>       ahc->src_mask = 0x7FFFFFFF;
>       ahc->dest_mask = 0x7FFFFFF8;
> +    ahc->key_mask = 0x7FFFFFF8;
>       ahc->hash_mask = 0x00147FFF;
>   }
>   
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> index 94d5ada95f..2242945eb4 100644
> --- a/include/hw/misc/aspeed_hace.h
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -37,6 +37,7 @@ struct AspeedHACEClass {
>   
>       uint32_t src_mask;
>       uint32_t dest_mask;
> +    uint32_t key_mask;
>       uint32_t hash_mask;
>   };
>   

