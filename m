Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp412309njc;
        Wed, 19 Mar 2025 10:39:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUu0JpeaaTAfZm1eOv8TTlMF3vi7lJSaefFs9kudOn63fkF1vcJIB6OLZ+eDqiHJI4QQGkcjLmhYaPC8g==@linaro.org
X-Google-Smtp-Source: AGHT+IHTBUhl6ClPPA9AGeBSQ9MBlWIWOtSWa43HRSApSDKt4PKztpTqYVDDuW6sKfNum27uC4kX
X-Received: by 2002:a05:622a:4311:b0:471:fa1c:3cbb with SMTP id d75a77b69052e-47710cc3a1fmr5470361cf.22.1742405944266;
        Wed, 19 Mar 2025 10:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742405944; cv=none;
        d=google.com; s=arc-20240605;
        b=VeDuxPBkVDnjlBM+JjWHtgD/xYgS4qrIPp3B1TB5V79VHd6v3y+eLuaVL72Wvh4o5f
         Ply3sltjIdf8h4vpP5/jy5aF3pnXFFE4DP8AHze4s99eNoZ7rQcYNnJDJdovpAONaAUh
         FBJbgwCvkSgCATbYwlFXnfCtg9C0lYwLmAVQ13aSbyO5t5g8U00nhJ9UgsBMe90A+XHq
         3dmv236D10am4LP2Bo6gNnnTzaj2AiDsnu0zp8lriEGf0lt4/ubkJ6Xtm8/zQlJ6XiRP
         d9iF3j0W+nLv2d9Gf46bH1legtXg6aa0dITXuuIEkWANVQRQgtG+CNXc7jDUKICT6R+/
         NwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Dn1EhXkOVyCxerNJNsPgFaLB1/m1+olH07gNcMdi4I0=;
        fh=DDhgd+0etaKvfezq2Vao89fX6xumBh66RLS3OcDsaP8=;
        b=XFYXrHumbAjG9/myFot6D5sJcxllwo3xiBMW9OVjRnLbZ118OFST1Fmhwgq41+LatT
         COZ2VWNjdAD1A1PKDg/9ZErBPzRQ6J2PtohaL9JbPg/gxEs1SejgC8KzbT1YgRkKsn6O
         hkNYA9HYhOZ8Dm0s3GkbJ9PDl8/6APWBGgVNnjck5Cw/iYoQMuVnc87F+qsCiwkwPvJt
         b02DIQI9/M4/uF3hyfoEbVrjoAW/NM2FlsJwqLzExUYR7ifKw+NfxwcKXAQWAUZFvHre
         f6uBDrO1QH/LP4VD1S3f7kRjbvHGgsKv44eVf/U6j4wR8H92AFXbqSrNTV3k+zwfibU2
         VhJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W6vq9miN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb6186e5si145106831cf.39.2025.03.19.10.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 10:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W6vq9miN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuxN6-0004Iq-2K; Wed, 19 Mar 2025 13:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuxMs-0004H9-Dw
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuxMq-0005ZQ-Bc
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742405891;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dn1EhXkOVyCxerNJNsPgFaLB1/m1+olH07gNcMdi4I0=;
 b=W6vq9miNGc7rcgMmX/jKD1lQyuyYxCkWYmpmEdGf5xBX7C5MecnjBrbkkY+qsFCi2vG9pX
 EP4wbXw4xvuYpx7HdluWPKbBq4dT9Iq8yyX73meQpN3ve4fHxeAGZ2+Q9Hhm3m0LLr0TjK
 3qpDeOOk3R5TrEofJ9MGdQYktj9Uvns=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-GIw8RPGcMNW0cpJarSyfPA-1; Wed, 19 Mar 2025 13:38:07 -0400
