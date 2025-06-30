Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2445906dye;
        Mon, 30 Jun 2025 05:50:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsOFGaiwPcHn+dDMve23PyOQ636hvF057Nz3vMnMut2z77dymowT01qdOiFoBTk5+lNUh8UQXFGLFgYA==@linaro.org
X-Google-Smtp-Source: AGHT+IGXMGcpJKhnYON0Ngog3oRUFicI+TgH8bgW4e1JLtl4vt6DNik5QuScFdD7BT2Azp4barXa
X-Received: by 2002:a05:600c:198d:b0:453:b44:eb71 with SMTP id 5b1f17b1804b1-4538f2148b1mr117810805e9.19.1751287800719;
        Mon, 30 Jun 2025 05:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751287800; cv=none;
        d=google.com; s=arc-20240605;
        b=e4IIepjSU3FU4vAL5n+SIeFm5t5xIEsy/8uwiVlqzOD8HojLu/78fUPOQVdyAh56uz
         fJTF5+BgcXV0RXWQGVpyd4NvcjBGz+6LbHy2uwzENB0NL3KkpfhhhxiEicPvHshmK6S0
         Zjb3RkMhHZns8fIUwiOZehuLYAzDxSQsjLFtf52iHpuCNPkYfXNVf4J3Y95YNtMEM9Bv
         rb85W7+v97Zj5XB/dStfRis6H5VsoJSXb8DU1oHOwzpkZNloKf64fe+AxhOX8NzBwUN8
         xFnWrWlaVIALv1pIiCPbAZOT8RziTe/LQY8djTMG5Vw9S1UbMoC0ROZXcPN6nM4iDfy+
         CquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=0AP9uUM8aGnHj4shpn8UfOWBUsibx2N9PTd/jzhNFKU=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=Adb7Sh2IW+PsYLNK1gdQQnjmE7vo7+4eC7IpAH3aSDaxBSFXEnaUzDWlXdFJDy7TPh
         zHzquxtowJWAvqfcubnCeRVw/4EoVtAIiO8xnn5tuGO+u/GJNsI4NH4NZU4EPLICJV0O
         EK9xI5twENITYvFV85+IH6N+bWwx9Y05azCnwEDTpbTgFSF1tfFz+BzcWITG6gsILvyz
         uS0DCwWQ6nB8Zfxnqhxs77mezPI3aTLlGqPdOKneNXesYzIwcTS9i1ONGPMWeJWYTuGL
         DIoA2l5TXfB0VTjPLKG96UxAR2BWpKg0FiA7NSDNpu0STLVtbHEDlSINMYt3wGjHZ4Ms
         aWxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a0706226si5771577f8f.212.2025.06.30.05.50.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW5b838jpz6DJ3B;
	Mon, 30 Jun 2025 20:49:40 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id CBD151402EC;
	Mon, 30 Jun 2025 20:49:59 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 14:49:59 +0200
Date: Mon, 30 Jun 2025 13:49:57 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 25/32] hw/acpi/ged: Prepare the device to react to
 PCI hotplug events
Message-ID: <20250630134957.00006326@huawei.com>
In-Reply-To: <20250627095620.3300028-26-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-26-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: Z4fXJxGPCd9S

On Fri, 27 Jun 2025 11:55:14 +0200
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
Maybe call out why you aren't following the advice in the
docs for device_class_set_legacy_reset() to use the resettable API. 

One other question inline about setting of the event bitmap in
ged_realize rather than create_acpi_ged() in virt.c

There is not obviously right answer to where that should be but
what you have here seems inconsistent with existing code s
a comment may makes sense if you leave it as it stands.

> 
> ---
> v3 -> v4:
> - add qbus_set_hotplug_handler
> - root bus is not passed in acpi_pcihp_init arg
> 
> v2 -> v3:
> - pcihp_init and reset are put in ged code instead of machine code
>   (Igor)
> - Add ACPI_GED_PCI_HOTPLUG_EVT event depending on use_acpi_hotplug_bridge
>   (Igor)
> 
> v1 -> v2:
> - Introduce ACPI_PCIHP_REGION_NAME

> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 92b931758f..fc84bfb34e 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c

> @@ -427,9 +437,13 @@ static void acpi_ged_realize(DeviceState *dev, Error **errp)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      AcpiGedState *s = ACPI_GED(dev);
> +    AcpiPciHpState *pcihp_state = &s->pcihp_state;
>      uint32_t ged_events;
>      int i;
>  
> +    if (pcihp_state->use_acpi_hotplug_bridge) {
> +        s->ged_event_bitmap |= ACPI_GED_PCI_HOTPLUG_EVT;
> +    }

Maybe a comment on why this belongs insider the GED code rather
than being provided in the event_bitmap from virt.c or similar
as is done for all the over elements of ged_event_bitmap.

Particularly as you get the acpi_pcihp property in create_acpi_ged()
in patch 29.


>      ged_events = ctpop32(s->ged_event_bitmap);
>  

