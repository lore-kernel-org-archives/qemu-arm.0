Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp348837lfo;
        Fri, 4 Mar 2022 23:54:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeRZ8RT53+P17Ac9zxN2C1aKk9cvQA9lY1S0Wdg7gHC3bEsMmNfiSJoepfCg9xjlBDOHBi
X-Received: by 2002:ac8:5b83:0:b0:2de:2d6f:7b3e with SMTP id a3-20020ac85b83000000b002de2d6f7b3emr2012852qta.126.1646466869290;
        Fri, 04 Mar 2022 23:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646466869; cv=none;
        d=google.com; s=arc-20160816;
        b=VjRhn46ubzXrg4PT8Nun0VhB7ioMXx+tcdXSbYMK9gF9/0Lg+Y6vVqQQrjGDZOLRcu
         ps0G6oWsHahiFXrGFna6r7MJawnf11Qb0qgKQASgnDbShKrMBuWbio4ifPpXGwOhamhZ
         eXPRBT6k4mgoZAN9jqg+8SWdqodf7TzpvQGyEDDZAGuCEkfIEGpn3YjBz2y0Xw9UNAwJ
         JaOwgN4bsZivrst2WJ69NfWLjgOi+9PVlw+RedhoU2vrEKJ9YhkGrzNEEUl5UjsgfcKg
         MWTy4smOQOxZ4yh6i3aN3VGkl8SPn3BwoGAY0DU9zrlf7aBALRPueczL7PPumJ4gBzCx
         QZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=/gIgPk/mdTQsGWNg7dbQbNf59XEZ83nAFGbbYUuQvlU=;
        b=PyuQPAknWop8CE2PtmKf2VtFt99NuCYxd6fJ/fJGF/WFrRANPji59MIg9FyiU3wTO/
         ENcHt2i/UacXuF6l4bzHgZlV8aZ9Xmhs1FI0dRYqPRdpd4QMd5dPahRgvZ8VtxcEDEzM
         LtH4bji8+n15t8XaFcxkjqubViEPfCsoenAdZjs5yQlwcOahIoRYZzeQ18zZBRL6ubRY
         X9+socM+yVhsM4woraCedtQ+CYgC6IwuthZrO3gwqC5pa2RdVUHTdlDrOCTHMyXpIPMf
         DmwMPVo9rmXOX7wncOK3dezq6C0R7UUP9bgUB/yvx4kJq81uDfIqqQZRLaG6amiiz5lG
         36IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020a05620a400d00b006637c5245e1si2353712qko.625.2022.03.04.23.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 23:54:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQPFE-0002xZ-OQ
	for alex.bennee@linaro.org; Sat, 05 Mar 2022 02:54:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nQPEa-0002x5-R6
 for qemu-arm@nongnu.org; Sat, 05 Mar 2022 02:53:51 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:58761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nQPEY-0007M9-2g
 for qemu-arm@nongnu.org; Sat, 05 Mar 2022 02:53:47 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.90])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 73F7224CBB;
 Sat,  5 Mar 2022 07:53:42 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sat, 5 Mar
 2022 08:53:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00300b8a430-81b6-4193-8351-ce48e25b2c71,
 A4EA2D8AEBB64B4F793E8EC0AE0C67A6646D724C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.1.230.64
Message-ID: <ac68dba6-32e0-908c-c98f-7c95102b5b43@kaod.org>
Date: Sat, 5 Mar 2022 08:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] hw/arm/aspeed: allow missing spi_model
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <20220305000656.1944589-1-patrick@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220305000656.1944589-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7abd9f0a-3290-47f9-ad87-4a0903c6ac04
X-Ovh-Tracer-Id: 1659013514891332390
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -77
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtledguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddvfedmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xvw6DHhQj1wF

On 3/5/22 01:06, Patrick Williams wrote:
> Generally all BMCs will use the fmc_model to hold their own flash
> and most will have a spi_model to hold the managed system's flash,
> but not all systems do.  Add a simple NULL check to allow a system
> to set the spi_model as NULL to indicate it should not be instantiated.


OK. Let's do it that way for now but we need to rework 'num_cs' in the
Aspeed SMC model and the Aspeed machines. We started with a simple
requirement (1 FMC and 1 SPI) but since, things have become more complex.

1. we should get rid of AspeedSMCState::num_cs and simply use
    AspeedSMCState::max_peripherals in the SMC model. There is no need to
    restrict the number devices of the controller to match the board layout.

2. aspeed_board_init_flashes() needs a better interface. May be, something
    like :

    static void aspeed_board_init_flashes(AspeedSMCState *s,
                                          const char **flashtype, int count,
                                          int unit0)

and change ->fmc_model and ->spi_model to be arrays. Ideas welcome.

Anyhow,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>   hw/arm/aspeed.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 11558b327b..617a1ecbdc 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -276,7 +276,11 @@ static void aspeed_board_init_flashes(AspeedSMCState *s,
>                                         const char *flashtype,
>                                         int unit0)
>   {
> -    int i ;
> +    int i;
> +
> +    if (!flashtype) {
> +        return;
> +    }
>   
>       for (i = 0; i < s->num_cs; ++i) {
>           DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);

