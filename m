Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp4962njc;
        Thu, 20 Mar 2025 17:55:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVH/Qu/AoFJ6Xzhja0INdH12hR0k/Zh7lVm8wbC+IgtaozE4lMyBYDNKsIAq/i4GWJUrZgHcXSgAIjoUA==@linaro.org
X-Google-Smtp-Source: AGHT+IFdCUSVUlirp9H8CJVjON4MHK2chlnmW/0S8IIHVkDmUZufPtxYe7Omu2JB31dr1M/ZVpJu
X-Received: by 2002:a05:620a:2845:b0:7c5:a230:30ff with SMTP id af79cd13be357-7c5ba1fd060mr225959485a.47.1742518527892;
        Thu, 20 Mar 2025 17:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742518527; cv=none;
        d=google.com; s=arc-20240605;
        b=d+oSKi7mO2/3zx/amJ8efEmO7lNQmIrR+XtUQ/juoo1V+MoMvTTh3GbHsyYVPUrURf
         of7pbLpXZfIxvhoy3ff6kzdU2Hxtpee0mFC6R2UqNv4rVbiVVlXfyFGYFWrRk6oM7vbn
         RbFO3U7MP1Nd3uG5QfBSLmjr/5DsEjdjXqVVI+uD1BX6fQ4KF/nZW9M9se9UiT54j8DC
         M67Y6JwZTosNaQ5QzjIEEhMezNRweYoUYjtpKs12IFLhMpJFIgvnQaAbp84X9V50ELY3
         /b8pznetMCV72mD3hbcRYB5PWmDoqw+XiMQ4YCN74ykjpZY+hc7Jqg6LCPRiYNsFfVDZ
         SnjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=O5y0wlXMt9o+MiCERHXtqeoHrLHN6OuuVFf0gqNCpnU=;
        fh=a6k0CRUSFdX7LMlhMu+hXWpcoKSgvtV5pZH3VqJpUf0=;
        b=QJd/o/eync78NdSuAWFXn3gIJl/1OluWlt/ykNLliUcsElg3vKvecL1KZQfC4KAe3W
         Rm3ZCMaPSHhGWRnXkHsZeS3AOPGYijUO6T/VR5YaoY7NIuTJqo+cPjZcCZS+7CpgsouG
         rC+4hlryjJAnAZY25+ZgKkQqzLA38i1fTnMXYkfeutLY5AzXtG8iDSwRzfLOnClSb9uG
         NqPSVsNXwgtXUz5PB646tPWc+6Dv9+gTx3f4gXfCqFlKC76gfW/tkrhbB+WuKEKcA+an
         vijJVoEOzw1mexL8n5wspVjxDkbGXr4Ef6WfX+DqGng7YJcihYYrA/sNvQksICaxJOrP
         FwYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3IG5l9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9381608si87867385a.604.2025.03.20.17.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 17:55:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3IG5l9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvQfK-00066y-MN; Thu, 20 Mar 2025 20:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tvQfI-00064a-Gz
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 20:55:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tvQfG-0004yy-Jj
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 20:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742518509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5y0wlXMt9o+MiCERHXtqeoHrLHN6OuuVFf0gqNCpnU=;
 b=a3IG5l9t0V6LXQYH7bxbPmE+XkB9PXrlmZmns3O4IRJXO/wiO3AnJ0ARWHB1ExsnXeuHd2
 maeVS9GJMaMF068CmzpMrppMnLTXNc+KC9VHr7GkFcHKM56xBZdHGK5jSB0lm4ZC6lwpmT
 rLUSHLo71Pq9WNa67jBxX2ACkW+0iHg=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-8dS8OQSNOSOcJvvLHgqI8Q-1; Thu, 20 Mar 2025 20:55:07 -0400
X-MC-Unique: 8dS8OQSNOSOcJvvLHgqI8Q-1
X-Mimecast-MFC-AGG-ID: 8dS8OQSNOSOcJvvLHgqI8Q_1742518506
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3d453d367a0so29066715ab.3
 for <qemu-arm@nongnu.org>; Thu, 20 Mar 2025 17:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742518506; x=1743123306;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O5y0wlXMt9o+MiCERHXtqeoHrLHN6OuuVFf0gqNCpnU=;
 b=Kj22AAIHq1oxAO/2/WQTOT3NIi9EfTStp1Q89Le87jAg+okwOGbez3n2utMKCJIAwV
 z7VHnAeUU5tvWZZGddEMcDyeve09uv/P5Uarep92+iL1AusRMYLIr0uvg9e7vhHjotAl
 3LUk1XsXvdFDHaEu9bMWDOrduzavEaI75BzALxRCMOqZ2MA/RvSMzIkBGtxYs/vu4fOk
 vp2u3xTgHAJv2zqxzFPIMI33UkIL4ypIyb5n9mGyyK2MWhL7GGrYbdq5ksy2KbZLMeR9
 toQVuV9Okoz8iiuwmqTSjSAMPsx7mNrxM5oAXl5exMKKhY84psRP0aEWCAx4ZZP7oaEp
 6mvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyXMjT7djwznjnsqrJsS/nIU7mSiWQAKPnOMm4qCknSFNdB6K4qwPfZp77+TW9QRVskGX97+Nobg==@nongnu.org
