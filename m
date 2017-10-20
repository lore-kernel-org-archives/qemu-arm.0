Received: by 10.223.197.9 with SMTP id q9csp7629822wrf;
        Fri, 20 Oct 2017 00:34:51 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QAk7Z8dHLfKD+9YJAktemQQJd+gh4oZ963r0YKC6cASy7Jap42madZ0buF15ppYHmQp6rl
X-Received: by 10.237.36.145 with SMTP id t17mr5642567qtc.162.1508484891346;
        Fri, 20 Oct 2017 00:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508484891; cv=none;
        d=google.com; s=arc-20160816;
        b=hcnmap0ZdXEQ/w6zg1nIOs6CdrcBmo75Qmyc4IT9CpZZBIyhDHJIEdi4A4hZMmmZv8
         Xo8mVTY7wS/rWxAoqOyJpWQOJKitWMeYKFzGTmi2uYU4syHA2rWGHRfL0SrgxLtQul5l
         cPUrjOzwYm7bCYrWuaw4mxL8NiUYuCoqmjRzI/b44vTjKcRDRE7x6RatGQBJWomkTnUN
         FG/wiqJnRhlIpbX3R57Hb+sxeHEk4iBqDG2DXJmZu6WCSLunXnvPuFji/+R7M9YRCRt5
         u75pM0nvImX+Uaokk/nP+6NKVqM9o46zynarfnyaVaDHwAxSK2gBk2dXR5WZwNVfUL+j
         E0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=tXjhHSu/oZnK3eLhArnMi7yzy32RNfFaZoKa/vMC/lw=;
        b=Ir19gBWzJJFo5LqdXHEmDrGHYDcHx1rnBZPH7iruMkslHkOL4E6CTe2f2/mRSDcl6N
         cz7W+xYQQyhn2Niy9p02kpes9FFVLD1tvdFhWDsngqgkTOx/4PG+Ye1/ytyZQnj821px
         woduKZa4WPGaCxOJxcNGCWqPKPuMhNB8//fdeR8pnqeNQ35OgFhBW8Bpnhh7/3956814
         jWj04Aub+HPt8D2Bxf+/KHH1jUJpKNYNdweNCLqi2ZQp3wK58zbE/eGYc89y+gg2e2Zw
         2TzvKIywR6hVFATfQ83IXPJP8Nn9/QItsOj7m/EAv2KdJu9MOdHgDGL5G+pFnAsSCGJD
         eZ0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t28si325120qth.85.2017.10.20.00.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Oct 2017 00:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5RpR-0002xU-2v
	for alex.bennee@linaro.org; Fri, 20 Oct 2017 03:34:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e5RpJ-0002xC-7Q
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 03:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e5RpF-0007PA-WC
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 03:34:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e5RpF-0007Os-MC; Fri, 20 Oct 2017 03:34:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E30ED5D5F4;
	Fri, 20 Oct 2017 07:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E30ED5D5F4
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 006A360BE1;
	Fri, 20 Oct 2017 07:34:30 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org
References: <cover.1508390588.git.alistair.francis@xilinx.com>
	<9aee5a95c03d6cb4f4ba6359828809ceab535bfb.1508390588.git.alistair.francis@xilinx.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <916ece78-563b-a8bc-37ec-4ee424d7b6ce@redhat.com>
Date: Fri, 20 Oct 2017 09:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <9aee5a95c03d6cb4f4ba6359828809ceab535bfb.1508390588.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 20 Oct 2017 07:34:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, armbru@redhat.com, alistair23@gmail.com,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XYF+MDmj+0Lt

