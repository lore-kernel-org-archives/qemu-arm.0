Received: by 10.223.172.38 with SMTP id v35csp804521wrc;
        Fri, 15 Sep 2017 07:51:17 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDFVBbdgJ5S3jZdfJtsxGYP7PmVRuhOjPb+MuIUw5IiTGLpFTmUuf1APm/0YrXunUwoAhfJ
X-Received: by 10.55.113.67 with SMTP id m64mr5056435qkc.51.1505487077224;
        Fri, 15 Sep 2017 07:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505487077; cv=none;
        d=google.com; s=arc-20160816;
        b=bqmiSlpiIIM/kLzQaWJna4T4U9yoZbxOlIzAE9sAJpqATYYI1wMNaRWgRDLDxOGXXr
         JauNrKyoFg3nkbBQmsn705bX3SCBmhNgOFwy4Z3yT5wB9U1fLpmYYXq1W0dkFQK5y3A+
         rRlE2uKzfQZj4FaihqcOLlM/VpmdvkUK7ntMdfUmKwAWtdv7Z5e8/pRcM38TBaYTaUKF
         S27ywVqreNVcdl4iGQJ00SDhhxdfvZpJkE1VKOfSw/nNX9B74RoLBgyuz6SJyeCuxhal
         Qt3kl5JKLVTwFupJdct517hK0oPIOznZNZFvil7BYTqVgPlUd9v7sfr9mMpM1sPL5hSI
         3agw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=q+5OZX4jSRAdxE2xmsVEzE9VZ05UirrFs97J7tuyqMA=;
        b=z5MkLHw4APf6402N5BshmpBirTMBfkVewQJk/+CfM/J3FWKgJHDSpulbasj5KmftBg
         7OIQWpmriGQf5P6tyo/hjht+1UXJKEVp7xqbaHLFoP+2ZJ3OTmnVS3G0dHZaoGtbuUZZ
         NK4m7Nszft3oUtoDtRj4XdJdsYlVFXwZhEH0r+z9sytSNW732WPWL9po7WbwJPVHuvzY
         e6V3Mqu/1eNonJZdu0QkWspk9tbKyTlKWqigs6n0r3jajjLUrirw2XRp2d+ByXUpAZhj
         vWOXt0hHl/LHYGefLcNxtFbFShsoSdk5H0sgTED4k+BiKUPxQElydKh9JyG6XpiXM/JW
         Q9NA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w36si1108343qtd.392.2017.09.15.07.51.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Sep 2017 07:51:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsrxb-0003Mp-14
	for alex.bennee@linaro.org; Fri, 15 Sep 2017 10:51:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dsrxU-0003LU-3g
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 10:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dsrxR-0002kN-0p
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 10:51:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dsrxQ-0002k2-Np; Fri, 15 Sep 2017 10:51:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38D5961472;
	Fri, 15 Sep 2017 14:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 38D5961472
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F0D571C95;
	Fri, 15 Sep 2017 14:50:49 +0000 (UTC)
To: tn <Tomasz.Nowicki@caviumnetworks.com>,
	Tomasz Nowicki <tnowicki@caviumnetworks.com>,
	Linu Cherian <linuc.decode@gmail.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-14-git-send-email-eric.auger@redhat.com>
	<20170914092751.GA3336@virtx40>
	<4dbbccae-64e1-f4ac-4dcc-3abd9766f324@caviumnetworks.com>
	<795d99ba-e492-04ce-dda4-709682baf6cd@caviumnetworks.com>
	<4f9fc697-9e6c-5dd7-65c7-92326135aa56@redhat.com>
	<MWHPR0701MB3660656E62CF668F057621A7F36C0@MWHPR0701MB3660.namprd07.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <64e946b3-8fb6-b918-e389-1a01c084fb47@redhat.com>
Date: Fri, 15 Sep 2017 16:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <MWHPR0701MB3660656E62CF668F057621A7F36C0@MWHPR0701MB3660.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 15 Sep 2017 14:51:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 13/20] hw/arm/smmuv3: Implement IOMMU
 memory region replay callback
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	bharat.bhushan@nxp.com, mst@redhat.com, will.deacon@arm.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	christoffer.dall@linaro.org, linu.cherian@cavium.com,
	wtownsen@redhat.com, robin.murphy@arm.com,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gmYIELyty8YB

