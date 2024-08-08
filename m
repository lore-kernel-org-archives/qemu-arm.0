Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp333537njc;
        Wed, 7 Aug 2024 17:29:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNpJE4PGNQ64IbpTQoYMZmPSY5FbKnB0kzCnhOnUfVstCo/CUQVZ1pc5mLV3ecYbvxr6MUVRAR0EH3dTeyjg2TDG/3kXGr
X-Google-Smtp-Source: AGHT+IEVVIAJgquoRNb7ojG4RP4Q8cDDmco7VEderEu7r1r3Ay06QSB2b7GtbaLB+vp0LJ9GSwvF
X-Received: by 2002:a05:620a:c54:b0:79f:c0d:782b with SMTP id af79cd13be357-7a381800e77mr32549985a.39.1723076974781;
        Wed, 07 Aug 2024 17:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723076974; cv=none;
        d=google.com; s=arc-20160816;
        b=t+swTgP0gG+iGUFlWd8BulmIKxF3nlIwxKH42zb3unOmgLz2G+mNf3Z1TYqTaE7F6x
         gCJo4NgH0hqMpJOUkdzmyQK+zsVZZQ8/LfuSdqZ9zOXNhvTb13zwDFjblELVM2aCUd9Q
         Cm1IUcyamzqpcYFzes2VcUs0VZG5jhsyeL8fEKXLXh7r629nR2ULjaK5mEFiB5inyEaO
         3ZD/eMhb/1PfW17aCUJ6yW50i/jyH/Jr+/HtIYgtqgqoZrZ73Phsd3xLGu9XLiFXTU9j
         N3ku86BoOza04KCmTZY5Fp7eRLhkEFblfiB4LmF8KuLbTitawX/5/Nx49qxsMAMhMK1Q
         KbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WrMaMzXxTXz5EkN9dkHMxGGBtGK6F8RPYjQSvmi0P7w=;
        fh=mnzWeW7FC572ljxLNgu5DAJhM1aEuU0D1TBfVsFnMPA=;
        b=HE0siTzZGT+xbAz6VuurHdKh6oRfr1a/J6zjAV+Blj7H7xcZtObPA2Gtwi/0QV2BTV
         W5HPm+++m5U/G3f89VVnXUhAoqhEJfjeshMiYMtgSlVPFcZdcfSFSioAEL/PQmsMLhpX
         nZmrSjkW+4aDk4JeaM3idEuu9yqTmJYzTBwPte3lS50qRxjBL/q44t8eL9NjykbX3bE5
         0ECTedd+tVwGyYDULMDsap5NTeXpn8D80tHLgauVE9O7+3g92mYyv6CW1fMy+Twht/gF
         8sMnJuNbWNzA0eqcM3+aK09H8HQ3f+4TKwtGDm/insbEk8CIN7i+j0DW38uJIIyhW+si
         C9Hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FU/uSV69";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a378805b0csi298106185a.317.2024.08.07.17.29.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 17:29:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FU/uSV69";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723076974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WrMaMzXxTXz5EkN9dkHMxGGBtGK6F8RPYjQSvmi0P7w=;
	b=FU/uSV69jtLgHyxDt9ACmSUAOfj8YYNP3L2gM+rTj88/WmgV3vfTr1lGlegAyMweC+B6jB
	4tQeMPlPopWedPNrUDeTQk3UJ5V1s/vxzA2nmTD5Q/vNHGfanqxOszVz3kTo1ka0ir+Nij
	wOqJ7bklfrJOeXcMnQpuaFa1yg06swE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-29HuuphFOpa6fqozV4ZNww-1; Wed, 07 Aug 2024 20:29:33 -0400
