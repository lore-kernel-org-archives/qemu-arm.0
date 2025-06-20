Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp745332njc;
        Fri, 20 Jun 2025 01:53:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2+WfIvZUZKm6GKp6WW3bMd34fU3BAJiTov11nFDbHJkmK+FRAV/tZUG0sDUSu2VqdwdIToNhNOyABAg==@linaro.org
X-Google-Smtp-Source: AGHT+IHKOfWihLDqZkKPvT25ToZgikMZesm57twCcBDQKxqZ08STLAe2mNtO7j3+GFHewqaFWAnY
X-Received: by 2002:a05:6000:41d9:b0:3a5:52b3:103b with SMTP id ffacd0b85a97d-3a6d12bb4c7mr1379854f8f.4.1750409591085;
        Fri, 20 Jun 2025 01:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750409591; cv=none;
        d=google.com; s=arc-20240605;
        b=MZvplUZtCzglHijRPvcPzD3qeuYt/TVZYOhR9B5xC6e50G0yId4vspiJbpDVLYBGD6
         GHr9qhnSpvGMuUqODdJaT/SJLXrqwpFVZHGF1P2ZAUb7R65Vug2elPY4CJ5Fep5HebJS
         Bd3CmJsPtkwl03awXlguM7gpesRZncYMXVpRR6JUulYjwpob95oxf/+ArQZ/r85wpECK
         dM7gndX1QHxtqby0lIKBdW3F4MG8QGuJf8jVLXqAdzifm3laMVtxlbytfpuJdUl/cPTR
         wCtKxPDIHJI37JVQsIR85bnqRjuymQVepK88Z+fj1hQT6aQ11eK25uZfsz2LpiQqxsKL
         Nu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=xuK8BsxdRBdMW76xsXNUphcY1eDd2gZP8EROirFK+dM=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=AYDMD74GWAUNBO6jWFwPnHnXGAuhJksrIxXraRv2COTvNg+cilJX6Yw/Ffa+SmD5h2
         1lmznGJ5XpXh/JyZVDnVajGhEoD4DFAl3Sn50Syp1dv3Qhby+cAsoDgH8AbposUqf41w
         mpeLLrFbulHrfaz4jHQ+57QTJoXWPHyuZzFO7SgCHRmahzshBPiShdjK0Q5Gx91Gie8s
         qqxu55I9sGbEgRuGbZV0TI0iQCsmsPwSjjuEOim78uQSjx12XHMf8NmIc9wFWtaiACcB
         rZliuuorjom6c9ALd76ozKPNIrYIToq+vt8zsr5r3S58vTzkhqf2hh1UoKb1vfTqXfMH
         ws7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d0f1cd70si1005128f8f.112.2025.06.20.01.53.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:53:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNrmD1xyxz6L6Gm;
	Fri, 20 Jun 2025 16:50:52 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 68C131402FE;
	Fri, 20 Jun 2025 16:53:10 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 10:53:09 +0200
Date: Fri, 20 Jun 2025 09:53:08 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 02/29] hw/acpi/ged: Add a
 acpi-pci-hotplug-with-bridge-support property
Message-ID: <20250620095308.00000d16@huawei.com>
In-Reply-To: <20250616094903.885753-3-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-3-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: NlAlZWWgTXN/

On Mon, 16 Jun 2025 11:46:31 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> A new boolean property is introduced. This will be used to turn
> ACPI PCI hotplug support. By default it is unset.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

I wonder a bit if it makes sense to do this so early rather than just
before it is first used in the series?  Doesn't really matter though.
Just meant I read on a bit before giving an RB on this.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  include/hw/acpi/generic_event_device.h | 2 ++
>  hw/acpi/generic_event_device.c         | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index d2dac87b4a..f5ffa67a39 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -63,6 +63,7 @@
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/ghes.h"
>  #include "hw/acpi/cpu.h"
> +#include "hw/acpi/pcihp.h"
>  #include "qom/object.h"
>  
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> @@ -114,6 +115,7 @@ struct AcpiGedState {
>      MemoryRegion container_memhp;
>      CPUHotplugState cpuhp_state;
>      MemoryRegion container_cpuhp;
> +    AcpiPciHpState pcihp_state;
>      GEDState ged_state;
>      uint32_t ged_event_bitmap;
>      qemu_irq irq;
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 7a62f8d5bc..7831db412b 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -318,6 +318,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  
>  static const Property acpi_ged_properties[] = {
>      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> +    DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, AcpiGedState,
> +                     pcihp_state.use_acpi_hotplug_bridge, 0),
>  };
>  
>  static const VMStateDescription vmstate_memhp_state = {
