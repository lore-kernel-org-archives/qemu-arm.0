Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp522112njb;
        Fri, 31 Jan 2025 08:09:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWJGunJfTQ0H4OcTpZuJFLrgpCmPh1BUZxiwryu6Bn1CqTjCLNxc0CxTRVMQiuDSkdQXVPS9ST+69qYdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF8cbbUFn4FN77wazty3K/jr0b7xxGO+Mnt6FU0xjSc7CnpL2QE/q9+RTEsan/GKcnmgwlc
X-Received: by 2002:a05:620a:1904:b0:7be:8343:df20 with SMTP id af79cd13be357-7bffccc7f43mr1723091485a.3.1738339753811;
        Fri, 31 Jan 2025 08:09:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738339753; cv=none;
        d=google.com; s=arc-20240605;
        b=cDrUjpdZwp68nCZXxXz6RK5oAZMXpiR2vhlUt8DEIo2V4nVxMomAHw+e3pM3nB16qy
         /iEWT/1Xjw9hIkREAzlkbTQzrDiQHirrQozCDsp4wfKIccglt+TTwPDMema9RxPCBT3R
         YxJBk/j0OixVaap/8CWAGFNDms/e2K4GG8Rd/tHK94zzaoI40idOcb4YgOfhqekUNRyQ
         aTQzqTLjiC2SB0qmtrRgvN1GmSRFgFecXtMD370urnTtaldmn43ayKVEO6EZM2hGsjnN
         4Gab77ZX6FbwLSqMLBSjRtHv3s7ZAjz3vYeXenx6rbxr4aqhGrEK1FWUR6g6ytrWHN6i
         T5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6aajYEpX8wIlISw9r5i3wytkU3PBeq2yQPEpeWE9yXw=;
        fh=qjIQ5/l4PgrIMj4PFT2eXpxjHZtrT+8/TXoAFsCdnE8=;
        b=GXJID6PcfDZao4yilXEIRg7sjGMKkQoFbMbUThlhivDx6NmlT3vhX+n+nC8e+++yVV
         8IKWNonce0zOcFshtzWa2qeZyGlr5bYrYfztZnO8Xawspw0MnJOoI1FlW8rTVA20K611
         ocCB1wF3DqK7ZWplVXdtIUVM4GuNLZfWSSj44z/0FmS1jVC4JTW0OGwlw8seNGdQCWWo
         kWV6qfcaH6QvNHInWsH9noazuRk+T2n9Dq0k4GgzETUCjpBEyYCPJ+QhMBEecI6WZJq9
         e/Dhtq+HU7cAdIspux0lJSbfdodtPEWSGJ/sGmpoUBOfZ7XRNn72G1eBjIWwxdS9+Wy0
         SmEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QB5OB8kY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a93b9f2si421609385a.601.2025.01.31.08.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 08:09:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QB5OB8kY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdtZR-0005QA-So; Fri, 31 Jan 2025 11:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tdtZP-0005PS-Nf
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 11:08:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tdtZN-0007AU-UC
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 11:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738339717;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6aajYEpX8wIlISw9r5i3wytkU3PBeq2yQPEpeWE9yXw=;
 b=QB5OB8kYw6g9875WPJZVfmYtpZAE1M2Y2OWfEZBP4tjNDfDMafA36xwnT0tFO5Blstt0uX
 3LIJHvNiiKZ/qXXssdYzntZSoLb0au9EkOen6dCELo5IAXuCsU9PqqbFujMhReS5Yxq8C4
 dnaVf9xqxr4CS+oJADYAwxlH7hzJh0k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-qYc8nr5iPT-PJfxLfpj-kw-1; Fri, 31 Jan 2025 11:08:33 -0500
X-MC-Unique: qYc8nr5iPT-PJfxLfpj-kw-1
X-Mimecast-MFC-AGG-ID: qYc8nr5iPT-PJfxLfpj-kw
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361eb83f46so16515145e9.3
 for <qemu-arm@nongnu.org>; Fri, 31 Jan 2025 08:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738339712; x=1738944512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6aajYEpX8wIlISw9r5i3wytkU3PBeq2yQPEpeWE9yXw=;
 b=rf5t9HpGdG0ep4yWvavwHLT1tebvb+J0R91258sn7M/9/hmW85UsLr5P818GGAaK7H
 z9eqfbYv0+Ra2vLgg9Ze+uzV5uyxxSxWpdMzIaQ6R8/R0zRc9qocY4dlUMi4/9eVkO0I
 xr+C4dLWe645ER4wCbmUpwke04Xqlah4tEAGXzhE7rKZ0xzWLLmgWYiKZHZFe2hZYOqY
 m9fMAud3Zheue+oO1b9VR5Oc2kWs54i/R7smTVN9CVcpmzrHGF+Lixp0pEXmVF0Qe9Ct
 ROntBr/jaU4PAX4D0lNlaHZZuTFrwSa4Z/DknlilwVs4hTTLUhfctojtCYnBlQ3rcfED
 ZDiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXerzjA2zXzQ9teCEb/b0UvPnbZZdqgItvkQuYifLzDNS93v0M/1a4qOq8k6cTWyl1NSWOkA89F3w==@nongnu.org
X-Gm-Message-State: AOJu0Yyo/MwpnmD+nGQuQu/elwwtNe08sNAWdbmn9HASOMeBvFHlfQ7j
 Aw1xxfG9v834RzVFSx/10/n3WU9YPSd7SiSyZMC4RydogjACxgFrao+wArqBghgPVbulIwVO9gQ
 x9/wAFCYDlMAS7VVbUIRiIXk79GxyqHA7edaGlp801Ej+5fWWdA==
