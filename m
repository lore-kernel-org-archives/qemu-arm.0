Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp910063wrs;
        Thu, 22 Aug 2019 08:17:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEc2w5f4SHIKnF+Hz+T8N1KHMPOrDeUarev4aZtNeuGaX6wdhmM6DiDutCQeODGxAM8FFI
X-Received: by 2002:ac8:1b92:: with SMTP id z18mr74674qtj.348.1566487043025;
        Thu, 22 Aug 2019 08:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566487043; cv=none;
        d=google.com; s=arc-20160816;
        b=YQCZB5JGgLLQYXlxt1Pu+6/GSrWb3DfaSqVi+VEq6rBAxOQkyWpJ/hj7D9dvBiH2ad
         PxtK3wtFn6Udi+ExSyGldIa/CEKKkWeFbrJsiY4Rb5nP48lHcr8qSinuSx6GLq/uMzNF
         wucBDCMCf6GLH5AScdbIHNgzbjo19TQGSPCeceffmmXtXRQPzDRxNG89U0dikpgU+8ue
         CAN4Mw3xdS8l9GvGkV3XFoo615RSf0toZ/0YJ1OLW9Pg5i1Y5yjfgVqGjCV0ansIfw0n
         PkGVCkIhqBqqGpwQg3/mkFqsaaFqIeMszZn1botQikqqBcDqj1qQSQaHjFQ/dz3eWJMg
         8OCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=xbBnOfE1eXOBVIX38UCMA2+OfZgOv7y5vC6HMPAQNc0=;
        b=sA4/Rqbnd3Y24iAsKQdAXaM3Yx9/osqB2QpRF6l6Fr10WiyLNOUcW7z/irHGmibjvA
         LvE/CnxNKYERusbygMo0vqUEdjHRl+/T+jip3UrfCO3CfLljE74RmNoOfRonKOZ13YA7
         1CGv2rutV1YdiHDAbQaDCwZns306PvnaHYptwAGDHVfrndPk2wAQ8X6iqsA9xMWW2uA7
         C1BjsB3jxzxIMsAzcNQ0D2mS7u7Gg/y2IUTHVb9/QB2kqtEUgWqvR8N1B2NkCNmWLzxN
         xqSglH+gFNzDCNX7Vytn4noZA128m36RCikpTjeNr/S0MJc9EZS1PbtAXFbjSy2WTNaX
         0mpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b37si16116840qtb.269.2019.08.22.08.17.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 08:17:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0oq1-0006Fp-GZ
	for alex.bennee@linaro.org; Thu, 22 Aug 2019 11:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i0onX-000523-Ar
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 11:14:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i0onT-00069K-Kf
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 11:14:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7981)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i0onS-00066O-77; Thu, 22 Aug 2019 11:14:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF9ED10F23E2;
 Thu, 22 Aug 2019 15:14:40 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F3E660925;
 Thu, 22 Aug 2019 15:14:34 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190711061857.13086-1-eric.auger@redhat.com>
 <20190711061857.13086-4-eric.auger@redhat.com>
 <CAFEAcA_=Rz5f8RvZU7kjKXhM5sHKFDujoMRTuzanrauP3ChPVA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <778a20c0-7e59-7936-80d2-e245a948c00c@redhat.com>
Date: Thu, 22 Aug 2019 17:14:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_=Rz5f8RvZU7kjKXhM5sHKFDujoMRTuzanrauP3ChPVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 22 Aug 2019 15:14:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v3 3/5] hw/vfio/common:
 Assert in case of nested mode
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4SvdPCfcMemE

Hi Peter,
On 8/5/19 4:41 PM, Peter Maydell wrote:
> On Thu, 11 Jul 2019 at 07:19, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> As of today, VFIO only works along with vIOMMU supporting
>> caching mode. The SMMUv3 does not support this mode and
>> requires HW nested paging to work properly with VFIO.
>>
>> So any attempt to run a VFIO device protected by such IOMMU
>> would prevent the assigned device from working and at the
>> moment the guest does not even boot as the default
>> memory_region_iommu_replay() implementation attempts to
>> translate the whole address space and completely stalls
>> the execution.
>>
>> So let's assert if we recognize nested mode case.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/vfio/common.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index a859298fda..d622191fe6 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -604,9 +604,17 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>      if (memory_region_is_iommu(section->mr)) {
>>          VFIOGuestIOMMU *giommu;
>>          IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
>> +        bool nested;
>>          int iommu_idx;
>>
>>          trace_vfio_listener_region_add_iommu(iova, end);
>> +
>> +        if (!memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
>> +                                          (void *)&nested) && nested) {
>> +            error_report("VFIO/vIOMMU integration based on HW nested paging "
>> +                         "is not yet supported");
>> +            abort();
>> +        }
>>          /*
>>           * FIXME: For VFIO iommu types which have KVM acceleration to
>>           * avoid bouncing all map/unmaps through qemu this way, this
> 
> Other failure paths in this function mostly seem to do an
> error_report() and return (apart from the one call to hw_error()
> at the bottom of the function). Is an abort() OK here?

Yes I should rather jump to the fail label instead.

Thanks!

Eric
> 
> thanks
> -- PMM
> 
