Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp312031njb;
        Fri, 31 Jan 2025 02:07:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjwBxBe+LYzKn76iB5FniDGBo4/3Zn0AlqZVlEQZpEAfAR3FWgqwbFwcKdjZJBVrdRNRei6OGJSKYv4A==@linaro.org
X-Google-Smtp-Source: AGHT+IG/UI1qSIys+WpZf3XY5PvdQLM/h2kecVaSbaTJ+eDerrw/TOhT7gfy+n0+fXrGP3Kh9GJ9
X-Received: by 2002:a05:6214:20a4:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6e243c7f436mr134269186d6.38.1738318070609;
        Fri, 31 Jan 2025 02:07:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738318070; cv=none;
        d=google.com; s=arc-20240605;
        b=NfSC0SoNp010LeE410mAzkhguqyZeSp/AGVrl1sCMy/Q1PWKCoE3IERkCR6E5/jhFA
         hMk0A1l58j921W1jRk22GcZhq5hs6CwSeWw9qLYSOhEq3Dse0zmIjgKwmAitpwtRQpep
         rxgus24WDBcfiawvU1euEIgCuWjfzuatm2Ti9QHAyxDHUUpV3SslKdkRbuT/OsQ767Bk
         q6QFIK+TuNuQThTqZVtF5MhDJQobXTxKwpMcUwqxut2iUQzoOvULC3CiLJmwo9xE4DNd
         XN0QP5tpcdUamp1d9pQB3CM+DrMzmuYQi8YdzT3mi/aX7EO0O4Es6dBu0Rl6j08fVGao
         ZBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KHyDsMwarWDHMYvg5PeO6R4q2t1UXs6alHRuUvnp4n4=;
        fh=Aq2QszZhttWRog4N24mipcTQIArboS0wK3dvgtfc7aM=;
        b=lXbCR4P8pGqud6otVDAe5Ypy4uRz8Zgd8bXdbnQUzOjjCcaRGLcO3ETkIWwKbk8ShM
         +RM5n8y1tg9QB8+C9V5C8L9+FITxjusWxMaxCBlDFnLnXv1TBkgGxkUO2IdM48AhYIye
         Xwsm12DmlivE3BOCXvgDp8wDex3cKwiq4si+v3piq1S1loANh2wHG2NkGrnYC8/wyRh9
         Rg1BhmpZqaEtvlfNghesZ6xj+aZM4AXOis1zldMNNHlKaajc+9Yn3wyuHOYZSA9FxX6a
         WSR4zcJrddiVqf4UWkA9StZ4O308a6QtIBkB2dKI4vfqkd9ElJV6FXZHKLQ8xjVqT9hJ
         M8Tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GHiKV0dU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e254971921si33145076d6.219.2025.01.31.02.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 02:07:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GHiKV0dU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdnvd-000317-Gn; Fri, 31 Jan 2025 05:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tdnvb-00030j-K5
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 05:07:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tdnvZ-00088H-Hz
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 05:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738318026;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHyDsMwarWDHMYvg5PeO6R4q2t1UXs6alHRuUvnp4n4=;
 b=GHiKV0dUJnudxMihB7Sa+o1jcFRph7VA4wnvSKd3rBg1lNfC1bqC7S+up7+CjVf7diiDOG
 TxFLtpte7mH5LNW60SzCPh3Tyzj3AZnV84+GXaeSsfGeQPOyzh1JbejWhepvH65iEKwRsI
 GNf83E1g8gByTStQknheFPtWexJ83m4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-XFPb4dtHM2GBtxy5PWxXHw-1; Fri, 31 Jan 2025 05:07:04 -0500
X-MC-Unique: XFPb4dtHM2GBtxy5PWxXHw-1
X-Mimecast-MFC-AGG-ID: XFPb4dtHM2GBtxy5PWxXHw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43582d49dacso13130795e9.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jan 2025 02:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738318023; x=1738922823;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KHyDsMwarWDHMYvg5PeO6R4q2t1UXs6alHRuUvnp4n4=;
 b=V2uQMdmEMNLSLpsqyW0ERmusuYk1qxO933brENzZLeOIX6FrFIBw5w6T+86EBZFSZw
 hqitnI2frc0ksy+Zo2eWXC0RuiNq6qsMxrnXE9Wdw1x1zUsul1BGb2LIIXXHBQf2a+Cn
 Xz1DCP+vVlZtDnRY+6UOVF0JRdvQmeFRQSKK1RG6HOBh6aJ9IMZCTkkIC9IKaBIMD+tl
 +publ46LYvpeGcQ601Njh6EYoL1oAFKXKGnyqj+NbRQpq2eJbzTu6VR/SJvNf9gMkM91
 k4At4XV+/6T6QmgMrST4EbhQSc5uW6mav96HXx2VsROKVrKcWsKQlqAGQ12uywWK7H1O
 SFLQ==
