Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1993861njm;
        Tue, 2 Jul 2024 07:18:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUw/9IXRZwko+RgkKnGDOAkcO0iHPeeEvL8GwKDPHYl5dCD7VbBOH8lw4P9cUIX+asZD2UwGvMLVliRiB8pX57jjCAnVhdV
X-Google-Smtp-Source: AGHT+IE8x8dacW0Ai7WUH13dxV7JYnDQinqaHLxJnDcGEs54boVd5z0lfBfHlnj3PhVe/JgISuPJ
X-Received: by 2002:a05:6512:1151:b0:52c:df4d:bb9e with SMTP id 2adb3069b0e04-52e826932fbmr6645691e87.41.1719929899528;
        Tue, 02 Jul 2024 07:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719929899; cv=none;
        d=google.com; s=arc-20160816;
        b=dzc6cJs3TWRSgqKJwOVlc0QPnIFaxaZMTsQMT7Nz/mAnjkxfBtrXLHYiy9DRcwrO7a
         fGcaqvpQNYJ1hwIq3jtetA06H3/7ZrOEu9VVVCEImyww+WOYvuYDiVAlBTPKT8thZSAb
         McM18+dkIjWNzeNf+ZdWjPIK0nCYboCgXv9cXlEQjfpdfj2mRQ1D7jnUDioTMHE8GBfe
         kwOJPihsdEH/C9t2x/N8XrjqoY2PfaeTeUL1auIBnqamtYyWcB27G4YnWIafEuwSGnOf
         PDAe2LdUbW7f7O3/5Il8rh2GbGacCJi/oKZKPNeGxZC5aW3eA2YNqLViM/GAIbDMXHDU
         X0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=tlyjhkfN4FIvs4yis+z8gUhjS99lZz3WlKzq56Loa/w=;
        fh=BTnPzZJ1+AYidJxTInyBBzHVTksBxUqubakG/q1+YVE=;
        b=Wug8bzfXZcQ9bPP2CZwPJvhsISbc4GUxkKgJim5gdQtNKgrsuQg3imJtz9x0TZBo/D
         lxDBHYMlVOAj1nPRyxQ2Znv36M7Q9lsXYODDBAVbv2S12Xox1hrpAnfzDiaAi/k3OQ5P
         k32m/srWWvNqjV8wiU2RHk52fhJ7IpB0KVFQwCC0PgU14ntRWs1whSZbGXrP5AM6kWgy
         bhSxcx9CAa1HLkzjudS1iNKJfSB4zdNFeJEUtzGVcI3zeGThv0KXe+7cwL333R7H0I7J
         chdO+bzo3KrcxJneqESsRE3GZdCUUrlO8pA5FZMeebfJhKKvm7WNRMYD7UwjdJCoaqvw
         OUDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4257a185c15si40461795e9.175.2024.07.02.07.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 07:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOeIz-0000PP-Gz; Tue, 02 Jul 2024 10:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOeIl-0000G7-7o; Tue, 02 Jul 2024 10:16:12 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOeIg-0006mt-OO; Tue, 02 Jul 2024 10:16:10 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WD4hJ0bv0z4xGl;
 Wed,  3 Jul 2024 00:16:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WD4h94mSSz4wx6;
 Wed,  3 Jul 2024 00:15:53 +1000 (AEST)
Message-ID: <c18a660d-9695-4d60-b3c5-ff541754b083@kaod.org>
Date: Tue, 2 Jul 2024 16:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hw/sd/npcm7xx_sdhci: Use TYPE_SYSBUS_SDHCI definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, Thomas Huth <thuth@redhat.com>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Laurent Vivier <lvivier@redhat.com>, Luc Michel <luc.michel@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Patrick Venture <venture@google.com>
References: <20240702140842.54242-1-philmd@linaro.org>
 <20240702140842.54242-2-philmd@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240702140842.54242-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=fXIt=OC=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DRDGLoVixdc8

On 7/2/24 4:08 PM, Philippe Mathieu-Daudé wrote:
> Use the macro instead of two explicit string literals.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/sd/npcm7xx_sdhci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/npcm7xx_sdhci.c b/hw/sd/npcm7xx_sdhci.c
> index e93dab8dbd..fb51821e11 100644
> --- a/hw/sd/npcm7xx_sdhci.c
> +++ b/hw/sd/npcm7xx_sdhci.c
> @@ -16,6 +16,7 @@
>   
>   #include "qemu/osdep.h"
>   
> +#include "hw/sd/sdhci.h"
>   #include "hw/sd/npcm7xx_sdhci.h"
>   #include "migration/vmstate.h"
>   #include "sdhci-internal.h"
> @@ -162,7 +163,7 @@ static void npcm7xx_sdhci_instance_init(Object *obj)
>   {
>       NPCM7xxSDHCIState *s = NPCM7XX_SDHCI(obj);
>   
> -    object_initialize_child(OBJECT(s), "generic-sdhci", &s->sdhci,
> +    object_initialize_child(OBJECT(s), TYPE_SYSBUS_SDHCI, &s->sdhci,
>                               TYPE_SYSBUS_SDHCI);
>   }
>   

