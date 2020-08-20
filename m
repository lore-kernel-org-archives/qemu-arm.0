Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1099958lfy;
        Wed, 19 Aug 2020 23:42:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu7ubYapmbk8NWTOmCoZiKqfQfXo48cFadK0lUW418syHIWekpBN5XvxMg50NJWtn+UNRq
X-Received: by 2002:a05:6902:1026:: with SMTP id x6mr3304833ybt.349.1597905737093;
        Wed, 19 Aug 2020 23:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597905737; cv=none;
        d=google.com; s=arc-20160816;
        b=WcLS4rgY3gCTttOdYGJzsO4BklCm9ONTfzYShbZdoK/98TyjmYaKvkD6l05iSrAJb9
         k/wY0dOyXnRYRkUaEAXGm8b5qbvO6XB+7JaAUOKB9BX4ajU1ygHZrwVqcIaxQdNDm6D+
         8rYOV1xZxmLvMp1cipGPfTz0EhtGtLxe8J3z4s8ipvn8+kmyWk4gsn7jwOeg/MhXqKhR
         5vgygGLhHKZqKZpZTI/+hhbrSQCbyWKrvh5QWlOq4/O/dnhKymqgIq9ak6TIdOr/y/jf
         vR4t+YAEtQ/wyEzxW07AA5rG6+y80fxq5GBSQGgfC8wDwYsYeeACFMMGsJcP/xwTL8f2
         Fr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=HnY4SSLqw6q+TImtyzxO/i5V3XvSqEvRovqVJR+l60I=;
        b=opjFxaypvsDJqHqOQR8RegZmyN9UL1wRh+Uy2sIa4eIfmbZ9NaiWDS7HrceEJsydzS
         jXZwg19a0FnmkVWb+Mg6i9qLNwi0XaZcXvdJogNW7LCU2iCDri0CD2Kf0kDJAyqz4f0n
         kuEFERRd+myhZ7LRHvnAF7pmolMgnkCnCiOrzOEdZv3BPxWeTtEZ1VerbTS0lZfHyn5o
         ijNGxaAT0GXOW3YuEpjHxqoPvNUS++5BWdbcGXv8ZdV7ksGR7MvnwYMKx+NQxgfWVJKv
         23JWssfjkD+bFS9QumnKF88gM4zu1x9xI+Qq+Up6v1awyS47i4vUP3VaUSz9tacN2RXP
         LwCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p194si1298844yba.137.2020.08.19.23.42.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 23:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8eHA-0000wK-GE
	for alex.bennee@linaro.org; Thu, 20 Aug 2020 02:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8eH3-0000ub-5v; Thu, 20 Aug 2020 02:42:09 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:55411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8eH1-00008L-ME; Thu, 20 Aug 2020 02:42:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 5D40F58D9D3C;
 Thu, 20 Aug 2020 08:42:05 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 20 Aug
 2020 08:42:04 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00621555f74-d5c7-48d5-b135-63568622732e,
 02C359FD435C2C4122574921AFFD4D91C9CEEBEA) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 10/58] aspeed_timer: Fix ASPEED_TIMER macro definition
To: Eduardo Habkost <ehabkost@redhat.com>, <qemu-devel@nongnu.org>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-11-ehabkost@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <56567ff0-65d5-0542-15e8-a054d01bb264@kaod.org>
Date: Thu, 20 Aug 2020 08:42:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820001236.1284548-11-ehabkost@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 99b3238d-5211-4961-b792-f630648c7203
X-Ovh-Tracer-Id: 1962725014723791663
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtledgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegvhhgrsghkohhsthesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 02:41:12
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0JcA3pwEaz/B

On 8/20/20 2:11 AM, Eduardo Habkost wrote:
> The macro definition had an extra semicolon.  This was never
> noticed because the macro was only being used where it didn't
> make a difference.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> Changes v1 -> v2: none
> 
> ---
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  include/hw/timer/aspeed_timer.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
> index 948329893c..d7c7d8ad28 100644
> --- a/include/hw/timer/aspeed_timer.h
> +++ b/include/hw/timer/aspeed_timer.h
> @@ -26,7 +26,7 @@
>  #include "hw/misc/aspeed_scu.h"
>  
>  #define ASPEED_TIMER(obj) \
> -    OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
> +    OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER)
>  #define TYPE_ASPEED_TIMER "aspeed.timer"
>  #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
>  #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
> 

