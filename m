Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp862840njc;
        Fri, 20 Jun 2025 05:45:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVh40d75I9xdmu+x16V6Kdfcw8UGSKmZVxfvG+8OZdijlRyhYOgyeNCxe6bYvDgS0nREqJ4yOlaLi7G2g==@linaro.org
X-Google-Smtp-Source: AGHT+IFtE5RpF4zAX0EDnSEBwSR/wfv7WvOokaAIvsg9oYVvWaSU2pib7HFVDuJJxR/LuZEZanC/
X-Received: by 2002:a05:6214:4b13:b0:6fa:b9e9:e799 with SMTP id 6a1803df08f44-6fd0a558a03mr38704886d6.24.1750423552427;
        Fri, 20 Jun 2025 05:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750423552; cv=none;
        d=google.com; s=arc-20240605;
        b=k65y4El1IV2yot5GgXaN1G2td8ipeKjm/oDF/zeThOHk2MJg/xj3utp4oElDxUElmR
         EloHnWxZYdZ3TNUQzc3X5rQs2Kt1dWLjtbCO0WW23DNeeOAU56vgHTdv3XsXBpAixUNk
         Dapjp7q0MZ2FZ1N3rE7JAntaPBe0nQdMz92tMAtyx9DAgaiDIRcJCS+TH5i4xNf5kEOn
         HwzO99Wqfk8RuMgqSUW8nR+nKQxoYPXKijNzlwqaQX4FoCXabMeitHCUFpedeCMVQXXc
         1AfcGUiRSZdAz9GeJx2EDBvKW8Cf7+zgSm0mNNIfQPOhfxLJvwT/3HNH9bnjacUh9rjx
         QCuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=ixw2GuPREzzHodVzbvCDgX1hhsFwnJGhUX8+FgDdGdg=;
        fh=4pH3XBwoPKWJ5QOyTmGR3KfICWqdN7lZf1KCwspyJ94=;
        b=Ae6fVKw/7CnPoZtlVamDzxsQDJu4hfkJkoOWTGr7ymx+7Vcb62LGv56vqGQwn+Hwzt
         9q4ofTZZaSQe2dQEWOCbbC67QytLE2+bnvVh0Mh5iiy2/QyFU4wa2DLRoqLJCAO0xbvU
         S6UgMjxja9a5ZEp9lGenNpB2Orbb89QLB/sfos2BaHAD+WAlM390zA7lkP0xYW0xMuOW
         UmH6OGSUeisFHHd3WiI11Y6uQadzejTcGyGGWCh8TvSxbxuX8wf47hB6WelyC6XMMxGk
         /vhAx7UxqBUnZR6Vwtx1zk1A+oil7R5mesmenQi9e11YPNfDmyoB+a9/W7bjJG2ZJQmz
         SESg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UnTSGZ4e;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a24267si152009285a.615.2025.06.20.05.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UnTSGZ4e;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750423552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ixw2GuPREzzHodVzbvCDgX1hhsFwnJGhUX8+FgDdGdg=;
	b=UnTSGZ4en7WLYBCbGT089LW+6cJXj1GcW4ozKNpaaRVnVFWFFsnTS0bfRUt/RDSnjHWd4j
	ZpL+hRwUkmeDcmdrDW/ilsw9iX0+nJscEWZvLNTetFE7a45uKpKeC+NG1N9Guw8xd3mVG+
	qok+NuAUYdtbT7fZAl+CmPmvFpPQsIQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-uFYQ9hlcPsydmkI0FW0ucw-1; Fri, 20 Jun 2025 08:45:50 -0400
