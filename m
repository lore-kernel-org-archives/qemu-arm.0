Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp767044njc;
        Fri, 20 Jun 2025 02:44:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGrhAwbpa5hKUVWG3S8hNEr+twpyZyxGu037y/tCJfvmsAMIJ/9xrDqG8TebxU4oVXndDn40/tiN6oeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGcAHebzkUZ9VE1ORLNPAu8VxCgE2IC6iTYMGGpTpD5MTgv9MS1CMv5uXX1JN6tL7Si8ccQ
X-Received: by 2002:a5d:5f4d:0:b0:3a5:1c70:5677 with SMTP id ffacd0b85a97d-3a6d12c2a99mr1818784f8f.7.1750412688243;
        Fri, 20 Jun 2025 02:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750412688; cv=none;
        d=google.com; s=arc-20240605;
        b=aBtqsgZype68XUlu/PjsNO//n5pRrWBjAfg4NFxJKHlynQad7dAEufIK7GE5SSIqwo
         iUhQbuXMlPKcwAFvjCkApl9tBultfYhOrv3ZFfPTftJybLXP055q4Xsk7Lal9U8niUI5
         GmQ6FBdLhXIC0BCkBRYBFwfRp0v5ts3JxRs0AtaKyx8YF2v/5egO+3oisaa7uxw2Da92
         eWnuFIwS3Q9K01nz1iWEToengZY6h6U8ndG4h31kmuKdvo38xhTlI5i4q5MCdpgrGfhZ
         sWfqHT85MXAphlBRkhPpmf7UES/XHRUgfvFFYlqD4YugjEXHmHqtmrJkf/1o5Dy5SzJK
         QGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=GXm+0B1yuusnDLE4PibYpcqzWf/Co/tRq3902jMkPRY=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=hNtqzijTdt2r4SPc742jVAMvdQs+k2Lpr+OOZQed/11NqiNAU+cOp8qgTRHnygF9dW
         x/M45Hv98ylksfgaE8CngpdeqTH/97kwGvyG8KWoYeuKpVW75fxXrt3SA+1Sm61M/TF4
         /IOIu5xno8aOTBtY9TCKlwldzUNChk5nTgZV0375CKq69obtmQf3bJpdYX9u2I8d67kZ
         xU8eFITPeXK1griIK+y1d2KeVbMTkicvrLYV4gdhhKLNYJcdpRHGE91eue8EjMfDwV2V
         6P/SuiA1KfZZ3ueIqDykMkcHiGUzRV/DXgWcpEKNF1JRo7NQLMeesr7GfhlyK6G7MCAr
         mQKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d117ecb8si1000260f8f.346.2025.06.20.02.44.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 02:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNsvn1VxVz6L58x;
	Fri, 20 Jun 2025 17:42:29 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 72395140446;
	Fri, 20 Jun 2025 17:44:47 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 11:44:46 +0200
Date: Fri, 20 Jun 2025 10:44:45 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 20/29] hw/acpi/ged: Prepare the device to react to
 PCI hotplug events
Message-ID: <20250620104445.000033d5@huawei.com>
In-Reply-To: <20250616094903.885753-21-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-21-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 364g2z58QPrQ

On Mon, 16 Jun 2025 11:46:49 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> QEMU will notify the OS about PCI hotplug/hotunplug events through
> GED interrupts. Let the GED device handle a new PCI hotplug event.
> On its occurrence it calls the \\_SB.PCI0.PCNT method with the BLCK
> mutex held.
> 
> The GED device uses a dedicated MMIO region that will be mapped
> by the machine code.
> 
> At this point the GED still does not support PCI device hotplug in
> its TYPE_HOTPLUG_HANDLER implementation. This will come in a
> subsequent patch.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Been a little while since I looked at how all this fits together
but this looks right from what I can remember.  Hopefully others
can give a more definitive review!

One stray change that belongs in an earlier patch though.
With that fixed up.

So with that in mind.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>



> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index e79a24b821..36492aa0d9 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -43,7 +43,6 @@
>  #include "qobject/qnum.h"
>  #include "trace.h"
>  
> -#define ACPI_PCIHP_SIZE 0x0018

It goes away from here, but doesn't get added anywhere?

Looks like this belongs in patch 17?

>  #define PCI_UP_BASE 0x0000
>  #define PCI_DOWN_BASE 0x0004
>  #define PCI_EJ_BASE 0x0008
