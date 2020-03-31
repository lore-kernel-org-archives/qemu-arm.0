Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3692595lfi;
        Tue, 31 Mar 2020 01:25:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuL/EJv2KhUBqd1vwGNTEWUvRJokwryqAiTrdzOIz1C6d5juGDq2mrXCHgOZYVmEHZdj9d+
X-Received: by 2002:a05:620a:702:: with SMTP id 2mr3861741qkc.248.1585643145394;
        Tue, 31 Mar 2020 01:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585643145; cv=none;
        d=google.com; s=arc-20160816;
        b=EgRqNN6WandLnxmXMdPcmPZouSieeMWKnVAdmfftG3zBG0YaDdBgmDYMaRp6uyZOki
         oQFuZyq50YmpVzl6jkmyFj0RX9bLr01Z7U240lC+J83iGO8FN/I6rBgoxHSgOkL/lMMk
         ft98+WEE4PWYG5ds4u2u+t9Df/9AbRD4OLNF1Oo3/t5HZanN7uGbs9wn9iqXHxqCb4Ap
         1ZTByZqbkFPGuNNuvHKdsG3CuSkjzJ4mbVan24aElNhdV27g6ZE8EDi6bRvCQeoHD3gu
         JRWzFUOe7Gv/YIazcRM6zY0ULsDDg0YIjH8YPe9pR8/87HSXCPnD7JxK3Khfk8mXDRt1
         KcGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RBjB4RwxEoa9gh4/QXpSAf7OmChI2hQjPdb5UTa+Xa0=;
        b=Ic4pPMmQehSa1hvPVBgddRIwqJdw4SvCDZ1HeTLF4zZzPS2tqq0DjGeznTt7fHlvws
         OL2UqB/ySQJaRqrgu1FxP81dCDaW1Lltj3TF60PXyFQweZW3y5bGbZq6thFJHfZXqw19
         50SbnGyPEkc2sLD0zZgZ8cimBuQlco10dqwcRp+SMlF/Qylpu7JHPmqzCozXQtwjG8Uv
         XkAmaBngFJtKYEZ3WiTzTw9J/rYh0iOOdCGx5p+Rp6OjYOsOVWtwkdh4zZYaV5V09gEz
         25AbIa67xaF0VuyFf5XdELleBA/UXBLJ/BsbFwRYlGphhU4+/UkZmW/x2UZ6ig23U1II
         /TFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AOi8tl6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c124si9556771qke.33.2020.03.31.01.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 01:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AOi8tl6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJCDQ-0000Oo-S5
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 04:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56640)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhangfei.gao@linaro.org>) id 1jJCCM-0007DH-7t
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 04:24:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhangfei.gao@linaro.org>) id 1jJCCK-0002Qg-HF
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 04:24:37 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38402)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <zhangfei.gao@linaro.org>)
 id 1jJCCK-0002P0-9W
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 04:24:36 -0400
Received: by mail-pg1-x541.google.com with SMTP id x7so10023748pgh.5
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2020 01:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RBjB4RwxEoa9gh4/QXpSAf7OmChI2hQjPdb5UTa+Xa0=;
 b=AOi8tl6BbSN3D1/izOtH6vxk1PdXCoWZcIUUg0RLWqMsDArt/y8llkXPrOqBQz7XbF
 n1DgtS8/sHp7EZckh46znX0VCZG87XREVusjJ2NvdDbosve9GowL75BEapHEzTE58Hp2
 QYJQI3ZeTtmuhauyeusr1OX5iqrrjE0gllWUqSnL6PxeL2uXdKFT1dWyQngTvNto5IiQ
 5UaeTG37j7AE4rwts9PDtsEIu1v+uHQKbkoRF2lU4yZiYw3DEfNUL6yrOJ7g3TMkCo0y
 rYoAp7FzV4XAdDV8zI97Ut8R5dTWPTym4uGvleNgtwYbZ9Q70MPF7ToX8OPuC2XCUQpg
 4PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RBjB4RwxEoa9gh4/QXpSAf7OmChI2hQjPdb5UTa+Xa0=;
 b=GNyNljh/lzWg+4KCm5sKBTKI8frJ+MjqZaHXvQf2paFtCuIGK8zIMEViIgrv8dN9dL
 vRUnqqy7pEwN11QZTx1Orl3Mfd0U4Dyk7xGpGFn0pK3iB3UvGEcgxjDuf8nsu/IysPWz
 O48xL5Zqx5vlDgPCTNq7c9db+s8h+vvgpqY0XuRi03UZGJ+sc6quV2JXqwmUhO+HKoWG
 YS8zu1WLEwqGrIVz2ieSQwpdkkJyHOkrX3TMdJXw3uEB8ZTWyAfXbjA5LSovjrV9UdZV
 v2oMX+FEMuW5KVKpMkHH4t4JbjZVwqNKY/0Eu2c4+PYpq59ALswiIFBPujNYZZBZqugG
 sbCQ==
X-Gm-Message-State: AGi0PuYqq7vRecBZclYwN1/+kpBjyAvp8IwFZh8QwLkNCRB8hDxg5IJ3
 ClN2g1LayLV+An6KD5dEVXH7Ig==