X-MC-Unique: 29HuuphFOpa6fqozV4ZNww-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1fc6f3ac7beso4452825ad.1
        for <alex.bennee@linaro.org>; Wed, 07 Aug 2024 17:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723076972; x=1723681772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrMaMzXxTXz5EkN9dkHMxGGBtGK6F8RPYjQSvmi0P7w=;
        b=Q0sn2D1jY7GEeWJmNK4aIm+jWC33H+uNOenI+cFGHxJwcgajASahYkDpHIpT4t8FNl
         KOC2trCl7wN5HABbISoRVfcfcBotYxrTVt9dUjKOSOaZ7c0+Z6N8IOn2z06lLzfJaw6E
         qpPsAYOE/4Gkb9LApkDoJS2biKMmRJm9t+SnUE53Wj2VaPZFenvYSQsZx5af8Puv2Lfd
         Hl4DOpzNpFvfqXtqWyWMBMsoXSaoXSMAnBxSk24C2jCcva1NuVSIKRIK3dek+yrX8RvI
         Uqu80vWfsaIuakRw1S54PtvWhE+h3NCOXExwIe68cbyfUUkEw4j7TCwMGHOwdSn/4S8H
         OUlg==
X-Forwarded-Encrypted: i=1; AJvYcCWLNpbuVmy+l904Isx/WpETt3wmRg8e5WyiWcgLzpX5QWB4sO5htYkWwj1fE61CTcdqcTx5LoZwFAqeLVeeb2kasYpIh2m+
X-Gm-Message-State: AOJu0Yyw+20QUWylQGuzUpyXYTRc/kNjOJeTyvmxjf+Wu2Unxfd6v43X
	oD4F95zbcLfvpuKFHiPEnRysCIUtvZ2CJWP6fmZf6z8I5Q1yUs1kOVaqYHHB9mK7Olh5rAdHOft
	QCcnK+098TXIiZGp0QMw5Ga79yX3pnHbOLejf/u15M2qE8bqdsrP6Wg==
