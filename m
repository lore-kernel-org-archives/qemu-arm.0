Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp199323dlb;
        Wed, 7 Aug 2024 02:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3BzvFEthO397TbsEyzXUI4awI1ELis3t1B8JEA6Tcwd/FJRRUTvYl9wCBB3CNjJzpPzzgdh92EyZ5y52BRmEPpYWbAYgw
X-Google-Smtp-Source: AGHT+IGbNck5rfIFB54zP/1H22675uc8EEMNL5Pjj0Ol8BYOlf+ThJajKLfhGDGxgdvZFhtdp2fS
X-Received: by 2002:a05:6214:5507:b0:6b5:dcd9:1cb5 with SMTP id 6a1803df08f44-6bb9843129dmr162273976d6.56.1723024445341;
        Wed, 07 Aug 2024 02:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723024445; cv=none;
        d=google.com; s=arc-20160816;
        b=0hkdbm8sNncjdMf3s1QKAQJq/uE5RS1l4dKiWEM0Kqk+bEOx14OC+XLTuNjGBa2YoQ
         Ubd2IR12dTipj79yT26j0OeFKgK5csxfsrfH/F8psmqtRF3lzNx8Kq5kcjUBuqVu5N+C
         xNHnthUYXYK/vUIMXhSrrTRXRi8Pat1EhOnbR+ZEZF6GJtVST9lsgvxecRx2RbzLlPsR
         Pqt1E43sAxAS9G0amEPEdTtqtHjjze33kBzJMdsYxFWZL6LBdEmIItpvdRjZ9KWb5Sm+
         rjwJhsNDcPa8hFuUUqNjfz9jP0DToaiV6Zb7Bx8ldc2S+jS8/r1isw4B5ptPCgvok84D
         gKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=c4rEUNvnBbG0xbJ2RrHigmSaZpS34ff5WQDm5mZqVP0=;
        fh=XrnRO2gaMAWYau1qBICc7KklsfdkrKgL0Q+9Yh30tXc=;
        b=MsrjYhH9IvzRGXDm6wRuE6WkmmpmE6QJJA0qs2vCjxIqwXxcVnSDODDOQZ88p6dnbM
         ZtmMaiWmatS50nkmKmUESASKJL+CWJEb5L3GJ+joHpVV/S7+Z8sz0R0y5ILvXZH2FoaS
         GDhe/O4BFHy3tTwAottHCAIgsFxSRVxsHS/xhuKKcmjd/VXjulJrhlSe6bh6TOe5tAmT
         nZRtk2tjzgf5xr7JTlURXtmKw9muatfqaqoLO9pRj4TXqTATfz1r1Cjo1noMvg+WYchw
         6kYGYTh27Y+34aHShlQobK3OQn0t5Bjqdmhk39VgjU/2WSbbS/djiJtJuppAuxH9NXrm
         1x0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SoZgjzjT;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8f4f35si13996496d6.411.2024.08.07.02.54.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SoZgjzjT;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723024444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4rEUNvnBbG0xbJ2RrHigmSaZpS34ff5WQDm5mZqVP0=;
	b=SoZgjzjTa7OLj+/P2h92536tgUvH9IvvdZQaJeYirZDfSBfLZ5kt58P/HGq3w5G96txS2u
	IOGsnm5REjnKi+3kK4KESGubFZ9pGjXS5es3uC+IoR8QgCAQul+EPRx8EDVkfupAW0RAvn
	ngRRE99y/ThBG5yvNZT58Kq/6ZLaoYc=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-mUQphKqpOfav3d7QQIP_6g-1; Wed, 07 Aug 2024 05:54:03 -0400
X-MC-Unique: mUQphKqpOfav3d7QQIP_6g-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7bbe0ab18caso1699988a12.0
        for <alex.bennee@linaro.org>; Wed, 07 Aug 2024 02:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723024442; x=1723629242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4rEUNvnBbG0xbJ2RrHigmSaZpS34ff5WQDm5mZqVP0=;
        b=sT1uLqiVR6fcZuMxaxsqGRXr84qqWAZn5aqMLGjxsVWRTPV6lkt4ZeI75utOR5d88c
         hyjidCwnV5F2bNQoA8d81ev6ikEAql9GhWpoYYmvEjHpwU7ZtkYNfEJrTb/ORQP6BquL
         6TNuqKTjdkZiqlsVXuMpvYb6hA4b4tAIcZDPlShhR/JA9Y0rnOIP7PsJC8r2mzpiCA7y
         4P9uKa6oVVWrx6I+hhMO43zEVDW0GF81uQUTfuuqsiMWk94nNJ99qUkzlEyFAYo2DGf7
         933s4s4rirLCn/boLiAVRTkNZO+jqhhEYpFrWmxdwnllsTJ9g5j2T0p/EYZuDt61NCFI
         ZCsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrlIjyBAPc866REjuTczqpLnbjYn7DJudvO6QL3j9n5v4g9t7bSbVsGFayl99fRt5nMQ7cK8EF90uQshOfTAidMZoHiWiN
