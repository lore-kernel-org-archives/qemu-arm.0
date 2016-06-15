Received: by 10.25.21.96 with SMTP id l93csp346025lfi;
        Tue, 14 Jun 2016 20:03:17 -0700 (PDT)
X-Received: by 10.141.42.1 with SMTP id t1mr23656279qhe.23.1465959797527;
        Tue, 14 Jun 2016 20:03:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 99si20598059qtf.86.2016.06.14.20.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 20:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bD16q-0005E5-MG
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 23:03:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bD16d-00053r-Bo
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 23:03:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bD16Y-0003IT-21
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 23:03:02 -0400
Received: from ozlabs.org ([103.22.144.67]:36985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bD16W-0003H7-VE; Tue, 14 Jun 2016 23:02:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTrt56xb7z9rvt; Wed, 15 Jun 2016 13:02:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465959773;
	bh=rgyGSk72m4aB1KV7NL3m3HK+ZAjfUMPJii1qnMKqL+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/ioauZD3BMZp2qoG/x5C8S70JIzpfixTDa5haxpRUm0C2ZLL6Nh2POeJhNWVXQ/u
	JUWdcyDqgq6H9VeX/8BkckBDFru+R/LFsNyLX1nyV3lggceqq97C1u1ePm3rk0ePqV
	HB2PcsbM8DiVLzXB9RlfCkD56Cv645BfMvxQaxkU=
Date: Wed, 15 Jun 2016 11:05:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Sergey Sorokin <afarallax@yandex.ru>
Message-ID: <20160615010540.GY4882@voom.fritz.box>
References: <1465907177-1399402-1-git-send-email-afarallax@yandex.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I/wet25DnWlSyk1C"
Content-Disposition: inline
In-Reply-To: <1465907177-1399402-1-git-send-email-afarallax@yandex.ru>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v2] Fix confusing argument names in some
 common functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zzcqq8lSuK4K


