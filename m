Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1087117njh;
        Fri, 30 May 2025 05:05:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0OSxebJw8SAeRSGJL1VitXX03ph93Xx6JyfzL1r7qhMTGRyV7/SQ+Sktp/RMn04kF07myjcXVEebEvw==@linaro.org
X-Google-Smtp-Source: AGHT+IHqnNflY7KY7e28xBX83TVv6Ce+R4P1v4hUaiXpLfl3AhCWgwIcAkSFi4EPFYaJX6Tm6Wvs
X-Received: by 2002:a05:6512:10c7:b0:54a:cc76:1676 with SMTP id 2adb3069b0e04-5533b931d5cmr1033622e87.44.1748606724163;
        Fri, 30 May 2025 05:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748606724; cv=none;
        d=google.com; s=arc-20240605;
        b=dxjdbv0LrG/c6VKcPtd+rjpxuo2NM52b3s6VYMhhNcs8DO+dIiDwScKDqc+gQeyCzB
         apAnFizLrGfM4/b2PcYCjiZTk8g3SV6tcyH/QNQkhNePA57Fhzm5z6c1vS85Noq4yWXF
         j5RXt8hC/XJp2IM5P8Jf74wVJeUvP0SxmkSD7uJduj6TLyIJZ5SQuDuNjhWXo7kOpwBQ
         OCfYfI+I2Cv2aeJwxa8crxhoWoDvbo86wUaGku09sGV8Ojkqdzyy5nOv6vbSQg56OBzU
         9X1+kuPvd+R51FwoDPmevKq2NljdNVQltWa+QqNttlrpKr6XTdQSrqIgpi5U6YRITs3W
         rRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=5KgZGfKxKfVm7q1uhDmdW51xf0DVEF0x0J06xjlB0mA=;
        fh=xVuF0hZT/Hl+UXK2STiYTZHR7ue3OWWQYp+dHRZmQ3E=;
        b=b1Eut5WgCZ91hYdfnZJDW6FUnLO7JJ1lFDMJebXXwI2c+XipiK7xIPqIgyRv4NBFl1
         BX7GANGWRhSfclWBBHezLc3BJGdT0xrr7Erk/zeUNXlPgUKQqKx1ipSi6tNVhNSE7H65
         GXa2x5cLRUqIr957tV/jCMNHQa6dww+fYyzxUy4ZyFwyjTwGfF4MFYfOIUACzzbX5pth
         zKKHUyIhVWHIusj/rGCJH1XWh2TdpZbHSLTc8PPoDuoRpIcaKDL9smfzl/7zF98Yok0p
         22GISYTYWN6kcdjgPIIv2+6kb3rCyzI1VKUMFe4FCaJUTLbkbfVLGmfwqWCMzfB8vgRs
         jRLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NkI4swLN;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 2adb3069b0e04-553378ec776si1566841e87.450.2025.05.30.05.05.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 05:05:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NkI4swLN;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748606722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KgZGfKxKfVm7q1uhDmdW51xf0DVEF0x0J06xjlB0mA=;
	b=NkI4swLN2CsySWZJTNjDXGX5q+jFeHZMiVfkm3BBG2lmm/X/D1Yvy18Ume504sJYkzh6+j
	Wq6uoHDlnEVkPJP4cr3Bd/CjTTCsiSDXPNxtfqvIxnmbiauOO+RF3wdmf4hMTw6OCMesU7
	RKFN81y9u8c2amdP+ZjzPVN7Lij/+0k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-S4cxndmUOZGZE3rL5Vke3w-1; Fri, 30 May 2025 08:05:19 -0400
X-MC-Unique: S4cxndmUOZGZE3rL5Vke3w-1
X-Mimecast-MFC-AGG-ID: S4cxndmUOZGZE3rL5Vke3w_1748606718
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso130625f8f.0
        for <alex.bennee@linaro.org>; Fri, 30 May 2025 05:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748606718; x=1749211518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KgZGfKxKfVm7q1uhDmdW51xf0DVEF0x0J06xjlB0mA=;
        b=vz3gkOlzymYPXdg8dTrcL7ax6q8GH00YGAwtrZleLLBgNLXo/hsKM4lTDCT2WvrQi4
         EvOrlXv1n/+xArvFywjvOKvCeJps12F+yFf2tdY0eTBCUdmXlJhsttEGdMCppE39j7qf
         xqD/hGvDcyx5PPdlxwBil9RXw8C5iImrHMUTjthdwTiZYbPmOLXHT5r9xC5410Cwlfo5
         QQ3nekMEWAzwWMNMOi5iTw3KJor78qP1CYx56TM1ArioTaC79RSgtWvQ1ZncQuR00Xgc
         KxlBpT1NU5uezjm75Irjhgrwn/WeYbR4hkpp+ivQ02oNQbiuTQ9MgdeqglD2NU9QQnCh
         n/Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUXb+WpSt2Tj0oHoEYM2ffNCzJZNzonJT4Lfv9oh1GCQlgzmRWhip0Avei3bLmoYVNt20rUF4GgM7PcZg==@linaro.org
