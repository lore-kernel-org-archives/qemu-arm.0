Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp338772ejk;
        Mon, 29 Jan 2024 09:56:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVgIguuMI8IaXmkgU4TTwWQpd7TYBPlkmtueXNx6R3EXgrwPT1PjHxDZkWGnlvlxiCLliR
X-Received: by 2002:ad4:5f4b:0:b0:68c:512d:21fe with SMTP id p11-20020ad45f4b000000b0068c512d21femr1961171qvg.116.1706551004021;
        Mon, 29 Jan 2024 09:56:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706551004; cv=none;
        d=google.com; s=arc-20160816;
        b=ZspLR1i7XIaTHJebsERwf4H8AtPr8EjV+gFHYI3jLOpQk+trAWqB9ghcmycAkbYV6l
         elVvM44gUd5d0QjGRPqfw/nc6qbWkP8JTmJKarBoaNQMUNDfDZ2GuRarF0u7NtwjgUSW
         mBTTrqoJjPhFwl42I+Z37WIOo4B28pN+8hntkcnY8vUBG4tHQSTnMBjGzqlsTMK3O+/6
         8/Cat7Mi75IdRAzYSeNO0Nfw8rfVJrH8P5O5jLYqGh7f4KN71XzTLBryOcCpAnSJvJyY
         /PMA5M0mJVS0f1du4toBO5Khgjgqy5NyxnJ5NKqlkMPZhggo6gaW92DvCFaDLw+9li3n
         wDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BwaOH5m5Z9rNRJ9ff4k7uVU79wAUgcNfRycVnyZgfHQ=;
        fh=lmEVlNugKYpMmE7ME3x3XcZGnNZ8Ak2prBzg/K3rtvg=;
        b=ZtiGOjlhIn9cR1eejtVtHzvpdxoe+K3ibsE6hCPmhs1Zqi4dveeptWb0uJEx4EzHZY
         HdqRimEYF1AOTOLlKVPKfHXkSXEFscuYajowPLA4mAW2wMTgSg4JNzsO3GT+71bm1GHK
         UB2VF4x2Ou/7msod5Kzicr9JkkQ/0AWdjJscXQwE4cIUVZP+SRtPxxQM0a/UN9L9k7yb
         tMA1J+o2g1oXvc2gK918v56nqX+pm3yCyWokgYiYalCz0M1WB8BRTBoPsOpUkA5Vuw05
         IRdlcKxQystI5UP9Cf/scfhqSoHONvGQYc+rj55wHKJ92qFHmUykfGFWfIYuUVP5DGuc
         AHXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RGMjHYgA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020ae9ec08000000b0078314a8b5b8si7893256qkg.497.2024.01.29.09.56.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 09:56:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RGMjHYgA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUVs3-0004pd-Ga; Mon, 29 Jan 2024 12:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rUVs1-0004m7-IR
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 12:56:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rUVrz-000302-ND
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 12:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706550990;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwaOH5m5Z9rNRJ9ff4k7uVU79wAUgcNfRycVnyZgfHQ=;
 b=RGMjHYgAJLJW78ot4W3klM7eikWbR0YXcBMh8gG6Z82yu+nd5+AeuGQZBxuH0Tzpzw2t+r
 fzdXTOw/qqeOHYZyR1mMJ8qf8YUU6TUcvglncYgt5Rr7tRHiQ+kEzEq2Ih18QQnyeS82HD
 HsN+7vd7oF5iWle2van6kZQutrO42aM=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-Xfg-wEWXNqqUwLGiSg06uA-1; Mon, 29 Jan 2024 12:56:29 -0500
X-MC-Unique: Xfg-wEWXNqqUwLGiSg06uA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-5ff7eabfd94so47734597b3.3
 for <qemu-arm@nongnu.org>; Mon, 29 Jan 2024 09:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706550988; x=1707155788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BwaOH5m5Z9rNRJ9ff4k7uVU79wAUgcNfRycVnyZgfHQ=;
 b=sKzPKpwM+zyUFHKnqwfIbONYC56kFxc/Ri8bayiRRJw4WkVxlRLGZtX4ozQ7bvVexh
 Md6+0YhZP6t+sblOCihJA2f3uaPdJFAJgnOQF/d8QnpPTB0qpQ1//ELdKuT/nT1PWvPe
 Szkz/mGv4xunRkOHz2+LuPmWySDvApSbmalxj0KprQTEVyK3x6w1fo2B4lHTlpiXTMiK
 +ziN89QJZX+EVQwwRS5QLjeXwq8afpiNDvz+9krLIFjf3eHA/ZFwafFc54Z5SEmELT6/
 5aZ15xrNrTH4hIi3KrLVD2mjTS79qgfCP2vydQ9zdIy2pfijW7coby6XFXOccb7QrTw0
 eaIQ==
X-Gm-Message-State: AOJu0Ywah1IHsSZ+TW75opxH32t6HwkryjSSpZuUCtBt2kZZQx0vxxJ8
 FRr3ZZPvEE5oG3Zgm+u6i5UkFdoB/dOvKF36p43a+aqhb5Uhr8zJWO3JiII4guDJwVXlLU7j9dv
 UeHwTSExHstPEtq+RG80d/kuvcpY9Or7gFEB0U2U46RwnuMPGgQ==
