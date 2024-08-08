Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp379977njc;
        Wed, 7 Aug 2024 22:00:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUg8PcKx+y0uGlyteWSYOvwXFa4A9e9OtXvM89FQGoe+D1MKnkqMq5Dkt0KvE9YfZnS1B1eM5f46FLRNXjbYvJl439FXeRJ
X-Google-Smtp-Source: AGHT+IH6NpgDNGkLapPRayvjSPZ1bQOoqRJU/HgU6+sTNlNJOHGWg3r7bAzGA97btIqbmkmf8UtR
X-Received: by 2002:a05:622a:408c:b0:447:f0d5:ee57 with SMTP id d75a77b69052e-451d41fddf9mr10334281cf.4.1723093258663;
        Wed, 07 Aug 2024 22:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723093258; cv=none;
        d=google.com; s=arc-20160816;
        b=OFjljgSy1V+g6uMweD9RRSPeMFKkm2qqgrESP9u/IJiTdQq8iLOIoCOK2UxEMF9HqQ
         VyTXbSJkzk/aJrT7PXuBS8Wnqg4N1bIU13BDIHiGlsS8KA1ZyCa9bLMfGCNfFwScBg2D
         RCAW15kahkc/NL2tQ7YvpwEGkRwAbbt6SrhLlP4/vkqB1IlONjG/3KT/BN7OO4rfshv8
         FY+15SSf/lC0OBppLmjHnIt0cEM3AbIXZhbKcvegbMHbNBsuiQhPdC0AeIYT7hYP1CN4
         26EMsLktOFEHvzF6QDgOzsy3gOvd1XHtuvy+pJmchBJvUWpaGmIGkz72RrmwgjLBww8P
         lPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0ihoOFw7AHMWU6FOT7xSns/bZxoSE0oO5FA9DUu6yQE=;
        fh=OM48rijVkgI9bYP1ZFziwtIoCrhFCqqPT8UpYji0Gbk=;
        b=MvTuW523QRZb5dYAt016XzY6USVwEhpwNuMk+z2/ZYyduQQq48SLDvT0lGs41JYvZe
         B9n5/uu3p2jkd5xS9JYOhYaQcPYMB2Zafeux4kasmACt8oy0G/ieDl3F81MnEHJZfytV
         kVQnHl8FllWu2/w8spQsMLmOg+nH4bgQna35k+9RG+knd4S86uBqSos8d/8h6G81X1Wg
         XThrLQ2UqoJlHw+U4bS9jTq34tu3e3K5KJPjc38jiXlLJgUD+hhE/8zmOHo1Ckx0etGD
         0S02XKP/zyAFAladEjETmPoqmXb24sxZLbYZoayq4YnVuJZxzYC8GfUIU0utpddLLSGq
         rtNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NFpOhbzG;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-451c8834d7bsi33004131cf.637.2024.08.07.22.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 22:00:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NFpOhbzG;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723093258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ihoOFw7AHMWU6FOT7xSns/bZxoSE0oO5FA9DUu6yQE=;
	b=NFpOhbzGgH+1qXM7wQeEtIj4/P+cYb/jJBxmyb66DHqychEE6lfkVLjkGmIN6rugQbEYcV
	wHEe5m2X/YIo+4X9z0ABePiMb5g56qXOvITvV64Viridru/Dor6MjqSG6579I9jh53iOM7
	bo5fqxdXCy5pC2yPBaPVGCudEbjYGCs=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-n71olerbOZC61pDtwGhxLw-1; Thu, 08 Aug 2024 01:00:56 -0400
X-MC-Unique: n71olerbOZC61pDtwGhxLw-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7a3c6dd559aso649944a12.1
        for <alex.bennee@linaro.org>; Wed, 07 Aug 2024 22:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723093255; x=1723698055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ihoOFw7AHMWU6FOT7xSns/bZxoSE0oO5FA9DUu6yQE=;
        b=qJ/L4YuoD+VbN593bNLAl8Q4LyXVkVVZaMglitcHxgSYbi6MA5UjgvEv449wmDf+Mo
         6IyPF0tClX+VLxUccIsvQE130rtu+rMMqy38iLZPpFtinlRhXeUY1MlxBGqfH0UkRmfj
         M+tfodmDsjZN11AZWQl4KlEIqKQtqJnBBPvIfjhbpYuUvzuADFfES44miCACpDQePCdm
         vqa3Oi7DHWnTIV1Puv1kXom7/rTKk8oCxU9Ico/quU48QLIPTUoIw0qSyATYnUaPSIqV
         5TJTUrWDVVS1wtNL5Gg0biwGoRdIVxQ5HJrSN6wHwlEVoYKy2uVyhk6V9F/c/S4yNeLw
         7JYw==
X-Forwarded-Encrypted: i=1; AJvYcCXs3CX4XK/+5YawUiIerAtIUDISAv2gr6r88hiXYf7LHo3elBNaB5VXFrhD13pzTGUi1PJoV5gw5pL3EzYg92EMsPcTALA9
X-Gm-Message-State: AOJu0YymafTik6OHLHNYCKh0t1+tLrAhh/SVSaeInW1LREmHpsaLKJrA
	H5w0YHZjLclLjC5BK3dcvLx7ML1tiH32j4MgM49tUm1iFDYSE3u4Fkf7kte+qCqn8csYiFqYBRF
	U4Di7ZpeoPvMnk0LJ2/eXPuVM0pkkO31AEeKAUwJCDbQ4r5a6SY3N4w==
