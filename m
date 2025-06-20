Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp867100njc;
        Fri, 20 Jun 2025 05:53:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9dyh4twVyFX/oUmjY3qAUX1gm1xXxCyf5S25ZXFxG6IHRaiIaK5gICOOwQa+j20efI0zKfFMJlL8Lpg==@linaro.org
X-Google-Smtp-Source: AGHT+IFJ+3HXgmyDbYoDahumBeX77ywkyWeXjdLzNhyGk3pX/nKHQzRKSaB1V66bY/JMGBoSeKxx
X-Received: by 2002:ac8:5cd2:0:b0:48d:50eb:91ca with SMTP id d75a77b69052e-4a77a205601mr36357951cf.15.1750424038791;
        Fri, 20 Jun 2025 05:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424038; cv=none;
        d=google.com; s=arc-20240605;
        b=hfjRfCnqcBGPb0eeYP0x3//tm8YUFusbJ25y1Y4Yx6DloPcUxLaQCt37HU6DRNCOnG
         fb9gIlyWNBoQbIoPGGKUZna67pCpvwxpmZ3LXt741B0nkhE74dnng9hNOUa8kS6B0dOt
         XlbnTwiWZ6bbuQM2bX9cd3SzdGxmFd4mfx+cjUYcX4OHAhPT3CkjS8DAgo5gE4xPav5v
         bPurJP8p2hSZOJWekeMyDk6TJtU+VCGEq8xBPJ0aYN9t+/EO61BLD6CEds2w1bg+Em3R
         acC5zAKtgLtsO9hCh/yOJhVkSwoYuJZOpu78wfLA75CUSVku/3SOSLcWc66L3EJoXo1+
         0UHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=gpJ9He9GeILtZKTHNA5OGPxDe6Vm4FWISqx7nV9RGjw=;
        fh=I3niNZkc9+IkXND7y+D8t79q6f5qKBef1rGlghNDRJ8=;
        b=GKAeZsDzz0bwrvf10KEyeOsMlB36+AGAy6lybBy+SDyDWisVIJJoFCIk5dFxEpOhVb
         2v41rYbMvLJ2sgF9ulWoqQJ4gSpmBqCCNueSS8XQ789DEadZ9+EhJhkH8nYLXZphwyc+
         WOHNmOavKi8ptTb5tmUY/29l6T64XJhoxQzW42Xo+Hq7XZNEkbEui7MaL506TQekHPbH
         YbYVkBqRT4/5ehVCaVzYKE6RFmfhv9R3AjX8TjIUrcRgICJj9azYqLnBjofPURa14bwM
         MCKLZgFSMat1lzG+ouKUQqX01Zg+JhnxxtNXSdo8iEx3RO97XtdTIhFDWEbiQT1X5TW2
         so6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JrbH3PbR;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0b09a5si16928341cf.314.2025.06.20.05.53.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:53:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JrbH3PbR;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpJ9He9GeILtZKTHNA5OGPxDe6Vm4FWISqx7nV9RGjw=;
	b=JrbH3PbRpH8Iqfu+F37GkaJu4JBqHWMlc8KU4XOJ6au9ZmvL3bbkz8ECqYerFNMeqh62KZ
	yXt63bVacTfhWIbElGmhtc6cPQMS6Z2cTW1xFw5jiSIBbu0nQX+x2km77rDzfHYOvZ+1YW
	AZdakXoMgm+G/iisZmvEB32ADPnJ7PI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-Y3gr341mNgGSN3AuCz4FKA-1; Fri, 20 Jun 2025 08:53:57 -0400
X-MC-Unique: Y3gr341mNgGSN3AuCz4FKA-1
X-Mimecast-MFC-AGG-ID: Y3gr341mNgGSN3AuCz4FKA_1750424036
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4fac7fa27so868122f8f.0
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 05:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424036; x=1751028836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpJ9He9GeILtZKTHNA5OGPxDe6Vm4FWISqx7nV9RGjw=;
        b=KblbSiuwidsJY2dS/265trY5fBCwYgsSbsjw8ZkAD9vcwe+QUDkhUrq6vjTLz6hBtr
         WTMlM4yiXgtj/RPGW7LI1Z/t7K4IUbpWH4ZdpR0tYBDURhHts7VARVcipkPIT0yb3jNy
         MxuMjltBox+vxY1C9oVED16ssIszOEKflkBZLSi07PeZCat6PtRg1z6AMDgSd3LEOpOG
         q9lKEn+l2v+O2v+RPI4nVtndP8/01BDKtwZpDpulQrW05oFl2+Yaq7saNEOB4dTIYjzS
         0TkrEEwlJv986yCrxOM639m0f3UxC6WhG8YoRxZ4+enHqD0n/cJjohxM+xuRUAA4cbOF
         PCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhZ9DA/JTqX4dKEsw55gico+feg5vRLMfXBUdaHb3EaPZB7t2+t0cwRCQypOhkWPtgke61fQSfxewmzg==@linaro.org