X-Gm-Message-State: AOJu0YwNrZ2cAyqxqpEjGu41U5ePsFcQkii50AJKH3mWIcCSHpIufA1Z
 lvCYhZ/YvSDihsKEFeAKg/zZ5aFFQUg6Q9u4qQOJARHb6Y+JgGYDpbqW12MWB1qx6K7AxY6z2ft
 /W038jAIsJV4nROYlE2v2GvpEjyqU+xuhEQI5d/ScKi/hKbJFyg==
X-Gm-Gg: ASbGnctYtNLzSHaSFm/azYuFqZaI32EpwgE7O8Q1Ex1Q2Oi83YwZ+MXhbdNNZNmv7ZH
 P/nztvowQcpCSVFp07swZb64Ai7SaTMeYjgMNHpJiUyHpr/Rxvmy2yHFAXy6wvk7SiMaL2jk4td
 jkhMeFEE8nftIQUFVOmSeY3E0JYnPPk8PkrpiVCZ2RGO9MapQ2nIfWufaqa0EM//FsuZBYDlPTR
 lyrzsJUuYjGYl880mszlOJ1Ib23dTFqsAvB3cgASnLdDM8mvTLOWI8okH5mo21xr0yxf78xZqeJ
 YRrXb9nYPloiCj5q
X-Received: by 2002:a05:6e02:b28:b0:3d4:3db1:77ae with SMTP id
 e9e14a558f8ab-3d59617c61emr20675085ab.18.1742518506622; 
 Thu, 20 Mar 2025 17:55:06 -0700 (PDT)
X-Received: by 2002:a05:6e02:b28:b0:3d4:3db1:77ae with SMTP id
 e9e14a558f8ab-3d59617c61emr20674865ab.18.1742518506314; 
 Thu, 20 Mar 2025 17:55:06 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d59607ea1esm1954825ab.19.2025.03.20.17.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 17:55:05 -0700 (PDT)
Message-ID: <1aa26060-d227-4b4a-9397-454ef33e7355@redhat.com>
Date: Thu, 20 Mar 2025 20:55:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: eric.auger@redhat.com, Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
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
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <27aee7f3-5316-40b7-bd7e-dc68a7a1d0d2@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u8PuCgkemvKBIjkLBRNEv74py9NazN9bIuUo6Im0FsU_1742518506
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: l11inXlpnHrp



On 3/19/25 1:00 PM, Eric Auger wrote:
> Hi,
> 
> 
> On 3/19/25 1:23 AM, Jason Gunthorpe wrote:
>> On Tue, Mar 18, 2025 at 05:22:51PM -0400, Donald Dutile wrote:
>>
>>> I agree with Eric that 'accel' isn't needed -- this should be
>>> ascertained from the pSMMU that a physical device is attached to.
>> I seem to remember the point was made that we don't actually know if
>> accel is possible, or desired, especially in the case of hotplug.
> that's why I think it would be better if we could instantiate a single
> type of device that can do both accel and non accel mode.
> Maybe that would be at the price of always enforcing MSI resv regions on
> guest to assure MSI nesting is possible.
> 
>>
>> The accelerated mode has a number of limitations that the software
>> mode does not have. I think it does make sense that the user would
>> deliberately choose to use a more restrictive operating mode and then
>> would have to meet the requirements - eg by creating the required
>> number and configuration of vSMMUs.
> To avoid any misunderstanding I am not pushing for have a single vSMMU
> instance. I advocate for having several instances, each somehow
> specialized for VFIO devices or emulated devices. Maybe we can opt-in
> with accel=on but the default could be auto (the property can be
> AUTO_ON_OFF) where the code detects if a VFIO device is translated.In
> case incompatible devices are translated into a same vSMMU instance I
> guess it could be detected and will fail.
> 
> What I am pusshing for is to have a single type of QEMU device which can
> do both accel and non accel.
+1 !

>> In general I advocate for having several vSMMU instances, each of them
>>
>>> Now... how does vfio(?; why not qemu?) layer determine that? --
>>> where are SMMUv3 'accel' features exposed either: a) in the device
>>> struct (for the smmuv3) or (b) somewhere under sysfs? ... I couldn't
>>> find anything under either on my g-h system, but would appreciate a
>>> ptr if there is.
>> I think it is not discoverable yet other thatn through
>> try-and-fail. Discoverability would probably be some bits in an
>> iommufd GET_INFO ioctl or something like that.
> yeah but at least we can easily detect if a VFIO device is beeing
> translated by a vSMMU instance in which case there is no other choice to
> turn accel on.
> 
> Thanks
> 
> Eric
>>
>>> and like Eric, although 'accel' is better than the
>>> original 'nested', it's non-obvious what accel feature(s) are being
>>> turned on, or not.
>> There are really only one accel feature - direct HW usage of the IO
>> Page table in the guest (no shadowing).
>>
>> A secondary addon would be direct HW usage of an invalidation queue in
>> the guest.
>>
>>> kernel boot-param will be needed; if in sysfs, a write to 0 an
>>> enable(disable) it maybe an alternative as well.  Bottom line: we
>>> need a way to (a) ascertain the accel feature (b) a way to disable
>>> it when it is broken, so qemu's smmuv3 spec will 'just work'.
>> You'd turned it off by not asking qemu to use it, that is sort of the
>> reasoning behind the command line opt in for accel or not.
>>
>> Jason
>>
> 