X-Gm-Message-State: AOJu0YxgzejjZgjs6C8sgsAML4SkCZjlZL4rOB+EiJA9WG48yEdSWGuP
	mkz6zmPBEkL/mYOpo/4AOKrbKsBu0m3qun2JdBqNEMIhpxY7HLgKb8V4/pjSxeirhThbI/Qzacg
	sUIErczHQ8A68d9tc7AwZ3AAq8AwdqAoC67VyYvp8XAhf/cO5WGKA1PLVzw==
X-Gm-Gg: ASbGncsE1qVY3ZnlYpeUSR8o4j1vbjne3qFOxRziNxktPuT6bhAsaJjO1JdoRDn5QES
	ZReLcPbmKl4VEA0GPD1MPNQ30AczUFpIc3y44KU/VZjv2df8NUbJARbFpXkbCmg1zpLgCu0a5qd
	oSuwp43YCNFQWwvNq2jLU8Lk9m6zpLLteXkJQwOjnxwmavM73GBwZ6797AYfQPECm7ImrwLRILR
	hugr5H/BeIXg8K0R3XKgn22SAOVn8l7RghF7jQrXpI2idyF5rnUPX6nI1Yj9Y7ehs1OYFKCEqr9
	jmTu/GFQFzyG+fxDIhGdR8RrX2w2kpI5
X-Received: by 2002:a5d:4ad0:0:b0:3a4:f7ae:77e8 with SMTP id ffacd0b85a97d-3a4f7ae78f2mr1973359f8f.15.1748606718080;
        Fri, 30 May 2025 05:05:18 -0700 (PDT)
X-Received: by 2002:a5d:4ad0:0:b0:3a4:f7ae:77e8 with SMTP id ffacd0b85a97d-3a4f7ae78f2mr1973323f8f.15.1748606717624;
        Fri, 30 May 2025 05:05:17 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971e4sm4699834f8f.65.2025.05.30.05.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 05:05:17 -0700 (PDT)
Date: Fri, 30 May 2025 14:05:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
 <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
 <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 05/25] hw/pci-host/gpex-acpi: Split host bridge OSC
 and DSM generation
Message-ID: <20250530140516.35db4d52@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250530110227.00003341@huawei.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-6-eric.auger@redhat.com>
	<20250530110227.00003341@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xzB-LjD3vMRuXAwmt7ZTg-aCClvfiIv9O15PYniSrug_1748606718
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: B9sUm4f6uHH5

On Fri, 30 May 2025 11:02:27 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Tue, 27 May 2025 09:40:07 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
> > acpi_dsdt_add_pci_osc() name is confusing as it gives the impression
> > it appends the _OSC method but in fact it also appends the _DSM method
> > for the host bridge. Let's split the function into two separate ones
> > and let them return the method Aml pointer instead. This matches the
> > way it is done on x86 (build_q35_osc_method). In a subsequent patch
> > we will replace the gpex method by the q35 implementation that will
> > become shared between ARM and x86.
> > 
> > acpi_dsdt_add_host_bridge_methods is a new top helper that generates
> > both the _OSC and _DSM methods.
> > 
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>  
> 
> Makes complete sense. I've had local equivalent of this on the CXL
> tree for a while as without it we don't register the _DSM for the
> CXL path (and we should).  However, can you modify it a little to
> make that easier for me?  Basically make sure the _DSM is registered
> for the CXL path as well.
> 
[...]
unless CXL is root host bridge, current _DSM shouldn't be added to it.
read on comment below.

> > @@ -124,7 +125,17 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
> >      byte_list[0] = 0;
> >      buf = aml_buffer(1, byte_list);
> >      aml_append(method, aml_return(buf));
> > -    aml_append(dev, method);
> > +    return method;
> > +}
> > +
> > +static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
> > +                                              bool enable_native_pcie_hotplug)
> > +{
> > +    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
> > +    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));  
> 
> These two declarations seem to be very much part of the _OSC build though not
> within the the method.  I 'think' you get left with them later with no users.
> So move them into the osc build here and they will naturally go away when
> you move to the generic code.
> 
> They end up unused in the DSDT at the end of the series.
> 
> I ran a quick GPEX + pxb-pcie test and we do get the odd mix that the OSC for
> the GPEX say no native hotplug but the OSC for the PXB allows it.

It's fine for each PXB to have it's own _OSC.
Also current incarnation of ACPI pcihp doesn't support PXBs at all,
it would be wrong to enable the on PXBs.

Thus I'd avoid touching CXL related code paths from this series.

I'm working on extending ACPI pcihp to PXBs
(for the same reason as Eric does for arm/virt, i.e. enable acpi-index support there).
I can add CXL bits then if there is a need/demand for that in CXL land.

[...]
