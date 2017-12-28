Received: by 10.223.134.117 with SMTP id 50csp5632930wrw;
        Thu, 28 Dec 2017 07:07:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBotZfXejypa7Q7Z9rhKLBW3HOCP20X+7/AmacG6KHMDigmxKKzcs9MC9SCtROeq8KrwGhq3m
X-Received: by 10.99.106.132 with SMTP id f126mr22497546pgc.167.1514473666375;
        Thu, 28 Dec 2017 07:07:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514473666; cv=none;
        d=google.com; s=arc-20160816;
        b=nK++8cwoD2659fZXyQDid0LdGdtHSfki+PRuRJkmKGVom0vhzppXuL3LpqGtoOPbvg
         z1Vuj85UUg+NpC0KCWb3UBR1ZIdtw8OLMcY9R9rI8ZuYIpqiEKrEtjJXpR9a903+xhyQ
         fHQlopvVgjkfJzGySFF+Ej1xR1IjWscAVhMhtimhRtZqIp5QDk1X0zUncVIZ0f7CIBom
         l2H4E124nSDmy25lr/uOtQX+OctvjjkJfZDYAf17vtNx37Hyfqk2P4Q6JgdYtWWqEXul
         VobFhaHbP68qAi47umHZvCGYEBOASuP/JlrIQIhZKeGxT7uYencdLwzLeMCuy11DPqc3
         5Vfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :arc-authentication-results;
        bh=IOqzCZfZC/39PKOU31haEzdB0ek2/rvrS4R+1Xd3Upw=;
        b=C2BUAflIClgTae35iUGOIdRJ45ApZSEDwB+aPTHz5f9/93j/lVFYrn5cIYhgQ3HAqn
         YCt+23HJ/RIIV6CMuYzleL/M4zDvj/nCSucko9RKcgrjMV17cdK+6e0Q6otK6OwVlSnL
         E917vZdAClf53k+VkzY1feNQLXoS2RzgbkgrWIZvKs3x+9PyLbXMKh5gvKMJYzRnlmAA
         e5asDjs/XE2HYN1s3K11+N5JemCYUIKMV9tPPhDEOjnIBy/EMbzO32v/ZG9KijZJAhHE
         6+Kqv4JnxIQY/gK2YVD6V2BG4oBPdRGAddt9gbIjcWzBj/nqWWpoQ4bwOcHcCjURDqWk
         rNLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id e7si24126278pgt.15.2017.12.28.07.07.46;
        Thu, 28 Dec 2017 07:07:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753426AbdL1PHo (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 28 Dec 2017 10:07:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59980 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753293AbdL1PHn (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 10:07:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 15EA65D687;
        Thu, 28 Dec 2017 15:07:43 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-112-23.ams2.redhat.com [10.36.112.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7BE685D6A5;
        Thu, 28 Dec 2017 15:07:33 +0000 (UTC)
Date:   Thu, 28 Dec 2017 16:07:27 +0100
From:   Igor Mammedov <imammedo@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <huangshaoyu@huawei.com>, <zhengqiang10@huawei.com>,
        <xuwei5@hisilicon.com>
Subject: Re: [PATCH v14 9/9] target-arm: kvm64: handle SIGBUS signal from
 kernel or KVM
Message-ID: <20171228160727.62d0857d@igors-macbook-pro.local>
In-Reply-To: <1514440458-10515-10-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
        <1514440458-10515-10-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 28 Dec 2017 15:07:43 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 12IGQvpmIXaS

On Thu, 28 Dec 2017 13:54:18 +0800
Dongjiu Geng <gengdongjiu@huawei.com> wrote:

> Add SIGBUS signal handler. In this handler, it checks the SIGBUS type,
> translates the host VA which is delivered by host to guest PA, then fill
> this PA to CPER and fill the CPER to guest APEI GHES memory, finally
> notify guest according to the SIGBUS type. There are two kinds of SIGBUS
> that QEMU needs to handle, which are BUS_MCEERR_AO and BUS_MCEERR_AR.
> 
> If guest accesses the poisoned memory, it generates Synchronous External
> Abort(SEA). Then host kernel gets an APEI notification and call memory_failure()
> to unmapped the affected page from the guest's stage2, and SIGBUS_MCEERR_AO
s/unmapped/unmap/

> is delivered to Qemu's main thread. If Qemu receives this SIGBUS, it will
> create a new CPER and add it to guest APEI GHES memory, then notify the
> guest with a GPIO-Signal notification.
too long sentence, it's hard get what goes on here, pls split it in simple
sentences/rephrase so it would be easy to understand behavior.

> 
> When guest hits a PG_hwpoison page, it will trap to KVM as stage2 fault, then a
> SIGBUS_MCEERR_AR synchronous signal is delivered to Qemu, Qemu record this error
> into guest APEI GHES memory and notify guest using Synchronous-External-Abort(SEA).
> 
> Suggested-by: James Morse <james.morse@arm.com>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> Address James's comments to record CPER and notify guest for SIGBUS signal handling.
> Shown some discussion in [1].
> 
> [1]:
> https://lkml.org/lkml/2017/2/27/246
> https://lkml.org/lkml/2017/9/14/241
> https://lkml.org/lkml/2017/9/22/499
> ---
>  include/sysemu/kvm.h |  2 +-
>  target/arm/kvm.c     |  2 ++
>  target/arm/kvm64.c   | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 3a458f5..90c1605 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -361,7 +361,7 @@ bool kvm_vcpu_id_is_valid(int vcpu_id);
>  /* Returns VCPU ID to be used on KVM_CREATE_VCPU ioctl() */
>  unsigned long kvm_arch_vcpu_id(CPUState *cpu);
>  
> -#ifdef TARGET_I386
> +#if defined(TARGET_I386) || defined(TARGET_AARCH64)
>  #define KVM_HAVE_MCE_INJECTION 1
>  void kvm_arch_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
>  #endif
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 7c17f0d..9d25f51 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -26,6 +26,7 @@
>  #include "exec/address-spaces.h"
>  #include "hw/boards.h"
>  #include "qemu/log.h"
> +#include "exec/ram_addr.h"
>  
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
> @@ -182,6 +183,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>  
>      cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
>  
> +    qemu_register_reset(kvm_unpoison_all, NULL);
>      type_register_static(&host_arm_cpu_type_info);
>  
>      return 0;
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index c00450d..6955d85 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -27,6 +27,9 @@
>  #include "kvm_arm.h"
>  #include "internals.h"
>  #include "hw/arm/arm.h"
> +#include "exec/ram_addr.h"
> +#include "hw/acpi/acpi-defs.h"
> +#include "hw/acpi/hest_ghes.h"
>  
>  static bool have_guest_debug;
>  
> @@ -944,6 +947,37 @@ int kvm_arch_get_registers(CPUState *cs)
>      return ret;
>  }
>  
> +void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
> +{
> +    ram_addr_t ram_addr;
> +    hwaddr paddr;
> +
> +    assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
> +    if (addr) {
> +        ram_addr = qemu_ram_addr_from_host(addr);
> +        if (ram_addr != RAM_ADDR_INVALID &&
> +            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> +            kvm_hwpoison_page_add(ram_addr);
> +            if (code == BUS_MCEERR_AR) {
> +                kvm_cpu_synchronize_state(c);
> +                ghes_record_errors(ACPI_HEST_NOTIFY_SEA, paddr);
> +                kvm_inject_arm_sea(c);
> +            } else if (code == BUS_MCEERR_AO) {
> +                ghes_record_errors(ACPI_HEST_NOTIFY_GPIO, paddr);
> +                qemu_hardware_error_notify();
> +            }
> +            return;
> +        }
> +        fprintf(stderr, "Hardware memory error for memory used by "
> +                "QEMU itself instead of guest system!\n");
not quite sure what above message means,

also fprintf() probably shouldn't be used by new code.

> +    }
> +
> +    if (code == BUS_MCEERR_AR) {
> +        fprintf(stderr, "Hardware memory error!\n");
> +        exit(1);
> +    }
> +}
> +
>  /* C6.6.29 BRK instruction */
>  static const uint32_t brk_insn = 0xd4200000;
>  
