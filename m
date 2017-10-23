Received: by 10.223.197.9 with SMTP id q9csp10301786wrf;
        Mon, 23 Oct 2017 00:42:15 -0700 (PDT)
X-Received: by 10.55.159.74 with SMTP id i71mr17989392qke.46.1508744534969;
        Mon, 23 Oct 2017 00:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508744534; cv=none;
        d=google.com; s=arc-20160816;
        b=X2553EdVxYndUMVTDlEoDBdg3RJzUuEXLapgXgMDnM+b8OyuXYMxIvYPip9Ndcjs7d
         f2WGiywW1Y9fI70eCEq8Zg1UAinaJoIEryKBIs9fot/WAu7wf/2u1BIeop6O1B45iK1i
         BNe4vk0NcvBNnUJQd5RZNUBQXKQ+ipjHkBZEoV9ZyWkrSqT/lnLZ+b2IDa2cL3qN6hvQ
         m5MxCBaKlRCpfhKv0g92Z7AOCs9Ldcu6QBWh3hRUE0VvA+pMO0yglbvx08syct9nrGCz
         dCbMMDyI53YF0haONZR2EUkwNnQy9BXKyck3dyBIfk0hqDQQ1A2oieg/O+62jhvP5c1g
         Z8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ap9nLN9FF3xqrpRRYU2+1wRc4gqPo/rHIPwZk6J6jGs=;
        b=r24CYshCxYlSqheRw2Imbhb04d9TSjnmg67WNL0+OMfi1KIXHSnXDCAgKn8flzrkVA
         FF78tFRFjLyNhjGDBcNBIacV3dkWcSQpsUfyJYeRiMOjNFE2O1l2xRV3pjJrsVL3jz3b
         PtKx0/ir12P4DEzBn1zDGxSHd/AORneA4lPMeE9rAc2AZ/MdcgkBaL546s9ILm9ZkuQR
         a6DTSt7r/Xuo+3z+1d523bk4Zz/sxnQUbluSGhDvyL57JNU/DTw72BHeIMstGzn/sPdn
         c00TgJX/5NQMWucWV2r7Mt8Lau6yl8KunKp55pzgJMQbQII7q8TwhmLnyzgfU/hklFh8
         GpVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nb0U8Uei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q25si613612qkl.266.2017.10.23.00.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 00:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nb0U8Uei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6XNE-0002Gs-Ic
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 03:42:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e6XN2-0002FI-G8
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 03:42:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e6XN0-00028G-N1
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 03:42:00 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:45117)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1e6XMw-00026X-F8; Mon, 23 Oct 2017 03:41:54 -0400
Received: by mail-wr0-x244.google.com with SMTP id y9so4091011wrb.2;
	Mon, 23 Oct 2017 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Ap9nLN9FF3xqrpRRYU2+1wRc4gqPo/rHIPwZk6J6jGs=;
	b=Nb0U8UeirPgKjyWyiYURj7Bmlvp0gXulpnd4xf8TxWwnHfh/jek7nithTE39pDK5Oj
	1WXoJwMzKR0P5R66dysd90aPPA1RTgqeqUYyH6emj5BerTGoPtx3pY+UMeTC/+IxQkIn
	6YNITw4W1aMMEfA9qG/LFlS2lJFX3E2nIf5SXovHQ9qvAmWlJYohoBJYdtGyEBVe6pjY
	NtWmCYyq6W3teNIVkwKQUKZt8MFBWMXQ5VLrKhX7xeG8uf1t/qG4sM3OD0ATjWzX1U9X
	Llh3iWahl3GosKIHKW+gD6YMoSpSRNBhi0ErDJyVW7nztHJ98yKl/HejVtYRvtFLWmEj
	iicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Ap9nLN9FF3xqrpRRYU2+1wRc4gqPo/rHIPwZk6J6jGs=;
	b=XIjAZBy3AV7pi9/BqC0sYI/CMMNV5QyRYcneLw+z+g0C0Z4F4w8Ku7aXoLk5zyvM5c
	0YEGWJ3PEk/pPxcc8QBRq8JD5m74Rp2re7MTFrieqc8D+fjiK3ubFe2eEBXnMpAtM4jl
	0Y5xF3/GdpuW0r45H6jVPFPteUxoHDPIPt3Mrg0AbJ7p4vzBizFGPTQXRM9OdzFFvvhl
	TZx5Klyi0K59U+4ObXIPi81d0dEvHTrw+anwvu/mbZD1YRK3y4EFXd36Rwrlnn0Xa8Y2
	GbMZa7ZT7K+oY/gj/F1eGc5/XWHa3bQXEHyt1pvjxpj1YZRBDu5hDBOCrlv1/S+FORS2
	t9mA==