X-MC-Unique: GIw8RPGcMNW0cpJarSyfPA-1
X-Mimecast-MFC-AGG-ID: GIw8RPGcMNW0cpJarSyfPA_1742405886
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3912d5f6689so4386090f8f.1
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 10:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742405886; x=1743010686;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dn1EhXkOVyCxerNJNsPgFaLB1/m1+olH07gNcMdi4I0=;
 b=MZBAJhaQTm1yoLLT+b2+qmzGsrMcljuWPm2V1VC89YomDfn9IemfbeIfXNV3OMsnxc
 3BX5hPYRlu9MIE6QDUdnbliuptpS/8hTM8+tKRP2VcrLja+GdjGyUH2n6su+1CaAq2x4
 Jym6liK2Lcg3GudmVZ7qJEG+qcuIeXW+CZWWHmH4FE45JvjckODH6YqfhEskZH0sBnGr
 GCR9Um6FMpfGfSyfG7Dl0W8f+TxE3Qchx1r1efnguP4SptqVqea8ztNcMBAdkmtWnI1d
 KURIA7wsxt6Ig940pfaKSqG4Mqsv/xh6DeKhzvJPt7CnwbSUVOYO3upLd86/uhyAd02M
 XFDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHNCWjONUy2pwduKYY6KiLBpCudcdw5UfluuBM/5zGt3Kv6pJwUWZHoUZiAuiQFqqDAtZ6df3Ytg==@nongnu.org
X-Gm-Message-State: AOJu0YyZCB4Ebl5BECXp79pljHni9+b4V4NkjJKJ3opa49V5zsVFA4px
 Cw66f45EH1D/ZSR/Yp8stHUaGpaEot2IflrNE5+ERSwnL16CQzhPWmUj65e30uPuV/q8REB74ov
 QNCfiTJbEMu52VBB5PZmVDZEOFQ6SqZUiuROts/FF8l/FlXxneQ==
X-Gm-Gg: ASbGncs2ku7nHDAW90y1VzjG41a3pLnyyAhGfpUMoRg2wBu3xjju+EalrDijFIo005/
 9RLdI+J4/WsiRKI9wOD27+zpBTcK5S54lQfe5ow5Dobo6+k6Iw5QMs6mlJgD2uP3BchtjCIYZOr
 YlvyNQ5VNozwp3tCvyyS5cYBTVM+DN77x6eUbRtyXFMn71w6hSo0VeZhd3FtMQkAMEr8PQeN9Rt
 VH6NMYNQAunZNs0AVFfC7GYXO1BwzgP+jqZ7pIF/6tQ63cRstqvvBeKJctbov0Qt6h+59imoM75
 f9lTyQZRYIniBhgCILD0aHBf9xSBS2mVB4LegrzigIkN7+9PCPxoc09ctoAWY9o=
X-Received: by 2002:a05:6000:1842:b0:391:3f94:dc9e with SMTP id
 ffacd0b85a97d-399795aceadmr367752f8f.16.1742405886428; 
 Wed, 19 Mar 2025 10:38:06 -0700 (PDT)
X-Received: by 2002:a05:6000:1842:b0:391:3f94:dc9e with SMTP id
 ffacd0b85a97d-399795aceadmr367729f8f.16.1742405885989; 
 Wed, 19 Mar 2025 10:38:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975febsm22086264f8f.59.2025.03.19.10.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 10:38:05 -0700 (PDT)
Message-ID: <b3c2430d-bf29-452d-91bb-af0d8705e54d@redhat.com>
Date: Wed, 19 Mar 2025 18:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Donald Dutile <ddutile@redhat.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia> <20250317192453.GR9311@nvidia.com>
 <Z9iDxSvZVsgtasGj@Asurada-Nvidia>
 <6cb391a4-d150-4692-b62e-a509448a1034@redhat.com>
 <Z9nF6FaIU37BNg4B@Asurada-Nvidia>
 <3716d39d-3f88-4914-a9d6-440d379db3d7@redhat.com>
 <20250319002325.GG9311@nvidia.com>
 <27aee7f3-5316-40b7-bd7e-dc68a7a1d0d2@redhat.com>
 <dd973ecfbdc541f09540bdbcbf844047@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <dd973ecfbdc541f09540bdbcbf844047@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SGXNEYoF0N5MN-BayIZ0NdagniITEnGzestM85XJknQ_1742405886
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-TUID: MZGxOF1wr/NI