X-Gm-Message-State: AOJu0YwjecmGHo/2s0h+B5IVWeAdAneur0f5wHBTk+jvM5UL+G6v9aEV
 iUPj5a7i6Pl753Y49fyUcpHxntX4FZagejSQyfdz+GMlgPfBnz/cuqpkl9yAAFAUS4dlJ8n32ul
 DMwk3msV0hjLC/uffMg8fZTOxS4U3q3XEL9rzWpQiKqIbqWMPsg==
X-Gm-Gg: ASbGncug7rOUoZO6PPAoraS/pGfF2l0sRloonT6kNzv8tgub/GH9oT7OuzeWW6BgLAH
 hYMIIptbzO8XAcheACEPpwYCMihg8NFQYU5myFlkrzRca6gK7zGSCbPyDuV1C9cou4+vMRRndMz
 xOmauyhdLBpXdl+uKvJOcL/vRkjgBvl0fbx1VygG7OGXp5iwNnP3fGPxfosOW9MUfEzwnFudoeT
 suf+wlGlAdFx6/x85r7PrbD591znON21xKgPEDayysybHI3YOu+l2ySXGRZXDbAaWtuzDrjj8fg
 gqvTru0au0J6wVId5tREwnfiMu90mJVY47TgFmmDy/MBWT+Svrld
X-Received: by 2002:a7b:c356:0:b0:434:f218:e1a8 with SMTP id
 5b1f17b1804b1-438dd1a5b55mr79086425e9.19.1738318023014; 
 Fri, 31 Jan 2025 02:07:03 -0800 (PST)
X-Received: by 2002:a7b:c356:0:b0:434:f218:e1a8 with SMTP id
 5b1f17b1804b1-438dd1a5b55mr79086075e9.19.1738318022596; 
 Fri, 31 Jan 2025 02:07:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc6df51sm87430955e9.30.2025.01.31.02.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 02:07:01 -0800 (PST)
Message-ID: <91539aa9-f0f7-4089-836a-ca52df8adb4a@redhat.com>
Date: Fri, 31 Jan 2025 11:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 Nathan Chen <nathanc@nvidia.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z5uiGnAxUf4jXTEI@redhat.com> <7ecabe74e0514367baf28d67675e5db8@huawei.com>
 <fc91e1a798324390b2a556fae5d40f46@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <fc91e1a798324390b2a556fae5d40f46@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g6aOOKTY5aDyuDUKqmMW8SVD4Qp8oMFUF4v_Qfrocg0_1738318023
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: pakZ+BXVZDL5


Hi Shameer,

