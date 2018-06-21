Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1674508wrq;
        Thu, 21 Jun 2018 00:50:07 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJms0SQY/c6N/fuvsDYpuyG1M9HlBjWewV2nqi3NpDnwYNLLBM1oeOxOdRD3EcLMsWlKjG2
X-Received: by 2002:aed:3aa4:: with SMTP id o33-v6mr22120406qte.19.1529567407191;
        Thu, 21 Jun 2018 00:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529567407; cv=none;
        d=google.com; s=arc-20160816;
        b=BNrhyNpV8dj6YO6hUXjnY3iz+xF3rT7rCFZqV28YH128zXOLikQz1cZ+uoafN+Px1I
         ZQwygna1MvpRGnNuhLTQwzNJdWaiKQnTd8TFcGBQ23RSAPp7l4qbSPayIvW1ASzlVl9R
         kB7dycRTRiW2wCwvSMCk4joMJlvrYyew/sUyS06zac9uy6YoOPOqI4nJzfCLb8CI4iOb
         bUOLHnjlomJ1MEXCD8TZa0lnNJmYOHfPhoAr6vh3ySJWwZie/QS5x9jyRCtPdxQIePB/
         HJjxenBkmKthbe3wbzJPAxL012kyL/MEbqtxXeJy5D33tUzNl3aa/uiGE0qpnN2FCDVS
         rdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=q2YFCGJhRoiADKWlcCkqLM+bMNDQmWB4TbEUhQo6G5I=;
        b=DWCE4i5WbYYO25K8jBmMjchrwvLADZLyJhtlJwgw/RII4YU9wf3/tS1Cj04pU669qr
         zIX7UtrVHDFlRmXmQ9mH1zlZycgmA7C705Fs+KvZ3Lv0jqf//OicbVcQMYIhXrry+mTx
         L2wRCoWoP4tc/LoCNcoHaepMVRUbSkt52OWqPBHqmEV/2GapIJiU1Da217EhDge7nkWH
         Aeg8wtLeMhTWaIvrytDK3dOGDoPlBShC+TJj4ik/nC91WM/FSMRIUDNlJo1DVX3rx0zf
         QJbEcUMi4Nnck/mL3frdWMUoWukMAWCUOB8Q7qTrNi6WMgVs+AMcuVaKQXqTlPdKrYea
         WgKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k8-v6si3192822qvm.265.2018.06.21.00.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 00:50:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVuM2-0001w5-Jm
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 03:50:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVuLv-0001vu-Qo
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 03:50:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVuLr-0000aQ-1p
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 03:49:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39326 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVuLq-0000aB-SC; Thu, 21 Jun 2018 03:49:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9333580D2EA7;
	Thu, 21 Jun 2018 07:49:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 433C72156880;
	Thu, 21 Jun 2018 07:49:52 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1528790908-23441-1-git-send-email-eric.auger@redhat.com>
	<1528790908-23441-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-EpZ6uzLmjr_1w9nno6C5-tyvqU9MfWR8XZwup4hKKDA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <240510c9-875f-d768-fb14-70835a363c5f@redhat.com>
Date: Thu, 21 Jun 2018 09:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-EpZ6uzLmjr_1w9nno6C5-tyvqU9MfWR8XZwup4hKKDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 21 Jun 2018 07:49:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 21 Jun 2018 07:49:53 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 3/4] hw/arm/smmuv3: IOTLB emulation
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
Cc: jia.he@hxt-semitech.com, Jia He <hejianet@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Feb2hZk05Ipq

Hi Peter,