Hi,

On 15/09/2017 12:42, tn wrote:
> Hi Eric,
> 
> On 15.09.2017 09:30, Auger Eric wrote:
>> Hi Tomasz,
>>
>> On 14/09/2017 16:43, Tomasz Nowicki wrote:
>>> On 14.09.2017 16:31, Tomasz Nowicki wrote:
>>>> Hi Eric,
>>>>
>>>> On 14.09.2017 11:27, Linu Cherian wrote:
>>>>> Hi Eric,
>>>>>
>>>>> On Fri Sep 01, 2017 at 07:21:16PM +0200, Eric Auger wrote:
>>>>>> memory_region_iommu_replay() is used for VFIO integration.
>>>>>>
>>>>>> However its default implementation is not adapted to SMMUv3
>>>>>> IOMMU memory region. Indeed the input address range is too
>>>>>> huge and its execution is too slow as it calls the translate()
>>>>>> callback on each granule.
>>>>>>
>>>>>> Let's implement the replay callback which hierarchically walk
>>>>>> over the page table structure and notify only the segments
>>>>>> that are populated with valid entries.
>>>>>>
>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>> ---
>>>>>>    hw/arm/smmuv3.c     | 36 ++++++++++++++++++++++++++++++++++++
>>>>>>    hw/arm/trace-events |  1 +
>>>>>>    2 files changed, 37 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>>>>> index 8e7d10d..c43bd93 100644
>>>>>> --- a/hw/arm/smmuv3.c
>>>>>> +++ b/hw/arm/smmuv3.c
>>>>>> @@ -657,6 +657,41 @@ static int smmuv3_notify_entry(IOMMUTLBEntry
>>>>>> *entry, void *private)
>>>>>>        return 0;
>>>>>>    }
>>>>>> +/* Unmap the whole notifier's range */
>>>>>> +static void smmuv3_unmap_notifier_range(IOMMUNotifier *n)
>>>>>> +{
>>>>>> +    IOMMUTLBEntry entry;
>>>>>> +    hwaddr size = n->end - n->start + 1;
>>>>>> +
>>>>>> +    entry.target_as = &address_space_memory;
>>>>>> +    entry.iova = n->start & ~(size - 1);
>>>>>> +    entry.perm = IOMMU_NONE;
>>>>>> +    entry.addr_mask = size - 1;
>>>>>> +
>>>>>> +    memory_region_notify_one(n, &entry);
>>>>>> +}
>>>>>> +
>>>>>> +static void smmuv3_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
>>>>>> +{
>>>>>> +    SMMUTransCfg cfg = {};
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    trace_smmuv3_replay(mr->parent_obj.name, n, n->start, n->end);
>>>>>> +    smmuv3_unmap_notifier_range(n);
>>>>>> +
>>>>>> +    ret = smmuv3_decode_config(mr, &cfg);
>>>>>> +    if (ret) {
>>>>>> +        error_report("%s error decoding the configuration for iommu
>>>>>> mr=%s",
>>>>>> +                     __func__, mr->parent_obj.name);
>>>>>> +    }
>>>>>>
>>>>>
>>>>> On an invalid config being found, shouldnt we return rather than
>>>>> proceeding with
>>>>> page table walk. For example on an invalid Stream table entry.
>>>>
>>>> Indeed, without return here vhost case is not working for me.
>>>
>>> I was just lucky one time. return here has no influence. Vhost still not
>>> working. Sorry for noise.
>>
>> As far as I understand the replay() callback only is called in VFIO use
>> case. So this shouldn't impact vhost.
>>
>> I can't reproduce your vhost issue on my side. I will review the
>> invalidate code again and compare against the last version.
>>
>> What is the page size used by your guest?
> 
> 64K page size for guest as well as for host.
> 
> However, I've just checked 4K page size for guest and then vhost is
> working fine.
So the bug stems from the incorrect target page size used on
SMMU_CMD_TLBI_NH_VA invalidation. This is now corrected by using the
actual config granule size and this fixes the issue with vhost use case
and 64KB page guest. I will release this fix early next week. Sorry for
the inconvenience.

Thanks

Eric
> 
> Thanks,
> Tomasz