X-Gm-Message-State: AOJu0YyykvPsj4QLhkqTf/fqgw67KeViBxTjSu/B/LGaEp7b9tlVkSH8
	SMs6YRPGTsrvaJ/Zhj3mtzuPu1PvRxe6CIpWMNUYZqeeEAykRuJq1v5GVFKDBAe+I3LGNreX6ww
	JG25K76aGKfz1zuew0jNuaSMHbDhUDsGn6+Jezc9KAZS9hqihHBvKpA==
X-Received: by 2002:a05:6a21:7881:b0:1c4:a5fe:321b with SMTP id adf61e73a8af0-1c6995820ccmr25736542637.18.1723024442655;
        Wed, 07 Aug 2024 02:54:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:7881:b0:1c4:a5fe:321b with SMTP id adf61e73a8af0-1c6995820ccmr25736524637.18.1723024442176;
        Wed, 07 Aug 2024 02:54:02 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([43.252.112.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ed30840sm8061372b3a.210.2024.08.07.02.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 02:54:01 -0700 (PDT)
Message-ID: <41fbfa5a-a10f-4ca0-8a52-e447043ff306@redhat.com>
Date: Wed, 7 Aug 2024 19:53:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 00/29] Support of Virtual CPU Hotplug for ARMv8
 Arch
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Yn1qFhRoVKZJ

Hi Salil,

With this series and latest upstream Linux kernel (host), I ran into core dump as below.
I'm not sure if it's a known issue or not.

# uname -r
6.11.0-rc2-gavin+
# /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 -accel kvm \
   -machine virt,gic-version=host,nvdimm=on -cpu host                 \
   -smp maxcpus=2,cpus=1,sockets=2,clusters=1,cores=1,threads=1       \
   -m 4096M,slots=16,maxmem=128G                                      \
   -object memory-backend-ram,id=mem0,size=2048M                      \
   -object memory-backend-ram,id=mem1,size=2048M                      \
   -numa node,nodeid=0,memdev=mem0,cpus=0-0                           \
   -numa node,nodeid=1,memdev=mem1,cpus=1-1                           \
     :
qemu-system-aarch64: Failed to initialize host vcpu 1
Aborted (core dumped)

# gdb /var/lib/systemd/coredump/core.0 /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64
(gdb) bt
#0  0x0000ffff9eec42e8 in __pthread_kill_implementation () at /lib64/libc.so.6
#1  0x0000ffff9ee7c73c in raise () at /lib64/libc.so.6
#2  0x0000ffff9ee69034 in abort () at /lib64/libc.so.6
#3  0x0000aaaac71152c0 in kvm_arm_create_host_vcpu (cpu=0xaaaae4c0cb80)
     at ../target/arm/kvm.c:1093
#4  0x0000aaaac7057520 in machvirt_init (machine=0xaaaae48198c0) at ../hw/arm/virt.c:2534
#5  0x0000aaaac6b0d31c in machine_run_board_init
     (machine=0xaaaae48198c0, mem_path=0x0, errp=0xfffff754ee38) at ../hw/core/machine.c:1576
#6  0x0000aaaac6f58d70 in qemu_init_board () at ../system/vl.c:2620
#7  0x0000aaaac6f590dc in qmp_x_exit_preconfig (errp=0xaaaac8911120 <error_fatal>)
     at ../system/vl.c:2712
#8  0x0000aaaac6f5b728 in qemu_init (argc=82, argv=0xfffff754f1d8) at ../system/vl.c:3758
#9  0x0000aaaac6a5315c in main (argc=82, argv=0xfffff754f1d8) at ../system/main.c:47

Thanks,
Gavin