X-Gm-Message-State: AMCzsaXV5cytYeRe0NMu7hqtx+K4oHmIAj79Lnd2LVW0fLyy2NiuImUg
	BxXgrjwUWyIFEb2CcaAMIejjDJnli+jmlNPBNFk=
X-Google-Smtp-Source: ABhQp+Ru6Gb2NDR5hG8G5NZ87ufUTO6FY25wTNAvn2BYxmF0FxlaovAbZ+M2GU+OGbwvtrXMQKbiGgQ8w8aGtlXBy3s=
X-Received: by 10.223.131.65 with SMTP id 59mr9675703wrd.66.1508744513023;
	Mon, 23 Oct 2017 00:41:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.157.2 with HTTP; Mon, 23 Oct 2017 00:41:22 -0700 (PDT)
In-Reply-To: <916ece78-563b-a8bc-37ec-4ee424d7b6ce@redhat.com>
References: <cover.1508390588.git.alistair.francis@xilinx.com>
	<9aee5a95c03d6cb4f4ba6359828809ceab535bfb.1508390588.git.alistair.francis@xilinx.com>
	<916ece78-563b-a8bc-37ec-4ee424d7b6ce@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 23 Oct 2017 09:41:22 +0200
X-Google-Sender-Auth: FOWHnjs5q1NcAMgnb6P50s4v83g
Message-ID: <CAKmqyKM0-x7Lw_4vGsXnO4ZacqRo3kM3dRSgDnTngnNBh6FEGA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 46/46] target: Replace
 fprintf(stderr, "*\n" with error_report()
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
Cc: Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@imgtec.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LBTHNnSuv9yk

On Fri, Oct 20, 2017 at 9:34 AM, Thomas Huth <thuth@redhat.com> wrote:
> On 19.10.2017 18:18, Alistair Francis wrote:
>> Replace a large number of the fprintf(stderr, "*\n" calls with
>> error_report(). The functions were renamed with these commands and then
>> compiler issues where manually fixed.
> [...]
>>  target/arm/arm-powerctl.c    |  5 +++--
>>  target/arm/arm-semi.c        |  3 ++-
>>  target/arm/helper.c          |  4 ++--
>>  target/arm/kvm.c             | 16 ++++++-------
>>  target/arm/kvm32.c           |  2 +-
>>  target/arm/kvm64.c           |  2 +-
>>  target/arm/translate-a64.c   |  4 ++--
>>  target/arm/translate.c       |  2 +-
>>  target/cris/helper.c         |  2 +-
>>  target/i386/hax-all.c        | 53 ++++++++++++++++++++++----------------------
>>  target/i386/hax-darwin.c     | 26 +++++++++++-----------
>>  target/i386/hax-mem.c        |  4 ++--
>>  target/i386/hax-windows.c    | 43 +++++++++++++++++------------------
>>  target/i386/kvm.c            | 38 +++++++++++++++----------------
>>  target/i386/misc_helper.c    | 12 +++++-----
>>  target/lm32/op_helper.c      |  4 ++--
>>  target/mips/mips-semi.c      |  3 ++-
>>  target/mips/translate.c      |  2 +-
>>  target/ppc/excp_helper.c     |  4 ++--
>>  target/ppc/kvm.c             | 34 ++++++++++++++--------------
>>  target/ppc/mmu-hash64.c      |  2 +-
>>  target/ppc/mmu_helper.c      |  2 +-
>>  target/ppc/translate_init.c  | 53 ++++++++++++++++++++++----------------------
>>  target/s390x/kvm.c           | 20 ++++++++---------
>>  target/s390x/misc_helper.c   |  2 +-
>>  target/unicore32/translate.c |  2 +-
>
> If you want to get this committed, it's likely better to split it up
> into the individual subsystems and send the patches to the according
> maintainers, I think.

I think you are right. I really don't want a 50+ patch series though,
so I might wait until other patches have been merged before splitting
this up.

>
>>  26 files changed, 175 insertions(+), 169 deletions(-)
>>
>> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
>> index 25207cb850..2d56d5d579 100644
>> --- a/target/arm/arm-powerctl.c
>> +++ b/target/arm/arm-powerctl.c
>> @@ -9,6 +9,7 @@
>>   */
>>
>>  #include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>>  #include "cpu.h"
>>  #include "cpu-qom.h"
>>  #include "internals.h"
>> @@ -24,7 +25,7 @@
>>  #define DPRINTF(fmt, args...) \
>>      do { \
>>          if (DEBUG_ARM_POWERCTL) { \
>> -            fprintf(stderr, "[ARM]%s: " fmt , __func__, ##args); \
>> +            error_report("[ARM]%s: " fmt , __func__, ##args); \
>
> Using error_report for debug printing sounds wrong to me. These strings
> are not errors. Maybe info_report would be a better choice? ... or maybe
> just leave it as fprintf, since this is just a debug macro.

This should be qemu_log(), I can fix that.

>
>>          } \
>>      } while (0)
>>
>> @@ -32,7 +33,7 @@ CPUState *arm_get_cpu_by_id(uint64_t id)
>>  {
>>      CPUState *cpu;
>>
>> -    DPRINTF("cpu %" PRId64 "\n", id);
>> +    DPRINTF("cpu %" PRId64 "", id);
>>
>>      CPU_FOREACH(cpu) {
>>          ARMCPU *armcpu = ARM_CPU(cpu);
>
> This looks incomplete. There are more DPRINTF statements in this file,
> so if you really want to convert this, you've got to touch all of them.

Yeah, this was a find/replace error.

>
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index a39b9d3633..9c736481f6 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -505,8 +505,8 @@ static inline void assert_fp_access_checked(DisasContext *s)
>>  {
>>  #ifdef CONFIG_DEBUG_TCG
>>      if (unlikely(!s->fp_access_checked || s->fp_excp_el)) {
>> -        fprintf(stderr, "target-arm: FP access check missing for "
>> -                "instruction 0x%08x\n", s->insn);
>> +        error_report("target-arm: FP access check missing for "
>> +                "instruction 0x%08x", s->insn);
>
> Bad indentation.
>
>>          abort();
>>      }
>>  #endif
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index 4da1a4cbc6..55bdcad97e 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -861,7 +861,7 @@ void arm_test_cc(DisasCompare *cmp, int cc)
>>          goto no_invert;
>>
>>      default:
>> -        fprintf(stderr, "Bad condition code 0x%x\n", cc);
>> +        error_report("Bad condition code 0x%x", cc);
>>          abort();
>>      }
>>
>> diff --git a/target/cris/helper.c b/target/cris/helper.c
>> index af78cca8b9..ba9ce538c3 100644
>> --- a/target/cris/helper.c
>> +++ b/target/cris/helper.c
>> @@ -282,7 +282,7 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>>      if (!miss) {
>>          phy = res.phy;
>>      }
>> -    D(fprintf(stderr, "%s %x -> %x\n", __func__, addr, phy));
>> +    D(error_report("%s %x -> %x", __func__, addr, phy));
>
> I think it would be better to remove the D() macro from this file and
> turn this statement into a qemu_log_mask(CPU_LOG_MMU, ...).

Fixed.

>
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index 9d57debf0e..b87f3d6f84 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -159,8 +159,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>      cap_ppc_pvr_compat = false;
>>
>>      if (!cap_interrupt_level) {
>> -        fprintf(stderr, "KVM: Couldn't find level irq capability. Expect the "
>> -                        "VM to stall at times!\n");
>> +        error_report("KVM: Couldn't find level irq capability. Expect the "
>> +                        "VM to stall at times!");
>>      }
>>
>>      kvm_ppc_register_host_cpu_type(ms);
>> @@ -188,7 +188,7 @@ static int kvm_arch_sync_sregs(PowerPCCPU *cpu)
>>          return 0;
>>      } else {
>>          if (!cap_segstate) {
>> -            fprintf(stderr, "kvm error: missing PVR setting capability\n");
>> +            error_report("kvm error: missing PVR setting capability");
>>              return -ENOSYS;
>>          }
>>      }
>> @@ -237,7 +237,7 @@ static int kvm_booke206_tlb_init(PowerPCCPU *cpu)
>>
>>      ret = kvm_vcpu_enable_cap(cs, KVM_CAP_SW_TLB, 0, (uintptr_t)&cfg);
>>      if (ret < 0) {
>> -        fprintf(stderr, "%s: couldn't enable KVM_CAP_SW_TLB: %s\n",
>> +        error_report("%s: couldn't enable KVM_CAP_SW_TLB: %s",
>>                  __func__, strerror(-ret));
>>          return ret;
>>      }
>> @@ -552,7 +552,7 @@ static void kvmppc_hw_debug_points_init(CPUPPCState *cenv)
>>      }
>>
>>      if ((max_hw_breakpoint + max_hw_watchpoint) > MAX_HW_BKPTS) {
>> -        fprintf(stderr, "Error initializing h/w breakpoints\n");
>> +        error_report("Error initializing h/w breakpoints");
>>          return;
>>      }
>>  }
>> @@ -623,7 +623,7 @@ static void kvm_sw_tlb_put(PowerPCCPU *cpu)
>>
>>      ret = kvm_vcpu_ioctl(cs, KVM_DIRTY_TLB, &dirty_tlb);
>>      if (ret) {
>> -        fprintf(stderr, "%s: KVM_DIRTY_TLB: %s\n",
>> +        error_report("%s: KVM_DIRTY_TLB: %s",
>>                  __func__, strerror(-ret));
>>      }
>>
>> @@ -1480,7 +1480,7 @@ static int kvmppc_handle_halt(PowerPCCPU *cpu)
>>  static int kvmppc_handle_dcr_read(CPUPPCState *env, uint32_t dcrn, uint32_t *data)
>>  {
>>      if (ppc_dcr_read(env->dcr_env, dcrn, data) < 0)
>> -        fprintf(stderr, "Read to unhandled DCR (0x%x)\n", dcrn);
>> +        error_report("Read to unhandled DCR (0x%x)", dcrn);
>>
>>      return 0;
>>  }
>> @@ -1488,7 +1488,7 @@ static int kvmppc_handle_dcr_read(CPUPPCState *env, uint32_t dcrn, uint32_t *dat
>>  static int kvmppc_handle_dcr_write(CPUPPCState *env, uint32_t dcrn, uint32_t data)
>>  {
>>      if (ppc_dcr_write(env->dcr_env, dcrn, data) < 0)
>> -        fprintf(stderr, "Write to unhandled DCR (0x%x)\n", dcrn);
>> +        error_report("Write to unhandled DCR (0x%x)", dcrn);
>>
>>      return 0;
>>  }
>> @@ -1799,7 +1799,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>>          break;
>>
>>      default:
>> -        fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
>> +        error_report("KVM: unknown exit reason %d", run->exit_reason);
>>          ret = -1;
>>          break;
>>      }
>> @@ -1863,7 +1863,7 @@ int kvmppc_booke_watchdog_enable(PowerPCCPU *cpu)
>>
>>      ret = kvm_vcpu_enable_cap(cs, KVM_CAP_PPC_BOOKE_WATCHDOG, 0);
>>      if (ret < 0) {
>> -        fprintf(stderr, "%s: couldn't enable KVM_CAP_PPC_BOOKE_WATCHDOG: %s\n",
>> +        error_report("%s: couldn't enable KVM_CAP_PPC_BOOKE_WATCHDOG: %s",
>>                  __func__, strerror(-ret));
>>          return ret;
>>      }
>> @@ -2198,7 +2198,7 @@ off_t kvmppc_alloc_rma(void **rma)
>>
>>      fd = kvm_vm_ioctl(kvm_state, KVM_ALLOCATE_RMA, &ret);
>>      if (fd < 0) {
>> -        fprintf(stderr, "KVM: Error on KVM_ALLOCATE_RMA: %s\n",
>> +        error_report("KVM: Error on KVM_ALLOCATE_RMA: %s",
>>                  strerror(errno));
>>          return -1;
>>      }
>> @@ -2207,7 +2207,7 @@ off_t kvmppc_alloc_rma(void **rma)
>>
>>      *rma = mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
>>      if (*rma == MAP_FAILED) {
>> -        fprintf(stderr, "KVM: Error mapping RMA: %s\n", strerror(errno));
>> +        error_report("KVM: Error mapping RMA: %s", strerror(errno));
>>          return -1;
>>      };
>>
>> @@ -2309,7 +2309,7 @@ void *kvmppc_create_spapr_tce(uint32_t liobn, uint32_t page_shift,
>>          }
>>          fd = kvm_vm_ioctl(kvm_state, KVM_CREATE_SPAPR_TCE, &args);
>>          if (fd < 0) {
>> -            fprintf(stderr, "KVM: Failed to create TCE table for liobn 0x%x\n",
>> +            error_report("KVM: Failed to create TCE table for liobn 0x%x",
>>                      liobn);
>>              return NULL;
>>          }
>> @@ -2322,7 +2322,7 @@ void *kvmppc_create_spapr_tce(uint32_t liobn, uint32_t page_shift,
>>
>>      table = mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
>>      if (table == MAP_FAILED) {
>> -        fprintf(stderr, "KVM: Failed to map TCE table for liobn 0x%x\n",
>> +        error_report("KVM: Failed to map TCE table for liobn 0x%x",
>>                  liobn);
>>          close(fd);
>>          return NULL;
>> @@ -2584,7 +2584,7 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t bufsize, int64_t max_ns)
>>      do {
>>          rc = read(fd, buf, bufsize);
>>          if (rc < 0) {
>> -            fprintf(stderr, "Error reading data from KVM HTAB fd: %s\n",
>> +            error_report("Error reading data from KVM HTAB fd: %s",
>>                      strerror(errno));
>>              return rc;
>>          } else if (rc) {
>> @@ -2629,13 +2629,13 @@ int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
>>
>>      rc = write(fd, buf, chunksize);
>>      if (rc < 0) {
>> -        fprintf(stderr, "Error writing KVM hash table: %s\n",
>> +        error_report("Error writing KVM hash table: %s",
>>                  strerror(errno));
>>          return rc;
>>      }
>
> Wrong indentation in the above hunks.
>
>> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
>> index 14d34e512f..8713ed6682 100644
>> --- a/target/ppc/mmu-hash64.c
>> +++ b/target/ppc/mmu-hash64.c
>> @@ -377,7 +377,7 @@ static int ppc_hash64_amr_prot(PowerPCCPU *cpu, ppc_hash_pte64_t pte)
>>      key = HPTE64_R_KEY(pte.pte1);
>>      amrbits = (env->spr[SPR_AMR] >> 2*(31 - key)) & 0x3;
>>
>> -    /* fprintf(stderr, "AMR protection: key=%d AMR=0x%" PRIx64 "\n", key, */
>> +    /* error_report("AMR protection: key=%d AMR=0x%" PRIx64 "", key, */
>>      /*         env->spr[SPR_AMR]); */
>
> It's just a comment but still - indentation in the second line is wrong
> here, too.

I fixed all the other comments.

Thanks,
Alistair

>
>  Thomas
