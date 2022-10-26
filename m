Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp423359ejn;
        Wed, 26 Oct 2022 03:44:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6P2Ej5numJ73/N+uKfLEEC+qtuL0Mo/l+nAnDixr7dp6fP1O+BLJ7JoLZimo1KycP1L/gk
X-Received: by 2002:a05:6214:627:b0:4bb:8373:5a46 with SMTP id a7-20020a056214062700b004bb83735a46mr9409367qvx.109.1666781043131;
        Wed, 26 Oct 2022 03:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666781043; cv=none;
        d=google.com; s=arc-20160816;
        b=teEgGEgSaS05RFqg+BCnpjA9HVeU0b5Ib8vJl16Ul7eoqByTcQwJLXC+4BzDHXIOc7
         qOKTqaa5Ti3vcEYfpiaomToLuCRfUooFuxnuvDIrUo+YQofwX8oRaSwHS7KPNNBnvago
         hq7ESomPckX8SnwRGbIm2HHip0Ss7TIyrlrSxsrk4FN471VMBxHzBYKjqmVI1+686GBi
         YCkpyFUcoWMsKk1H9EqCykda4yHEsGw/QGOeH8OBOcReKAGJcWjT9Ndkjux2I3DZnwxN
         N0FHDWJW92xveBhVuAEN8BEsfU+NKu0qLsCK4LLPXwS1nZST8BiPjbZNnYz1+WPhVXD2
         SAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=9k+8cBp1fQl2hHOg7uTHp11xM0wx0S9pwXlPKgCUs9o=;
        b=sr+tnVUxqIvF4jdlNgjb44FPqs7eUVNxerzsmeU70WvynGG5hhTVfeehaQrWtM5Qxc
         /FyE4XNeB0KGbuq/50sjPsbhSVlHd89fRw1a5p676VWlpAxGQoqaJmIcSLUpJyBl5MtB
         VdDtA3VFSQyhFaG+300qApwgPAh/uJSXZ7adRuPSbGAC5oNtU0BeVMQFa9tEGduIrOiD
         2qgBiGj37u5q8XvZ7VAngkIK9/eK09w6wQr9j6vLel+52AzICKj+HXVQZhf7TgHTwrpJ
         fo29jVsafSgr7cpp/fKQnc+dFP77+xUX678MK9XGlsw0UZpGwGaGVjmMOeuGAbRVJqib
         8PxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Q6YRwb/a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a125-20020a37b183000000b006f937cf64d3si613438qkf.420.2022.10.26.03.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 03:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Q6YRwb/a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ondsd-0005cb-Io; Wed, 26 Oct 2022 06:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ondsc-0005S1-KI
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 06:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ondsZ-0001lT-C1
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 06:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666781001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9k+8cBp1fQl2hHOg7uTHp11xM0wx0S9pwXlPKgCUs9o=;
 b=Q6YRwb/afoo8AX+QUN4RfMz/r6i8HWWajK+xEE+t3yaO2yPrJMHfI131R/8m2jYSpStlfu
 Jpl221L1TiD2N4z2mOUroISi9vBqS2u0cv6xa/pOcm8sXXYqurt3EXwS1yccASwhbtjbYf
 /8wBNHGZ+GZgLB6umN/QkIy5+sx4PU4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-yfsVrXbxMgiRfmIpwPhJ9Q-1; Wed, 26 Oct 2022 06:43:17 -0400
X-MC-Unique: yfsVrXbxMgiRfmIpwPhJ9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48739811E84;
 Wed, 26 Oct 2022 10:43:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBC3E1415117;
 Wed, 26 Oct 2022 10:43:16 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, zhenyzha@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
Subject: Re: [PATCH v6 5/7] hw/arm/virt: Improve high memory region address
 assignment
