Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1957062njf;
        Sun, 18 Aug 2024 22:31:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPmvA2Kwlob7whfQpsiftRLYDcBhZy2wpZEsz5HKQFlMfo4PQSeR2E9Cp6P9nxEy4KnJENnu9QWeFYAhzSiOceltMp1v0e
X-Google-Smtp-Source: AGHT+IHIprcfHDCmmmuNaoGdHRRd4cO5zYhNOUnIlT5stuvVHgMvQXPFhNbySrPr/pNfxg5J1GhW
X-Received: by 2002:a05:622a:5295:b0:453:5dab:8e85 with SMTP id d75a77b69052e-453741e1e28mr102144731cf.8.1724045517515;
        Sun, 18 Aug 2024 22:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724045517; cv=none;
        d=google.com; s=arc-20160816;
        b=bQtatvRgU9dMxg6oTyvqyopQdwPQt8gTCw951AmW1r141EVwIsKEyyo3ywmetYJRJM
         OhKY4uSIDxwdTaz42NOThx6v8CH41OJpiK2FCY9ww/HmaZ8clE4RbsHiBDDmSyuiTrs1
         289ah2RmiO/WIfu3vwNikt6ib5yrzFXTT+2p3wYdRWwcfKsaQvYl75JcVgKCTsuGb3mU
         R4SMLmQAsUBHTRwCALVzrFTEZ3VkHdpWOib8WKyhFHzh2S5OFQ4WYNMdRx638BNJpMEe
         +/XtpqvtaGj47xsyK79t39aGXY9jCkXYhBV7zbnGOD3ybUSw/K3yhwZR0NlkxQnh/vd2
         88dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RH0ysvCwiDD6BUVvceG6WstRkYD2wwJ9b+IfnvkifDM=;
        fh=FC4WyGgKWK1dmcrO+1EWhvGJkaxsyJoqiF7B9bk5Dlg=;
        b=SB3YFG8uY2plsaFEG8AVTQ2qZHHbcaMsGwEcWsMwoHiE0blEK7h7d3EBqdb8qCp47J
         yxPhoTMTbfJ1LMWFcZylpdoMa6+GwlrQZxTw2zeLBqmTfccchfoGq4iT/+ThIINY0V1v
         4lODlxzo2watFOnP8uMvuIVBo+D4ij1rlHe+io9CgZ4lBW28/asDJUvcOy0DCuTa77BY
         9k5/ontB3q0/ilDkJn3Ci4Lid30aE1mkYzCMDIoP3QeGjwMp5EVUz6ceEr0yVrXtd1qG
         2Z7N/CRRkGYW2w/AVwhHy/XueiJ32GyXcFq2OAlLuP4q3iu6hnwr282CVCWKevSfRjbo
         AhLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FH1/iWQM";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4536a08eecfsi95366491cf.466.2024.08.18.22.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 22:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FH1/iWQM";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724045517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RH0ysvCwiDD6BUVvceG6WstRkYD2wwJ9b+IfnvkifDM=;
	b=FH1/iWQMHFZ8wqWA/dz7JJCYELe4JzY+AVR6kEqwy8VX+4yTfi5hf5UjjMvV9w0vxjOcXy
	yZCLzlyg1MsamOf7I8tABnr2PzNaJHNjbv/a5os/5kljmB2qH0jOeFue5Lgtnv6dR10s/s
	LWVW8mOjnG/CrkyERSxhZGws3nfrivc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-RIhf1rSGNyqTioBxCRr77A-1; Mon, 19 Aug 2024 01:31:55 -0400
X-MC-Unique: RIhf1rSGNyqTioBxCRr77A-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2d40752d653so1372103a91.0
        for <alex.bennee@linaro.org>; Sun, 18 Aug 2024 22:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724045514; x=1724650314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RH0ysvCwiDD6BUVvceG6WstRkYD2wwJ9b+IfnvkifDM=;
        b=wcMyytd2ogz4W2GRbNx40ORSG3iBZfRjYBYUDq4tHadC+n7UWQFNpG+HvGAtgiHIzq
         IzWDb5HJtfrt3su5FO92qq4quNUixWO34yBkFGu9rSD33+dLuKOLYgtSROQmZyjfrijv
         hz30xnqXnd1Dbv40hrCuwisDASDX7tzVIf/DYR8zAq/LMKkRgxRE2ZCL8s7oRdpaQdQ5
         Ch7GPY7kwrDsBUHblg9NkjqzDLBsCV5Cl4PWJZKHUf3IEVwvnQxDcTjZQp1rV+MLFr3y
         jFYiXVDI1t3Yjy8xPQqN5xRMMOZYbTfnAhS9CwvnTd9iw3n4K2ti61xdzqXe67c1o7/5
         iorw==
