Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2902173lfm;
        Sun, 21 Jun 2020 23:27:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykHkbNHMntUjCPbN5MP6t7qFThvQQFDslX8UwgNJm/U81Aj1rab+wTa0ieN9b7wkZvZ3Pq
X-Received: by 2002:a25:850b:: with SMTP id w11mr14044787ybk.291.1592807261325;
        Sun, 21 Jun 2020 23:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592807261; cv=none;
        d=google.com; s=arc-20160816;
        b=ObqvlHHYtQBKT5nPydF8ciID7EtgNhRAwsg6zhmp6mamCHa6a/J+LWAYEq1J1oKwnG
         iOZw2AYAcaoV2qpJSSSWVTyn8g8nZmVzRCfaeWeXzfkK3AgGEa+RmSCKl6f77AJKzahM
         WKmdn7o6/HHsEO3GRAWEvKPi8VQLPoeDuFpYRSMQMWJnrEscL2HVtZtwXRkRO6akbdTU
         BxB0x13k+lGxqZgPnUC3SNcsFtruLXbL0ePnjGk4sqqUNMmMAP8Bi1ggdEsoQeymnaEA
         k4MJr8PK/sxkqtpzr9NTrDYMb13cpJFLCsWi2T7FJO7ZDC7EQWGmGRQwFgmz9ZP4Qh7V
         xC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=xJdo2njby2ueVZiCUj7DU1/Hrm+xFt5MyIpul6/+Se8=;
        b=XtRpk1+6zWZptW+BSD6+jU9F6FpQWTIje5YxbompRdekgvxkXNuUFgCeilRkRSHcs4
         b5lcPnW1AlAmSQ/kEQlkOJ4AJ6FTx8qoT/86dmwfl0L4DseSGbkS1Pta+9DW2h0mIzcC
         O5M67wFNA27HUC8BLq+2kUFXMPe4mwCKfmKNLt35uxvLKwWSJGasHOskkWpr4migLXPe
         dF50m96vdNowf8kdZjQsNcFupJgezjzuRbglJYYaWcsmsxwcrRSKN9i9eZ+HKhdiD0Hw
         c/HES8kpIM6zu/pTqORRYprgWEbZyK4eozG+UpLfuD/x3EJZeqGvgVamjYX2EDkMipjB
         JVPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si12276264ybt.214.2020.06.21.23.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 23:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnFvg-0002wF-My
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 02:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnFvZ-0002w3-U2
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 02:27:33 -0400
Received: from 1.mo69.mail-out.ovh.net ([178.33.251.173]:46910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnFvY-0006u9-45
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 02:27:33 -0400
Received: from player728.ha.ovh.net (unknown [10.110.103.132])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id AA67E9666C
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2020 08:27:29 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 532D01381E123;
 Mon, 22 Jun 2020 06:27:20 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004cd65a8dd-6e6e-419c-8aae-295a60c244d2,D5B34DF2F1998B4AFDB97B5973F1BB92C24DD330)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v4 4/8] hw/misc/pca9552: Add a 'description' property for
 debugging purpose
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620225854.31160-1-f4bug@amsat.org>
 <20200620225854.31160-5-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4d335933-9669-43e1-0966-5f0255142012@kaod.org>
Date: Mon, 22 Jun 2020 08:27:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620225854.31160-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5715349404552956843
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekuddguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekiedrvddutddrudehvddrvdegheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.251.173; envelope-from=clg@kaod.org;
 helo=1.mo69.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:27:29
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: LEWNU+AWKBoV

On 6/21/20 12:58 AM, Philippe Mathieu-Daudé wrote:
> Add a description field to distinguish between multiple devices.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Could it be a QOM attribute ? 

C.

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/pca9552.h |  1 +
>  hw/misc/pca9552.c         | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
> index ef6da4988f..c5be7f1c5e 100644
> --- a/include/hw/misc/pca9552.h
> +++ b/include/hw/misc/pca9552.h
> @@ -27,6 +27,7 @@ typedef struct PCA9552State {
>  
>      uint8_t regs[PCA9552_NR_REGS];
>      uint8_t max_reg;
> +    char *description; /* For debugging purpose only */
>      uint8_t nr_leds;
>  } PCA9552State;
>  
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index b97fc2893c..54ccdcf6d4 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -12,6 +12,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/misc/pca9552.h"
>  #include "hw/misc/pca9552_regs.h"
>  #include "migration/vmstate.h"
> @@ -312,8 +313,16 @@ static void pca9552_realize(DeviceState *dev, Error **errp)
>                     __func__, s->nr_leds, PCA9552_PIN_COUNT);
>          return;
>      }
> +    if (!s->description) {
> +        s->description = g_strdup("pca-unspecified");
> +    }
>  }
>  
> +static Property pca9552_properties[] = {
> +    DEFINE_PROP_STRING("description", PCA9552State, description),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void pca9552_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -325,6 +334,7 @@ static void pca9552_class_init(ObjectClass *klass, void *data)
>      dc->realize = pca9552_realize;
>      dc->reset = pca9552_reset;
>      dc->vmsd = &pca9552_vmstate;
> +    device_class_set_props(dc, pca9552_properties);
>  }
>  
>  static const TypeInfo pca9552_info = {
> 