--I/wet25DnWlSyk1C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 03:26:17PM +0300, Sergey Sorokin wrote:
> There are functions tlb_fill(), cpu_unaligned_access() and
> do_unaligned_access() that are called with access type and mmu index
> arguments. But these arguments are named 'is_write' and 'is_user' in their
> declarations. The patches fix the arguments to avoid a confusion.
>=20
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
> In the second version of the patch a type of access_type argument
> was changed from int to MMUAccessType. To allow it the declaration of
> MMUAccessType was moved from exec/cpu-common.h into qom/cpu.h
> The series of two patches was merged into one.
>=20
>  include/exec/cpu-common.h     |  6 ------
>  include/exec/exec-all.h       |  4 ++--
>  include/qom/cpu.h             | 15 +++++++++++----
>  target-alpha/cpu.h            |  3 ++-
>  target-alpha/mem_helper.c     |  7 ++++---
>  target-arm/internals.h        |  5 +++--
>  target-arm/op_helper.c        | 30 +++++++++++++++++-------------
>  target-cris/op_helper.c       |  6 +++---
>  target-i386/mem_helper.c      |  6 +++---
>  target-lm32/op_helper.c       |  6 +++---
>  target-m68k/op_helper.c       |  6 +++---
>  target-microblaze/op_helper.c |  6 +++---
>  target-mips/cpu.h             |  3 ++-
>  target-mips/op_helper.c       | 10 +++++-----
>  target-moxie/helper.c         |  6 +++---
>  target-openrisc/mmu_helper.c  |  4 ++--
>  target-ppc/mmu_helper.c       |  8 ++++----
>  target-s390x/mem_helper.c     |  6 +++---
>  target-sh4/op_helper.c        |  6 +++---
>  target-sparc/cpu.h            |  7 ++++---
>  target-sparc/ldst_helper.c    | 13 +++++++------
>  target-tricore/op_helper.c    |  6 +++---
>  target-unicore32/op_helper.c  |  4 ++--
>  target-xtensa/cpu.h           |  3 ++-
>  target-xtensa/op_helper.c     | 11 ++++++-----
>  25 files changed, 100 insertions(+), 87 deletions(-)
>=20
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index aaee995..9ac1eaf 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -23,12 +23,6 @@ typedef struct CPUListState {
>      FILE *file;
>  } CPUListState;
> =20
> -typedef enum MMUAccessType {
> -    MMU_DATA_LOAD  =3D 0,
> -    MMU_DATA_STORE =3D 1,
> -    MMU_INST_FETCH =3D 2
> -} MMUAccessType;
> -
>  #if !defined(CONFIG_USER_ONLY)
> =20
>  enum device_endian {
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index c1f59fa..db79ab6 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -361,8 +361,8 @@ extern uintptr_t tci_tb_ptr;
>  struct MemoryRegion *iotlb_to_region(CPUState *cpu,
>                                       hwaddr index, MemTxAttrs attrs);
> =20
> -void tlb_fill(CPUState *cpu, target_ulong addr, int is_write, int mmu_id=
x,
> -              uintptr_t retaddr);
> +void tlb_fill(CPUState *cpu, target_ulong addr, MMUAccessType access_typ=
e,
> +              int mmu_idx, uintptr_t retaddr);
> =20
>  #endif
> =20
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 32f3af3..422ac41 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -60,6 +60,12 @@ typedef uint64_t vaddr;
>  #define CPU_CLASS(class) OBJECT_CLASS_CHECK(CPUClass, (class), TYPE_CPU)
>  #define CPU_GET_CLASS(obj) OBJECT_GET_CLASS(CPUClass, (obj), TYPE_CPU)
> =20
> +typedef enum MMUAccessType {
> +    MMU_DATA_LOAD  =3D 0,
> +    MMU_DATA_STORE =3D 1,
> +    MMU_INST_FETCH =3D 2
> +} MMUAccessType;
> +
>  typedef struct CPUWatchpoint CPUWatchpoint;
> =20
>  typedef void (*CPUUnassignedAccess)(CPUState *cpu, hwaddr addr,
> @@ -142,7 +148,8 @@ typedef struct CPUClass {
>      void (*do_interrupt)(CPUState *cpu);
>      CPUUnassignedAccess do_unassigned_access;
>      void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
> -                                int is_write, int is_user, uintptr_t ret=
addr);
> +                                MMUAccessType access_type,
> +                                int mmu_idx, uintptr_t retaddr);
>      bool (*virtio_is_big_endian)(CPUState *cpu);
>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>                             uint8_t *buf, int len, bool is_write);
> @@ -716,12 +723,12 @@ static inline void cpu_unassigned_access(CPUState *=
cpu, hwaddr addr,
>  }
> =20
>  static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
> -                                        int is_write, int is_user,
> -                                        uintptr_t retaddr)
> +                                        MMUAccessType access_type,
> +                                        int mmu_idx, uintptr_t retaddr)
>  {
>      CPUClass *cc =3D CPU_GET_CLASS(cpu);
> =20
> -    cc->do_unaligned_access(cpu, addr, is_write, is_user, retaddr);
> +    cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
>  }
>  #endif
> =20
> diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
> index e71ea70..cfbb615 100644
> --- a/target-alpha/cpu.h
> +++ b/target-alpha/cpu.h
> @@ -323,7 +323,8 @@ hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, v=
addr addr);
>  int alpha_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                   int is_write, int is_user, uintptr_t =
retaddr);
> +                                   MMUAccessType access_type,
> +                                   int mmu_idx, uintptr_t retaddr);
> =20
>  #define cpu_list alpha_cpu_list
>  #define cpu_exec cpu_alpha_exec
> diff --git a/target-alpha/mem_helper.c b/target-alpha/mem_helper.c
> index 7f4d15f..1b2be50 100644
> --- a/target-alpha/mem_helper.c
> +++ b/target-alpha/mem_helper.c
> @@ -99,7 +99,8 @@ uint64_t helper_stq_c_phys(CPUAlphaState *env, uint64_t=
 p, uint64_t v)
