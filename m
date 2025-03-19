Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp396872njc;
        Wed, 19 Mar 2025 10:14:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8MYmyzQTRDt5GVD9IELAOCGJo53OcwK4qMWPcqdLQq2pbuLOqLtpcCpNhfj3vlQ1KUWwKKAaK6erdSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFcIOqVqa8MTwLMB8N+xmhOoXC+4eyVIsukv9KiK+qRkf5Ru9MF4bdlujxaJD3qrGllF4la
X-Received: by 2002:a05:622a:53c8:b0:476:aa7a:2f78 with SMTP id d75a77b69052e-477083aadf9mr56802691cf.49.1742404475469;
        Wed, 19 Mar 2025 10:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742404475; cv=none;
        d=google.com; s=arc-20240605;
        b=NaI+SAC/6YeifCckt5dcZxw4SIlVAX5JZ8WfR7mRIAuqq+y51Kz1y8hLqCSZHEv4WU
         iei58F92mmJ3Zro4HLIkOk3zKp6IS8OhIGZG1DJzfMF4+OvXH95e/4H0Sv+jadb4KJxQ
         shCwZ8nhYc9g+NU7qOs1JIXwKFv369UCu2pUwBcGawk9qNhnQ1SUEF1Pc6opoH/NHLkr
         ZgAZag5qfiyL0pRmDd067yI4/wmNYPUrHFAtRXBvhGixa9upd6EDHeVy1m4E0uTkH38h
         CqyEgee0SwkXpMjlY7rN/ondItJijB/rvxvQ7v5u9Z7YfHtKPm+68mSywj9PZLSA2tt0
         mIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8dzJ1lLiZ4vNOYYQKoBmFyqaGFYpyhp4CrrvgLlvMEA=;
        fh=G3wwb1FXwZPxCqK6InFOfjHndQdS4rU+MTG6n8uML8g=;
        b=HAqEMcaQNjQfHX7iRDWB60NIWsQkZeGlfA04HGIRVKkJTfydT6iQagkqxOKkv69cdo
         /Zb2DeRUf+oZhMEzSG3uTJeJCwKuUHlfquqHU06rX6DUBfoKlQsAg42AnK79nMEZkmkO
         6Y/8pqBaUa/TZtVAzar086EB2LlckpOj2IT26s4NgIhCp5/W73jnw/pdZN42hzSIUUKs
         qo3YZOI0M6kmKloywoYXP4xRX1BdAYLS+XwObor7l7RrUGNWJ0ujZ5oqMEyUyCmSoyt4
         I6K20SOvXfBgYfduQSWuCtvQTZJehdili68Ev8k9QfUDkeNhhuEZK/79JAzQ2ZSMMDnb
         Faeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LxywMJv+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb7df916si139858881cf.334.2025.03.19.10.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 10:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LxywMJv+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuwzR-0003k8-8D; Wed, 19 Mar 2025 13:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuwzO-0003hz-LC
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuwzM-0003Ik-0g
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742404434;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8dzJ1lLiZ4vNOYYQKoBmFyqaGFYpyhp4CrrvgLlvMEA=;
 b=LxywMJv+nLmcb7YG+Fm2aIWL2iVrbY3tYjl41SK0dFGfArTODggyE1QtoAhza+qYp5GGOT
 iZLbQ5j+xrF4iAF33RK3fFHU3PJJpqM8UAUaTISGXHH3yS9qePc4E2KZsgylwXVkv5EUdY
 I1f2i4ZNtoPBvAZm0ahK4P4kIc+BgHI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-i5VdPrREOaaFgHU__E5fTQ-1; Wed, 19 Mar 2025 13:13:53 -0400
