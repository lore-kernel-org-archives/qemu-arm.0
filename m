Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1012338njh;
        Fri, 30 May 2025 02:28:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVf/waEcK1jf2GPCiowZuhMWeS5ew1aV1PdMeaKfLJ4GYjZR8uYTLCW5gHCXIzzlYrKlusIu7/0CoDxA==@linaro.org
X-Google-Smtp-Source: AGHT+IHEhZ1cI9D/PwOEjoHZY4lTm8spziKjlfhxQDqGzTrBKPyGtIbMmI7U/OkIxhS9v3ViUCUB
X-Received: by 2002:a05:600c:4e4f:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-450d880a7e1mr13386185e9.5.1748597294525;
        Fri, 30 May 2025 02:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748597294; cv=none;
        d=google.com; s=arc-20240605;
        b=XO+OXmQ6jZnKJXGGCZaoZnGPfD2A+Sc2HHB0vSfnrvKDLRcEqvc/g7U4x7LXwNMN7T
         YldziqVcVU4rQDOVUUH0OZENifmzjhghHvvUO4PE33nzwnRQUg0zU0Hvffe+iPRome9T
         85eJjMSo22Rf5zmQxU5vawnLTWRF01RFB62BRcFbjTC2G++bVGqUWlOw2peFZpIRTUiS
         Z3IWZ5anUp52XJXVLoq/XU+Qaqn0XVrKnzZ/BPSy/7eU0W8taNocjnyiQZTR3oHU7dQr
         K3rVq/Gtb4xajB0aYoEaxFhJ0hC7l9nEnBhI1aRMRq4hLHnjH241w7ZdV8RCrSe9WsFR
         aZyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=IGiLp3otD8M+Ao9xy4/n3Hf/eg8+n544+23dcvtwCYY=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=IFfUFRexCGik0ZwSkLrrpO4UhiXGVdJaS+ximSEFzx8H0WpG4ROxOzmkHUI2acFO/7
         RtyvKe3zz+FLf44P0w/qxTeHzVf56NBZ2q4fI48zQzn6kpgi+Dx/1tn7MCPk+Szmybiy
         gcNCfP+h2ujSx/OxpRKLAT1yMU3Cav6IDPhA7lJMUaJGbksrpQhTAygCrJ5HzB8TdPVD
         e/zA8TxDlMbw6KOucQ55tHcxd7v14uyLrIy8nJkRqClUFVFaTAYvnuFs1uhNdhYNKM68
         U86e0GCTzkFG0sdo7/94yz8lI2aSPtSjjp1sGxGUpf/KGlFj/BUAIASjMHOr70VeUXq5
         98UA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4f00958a1si2444747f8f.670.2025.05.30.02.28.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 02:28:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7yZw2pKmz6GFDR;
	Fri, 30 May 2025 17:28:08 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B2A0A140516;
	Fri, 30 May 2025 17:28:13 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 11:28:13 +0200
Date: Fri, 30 May 2025 10:28:11 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 04/25] hw/pci-host/gpex-acpi: Add native_pci_hotplug
 arg to acpi_dsdt_add_pci_osc
Message-ID: <20250530102811.0000648d@huawei.com>
In-Reply-To: <20250530102711.000034eb@huawei.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-5-eric.auger@redhat.com>
	<20250530102711.000034eb@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: GAbCLnkhUVWg

On Fri, 30 May 2025 10:27:11 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Tue, 27 May 2025 09:40:06 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
> > Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
> > native pci hotplug.
> > 
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>  
> 
> Hi Eric,
> 
> Makes me wonder what we should do for CXL - I was expecting
> a very similar change.  Currently seems like those always
> allow native hotplug (__build_cxl_osc_method()) on x86 and
> arm64 (patches on list).
> 
> Maybe that has only been working because the kernel is reading
> the PCI _OSC first. Or it's always been doing native hotplug
> an no one noticed.  A quick look at logs shows the kernel
> first gets told no, then yes as it queries the two different
> _OSC types. 
> 
> Looks like I should fix that _OSC then it should be carried
> over to this as well (or if you don't mind adding a trivial
> patch to replicate this  patch for the CXL _OSC, even better!)
> 
> Other than that, this patch looks fine to me though I do wonder
> if we could unify this with build_q35_osc_method()?
> I'm not the best at reading AML generation code but whilst
> they are written quite differently they seem to be functionally
> very similar, more so after this patch.
> 
I should have read on... Sorry for the noise!

J
> > 
> > ---
> > 
> > rfc -> v1:
> > - updated the "Allow OS control for all 5 features" comment
> > ---
> >  hw/pci-host/gpex-acpi.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> > index 0aba47c71c..f34b7cf25e 100644
> > --- a/hw/pci-host/gpex-acpi.c
> > +++ b/hw/pci-host/gpex-acpi.c
> > @@ -50,7 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
> >      }
> >  }
> >  
> > -static void acpi_dsdt_add_pci_osc(Aml *dev)
> > +static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
> >  {
> >      Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
> >  
> > @@ -77,11 +77,12 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
> >      aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> >  
> >      /*
> > -     * Allow OS control for all 5 features:
> > -     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
> > +     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
> > +     * and PCIeHotplug depending on enable_native_pcie_hotplug
> >       */
> > -    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1F),
> > -                              aml_name("CTRL")));
> > +    aml_append(ifctx, aml_and(aml_name("CTRL"),
> > +               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)),
> > +               aml_name("CTRL")));
> >  
> >      ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
> >      aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
> > @@ -192,7 +193,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> >              if (is_cxl) {
> >                  build_cxl_osc_method(dev);  
> 
> This was the path I was expecting to change as well.
> 
> >              } else {
> > -                acpi_dsdt_add_pci_osc(dev);
> > +                acpi_dsdt_add_pci_osc(dev, true);
> >              }
> >  
> >              aml_append(scope, dev);
> > @@ -267,7 +268,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> >      }
> >      aml_append(dev, aml_name_decl("_CRS", rbuf));
> >  
> > -    acpi_dsdt_add_pci_osc(dev);
> > +    acpi_dsdt_add_pci_osc(dev, true);
> >  
> >      Aml *dev_res0 = aml_device("%s", "RES0");
> >      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));  
> 
