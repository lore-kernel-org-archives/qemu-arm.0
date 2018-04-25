Received: by 10.28.4.212 with SMTP id 203csp906519wme;
        Wed, 25 Apr 2018 07:48:34 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpPyJyhgrJP9LlUxJEy3p+fUQSsBjnIq7dMaotOu1cp2hPXsSjRxFYZ1B7lOHGMOzIQDnp0
X-Received: by 10.55.75.205 with SMTP id y196mr30773400qka.44.1524667714825;
        Wed, 25 Apr 2018 07:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524667714; cv=none;
        d=google.com; s=arc-20160816;
        b=zhQ8ZL3YXjVcKM3OVHH878a23zk1lqD1pPtqY8DTk0uQmRisqll2TvSBo/MeQv/TV8
         8KpXpcbi+XUjb38rVWwOVgV5/VZIo2jRFwdDQJjZFnt+JI9RKekOdrulvbZHoZyVFyGf
         0MfxG6bsjd/704yiCbIe0AJQkoShGKc82RtOy9FOrtdBlXigpWF9GAgxKBTw7tCZV2M5
         VUbgmfDhRxvJxqpLTchGQC0rTs6lS+qMZv7wtBJFV2Q6Y3DJd4kz/2LZPQLLb5vipa9g
         gdz4bqtKCLpgKHmzYiTWrew6jWbWHYJc8joRPG4v2ndB5H3C32EGQg/LH4QpMgsX8aXz
         gx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Crpmo/ZBDIDxWV66Gb/JnbpCdEh92SB4VzGyA2bP9Uc=;
        b=RIdQplwXLQI18+xsFEFgO4lTbiLDlW6fxm8iMxAO3w54evVz9zZLL0ilnhsMPvcbMN
         bfDnh/zQF9JQ05Jjkbc5mCQevE7/oQXOXtyiPuKQDZoPNdsroDznQXQ5SL/O3SoUUQoh
         THldj6+QsWzGKlhqdiDI93rPixZjwWGbL+rfAIKYmfmhrw2yKENQgdyjC7pbVuP3WWRk
         HSP/GNLcbW2FoQxrjfj3xdR+ogoYif6R+yWY+1md/iMgbWf75ljUmclJ9OtqIxHMtDj6
         pL+LY5dAxzX+Yy2ljaWXpV0LZ8IZNOkEhep1OePCCOlL5WgaoYCBlT2iOtsW1i+XIX5C
         5Reg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6si15139545qkm.73.2018.04.25.07.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLik-0001OF-A8
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:48:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLeP-0006g7-FP
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:44:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLeO-00038U-Bo
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:44:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56940 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLeK-000353-RM; Wed, 25 Apr 2018 10:44:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47D2C406C744;
	Wed, 25 Apr 2018 14:44:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC2DD215CDCB;
	Wed, 25 Apr 2018 14:43:57 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-12-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_hgGFmUmg2S7bb5nYeEh1z0kBNWrSud0_TMbkUcf7uxg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fff557f8-599b-9a30-4259-9e6f4f88718f@redhat.com>
Date: Wed, 25 Apr 2018 16:43:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_hgGFmUmg2S7bb5nYeEh1z0kBNWrSud0_TMbkUcf7uxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 25 Apr 2018 14:44:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 25 Apr 2018 14:44:00 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v11 11/17] target/arm/kvm: Translate the
 MSI doorbell in kvm_arch_fixup_msi_route
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: loYN6DW2U030

Hi Peter,

On 04/17/2018 01:02 PM, Peter Maydell wrote:
> On 12 April 2018 at 08:38, Eric Auger <eric.auger@redhat.com> wrote:
>> In case the MSI is translated by an IOMMU we need to fixup the
>> MSI route with the translated address.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
>>
>> ---
>> v9 -> v10:
>> - use address_space_translate
>>
>> v5 -> v6:
>> - use IOMMUMemoryRegionClass API
>> ---
>>  target/arm/kvm.c        | 27 +++++++++++++++++++++++++++
>>  target/arm/trace-events |  3 +++
>>  2 files changed, 30 insertions(+)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index ecc39ac..c6f6aa8 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -20,8 +20,10 @@
>>  #include "sysemu/kvm.h"
>>  #include "kvm_arm.h"
>>  #include "cpu.h"
>> +#include "trace.h"
>>  #include "internals.h"
>>  #include "hw/arm/arm.h"
>> +#include "hw/pci/pci.h"
>>  #include "exec/memattrs.h"
>>  #include "exec/address-spaces.h"
>>  #include "hw/boards.h"
>> @@ -649,6 +651,31 @@ int kvm_arm_vgic_probe(void)
>>  int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>>                               uint64_t address, uint32_t data, PCIDevice *dev)
>>  {
>> +    AddressSpace *as = pci_device_iommu_address_space(dev);
>> +    hwaddr xlat, len, doorbell_gpa;
>> +    MemoryRegionSection mrs;
>> +    MemoryRegion *mr;
>> +
>> +    if (as == &address_space_memory) {
>> +        return 0;
>> +    }
>> +
>> +    /* MSI doorbell address is translated by an IOMMU */
>> +
>> +    rcu_read_lock();
>> +    mr = address_space_translate(as, address, &xlat, &len, true);
>> +    if (!mr) {
>> +        return 1;
> 
> This early-return code path fails to release the rcu_read_lock.
ough, fixed.
> 
>> +    }
>> +    mrs = memory_region_find(mr, xlat, 0);
> 
> Is it really valid to pass a size of 0 to memory_region_find() ?
> We should probably use however big the doorbell write is.
Using size=1 as most of the callers do.
> 
> Do we need to do something here to handle the case where
> memory_region_find() doesn't find a a region, or does that
> just work automatically?
Added a check on mrs.mr.

Also released the ref on mrs.mr after usage.

Thanks

Eric
> 
>> +    doorbell_gpa = mrs.offset_within_address_space;
>> +    rcu_read_unlock();
>> +
>> +    route->u.msi.address_lo = doorbell_gpa;
>> +    route->u.msi.address_hi = doorbell_gpa >> 32;
>> +
>> +    trace_kvm_arm_fixup_msi_route(address, doorbell_gpa);
>> +
>>      return 0;
>>  }
>>
>> diff --git a/target/arm/trace-events b/target/arm/trace-events
>> index 9e37131..6b759f9 100644
>> --- a/target/arm/trace-events
>> +++ b/target/arm/trace-events
>> @@ -8,3 +8,6 @@ arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value 0x%"
>>  arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value 0x%" PRIx64
>>  arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
>>  arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value 0x%" PRIx64
>> +
>> +# target/arm/kvm.c
>> +kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
>> --
>> 2.5.5
> 
> thanks
> -- PMM
> 