X-Forwarded-Encrypted: i=1; AJvYcCWw+0E1dGS0ORARX3oVaxCr6SXo8wipyDyMPB86xRgBQyyyO5sEuenvMF+dhspPxskdbi1Z3aXJCqrpxg3O4S/vbj21tY+f
X-Gm-Message-State: AOJu0YxYLTbii8GdeOGESgMC3jLRUgKFUu9EKFhSwlQtFdSOm2xeP6nU
	BVTqWVaSO4RHK5AoSR3m+XVOvEPhqRU96b4DvTp+p15XJpPXMULLO3RKEnyW2srrwSRlBhm3lUR
	EeHi00CaX/6kJSFJ2upyyljQU9l4cjb6V2Me8evYC+vbjlEbwdyLyBA==
X-Received: by 2002:a17:90a:8c11:b0:2d3:c05c:c51 with SMTP id 98e67ed59e1d1-2d3dfacb1eemr8581391a91.0.1724045514184;
        Sun, 18 Aug 2024 22:31:54 -0700 (PDT)
X-Received: by 2002:a17:90a:8c11:b0:2d3:c05c:c51 with SMTP id 98e67ed59e1d1-2d3dfacb1eemr8581366a91.0.1724045513697;
        Sun, 18 Aug 2024 22:31:53 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([103.210.27.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7dcfc7sm10154019a91.14.2024.08.18.22.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 22:31:53 -0700 (PDT)
Message-ID: <28f3107f-0267-4112-b0ca-da59df2968ae@redhat.com>
Date: Mon, 19 Aug 2024 15:31:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 06/29] arm/virt,kvm: Pre-create disabled possible
 vCPUs @machine init
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com,
 zhao1.liu@intel.com, linuxarm@huawei.com
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-7-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240613233639.202896-7-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: DDx+vzEYtoB4

On 6/14/24 9:36 AM, Salil Mehta wrote:
> In the ARMv8 architecture, the GIC must know all the CPUs it is connected to
> during its initialization, and this cannot change afterward. This must be
> ensured during the initialization of the VGIC as well in KVM, which requires all
> vCPUs to be created and present during its initialization. This is necessary
> because:
> 
> 1. The association between GICC and MPIDR must be fixed at VM initialization
>     time. This is represented by the register `GIC_TYPER(mp_affinity, proc_num)`.
> 2. GICC (CPU interfaces), GICR (redistributors), etc., must all be initialized
>     at boot time.
> 3. Memory regions associated with GICR, etc., cannot be changed (added, deleted,
>     or modified) after the VM has been initialized.
> 
> This patch adds support to pre-create all possible vCPUs within the host using
> the KVM interface as part of the virtual machine initialization. These vCPUs can
> later be attached to QOM/ACPI when they are actually hot-plugged and made
> present.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> [VP: Identified CPU stall issue & suggested probable fix]
> ---
>   hw/arm/virt.c         | 56 +++++++++++++++++++++++++++++++++++--------
>   include/hw/core/cpu.h |  1 +
>   target/arm/cpu64.c    |  1 +
>   target/arm/kvm.c      | 41 ++++++++++++++++++++++++++++++-
>   target/arm/kvm_arm.h  | 11 +++++++++
>   5 files changed, 99 insertions(+), 11 deletions(-)
> 

The vCPU file descriptor is associated with a feature bitmap when the file descriptor
is initialized by ioctl(vm_fd, KVM_ARM_VCPU_INIT, &init). The feature bitmap is sorted
out based on the vCPU properties. The vCPU properties can be different when the vCPU
file descriptor is initialized for the first time when the vCPU is instantiated, and
re-initialized when the vCPU is hot added.

It can lead to system crash as below. We probably need a mechanism to disallow passing
extra properties when vCPU is hot added to avoid the conflicts to the global properties
from the command line "-cpu host,pmu=on". Some of the properties like "id", "socket-id"
are still needed.

/home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                  \
-accel kvm -machine virt,gic-version=host,nvdimm=on                      \
-cpu host -smp maxcpus=2,cpus=1,sockets=2,clusters=1,cores=1,threads=1   \
-m 4096M,slots=16,maxmem=128G                                            \
-object memory-backend-ram,id=mem0,size=2048M                            \
-object memory-backend-ram,id=mem1,size=2048M                            \
-numa node,nodeid=0,memdev=mem0,cpus=0-0                                 \
-numa node,nodeid=1,memdev=mem1,cpus=1-1                                 \
-L /home/gavin/sandbox/qemu.main/build/pc-bios                           \
-monitor none -serial mon:stdio -nographic                               \
-gdb tcp::6666 -qmp tcp:localhost:5555,server,wait=off                   \
-bios /home/gavin/sandbox/qemu.main/build/pc-bios/edk2-aarch64-code.fd   \
-kernel /home/gavin/sandbox/linux.guest/arch/arm64/boot/Image            \
-initrd /home/gavin/sandbox/images/rootfs.cpio.xz                        \
-append memhp_default_state=online_movable                               \
     :
(qemu) device_add host-arm-cpu,id=cpu1,socket-id=1,pmu=off
kvm_arch_init_vcpu: Error -22 from kvm_arm_vcpu_init()
qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (1): Invalid argument

Thanks,
Gavin