On 19.10.2017 18:18, Alistair Francis wrote:
> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
[...]
>  target/arm/arm-powerctl.c    |  5 +++--
>  target/arm/arm-semi.c        |  3 ++-
>  target/arm/helper.c          |  4 ++--
>  target/arm/kvm.c             | 16 ++++++-------
>  target/arm/kvm32.c           |  2 +-
>  target/arm/kvm64.c           |  2 +-
>  target/arm/translate-a64.c   |  4 ++--
>  target/arm/translate.c       |  2 +-
>  target/cris/helper.c         |  2 +-
>  target/i386/hax-all.c        | 53 ++++++++++++++++++++++--------------=
--------
>  target/i386/hax-darwin.c     | 26 +++++++++++-----------
>  target/i386/hax-mem.c        |  4 ++--
>  target/i386/hax-windows.c    | 43 +++++++++++++++++------------------
>  target/i386/kvm.c            | 38 +++++++++++++++----------------
>  target/i386/misc_helper.c    | 12 +++++-----
>  target/lm32/op_helper.c      |  4 ++--
>  target/mips/mips-semi.c      |  3 ++-
>  target/mips/translate.c      |  2 +-
>  target/ppc/excp_helper.c     |  4 ++--
>  target/ppc/kvm.c             | 34 ++++++++++++++--------------
>  target/ppc/mmu-hash64.c      |  2 +-
>  target/ppc/mmu_helper.c      |  2 +-
>  target/ppc/translate_init.c  | 53 ++++++++++++++++++++++--------------=
--------
>  target/s390x/kvm.c           | 20 ++++++++---------
>  target/s390x/misc_helper.c   |  2 +-
>  target/unicore32/translate.c |  2 +-

If you want to get this committed, it's likely better to split it up
into the individual subsystems and send the patches to the according
maintainers, I think.

