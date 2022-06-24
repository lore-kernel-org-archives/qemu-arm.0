Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp383238lft;
        Fri, 24 Jun 2022 07:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ufTIXvCzVZ12NZrxSJQUhxMsNCgJQngKpKJwYnSHrz7+y+MaBIAHFcwndfOkh7YNQjp0Sg
X-Received: by 2002:a05:6402:2c4:b0:435:8ce0:aef8 with SMTP id b4-20020a05640202c400b004358ce0aef8mr17726399edx.140.1656082482487;
        Fri, 24 Jun 2022 07:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656082482; cv=none;
        d=google.com; s=arc-20160816;
        b=gVzGTOujl1VSXCtMgRrMM12wcOceoahLEmZ8PPo3C4E70MpYC3T8J5Jsl02VnAEdGs
         OrRTZbF1xSsQQQZtqR/riHzINt+ZhyeuOHvVIuFIO0MKj+ma1kEA3Y3TU+BHofZQul/i
         10sYGL2ot9pVptmWxeNnkaGvFL83QX4XUsSyV6guUVX82j/pV0N0ZT8HLd/yC3ubcFt1
         kT8WBa+sX9cS1WILg/rpEzFW+uWGEcuwqOJQ+/gvkUBxLeodCk3OOUG8/4sbDqbGkqWD
         FpK5YvjztraKUbBDDqY512SFP9pwo6UCxn5ObT/EcKVKXPBG0CLswi0zA6YzLfqIatDu
         DUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=3K5fXEE2Vntq/+aJuLi+xd3iE4AyxLC+ivdRsoBC9YI=;
        b=Fh+8s5omc0LkXCml/p1YXhsPQBKK7LJjrxzTVw1C3G+f7IUejRVMcEni5xJdiyZ4aN
         zbnyE7jB+TcAn1pUr7mJTeGSIxrb5d3NVwnLoPbrLF9OeOIZkhh5DT3H7tP3TYtvPISN
         KRLPGkB7TdBB+Z0Dvuv6xk6gIeJ+KnQFLtndLLkKs7Joqj+cHzjF2DnEDnBJ+Uq1X/SL
         uBVDaP7i2NE/CP8Q+xI1rC74LUCZbqX9CUjjJdaF4lBTd3Ku77Hsr8PlR8ST61prNvzz
         TxWQgrZbxQhJZxkcHtK+GoO1cWxY7O3nArXfMGCa3oFR/xkwY8Gs1xglTEPOaZSfM5iF
         B1uA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id i19-20020a1709064fd300b00711f164117csi3051330ejw.883.2022.06.24.07.54.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jun 2022 07:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LV0Tc3sHVz67qfF;
	Fri, 24 Jun 2022 22:52:36 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Fri, 24 Jun 2022 16:54:41 +0200
Received: from localhost (10.81.207.131) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 24 Jun
 2022 15:54:40 +0100
Date: Fri, 24 Jun 2022 15:54:36 +0100
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
Message-ID: <20220624155436.000047cb@Huawei.com>
In-Reply-To: <20220624150844.000005ec@Huawei.com>
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
	<20220616141950.23374-2-Jonathan.Cameron@huawei.com>
	<CAFEAcA8U9oNDStfLpxOwodGm9MCTdLrt-WV+x_-rTGw9UpBGvA@mail.gmail.com>
	<20220624133909.00005f6e@Huawei.com>
	<CAFEAcA8GA+ZXr2eS9bVxnhZRtda17Wx0Ud8CfcA90T6yiaecew@mail.gmail.com>
	<20220624150844.000005ec@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.207.131]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-TUID: YYTdZMeVLWgR

On Fri, 24 Jun 2022 15:08:44 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Fri, 24 Jun 2022 13:56:32 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> > On Fri, 24 Jun 2022 at 13:39, Jonathan Cameron
> > <Jonathan.Cameron@huawei.com> wrote:  
> > >
> > > On Fri, 24 Jun 2022 11:48:47 +0100
> > > Peter Maydell <peter.maydell@linaro.org> wrote:    
> > > >
> > > > This seems to be missing code to advertise the new devices in the
> > > > device tree.    
> > >
> > > Intentionally. I am not aware of any current interest
> > > in defining DT support CXL or supporting it in operating systems.
> > > Easy enough to add if anyone does the leg work to figure out the
> > > bindings, but that needs to come from someone who cares and
> > > would need to be driven by OS support and a usecase. The ACPI
> > > stuff here is defined as part of the main CXL spec because the
> > > target class of machines simply doesn't generally use DT.    
> > 
> > I don't really want new devices in the virt board that aren't
> > usable in the common use case of "just pass a kernel with -kernel"...
> > 
> > -- PMM  
> 
> Ok.  In that case, what do you suggest?  
> 
> Options I can think of:
> 
> 1) I can come up with plausible DT bindings, but I'm not sure how
> that will be received by the kernel community, It will add a bunch of
> infrastructure to maintain that may be seen as useless at least in
> the short to medium term. Hence is not in anyone's test matrices etc.

Just occurred to me there is another barrier to an approach that adds
DT bindings.
I fairly sure hw/pci-bridge/pci_expander_bridge.c (PXB)
only works on ACPI platforms and is the only host bridge supported
for CXL emulation in QEMU.

> 
> Dan, how open would you be to adding DT support? We'd have to ignore
> some of the firmware query stuff like QTGs as there isn't an equivalent
> in DT - or we'd have to go as far as defining actual devices with
> mailboxes to query that info.
> 
> 2) Add it to something like the SBSA machine, but that brings a large
> burden in firmware etc and need to communicate everything via DT to
> EDK2 that is needed to build the ACPI tables in a flexible fashion +
> mass of EDK2 development.  Whilst the SBSA model is great for ARM
> specific stuff, requiring the large additional complexity in
> actually using it to test arch independent software is probably
> going to just mean it bit rots.
> 
> 3) Fork virt (obviously sharing as much as possible), potentially I
> guess that could be pretty light weight by declaring a new
> TypeInfo that is very nearly identical to virt with just the few extra
> calls inserted. 
> 
> Any other routes open to me to getting this support available?
> 
> Jonathan
> 
> 