X-Received: by 2002:a17:902:e80c:b0:1fb:cffb:cfc1 with SMTP id d9443c01a7336-2009521fb01mr5130375ad.4.1723076972072;
        Wed, 07 Aug 2024 17:29:32 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:1fb:cffb:cfc1 with SMTP id d9443c01a7336-2009521fb01mr5129885ad.4.1723076971595;
        Wed, 07 Aug 2024 17:29:31 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([43.252.112.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f21718sm112426825ad.59.2024.08.07.17.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 17:29:30 -0700 (PDT)
Message-ID: <c2dce623-ee44-47d5-b9cb-73481a86b75f@redhat.com>
Date: Thu, 8 Aug 2024 10:29:16 +1000
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
 <5843f79d-c9b7-45bf-a2b1-2ae4c7babf46@redhat.com>
 <44d06db6ec1b416d8817b7cf5043ddf8@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <44d06db6ec1b416d8817b7cf5043ddf8@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: g9bm2k+qHBli

Hi Salil,

On 8/8/24 9:48 AM, Salil Mehta wrote:
>>   On 8/7/24 11:27 PM, Salil Mehta wrote:
>>   >
>>   > Let me figure out this. Have you also included the below patch along
>>   > with the architecture agnostic patch-set accepted in this Qemu cycle?
>>   >
>>   > https://lore.kernel.org/all/20240801142322.3948866-3-peter.maydell@lin
>>   > aro.org/
>>   >
>>   
>>   There are no vCPU fd to be parked and unparked when the core dump
>>   happenes. I tried it, but didn't help. I added more debugging messages and
>>   the core dump is triggered in the following path. It seems 'cpu-
>>   >sve_vq.map' isn't correct since it's populated in CPU realization path, and
>>   those non-cold-booted CPUs aren't realized in the booting stage.
> 
> 
> Ah, I've to fix the SVE support. I'm already working on it and will be part of
> the RFC V4.
> 
> Have you tried booting VM by disabling the SVE support?
> 

I'm able to boot the guest after SVE is disabled by clearing the corresponding
bits in ID_AA64PFR0, as below.

static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
{
     :

     /*
      * SVE is explicitly disabled. Otherwise, the non-cold-booted
      * CPUs can't be initialized in the vCPU hotplug scenario.
      */
     err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
                          ARM64_SYS_REG(3, 0, 0, 4, 0));
     ahcf->isar.id_aa64pfr0 &= ~R_ID_AA64PFR0_SVE_MASK;
}

However, I'm unable to hot-add a vCPU and haven't get a chance to look
at it closely.

(qemu) device_add host-arm-cpu,id=cpu,socket-id=1
(qemu) [  258.901027] Unable to handle kernel write to read-only memory at virtual address ffff800080fa7190
[  258.901686] Mem abort info:
[  258.901889]   ESR = 0x000000009600004e
[  258.902160]   EC = 0x25: DABT (current EL), IL = 32 bits
[  258.902543]   SET = 0, FnV = 0
[  258.902763]   EA = 0, S1PTW = 0
[  258.902991]   FSC = 0x0e: level 2 permission fault
[  258.903338] Data abort info:
[  258.903547]   ISV = 0, ISS = 0x0000004e, ISS2 = 0x00000000
[  258.903943]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[  258.904304]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[  258.904687] swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000b8e24000
[  258.905258] [ffff800080fa7190] pgd=10000000b95b0003, p4d=10000000b95b0003, pud=10000000b95b1003, pmd=00600000b8c00781
[  258.906026] Internal error: Oops: 000000009600004e [#1] PREEMPT SMP
[  258.906474] Modules linked in:
[  258.906705] CPU: 0 UID: 0 PID: 29 Comm: kworker/u8:1 Not tainted 6.11.0-rc2-gavin-gb446a2dae984 #7
[  258.907338] Hardware name: QEMU KVM Virtual Machine, BIOS edk2-stable202402-prebuilt.qemu.org 02/14/2024
[  258.908009] Workqueue: kacpi_hotplug acpi_hotplug_work_fn
[  258.908401] pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
[  258.908899] pc : register_cpu+0x140/0x290
[  258.909195] lr : register_cpu+0x128/0x290
[  258.909487] sp : ffff8000817fba10
[  258.909727] x29: ffff8000817fba10 x28: 0000000000000000 x27: ffff0000011f9098
[  258.910246] x26: ffff80008167b1b0 x25: 0000000000000001 x24: ffff80008153dad0
[  258.910762] x23: 0000000000000001 x22: ffff0000ff7de210 x21: ffff8000811b9a00
[  258.911279] x20: 0000000000000000 x19: ffff800080fa7190 x18: ffffffffffffffff
[  258.911798] x17: 0000000000000000 x16: 0000000000000000 x15: ffff000005a46a1c
[  258.912326] x14: ffffffffffffffff x13: ffff000005a4632b x12: 0000000000000000
[  258.912854] x11: 0000000000000040 x10: 0000000000000000 x9 : ffff8000808a6cd4
[  258.913382] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefefefefefeff
[  258.913906] x5 : ffff0000053fab40 x4 : ffff0000053fa920 x3 : ffff0000053fabb0
[  258.914439] x2 : ffff000000de1100 x1 : ffff800080fa7190 x0 : 0000000000000002
[  258.914968] Call trace:
[  258.915154]  register_cpu+0x140/0x290
[  258.915429]  arch_register_cpu+0x84/0xd8
[  258.915726]  acpi_processor_add+0x480/0x5b0
[  258.916042]  acpi_bus_attach+0x1c4/0x300
[  258.916334]  acpi_dev_for_one_check+0x3c/0x50
[  258.916689]  device_for_each_child+0x68/0xc8
[  258.917012]  acpi_dev_for_each_child+0x48/0x80
[  258.917344]  acpi_bus_attach+0x84/0x300
[  258.917629]  acpi_bus_scan+0x74/0x220
[  258.917902]  acpi_scan_rescan_bus+0x54/0x88
[  258.918211]  acpi_device_hotplug+0x208/0x478
[  258.918529]  acpi_hotplug_work_fn+0x2c/0x50
[  258.918839]  process_one_work+0x15c/0x3c0
[  258.919139]  worker_thread+0x2ec/0x400
[  258.919417]  kthread+0x120/0x130
[  258.919658]  ret_from_fork+0x10/0x20
[  258.919924] Code: 91064021 9ad72000 8b130c33 d503201f (f820327f)
[  258.920373] ---[ end trace 0000000000000000 ]---

Thanks,
Gavin