X-Received: by 2002:a62:1648:: with SMTP id 69mr3628656pfw.14.1585643074785;
 Tue, 31 Mar 2020 01:24:34 -0700 (PDT)
Received: from [10.27.1.2] ([45.135.186.113])
 by smtp.gmail.com with ESMTPSA id c128sm11792183pfa.11.2020.03.31.01.24.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Mar 2020 01:24:34 -0700 (PDT)
Subject: Re: [RFC v6 00/24] vSMMUv3/pSMMUv3 2 stage VFIO integration
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
References: <20200320165840.30057-1-eric.auger@redhat.com>
 <73b1c3e1-a418-f57c-d949-261250d6a79b@linaro.org>
 <c15f98fb-01d7-cb2f-5401-4b648997fcba@redhat.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Message-ID: <fbae2237-11ed-9527-0c01-340d5092ddcc@linaro.org>
Date: Tue, 31 Mar 2020 16:24:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c15f98fb-01d7-cb2f-5401-4b648997fcba@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 shameerali.kolothum.thodi@huawei.com, peterx@redhat.com, bbhushan2@marvell.com,
 will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fEeO4f6RXYUf

Hi, Eric

On 2020/3/31 下午4:12, Auger Eric wrote:
> Hi Zhangfei,
>
> On 3/31/20 8:42 AM, Zhangfei Gao wrote:
>> Hi, Eric
>>
>> On 2020/3/21 上午12:58, Eric Auger wrote:
>>> Up to now vSMMUv3 has not been integrated with VFIO. VFIO
>>> integration requires to program the physical IOMMU consistently
>>> with the guest mappings. However, as opposed to VTD, SMMUv3 has
>>> no "Caching Mode" which allows easy trapping of guest mappings.
>>> This means the vSMMUV3 cannot use the same VFIO integration as VTD.
>>>
>>> However SMMUv3 has 2 translation stages. This was devised with
>>> virtualization use case in mind where stage 1 is "owned" by the
>>> guest whereas the host uses stage 2 for VM isolation.
>>>
>>> This series sets up this nested translation stage. It only works
>>> if there is one physical SMMUv3 used along with QEMU vSMMUv3 (in
>>> other words, it does not work if there is a physical SMMUv2).
>>>
>>> - We force the host to use stage 2 instead of stage 1, when we
>>>     detect a vSMMUV3 is behind a VFIO device. For a VFIO device
>>>     without any virtual IOMMU, we still use stage 1 as many existing
>>>     SMMUs expect this behavior.
>>> - We use PCIPASIDOps to propage guest stage1 config changes on
>>>     STE (Stream Table Entry) changes.
>>> - We implement a specific UNMAP notifier that conveys guest
>>>     IOTLB invalidations to the host
>>> - We register MSI IOVA/GPA bindings to the host so that this latter
>>>     can build a nested stage translation
>>> - As the legacy MAP notifier is not called anymore, we must make
>>>     sure stage 2 mappings are set. This is achieved through another
>>>     prereg memory listener.
>>> - Physical SMMU stage 1 related faults are reported to the guest
>>>     via en eventfd mechanism and exposed trhough a dedicated VFIO-PCI
>>>     region. Then they are reinjected into the guest.
>>>
>>> Best Regards
>>>
>>> Eric
>>>
>>> This series can be found at:
>>> https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6
>>>
>>> Kernel Dependencies:
>>> [1] [PATCH v10 00/11] SMMUv3 Nested Stage Setup (VFIO part)
>>> [2] [PATCH v10 00/13] SMMUv3 Nested Stage Setup (IOMMU part)
>>> branch at:
>>> https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10
>> Really appreciated that you re-start this work.
>>
>> I tested your branch and some update.
>>
>> Guest: https://github.com/Linaro/linux-kernel-warpdrive/tree/sva-devel
>> <https://github.com/Linaro/linux-kernel-warpdrive/tree/sva-devel>
>> Host:
>> https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10
>> <https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10>
>> qemu: https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6
>> <https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6>
>>
>> The guest I am using is contains Jean's sva patches.
>> Since currently they are many patch conflict, so use two different tree.
>>
>> Result
>> No-sva mode works.
>> This mode, guest directly get physical address via ioctl.
> OK thanks for testing
>> While vSVA can not work, there are still much work to do.
>> I am trying to SVA mode, and it fails, so choose no-sva instead.
>> iommu_dev_enable_feature(parent, IOMMU_DEV_FEAT_SVA)
> Indeed I assume there are plenty of things missing to make vSVM work on
> ARM (iommu, vfio, QEMU). I am currently reviewing Jacob and Yi's kernel
> and QEMU series on Intel side. After that, I will come back to you to
> help. Also vSMMUv3 does not support multiple contexts at the moment. I
> will add this soon.
>
>
> Still the problem I have is testing. Any suggestion welcome.
>
>
To make sure
Do you mean you need a environment for testing?

How about Hisilicon kunpeng920, arm64 platform supporting SVA in host now.
There is such a platform in linaro mlab that I think we can share.
Currently I am testing with uacce,
By testing a user driver (hisi zip accelerator) in guest, we can test 
vSVA and PASID easily.

Thanks

