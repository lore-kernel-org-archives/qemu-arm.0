Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp526832njc;
        Thu, 5 Jun 2025 14:00:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVn98zgCZNDXZMLFWQecVRAGuSeZjAx37tNpcQ1wa84A3i8k0JRxFblw9/TviMdSY+BVUHOZiHHm0+4Nw==@linaro.org
X-Google-Smtp-Source: AGHT+IHoXg9DelmZdDTh6o2lLVoMwssYAkLzoQTpVaprYb2Rr74sglwQKsAbBKfoCdb+UT327F4f
X-Received: by 2002:a05:622a:1b29:b0:494:b914:d140 with SMTP id d75a77b69052e-4a5b9dacac1mr20522601cf.43.1749157201165;
        Thu, 05 Jun 2025 14:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749157201; cv=none;
        d=google.com; s=arc-20240605;
        b=icSdCYzSky1W0kwL3RRJ1EwHks1UCTwJNfAMs2cMmTRAMcJ+UebfWmAmqRonrmQeEm
         1XIRs+9URFmNvOMdVTckIN2a6yElA1sdREne2E7iIWPbnn7iiarYpPgZDJkLCUXUxOA2
         U9XCUPZxN/iInw1MP5eTYcfcY+uoMz1Aj+7gOYMvgIcKCjJ8yLYl6jyjYE+4J2i0z5pz
         HwPukAFbFQ460/CL3enDHSUnue3qcvsSbsN0yYfJLLNYE1Cl++1WtsoRKLmuDv7GkP0o
         oECtu3O3f/K3UEgqIlPa42HIlWGJ7tA8AKWm74Q6oBQzX3sbe45+Xv1LfMW+t9B0ex/h
         E7xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dlt55m+BE8wpU7qvxWT58xuqpz72+kc7VfaxJ6SMsG8=;
        fh=jw1/ISsXJIapWW1MCmgx2VZB6UXhUm7Z1rvHKckSgpg=;
        b=EaiMSOHv7TJgomO5Lx9rXV8OJn+LCqWillNWWgRR89p3QUsaSjoN+y4XX+x0mRdTMl
         oAIVM0UHZq9+47lADkiSrGodqPRhoNfGMHar+WEnnQ5uyNr6fz0GPeru4iHG7v7ICCw8
         8V9vqEmTl6a4OdsfVJuh6xkmSm/StDYK47nIxccqfp2xP+yAbQX6+tAAZ6HtVqmH3cxh
         QKu7zQDF2nM0i4PlzrzM5ZxEQ++5TuBlMsqlRPRDc6uFunxArGzl63PZBgdhIzqt8t1l
         /4D7NHcIZ7fK0wTKGnkX7R6TWOVzb26S2U3DzdThYipa/tPJal6H6T2awuCtcw8Up54w
         sC2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="df/7lD6q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61116b0bfsi1805961cf.22.2025.06.05.14.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 14:00:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="df/7lD6q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNHga-0000v5-OP; Thu, 05 Jun 2025 16:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uNHgZ-0000tp-1T
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 16:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uNHgW-0002kB-Qk
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 16:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749157175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dlt55m+BE8wpU7qvxWT58xuqpz72+kc7VfaxJ6SMsG8=;
 b=df/7lD6qKFvJzBcgOUdLbtdXZ4KXoZECjiehvwcCv8xoJUwxfP0WJh3ToaVh0/Y108thyU
 oTQcJL5o3UCOB7nKNkuottNiakSttju+JkTkjhy2aEDElyoWE/tBJv/uW0qyKML8t2BTZz
 yQIEsT8la22FXd6Py9TjrPJFloBPEXA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-kM5nvJq5PfCvZ5X2JfFnCQ-1; Thu, 05 Jun 2025 16:59:34 -0400
