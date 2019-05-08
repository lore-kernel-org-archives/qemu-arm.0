Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4696377wrh;
        Wed, 8 May 2019 04:09:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6K3YQBSIqO+hvpbkYmclDVH9bjqpJlfc7x+I/lLdhgd1fWOMADZYbjGmUyEiffZ+xu52p
X-Received: by 2002:a1c:ed12:: with SMTP id l18mr2807345wmh.13.1557313796455;
        Wed, 08 May 2019 04:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557313796; cv=none;
        d=google.com; s=arc-20160816;
        b=F90NNJWgu4I0K+cNHgngJM7QUyqFNJSxB0XAER/rktb++WnT1Y9qukFmwuj2/CZOhD
         eZQtp6hFPIbaDj7/rMY8cAsfp8osjx2AX9RO0QpE93Y4EPHjRm75KHwdiu/2NGUVYADl
         jVyUAISlsS3ESDVdNhjss+U345/6LIzpCDm126+SiFM7ogKgMmqoHNkHTylBUifiPk3r
         D76C3x4UUf0Pe3sU0hMv5GtUjKHW9mAeAaaxqYSy+bMvV6I8LNSxCHoz/VFhASuX65Hp
         xQwwhl7EA8vyLVelRKIa4alPrWQW5OiOGN73JO6u0j/6E5Astc9wRD8nJtaW4MYKJ2KI
         WMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=wr0k0q7FKcI6IsoL0WjH9SOSxiIfGfF8JyhCKV2olgE=;
        b=O6oIaMguwTLWEkzKtO7pchTlGGlh1u5V2btKJFOdKLQC7TmjS1VwCH8HZfLr2nP2gE
         lZARrJpgR1f+6PiGqHHTwEnTrlv7fU/Y2xWWTyOFkSYrtl261zgCyrD1WyeHU/qK24oh
         spSffylakVjVQ+3eKCDwUC1BS80ciPmdY/atVdeNgNXOSdQPccJFHEenHzDyahLgMp4O
         kbnAKp7l0ta/IwY2Udv+rKKdWek1v1EeOWlRgl8WAPNAlRFvL5Hrfe0gQn/sBvzuH1qS
         eY71jKRgaEBl3blqHsOetbqU4HFzvQTmFvVhj/BXA6vaLQtImWMdB/QFC6Q8ef+lHZM9
         OrEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l25si1284256wmj.160.2019.05.08.04.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:09:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKSR-0000Dl-HH
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:09:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKSD-0000DC-9G
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:09:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKSC-0007b5-Cl
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:09:41 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKSC-0007aF-0e
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:09:40 -0400
Received: by mail-wm1-f66.google.com with SMTP id m20so1668460wmg.1
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wr0k0q7FKcI6IsoL0WjH9SOSxiIfGfF8JyhCKV2olgE=;
	b=BjXqIaQTMbqaMqszxuVG6rxmUx145WUQaG/rn4m1PGeByLyRemD6nBrUKxdhwy6yq2
	sjk4HroYHI+F/W/Et7+SKgu6wSsD8nWEuFMs/MUG5AbTQ0UlOTMXPUs5L1L6EpGXglj9
	FxNaKyRBi2PXVe/WuGVUctmNGfLA/EHH73sATgpVuNAVQ4238vOwi+cipOYy9EtFNCqr
	C80gyFDLPCwHBZoOBn/tF7TWW/V15GRADQG7uTOlzmpAipre3+yt19JQ1V3E0MNScog+
	b1yedGKo87lYA0klOMjW5xtw/MxQB1FIqQwumx+jOE4nv99PCAYNyaGN5IMPRynC5fhq
	PE0A==
X-Gm-Message-State: APjAAAW/xY5ojmwu0TOl+Gs01rHyh7tISkKS9RigEo/4oBV+vL31pPD2
	LaoANUp8qUahgwVjKodaKw3TyQ==
X-Received: by 2002:a1c:988b:: with SMTP id a133mr2036763wme.89.1557313777401; 
	Wed, 08 May 2019 04:09:37 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	b10sm2905437wme.25.2019.05.08.04.09.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:09:36 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-5-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a261e867-ff96-d9f7-cf99-6f08e50b20f8@redhat.com>
Date: Wed, 8 May 2019 13:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 04/16] hw/arm/bcm2835: Use
 TYPE_PL011 instead of hardcoded string
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7gTf9hzr1pwn

On 07/05/19 11:34, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/bcm2835_peripherals.c         | 2 +-
>  include/hw/arm/bcm2835_peripherals.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 6be7660e8cb..7ffb51b6927 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -46,7 +46,7 @@ static void bcm2835_peripherals_init(Object *obj)
>      qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
>  
>      /* UART0 */
> -    s->uart0 = SYS_BUS_DEVICE(object_new("pl011"));
> +    s->uart0 = SYS_BUS_DEVICE(object_new(TYPE_PL011));
>      object_property_add_child(obj, "uart0", OBJECT(s->uart0), NULL);
>      qdev_set_parent_bus(DEVICE(s->uart0), sysbus_get_default());
>  
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
> index f5b193f6707..959508d57dd 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -13,6 +13,7 @@
>  
>  #include "qemu-common.h"
>  #include "hw/sysbus.h"
> +#include "hw/char/pl011.h"
>  #include "hw/char/bcm2835_aux.h"
>  #include "hw/display/bcm2835_fb.h"
>  #include "hw/dma/bcm2835_dma.h"
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
