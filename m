Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp627037dlb;
        Wed, 7 Aug 2024 16:41:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFVGxvONDPg4xc4fXX39BxogGz4mfoXTj6HgkpAyjTeVkVAFDf5UqRxBjqYTtKSzl4ku5DelM0pXdN9cn+1fytfI19tH1N
X-Google-Smtp-Source: AGHT+IF3wmpdzfIWTwz5FWY+OjZSPzBBPpCbcaHPrZ0LjQ2Fzey2vssO8KSr2YAeoU4UR/fIPLiU
X-Received: by 2002:a05:690c:23c9:b0:65f:7cee:43b with SMTP id 00721157ae682-69bf899bc54mr663157b3.19.1723074086068;
        Wed, 07 Aug 2024 16:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723074086; cv=none;
        d=google.com; s=arc-20160816;
        b=ozKQ8GVK3gclkrQt8G6uMr2fzR2zUoxUK//u5kf2qjsj06nLOuriuM7AHRzOgzdgKr
         uqZRHVo8/dX+8QzocPxQZjIrS+aQpyumM9/Z0jarEbOEeE5DD8/LvTYEdFivgCzxgtwI
         mejEgscyLEBl7w/sVqmlRMl7YpQObHSoutXmobn5R659z4CHU8YdYMYdvcfddDQtc3pF
         MTDhoYfhTscdKniidEv8uXzfUiRANYY75b7iQEtCPST4MKT9O9ThwAApP9+eDhwPSNdT
         zhzSC30sB7zDVOnyTdk6MD7kXkAmUxYZlxTdjzKmVUQydu/t8xCKHbkHjo0wsc8xIxTX
         Iu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OK8o6LiB64gg3rbZ44dTktT1nC/tX//oU09+DhB7ekQ=;
        fh=eEgIZE9Sx2TcxjSUjSg7jpqINVugz2LC+XHKFe1r8eM=;
        b=yDKfgim2UJbgyvAmok5FHxK65okSAQdcB9WRSZN5qvXvAlPyvDppmscY9sB3BiLKHf
         lmonpz7Bi740DWgMmMtXiiWzeISoGMEn5H2M0MsvvWrC+5OPZ8xV3un0G+6VEVxCDZQt
         s/6JdBmtMRkZORG57tMxc3gwcVBI3g5RydY6P/5EuHE5Oh/ioMazj7xSsAelVMJ6afys
         V0fKrLdRJKf1DBD0AOaZgz0TaXnrk1Tr8KeKI6MasbhdCVnAsOt7kuQaV71feFnT1rPp
         0lTkZLsnnZOisEVUQY7RLHMro2Ppjg1OPt+GL/Eq3oZNbM23Uioc40uuaHUyxTvz4OEx
         UE5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fhfaE11W;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a3788713b4si277740785a.688.2024.08.07.16.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 16:41:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fhfaE11W;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723074085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OK8o6LiB64gg3rbZ44dTktT1nC/tX//oU09+DhB7ekQ=;
	b=fhfaE11Wtbe5YhB4yMZCoBN78qvg1dxDqDHZksSmhnUzscgWKoFjwdtNdVAlqVoVM3VBT8
	KCT+2l/aFSRsI+R4x2sbBKgr7bxxpmQJlcFx3FbMJlK1rYGPuxfAzQNY3AiLA1AVYYFhH/
	rig5qQENvpwXgBwSI7b5wDD+/RFyJqE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-VVBF0_KKNQ6jKWtsBbDt-g-1; Wed, 07 Aug 2024 19:41:24 -0400
X-MC-Unique: VVBF0_KKNQ6jKWtsBbDt-g-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1fc5b60f416so4256065ad.3
        for <alex.bennee@linaro.org>; Wed, 07 Aug 2024 16:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723074083; x=1723678883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OK8o6LiB64gg3rbZ44dTktT1nC/tX//oU09+DhB7ekQ=;
        b=kiDFkx5Nt6fQSqkKfGGvaqzl1FjW/AjyXI8YHeflaiBOsvGqSRM922JSRIc7axCwJ6
         nBKZRvoJSYCyaCK4YTs5xbrQuHsM5mHCScOrAVpWWO6m6gbKBUtMhz1fKGK/jzuKM1Za
         DeiSRrL+klEPHteb/NStjiUhWHhhH7AcT/OGyPQnTS5LaLQRjCPY6im8fv8439rYCEzW
         /I6wBgbg0qvj2sLG9rXbUwlMum9jsWFhzFJAGIREKiGIiAtZyVNULzoF/ftIepwfPvwd
         bbCqIqDULZuwCLxYfdfs9AYzzSpwHxjvGW+FwA9qnuzU9aeFQ13oBqgIwB2pYK9Bj4ZW
         4UCA==
X-Forwarded-Encrypted: i=1; AJvYcCUqtpNrT7KrYjbrj12gDnep3dl6ul0kYEsp7MqbeDRZbLm2YGIy6EqzBWgDdV6TwoBNsw5VZCmvehtYWrnR9Gtaq8xYaEJl
X-Gm-Message-State: AOJu0YwA/W150VvFfSib3zUYWC79HdNkTu9RD0YrlrbJt45ZuftemDwV
	tlCgJggol8fQR309L5GClcv2tCTOrOI9VOC1U6hpD9Ni7H16cp9qaep9IDsGziiSNKhFb/R49tr
	t2gNvbLBOSoJJOXEl2wpSoehDLmmZarO/JuorR3rsBHfwFwNYu0lt/g==
