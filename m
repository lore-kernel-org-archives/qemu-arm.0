Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2901088lfm;
        Sun, 21 Jun 2020 23:25:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi3wXEOY/XxPWarW1Da1sKbYHPwZl1Zm0kEQOJLxBW60ikoSBZxjb1TG8fAdGdtTMz0C5t
X-Received: by 2002:a25:54e:: with SMTP id 75mr24893380ybf.222.1592807145199;
        Sun, 21 Jun 2020 23:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592807145; cv=none;
        d=google.com; s=arc-20160816;
        b=fYJKqLVZMje7UUNjU6zYE/jwlxv6iO5S04qEtGk+rwq6EbFPItEHtkT4ijLhT6lrwn
         0d8f+h22I3hW7eZz6y6F+5mZc99Qbk6OjkV2UfQzIgX6ZB3fa5kSxrn9oXV1SQPVQ5SD
         Dohaux8WRbMutnWhEwQnIh01QvN94I24BvTOJxfH+jT5HAf1QukiCpg0KyHoxV3B6/NB
         X7dsRTQQI1vLqTQgs/SGXJnNEuvkm7JglbQv+QOjT+RgYU9kr+4qzAKQ488iDhRm2/js
         fz983sr7PXzB7YljiDLaYno50nTky9/vewnunxbq256m+Ksv/7vkD78oAonfq6hcJTK6
         BH1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=BYwo6xJNDrcwL59GMiUQvX5iMHmLMUstLnLT10D2Knk=;
        b=crro1j1TYyWQNIQOjmCr9cR+siXw3mfxvkQrIDd16zIdeu37I20GH4T5PXKmVWVxPN
         w0r1540pyZ/WK15imbNf3VjJcoO5h2lW50VY1bSGnZsVG4gmfoMxvYX58JbBtJLvp+Il
         xCBAvRWW4bo496bl3PJw1C4yUwuiC8SVZfqu5NZZZU7g1eSG2QWI0dUqqKyCQq3bf22G
         McqyHseg03ojVQHO/0VRE06kN8XZ3qpaVj+SHguOWkIMrAVA9sXDmK8uu4zEdfJ+2gex
         p8D1U9rncyjAJGX8Fywq2crJQmBPwHlLvZ+dhZMTS/765Qbis+CSdMfIOT375Lbt9n98
         hfOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v83si12311672ybv.434.2020.06.21.23.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 23:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnFto-0001JW-JQ
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 02:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnFta-0001It-5O
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 02:25:30 -0400
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:54814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnFtW-0006Xl-FE
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 02:25:29 -0400
Received: from player761.ha.ovh.net (unknown [10.110.171.215])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id A390A16C02E
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2020 08:25:15 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id 4B3AB13982B4B;
 Mon, 22 Jun 2020 06:25:07 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00126b615f3-24cf-4752-9ec2-ae0a62459b26,D5B34DF2F1998B4AFDB97B5973F1BB92C24DD330)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v4 3/8] hw/misc/pca9552: Use the PCA9552_PIN_COUNT
 definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620225854.31160-1-f4bug@amsat.org>
 <20200620225854.31160-4-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4628bf30-9b56-a470-afc2-f140690cc002@kaod.org>
Date: Mon, 22 Jun 2020 08:25:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620225854.31160-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5677631757440289707
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekuddguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekiedrvddutddrudehvddrvdegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.76.148; envelope-from=clg@kaod.org;
 helo=9.mo179.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:25:16
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NB0ovJdFpz+K

On 6/21/20 12:58 AM, Philippe Mathieu-Daudé wrote:
> The current code models the PCA9552, but there are comments
> saying the code could be easily adapted for the rest of the
> PCA955x family.
> Since we assume we have at most 16 pins (for the PCA9552),
> add a definition and check the instance doesn't use more than
> this number. This makes the code a bit safer in case other
> PCA955x devices are added.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

I would introduce a PCA9552Class and move nr_leds under the class. 

C. 


> ---
>  hw/misc/pca9552.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index cfefb8fce8..b97fc2893c 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -303,6 +303,17 @@ static void pca9552_initfn(Object *obj)
>      }
>  }
>  
> +static void pca9552_realize(DeviceState *dev, Error **errp)
> +{
> +    PCA9552State *s = PCA9552(dev);
> +
> +    if (s->nr_leds > PCA9552_PIN_COUNT) {
> +        error_setg(errp, "%s invalid led count %u (max: %u)",
> +                   __func__, s->nr_leds, PCA9552_PIN_COUNT);
> +        return;
> +    }
> +}
> +
>  static void pca9552_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -311,6 +322,7 @@ static void pca9552_class_init(ObjectClass *klass, void *data)
>      k->event = pca9552_event;
>      k->recv = pca9552_recv;
>      k->send = pca9552_send;
> +    dc->realize = pca9552_realize;
>      dc->reset = pca9552_reset;
>      dc->vmsd = &pca9552_vmstate;
>  }
> 