On 3/19/25 6:12 PM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Wednesday, March 19, 2025 5:01 PM
>> To: Jason Gunthorpe <jgg@nvidia.com>; Donald Dutile
>> <ddutile@redhat.com>
>> Cc: Nicolin Chen <nicolinc@nvidia.com>; Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org; peter.maydell@linaro.org;
>> berrange@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
>> smostafa@google.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
>> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
>> Jonathan Cameron <jonathan.cameron@huawei.com>;
>> zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
>> infrastructure for smmuv3-accel device
>>
>> Hi,
>>
>>
>> On 3/19/25 1:23 AM, Jason Gunthorpe wrote:
>>> On Tue, Mar 18, 2025 at 05:22:51PM -0400, Donald Dutile wrote:
>>>
>>>> I agree with Eric that 'accel' isn't needed -- this should be
>>>> ascertained from the pSMMU that a physical device is attached to.
>>> I seem to remember the point was made that we don't actually know if
>>> accel is possible, or desired, especially in the case of hotplug.
>> that's why I think it would be better if we could instantiate a single
>> type of device that can do both accel and non accel mode.
>> Maybe that would be at the price of always enforcing MSI resv regions on
>> guest to assure MSI nesting is possible.
>>
>>> The accelerated mode has a number of limitations that the software
>>> mode does not have. I think it does make sense that the user would
>>> deliberately choose to use a more restrictive operating mode and then
>>> would have to meet the requirements - eg by creating the required
>>> number and configuration of vSMMUs.
>> To avoid any misunderstanding I am not pushing for have a single vSMMU
>> instance. I advocate for having several instances, each somehow
>> specialized for VFIO devices or emulated devices. Maybe we can opt-in
>> with accel=on but the default could be auto (the property can be
>> AUTO_ON_OFF) where the code detects if a VFIO device is translated.In
>> case incompatible devices are translated into a same vSMMU instance I
>> guess it could be detected and will fail.
>>
>> What I am pusshing for is to have a single type of QEMU device which can
>> do both accel and non accel.
>>> In general I advocate for having several vSMMU instances, each of them
>>>
>>>> Now... how does vfio(?; why not qemu?) layer determine that? --
>>>> where are SMMUv3 'accel' features exposed either: a) in the device
>>>> struct (for the smmuv3) or (b) somewhere under sysfs? ... I couldn't
>>>> find anything under either on my g-h system, but would appreciate a
>>>> ptr if there is.
>>> I think it is not discoverable yet other thatn through
>>> try-and-fail. Discoverability would probably be some bits in an
>>> iommufd GET_INFO ioctl or something like that.
>> yeah but at least we can easily detect if a VFIO device is beeing
>> translated by a vSMMU instance in which case there is no other choice to
>> turn accel on.
> Not sure, how you can handle hotplug in such a case? For example if  the smmuv3
> dev starts with an emulated device and later try plug a vfio dev? In case of "accel"
> the feature bits(IIDR) is queried from the host SMMUv3 and is presented to
> to the vSMMU(See patch  #16). We can't do this once Guest is booted.
if accel=auto, if smmu is attached to a bus where only emulated devices
are plugged, at cold start accel=false and then it effectively becomes
impossible to hotplug a vfio device.
if accel=auto and smmu is attached to a bus where a VFIO-PCI device is
cold-plugged, we end up with accel=on forced.
otherwise you always have the possible to opt-on for accel with accel=true
just like intel_iommu has caching_mode option.
>
> Also Daniel previously commented on RFCv1 that he would like to have explicit
> vSMMU<-->pSMMU association in Qemu command line. 
> https://lore.kernel.org/qemu-devel/Z6TLSdwgajmHVmGH@redhat.com/
tbh I did not understand why this explicit setting was needed and why it
can't be inferred from the HostIOMMUDevice. But I need to read this back.
>
> Though we are not there yet without a cold-plugged VFIO dev at the moment,
> having auto detection of accel is not the right approach if we want an explicit
> association in Qemu command line.
Maybe we shall not focus too much on auto detection at the moment.

Eric
>
> Thanks,
> Shameer