>  26 files changed, 175 insertions(+), 169 deletions(-)
>=20
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index 25207cb850..2d56d5d579 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -9,6 +9,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "cpu.h"
>  #include "cpu-qom.h"
>  #include "internals.h"
> @@ -24,7 +25,7 @@
>  #define DPRINTF(fmt, args...) \
>      do { \
>          if (DEBUG_ARM_POWERCTL) { \
> -            fprintf(stderr, "[ARM]%s: " fmt , __func__, ##args); \
> +            error_report("[ARM]%s: " fmt , __func__, ##args); \

Using error_report for debug printing sounds wrong to me. These strings
are not errors. Maybe info_report would be a better choice? ... or maybe
just leave it as fprintf, since this is just a debug macro.

>          } \
>      } while (0)
> =20
> @@ -32,7 +33,7 @@ CPUState *arm_get_cpu_by_id(uint64_t id)
>  {
>      CPUState *cpu;
> =20
> -    DPRINTF("cpu %" PRId64 "\n", id);
> +    DPRINTF("cpu %" PRId64 "", id);
> =20
>      CPU_FOREACH(cpu) {
>          ARMCPU *armcpu =3D ARM_CPU(cpu);

This looks incomplete. There are more DPRINTF statements in this file,
so if you really want to convert this, you've got to touch all of them.

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index a39b9d3633..9c736481f6 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -505,8 +505,8 @@ static inline void assert_fp_access_checked(DisasCo=
ntext *s)
>  {
>  #ifdef CONFIG_DEBUG_TCG
>      if (unlikely(!s->fp_access_checked || s->fp_excp_el)) {
> -        fprintf(stderr, "target-arm: FP access check missing for "
> -                "instruction 0x%08x\n", s->insn);
> +        error_report("target-arm: FP access check missing for "
> +                "instruction 0x%08x", s->insn);

Bad indentation.

>          abort();
>      }
>  #endif
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 4da1a4cbc6..55bdcad97e 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -861,7 +861,7 @@ void arm_test_cc(DisasCompare *cmp, int cc)
>          goto no_invert;
> =20
>      default:
> -        fprintf(stderr, "Bad condition code 0x%x\n", cc);
> +        error_report("Bad condition code 0x%x", cc);
>          abort();
>      }
> =20
> diff --git a/target/cris/helper.c b/target/cris/helper.c
> index af78cca8b9..ba9ce538c3 100644
> --- a/target/cris/helper.c
> +++ b/target/cris/helper.c
> @@ -282,7 +282,7 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs, v=
addr addr)
>      if (!miss) {
>          phy =3D res.phy;
>      }
> -    D(fprintf(stderr, "%s %x -> %x\n", __func__, addr, phy));
> +    D(error_report("%s %x -> %x", __func__, addr, phy));

I think it would be better to remove the D() macro from this file and
turn this statement into a qemu_log_mask(CPU_LOG_MMU, ...).

> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 9d57debf0e..b87f3d6f84 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -159,8 +159,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      cap_ppc_pvr_compat =3D false;
> =20
>      if (!cap_interrupt_level) {
> -        fprintf(stderr, "KVM: Couldn't find level irq capability. Expe=
ct the "
> -                        "VM to stall at times!\n");
> +        error_report("KVM: Couldn't find level irq capability. Expect =
the "
> +                        "VM to stall at times!");
>      }
> =20
>      kvm_ppc_register_host_cpu_type(ms);
> @@ -188,7 +188,7 @@ static int kvm_arch_sync_sregs(PowerPCCPU *cpu)
>          return 0;
>      } else {
>          if (!cap_segstate) {
> -            fprintf(stderr, "kvm error: missing PVR setting capability=
\n");
> +            error_report("kvm error: missing PVR setting capability");
>              return -ENOSYS;
>          }
>      }
> @@ -237,7 +237,7 @@ static int kvm_booke206_tlb_init(PowerPCCPU *cpu)
> =20
>      ret =3D kvm_vcpu_enable_cap(cs, KVM_CAP_SW_TLB, 0, (uintptr_t)&cfg=
);
>      if (ret < 0) {
> -        fprintf(stderr, "%s: couldn't enable KVM_CAP_SW_TLB: %s\n",
> +        error_report("%s: couldn't enable KVM_CAP_SW_TLB: %s",
>                  __func__, strerror(-ret));
>          return ret;
>      }
> @@ -552,7 +552,7 @@ static void kvmppc_hw_debug_points_init(CPUPPCState=
 *cenv)
>      }
> =20
>      if ((max_hw_breakpoint + max_hw_watchpoint) > MAX_HW_BKPTS) {
> -        fprintf(stderr, "Error initializing h/w breakpoints\n");
> +        error_report("Error initializing h/w breakpoints");
>          return;
>      }
>  }
> @@ -623,7 +623,7 @@ static void kvm_sw_tlb_put(PowerPCCPU *cpu)
> =20
>      ret =3D kvm_vcpu_ioctl(cs, KVM_DIRTY_TLB, &dirty_tlb);
>      if (ret) {
> -        fprintf(stderr, "%s: KVM_DIRTY_TLB: %s\n",
> +        error_report("%s: KVM_DIRTY_TLB: %s",
>                  __func__, strerror(-ret));
>      }
> =20
> @@ -1480,7 +1480,7 @@ static int kvmppc_handle_halt(PowerPCCPU *cpu)
>  static int kvmppc_handle_dcr_read(CPUPPCState *env, uint32_t dcrn, uin=
t32_t *data)
>  {
>      if (ppc_dcr_read(env->dcr_env, dcrn, data) < 0)
> -        fprintf(stderr, "Read to unhandled DCR (0x%x)\n", dcrn);
> +        error_report("Read to unhandled DCR (0x%x)", dcrn);
> =20
>      return 0;
>  }
> @@ -1488,7 +1488,7 @@ static int kvmppc_handle_dcr_read(CPUPPCState *en=
v, uint32_t dcrn, uint32_t *dat
>  static int kvmppc_handle_dcr_write(CPUPPCState *env, uint32_t dcrn, ui=
nt32_t data)
>  {
>      if (ppc_dcr_write(env->dcr_env, dcrn, data) < 0)
> -        fprintf(stderr, "Write to unhandled DCR (0x%x)\n", dcrn);
> +        error_report("Write to unhandled DCR (0x%x)", dcrn);
> =20
>      return 0;
>  }
> @@ -1799,7 +1799,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm=
_run *run)
>          break;
> =20
>      default:
> -        fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_rea=
son);
> +        error_report("KVM: unknown exit reason %d", run->exit_reason);
>          ret =3D -1;
>          break;
>      }
> @@ -1863,7 +1863,7 @@ int kvmppc_booke_watchdog_enable(PowerPCCPU *cpu)
> =20
>      ret =3D kvm_vcpu_enable_cap(cs, KVM_CAP_PPC_BOOKE_WATCHDOG, 0);
>      if (ret < 0) {
> -        fprintf(stderr, "%s: couldn't enable KVM_CAP_PPC_BOOKE_WATCHDO=
G: %s\n",
> +        error_report("%s: couldn't enable KVM_CAP_PPC_BOOKE_WATCHDOG: =
%s",
>                  __func__, strerror(-ret));
>          return ret;
>      }
> @@ -2198,7 +2198,7 @@ off_t kvmppc_alloc_rma(void **rma)
> =20
>      fd =3D kvm_vm_ioctl(kvm_state, KVM_ALLOCATE_RMA, &ret);
>      if (fd < 0) {
> -        fprintf(stderr, "KVM: Error on KVM_ALLOCATE_RMA: %s\n",
> +        error_report("KVM: Error on KVM_ALLOCATE_RMA: %s",
>                  strerror(errno));
>          return -1;
>      }
> @@ -2207,7 +2207,7 @@ off_t kvmppc_alloc_rma(void **rma)
> =20
>      *rma =3D mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0)=
;
>      if (*rma =3D=3D MAP_FAILED) {
> -        fprintf(stderr, "KVM: Error mapping RMA: %s\n", strerror(errno=
));
> +        error_report("KVM: Error mapping RMA: %s", strerror(errno));
>          return -1;
>      };
> =20
> @@ -2309,7 +2309,7 @@ void *kvmppc_create_spapr_tce(uint32_t liobn, uin=
t32_t page_shift,
>          }
>          fd =3D kvm_vm_ioctl(kvm_state, KVM_CREATE_SPAPR_TCE, &args);
>          if (fd < 0) {
> -            fprintf(stderr, "KVM: Failed to create TCE table for liobn=
 0x%x\n",
> +            error_report("KVM: Failed to create TCE table for liobn 0x=
%x",
>                      liobn);
>              return NULL;
>          }
> @@ -2322,7 +2322,7 @@ void *kvmppc_create_spapr_tce(uint32_t liobn, uin=
t32_t page_shift,
> =20
>      table =3D mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0)=
;
>      if (table =3D=3D MAP_FAILED) {
> -        fprintf(stderr, "KVM: Failed to map TCE table for liobn 0x%x\n=
",
> +        error_report("KVM: Failed to map TCE table for liobn 0x%x",
>                  liobn);
>          close(fd);
>          return NULL;
> @@ -2584,7 +2584,7 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t =
bufsize, int64_t max_ns)
>      do {
>          rc =3D read(fd, buf, bufsize);
>          if (rc < 0) {
> -            fprintf(stderr, "Error reading data from KVM HTAB fd: %s\n=
",
> +            error_report("Error reading data from KVM HTAB fd: %s",
>                      strerror(errno));
>              return rc;
>          } else if (rc) {
> @@ -2629,13 +2629,13 @@ int kvmppc_load_htab_chunk(QEMUFile *f, int fd,=
 uint32_t index,
> =20
>      rc =3D write(fd, buf, chunksize);
>      if (rc < 0) {
> -        fprintf(stderr, "Error writing KVM hash table: %s\n",
> +        error_report("Error writing KVM hash table: %s",
>                  strerror(errno));
>          return rc;
>      }

Wrong indentation in the above hunks.

> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 14d34e512f..8713ed6682 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -377,7 +377,7 @@ static int ppc_hash64_amr_prot(PowerPCCPU *cpu, ppc=
_hash_pte64_t pte)
>      key =3D HPTE64_R_KEY(pte.pte1);
>      amrbits =3D (env->spr[SPR_AMR] >> 2*(31 - key)) & 0x3;
> =20
> -    /* fprintf(stderr, "AMR protection: key=3D%d AMR=3D0x%" PRIx64 "\n=
", key, */
> +    /* error_report("AMR protection: key=3D%d AMR=3D0x%" PRIx64 "", ke=
y, */
>      /*         env->spr[SPR_AMR]); */

It's just a comment but still - indentation in the second line is wrong
here, too.

 Thomas
