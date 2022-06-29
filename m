Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp265115lft;
        Wed, 29 Jun 2022 01:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umGgb3xoK1NeggrOaM8tTcxxuBfMQ92k9DQ0QmMB/NxC1By64XzZbVR7HrsjKMMulzvDNC
X-Received: by 2002:a05:620a:4454:b0:6af:3752:e8b5 with SMTP id w20-20020a05620a445400b006af3752e8b5mr1116380qkp.286.1656491557962;
        Wed, 29 Jun 2022 01:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656491557; cv=none;
        d=google.com; s=arc-20160816;
        b=vGXq76NzuX0yZlha2JgX9grBTYplFnl8J3BhNLclTnCBQWNw8KgXzm17CJd1/i2etP
         2z0RIflYdz9jGtTpFcsrhqki6On8Ns3IGJj8UvLL949vqwhxta7+azoALCH8pYtgvqq7
         5MX7xdXb8XMwGfv5mgX+J6aWSIcT5pmF3fhRhODRBAmGDSaWuD6Yc8sqZIAwTDH19Ab+
         iaiu8rq9rwcUpViig6y7KayW/0+Ydfxon+eoo9PbZndeiLGoZU16w9v1+hZDDDRAg0iZ
         l1C4sKLqygKHkSFX8CN3JqffCQ6OE5ttrQfA33hlX2cLvFoYSti4dCI5In0fxkPjC37W
         mCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ImJg56o2VXp0IsuoZ8l5rYzi6tZP+qjqFpZbkt7N4go=;
        b=dYrT+9OQMMmRngPckdeszTdJI74Jwj4gm1aA+PD5lyrNZqLDllMhH4gxr+I3zGwcPD
         6lCLuB53P+P07ZUDazgvgeYkakIrzo6UVGOAGOFrXmCoV2Nk6qcIBIDmU74DusLxK+Oa
         DES61/ZqE4QYZ5xXOTlTLXUvnLoK620QHhpQX3fJdPTsdpOTp8VPL8zrXksuaUu58eXf
         On+cN/lf2h6niPfKUd4ohcHbe7DJAoTq0y6VkDC34mD6abuIN7ViPkSvCXOMDW+zuGCK
         buBwiToI71MAksQXBV2v95J87DrjnronlWu/+JSu5uPQcrbvp6Oysq9fJMkYzuPnNDo1
         X8Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19-20020ac87fd3000000b00304ebd7a2bbsi4167048qtk.448.2022.06.29.01.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 01:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6T7l-00032r-9R
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 04:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6T6N-0002Ed-7R
 for qemu-arm@nongnu.org; Wed, 29 Jun 2022 04:31:18 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:33357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6T6K-000461-7c
 for qemu-arm@nongnu.org; Wed, 29 Jun 2022 04:31:10 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5E73F27258;
 Wed, 29 Jun 2022 08:31:03 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 29 Jun
 2022 10:31:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005d46b25b1-f6f2-4fff-bf35-9095c801ce37,
 74A1F81DE4F8936248B5873BB0AED4007818FEC6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fc411191-34c3-3de0-aadd-a1d446cbe292@kaod.org>
Date: Wed, 29 Jun 2022 10:31:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 01/13] hw/i2c/aspeed: Fix R_I2CD_FUN_CTRL reference
Content-Language: en-US
To: Peter Delevoryas <peterdelevoryas@gmail.com>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>, <pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-2-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220629033634.3850922-2-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 585e23f9-34d3-457a-8f90-d13828d394de
X-Ovh-Tracer-Id: 992762244883778482
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpuggvlhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Aof5Xff1RCQk

On 6/29/22 05:36, Peter Delevoryas wrote:
> Very minor, doesn't effect functionality, but this is supposed to be
> R_I2CC_FUN_CTRL (new-mode, not old-mode).
> 
> Fixes: ba2cccd64e9 ("aspeed: i2c: Add new mode support")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>   hw/i2c/aspeed_i2c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 37ae1f2e04..ff33571954 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -552,7 +552,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>                             __func__);
>               break;
>           }
> -        bus->regs[R_I2CD_FUN_CTRL] = value & 0x007dc3ff;
> +        bus->regs[R_I2CC_FUN_CTRL] = value & 0x007dc3ff;
>           break;
>       case A_I2CC_AC_TIMING:
>           bus->regs[R_I2CC_AC_TIMING] = value & 0x1ffff0ff;

