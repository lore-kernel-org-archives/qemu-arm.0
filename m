Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp316081lfk;
        Tue, 16 Nov 2021 23:54:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx30qxHZypIRL3RGLg/eLMpgXfkoKprun50OnzE5LrW1Zj6+aH050Gs5MwXPYfw8DZrPTSS
X-Received: by 2002:a05:622a:1206:: with SMTP id y6mr14429988qtx.356.1637135644168;
        Tue, 16 Nov 2021 23:54:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637135644; cv=none;
        d=google.com; s=arc-20160816;
        b=J+Jf+prwy5xaElYmx/hooYzzNxYicuTGS1d5hXTQp2ltEwcbvjGQ4lJkUXLXE+TDdN
         vm6Rb7+TgRQB00cb2SUgpZSqIreDBMmLbcQHvK0YNyX7b8sHhT/BHt0zY9iYykAthZL8
         cAeRZK9CUnqFHpjsJP0pMBvSUdRRvo4/YnMET3ai2tnTgpupugA8MttH5FW2yituNjz9
         NVwJiVdngEE5hm2lvqCKe80KDs3hUyiBTLONis86YoNIQeaKhep/ufpL3UW+208iMBNS
         oSyVs4BG+P1ryYtC2gF993HjnINp//xTp4cZey4nCrAd6NB+tZK4TYUl/5i/sW49cyEu
         ZIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=b4ZFA65PBtP/KjRgYJIDX9g3gS/dZThrEA54uDwO4wU=;
        b=TkN3Gqto886QLGTNH+7A75TsFhySC+1Rqe2Zmmr2CBxZUg2bA3R+2ZJK+Qqi9oUwba
         7A3lgbuTGdAqNj8dsDl6waj7fjiOQcJsKBszZzmMMI4okXUYymlGfN5Lh9pUWJ65STAV
         01ico4aV6jIJeEr3/RipRNsYpbpxL3FSDhp49w7t+/72045BNyNbsiactcWHHPU6VMcp
         DPpk207NLpgYcNYE0TuYfmyo+tL074CP+dh4nm5RFmdIBE3lX9x7O0HDXIknlxd2v6Ha
         OSAjCilmEBdGfRTtmeay7REuH78xVNafkHJHzB7/VkSQRgJSTbbrInzRwCLAe5TBrakd
         QkLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si25534734qtg.433.2021.11.16.23.54.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 23:54:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnFlb-0004Kv-HK
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 02:54:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnFlH-0004KT-QI
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 02:53:43 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:38929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnFlF-0004pA-HI
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 02:53:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9270E21592;
 Wed, 17 Nov 2021 07:53:38 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 08:53:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002dce578e4-617e-48dc-a2ef-82cf2323b240,
 6BDA4A3F9269C8E5581A3C4EE5F64AFAFECCD473) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e5c54c0a-4f7f-1653-9538-3d008cde2cfc@kaod.org>
Date: Wed, 17 Nov 2021 08:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [SPAM] [PATCH v2 1/4] docs: aspeed: Add new boards
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20211117065752.330632-1-joel@jms.id.au>
 <20211117065752.330632-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211117065752.330632-2-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 87bb057a-becf-485a-92cf-f3b88a39b89e
X-Ovh-Tracer-Id: 13042987472296577955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LPpzlHxSzkIO

On 11/17/21 07:57, Joel Stanley wrote:
> Add X11, FP5280G2, G220A, Rainier and Fuji. Mention that Swift will be
> removed in v7.0.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks

C.


> ---
> v2:
>   - Add POWER10 to Rainier description
>   - Include Fuji
>   - Mention Swift to be removed
> ---
>   docs/system/arm/aspeed.rst | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index cec87e3743d0..41a9bd5608e8 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -14,6 +14,7 @@ AST2400 SoC based machines :
>   
>   - ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
>   - ``quanta-q71l-bmc``      OpenBMC Quanta BMC
> +- ``supermicrox11-bmc``    Supermicro X11 BMC
>   
>   AST2500 SoC based machines :
>   
> @@ -21,12 +22,16 @@ AST2500 SoC based machines :
>   - ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
>   - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
>   - ``sonorapass-bmc``       OCP SonoraPass BMC
> -- ``swift-bmc``            OpenPOWER Swift BMC POWER9
> +- ``swift-bmc``            OpenPOWER Swift BMC POWER9 (to be removed in v7.0)
> +- ``fp5280g2-bmc``         Inspur FP5280G2 BMC
> +- ``g220a-bmc``            Bytedance G220A BMC
>   
>   AST2600 SoC based machines :
>   
>   - ``ast2600-evb``          Aspeed AST2600 Evaluation board (Cortex-A7)
>   - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
> +- ``rainier-bmc``          IBM Rainier POWER10 BMC
> +- ``fuji-bmc``             Facebook Fuji BMC
>   
>   Supported devices
>   -----------------
> 

