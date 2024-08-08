Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp373063njc;
        Wed, 7 Aug 2024 21:15:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUW3HsKqnCeTO6TKC24k63SS1y7QuyE6FGU9PDgMicE6tYadIPlWDyZTl/J+ssNfwle09wDBE1SsqkI5Cx82uTlJZ5eIlWu
X-Google-Smtp-Source: AGHT+IECrHq/rEGfgtub735KBPv8kmgJMYs1GpM5bgqcH/rADy7Yv3HLAdEbb2neMRZctVmzscIe
X-Received: by 2002:a05:622a:1e16:b0:446:589b:cea8 with SMTP id d75a77b69052e-451d5948a01mr7500871cf.28.1723090541895;
        Wed, 07 Aug 2024 21:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723090541; cv=none;
        d=google.com; s=arc-20160816;
        b=bJ8qH0PfG1nHTkcrLFmGKDHht4whyjQSwIoUIQqIKR/kKHAgYjYQfotP6aj0+FeagP
         L4Cy4qY9j08QjmCFR9lF0UqyAebORMGauDkS/Z65rEbwbPYCiUhuthQH6VJTspxS+pyO
         DoAiJ/NVTMzvlJBQqJ6+hq/b4L5MD09JhwF+nJXdK/eQM5BkTqICad+yywrEknlpgtAs
         ga2BY1bL3PIDoJOLZg9Xp0Z+S4qAGS5N1GPW6v4+qBDGxUvgV3QzKqw3/MGE7KmVChCF
         geJ0SbWCuDFzK89XvGL/8YZzMNcMIAL63ShOV5zj4By9T3eil0o0xMJdfKiYETcPHQ+D
         NrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Q5eu43Y/hqJXwDhyW+n7+B4OTDeL2qDQ9239uQTzVyU=;
        fh=Z6gBw4oxzXjSKNWEBfh/XRk7q2URiKvYPGsYOmfcefc=;
        b=HZxA3O4Crl4qvmxjMAVStqNYOMK+eKAz54mhQlOxAo9YiqnM42o4Fr9yAom0y0X/EL
         dUqr9lthQfTEsFPzYot4jI8s6/0QV+/2Xak+b6lwo4iO83EjcjJkOqMiIMbuZH0SZFIS
         64vCs7HLq9kKzhC8Iump52uqSPzEUaTF6BCyPG3Uu48lcrRe2MANuZC0qWijjMmk3wOb
         TH3qQ2nd2XGKNG7GmlGOoKAy2+XKpU4OaMv+JmCsvb9j6W7T+yVzpH9zIEGR+k+TY73O
         Bxz+U9IZA07o5jfdMLwrezwJKreUfUBWjrY9RV1kf4mBulk7HFKrUcAXPFKyxufEx2Hi
         SX5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cID5RCab;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-451c87ffcd9si30993391cf.530.2024.08.07.21.15.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 21:15:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cID5RCab;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723090541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5eu43Y/hqJXwDhyW+n7+B4OTDeL2qDQ9239uQTzVyU=;
	b=cID5RCab4M0/nJANp701wlgZW8krkeizLg/8Ftx6V+LIk8wqK974G9UyCIkRwSjQBZPb1P
	O97pQWQ7SlHcm3M4tCfhktqTC4B2XpX/DTVt8bQb3ox9I+tC4BS0stxOO9BgJxfEtIIHIZ
	A0VKQ1HfwGNEelVfX36Bc+kfSGVDHjQ=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-wZ-M5BYGMqm-utK9SxDaUA-1; Thu, 08 Aug 2024 00:15:40 -0400
X-MC-Unique: wZ-M5BYGMqm-utK9SxDaUA-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso513769a12.0
        for <alex.bennee@linaro.org>; Wed, 07 Aug 2024 21:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723090539; x=1723695339;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5eu43Y/hqJXwDhyW+n7+B4OTDeL2qDQ9239uQTzVyU=;
        b=G5vuDo/kEr8O8bN45PmBh3TrHNOqDythMcQeIbRPbtDFRWpXBxkrzDka1OuN6wRaRO
         FdMjEk1S4rS2CD+zynJYDZcR+elSQ3urjtIs0Lr82nI2miLaNRiLe0SZw2xM2wecFmal
         CoyfvRa5mYDFrMac3maCjNtR42O6GhylGo/Lpt6soV+j7LzPS3lxS0UIO/1pEp8EL/ap
         gT0I3JZA4nTI0IvCTPWaF6m+Vr4kiJP4hQwKshLy2sceeg95wEjxbkpm/FjvFHagM53Z
         o+Vi5Rt27avf67L3h2MiYdtqmg0fUipErIsk5QFYWOWDQKb0RPdiEuW2rM8X9s/L+XNK
         Jfug==
X-Forwarded-Encrypted: i=1; AJvYcCWZ1cBt2oHXU6o2JPz1XnFIxc0j8Pw6YWOIokUI3VbcCZcArJjingGUYeNBXdCiaMyLB+RAbV/z8C6cyq7T13BeSvrkMRzo
X-Gm-Message-State: AOJu0Yz06XY2FXhKjqmo/E12FZ0tPO+GuoxU38l/RPs1EfVFEXjdymBz
	B3/5HLe780/lwGNojnLfrZldVMl3jCgSqyP0J469Y2rwIuprZvDzREb+Shi9wxhohsmjWSrEZpF
	JXcSTUs04TgjmiioOyx/+crrEnitc+XnJnOvfzCZhVlVCLR0FZd3ZJA==
