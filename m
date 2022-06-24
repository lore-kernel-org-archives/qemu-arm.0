Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp166034lft;
        Fri, 24 Jun 2022 02:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vY2TNSv1N09i0VXxgEQrXvghq6xI4LVTtQFxJhpBVH75F9hTvBUXoD2OI5FasZfFhvX0BO
X-Received: by 2002:a17:907:6d23:b0:707:90a0:afb3 with SMTP id sa35-20020a1709076d2300b0070790a0afb3mr12027435ejc.685.1656061642159;
        Fri, 24 Jun 2022 02:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656061642; cv=none;
        d=google.com; s=arc-20160816;
        b=qRf1rkwnNPLNFiNN3bQSQhkutONGlFGhSaAgTwD5oXCLSx8LZXP/h4l4tZntFx1fO7
         H5vV7V/Nu/ztUGu6hhIeZszbGY/awAlPRh+Evjphp0IiraddmR8NCrhTw7bK7shAK4Vp
         V8xfqcSQ65K7oSHTekdzfkYmxvNiE6+xoBn83ydo5EnNqrobodVVl6K6DVl/UjFKD6dh
         IRK1hcw5B2NOxzzzaI/5p7AJ+o9NiGqqA6j3wyraCX9W35lEbY4UwMVrQzjUySTYWNYR
         YFOzASaeioh5l/g3gQFEgRCfs/gaATO+9wk3H1E5rGlSeOYOxRoKhJ+fPR/Sy5bhSZ3r
         +TXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=TuzazImFmmT1H1Q1vEE1KZi4xd5kdnW7HKK3SvjCLYQ=;
        b=Jhtu1LuS3DfJdcAGRwqzRPWl8JQtB4adKcTV0NGONzglv0uWXwFpuWSkxoAzPIDOsq
         c8sJK5KpsmwTc1ciMPP5xNV0zNq5mo9UkpGV4OSNdAnQLTihXoxW+8mnxD3Sf6JULeB9
         Sbav2WeNmWJjAD//XB6yzp7It/899ctQiY6Daoy/saGyb3jELxSoYkzRZOYJTZzvR75u
         j/wsufcV7zdQbs1muZmi9uN+HnV25n1Xj/qnAwuUVuHbk4PiKOarFkcEzWnF93ZskcX3
         WF6DL76ibgJlrwjgYjEa2mCPVK1s+hmHOC1PsLPCuKs6fqD9fKoGVogloWh57ZpPD7ZY
         2/4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id cw20-20020a170906479400b007174e91f206si2098230ejc.217.2022.06.24.02.07.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jun 2022 02:07:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LTrmk4W2Nz6H7kx;
	Fri, 24 Jun 2022 17:05:10 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 24 Jun 2022 11:07:14 +0200
Received: from localhost (10.81.207.131) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 24 Jun
 2022 10:07:13 +0100
Date: Fri, 24 Jun 2022 10:07:09 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Jonathan Cameron via <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, Paolo Bonzini
	<pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Mark Cave-Ayland
	<mark.cave-ayland@ilande.co.uk>, Adam Manzanares <a.manzanares@samsung.com>,
	Tong Zhang <ztong0001@gmail.com>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v11 0/2] arm/virt: CXL support via pxb_cxl
Message-ID: <20220624100709.00001640@Huawei.com>
In-Reply-To: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.207.131]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-TUID: 9zu1BZjTRRTg

On Thu, 16 Jun 2022 15:19:48 +0100
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> Previously patches 40 and 41 of
> [PATCH v10 00/45] CXl 2.0 emulation Support
> https://lore.kernel.org/qemu-devel/20220429144110.25167-45-Jonathan.Cameron@huawei.com/#r
> 
> Now the base CXL support including for x86/pc is upstream (patches 1-39)
> there are no dependencies between the next few CXL elements in my queue
> so they can be reviewed / merged in parallel.  Hence I'll be sending switch
> support (43-45) separately and hopefully DOE / CDAT support in a few days.
> I'm assuming this particular series should go through the arm tree if
> the maintainers are happy?

Hi All,

If Peter or anyone else has time to look at this with a view to getting
ARM support on par with x86 that would be great.  I 'think' this should
be uncontroversial but I'm far from an expert!  I'm particularly keen on
getting this upstream as most of my testing is on ARM/virt.

Thanks,

Jonathan

> 
> Changes since v10:
>  - CXL machine setup is now entirely from the supporting machines rather
>    than via code in machine.c and vl.c.  Change made for x86 in:
>    https://lore.kernel.org/qemu-devel/20220608145440.26106-1-Jonathan.Cameron@huawei.com/
>  - Dropped Ben's sign off from patch 1 which resulted from him carrying
>    these patches of mine for a while. It isn't a useful bit of history
>    to carry now they are back to me.
> 
> This short series adds support for CXL host bridges and CXL fixed memory
> windows on arm/virt.  Two types of memory region are needed:
> 1. Register space for CXL host bridges (static allowance for 16)
> 2. CXL fixed memory windows: Ranges of host PA space which
>    are statically mapped to an interleave across 1 or more CXL host
>    bridges.
> 
> Both of these types of region are described via appropriate ACPI tables.
> As the CEDT table is created with the same code as for x86 I don't think
> there is much value in duplicating the existing CXL bios-tables test.
> 
> The second patch adds a single complex test. We test a lot more configurations
> on x86 but it does not seem useful to duplicate them all on ARM and this single
> test should act as a smoke test for any problems that occur.
> 
> Run through CI at:
> https://gitlab.com/jic23/qemu/-/pipelines/564934276
> Intermittent (unrelated I assume) failure in msys64 aio-test resolved
> with a retry.
> 
> Thanks,
> 
> Jonathan
> 
> Jonathan Cameron (2):
>   hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
>     pxb-cxl
>   qtest/cxl: Add aarch64 virt test for CXL
> 
>  hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++
>  hw/arm/virt.c            | 44 ++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h    |  3 +++
>  tests/qtest/cxl-test.c   | 48 ++++++++++++++++++++++++++++++++--------
>  tests/qtest/meson.build  |  1 +
>  5 files changed, 121 insertions(+), 9 deletions(-)
> 
