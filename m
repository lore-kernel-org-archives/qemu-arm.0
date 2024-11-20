Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp4058054njc;
        Wed, 20 Nov 2024 08:11:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtyT00fzWRYbjOrsb2jWFwrV5k34iaotbuATE3FwCj5E7scAm/LS7For5ZKLGjvRFFKV+oqYrSxLDUpA==@linaro.org
X-Google-Smtp-Source: AGHT+IFdLY04dzyyaFmxA5y8mTMeZlYfJIYqaNC6a//3HhjXrq//hpViljx7vn2eMeivyXm2Q7/Z
X-Received: by 2002:a05:6808:1787:b0:3e6:60e9:5f8c with SMTP id 5614622812f47-3e7eb7cd048mr2930205b6e.36.1732119113121;
        Wed, 20 Nov 2024 08:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732119113; cv=none;
        d=google.com; s=arc-20240605;
        b=Lz2n2LcZs7p1ys7o8PnmMBdob1rhxnMdIw79Ht4APKGYUXmY2lRc0K2vMCp9xdzKR/
         aIA5vLRcSdTzRfUq9bhKK0JhndX5w5fAHI1zpCa49hvGYfZ5ZFSlHvPkKHT91A3/T83C
         eHpkLHUARa7qhw/y8ZQsbJ/ntpBPjA7q2+70V1uCviqqbEQ3FnyxHdOIy3iVUhSMs00M
         eEGRXK0U2faL4jhln9m9sgbQnJQJZBQ6SXJw72vNfoLZa6vPx5QMKu7EDDhyHfswUQZx
         FbsiW0HcIvYiQngrjik08lHlbI6eac5iV/nT/kTIvXG0Jg7k1nzxoO/nhEE/WlMn1k6J
         V/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Nm/LX0o9cL2dfqFJviXHC7fgFsJ0xM8xd8o8x+AtuMc=;
        fh=O9mZ91FWHUg4QUazXbqxeoAzQArYGxylMmqM51Wg22I=;
        b=frrF5OruO/lwDYl85Ean26fjkhMlB6FRM4h485thSz7GlLDbkWaHmFLwIUxHFt2CmT
         Kk6ie/jWjsaNDqSxHVSwTmwn3asjbgUH+IDcJCDyfM4mAWZ7+lYuHA1EQVkzaJ3L6OzS
         GJIwHRFA9Dkg4mMKZSHnD805Q9fHS4Aa1umzMChTGtowoKwVXYm4iqSr6c/vzCEbMZRx
         RnwNeeQB6SVt1SEVgwsBk3D+zSu+FEXiMovPbTn1U7C91PU35OluRzmLqJRugFrTpTi1
         f4o69xj5hGYiEgcvqHsUXcaQ9RNiNqswc88juam65DgALnw717hOOxKnIruDJ/H8TcI9
         3jtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZjdRTkVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4adbe4cc5bbsi208396137.427.2024.11.20.08.11.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2024 08:11:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZjdRTkVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tDnIE-0001xw-2y; Wed, 20 Nov 2024 11:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tDnIB-0001xg-N3
 for qemu-arm@nongnu.org; Wed, 20 Nov 2024 11:10:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tDnIA-0008M7-2b
 for qemu-arm@nongnu.org; Wed, 20 Nov 2024 11:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732119055;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nm/LX0o9cL2dfqFJviXHC7fgFsJ0xM8xd8o8x+AtuMc=;
 b=ZjdRTkVfb+v7BrHssXZoFnqvgUseHnRGdMzEIUL+EdCujaSi32q4KILZtLy3yay/A11y8y
 Hu/84B6YF+o9WE3Kaf4gpXXm8eZTAZByAsHLAAyZztK1PjqRNjztV1PFfW+AM9d0Y680gT
 t38F45/FIQBnU34x+yw5esoz8SwcSTE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-d8wBbsWFOtm8WFI-nNQucg-1; Wed, 20 Nov 2024 11:10:54 -0500
X-MC-Unique: d8wBbsWFOtm8WFI-nNQucg-1
X-Mimecast-MFC-AGG-ID: d8wBbsWFOtm8WFI-nNQucg
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7b1492b01b0so674859185a.2
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2024 08:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732119053; x=1732723853;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nm/LX0o9cL2dfqFJviXHC7fgFsJ0xM8xd8o8x+AtuMc=;
 b=mlJJ+F7Lj6jl95bIQJV8Y7M9PT4pXjiK8ZuqeCxK7m7CAwm4Tv85CVuaBl2NWWTkQi
 Zr5/pWZengHTmMK7FPTgS/2RO89FJSg0M9FwMDkKV0fkpQWKu5F8HfxDmqF9WL+uFsLu
 pCeaYfszcQtMyrcp8KuyLXM0x+rxtzvBLWxsZfsmDbGme4na9eUpY2MSNhNYAADf209W
 z5jGECg9vpnnWTLoWTCCyCsf+t7ZoTDk963hH1NFDuFcoh499TCSZ2dKAUUUe3qdob0i
 GCa6vvJx4I10FUynAwllQzF0k2Z1wFO2jrLSATJZhIsxXqqjRmnY68G9Gy9Y5omrrryB
 O7UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvPqjjCaYzNv4hbdHIrdV7uuwKdFZpmOOcpDtXPZ2LCiHjhJq0BcBHvI+jj2dUdsZO8KeeRBcS9g==@nongnu.org
