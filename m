Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp298617ejc;
        Fri, 27 Oct 2023 08:53:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMnDDjlHbg5jJhFjrJDqJvNcPEv2DaPONI62mdZcLV6yo181B2IyxyAY/AacnACEcLV7z6
X-Received: by 2002:a05:6870:790f:b0:1e9:54a3:9884 with SMTP id hg15-20020a056870790f00b001e954a39884mr4010048oab.15.1698422022599;
        Fri, 27 Oct 2023 08:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698422022; cv=none;
        d=google.com; s=arc-20160816;
        b=HDWgRhmg0Lbl8GN1oh6OOkM+4TPvkupY0nHt3ivRgq5mQ8qHtSqqntOIVGkXEtEr5G
         nl1lIzGE2YEZ18hNsFVftr5VTXi0JBPX7eSqJgEWYaH/N2oj/CwXkOgEj3yrGgEE4Gou
         0U8wEPfPOuKyXc7vz/okNGu4sWJe+gPZ9/S8+ERE+J95eSdrjTQZNJ4d84L8xvwuy+Gf
         bpqzD04RdKCco4kzfIlE8mx5eoNYPQFd4yWz9Kbp9NCEPG5RaVBxmImCSoNKnf8R1AeC
         N8t1cIgkLQwujLDjfI3bLnq654D44t48fW9XMmK2+5fvDgNgJiFPBT0iHMFpaAJd1YRq
         CTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=s05c3kPBJ/QTqljzl00e0NyjCzljvXCNcdu2Vr39lpM=;
        fh=k5tPbkSxlCfV4EtOGD1K9SgZ/i0QXtm6NrLbOY0lVkk=;
        b=kHr1hDEmSz0ANzjsOTuXiHmr1Ase37KTbQhSeYa/X9AA+VL8zeA721QAVLV66s0PNj
         B2rP8Pf9Nnv5U+PMLm/4LttMNqIZxArsberyTapm5HFxcdB/ZcLFRD1t/Mb6GTRXdKN7
         MVjD1WO6U/ZLGJ6McoJtSVSGdaClqHUP7Vpk5hHqvppGDIzivmFcZi0JotP5D053kSZq
         bi4DFsmh8XRyMguSUZdO8YCljgGzaqFNYM0D2CdxRl2FfUpladW1KLeALuU15JpChSRK
         DhdZFOhC7RjmpwgBH5vwYwwVeEpAJsm962jpdxZdD6FrPDcgtYo1zTvBKuhHKVd/1TxE
         nY7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s195-20020a2577cc000000b00d9cee1b7f44si3114218ybc.391.2023.10.27.08.53.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 08:53:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwP9V-0003L5-1P; Fri, 27 Oct 2023 11:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=tFIR=GJ=kaod.org=clg@ozlabs.org>)
 id 1qwP9S-0003J0-TD; Fri, 27 Oct 2023 11:53:34 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=tFIR=GJ=kaod.org=clg@ozlabs.org>)
 id 1qwP9Q-0002Mx-Fu; Fri, 27 Oct 2023 11:53:34 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SH6db73WQz4xQd;
 Sat, 28 Oct 2023 02:53:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SH6dY2KZ3z4xQW;
 Sat, 28 Oct 2023 02:53:21 +1100 (AEDT)
Message-ID: <9fb8d22e-feb2-4186-8da4-b44c1bf7e358@kaod.org>
Date: Fri, 27 Oct 2023 17:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/watchdog/wdt_aspeed: Remove unused
 'hw/misc/aspeed_scu.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, qemu-trivial@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20231027134200.29906-1-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231027134200.29906-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=tFIR=GJ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yVXJHTDRV9qc

On 10/27/23 15:42, Philippe Mathieu-Daudé wrote:
> Aspeed watchdog doesn't use anything from the System Control Unit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/watchdog/wdt_aspeed.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index d267aa185c..273a49d360 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -14,7 +14,6 @@
>   #include "qemu/module.h"
>   #include "qemu/timer.h"
>   #include "sysemu/watchdog.h"
> -#include "hw/misc/aspeed_scu.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/sysbus.h"
>   #include "hw/watchdog/wdt_aspeed.h"

