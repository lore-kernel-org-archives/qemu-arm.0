Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp808768njc;
        Fri, 20 Jun 2025 04:09:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgz5iSMDVyOgAGcv/mfwGwnz8iBxrWZuqqnr/zY4W8PHTyjiJtcBIc14/Yhl2vq/NgO45Eb4yQjGvGcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGd7PEnzwcS9hysBQBifmwMR00WzTp/xN5M49wiwGATyQ8WN27vhqCaaJHd+S1NfTsox1I/
X-Received: by 2002:a05:6214:5f0e:b0:6fb:414:77b2 with SMTP id 6a1803df08f44-6fd0a599c8emr32211646d6.41.1750417787158;
        Fri, 20 Jun 2025 04:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750417787; cv=none;
        d=google.com; s=arc-20240605;
        b=OR5h8FOwWWgQ1wrF5NpVz1EkxnWWHnYN34Don6VhQ6r8tRno8G1PeyFZQj0lXWnNxH
         3szJz8YLt/yOLWLUYQKFqSJ703Ciw3T5/1E3jWExNLqoaaaViJIPGRBMjtN1v1Bofckq
         MNkV0S43MNRZHe9oMzh7EwfK3TTpjdABbLdMA2HOhBylSDt1f/bEQQkt3s+gZMNWJpg8
         6w3GnBN+9nZCtu5+xGDPygTuBFF59gjSZYUDpx7D5r0P1akd34R5e340BqdclMnrMg5F
         /9WQgW6KryK/1G1t5K94h+//b7F51SzBOc+srP74tKxPsukGF2/or4BM9R/+ZTXY/lbM
         Rp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=0OqQ2p2Hgz2qUTH7fsIcOPZtBPS8OhJGUFJyKwSHi/Y=;
        fh=dgoNERm0spHo5r2X5z2k/6T3UN1/aR/ebuEkwlsPpbM=;
        b=Z37kyJjUKSlONpEwg/ypSCCyvoh7MB59tTG2avIXiAieLIEaD/ZvB+C2gaucsuZGem
         gLwHlEInmiyBkUVDe+lkiGQz+p2vEgXnINGGQdhPGHmXg/6Yb8NW8epv4LQkGRUZW1N/
         liVv6H+JYbEtEEE4Sj97vh4C+LpEh51mL2yxeg3FIvVRxyJnRs8AkUutAgfoVTz9aRb/
         CjQSKwOGRVfCM5qlAZW53jtRTcBWy7VO69EBRIB0nyPLjsMk6QFntImw9M+Y2ghv6fDx
         L6QQLqWCKveWxOKSrNGUj+eNUf6n59Wf3s8oasrQZ+I5gVR/wVgQoETnNHDQvvsIWiPB
         YDBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kn8HA7g3;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd0959e38dsi18029746d6.385.2025.06.20.04.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 04:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kn8HA7g3;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750417786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0OqQ2p2Hgz2qUTH7fsIcOPZtBPS8OhJGUFJyKwSHi/Y=;
	b=Kn8HA7g3zPqz8fAn83SHPtSkRFKBUVgppRtAAfhKrnl/irxhBz1yuZ/QHEokxWm8Pnw0cj
	q4LFwDjLA7qK7p5VEhaQ6VWQTe6bPq5MW51Bw+vkVlfVwQ2U5e3vxs7NcHfTHHoiEYNCiI
	J3AubfGqSSZADtWtxk1upE2/X7ca340=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-kot4m1ZsObO1ccJ3R3FVxw-1; Fri, 20 Jun 2025 07:09:45 -0400
X-MC-Unique: kot4m1ZsObO1ccJ3R3FVxw-1
X-Mimecast-MFC-AGG-ID: kot4m1ZsObO1ccJ3R3FVxw_1750417785
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d244bfabso13979285e9.0
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 04:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750417785; x=1751022585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OqQ2p2Hgz2qUTH7fsIcOPZtBPS8OhJGUFJyKwSHi/Y=;
        b=Np+ap0vzqCOwRfWInwY82yFdYUii+OemAycbO7Cz808yt/IH4b79IhZIK0kGxtr8VN
         C6sEZvycSWsIhFZA6Vya7eE3ACpfwMEvVNWJ7jxRKGn5e3fHb7bd6tDEL3FBctY8TJHx
         58ItdVjZWd1dZAiaQdThMmkpiTF0of4m500VbbvnAXLGwCwcpCB5oYHIwAHEFLigSJ0Y
         fut4tqSNGKkMnVkUknxR2zV+GDvAkK+AVr7lB+YlczifJlQHlDQL3bL9ZtD1XUwx/MEm
         qlwvYmiwd/WCFd+IdOllcrdl3ssiwiGb++QHw3eAfA05aUyi3f+PIaPBrDWX9YBIJggX
         7N7g==