X-Received: by 2002:a05:6a20:9499:b0:1c6:91e1:f0fc with SMTP id adf61e73a8af0-1c6fcfec811mr525820637.48.1723093255473;
        Wed, 07 Aug 2024 22:00:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:9499:b0:1c6:91e1:f0fc with SMTP id adf61e73a8af0-1c6fcfec811mr525783637.48.1723093255009;
        Wed, 07 Aug 2024 22:00:55 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([43.252.112.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b763944181sm9196191a12.44.2024.08.07.22.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 22:00:54 -0700 (PDT)
Message-ID: <0472ca81-44ca-43f2-a3fe-9774b421f201@redhat.com>
Date: Thu, 8 Aug 2024 15:00:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 00/29] Support of Virtual CPU Hotplug for ARMv8
 Arch
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
 <96d3ed46602b44519c578582b7e2ab16@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <96d3ed46602b44519c578582b7e2ab16@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: aIri7Qbyfl2x

Hi Salil,

On 8/8/24 2:07 AM, Salil Mehta wrote:
> I tested ARM arch specific patches with the latest Qemu which contains below mentioned
> fix and I cannot reproduce the crash. I used kernel linux-6.11-rc2 and it booted successfully.
> Though I did see a kernel crash on attempting to hotplug first vCPU.
> 
> (qemu) device_add host-arm-cpu,id=core4,core-id=4
> (qemu) [  365.125477] Unable to handle kernel write to read-only memory at virtual address ffff800081ba4190
> [  365.126366] Mem abort info:
> [  365.126640]   ESR = 0x000000009600004e
> [  365.127010]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  365.127524]   SET = 0, FnV = 0
> [  365.127822]   EA = 0, S1PTW = 0
> [  365.128130]   FSC = 0x0e: level 2 permission fault
> [  365.128598] Data abort info:
> [  365.128881]   ISV = 0, ISS = 0x0000004e, ISS2 = 0x00000000
> [  365.129447]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> [  365.129943]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  365.130442] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000045830000
> [  365.131068] [ffff800081ba4190] pgd=0000000000000000, p4d=10000000467df003, pud=10000000467e0003, pmd=0060000045600781
> [  365.132069] Internal error: Oops: 000000009600004e [#1] PREEMPT SMP
> [  365.132661] Modules linked in:
> [  365.132952] CPU: 0 UID: 0 PID: 11 Comm: kworker/u24:0 Not tainted 6.11.0-rc2 #228
> [  365.133699] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
> [  365.134415] Workqueue: kacpi_hotplug acpi_hotplug_work_fn
> [  365.134969] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  365.135679] pc : register_cpu+0x138/0x250
> [  365.136093] lr : register_cpu+0x120/0x250
> [  365.136506] sp : ffff800082cbba10
> [  365.136847] x29: ffff800082cbba10 x28: ffff8000826479c0 x27: ffff000000a7e098
> [  365.137575] x26: ffff8000827c2838 x25: 0000000000000004 x24: ffff80008264d9b0
> [  365.138311] x23: 0000000000000004 x22: ffff000012a482d0 x21: ffff800081e30a00
> [  365.139037] x20: 0000000000000000 x19: ffff800081ba4190 x18: ffffffffffffffff
> [  365.139764] x17: 0000000000000000 x16: 0000000000000000 x15: ffff000001adaa1c
> [  365.140490] x14: ffffffffffffffff x13: ffff000001ada2e0 x12: 0000000000000000
> [  365.141216] x11: ffff800081e32780 x10: 0000000000000000 x9 : 0000000000000001
> [  365.141945] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : 6f7274726e737460
> [  365.142668] x5 : ffff0000027b1920 x4 : ffff0000027b1b40 x3 : ffff0000027b1880
> [  365.143400] x2 : ffff0000001933c0 x1 : ffff800081ba4190 x0 : 0000000000000010
> [  365.144129] Call trace:
> [  365.144382]  register_cpu+0x138/0x250
> [  365.144759]  arch_register_cpu+0x7c/0xc4
> [  365.145166]  acpi_processor_add+0x468/0x590
> [  365.145594]  acpi_bus_attach+0x1ac/0x2dc
> [  365.146002]  acpi_dev_for_one_check+0x34/0x40
> [  365.146449]  device_for_each_child+0x5c/0xb0
> [  365.146887]  acpi_dev_for_each_child+0x3c/0x64
> [  365.147341]  acpi_bus_attach+0x78/0x2dc
> [  365.147734]  acpi_bus_scan+0x68/0x208
> [  365.148110]  acpi_scan_rescan_bus+0x4c/0x78
> [  365.148537]  acpi_device_hotplug+0x1f8/0x460
> [  365.148975]  acpi_hotplug_work_fn+0x24/0x3c
> [  365.149402]  process_one_work+0x150/0x294
> [  365.149817]  worker_thread+0x2e4/0x3ec
> [  365.150199]  kthread+0x118/0x11c
> [  365.150536]  ret_from_fork+0x10/0x20
> [  365.150903] Code: 91064021 9ad72000 8b130c33 d503201f (f820327f)
> [  365.151527] ---[ end trace 0000000000000000 ]---
> 

Should be fixed by: https://lkml.org/lkml/2024/8/8/155

Thanks,
Gavin