X-MC-Unique: kM5nvJq5PfCvZ5X2JfFnCQ-1
X-Mimecast-MFC-AGG-ID: kM5nvJq5PfCvZ5X2JfFnCQ_1749157174
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a5882b7339so15086111cf.2
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 13:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749157174; x=1749761974;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dlt55m+BE8wpU7qvxWT58xuqpz72+kc7VfaxJ6SMsG8=;
 b=HlZvaSrJGBqF/3aQ0qatEzmU7gnhJ/Ls24AEtU5htYrxdyhAuUwWUOadVprVLGx/rx
 SbLjSSsLf39TYujeakzbtRhxL6xiujIM8smFCCmQ/g7E5Zk+laipdR69UNkMLBRQ23WS
 qXU4kV2VXo3b19te5heXuhYsYUnk52VCIUYDEKinUkPKIRFN6fZoHqbMziTibUvwRIc8
 1Y96Jzidwg29N+tgf/g0tAp82TGfyzyp5gdkWQBKQeZI7Hlz3aufQn66QVTvAT5HtwxT
 N4op/8pBo60KfLnInocqytC4VB5cPh8OIyhYvfpO6+eZ2Z4Uc6YK/bPFgDU3a6zCunnS
 fI2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxH/BSu2kp27FXV6pZo88onVpmw+m2Uef6DTuFw6Nopb7t6pikglRoggo9afAQQGMKd/SsQMxLwg==@nongnu.org
X-Gm-Message-State: AOJu0YzRNJeVkYG77mPqmrjsZKZFtAfE0DU1r4zjQPz3zqP5WU9lj4/L
 /IFnaFOpjcH1g2zWPflV+7NR0iKShtY4spcL7fPmMxgsYqolNjsGOhUSJCx34dobH7QDlr35Qq7
 DHsPu7otR03/8SZQLr5b/jHL7t8b310l54rXYm9suBU0fUeI7E/p0sA==
X-Gm-Gg: ASbGnctM30SZHRe4k+ufNvkcYGiixwL2krgYkesb0HpF2qKpYR3w5dN6NWuLRSv+Ajv
 FeNiJgRd+LMEOLXP8i3+x0LsRxsnZ8ETcFQzKFYVPyt8xu7qBKNMmlwcYU8UFDx0CmAWjuIcUnH
 gHqHq9rpTXKETWiPlS7HLW1gYhT01uWyC/s6JWrwLFUDmFXjX8NVii4q/w6C+aVyoQFoYtjEHAH
 b8SQWc2Out2i56KpGj9kMoaVLdHxCLfdPCzgPhz7OZSgmCEh/mjh9tWg1HaleSL8kJGyjo6rRfz
 NE/usNlVL6tMMvIuLkZT7eQ=
X-Received: by 2002:a05:622a:4d8f:b0:476:8cad:72d9 with SMTP id
 d75a77b69052e-4a5b9d92adamr21127911cf.33.1749157173946; 
 Thu, 05 Jun 2025 13:59:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8f:b0:476:8cad:72d9 with SMTP id
 d75a77b69052e-4a5b9d92adamr21127321cf.33.1749157173360; 
 Thu, 05 Jun 2025 13:59:33 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a61116b825sm1225991cf.25.2025.06.05.13.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 13:59:32 -0700 (PDT)
Message-ID: <3d003b4c-5efa-487f-9156-9344613ead55@redhat.com>
Date: Thu, 5 Jun 2025 16:58:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] hw/arm/virt: Add support for user creatable SMMUv3
 device
To: Nathan Chen <nathanc@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, berrange@redhat.com, mochs@nvidia.com,
 smostafa@google.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <74d9f7a2-dbf4-48d5-bda8-847d1fc73e38@nvidia.com>
 <ce8a82c0-e8d9-447f-89ae-45fcafdd92e5@redhat.com>
 <90957693-dc12-4731-960f-0ee295d297ec@nvidia.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <90957693-dc12-4731-960f-0ee295d297ec@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V8lq_y_JH3NVAvasECGoEHXJn-wcxAGPVKxYbiXz4bg_1749157174
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y7TE4PD5Mbbl