X-Gm-Message-State: AOJu0YwJEZWoyWieG+Db86Qn/T1vTqbhxGldr8NlQ1TeY736r7xj+Ot6
	9S0uN1xuvlfROzfNLYHQTQPw0osMwWOJ70KkGK8bKfvygBXjNabxh0cF1FD/R22YHRP4sjPPn9R
	XuOujgC0RDnR+Ki+5LLJZYX0ndXQZZdhFmhno4x7dPz3HjY6qa18Q5tzrSA==
X-Gm-Gg: ASbGncvEDgl2ptnWL0ZdiddqcHpqWNNBBiYCzr92jsce8u17DG1KzRcO/vbZAxtWB/P
	JVXe5TDLc00GSC73OFwolHXMFQrm5teO9gB6Kv8Udy89kjWjLLNRzLxlocj7dYYm5eR7CLADPo8
	xmdjpZsxPtQH4Xjt3XYrIm/bDHtQ7fATW70sRlRmV338ZmyAUnfJaCK+DEZ53/U7dtQq434aACP
	/OSjohUxSeonDzAYP9JqQip/6uRFdY/MPaRrgTpCen9e3s3qD88UezL1gMDCFkkuiUeyD8cyilC
	kx5xTm5oiaku
X-Received: by 2002:a05:6000:645:b0:3a4:fefb:c8d3 with SMTP id ffacd0b85a97d-3a6d130e802mr2393210f8f.40.1750424035985;
        Fri, 20 Jun 2025 05:53:55 -0700 (PDT)
X-Received: by 2002:a05:6000:645:b0:3a4:fefb:c8d3 with SMTP id ffacd0b85a97d-3a6d130e802mr2393192f8f.40.1750424035556;
        Fri, 20 Jun 2025 05:53:55 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646dc66fsm24404625e9.18.2025.06.20.05.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:53:55 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:53:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 21/29] hw/acpi/ged: Call pcihp plug callbacks in
 hotplug handler implementation
Message-ID: <20250620145354.31f709ad@fedora>
In-Reply-To: <20250616094903.885753-22-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-22-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _fqLPuusXe-yuLWOKIyE2ymevIYKEndJSBoNEZOiudg_1750424036
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: +MKqBMfh8Sig

On Mon, 16 Jun 2025 11:46:50 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add PCI device related code in the TYPE_HOTPLUG_HANDLER
> implementation.
> 
> For a PCI device hotplug/hotunplug event, the code routes to
> acpi_pcihp_device callbacks (pre_plug_cb, plug_cb, unplug_request_cb,
> unplug_cb).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

I'd put that before 20/29

Reviewed-by: Igor Mammedov <imammedo@redhat.com>


> ---
> 
> v2 -> v3:
> - remove else block in acpi_ged_device_pre_plug_cb
> ---
>  hw/acpi/generic_event_device.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index b4eefb0106..2ae9ad082a 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -18,6 +18,7 @@
>  #include "hw/irq.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
> +#include "hw/pci/pci_device.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  #include "qemu/error-report.h"
> @@ -236,6 +237,14 @@ static const MemoryRegionOps ged_regs_ops = {
>      },
>  };
>  
> +static void acpi_ged_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> +                                        DeviceState *dev, Error **errp)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
> +    }
> +}
> +
>  static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>                                      DeviceState *dev, Error **errp)
>  {
> @@ -249,6 +258,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>          }
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>          acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_plug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
>      } else {
>          error_setg(errp, "virt: device plug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -265,6 +276,9 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
>          acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>          acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_unplug_request_cb(hotplug_dev, &s->pcihp_state,
> +                                            dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -280,6 +294,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
>          acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>          acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_unplug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -510,6 +526,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
>      dc->vmsd = &vmstate_acpi_ged;
>      dc->realize = acpi_ged_realize;
>  
> +    hc->pre_plug = acpi_ged_device_pre_plug_cb;
>      hc->plug = acpi_ged_device_plug_cb;
>      hc->unplug_request = acpi_ged_unplug_request_cb;
>      hc->unplug = acpi_ged_unplug_cb;
