Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1411621ejb;
        Mon, 2 Oct 2023 09:00:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKaTwE2rwNr7MJfcYU7834qYe38APhV53182EF/G3tKupG5l96NkT/eCYbxrXXQIzkX5CB
X-Received: by 2002:a5d:5684:0:b0:31f:f664:d87 with SMTP id f4-20020a5d5684000000b0031ff6640d87mr9952157wrv.20.1696262453242;
        Mon, 02 Oct 2023 09:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696262453; cv=none;
        d=google.com; s=arc-20160816;
        b=a+eqB1Cb4eT8hRzfgzEhQno0zlAzEX86c9ahv+bQJiUO3xV9XjkLG1m4AJk5NpiqRa
         Yew6OTXF1BIqbfwNEO2V4Vg6k07Y3mHbubT1xfNjrsLpYHwcs0mLvySUpZoen59DNX8D
         Fmshu+95ZjG3HN0XCGMeiHdzKY1llfBkKkeE6DMy2GNM8PtoRduCsAsZSC7qjWH4LOsL
         UIa+4jaJbzPgS022+7tVHsnxPjggqnt9bgn+bmuDzpm48i2uOMLzScRYoPMM7J7JFfXZ
         bPYmSwJezB2IJI8iWoMum6bIIISfaeAdzK3Z1/Q6Rx41wdH3DKzMIIBxkabQnkk38vWh
         oJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=Z4x7cF/EF0GuH0Uj+OsEbqQUUHYfxFlMgkz6RpeEG9k=;
        fh=/EBauY3IXh4VobPm5b6w815uXOAKkGQo/xHlRV7Dr5E=;
        b=R2GdjPAgPLG5bp54Ki2855UCmVFta1L2xaRjA+UFTKC8u94mKPGusbiu55SyZfVvbn
         Y5eVOmWApm03y7/IWUfsTzN9DUa+XVytr98mXBCdmQeqTAvlkPaQspPNIrKG+GH/QxL3
         ytyNRRCYx3cVpDEH5wuHKettiJKHds4LNNOp+SRWBvdZb+tQyfKHjkbJaN03HR2tpJ7d
         J06ZHOe3oC68xzET8R8oiAciH+05XGMfasb4d3aJ1DySwR1R41XB19Q3mPdLyf1n3a+a
         GWKGATwurjwMEBiiXU4amhuKdjzVjR07kKw562X6d5QZNZkZXO4UH7E0aD0+AGgXpDng
         DTNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id w14-20020a5d404e000000b0032480c4f2d6si4302088wrp.368.2023.10.02.09.00.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 09:00:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rzlxy5Bc4z6K66L;
	Mon,  2 Oct 2023 23:59:18 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 2 Oct
 2023 17:00:51 +0100
Date: Mon, 2 Oct 2023 17:00:50 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
	<jean-philippe@linaro.org>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: Re: [PATCH V2 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Message-ID: <20231002170050.00004fd8@Huawei.com>
In-Reply-To: <20230930001933.2660-4-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-4-salil.mehta@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: CrocYwNgrspD

On Sat, 30 Sep 2023 01:19:26 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
> stub to avoid compilation break.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Seems reasonable.  For the other similar cases a stub isn't needed
because GED is built when CONFIG_ACPI_HW_REDUCED=y and
that select ACPI_MEMORY_HOTPLUG and ACPI_NVDIMM

You could do the same for the CPU hotplug case and instantiate
a potentially useless memory region etc.  This seems more sensible to me

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/acpi/acpi-cpu-hotplug-stub.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> index 3fc4b14c26..c6c61bb9cd 100644
> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>      return;
>  }
>  
> +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
> +                         CPUHotplugState *state, hwaddr base_addr)
> +{
> +    return;
> +}
> +
>  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
>  {
>      return;