X-Received: by 2002:a05:6a21:998f:b0:1c0:f630:97a5 with SMTP id adf61e73a8af0-1c6fd524d78mr991326637.10.1723090538860;
        Wed, 07 Aug 2024 21:15:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:998f:b0:1c0:f630:97a5 with SMTP id adf61e73a8af0-1c6fd524d78mr991283637.10.1723090538453;
        Wed, 07 Aug 2024 21:15:38 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([43.252.112.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2cc93asm283195b3a.104.2024.08.07.21.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 21:15:37 -0700 (PDT)
Message-ID: <f21944c4-f498-483a-9a5a-aff2def67427@redhat.com>
Date: Thu, 8 Aug 2024 14:15:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 00/29] Support of Virtual CPU Hotplug for ARMv8
 Arch
From: Gavin Shan <gshan@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <41fbfa5a-a10f-4ca0-8a52-e447043ff306@redhat.com>
 <ed0a5631e0674c2aa4679f2388f40127@huawei.com>
 <5843f79d-c9b7-45bf-a2b1-2ae4c7babf46@redhat.com>
 <44d06db6ec1b416d8817b7cf5043ddf8@huawei.com>
 <c2dce623-ee44-47d5-b9cb-73481a86b75f@redhat.com>
In-Reply-To: <c2dce623-ee44-47d5-b9cb-73481a86b75f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4JIMHdG8PTjv

Hi Salil,

On 8/8/24 10:29 AM, Gavin Shan wrote:
> On 8/8/24 9:48 AM, Salil Mehta wrote:
> 
> However, I'm unable to hot-add a vCPU and haven't get a chance to look
> at it closely.
> 
> (qemu) device_add host-arm-cpu,id=cpu,socket-id=1
> (qemu) [  258.901027] Unable to handle kernel write to read-only memory at virtual address ffff800080fa7190
> [  258.901686] Mem abort info:
> [  258.901889]   ESR = 0x000000009600004e
> [  258.902160]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  258.902543]   SET = 0, FnV = 0
> [  258.902763]   EA = 0, S1PTW = 0
> [  258.902991]   FSC = 0x0e: level 2 permission fault
> [  258.903338] Data abort info:
> [  258.903547]   ISV = 0, ISS = 0x0000004e, ISS2 = 0x00000000
> [  258.903943]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> [  258.904304]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  258.904687] swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000b8e24000
> [  258.905258] [ffff800080fa7190] pgd=10000000b95b0003, p4d=10000000b95b0003, pud=10000000b95b1003, pmd=00600000b8c00781
> [  258.906026] Internal error: Oops: 000000009600004e [#1] PREEMPT SMP
> [  258.906474] Modules linked in:
> [  258.906705] CPU: 0 UID: 0 PID: 29 Comm: kworker/u8:1 Not tainted 6.11.0-rc2-gavin-gb446a2dae984 #7
> [  258.907338] Hardware name: QEMU KVM Virtual Machine, BIOS edk2-stable202402-prebuilt.qemu.org 02/14/2024
> [  258.908009] Workqueue: kacpi_hotplug acpi_hotplug_work_fn
> [  258.908401] pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> [  258.908899] pc : register_cpu+0x140/0x290
> [  258.909195] lr : register_cpu+0x128/0x290
> [  258.909487] sp : ffff8000817fba10
> [  258.909727] x29: ffff8000817fba10 x28: 0000000000000000 x27: ffff0000011f9098
> [  258.910246] x26: ffff80008167b1b0 x25: 0000000000000001 x24: ffff80008153dad0
> [  258.910762] x23: 0000000000000001 x22: ffff0000ff7de210 x21: ffff8000811b9a00
> [  258.911279] x20: 0000000000000000 x19: ffff800080fa7190 x18: ffffffffffffffff
> [  258.911798] x17: 0000000000000000 x16: 0000000000000000 x15: ffff000005a46a1c
> [  258.912326] x14: ffffffffffffffff x13: ffff000005a4632b x12: 0000000000000000
> [  258.912854] x11: 0000000000000040 x10: 0000000000000000 x9 : ffff8000808a6cd4
> [  258.913382] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefefefefefeff
> [  258.913906] x5 : ffff0000053fab40 x4 : ffff0000053fa920 x3 : ffff0000053fabb0
> [  258.914439] x2 : ffff000000de1100 x1 : ffff800080fa7190 x0 : 0000000000000002
> [  258.914968] Call trace:
> [  258.915154]  register_cpu+0x140/0x290
> [  258.915429]  arch_register_cpu+0x84/0xd8
> [  258.915726]  acpi_processor_add+0x480/0x5b0
> [  258.916042]  acpi_bus_attach+0x1c4/0x300
> [  258.916334]  acpi_dev_for_one_check+0x3c/0x50
> [  258.916689]  device_for_each_child+0x68/0xc8
> [  258.917012]  acpi_dev_for_each_child+0x48/0x80
> [  258.917344]  acpi_bus_attach+0x84/0x300
> [  258.917629]  acpi_bus_scan+0x74/0x220
> [  258.917902]  acpi_scan_rescan_bus+0x54/0x88
> [  258.918211]  acpi_device_hotplug+0x208/0x478
> [  258.918529]  acpi_hotplug_work_fn+0x2c/0x50
> [  258.918839]  process_one_work+0x15c/0x3c0
> [  258.919139]  worker_thread+0x2ec/0x400
> [  258.919417]  kthread+0x120/0x130
> [  258.919658]  ret_from_fork+0x10/0x20
> [  258.919924] Code: 91064021 9ad72000 8b130c33 d503201f (f820327f)
> [  258.920373] ---[ end trace 0000000000000000 ]---
> 

The fix [1] is needed by the guest kernel. With this, I'm able to hot add
vCPU and hot remove vCPU successfully.

[1] https://lkml.org/lkml/2024/8/8/155

Thanks,
Gavin
