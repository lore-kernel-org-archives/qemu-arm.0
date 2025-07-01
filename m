Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3209475dye;
        Tue, 1 Jul 2025 07:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQ+Bcycb9HnogiiLnlSD3T/2xVppY2x5XhPsiAl5Fvs4uEqJHzhmrhoLXHjRItzKZOf42xo0Lr7pEzeA==@linaro.org
X-Google-Smtp-Source: AGHT+IEIhrZ03uWLpNhmyFujUr6PYzrq3z/nGGTDvu8x1geAC/o6EWoH5hLUba4S7q6P0TlWU3ae
X-Received: by 2002:a05:6a20:e607:b0:21f:543f:f11c with SMTP id adf61e73a8af0-220a127e617mr31037741637.2.1751380877555;
        Tue, 01 Jul 2025 07:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751380877; cv=none;
        d=google.com; s=arc-20240605;
        b=KG6uyXAXvEb6/1egGPySQLVLMH/QrQPJQDVR1zSzkLZSWNAnbMfzPYL5kzRP0uSzVh
         wucICt6wC8DbRF3e8tZGkCssqoS6uSnfD3vnDVE4UU/Gt8EsMx6LAY6ohJ2gKc2K7Fj7
         5qCCP7r4GkWgWR6VCYgQZIFAmikyvU+nl7evgBKlHnePQVMW7ZG5cxKMfdbhhpkOaNen
         9VCIjtTp0WmmdVR5dlNyLU+cttfMX2Kk3ECNPYKF9d9wdBmdHVtGtXNjIJWqsTOb6LyP
         MylTEb9Vw5l9BCRwaw0pZDR+ueDzFx7bUpOrIxN49rkjpN6B42EdGi2NPFSf6jEwavgT
         OPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=uBxdWdRYrbw4n5ddb+w9GAkR0aj8fkzFnSNACqExQlw=;
        fh=KQiuoQS65+0RFucE32HbuCDy3oDTDBckj/dNA1UFN1M=;
        b=TV6NRA6rwH0qe7aS2wDaF4ury9IsoSYGOqG6z/WPMetYlgG+hhL474LYmhaZUAzHIk
         1G/U1ehW7fddqLmbDkMC4caCXrsQvRT2v/Oy4U0TgzI6d71jaCMPuP7gfIUHjPeFZM4i
         39tJW//8MZGmK7QbFmA+2YiO4i1iI4kiHyDQfqeLqfTC5M/ms6VVtZ3niC5ZC2X+4Uph
         LYqMBK2EmyM9We/FLDKuGKnyLoIMNU01eRf1kxEqwudRVOV2+Y2hIYZLekVDK5nYnZoz
         hscPd7Tq6qFksZ6H0NpzQZfRyBNYZrcLdt5Fpt/G09kqgdlGbDqvzYHvDoXtxnBTnG7N
         rF8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d2e1a72fcca58-74af5424ac1si14116130b3a.72.2025.07.01.07.41.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jul 2025 07:41:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bWm0x4y7Bz6L52Z;
	Tue,  1 Jul 2025 22:40:49 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 962CE14027A;
	Tue,  1 Jul 2025 22:41:12 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 1 Jul
 2025 16:41:11 +0200
Date: Tue, 1 Jul 2025 15:41:10 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
	<peter.maydell@linaro.org>, <mst@redhat.com>, Zhijian Li
	<lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>,
	<linuxarm@huawei.com>, <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>,
	"Yuquan Wang" <wangyuquan1236@phytium.com.cn>, Philippe
 =?ISO-8859-1?Q?Mathieu-Dau?= =?ISO-8859-1?Q?d=E9?= <philmd@linaro.org>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH qemu v16 3/5] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
Message-ID: <20250701154110.00007675@huawei.com>
In-Reply-To: <4ceea721-b633-499e-9fcd-735990ee0704@redhat.com>
References: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
	<20250625161926.549812-4-Jonathan.Cameron@huawei.com>
	<4ceea721-b633-499e-9fcd-735990ee0704@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: Qc1klaFApdgg

On Tue, 1 Jul 2025 15:26:26 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Hi Jonathan,
> 
> On 6/25/25 6:19 PM, Jonathan Cameron via wrote:
> > Code based on i386/pc enablement.
> > The memory layout places space for 16 host bridge register regions after
> > the GIC_REDIST2 in the extended memmap. This is a hole in the current
> > map so adding them here has no impact on placement of other memory regions
> > (tested with enough CPUs for GIC_REDIST2 to be in use.)  
> 
> Doesn't it depend on the init RAM size setting.
> if the init RAM top + REDIST2 aligns to a 256MB boundary (size of the
> PCI ECAM) aren't you likely to have no hole?

Hi Eric,

Is that possible?  I think the device_memory_base being force to align
to a 1 GiB means that never happens.  That seems to occur even
if there is no device_memory.  

    device_memory_base =
        ROUND_UP(vms->memmap[VIRT_MEM].base + ms->ram_size, GiB);
    device_memory_size = ms->maxram_size - ms->ram_size + ms->ram_slots * GiB;

    /* Base address of the high IO region */
    memtop = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
//So here we are GiB aligned.
...

    if (base < vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES) {
        base = vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES;
    }

//That's 256 GiB in or leave it alone as more than that but GiB aligned.

   /* We know for sure that at least the memory fits in the PA space */
    vms->highest_gpa = memtop - 1;

    virt_set_high_memmap(vms, base, pa_bits);


So I think I'm fine. I should call out that REDIST2 is GiB
aligned though in this patch description.
> 
> 
> >
> > The CFMWs are placed above the extended memmap.  Note the confusing
> > existing variable highest_gpa is the highest_gpa that has been allocated
> > at a particular point in setting up the memory map.  
> what kind of improvement would you foresee wrt highest_gpa?

This was mostly a response to Peter expressed that he was expecting
highest_gpa to reflect the limit, not the highest yet seen.

I'm not sure how to resolve that without having awkward naming
like highest_gpa_sofar. There are existing comments where it is updated
so I'm not thinking we need to change anything for this.


Thanks for taking a look,

Jonathan
