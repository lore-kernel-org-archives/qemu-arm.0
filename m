Received: by 10.223.134.117 with SMTP id 50csp11714973wrw;
        Wed, 3 Jan 2018 01:14:12 -0800 (PST)
X-Google-Smtp-Source: ACJfBosC9+0MuaiPlRy9yWARIr9WqlpkMC1qyBAvv4JKtJ3hGq/PJx8B/lpSnpOnKoMc70yb5XWU
X-Received: by 10.84.252.140 with SMTP id y12mr815899pll.13.1514970852286;
        Wed, 03 Jan 2018 01:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514970852; cv=none;
        d=google.com; s=arc-20160816;
        b=1FIPWuqi06eqMQxEFrUEn9HARZorxbO8Stl24zv8d/KagUT/RfuS/WM9hkyLgk8IXm
         UxJJW+Z+h5aXgBcnnF23DbEbHrO1cPX+fuTUvc2Hv4yf4IbMVJ9AynWSait3GvS4sQJf
         L98SjOaKHKs5h5m8BHtW/NqvpzB1YhIAsyj6LhxvEEJUV8xJ59AvHaZUhMD6UxPcjLKV
         PGVJ3p9lYoicar4F1nzJzQf9gbI6jSfUSKWFt9ran5myQ8A8h6dZj4fgMCEPSrKMuK9Z
         un5oXjW4W9n4hCGh3FUq+why3uQh8BYim6K1xNDRkto7mZgwS9fFI3xIttOXSx8QVkoj
         6NpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=pW3csm37Mcnxpt7MBGHv0WxkKoM8SrwulNOE51ry99M=;
        b=Dz+rKm0z7HKmOwih/QVRYqG1h3anvRPe5skMlr++6VH+zl90i59T8HYvw2jr0En3tZ
         6i69UQgqJQr9hFspMowyHRZUsSt1ZP+DbyCg5mbLF3s0GJSi14NWRMBXzyh5NM2hPUUR
         yB2duMorU6Q3uK8zlq8jqotp+mgNTU2f61ZVeRL5hpQAhAzkZ/lcPjnTIoiSyQ3Yg/79
         bLsQMDBd4VRC4B5aDHeIuXgyvHS8EIEcxRfBxwgoaBk4q5LpTLmV6tke2VF+ymfpthqW
         mb6de4S3VGuTRyZbryOnacQrJ1BoRIhD2zzGka8+S+m+uqtPZHDDZOuiLV1yuYOT3nlX
         ldyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id i187si396279pgc.532.2018.01.03.01.14.12;
        Wed, 03 Jan 2018 01:14:12 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751255AbeACJOJ (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Wed, 3 Jan 2018 04:14:09 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:34453 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751133AbeACJOG (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 3 Jan 2018 04:14:06 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id CC616BAC9AFDD;
        Wed,  3 Jan 2018 17:13:52 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.361.1; Wed, 3 Jan 2018
 17:13:48 +0800
Subject: Re: [PATCH v14 9/9] target-arm: kvm64: handle SIGBUS signal from
 kernel or KVM
To:     Igor Mammedov <imammedo@redhat.com>
CC:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <huangshaoyu@huawei.com>, <zhengqiang10@huawei.com>,
        <xuwei5@hisilicon.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-10-git-send-email-gengdongjiu@huawei.com>
 <20171228160727.62d0857d@igors-macbook-pro.local>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <fed83a29-d96f-e696-8b94-dc2d1e81ee21@huawei.com>
Date:   Wed, 3 Jan 2018 17:13:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171228160727.62d0857d@igors-macbook-pro.local>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: LvNF4wiuGMIj



On 2017/12/28 23:07, Igor Mammedov wrote:
> On Thu, 28 Dec 2017 13:54:18 +0800
> Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> 
>> Add SIGBUS signal handler. In this handler, it checks the SIGBUS type,
>> translates the host VA which is delivered by host to guest PA, then fill
>> this PA to CPER and fill the CPER to guest APEI GHES memory, finally
>> notify guest according to the SIGBUS type. There are two kinds of SIGBUS
>> that QEMU needs to handle, which are BUS_MCEERR_AO and BUS_MCEERR_AR.
>>
>> If guest accesses the poisoned memory, it generates Synchronous External
>> Abort(SEA). Then host kernel gets an APEI notification and call memory_failure()
>> to unmapped the affected page from the guest's stage2, and SIGBUS_MCEERR_AO
> s/unmapped/unmap/
Thanks.

> 
>> is delivered to Qemu's main thread. If Qemu receives this SIGBUS, it will
>> create a new CPER and add it to guest APEI GHES memory, then notify the
>> guest with a GPIO-Signal notification.
> too long sentence, it's hard get what goes on here, pls split it in simple
> sentences/rephrase so it would be easy to understand behavior.
I will split it in simple sentences/rephrase.
Thanks for your detailed review.

> 
>>
>> When guest hits a PG_hwpoison page, it will trap to KVM as stage2 fault, then a
>> SIGBUS_MCEERR_AR synchronous signal is delivered to Qemu, Qemu record this error
>> into guest APEI GHES memory and notify guest using Synchronous-External-Abort(SEA).
>>
>> Suggested-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>> Address James's comments to record CPER and notify guest for SIGBUS signal handling.
>> Shown some discussion in [1].
>>
>> [1]:
>> https://lkml.org/lkml/2017/2/27/246
>> https://lkml.org/lkml/2017/9/14/241
>> https://lkml.org/lkml/2017/9/22/499
>> ---
>>  include/sysemu/kvm.h |  2 +-
>>  target/arm/kvm.c     |  2 ++
>>  target/arm/kvm64.c   | 34 ++++++++++++++++++++++++++++++++++
>>  3 files changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>> index 3a458f5..90c1605 100644
>> --- a/include/sysemu/kvm.h
>> +++ b/include/sysemu/kvm.h
>> @@ -361,7 +361,7 @@ bool kvm_vcpu_id_is_valid(int vcpu_id);
>>  /* Returns VCPU ID to be used on KVM_CREATE_VCPU ioctl() */
>>  unsigned long kvm_arch_vcpu_id(CPUState *cpu);
>>  
>> -#ifdef TARGET_I386
>> +#if defined(TARGET_I386) || defined(TARGET_AARCH64)
>>  #define KVM_HAVE_MCE_INJECTION 1
>>  void kvm_arch_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
>>  #endif
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 7c17f0d..9d25f51 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -26,6 +26,7 @@
>>  #include "exec/address-spaces.h"
>>  #include "hw/boards.h"
>>  #include "qemu/log.h"
>> +#include "exec/ram_addr.h"
>>  
>>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>      KVM_CAP_LAST_INFO
>> @@ -182,6 +183,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>  
>>      cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
>>  
>> +    qemu_register_reset(kvm_unpoison_all, NULL);
>>      type_register_static(&host_arm_cpu_type_info);
>>  
>>      return 0;
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index c00450d..6955d85 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -27,6 +27,9 @@
>>  #include "kvm_arm.h"
>>  #include "internals.h"
>>  #include "hw/arm/arm.h"
>> +#include "exec/ram_addr.h"
>> +#include "hw/acpi/acpi-defs.h"
>> +#include "hw/acpi/hest_ghes.h"
>>  
>>  static bool have_guest_debug;
>>  
>> @@ -944,6 +947,37 @@ int kvm_arch_get_registers(CPUState *cs)
>>      return ret;
>>  }
>>  
>> +void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>> +{
>> +    ram_addr_t ram_addr;
>> +    hwaddr paddr;
>> +
>> +    assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>> +    if (addr) {
>> +        ram_addr = qemu_ram_addr_from_host(addr);
>> +        if (ram_addr != RAM_ADDR_INVALID &&
>> +            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
>> +            kvm_hwpoison_page_add(ram_addr);
>> +            if (code == BUS_MCEERR_AR) {
>> +                kvm_cpu_synchronize_state(c);
>> +                ghes_record_errors(ACPI_HEST_NOTIFY_SEA, paddr);
>> +                kvm_inject_arm_sea(c);
>> +            } else if (code == BUS_MCEERR_AO) {
>> +                ghes_record_errors(ACPI_HEST_NOTIFY_GPIO, paddr);
>> +                qemu_hardware_error_notify();
>> +            }
>> +            return;
>> +        }
>> +        fprintf(stderr, "Hardware memory error for memory used by "
>> +                "QEMU itself instead of guest system!\n");
> not quite sure what above message means,
When the memory error address belong to QEMU itself, not belong to guest OS.
it will print above message.

Above message means this memory error happens in QEMU application instead of guest OS.

> 
> also fprintf() probably shouldn't be used by new code.
how about we use error_report()? thanks

> 
>> +    }
>> +
>> +    if (code == BUS_MCEERR_AR) {
>> +        fprintf(stderr, "Hardware memory error!\n");
>> +        exit(1);
>> +    }
>> +}
>> +
>>  /* C6.6.29 BRK instruction */
>>  static const uint32_t brk_insn = 0xd4200000;
>>  
> 
> 
> .
> 
