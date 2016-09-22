Received: by 10.80.163.71 with SMTP id 65csp65120edn;
        Thu, 22 Sep 2016 09:14:51 -0700 (PDT)
X-Received: by 10.200.53.235 with SMTP id l40mr2925923qtb.47.1474560783486;
        Thu, 22 Sep 2016 09:13:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id u126si1619910qkc.66.2016.09.22.09.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 09:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn6cQ-0000GT-RM
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 12:13:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bn6JR-00078N-Db
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 11:53:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bn6JQ-0006Cz-6T
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 11:53:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bn6JP-0006CJ-TE; Thu, 22 Sep 2016 11:53:24 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48BD57D0E9;
	Thu, 22 Sep 2016 15:53:23 +0000 (UTC)
Received: from localhost.localdomain (vpn1-7-69.ams2.redhat.com [10.36.7.69])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8MFrJ2F027935
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 22 Sep 2016 11:53:20 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
	<1473442237-3746-5-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-wOY_cA=znsds3Ei3CPofQMQwH-a0wfyHSZLRKXZXs=Q@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <75bbff89-ddda-1656-8947-338c1bf1d521@redhat.com>
Date: Thu, 22 Sep 2016 17:53:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-wOY_cA=znsds3Ei3CPofQMQwH-a0wfyHSZLRKXZXs=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 22 Sep 2016 15:53:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 4/8] kvm-all: Pass requester ID to MSI
 routing functions
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O54msIXdKwb9

Hi Peter,

On 22/09/2016 16:35, Peter Maydell wrote:
> On 9 September 2016 at 18:30, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Pavel Fedin <p.fedin@samsung.com>
>>
>> Introduce global kvm_msi_use_devid flag and pass the device ID,
>> if needed, while building the MSI route entry. Device IDs are
>> required by the ARM GICv3 ITS (IRQ remapping function is based on
>> this information).
>>
>> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v5 -> v6:
>> - move the flag in include/sysemu/kvm.h and populate the devid
>>   information in kvm-all.c
>>
>> v3 -> v4:
>> - OR route->flags with KVM_MSI_VALID_DEVID
>> ---
>>  include/sysemu/kvm.h | 1 +
>>  kvm-all.c            | 9 +++++++++
>>  kvm-stub.c           | 1 +
>>  3 files changed, 11 insertions(+)
>>
>> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>> index c9c2436..c31c810 100644
>> --- a/include/sysemu/kvm.h
>> +++ b/include/sysemu/kvm.h
>> @@ -53,6 +53,7 @@ extern bool kvm_gsi_direct_mapping;
>>  extern bool kvm_readonly_mem_allowed;
>>  extern bool kvm_direct_msi_allowed;
>>  extern bool kvm_ioeventfd_any_length_allowed;
>> +extern bool kvm_msi_use_devid;
>>
>>  #if defined CONFIG_KVM || !defined NEED_CPU_H
>>  #define kvm_enabled()           (kvm_allowed)
> 
> You also need the appropriate #define, like all the other flags
> here (with a doc comment, and with the version that's just defined
> as '(false)').
> 
> The idea is that tests of the condition then don't need to
> be guarded by ifdef CONFIG_KVM.

Hum yes I totally forgot this.
> 
>> diff --git a/kvm-all.c b/kvm-all.c
>> index ebf35b0..df3bcde 100644
>> --- a/kvm-all.c
>> +++ b/kvm-all.c
>> @@ -119,6 +119,7 @@ bool kvm_readonly_mem_allowed;
>>  bool kvm_vm_attributes_allowed;
>>  bool kvm_direct_msi_allowed;
>>  bool kvm_ioeventfd_any_length_allowed;
>> +bool kvm_msi_use_devid;
>>
>>  static const KVMCapabilityInfo kvm_required_capabilites[] = {
>>      KVM_CAP_INFO(USER_MEMORY),
>> @@ -1275,6 +1276,10 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
>>      kroute.u.msi.address_lo = (uint32_t)msg.address;
>>      kroute.u.msi.address_hi = msg.address >> 32;
>>      kroute.u.msi.data = le32_to_cpu(msg.data);
>> +    if (kvm_msi_use_devid) {
> 
> these should use the macro, not direct access to the flag variable.
Sure

Thanks

Eric
> 
>> +        kroute.flags = KVM_MSI_VALID_DEVID;
>> +        kroute.u.msi.devid = pci_requester_id(dev);
>> +    }
>>      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
>>          kvm_irqchip_release_virq(s, virq);
>>          return -EINVAL;
>> @@ -1308,6 +1313,10 @@ int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
>>      kroute.u.msi.address_lo = (uint32_t)msg.address;
>>      kroute.u.msi.address_hi = msg.address >> 32;
>>      kroute.u.msi.data = le32_to_cpu(msg.data);
>> +    if (kvm_msi_use_devid) {
>> +        kroute.flags = KVM_MSI_VALID_DEVID;
>> +        kroute.u.msi.devid = pci_requester_id(dev);
>> +    }
>>      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
>>          return -EINVAL;
>>      }
>> diff --git a/kvm-stub.c b/kvm-stub.c
>> index 64e23f6..6f896e9 100644
>> --- a/kvm-stub.c
>> +++ b/kvm-stub.c
>> @@ -31,6 +31,7 @@ bool kvm_gsi_direct_mapping;
>>  bool kvm_allowed;
>>  bool kvm_readonly_mem_allowed;
>>  bool kvm_ioeventfd_any_length_allowed;
>> +bool kvm_msi_use_devid;
>>
>>  int kvm_destroy_vcpu(CPUState *cpu)
>>  {
> 
> thanks
> -- PMM
> 