On 06/20/2018 06:07 PM, Peter Maydell wrote:
> On 12 June 2018 at 09:08, Eric Auger <eric.auger@redhat.com> wrote:
>> We emulate a TLB cache of size SMMU_IOTLB_MAX_SIZE=256.
>> It is implemented as a hash table whose key is a combination
>> of the 16b asid and 48b IOVA (Jenkins hash).
>>
>> Entries are invalidated on TLB invalidation commands, either
>> globally, or per asid, or per asid/iova.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - add comment about Jenkins Hash
>> - remove init of iotlb_hits, misses
>>
>> v1:
>> - Add new trace point when smmu is bypassed
>> - s/iotlb_miss/iotlb_misses, s/iotlb_hit/iotlb_hits
>> - use SMMUIOTLBKey as a key
>>
>> Credit to Tomasz Nowicki who did the first implementation of
>> this IOTLB implementation, inspired of intel_iommu implementation.
>> ---
>>  hw/arm/smmu-common.c         | 60 +++++++++++++++++++++++++++
>>  hw/arm/smmuv3.c              | 98 ++++++++++++++++++++++++++++++++++++++++++--
>>  hw/arm/trace-events          |  9 ++++
>>  include/hw/arm/smmu-common.h | 13 ++++++
>>  4 files changed, 176 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 264e096..16cd33a 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -24,11 +24,43 @@
>>  #include "qom/cpu.h"
>>  #include "hw/qdev-properties.h"
>>  #include "qapi/error.h"
>> +#include "qemu/jhash.h"
>>
>>  #include "qemu/error-report.h"
>>  #include "hw/arm/smmu-common.h"
>>  #include "smmu-internal.h"
>>
>> +/* IOTLB Management */
>> +
>> +inline void smmu_iotlb_inv_all(SMMUState *s)
>> +{
>> +    trace_smmu_iotlb_inv_all();
>> +    g_hash_table_remove_all(s->iotlb);
>> +}
>> +
>> +static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
>> +                                         gpointer user_data)
>> +{
>> +    uint16_t asid = *(uint16_t *)user_data;
>> +    SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
>> +
>> +    return iotlb_key->asid == asid;
>> +}
>> +
>> +inline void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova)
>> +{
>> +    SMMUIOTLBKey key = {.asid = asid, .iova = iova};
>> +
>> +    trace_smmu_iotlb_inv_iova(asid, iova);
>> +    g_hash_table_remove(s->iotlb, &key);
>> +}
>> +
>> +inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
>> +{
>> +    trace_smmu_iotlb_inv_asid(asid);
>> +    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
>> +}
>> +
>>  /* VMSAv8-64 Translation */
>>
>>  /**
>> @@ -328,6 +360,31 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
>>      return NULL;
>>  }
>>
>> +static guint smmu_iotlb_key_hash(gconstpointer v)
>> +{
>> +    SMMUIOTLBKey *key = (SMMUIOTLBKey *)v;
>> +    uint32_t a, b, c;
>> +
>> +    /* Henkins hash */
> 
> "Jenkins"
> 
>> +    a = b = c = JHASH_INITVAL + sizeof(*key);
> 
> Why do we add the sizeof(SMMUIOTLBKey) here ?
To be honest I did something similar to net/colo.c, connection_key_hash().

in
https://stackoverflow.com/questions/3279615/python-implementation-of-jenkins-hash

I can also find

def hashlittle2(data, initval = 0, initval2 = 0):
    length = lenpos = len(data)

    a = b = c = (0xdeadbeef + (length) + initval)
../..


> 
>> +    a += key->asid;
>> +    b += extract64(key->iova, 0, 32);
>> +    c += extract64(key->iova, 32, 32);
>> +
>> +    __jhash_mix(a, b, c);
>> +    __jhash_final(a, b, c);
>> +
>> +    return c;
>> +}
> 
> 
>> +static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
>> +{
>> +    SMMUIOTLBKey *k1 = (SMMUIOTLBKey *)v1;
>> +    SMMUIOTLBKey *k2 = (SMMUIOTLBKey *)v2;
> 
> These should have a 'const', at which point I think you'll
> find that you don't need the explicit casts.
indeed

Thanks

Eric
> 
> Otherwise looks OK I think.
> 
> thanks
> -- PMM
> 