X-MC-Unique: uFYQ9hlcPsydmkI0FW0ucw-1
X-Mimecast-MFC-AGG-ID: uFYQ9hlcPsydmkI0FW0ucw_1750423549
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4fac7fa27so865105f8f.0
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 05:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750423549; x=1751028349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixw2GuPREzzHodVzbvCDgX1hhsFwnJGhUX8+FgDdGdg=;
        b=YXerKRGHaWchz7GW+hUZHubA+2uDf7WauFQiN+QXbnrYfTVpNQ70l7miCb2Bplq6XW
         Nx7oZ4KVhzmYEdktOLPpzr0N1risZw2qCjhwLYkoInp/4QDxMDTs0ANx+ZZ/4W/t6S0w
         OmuLLgAUkDmd66196Ybrn71kLSBgx/qhvEoOFZEdlxuIcWiDxWPFk+8YgXlDXYXgdFHF
         I13G6RUW8Qek4peP8rmhARbHPsRv2wK1JRgemf00KLqCXzfrk2gZUF2okjbzIEvlbR1R
         xt0zmxWemrHTFd3vGJTQZmQ5iKaxJnXGCoHkd3hCKF2czSHvETaVguWaNOLmPNVEfIxI
         uUIg==
X-Forwarded-Encrypted: i=1; AJvYcCVGvCCEYOSm5++tuUiEHdBxVjkmO1mjHXsPYKQuyuPuxH2OngKAhi9WFWHTeNZPsllz3obbul9Hidq1fw==@linaro.org
X-Gm-Message-State: AOJu0YzjthrIAkGV1bOu+ChcsSjL9qsuuGCU2f86DAlpweDJuN58dbjU
	yTOBnqdE4h4KoO3/ytpb/hO9DfxhXo9Zzh1LX2TtEcGWqptCmxYRmnyfE1Mve88F6lhvyqYwxlo
	r07sHPy+4Qda8bFGuuP+G6I/zWJSEZi2IDirf4TDu24ratAIQYu/hZgNbDQ==
X-Gm-Gg: ASbGncsH6uHEJCft60GFcUygx5+Vm42mfIr+VXq85HrChc/2SUqMWF+D3C7AUiY9m9X
	SlTu+evnMQEiOvEXdTNLbnbX+MuE2Vf6PlyuCeLBtyYipM6anZrRX6nB+d8RE8TENVMbe8oOyEK
	2hhWdYlGL9h7NeCO/47yNBPkKeMiuxdK1aEHphDdsoFt5flCXAy+bRz7fdl+9BhP+4vXMMNpukD
	ngVztmmWK6w4QumUsYjghXWyMjwv5K4jKpyfmF9tq4quXxI/qw39goNntSe0/kdxRdXa9+z21kP
	ZZ2kGrpA920d
X-Received: by 2002:a05:6000:4283:b0:3a4:f6c4:355a with SMTP id ffacd0b85a97d-3a6d131ac8emr2269669f8f.57.1750423548820;
        Fri, 20 Jun 2025 05:45:48 -0700 (PDT)
X-Received: by 2002:a05:6000:4283:b0:3a4:f6c4:355a with SMTP id ffacd0b85a97d-3a6d131ac8emr2269639f8f.57.1750423548417;
        Fri, 20 Jun 2025 05:45:48 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e98b48asm59359715e9.16.2025.06.20.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:45:48 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:45:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 18/29] hw/acpi/ged: Add a bus link property
Message-ID: <20250620144547.2140006a@fedora>
In-Reply-To: <20250616094903.885753-19-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-19-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1CDJe82S0xvLkTpS7Qk8wckj9fucjEBsnY7CPZZ_vTk_1750423549
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: kK5UaLd0VNkh

On Mon, 16 Jun 2025 11:46:47 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> This property will be set by the machine code on the object
> creation. It will be used by acpi pcihp hotplug code.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>


also with that it's possible to end up with NULL root
if someone forgets to wire it up.

I'd add assert somewhere in pcihp.c
so that we wouldn't end up with wounds from too much head scratching
if it fails somewhere during runtime.

> ---
>  hw/acpi/generic_event_device.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 7831db412b..ef1c1ec51f 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -13,6 +13,7 @@
>  #include "qapi/error.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/generic_event_device.h"
> +#include "hw/pci/pci.h"
>  #include "hw/irq.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
> @@ -320,6 +321,8 @@ static const Property acpi_ged_properties[] = {
>      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
>      DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, AcpiGedState,
>                       pcihp_state.use_acpi_hotplug_bridge, 0),
> +    DEFINE_PROP_LINK("bus", AcpiGedState, pcihp_state.root,
> +                     TYPE_PCI_BUS, PCIBus *),
>  };
>  
>  static const VMStateDescription vmstate_memhp_state = {