X-Received: by 2002:a0d:d455:0:b0:5ff:7f44:5d94 with SMTP id
 w82-20020a0dd455000000b005ff7f445d94mr4067556ywd.80.1706550988692; 
 Mon, 29 Jan 2024 09:56:28 -0800 (PST)
X-Received: by 2002:a0d:d455:0:b0:5ff:7f44:5d94 with SMTP id
 w82-20020a0dd455000000b005ff7f445d94mr4067546ywd.80.1706550988403; 
 Mon, 29 Jan 2024 09:56:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 g23-20020ac84b77000000b0042a3358bf59sm1682108qts.79.2024.01.29.09.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 09:56:27 -0800 (PST)
Message-ID: <0555234a-66c8-44d9-898e-fe0c88086954@redhat.com>
Date: Mon, 29 Jan 2024 18:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] VIRTIO-IOMMU: Introduce an aw-bits option
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, peterx@redhat.com, yanghliu@redhat.com,
 mst@redhat.com, clg@redhat.com, jasowang@redhat.com
References: <20240123181753.413961-1-eric.auger@redhat.com>
 <20240129122332.GA909471@myrica>
 <670991f9-e483-4acb-9ae9-6bad47b962b1@redhat.com>
 <20240129174250.GA1306334@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240129174250.GA1306334@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.29,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 17Kdabsxzsga

Hi Jean,

On 1/29/24 18:42, Jean-Philippe Brucker wrote:
> On Mon, Jan 29, 2024 at 03:07:41PM +0100, Eric Auger wrote:
>> Hi Jean-Philippe,
>>
>> On 1/29/24 13:23, Jean-Philippe Brucker wrote:
>>> Hi Eric,
>>>
>>> On Tue, Jan 23, 2024 at 07:15:54PM +0100, Eric Auger wrote:
>>>> In [1] and [2] we attempted to fix a case where a VFIO-PCI device
>>>> protected with a virtio-iommu is assigned to an x86 guest. On x86
>>>> the physical IOMMU may have an address width (gaw) of 39 or 48 bits
>>>> whereas the virtio-iommu exposes a 64b input address space by default.
>>>> Hence the guest may try to use the full 64b space and DMA MAP
>>>> failures may be encountered. To work around this issue we endeavoured
>>>> to pass usable host IOVA regions (excluding the out of range space) from
>>>> VFIO to the virtio-iommu device so that the virtio-iommu driver can
>>>> query those latter during the probe request and let the guest iommu
>>>> kernel subsystem carve them out.
>>>>
>>>> However if there are several devices in the same iommu group,
>>>> only the reserved regions of the first one are taken into
>>>> account by the iommu subsystem of the guest. This generally
>>>> works on baremetal because devices are not going to
>>>> expose different reserved regions. However in our case, this
>>>> may prevent from taking into account the host iommu geometry.
>>>>
>>>> So the simplest solution to this problem looks to introduce an
>>>> input address width option, aw-bits, which matches what is
>>>> done on the intel-iommu. By default, from now on it is set
>>>> to 39 bits with pc_q35 and 64b with arm virt.
>>> Doesn't Arm have the same problem?  The TTB0 page tables limit what can be
>>> mapped to 48-bit, or 52-bit when SMMU_IDR5.VAX==1 and granule is 64kB.
>>> A Linux host driver could configure smaller VA sizes:
>>> * SMMUv2 limits the VA to SMMU_IDR2.UBS (upstream bus size) which
>>>   can go as low as 32-bit (I'm assuming we don't care about 32-bit hosts).
>> Yes I think we can ignore that use case.
>>> * SMMUv3 currently limits the VA to CONFIG_ARM64_VA_BITS, which
>>>   could be as low as 36 bits (but realistically 39, since 36 depends on
>>>   16kB pages and CONFIG_EXPERT).
>> Further reading "3.4.1 Input address size and Virtual Address size" ooks
>> indeed SMMU_IDR5.VAX gives info on the physical SMMU actual
>> implementation max (which matches intel iommu gaw). I missed that. Now I
>> am confused about should we limit VAS to 39 to accomodate of the worst
>> case host SW configuration or shall we use 48 instead?
> I don't know what's best either. 48 should be fine if hosts normally
> enable VA_BITS_48 (I see debian has it [1], not sure how to find the
> others).
>
> [1] https://salsa.debian.org/kernel-team/linux/-/blob/master/debian/config/arm64/config?ref_type=heads#L18
>
>> If we set such a low 39b value, won't it prevent some guests from
>> properly working?
> It's not that low, since it gives each endpoint a private 512GB address
> space, but yes there might be special cases that reach the limit. Maybe
> assign a multi-queue NIC to a 256-vCPU guest, and if you want per-vCPU DMA
> pools, then with a 39-bit address space you only get 2GB per vCPU. With
> 48-bit you get 1TB which should be plenty.
>
> 52-bit private IOVA space doesn't seem useful, I doubt we'll ever need to
> support that on the MAP/UNMAP interface.
>
> So I guess 48-bit can be the default, and users with special setups can
> override aw-bits.

Yes it looks safe also on my side. I will respin with 48b default then.

Thank you!

Eric
>
> Thanks,
> Jean
>