X-Gm-Gg: ASbGncvdPzg21oVVprYY3OugGRD3kpZ8v5GKdh4BNKU1UMw3glGkMBc+Nu2iNxAmxhJ
 SpMuuO2JZ9a7cC1ZI40OghIGysP7DMdk+1lM+r++3DV5t3zBtwSTm+6+EEAYlYMZ4C+NZGjQWOd
 UFNHh4MkpSEhhRCD+KGGYAVSu5Jy7bdRAULC/DLi48KN/Rms7b4HIDSWgW44YF2j7krnbzej47e
 tREfqR64d0Hja6sDC1YoIbNgI6UizRvU/gYUJXhq40ffVlw90FjvYr2Q1f/MCqXTOE4INCYVzgt
 BUUQz2KbbUS/h2qHOQ0cDm1XQWDf3cTZxC3gWDbmTwtboRPYPsNQ
X-Received: by 2002:a05:600c:1c93:b0:435:9ed3:5698 with SMTP id
 5b1f17b1804b1-438dc41d1cbmr98456265e9.24.1738339712013; 
 Fri, 31 Jan 2025 08:08:32 -0800 (PST)
X-Received: by 2002:a05:600c:1c93:b0:435:9ed3:5698 with SMTP id
 5b1f17b1804b1-438dc41d1cbmr98455845e9.24.1738339711596; 
 Fri, 31 Jan 2025 08:08:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438d755387fsm80315405e9.0.2025.01.31.08.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 08:08:30 -0800 (PST)
Message-ID: <c292ab40-3620-4e72-b043-4e3cbd7fd297@redhat.com>
Date: Fri, 31 Jan 2025 17:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 Nathan Chen <nathanc@nvidia.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z5uiGnAxUf4jXTEI@redhat.com> <7ecabe74e0514367baf28d67675e5db8@huawei.com>
 <fc91e1a798324390b2a556fae5d40f46@huawei.com>
 <20250131142404.GP5556@nvidia.com>
 <3efcea1171af4b2f81be842f2c55fe51@huawei.com>
 <20250131145411.GR5556@nvidia.com>
 <20039bbc40df453a8a41a863d74b9ff9@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20039bbc40df453a8a41a863d74b9ff9@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7OhmT2KP5xfMxLPHpvTDPHVMFsfRRuUgURJkwyQ82VM_1738339712
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: sA8kym3+0nCB

Hi,


On 1/31/25 4:23 PM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Jason Gunthorpe <jgg@nvidia.com>
>> Sent: Friday, January 31, 2025 2:54 PM
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Cc: Daniel P. Berrangé <berrange@redhat.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org; eric.auger@redhat.com;
>> peter.maydell@linaro.org; nicolinc@nvidia.com; ddutile@redhat.com;
>> Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
>> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
>> Jonathan Cameron <jonathan.cameron@huawei.com>;
>> zhangfei.gao@linaro.org; Nathan Chen <nathanc@nvidia.com>
>> Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
>> nested SMMUv3
>>
>> On Fri, Jan 31, 2025 at 02:39:53PM +0000, Shameerali Kolothum Thodi
>> wrote:
>>
>>>>> And Qemu does some checking to make sure that the device is indeed
>>>> associated
>>>>> with the specified phys-smmuv3.  This can be done going through the
>>>> sysfs path checking
>>>>> which is what I guess libvirt is currently doing to populate the
>> topology.
>>>> So basically
>>>>> Qemu is just replicating that to validate again.
>>>> I would prefer that iommufd users not have to go out to sysfs..
>>>>
>>>>> Or another option is extending the IOMMU_GET_HW_INFO IOCTL to
>>>> return the phys
>>>>> smmuv3 base address which can avoid going through the sysfs.
>>>> It also doesn't seem great to expose a physical address. But we could
>>>> have an 'iommu instance id' that was a unique small integer?
>>> Ok. But how the user space can map that to the device?
>> Why does it need to?
>>
>> libvirt picks some label for the vsmmu instance, it doesn't matter
>> what the string is.
>>
>> qemu validates that all of the vsmmu instances are only linked to PCI
>> device that have the same iommu ID. This is already happening in the
>> kernel, it will fail attaches to mismatched instances.
>>
>> Nothing further is needed?
> -device pxb-pcie,id=pcie.1,bus_nr=8,bus=pcie.0 \
> -device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1 \
> -device arm-smmuv3-accel,bus=pcie.1,id=smmuv1 \
I don't get what is the point of adding such an id if it is not
referenced anywhere?

Eric
> -device vfio-pci,host=0000:7d:02.1,bus=pcie.port1,iommufd=iommufd0 \
>
> -device pxb-pcie,id=pcie.2,bus_nr=16,bus=pcie.0 \
> -device pcie-root-port,id=pcie.port2,bus=pcie.2,chassis=2 \
> -device arm-smmuv3-accel,pci-bus=pcie.2,id=smmuv2 \
> -device vfio-pci,host=0000:75:00.1,bus=pcie.port2,iommufd=iommufd0 \
>
> I think it works from a functionality point of view. A  particular
> instance of arm-smmuv3-accel(say id=smmuv1) can only have devices attached
> to the same phys smmuv3 "iommu instance id"
>
> But not sure from a libvirt/Qemu interface point of view[0] the concerns
> are addressed. Daniel/Nathan?
>
> Thanks,
> Shameer
> https://lists.libvirt.org/archives/list/devel@lists.libvirt.org/message/X6R52JRBYDFZ5PSJFR534A655UZ3RHKN/
>