X-MC-Unique: i5VdPrREOaaFgHU__E5fTQ-1
X-Mimecast-MFC-AGG-ID: i5VdPrREOaaFgHU__E5fTQ_1742404432
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d3b211d0eso5818375e9.1
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 10:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742404432; x=1743009232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8dzJ1lLiZ4vNOYYQKoBmFyqaGFYpyhp4CrrvgLlvMEA=;
 b=syolQDrYJDoIx9fnGOYk7dY9efEpG68vFkDXEz7bbaS5/XhS0HyExu6CWiueUChapO
 uz9MRNUMpnz7udCQYE4GGM/ByCBn8nzMdVIDiksGm83JcVXCE3fv0+T5u7tU2nMb+Hne
 UuWjyMXfBAY1P/vmK9ywSWyXSleZiURp367U5G4fhrhYmwedj7k5h7kJ1NJvUjPXuFlp
 2BW+Ve9VkRGz/BfWCpzGbTRj+WTWUAgAtulCzCrBXSVLDjiny5SRT2EM0dZ41S7BhkWU
 vlOP1+Ch1LrPTLs/0XvCfzEXOqVf4Wtvzo+A1LP86sP12k5PiBmo/qeYhMnqdvbJRjtX
 U/2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbdhT75XjLk9NbweRVaWr896080p2qj/OsDUz/OwBKSuy9tAYUc90c3EWaITDwdtHdveBv1QaA/w==@nongnu.org
X-Gm-Message-State: AOJu0YxtyQ+CMN6czsnV/lxxvvW4zegj5QbHNdWu5rYLwOgrofflhGnv
 Bd4NN2WYBaSxJ2xkk+8U05zjDsPS3ONoJJf4U0QcUS6N9rGe+sUVZzqD6eZVhqUqKEzHmKzISvi
 tBiBCU82xxvKbcMMfXi4GT7YiAGjCW0XN/8ry5ayUuFgoQ8K3AA==
X-Gm-Gg: ASbGncv+OA9DntCxkIWCWt9Yyg0d2G3ybE7+rQizU2ohBvkoKTGo6kK4f/5rXgLCspP
 hRj4qidrbtvt5q12zSUuCtI4SJ8lIh22fU6rwAWo6Oz4cW5C+0VdK1vzcGWtjbrmPixGu2YLHpO
 31BRgryDDJXLlq4qR/C5e6jUNmJyV1ZMtCSxVjIEW3N0ky/4Slal/PjE9lIdnsWbZZbbqLFztSE
 OyGIk7fsexXBa4VLyTsGvMiaL3l3ZpnVLqC0inElgMtGhdkOaRhaPJV841bkUE0GXrJ/2FIhhch
 nRohLiypTDVAdjEBOwq9Q7rvhgCNs55ywPMmVKXUAnvY57Z+ngXzxWgecCANJEs=
X-Received: by 2002:a5d:5f4c:0:b0:391:b93:c971 with SMTP id
 ffacd0b85a97d-39979586d6fmr337820f8f.20.1742404431869; 
 Wed, 19 Mar 2025 10:13:51 -0700 (PDT)
X-Received: by 2002:a5d:5f4c:0:b0:391:b93:c971 with SMTP id
 ffacd0b85a97d-39979586d6fmr337778f8f.20.1742404431297; 
 Wed, 19 Mar 2025 10:13:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40cdd0sm21576430f8f.77.2025.03.19.10.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 10:13:50 -0700 (PDT)
Message-ID: <6b5369c1-fd1c-4282-9e9b-1b9041f04167@redhat.com>
Date: Wed, 19 Mar 2025 18:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/20] hw/arm/virt: Add support for user-creatable
 accelerated SMMUv3
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <451b6569-49ee-4f5a-96d7-f3128c5527c2@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <451b6569-49ee-4f5a-96d7-f3128c5527c2@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6iNAtQVF7iswpbBwRbUB8rhK31GFqkMzAB-m6Yn1wis_1742404432
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NNPteVLejmlI


Hi Philippe,

On 3/19/25 5:40 PM, Philippe Mathieu-Daudé wrote:
> Hi,
>
> On 11/3/25 15:10, Shameer Kolothum via wrote:
>> Hi All,
>>
>> This patch series introduces initial support for a user-creatable
>> accelerated SMMUv3 device (-device arm-smmuv3-accel) in QEMU.
>
> I'm a bit confused by the design here. Why are we introducing this as
> some device while it is a core component of the bus topology (here PCI)?