In-Reply-To: <581dc823-1b6c-3a24-3532-af0938c3dec2@redhat.com>
Organization: Red Hat GmbH
References: <20221024035416.34068-1-gshan@redhat.com>
 <20221024035416.34068-6-gshan@redhat.com>
 <42375c62-c9d4-3276-2ce6-04ee0c9222f7@redhat.com>
 <581dc823-1b6c-3a24-3532-af0938c3dec2@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 26 Oct 2022 12:43:15 +0200
Message-ID: <87tu3qsw58.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MD/zWl0wV2ji

On Wed, Oct 26 2022, Gavin Shan <gshan@redhat.com> wrote:

> Hi Eric,
>
> On 10/26/22 12:29 AM, Eric Auger wrote:
>> On 10/24/22 05:54, Gavin Shan wrote:
>>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>>> are floating on highest RAM address. However, they can be disabled
>>> in several cases.
>>>
>>> (1) One specific high memory region is likely to be disabled by
>>>      code by toggling vms->highmem_{redists, ecam, mmio}.
>>>
>>> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>>>      'virt-2.12' or ealier than it.
>>>
>>> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>>>      on 32-bits system.
>>>
>>> (4) One specific high memory region is disabled when it breaks the
>>>      PA space limit.
>>>
>>> The current implementation of virt_set_{memmap, high_memmap}() isn't
>>> optimized because the high memory region's PA space is always reserved,
>>> regardless of whatever the actual state in the corresponding
>>> vms->highmem_{redists, ecam, mmio} flag. In the code, 'base' and
>>> 'vms->highest_gpa' are always increased for case (1), (2) and (3).
>>> It's unnecessary since the assigned PA space for the disabled high
>>> memory region won't be used afterwards.
>>>
>>> Improve the address assignment for those three high memory region by
>>> skipping the address assignment for one specific high memory region if
>>> it has been disabled in case (1), (2) and (3). The memory layout may
>>> be changed after the improvement is applied, which leads to potential
>>> migration breakage. So 'vms->highmem_compact' is added to control if
>>> the improvement should be applied. For now, 'vms->highmem_compact' is
>>> set to false, meaning that we don't have memory layout change until it
>>> becomes configurable through property 'compact-highmem' in next patch.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>> the code has quite changed since Connie's R-b
>
> Right. Connie, could you please check if the changes make sense to you
> and I can regain your R-B? :)

My R-b still holds.

>
>>> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
>>> ---
>>>   hw/arm/virt.c         | 15 ++++++++++-----
>>>   include/hw/arm/virt.h |  1 +
>>>   2 files changed, 11 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index ee98a8a3b6..4896f600b4 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1721,18 +1721,23 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>>>           vms->memmap[i].size = region_size;
>>>   
>>>           /*
>>> -         * Check each device to see if they fit in the PA space,
>>> -         * moving highest_gpa as we go.
>>> +         * Check each device to see if it fits in the PA space,
>>> +         * moving highest_gpa as we go. For compatibility, move
>>> +         * highest_gpa for disabled fitting devices as well, if
>>> +         * the compact layout has been disabled.
>>>            *
>>>            * For each device that doesn't fit, disable it.
>>>            */
>>>           fits = (region_base + region_size) <= BIT_ULL(pa_bits);
>>> -        if (fits) {
>>> -            vms->highest_gpa = region_base + region_size - 1;
>>> +        *region_enabled &= fits;
>>> +        if (vms->highmem_compact && !*region_enabled) {
>>> +            continue;
>>>           }
>>>   
>>> -        *region_enabled &= fits;
>>>           base = region_base + region_size;
>>> +        if (fits) {
>>> +            vms->highest_gpa = region_base + region_size - 1;
>> 
>> vms->highest_gpa = base - 1;
>> 
>
> It's personal taste actually. I was thinking of using 'base - 1', but
> 'region_base + region_size - 1' looks more like a direct way. I don't
> have strong sense though and lets use 'base - 1' in next respin.

I don't really have a preference for one or the other.