X-Forwarded-Encrypted: i=1; AJvYcCWs7JvcDdSi4XazqCUSrPcTpyvFrCuZZdppHdlWq6ahs/7G3yTjMYNezgRqqgFXaqUPQ4vnFKeFDnhtLg==@linaro.org
X-Gm-Message-State: AOJu0Yw/KLIePSYh8uH2+mahLTYOzhJ8nbwU5EOMCLuEyKKHMXB7qmiy
	bikGpiIVJGsUElydDNZ5f3YuTn2L4C3KAFKQC/ssT2kn2QdMpMXGPQLxY+pR2k0JfpNko+WrT+3
	IRhSlr/kZGBkT3Sd/XbM5JR+Eyt1JeLRgN/oRAda0UCJ5R8JHmdwew74Q2w==
X-Gm-Gg: ASbGncu6RuPUsVKfnwvAGoigLihU4csidniUmvkhilzOrFqc4j7YVxxOnsWl4vfL7r7
	DjCYykzI4p6qv6P7hOZ3T7hlEY3Fc/+HPvlS8jk/D/sBgAO9bSI/ZM65gZjbAfjkk3DGKfwar8N
	6RaNC3FoYz7uLVNqPPZplZO7XdAYW0XaFDwTp5E4Mng4p7rtouD7YFT8LNiF+Rq6cAxJb06sgsq
	3RwwhWK2Z9cj7qoARlg9rSnMFV0ItcMIdjOdFANMF3f0mpXQ2qCRj2KVDIRar80CMG2iMd4urG+
	vJ2gpLwNzsVl
X-Received: by 2002:a05:600c:3545:b0:442:f12f:bd9f with SMTP id 5b1f17b1804b1-453659d44f9mr19572925e9.27.1750417784188;
        Fri, 20 Jun 2025 04:09:44 -0700 (PDT)
X-Received: by 2002:a05:600c:3545:b0:442:f12f:bd9f with SMTP id 5b1f17b1804b1-453659d44f9mr19572595e9.27.1750417783791;
        Fri, 20 Jun 2025 04:09:43 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm31618575e9.1.2025.06.20.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 04:09:43 -0700 (PDT)
Date: Fri, 20 Jun 2025 13:09:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
 <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
 <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 02/29] hw/acpi/ged: Add a
 acpi-pci-hotplug-with-bridge-support property
Message-ID: <20250620130941.6c0e6ff8@fedora>
In-Reply-To: <20250620095308.00000d16@huawei.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-3-eric.auger@redhat.com>
	<20250620095308.00000d16@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H-qS4WepY4qXzGjJCgYh-2YqL6X1Cku_GLCv-B1p7hU_1750417785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: dZdyJFwadWk/

On Fri, 20 Jun 2025 09:53:08 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Mon, 16 Jun 2025 11:46:31 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
> > A new boolean property is introduced. This will be used to turn
> > ACPI PCI hotplug support. By default it is unset.
> > 
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>  
> 
> I wonder a bit if it makes sense to do this so early rather than just
> before it is first used in the series?  Doesn't really matter though.
> Just meant I read on a bit before giving an RB on this.

Just before would be better, but it doesn't really matter.
I guess Eric can rearrange that if there would be need to respin.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> > ---
> >  include/hw/acpi/generic_event_device.h | 2 ++
> >  hw/acpi/generic_event_device.c         | 2 ++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> > index d2dac87b4a..f5ffa67a39 100644
> > --- a/include/hw/acpi/generic_event_device.h
> > +++ b/include/hw/acpi/generic_event_device.h
> > @@ -63,6 +63,7 @@
> >  #include "hw/acpi/memory_hotplug.h"
> >  #include "hw/acpi/ghes.h"
> >  #include "hw/acpi/cpu.h"
> > +#include "hw/acpi/pcihp.h"
> >  #include "qom/object.h"
> >  
> >  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> > @@ -114,6 +115,7 @@ struct AcpiGedState {
> >      MemoryRegion container_memhp;
> >      CPUHotplugState cpuhp_state;
> >      MemoryRegion container_cpuhp;
> > +    AcpiPciHpState pcihp_state;
> >      GEDState ged_state;
> >      uint32_t ged_event_bitmap;
> >      qemu_irq irq;
> > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > index 7a62f8d5bc..7831db412b 100644
> > --- a/hw/acpi/generic_event_device.c
> > +++ b/hw/acpi/generic_event_device.c
> > @@ -318,6 +318,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> >  
> >  static const Property acpi_ged_properties[] = {
> >      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> > +    DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, AcpiGedState,
> > +                     pcihp_state.use_acpi_hotplug_bridge, 0),
> >  };
> >  
> >  static const VMStateDescription vmstate_memhp_state = {  
> 