X-Gm-Message-State: AOJu0Yy7vvJl1/uP8sbG2OsPN6+i5j7EOBpiK0MyQWW8ekzCYGIl4ngo
 O10aW3NerV6cw8HedNP/KCz1KCbNJheA59GiH1Vz19eT9HirtKGIDwfiEiF0v+fJ1SBQokPwce2
 RuoS3erRYkikIxMGNo6rW2sLPUX/PI5iidEuZBlkNmtcKIBXuu9fhWiG94g==
X-Received: by 2002:a05:620a:1993:b0:7b1:12df:2589 with SMTP id
 af79cd13be357-7b42eda94d9mr412972685a.7.1732119053097; 
 Wed, 20 Nov 2024 08:10:53 -0800 (PST)
X-Received: by 2002:a05:620a:1993:b0:7b1:12df:2589 with SMTP id
 af79cd13be357-7b42eda94d9mr412969885a.7.1732119052787; 
 Wed, 20 Nov 2024 08:10:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b479d90edfsm111825685a.61.2024.11.20.08.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 08:10:52 -0800 (PST)
Message-ID: <41a67d4e-f7b8-4586-8d52-c32df400b675@redhat.com>
Date: Wed, 20 Nov 2024 17:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] hw/arm/virt-acpi-build: Build IORT with multiple
 SMMU nodes
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-5-shameerali.kolothum.thodi@huawei.com>
 <1dcea5ca-806f-4f51-8b13-faf5d62eb086@redhat.com>
 <efb9fb7fb0f04d92b7776cdbc474585d@huawei.com>
 <48bb0455-7c2e-4cc6-aa15-ebe4311d8430@redhat.com>
 <0803ec1a010a46b9811543e1044c3176@huawei.com>
 <aafc5fba-8d68-4796-a846-265362e7acac@redhat.com>
 <30ff8ac9ee9b4012aa6962c86ac06375@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <30ff8ac9ee9b4012aa6962c86ac06375@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gxlLY4LCWPdjAZcimfsh1XHZwxvHtm2Mt2EHvz0bg4k_1732119053
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: 9sry2abV5MeW

Hi Shameer,

On 11/20/24 15:16, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Monday, November 18, 2024 6:10 PM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>> ddutile@redhat.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
>> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
>> Jonathan Cameron <jonathan.cameron@huawei.com>;
>> zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH 4/5] hw/arm/virt-acpi-build: Build IORT with
>> multiple SMMU nodes
> [...]
>
>>> I think the above won't affect the basic case where I have only one
>>> pcie-pxb/SMMUv3. But even in that case hot add seems not working.
>>>
>>> I tried hacking the min/max ranges as suspected by Nicolin. But still not
>> enough to
>>> get it working.  Do you have any hint on why the hot add(described
>> below) is not
>>> working?
>> Hum thought the duplicate idmap could be the cause. Otherwise I have no
>> clue. I would advice to fix it first.
> I think I have an idea why the hot add was not working. 
>
> When we have the PCIe topology as something like below,
>
> -device pxb-pcie,id=pcie.1,bus_nr=8,bus=pcie.0 \
> -device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1 \
> -device pcie-root-port,id=pcie.port2,bus=pcie.1,chassis=2 \
> -device arm-smmuv3-nested,id=smmuv1,pci-bus=pcie.1 \
> ...
>
> The current IORT generation includes the pcie-root-port dev ids also
> in the SMMUv3 node idmaps.
>
> Hence, when Guest kernel loads, pcieport is also behind the SMMUv3.
>
> [    1.466670] pcieport 0000:64:00.0: Adding to iommu group 1
> ...
> [    1.448205] pcieport 0000:64:01.0: Adding to iommu group 2

But it should be the same without multi-instantiation, no? I would have
expected this as normal. Has you tested hot-plug without the series
laterly? Do you have the same pb?

Thanks

Eric
>
>
> So when we do a  hot add,
> device_add vfio-pci,host=0000:75:00.1,bus=pcie.port1,iommufd=iommufd0
>
> The Qemu hotplug event handler tries to inject an IRQ to the Guest pcieport
> by retrieving the MSI address it is configured with. 
>
> hotplug_event_notify()
>     msix_prepare_message(): [address: 0xfffff040]
>          msix_notify()
>
> The ITS address retrieved here is actually the SMMUv3 translated iova addr,
> not the Guest PA.  So Guest never sees/receives the interrupt.
>
> I did hack the IORT code to exclude the pcie-root-port dev ids from the SMMUv3
> node idmaps and the hot add seems to work fine.
>
> Looks like we need to find all the pcie-root-port dev ids associated with a
> SMMUv3/pxb-pcie and exclude them from SMMUv3 node idmaps to get
> the hot add working.
>
> I am not sure though this will  create any other issues in IOMMU isolation criteria
> (ACS etc,), especially if we want to access the device in Guest user space( I hope
> not).
>
> Thanks,
> Shameer
>
>
>
>

