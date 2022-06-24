Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp425531lft;
        Fri, 24 Jun 2022 08:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1srUyN6ltGIvWzx6Zsjf6PX3oAQ+bCZ982mATHMvc+GJGOaumQRD7M9RMt/L88dNSczpK+M
X-Received: by 2002:a05:6402:1910:b0:435:ccca:1d8c with SMTP id e16-20020a056402191000b00435ccca1d8cmr12085707edz.211.1656086378768;
        Fri, 24 Jun 2022 08:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656086378; cv=none;
        d=google.com; s=arc-20160816;
        b=JydNEACJSuG474XGywugWjUa6MjEXwNpYHkZ6tDaKHxrKsqFMUwKDVcey7OV0qk7SU
         YngqaY4aHpUg0eBRROu0kzyfUgMXABiu9LfhXU2z7En9979sH0yEwLaZEfDF26TcNN0c
         BDTiCK26gCULPuxmmwdZs+zQq8evmJcJW9QxWY+id3NzhRPKMDKT5WKSCl3iiDm0uzMX
         hg8U7zb5wAaYtkNjMDlaIQROrQaFihGuQk3yCOjbY0dIQ+QtGTuAmukO/Asq0vHSk1us
         XCZH6kNrfizHT1ONxbwYytzV7A+wDkx87FVAW3qMdJphB82k9CJmbI0tqcCcc1yEJjJ5
         irDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=bmVWrZVlwXFIW3MMXOtRPgpWW4dQ4QXHYkeDl6kd2A0=;
        b=LfmRlEi4oAxc0ivgt0xhVqq7pegYFNbXcTCmFKO4krNZlDIgsYBfbdYdAUNSx3zYZm
         ooVrNHkuM2veEA6OgFh01x3GUGj/46KySUgS9uFbz6Zfe3r45maci3Ikd1nI34HuEfSx
         hpb7kil3qZLLFVcLNbaPwfryywFgXa+eWdAJiy2FIk7qp6tOOnTVA+MKF+dkG+UbefO/
         Z+kpCabmOunHLQ3kmAwRKQafAts8HV9kuV1l8ztzqrGh6crv8VA/aRxyXHNatNmDFqkx
         C1cD49Hm0LezwJzTMDD1jNqCxnNIsAswyYwVqDhVpFj2IR8uCSdEImh/J51MTYDiiOoS
         XuVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id qw4-20020a1709066a0400b00722f1da9fc7si2917981ejc.793.2022.06.24.08.59.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jun 2022 08:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LV1tQ0lVsz686Xk;
	Fri, 24 Jun 2022 23:55:42 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Fri, 24 Jun 2022 17:59:37 +0200
Received: from localhost (10.81.207.131) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 24 Jun
 2022 16:59:36 +0100
Date: Fri, 24 Jun 2022 16:59:32 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, <qemu-arm@nongnu.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
	<linuxarm@huawei.com>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
	<imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
	<a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Dan Williams
	<dan.j.williams@intel.com>
Subject: Re: [PATCH v11 1/2] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
Message-ID: <20220624165932.00007ec0@Huawei.com>
In-Reply-To: <CAFEAcA8MLTm9XwAV_JU_EPiT9wfaZed8B19-pL=HobKepJsnkg@mail.gmail.com>
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
	<20220616141950.23374-2-Jonathan.Cameron@huawei.com>
	<CAFEAcA8U9oNDStfLpxOwodGm9MCTdLrt-WV+x_-rTGw9UpBGvA@mail.gmail.com>
	<20220624133909.00005f6e@Huawei.com>
	<CAFEAcA8GA+ZXr2eS9bVxnhZRtda17Wx0Ud8CfcA90T6yiaecew@mail.gmail.com>
	<20220624150844.000005ec@Huawei.com>
	<20220624155436.000047cb@Huawei.com>
	<CAFEAcA8MLTm9XwAV_JU_EPiT9wfaZed8B19-pL=HobKepJsnkg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.207.131]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-TUID: S1rv2BsEnjSx

On Fri, 24 Jun 2022 16:01:42 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 24 Jun 2022 at 15:54, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> > Just occurred to me there is another barrier to an approach that adds
> > DT bindings.
> > I fairly sure hw/pci-bridge/pci_expander_bridge.c (PXB)
> > only works on ACPI platforms and is the only host bridge supported
> > for CXL emulation in QEMU.  
> 
> Isn't it probeable like any other PCI device/bridge ?

Nope - PXB is a really weird device. (I tested it quickly in case I was
wrong and indeed, no sign of device on the downstream side without a
suitable BIOS / ACPI)
There is no driver support for it as such, rather it presents
as two things.
1) A EP on the main host bridge - which is used for interrupt routing
   and possibly a few other things.  Linux has no idea that's what it
   is though so attaches no driver to it.  lspci shows this as
   Red Hat, Inc, QEMU PCIe Expander Bridge

2) A host bridge with firmware described characteristics (bus number
   range and similar).  Host bridges as defined in ACPI are a concept
   rather than actual hardware and presented to the OS via firmware
   descriptions (ACPI DSDT stuff in this case).

You could probably add dt description via
pci-host-ecam-generic bindings though but it would be an interesting
late bit of dt addition in the virt_machine_done() function. Similar
to the fw_cfg and ACPI stuff done at that stage to deal with PXB
devices becoming visible.

So gut feeling is PXB could be made to work with DT, but doesn't today.
Give the main usecase for PXB is typically NUMA description I guess no one
noticed on DT platforms.

Jonathan



 
> 
> -- PMM