X-Received: by 2002:a17:902:ced1:b0:1fd:ac9f:4050 with SMTP id d9443c01a7336-200952641a4mr2890825ad.35.1723074083330;
        Wed, 07 Aug 2024 16:41:23 -0700 (PDT)
X-Received: by 2002:a17:902:ced1:b0:1fd:ac9f:4050 with SMTP id d9443c01a7336-200952641a4mr2890515ad.35.1723074082876;
        Wed, 07 Aug 2024 16:41:22 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([43.252.112.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5917a466sm111773785ad.220.2024.08.07.16.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 16:41:21 -0700 (PDT)
Message-ID: <5843f79d-c9b7-45bf-a2b1-2ae4c7babf46@redhat.com>
Date: Thu, 8 Aug 2024 09:41:07 +1000
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ed0a5631e0674c2aa4679f2388f40127@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: jrlBArsPjcT5

Hi Salil,

On 8/7/24 11:27 PM, Salil Mehta wrote:
> 
> Let me figure out this. Have you also included the below patch along with the
> architecture agnostic patch-set accepted in this Qemu cycle?
> 
> https://lore.kernel.org/all/20240801142322.3948866-3-peter.maydell@linaro.org/
>  

There are no vCPU fd to be parked and unparked when the core dump happenes. I
tried it, but didn't help. I added more debugging messages and the core dump is
triggered in the following path. It seems 'cpu->sve_vq.map' isn't correct since
it's populated in CPU realization path, and those non-cold-booted CPUs aren't
realized in the booting stage.

# dmesg | grep "Scalable Vector Extension"
[    0.117121] CPU features: detected: Scalable Vector Extension

# start_vm
===> machvirt_init: create CPU object (idx=0, type=[host-arm-cpu])
cpu_common_initfn
arm_cpu_initfn
aarch64_cpu_initfn
aarch64_cpu_instance_init
aarch64_host_initfn
arm_cpu_post_init
===> machvirt_init: realize CPU object (idx=0)
virt_cpu_pre_plug
arm_cpu_realizefn
cpu_common_realizefn
virt_cpu_plug
===> machvirt_init: create CPU object (idx=1, type=[host-arm-cpu])
cpu_common_initfn
arm_cpu_initfn
aarch64_cpu_initfn
aarch64_cpu_instance_init
aarch64_host_initfn
arm_cpu_post_init
kvm_arch_init_vcpu: Error -22 from kvm_arm_sve_set_vls()
qemu-system-aarch64: Failed to initialize host vcpu 1
Aborted (core dumped)

Thanks,
Gavin

>>   
>>   With this series and latest upstream Linux kernel (host), I ran into core
>>   dump as below.
>>   I'm not sure if it's a known issue or not.
>>   
>>   # uname -r
>>   6.11.0-rc2-gavin+
>>   # /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 -accel
>>   kvm \
>>      -machine virt,gic-version=host,nvdimm=on -cpu host                 \
>>      -smp maxcpus=2,cpus=1,sockets=2,clusters=1,cores=1,threads=1       \
>>      -m 4096M,slots=16,maxmem=128G                                      \
>>      -object memory-backend-ram,id=mem0,size=2048M                      \
>>      -object memory-backend-ram,id=mem1,size=2048M                      \
>>      -numa node,nodeid=0,memdev=mem0,cpus=0-0                           \
>>      -numa node,nodeid=1,memdev=mem1,cpus=1-1                           \
>>        :
>>   qemu-system-aarch64: Failed to initialize host vcpu 1 Aborted (core
>>   dumped)
>>   
>>   # gdb /var/lib/systemd/coredump/core.0
>>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64
>>   (gdb) bt
>>   #0  0x0000ffff9eec42e8 in __pthread_kill_implementation () at
>>   /lib64/libc.so.6
>>   #1  0x0000ffff9ee7c73c in raise () at /lib64/libc.so.6
>>   #2  0x0000ffff9ee69034 in abort () at /lib64/libc.so.6
>>   #3  0x0000aaaac71152c0 in kvm_arm_create_host_vcpu
>>   (cpu=0xaaaae4c0cb80)
>>        at ../target/arm/kvm.c:1093
>>   #4  0x0000aaaac7057520 in machvirt_init (machine=0xaaaae48198c0) at
>>   ../hw/arm/virt.c:2534
>>   #5  0x0000aaaac6b0d31c in machine_run_board_init
>>        (machine=0xaaaae48198c0, mem_path=0x0, errp=0xfffff754ee38) at
>>   ../hw/core/machine.c:1576
>>   #6  0x0000aaaac6f58d70 in qemu_init_board () at ../system/vl.c:2620
>>   #7  0x0000aaaac6f590dc in qmp_x_exit_preconfig (errp=0xaaaac8911120
>>   <error_fatal>)
>>        at ../system/vl.c:2712
>>   #8  0x0000aaaac6f5b728 in qemu_init (argc=82, argv=0xfffff754f1d8) at
>>   ../system/vl.c:3758
>>   #9  0x0000aaaac6a5315c in main (argc=82, argv=0xfffff754f1d8) at
>>   ../system/main.c:47
>>   
>>   Thanks,
>>   Gavin
>>   
> 
