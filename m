Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp856707ejc;
        Thu, 12 Oct 2023 07:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpC1ZA4+ldF0B0yB3FFokY0AU0n7c6/xLMvQ46PjELVpmzUlfo4dvvoXSYnE4Elg/8HwtS
X-Received: by 2002:a1c:720c:0:b0:3fe:5501:d293 with SMTP id n12-20020a1c720c000000b003fe5501d293mr21626661wmc.30.1697121388382;
        Thu, 12 Oct 2023 07:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697121388; cv=none;
        d=google.com; s=arc-20160816;
        b=JyQyr3PdDib7OiApDWG5DLO/Hs232Fe2PGm94irS4OsAZ2ufQ8I2to22gdFIjjO8Rh
         WAf87wYsuxGqvVt2GpZxS2PDYz0yrdBiUWcH3umfSr/0PK9+eySGWuKZsH18zRUB0Qo0
         73oLj7toTAudtJj7DtQWVMUBzIsjNhEKGBHB14p9R0QI/lcBXm9UtDgpcpUrkXGgoyUj
         4DCe99nupB1QVqVWs65EJd408/gNNpyIGdjv9BE1854ZdjhkxLoqALGvC+d04vF0Svls
         B2Si3hVatVWDN+yebPOTT5ktFzz1Q69han/MC4HDlJz7GU3XzNCzBDOMDPeaSWwflgVB
         DYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=Hxrcrq8nCVxzyAZsPc8+rDO1kN6NWxTSOLr/w+u8i38=;
        fh=/EBauY3IXh4VobPm5b6w815uXOAKkGQo/xHlRV7Dr5E=;
        b=EE21fsHdST9P/dMvCdwMCe/c8reK9ZFcz3J5Br/Hftx37f6LfVbWfosAiL7pnzsgnE
         XVM1MiKnq19nMdOFwBuT5hz1kORa/J8iO3n0xw4eJCTLj7ZMHC0VqlaarHNw7V5MdCx/
         NnF45dSOp2ziwnojGYF6alqUmH0m7UT/Z8W5/Bt3I19BVGVQODqzdZi4KUOeoKwyypA9
         KKjvEureBZmtNzXt0G/6OROzaJiYK/gSk9GCySNgt4XhN7n1QAZGaIszn3hunP5DL4DC
         Cfrnrz3LARrxZWz/nS+TkcUgxNvNJgRG7UhJ/+EHWvJwmDo86qjeViSW5taEbxCOGJEN
         gsVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id o33-20020a05600c512100b003fc08786b38si5238wms.6.2023.10.12.07.36.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Oct 2023 07:36:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S5sdJ3LZDz67XMQ;
	Thu, 12 Oct 2023 22:36:04 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 12 Oct
 2023 15:36:26 +0100
Date: Thu, 12 Oct 2023 15:36:25 +0100
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
Subject: Re: [PATCH V5 1/9] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Message-ID: <20231012153625.00005025@Huawei.com>
In-Reply-To: <20231011194355.15628-2-salil.mehta@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
	<20231011194355.15628-2-salil.mehta@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: AmNn7HTeDGOW

On Wed, 11 Oct 2023 20:43:47 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> KVM vCPU creation is done once during the initialization of the VM when Qemu
> thread is spawned. This is common to all the architectures.
> 
> Hot-unplug of vCPU results in destruction of the vCPU object in QOM but the
> corresponding KVM vCPU object in the Host KVM is not destroyed and its
> representative KVM vCPU object/context in Qemu is parked.
> 
> Refactor common logic so that some APIs could be reused by vCPU Hotplug code.

If you are respinning I'd also call out that you added some trace points.

> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Otherwise LGTM as it's a straight forward refactor.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

