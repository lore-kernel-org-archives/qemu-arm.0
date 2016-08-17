Received: by 10.25.21.156 with SMTP id 28csp2590506lfv;
        Wed, 17 Aug 2016 09:06:55 -0700 (PDT)
X-Received: by 10.200.45.108 with SMTP id o41mr46623769qta.100.1471450015010;
        Wed, 17 Aug 2016 09:06:55 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 7si6477808qkh.144.2016.08.17.09.06.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 09:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ba3Mk-00064i-CF
	for alex.bennee@linaro.org; Wed, 17 Aug 2016 12:06:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ba3LG-0005M9-Hw
	for qemu-devel@nongnu.org; Wed, 17 Aug 2016 12:05:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ba3LC-00011M-22
	for qemu-devel@nongnu.org; Wed, 17 Aug 2016 12:05:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1ba3L4-0000zK-ND; Wed, 17 Aug 2016 12:05:10 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85B613B72D;
	Wed, 17 Aug 2016 16:05:09 +0000 (UTC)
Received: from localhost.localdomain (vpn1-5-93.ams2.redhat.com [10.36.5.93])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u7HG55M7029631
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Aug 2016 12:05:06 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
	<1470161247-10251-5-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8OFkdVF55KL1U0OO=GDgLumRuVy4N1HD=fHicKkrmiyA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <071d1bf7-a8b9-dfb5-dc18-b0280da52cfb@redhat.com>
Date: Wed, 17 Aug 2016 18:05:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8OFkdVF55KL1U0OO=GDgLumRuVy4N1HD=fHicKkrmiyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 17 Aug 2016 16:05:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v5 4/7] target-arm/kvm: Pass requester ID to
 MSI routing functions
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f2eo7PMvcfwg

Hi Peter,

On 12/08/2016 16:19, Peter Maydell wrote:
> On 2 August 2016 at 19:07, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Pavel Fedin <p.fedin@samsung.com>
>>
>> Introduce global kvm_arm_msi_use_devid flag and pass device IDs in
>> kvm_arch_fixup_msi_route(). Device IDs are required by the ITS.
>>
>> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v3 -> v4:
>> - OR route->flags with KVM_MSI_VALID_DEVID
>> ---
>>  target-arm/kvm.c     | 6 ++++++
>>  target-arm/kvm_arm.h | 3 +++
>>  2 files changed, 9 insertions(+)
>>
>> diff --git a/target-arm/kvm.c b/target-arm/kvm.c
>> index dbe393c..4675aa3 100644
>> --- a/target-arm/kvm.c
>> +++ b/target-arm/kvm.c
>> @@ -22,6 +22,7 @@
>>  #include "cpu.h"
>>  #include "internals.h"
>>  #include "hw/arm/arm.h"
>> +#include "hw/pci/pci.h"
>>  #include "exec/memattrs.h"
>>  #include "hw/boards.h"
>>  #include "qemu/log.h"
>> @@ -31,6 +32,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>  };
>>
>>  static bool cap_has_mp_state;
>> +bool kvm_arm_msi_use_devid;
>>
>>  int kvm_arm_vcpu_init(CPUState *cs)
>>  {
>> @@ -619,6 +621,10 @@ int kvm_arm_vgic_probe(void)
>>  int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>>                               uint64_t address, uint32_t data, PCIDevice *dev)
>>  {
>> +    if (kvm_arm_msi_use_devid) {
>> +        route->flags |= KVM_MSI_VALID_DEVID;
>> +        route->u.msi.devid = pci_requester_id(dev);
>> +    }
>>      return 0;
>>  }
>>
>> diff --git a/target-arm/kvm_arm.h b/target-arm/kvm_arm.h
>> index 633d088..befcfd1 100644
>> --- a/target-arm/kvm_arm.h
>> +++ b/target-arm/kvm_arm.h
>> @@ -121,6 +121,9 @@ bool write_kvmstate_to_list(ARMCPU *cpu);
>>  void kvm_arm_reset_vcpu(ARMCPU *cpu);
>>
>>  #ifdef CONFIG_KVM
>> +
>> +extern bool kvm_arm_msi_use_devid;
>> +
> 
> The kernel documentation and most of the code for this flag
> isn't ARM specific, which suggests to me that we should put
> the QEMU support into the non-architecture-specific files too.
> That is, a flag and wrapper function like all the existing
> ones in include/sysemu/kvm.h, and then put the
>     if (kvm_msi_use_devid()) {
>         ...
>     }
> in the functions in kvm-all.c that need it.
OK this makes sense to me too

Thank you for your time

Best Regards

Eric
> 
> thanks
> -- PMM
> 