On 1/31/25 10:33 AM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Shameerali Kolothum Thodi
>> Sent: Thursday, January 30, 2025 6:09 PM
>> To: 'Daniel P. Berrangé' <berrange@redhat.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>> nicolinc@nvidia.com; ddutile@redhat.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: RE: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
>> nested SMMUv3
>>
>> Hi Daniel,
>>
>>> -----Original Message-----
>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>> Sent: Thursday, January 30, 2025 4:00 PM
>>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>
>>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>>> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>>> nicolinc@nvidia.com; ddutile@redhat.com; Linuxarm
>>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>>> Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
>>> nested SMMUv3
>>>
>>> On Fri, Nov 08, 2024 at 12:52:37PM +0000, Shameer Kolothum via wrote:
>>>> How to use it(Eg:):
>>>>
>>>> On a HiSilicon platform that has multiple physical SMMUv3s, the ACC
>> ZIP
>>> VF
>>>> devices and HNS VF devices are behind different SMMUv3s. So for a
>>> Guest,
>>>> specify two smmuv3-nested devices each behind a pxb-pcie as below,
>>>>
>>>> ./qemu-system-aarch64 -machine virt,gic-version=3,default-bus-bypass-
>>> iommu=on \
>>>> -enable-kvm -cpu host -m 4G -smp cpus=8,maxcpus=8 \
>>>> -object iommufd,id=iommufd0 \
>>>> -bios QEMU_EFI.fd \
>>>> -kernel Image \
>>>> -device virtio-blk-device,drive=fs \
>>>> -drive if=none,file=rootfs.qcow2,id=fs \
>>>> -device pxb-pcie,id=pcie.1,bus_nr=8,bus=pcie.0 \
>>>> -device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1 \
>>>> -device arm-smmuv3-nested,id=smmuv1,pci-bus=pcie.1 \
>>>> -device vfio-pci,host=0000:7d:02.1,bus=pcie.port1,iommufd=iommufd0 \
>>>> -device pxb-pcie,id=pcie.2,bus_nr=16,bus=pcie.0 \
>>>> -device pcie-root-port,id=pcie.port2,bus=pcie.2,chassis=2 \
>>>> -device arm-smmuv3-nested,id=smmuv2,pci-bus=pcie.2 \
>>>> -device vfio-pci,host=0000:75:00.1,bus=pcie.port2,iommufd=iommufd0 \
>>>> -append "rdinit=init console=ttyAMA0 root=/dev/vda2 rw
>>> earlycon=pl011,0x9000000" \
>>>> -device virtio-9p-pci,fsdev=p9fs2,mount_tag=p9,bus=pcie.0 \
>>>> -fsdev local,id=p9fs2,path=p9root,security_model=mapped \
>>>> -net none \
>>>> -nographic
>>> Above you say the host has 2 SMMUv3 devices, and you've created 2
>>> SMMUv3
>>> guest devices to match.
>>>
>>> The various emails in this thread & libvirt thread, indicate that each
>>> guest SMMUv3 is associated with a host SMMUv3, but I don't see any
>>> property on the command line for 'arm-ssmv3-nested' that tells it which
>>> host eSMMUv3 it is to be associated with.
>>>
>>> How does this association work ?
>> You are right. The association is not very obvious in Qemu. The association
>> and checking is done implicitly by kernel at the moment.  I will try to
>> explain
>> it here.
>>
>> Each "arm-smmuv3-nested" instance, when the first device gets attached
>> to it, will create a S2 HWPT and a corresponding SMMUv3 domain in kernel
>> SMMUv3 driver. This domain will have a pointer representing the physical
>> SMMUv3 that the device belongs. And any other device which belongs to
>> the same physical SMMUv3 can share this S2 domain.
>>
>> If a device that belongs to a different physical SMMUv3 gets attached to
>> the above domain, the HWPT attach will eventually fail as the physical
>> smmuv3 in the domains will have a mismatch,
>> https://elixir.bootlin.com/linux/v6.13/source/drivers/iommu/arm/arm-
>> smmu-v3/arm-smmu-v3.c#L2860
>>
>> And as I mentioned in cover letter, Qemu will report,
>>
>> "
>> Attempt to add the HNS VF to a different SMMUv3 will result in,
>>
>> -device vfio-pci,host=0000:7d:02.2,bus=pcie.port3,iommufd=iommufd0:
>> Unable to attach viommu
>> -device vfio-pci,host=0000:7d:02.2,bus=pcie.port3,iommufd=iommufd0: vfio
>> 0000:7d:02.2:
>>    Failed to set iommu_device: [iommufd=29] error attach 0000:7d:02.2 (38)
>> to id=11: Invalid argument
>>
>> At present Qemu is not doing any extra validation other than the above
>> failure to make sure the user configuration is correct or not. The
>> assumption is libvirt will take care of this.
>> "
>> So in summary, if the libvirt gets it wrong, Qemu will fail with error.
>>
>> If a more explicit association is required, some help from kernel is required
>> to identify the physical SMMUv3 associated with the device.
> Again thinking about this, to have an explicit association in the Qemu command 
> line between the vSMMUv3 and the phys smmuv3,
>
> We can possibly add something like,
>
> -device pxb-pcie,id=pcie.1,bus_nr=8,bus=pcie.0 \
> -device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1 \
> -device arm-smmuv3-accel,bus=pcie.1,phys-smmuv3= smmu3.0x0000000100000000 \
> -device vfio-pci,host=0000:7d:02.1,bus=pcie.port1,iommufd=iommufd0 \
>
> -device pxb-pcie,id=pcie.2,bus_nr=16,bus=pcie.0 \
> -device pcie-root-port,id=pcie.port2,bus=pcie.2,chassis=2 \
> -device arm-smmuv3-nested,id=smmuv2,pci-bus=pcie.2, phys-smmuv3= smmu3.0x0000000200000000  \
> -device vfio-pci,host=0000:75:00.1,bus=pcie.port2,iommufd=iommufd0 \
>
> etc.
>
> And Qemu does some checking to make sure that the device is indeed associated
> with the specified phys-smmuv3.  This can be done going through the sysfs path checking
> which is what I guess libvirt is currently doing to populate the topology. So basically
> Qemu is just replicating that to validate again.
>
> Or another option is extending the IOMMU_GET_HW_INFO IOCTL to return the phys
> smmuv3 base address which can avoid going through the sysfs.
>
> The only difference between the current approach(kernel failing the attach implicitly)
> and the above is, Qemu can provide a validation of inputs and may be report a  better
> error message than just saying " Unable to attach viommu/: Invalid argument".
>
> If the command line looks Ok, I will go with the sysfs path validation method first in my
> next respin.
The command line looks sensible to me. on vfio we use
host=6810000.ethernet. Maybe reuse this instead of phys-smmuv3? Thanks Eric
>
> Please let me know.
>
> Thanks,
> Shameer
>
>
>
>