On 6/5/25 1:58 PM, Nathan Chen wrote:
> 
> 
> On 6/4/2025 7:34 PM, Donald Dutile wrote:
>> On 6/4/25 10:02 PM, Nathan Chen wrote:
>>> On 6/2/2025 8:41 AM, Shameer Kolothum wrote:
>>>> This patch series introduces support for a user-creatable SMMUv3 device
>>>> (-device arm-smmuv3) in QEMU.
>>>
>>> Tested-by: Nathan Chen <nathanc@nvidia.com>
>>>
>>> I am able to create 16 SMMUv3 devices in a qemu VM with emulated devices properly associated with the guest SMMUs in guest sysfs - verified with some guest SMMUs having two or three emulated NICs assigned to them while other guest SMMUs have a minimum of one assigned.
>>>
>>> Thanks,
>>> Nathan
>>>
>> Nathan,
>> Great test!
>> Can you share the xml &/or qemu cmdline, to demonstrate this broad capability?
>> Also would be a good reference when (we know it isn't 'if') a new/ different config
>> that wasn't tested shows a bug, and we'll have more info to work with.
> 
> Yes, here is the qemu command line I used. smmuv3.15 is associated with two devices, smmuv3.0 is associated with two devices, and smmuv3.1 is associated with three devices:
> 
> qemu-system-aarch64 \
>          -machine hmat=on -machine virt,accel=kvm,gic-version=3,ras=on \
>          -cpu host -smp cpus=4 -m size=16G,slots=4,maxmem=32G -nographic \
>          -bios /usr/share/AAVMF/AAVMF_CODE.fd \
>          -device nvme,drive=nvme0,serial=deadbeaf1,bus=pcie.0 \
>          -drive file=/home/nvidia/nathanc/noble-server-cloudimg-arm64.qcow2,index=0,media=disk,format=qcow2,if=none,id=nvme0 \
>          -device e1000,romfile=/root/nathanc/efi-e1000.rom,netdev=net0,bus=pcie.0 \
>          -netdev user,id=net0,hostfwd=tcp::5558-:22,hostfwd=tcp::5586-:5586 \
>          -netdev user,id=net1 \
>          -netdev user,id=net2 \
>          -netdev user,id=net3 \
>          -netdev user,id=net4 \
>          -netdev user,id=net5 \
>          -netdev user,id=net6 \
>          -netdev user,id=net7 \
>          -netdev user,id=net8 \
>          -netdev user,id=net9 \
>          -netdev user,id=net10 \
>          -netdev user,id=net11 \
>          -netdev user,id=net12 \
>          -netdev user,id=net13 \
>          -netdev user,id=net14 \
>          -netdev user,id=net15 \
>          -netdev user,id=net16 \
>          -netdev user,id=net17 \
>          -netdev user,id=net18 \
>          -netdev user,id=net19 \
>          -netdev user,id=net20 \
>          -device arm-smmuv3,primary-bus=pcie.0,id=smmuv3.0 \
>          -device virtio-net-pci,bus=pcie.0,netdev=net1 \
>          -device virtio-net-pci,bus=pcie.0,netdev=net20 \
>          -device pxb-pcie,id=pcie.1,bus_nr=200,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.1 \
>          -device pcie-root-port,id=pcie.port1,bus=pcie.1,slot=1,chassis=1 \
>          -device virtio-net-pci,bus=pcie.port1,netdev=net2 \
>          -device pcie-root-port,id=pcie.port17,bus=pcie.1,slot=17,chassis=17 \
>          -device virtio-net-pci,bus=pcie.port17,netdev=net18 \
>          -device pcie-root-port,id=pcie.port18,bus=pcie.1,slot=18,chassis=18 \
>          -device virtio-net-pci,bus=pcie.port18,netdev=net19 \
>          -device pxb-pcie,id=pcie.2,bus_nr=196,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.2,id=smmuv3.2 \
>          -device pcie-root-port,id=pcie.port2,bus=pcie.2,slot=2,chassis=2 \
>          -device virtio-net-pci,bus=pcie.port2,netdev=net3 \
>          -device pxb-pcie,id=pcie.3,bus_nr=192,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.3,id=smmuv3.3 \
>          -device pcie-root-port,id=pcie.port3,bus=pcie.3,slot=3,chassis=3 \
>          -device virtio-net-pci,bus=pcie.port3,netdev=net4 \
>          -device pxb-pcie,id=pcie.4,bus_nr=188,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.4,id=smmuv3.4 \
>          -device pcie-root-port,id=pcie.port4,bus=pcie.4,slot=4,chassis=4 \
>          -device virtio-net-pci,bus=pcie.port4,netdev=net5 \
>          -device pxb-pcie,id=pcie.5,bus_nr=184,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.5,id=smmuv3.5 \
>          -device pcie-root-port,id=pcie.port5,bus=pcie.5,slot=5,chassis=5 \
>          -device virtio-net-pci,bus=pcie.port5,netdev=net6 \
>          -device pxb-pcie,id=pcie.6,bus_nr=180,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.6,id=smmuv3.6 \
>          -device pcie-root-port,id=pcie.port6,bus=pcie.6,slot=6,chassis=6 \
>          -device virtio-net-pci,bus=pcie.port6,netdev=net7 \
>          -device pxb-pcie,id=pcie.7,bus_nr=176,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.7,id=smmuv3.7 \
>          -device pcie-root-port,id=pcie.port7,bus=pcie.7,slot=7,chassis=7 \
>          -device virtio-net-pci,bus=pcie.port7,netdev=net8 \
>          -device pxb-pcie,id=pcie.8,bus_nr=172,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.8,id=smmuv3.8 \
>          -device pcie-root-port,id=pcie.port8,bus=pcie.8,slot=8,chassis=8 \
>          -device virtio-net-pci,bus=pcie.port8,netdev=net9 \
>          -device pxb-pcie,id=pcie.9,bus_nr=168,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.9,id=smmuv3.9 \
>          -device pcie-root-port,id=pcie.port9,bus=pcie.9,slot=9,chassis=9 \
>          -device virtio-net-pci,bus=pcie.port9,netdev=net10 \
>          -device pxb-pcie,id=pcie.10,bus_nr=164,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.10,id=smmuv3.10 \
>          -device pcie-root-port,id=pcie.port10,bus=pcie.10,slot=10,chassis=10 \
>          -device virtio-net-pci,bus=pcie.port10,netdev=net11 \
>          -device pxb-pcie,id=pcie.11,bus_nr=160,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.11,id=smmuv3.11 \
>          -device pcie-root-port,id=pcie.port11,bus=pcie.11,slot=11,chassis=11 \
>          -device virtio-net-pci,bus=pcie.port11,netdev=net12 \
>          -device pxb-pcie,id=pcie.12,bus_nr=156,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.12,id=smmuv3.12 \
>          -device pcie-root-port,id=pcie.port12,bus=pcie.12,slot=12,chassis=12 \
>          -device virtio-net-pci,bus=pcie.port12,netdev=net13 \
>          -device pxb-pcie,id=pcie.13,bus_nr=152,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.13,id=smmuv3.13 \
>          -device pcie-root-port,id=pcie.port13,bus=pcie.13,slot=13,chassis=13 \
>          -device virtio-net-pci,bus=pcie.port13,netdev=net14 \
>          -device pxb-pcie,id=pcie.14,bus_nr=148,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.14,id=smmuv3.14 \
>          -device pcie-root-port,id=pcie.port14,bus=pcie.14,slot=14,chassis=14 \
>          -device virtio-net-pci,bus=pcie.port14,netdev=net15 \
>          -device pxb-pcie,id=pcie.15,bus_nr=144,bus=pcie.0 \
>          -device arm-smmuv3,primary-bus=pcie.15,id=smmuv3.15 \
>          -device pcie-root-port,id=pcie.port15,bus=pcie.15,slot=15,chassis=15 \
>          -device virtio-net-pci,bus=pcie.port15,netdev=net16 \
>          -device pcie-root-port,id=pcie.port16,bus=pcie.15,slot=16,chassis=16 \
>          -device virtio-net-pci,bus=pcie.port16,netdev=net17
> 
> Here is the guest topology:
> 
> $ lspci -tv
> -+-[0000:00]-+-00.0  Red Hat, Inc. QEMU PCIe Host bridge
>   |           +-01.0  Red Hat, Inc. QEMU NVM Express Controller
>   |           +-02.0  Intel Corporation 82540EM Gigabit Ethernet Controller
>   |           +-03.0  Red Hat, Inc. Virtio network device
>   |           +-04.0  Red Hat, Inc. Virtio network device
>   |           +-05.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-06.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-07.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-08.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-09.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-0a.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-0b.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-0c.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-0d.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-0e.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-0f.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-10.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-11.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           +-12.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   |           \-13.0  Red Hat, Inc. QEMU PCIe Expander bridge
>   +-[0000:90]-+-00.0-[91]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   |           \-01.0-[92]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:94]---00.0-[95]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:98]---00.0-[99]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:9c]---00.0-[9d]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:a0]---00.0-[a1]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:a4]---00.0-[a5]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:a8]---00.0-[a9]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:ac]---00.0-[ad]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:b0]---00.0-[b1]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:b4]---00.0-[b5]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:b8]---00.0-[b9]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:bc]---00.0-[bd]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:c0]---00.0-[c1]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   +-[0000:c4]---00.0-[c5]----00.0  Red Hat, Inc. Virtio 1.0 network device
>   \-[0000:c8]-+-00.0-[c9]----00.0  Red Hat, Inc. Virtio 1.0 network device
>               +-01.0-[ca]----00.0  Red Hat, Inc. Virtio 1.0 network device
>               \-02.0-[cb]----00.0  Red Hat, Inc. Virtio 1.0 network device
> 
> Thanks,
> Nathan
> 
Needs a device-assigned NVIDIA GPU! ;-)
Thanks for the config!
- Don

