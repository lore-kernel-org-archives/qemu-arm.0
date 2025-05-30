Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1200362njh;
        Fri, 30 May 2025 08:00:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKNT4gc3vBXILcLYPlCDYK3G5cfokjMDFai0vxRtsdffP/bbFtTj2xG41zI8u8Ecg5SFGVpS8x/Bf6rg==@linaro.org
X-Google-Smtp-Source: AGHT+IHohhcD0gpMqxxX3eBHtpgVUpaouYf0aJXQjgp9miNn6xIu+HPsh/3g9gWiFmL+V6Nqn9mM
X-Received: by 2002:a05:6000:2002:b0:39c:1f02:5409 with SMTP id ffacd0b85a97d-3a4f7a43df9mr3036567f8f.9.1748617222631;
        Fri, 30 May 2025 08:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748617222; cv=none;
        d=google.com; s=arc-20240605;
        b=gZuTtYxrzwPnqRKyqyNamj35+rDEHdvJ4tDDCempKtXh1b076q3knksJXaGRof5JVX
         StIsnhoQ0ju2zAvs/G6+xIfiPXguEoHOxP/oZk3eSAKM3mXztwFcw5NEh8Q1zmQCmgye
         0DGGYCnvqbTsMuwSrFet1acneWmcvKKCl9XW+O8nMa9MvuiUImdKOY5AzUg0uksFtxRc
         AiH+GHGERINjTHxyz2xhQUcM7WWIdaQyhR/S0/BJpP1Aml+CUWBC0JqYD4BR3PWZSGwf
         gSJX/wD4c89LekphsqTALH1Qmw54llzQDVy1X/fxuiggwlZLryJi8pWkTsdhVTkfPCuW
         ueQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=voX3LnRRdj4ccj94oU4hSMcU9h9zEWWpQpV9j66ZUcA=;
        fh=w8UUgJXasrx2vm0DJT6tUEgqUiq9oBtxfZNWT1bHQ8M=;
        b=dgAMzNcvqtnGkFC2NXYCrfQHoK3AP52j9K/+3WgSt+eqB43DEvNf1MtOAD6I4k6AMV
         rv7P96ExIpcmB12GJK+QyB46vWE8g8w/S/dZiva+O4QoYBe5lLXJV1S761r8a7g+rFx/
         FbFF9/a7hgmDiSrnKPG9Rh+mjR54efUGEdhY6f1dVd6fSaGkSDyuFPq+yLTwqQKifqCj
         rfhUSjACr1w5Sj6Sn3lxgbRE1TqEwCnRWruAc2vn+n1pxQ3p/C75ExN/wuOeSwB8MKTu
         gPxw8vNtEL6lOtJ7BujSLOpR+b3mLrx2UAoIqEdQBwYbFa6LthYS5XPRFxC8O3ugcDZs
         X5Xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4f009b457si3034907f8f.809.2025.05.30.08.00.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 08:00:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b85wl0mC0z6K9FG;
	Fri, 30 May 2025 22:59:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B752A1402FC;
	Fri, 30 May 2025 23:00:21 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 17:00:21 +0200
Date: Fri, 30 May 2025 16:00:19 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 05/25] hw/pci-host/gpex-acpi: Split host bridge OSC
 and DSM generation
Message-ID: <20250530160019.000061d1@huawei.com>
In-Reply-To: <20250530140516.35db4d52@imammedo.users.ipa.redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-6-eric.auger@redhat.com>
	<20250530110227.00003341@huawei.com>
	<20250530140516.35db4d52@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 9JXkWJkQTCbk

On Fri, 30 May 2025 14:05:16 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri, 30 May 2025 11:02:27 +0100
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> 
> > On Tue, 27 May 2025 09:40:07 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >   
> > > acpi_dsdt_add_pci_osc() name is confusing as it gives the impression
> > > it appends the _OSC method but in fact it also appends the _DSM method
> > > for the host bridge. Let's split the function into two separate ones
> > > and let them return the method Aml pointer instead. This matches the
> > > way it is done on x86 (build_q35_osc_method). In a subsequent patch
> > > we will replace the gpex method by the q35 implementation that will
> > > become shared between ARM and x86.
> > > 
> > > acpi_dsdt_add_host_bridge_methods is a new top helper that generates
> > > both the _OSC and _DSM methods.
> > > 
> > > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > > Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>    
> > 
> > Makes complete sense. I've had local equivalent of this on the CXL
> > tree for a while as without it we don't register the _DSM for the
> > CXL path (and we should).  However, can you modify it a little to
> > make that easier for me?  Basically make sure the _DSM is registered
> > for the CXL path as well.
> >   
> [...]
> unless CXL is root host bridge, current _DSM shouldn't be added to it.
> read on comment below.

I'm not clear how this is different from pxb-pcie where we do have
the _DSM. Both are pretending to be real host bridges.

> 
> > > @@ -124,7 +125,17 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
> > >      byte_list[0] = 0;
> > >      buf = aml_buffer(1, byte_list);
> > >      aml_append(method, aml_return(buf));
> > > -    aml_append(dev, method);
> > > +    return method;
> > > +}
> > > +
> > > +static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
> > > +                                              bool enable_native_pcie_hotplug)
> > > +{
> > > +    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
> > > +    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));    
> > 
> > These two declarations seem to be very much part of the _OSC build though not
> > within the the method.  I 'think' you get left with them later with no users.
> > So move them into the osc build here and they will naturally go away when
> > you move to the generic code.
> > 
> > They end up unused in the DSDT at the end of the series.
> > 
> > I ran a quick GPEX + pxb-pcie test and we do get the odd mix that the OSC for
> > the GPEX say no native hotplug but the OSC for the PXB allows it.  
> 
> It's fine for each PXB to have it's own _OSC.
> Also current incarnation of ACPI pcihp doesn't support PXBs at all,
> it would be wrong to enable the on PXBs.
> 
> Thus I'd avoid touching CXL related code paths from this series.
> 
> I'm working on extending ACPI pcihp to PXBs
> (for the same reason as Eric does for arm/virt, i.e. enable acpi-index support there).
> I can add CXL bits then if there is a need/demand for that in CXL land.

Ok.  My original motivation for _DSM on CXL was function 5 to stop Linux messing up
the reenumeration which I know has been rejected upstream for a bunch of
compatibility reasons.  Anyhow, that's a future problem.

Thanks,

Jonathan

> 
> [...]
> 
> 
