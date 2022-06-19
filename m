Received: by 2002:ac2:46e6:0:0:0:0:0 with SMTP id q6csp393764lfo;
        Sun, 19 Jun 2022 05:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u+dfMqAqo5pXGm4TVmtkh1in6bSJm/zpMNHzra8GNnlxdeHZabKO+GGRQHzBGm2nccIW+R
X-Received: by 2002:ac8:7e87:0:b0:306:6575:6035 with SMTP id w7-20020ac87e87000000b0030665756035mr15883337qtj.629.1655643337199;
        Sun, 19 Jun 2022 05:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655643337; cv=none;
        d=google.com; s=arc-20160816;
        b=Dwi/HeZlMXeHqb1vVQidaCnksavDMhR8u4xku6+kP1+RXXrhyt38kbGughM9810QjU
         fVXWWoi7w9a3X8fOJfe3iLEAEndlGBuf59W0iH8i7AUldrVbE1NqbvneYoAbLMu8WU/J
         V8UWvbjvm7dkXJ491tIMQqayfS6ZKLUtzQ9fPSAv3uG7ezFGsaYcVKK0e1LviJ2tRjGh
         mLhJtyC25KJlbZxSLCsQMDWewLg/stWHNnhqnbtNGMEJF2yB+etCIAVqIB6GZGeOgxdV
         Jo5+y2kdvC5785HBKbkSSBeG0IBwqhWF+9Kfc7yTisovfEDt7geWorIhVySQrSJsjDuG
         c3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=t3cDLCULUZSlaoLAELxoikw5g3eJA3Xlmpn4PVz23Qw=;
        b=BKRIhQObGsk7FmCJcdg1UUhO8iFTga3DHquB9E7PVWg1yafQ6BPDSCgFzoy7l8ne+1
         6VQs9tjET5il67D386Vuql8xtTCF8ZlSO1hZhcKM6OkubX9d2QsSEcSFzkvuO6yNf3QS
         XOkGVSf3sxvcTgmNIcxbN42nc6lI0IGuTz5fgCkPEegMhXcq0qbLFwx+gXDiF07Ht2+H
         gBQ8M8vvDSpNE3aa5RKd7t1wZNmxOUpiW8Iy8CfOYwnuxX8M6baTyIgfoAZ/XL97fWcd
         eRd+PPGzzHXOgLnZthC3njtCnhKZL3P7VJ3mTZX05Z6Mm2mg6VZ0GmOrjj6GG4GgE4eG
         OkCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020a05622a015500b0030511f696e1si6323876qtw.179.2022.06.19.05.55.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Jun 2022 05:55:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o2uSm-0003ku-Mf
	for alex.bennee@linaro.org; Sun, 19 Jun 2022 08:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2uSY-0003hD-9z
 for qemu-arm@nongnu.org; Sun, 19 Jun 2022 08:55:22 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:40949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2uSW-00009s-E4
 for qemu-arm@nongnu.org; Sun, 19 Jun 2022 08:55:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2AE4921F3B;
 Sun, 19 Jun 2022 12:55:17 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sun, 19 Jun
 2022 14:54:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00468795994-786a-4724-8a21-67fd54e8fb38,
 F3BB28978D5D33C371BBBD2B34D0F30B2C684C62) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <82ad0e87-01ce-4ce0-81b3-5d3ac5425245@kaod.org>
Date: Sun, 19 Jun 2022 14:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] aspeed/hace: Add missing newlines to unimp messages
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220618090114.3158904-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220618090114.3158904-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 470eaaa9-f44a-459a-82b7-eb2d388c78c9
X-Ovh-Tracer-Id: 2060115355252394976
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvledgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nymj4jPr2pnQ

On 6/18/22 11:01, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/misc/aspeed_hace.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 4b5997e18fad..731234b78c4c 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -340,12 +340,12 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>   
>           if ((data & HASH_HMAC_MASK)) {
>               qemu_log_mask(LOG_UNIMP,
> -                          "%s: HMAC engine command mode %"PRIx64" not implemented",
> +                          "%s: HMAC engine command mode %"PRIx64" not implemented\n",
>                             __func__, (data & HASH_HMAC_MASK) >> 8);
>           }
>           if (data & BIT(1)) {
>               qemu_log_mask(LOG_UNIMP,
> -                          "%s: Cascaded mode not implemented",
> +                          "%s: Cascaded mode not implemented\n",
>                             __func__);
>           }
>           algo = hash_algo_lookup(data);