>  }
> =20
>  void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                   int is_write, int is_user, uintptr_t =
retaddr)
> +                                   MMUAccessType access_type,
> +                                   int mmu_idx, uintptr_t retaddr)
>  {
>      AlphaCPU *cpu =3D ALPHA_CPU(cs);
>      CPUAlphaState *env =3D &cpu->env;
> @@ -144,12 +145,12 @@ void alpha_cpu_unassigned_access(CPUState *cs, hwad=
dr addr,
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D alpha_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D alpha_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret !=3D 0)) {
>          if (retaddr) {
>              cpu_restore_state(cs, retaddr);
> diff --git a/target-arm/internals.h b/target-arm/internals.h
> index 728ecba..e0d37da 100644
> --- a/target-arm/internals.h
> +++ b/target-arm/internals.h
> @@ -476,7 +476,8 @@ bool arm_tlb_fill(CPUState *cpu, vaddr address, int r=
w, int mmu_idx,
>  bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx=
);
> =20
>  /* Raise a data fault alignment exception for the specified virtual addr=
ess */
> -void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
> -                                 int is_user, uintptr_t retaddr);
> +void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> +                                 MMUAccessType access_type,
> +                                 int mmu_idx, uintptr_t retaddr);
> =20
>  #endif
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 35912a1..3ee2284 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -79,7 +79,7 @@ uint32_t HELPER(neon_tbl)(CPUARMState *env, uint32_t ir=
eg, uint32_t def,
>  static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>                                              unsigned int target_el,
>                                              bool same_el,
> -                                            bool s1ptw, int is_write,
> +                                            bool s1ptw, bool is_write,
>                                              int fsc)
>  {
>      uint32_t syn;
> @@ -97,7 +97,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t te=
mplate_syn,
>       */
>      if (!(template_syn & ARM_EL_ISV) || target_el !=3D 2 || s1ptw) {
>          syn =3D syn_data_abort_no_iss(same_el,
> -                                    0, 0, s1ptw, is_write =3D=3D 1, fsc);
> +                                    0, 0, s1ptw, is_write, fsc);
>      } else {
>          /* Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the templ=
ate
>           * syndrome created at translation time.
> @@ -105,7 +105,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t =
template_syn,
>           */
>          syn =3D syn_data_abort_with_iss(same_el,
>                                        0, 0, 0, 0, 0,
> -                                      0, 0, s1ptw, is_write =3D=3D 1, fs=
c,
> +                                      0, 0, s1ptw, is_write, fsc,
>                                        false);
>          /* Merge the runtime syndrome with the template syndrome.  */
>          syn |=3D template_syn;
> @@ -117,14 +117,14 @@ static inline uint32_t merge_syn_data_abort(uint32_=
t template_syn,
>   * NULL, it means that the function was called in C code (i.e. not
>   * from generated code or from helper.c)
>   */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      bool ret;
>      uint32_t fsr =3D 0;
>      ARMMMUFaultInfo fi =3D {};
> =20
> -    ret =3D arm_tlb_fill(cs, addr, is_write, mmu_idx, &fsr, &fi);
> +    ret =3D arm_tlb_fill(cs, addr, access_type, mmu_idx, &fsr, &fi);
>      if (unlikely(ret)) {
>          ARMCPU *cpu =3D ARM_CPU(cs);
>          CPUARMState *env =3D &cpu->env;
> @@ -149,13 +149,15 @@ void tlb_fill(CPUState *cs, target_ulong addr, int =
is_write, int mmu_idx,
>          /* For insn and data aborts we assume there is no instruction sy=
ndrome
>           * information; this is always true for exceptions reported to E=
L1.
>           */
> -        if (is_write =3D=3D 2) {
> +        if (access_type =3D=3D MMU_INST_FETCH) {
>              syn =3D syn_insn_abort(same_el, 0, fi.s1ptw, syn);
>              exc =3D EXCP_PREFETCH_ABORT;
>          } else {
>              syn =3D merge_syn_data_abort(env->exception.syndrome, target=
_el,
> -                                       same_el, fi.s1ptw, is_write, syn);
> -            if (is_write =3D=3D 1 && arm_feature(env, ARM_FEATURE_V6)) {
> +                                       same_el, fi.s1ptw,
> +                                       access_type =3D=3D MMU_DATA_STORE=
, syn);
> +            if (access_type =3D=3D MMU_DATA_STORE
> +                && arm_feature(env, ARM_FEATURE_V6)) {
>                  fsr |=3D (1 << 11);
>              }
>              exc =3D EXCP_DATA_ABORT;
> @@ -168,8 +170,9 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is=
_write, int mmu_idx,
>  }
> =20
>  /* Raise a data fault alignment exception for the specified virtual addr=
ess */
> -void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
> -                                 int is_user, uintptr_t retaddr)
> +void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> +                                 MMUAccessType access_type,
> +                                 int mmu_idx, uintptr_t retaddr)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      CPUARMState *env =3D &cpu->env;
> @@ -196,12 +199,13 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vadd=
r vaddr, int is_write,
>          env->exception.fsr =3D 0x1;
>      }
> =20
> -    if (is_write =3D=3D 1 && arm_feature(env, ARM_FEATURE_V6)) {
> +    if (access_type =3D=3D MMU_DATA_STORE && arm_feature(env, ARM_FEATUR=
E_V6)) {
>          env->exception.fsr |=3D (1 << 11);
>      }
> =20
>      syn =3D merge_syn_data_abort(env->exception.syndrome, target_el,
> -                               same_el, 0, is_write, 0x21);
> +                               same_el, 0, access_type =3D=3D MMU_DATA_S=
TORE,
> +                               0x21);
>      raise_exception(env, EXCP_DATA_ABORT, syn, target_el);
>  }
> =20
> diff --git a/target-cris/op_helper.c b/target-cris/op_helper.c
> index 675ab86..5043039 100644
> --- a/target-cris/op_helper.c
> +++ b/target-cris/op_helper.c
> @@ -41,8 +41,8 @@
>  /* Try to fill the TLB and return an exception if error. If retaddr is
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      CRISCPU *cpu =3D CRIS_CPU(cs);
>      CPUCRISState *env =3D &cpu->env;
> @@ -50,7 +50,7 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_w=
rite, int mmu_idx,
> =20
>      D_LOG("%s pc=3D%x tpc=3D%x ra=3D%p\n", __func__,
>            env->pc, env->pregs[PR_EDA], (void *)retaddr);
> -    ret =3D cris_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D cris_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {
>              /* now we have a real cpu fault */
> diff --git a/target-i386/mem_helper.c b/target-i386/mem_helper.c
> index c2f4769..5bc0594 100644
> --- a/target-i386/mem_helper.c
> +++ b/target-i386/mem_helper.c
> @@ -140,12 +140,12 @@ void helper_boundl(CPUX86State *env, target_ulong a=
0, int v)
>   * from generated code or from helper.c)
>   */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D x86_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D x86_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (ret) {
>          X86CPU *cpu =3D X86_CPU(cs);
>          CPUX86State *env =3D &cpu->env;
> diff --git a/target-lm32/op_helper.c b/target-lm32/op_helper.c
> index 7a550d1..2177c8a 100644
> --- a/target-lm32/op_helper.c
> +++ b/target-lm32/op_helper.c
> @@ -144,12 +144,12 @@ uint32_t HELPER(rcsr_jrx)(CPULM32State *env)
>   * NULL, it means that the function was called in C code (i.e. not
>   * from generated code or from helper.c)
>   */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D lm32_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D lm32_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {
>              /* now we have a real cpu fault */
> diff --git a/target-m68k/op_helper.c b/target-m68k/op_helper.c
> index ff32e35..e41ae46 100644
> --- a/target-m68k/op_helper.c
> +++ b/target-m68k/op_helper.c
> @@ -39,12 +39,12 @@ static inline void do_interrupt_m68k_hardirq(CPUM68KS=
tate *env)
>  /* Try to fill the TLB and return an exception if error. If retaddr is
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D m68k_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D m68k_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {
>              /* now we have a real cpu fault */
> diff --git a/target-microblaze/op_helper.c b/target-microblaze/op_helper.c
> index 0533939..c52253d 100644
> --- a/target-microblaze/op_helper.c
> +++ b/target-microblaze/op_helper.c
> @@ -33,12 +33,12 @@
>   * NULL, it means that the function was called in C code (i.e. not
>   * from generated code or from helper.c)
>   */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D mb_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D mb_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {
>              /* now we have a real cpu fault */
> diff --git a/target-mips/cpu.h b/target-mips/cpu.h
> index 4ce9d47..3e6221a 100644
> --- a/target-mips/cpu.h
> +++ b/target-mips/cpu.h
> @@ -651,7 +651,8 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, va=
ddr addr);
>  int mips_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                  int is_write, int is_user, uintptr_t r=
etaddr);
> +                                  MMUAccessType access_type,
> +                                  int mmu_idx, uintptr_t retaddr);
> =20
>  #if !defined(CONFIG_USER_ONLY)
>  int no_mmu_map_address (CPUMIPSState *env, hwaddr *physical, int *prot,
> diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
> index 7cf9807..11ee8ac 100644
> --- a/target-mips/op_helper.c
> +++ b/target-mips/op_helper.c
> @@ -2383,8 +2383,8 @@ void helper_wait(CPUMIPSState *env)
>  #if !defined(CONFIG_USER_ONLY)
> =20
>  void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                  int access_type, int is_user,
> -                                  uintptr_t retaddr)
> +                                  MMUAccessType access_type,
> +                                  int mmu_idx, uintptr_t retaddr)
>  {
>      MIPSCPU *cpu =3D MIPS_CPU(cs);
>      CPUMIPSState *env =3D &cpu->env;
> @@ -2405,12 +2405,12 @@ void mips_cpu_do_unaligned_access(CPUState *cs, v=
addr addr,
>      do_raise_exception_err(env, excp, error_code, retaddr);
>  }
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D mips_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D mips_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (ret) {
>          MIPSCPU *cpu =3D MIPS_CPU(cs);
>          CPUMIPSState *env =3D &cpu->env;
> diff --git a/target-moxie/helper.c b/target-moxie/helper.c
> index d51e9b9..330299f 100644
> --- a/target-moxie/helper.c
> +++ b/target-moxie/helper.c
> @@ -29,12 +29,12 @@
>  /* Try to fill the TLB and return an exception if error. If retaddr is
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D moxie_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D moxie_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {
>              cpu_restore_state(cs, retaddr);
> diff --git a/target-openrisc/mmu_helper.c b/target-openrisc/mmu_helper.c
> index c0658c3..a44d0aa 100644
> --- a/target-openrisc/mmu_helper.c
> +++ b/target-openrisc/mmu_helper.c
> @@ -25,12 +25,12 @@
> =20
>  #ifndef CONFIG_USER_ONLY
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D openrisc_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D openrisc_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx=
);
> =20
>      if (ret) {
>          if (retaddr) {
> diff --git a/target-ppc/mmu_helper.c b/target-ppc/mmu_helper.c
> index 485d5b8..3eb3cd7 100644
> --- a/target-ppc/mmu_helper.c
> +++ b/target-ppc/mmu_helper.c
> @@ -2878,8 +2878,8 @@ void helper_check_tlb_flush(CPUPPCState *env)
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)

If you're using MMUAccessType here..

>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cs);
> @@ -2887,9 +2887,9 @@ void tlb_fill(CPUState *cs, target_ulong addr, int =
is_write, int mmu_idx,
>      int ret;
> =20
>      if (pcc->handle_mmu_fault) {
> -        ret =3D pcc->handle_mmu_fault(cpu, addr, is_write, mmu_idx);
> +        ret =3D pcc->handle_mmu_fault(cpu, addr, access_type, mmu_idx);
>      } else {
> -        ret =3D cpu_ppc_handle_mmu_fault(env, addr, is_write, mmu_idx);
> +        ret =3D cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx=
);

=2E.surely the prototype of cpu_ppc_handle_mmu_fault() and all the
others should be change to use it as well.

>      }
>      if (unlikely(ret !=3D 0)) {
>          if (likely(retaddr)) {
> diff --git a/target-s390x/mem_helper.c b/target-s390x/mem_helper.c
> index ec8059a..99bc5e2 100644
> --- a/target-s390x/mem_helper.c
> +++ b/target-s390x/mem_helper.c
> @@ -36,12 +36,12 @@
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D s390_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D s390_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret !=3D 0)) {
>          if (likely(retaddr)) {
>              /* now we have a real cpu fault */
> diff --git a/target-sh4/op_helper.c b/target-sh4/op_helper.c
> index 303e83e..0204b03 100644
> --- a/target-sh4/op_helper.c
> +++ b/target-sh4/op_helper.c
> @@ -24,12 +24,12 @@
> =20
>  #ifndef CONFIG_USER_ONLY
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D superh_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D superh_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (ret) {
>          /* now we have a real cpu fault */
>          if (retaddr) {
> diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
> index ba37f4b..78c9010 100644
> --- a/target-sparc/cpu.h
> +++ b/target-sparc/cpu.h
> @@ -540,9 +540,10 @@ void sparc_cpu_dump_state(CPUState *cpu, FILE *f,
>  hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int sparc_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> -void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu,
> -                                                 vaddr addr, int is_writ=
e,
> -                                                 int is_user, uintptr_t =
retaddr);
> +void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr ad=
dr,
> +                                                 MMUAccessType access_ty=
pe,
> +                                                 int mmu_idx,
> +                                                 uintptr_t retaddr);
> =20
>  #ifndef NO_CPU_IO_DEFS
>  /* cpu_init.c */
> diff --git a/target-sparc/ldst_helper.c b/target-sparc/ldst_helper.c
> index f73cf6d..e941cac 100644
> --- a/target-sparc/ldst_helper.c
> +++ b/target-sparc/ldst_helper.c
> @@ -2420,9 +2420,10 @@ void sparc_cpu_unassigned_access(CPUState *cs, hwa=
ddr addr,
>  #endif
> =20
>  #if !defined(CONFIG_USER_ONLY)
> -void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs,
> -                                                 vaddr addr, int is_writ=
e,
> -                                                 int is_user, uintptr_t =
retaddr)
> +void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr add=
r,
> +                                                 MMUAccessType access_ty=
pe,
> +                                                 int mmu_idx,
> +                                                 uintptr_t retaddr)
>  {
>      SPARCCPU *cpu =3D SPARC_CPU(cs);
>      CPUSPARCState *env =3D &cpu->env;
> @@ -2441,12 +2442,12 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(=
CPUState *cs,
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D sparc_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D sparc_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (ret) {
>          if (retaddr) {
>              cpu_restore_state(cs, retaddr);
> diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
> index a73ed53..873a123 100644
> --- a/target-tricore/op_helper.c
> +++ b/target-tricore/op_helper.c
> @@ -2833,11 +2833,11 @@ static inline void QEMU_NORETURN do_raise_excepti=
on_err(CPUTriCoreState *env,
>      cpu_loop_exit(cs);
>  }
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> -              uintptr_t retaddr)
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> -    ret =3D cpu_tricore_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D cpu_tricore_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (ret) {
>          TriCoreCPU *cpu =3D TRICORE_CPU(cs);
>          CPUTriCoreState *env =3D &cpu->env;
> diff --git a/target-unicore32/op_helper.c b/target-unicore32/op_helper.c
> index a782d33..0872c29 100644
> --- a/target-unicore32/op_helper.c
> +++ b/target-unicore32/op_helper.c
> @@ -244,12 +244,12 @@ uint32_t HELPER(ror_cc)(CPUUniCore32State *env, uin=
t32_t x, uint32_t i)
>  }
> =20
>  #ifndef CONFIG_USER_ONLY
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
> +void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D uc32_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D uc32_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {
>              /* now we have a real cpu fault */
> diff --git a/target-xtensa/cpu.h b/target-xtensa/cpu.h
> index 442176a..3c1aaf4 100644
> --- a/target-xtensa/cpu.h
> +++ b/target-xtensa/cpu.h
> @@ -414,7 +414,8 @@ hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, =
vaddr addr);
>  int xtensa_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                    int is_write, int is_user, uintptr_t=
 retaddr);
> +                                    MMUAccessType access_type,
> +                                    int mmu_idx, uintptr_t retaddr);
> =20
>  #define cpu_exec cpu_xtensa_exec
>  #define cpu_signal_handler cpu_xtensa_signal_handler
> diff --git a/target-xtensa/op_helper.c b/target-xtensa/op_helper.c
> index bc3667f..0a4b214 100644
> --- a/target-xtensa/op_helper.c
> +++ b/target-xtensa/op_helper.c
> @@ -35,7 +35,8 @@
>  #include "qemu/timer.h"
> =20
>  void xtensa_cpu_do_unaligned_access(CPUState *cs,
> -        vaddr addr, int is_write, int is_user, uintptr_t retaddr)
> +        vaddr addr, MMUAccessType access_type,
> +        int mmu_idx, uintptr_t retaddr)
>  {
>      XtensaCPU *cpu =3D XTENSA_CPU(cs);
>      CPUXtensaState *env =3D &cpu->env;
> @@ -48,19 +49,19 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
>      }
>  }
> =20
> -void tlb_fill(CPUState *cs,
> -              target_ulong vaddr, int is_write, int mmu_idx, uintptr_t r=
etaddr)
> +void tlb_fill(CPUState *cs, target_ulong vaddr, MMUAccessType access_typ=
e,
> +              int mmu_idx, uintptr_t retaddr)
>  {
>      XtensaCPU *cpu =3D XTENSA_CPU(cs);
>      CPUXtensaState *env =3D &cpu->env;
>      uint32_t paddr;
>      uint32_t page_size;
>      unsigned access;
> -    int ret =3D xtensa_get_physical_addr(env, true, vaddr, is_write, mmu=
_idx,
> +    int ret =3D xtensa_get_physical_addr(env, true, vaddr, access_type, =
mmu_idx,
>              &paddr, &page_size, &access);
> =20
>      qemu_log_mask(CPU_LOG_MMU, "%s(%08x, %d, %d) -> %08x, ret =3D %d\n",
> -                  __func__, vaddr, is_write, mmu_idx, paddr, ret);
> +                  __func__, vaddr, access_type, mmu_idx, paddr, ret);
> =20
>      if (ret =3D=3D 0) {
>          tlb_set_page(cs,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--I/wet25DnWlSyk1C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYKnkAAoJEGw4ysog2bOSemIP/RFJdjlsro+Cr+FVDnKV3z4u
NLSXtYx7LuXjfPpBfKGbccuiZ0mHoSnWc6Nokz17p9XKVfihMnn1xyjKjw5V70cf
GLkfONhPWSaKtcyRBJtDqsH7Zh2/fKSOJhTUAsdECJtyK9dcUNgHInkNLAth4i+u
yaEFEJXKz78Eg8Nz+8yAwBENM7KwHsWTHudiTs+/IKzZt7OhwVpJJXClSMBfsBxp
QhjH8q7NpOPXPw+CDRPtqYty5eXkalXUQPF9FCuNGy/+MxG1nD4WPMP468UEoUw6
8JQoVDVyPdEa9a7vV32jvu6Wsdcfkkve+wYQYW/4E/c1DjxnKjWkSyYIxBcB8/6c
wZn/6JwOpCX5nY6zc6H9zgXdrcLlYUYBsXdTRsNnaElf0uwapYqSjbRGveD36lQq
1E2YsDVYcrzliCRn2cwRVQdWAlQ1o7DCaXP6xTnG4U9x/miaUyFefKff39FY/wmL
dsRdFvPMJnXYNWUrJVp4Q2GrXF1pbtQVUm2FnYIX3XFMdgYhS9letBPYossYUEHy
K3BNO/089Xg2RA6cJPhRigz8N77H6/5Kb+VgLKDnnWt24hKoinYWx/EJTIZF692G
XOus+nMYypuLeXuVKZ7OkQL/j/zgMxGMkpQCb7xkQKYuzyYxXI2mwaDj/7jSwecX
y5xNAydF77mYezD0Y8jx
=i5Zz
-----END PGP SIGNATURE-----

--I/wet25DnWlSyk1C--