At the moment the SMMU machine wide and is optin-in with a machine option.

However there is a need to be able to instantiate multiple of them to
match the physical implementation. and there is a need to define what
bus topology each instance is translating, hence the idea to attach it
to a bus.

At ACPI level the IORT table allows to precisely define which RID is
translated by each SMMU instance and this is something we fail to model
with the machine wide option.

Eric
>
> Is is because this device is inspired on how x86 IOMMUs are wired?
>
>> Why this is needed:
>>
>> Currently, QEMU’s ARM SMMUv3 emulation (iommu=smmuv3) is tied to the
>> machine and does not support configuring the host SMMUv3 in nested
>> mode.This limitation prevents its use with vfio-pci passthrough
>> devices.
>>
>> The new pluggable smmuv3-accel device enables host SMMUv3 configuration
>> with nested stage support (Stage 1 owned by the Guest and Stage 2 by the
>> host) via the new IOMMUFD APIs. Additionally, it allows multiple
>> accelerated vSMMUv3 instances for guests running on hosts with multiple
>> physical SMMUv3s.
>>
>> This will benefit in:
>> -Reduced invalidation broadcasts and lookups for devices behind multiple
>>   physical SMMUv3s.
>> -Simplifies handling of host SMMUv3s with differing feature sets.
>> -Lays the groundwork for additional capabilities like vCMDQ support.
>>
>>
>> Changes from RFCv1[0]:
>>
>> Thanks to everyone who provided feedback on RFCv1!.
>>
>> –The device is now called arm-smmuv3-accel instead of arm-smmuv3-nested
>>   to better reflect its role in using the host's physical SMMUv3 for
>> page
>>   table setup and cache invalidations.
>> -Includes patches for VIOMMU and VDEVICE IOMMUFD APIs (patches 1,2).
>> -Merges patches from Nicolin’s GitHub repository that add accelerated
>>   functionalityi for page table setup and cache invalidations[1]. I have
>>   modified these a bit, but hopefully has not broken anything.
>> -Incorporates various fixes and improvements based on RFCv1 feedback.
>> –Adds support for vfio-pci hotplug with smmuv3-accel.
>>
>> Note: IORT RMR patches for MSI setup are currently excluded as we may
>> adopt a different approach for MSI handling in the future [2].
>>
>> Also this has dependency on the common iommufd/vfio patches from
>> Zhenzhong's series here[3]
>>
>> ToDos:
>>
>> –At least one vfio-pci device must currently be cold-plugged to a
>>   pxb-pcie bus associated with the arm-smmuv3-accel. This is required
>> both
>>   to associate a vSMMUv3 with a host SMMUv3 and also needed to
>>   retrieve the host SMMUv3 IDR registers for guest export.
>>   Future updates will remove this restriction by adding the
>>   necessary kernel support.
>>   Please find the discussion here[4]
>> -This version does not yet support host SMMUv3 fault handling or
>>   other event notifications. These will be addressed in a
>>   future patch series.
>>
>>
>> The complete branch can be found here:
>> https://github.com/hisilicon/qemu/tree/master-smmuv3-accel-rfcv2-ext
>>
>> I have done basic sanity testing on a Hisilicon Platform using the
>> kernel
>> branch here:
>> https://github.com/nicolinc/iommufd/tree/iommufd_msi-rfcv2
>>
>> Usage Eg:
>>
>> On a HiSilicon platform that has multiple host SMMUv3s, the ACC ZIP VF
>> devices and HNS VF devices are behind different host SMMUv3s. So for a
>> Guest, specify two arm-smmuv3-accel devices each behind a pxb-pcie as
>> below,
>>
>>
>> ./qemu-system-aarch64 -machine virt,accel=kvm,gic-version=3 \
>> -cpu host -smp cpus=4 -m size=4G,slots=4,maxmem=256G \
>> -bios QEMU_EFI.fd \
>> -object iommufd,id=iommufd0 \
>> -device virtio-blk-device,drive=fs \
>> -drive if=none,file=rootfs.qcow2,id=fs \
>> -device pxb-pcie,id=pcie.1,bus_nr=1,bus=pcie.0 \
>> -device arm-smmuv3-accel,bus=pcie.1 \
>> -device
>> pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1,pref64-reserve=2M,io-reserve=1K
>> \
>> -device vfio-pci,host=0000:7d:02.1,bus=pcie.port1,iommufd=iommufd0 \
>> -device
>> pcie-root-port,id=pcie.port2,bus=pcie.1,chassis=2,pref64-reserve=2M,io-reserve=1K
>> \
>> -device vfio-pci,host=0000:7d:02.2,bus=pcie.port2,iommufd=iommufd0 \
>> -device pxb-pcie,id=pcie.2,bus_nr=8,bus=pcie.0 \
>> -device arm-smmuv3-accel,bus=pcie.2 \
>> -device
>> pcie-root-port,id=pcie.port3,bus=pcie.2,chassis=3,pref64-reserve=2M,io-reserve=1K
>> \
>> -device vfio-pci,host=0000:75:00.1,bus=pcie.port3,iommufd=iommufd0 \
>> -kernel Image \
>> -append "rdinit=init console=ttyAMA0 root=/dev/vda2 rw
>> earlycon=pl011,0x9000000" \
>> -device virtio-9p-pci,fsdev=p9fs,mount_tag=p9,bus=pcie.0 \
>> -fsdev local,id=p9fs,path=p9root,security_model=mapped \
>> -net none \
>> -nographic
>>
>> Guest will boot with two SMMUv3s,
>> ...
>> arm-smmu-v3 arm-smmu-v3.0.auto: option mask 0x0
>> arm-smmu-v3 arm-smmu-v3.0.auto: ias 44-bit, oas 44-bit (features
>> 0x00008325)
>> arm-smmu-v3 arm-smmu-v3.0.auto: allocated 65536 entries for cmdq
>> arm-smmu-v3 arm-smmu-v3.0.auto: allocated 32768 entries for evtq
>> arm-smmu-v3 arm-smmu-v3.1.auto: option mask 0x0
>> arm-smmu-v3 arm-smmu-v3.1.auto: ias 44-bit, oas 44-bit (features
>> 0x00008325)
>> arm-smmu-v3 arm-smmu-v3.1.auto: allocated 65536 entries for cmdq
>> arm-smmu-v3 arm-smmu-v3.1.auto: allocated 32768 entries for evtq
>>
>> With a pci topology like below,
>>
>> [root@localhost ~]# lspci -tv
>> -+-[0000:00]-+-00.0  Red Hat, Inc. QEMU PCIe Host bridge
>>   |           +-01.0  Red Hat, Inc. QEMU PCIe Expander bridge
>>   |           +-02.0  Red Hat, Inc. QEMU PCIe Expander bridge
>>   |           \-03.0  Virtio: Virtio filesystem
>>   +-[0000:01]-+-00.0-[02]----00.0  Huawei Technologies Co., Ltd. HNS
>> Network Controller (Virtual Function)
>>   |           \-01.0-[03]----00.0  Huawei Technologies Co., Ltd. HNS
>> Network Controller (Virtual Function)
>>   \-[0000:08]---00.0-[09]----00.0  Huawei Technologies Co., Ltd.
>> HiSilicon ZIP Engine(Virtual Function)
>>
>> Further tests are always welcome.
>>
>> Please take a look and let me know your feedback!
>>
>> Thanks,
>> Shameer
>>
>> [0]
>> https://lore.kernel.org/qemu-devel/20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com/
>> [1]
>> https://github.com/nicolinc/qemu/commit/3acbb7f3d114d6bb70f4895aa66a9ec28e6561d6
>> [2]
>> https://lore.kernel.org/linux-iommu/cover.1740014950.git.nicolinc@nvidia.com/
>> [3]
>> https://lore.kernel.org/qemu-devel/20250219082228.3303163-1-zhenzhong.duan@intel.com/
>> [4] https://lore.kernel.org/qemu-devel/Z6TLSdwgajmHVmGH@redhat.com/
>

