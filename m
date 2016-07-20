Received: by 10.25.21.156 with SMTP id 28csp2137630lfv;
        Wed, 20 Jul 2016 05:58:15 -0700 (PDT)
X-Received: by 10.98.87.90 with SMTP id l87mr46002157pfb.133.1469019495136;
        Wed, 20 Jul 2016 05:58:15 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id zo9si3303592pac.196.2016.07.20.05.58.14;
        Wed, 20 Jul 2016 05:58:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1753848AbcGTM6M (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 08:58:12 -0400
Received: from ozlabs.org ([103.22.144.67]:33276 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753148AbcGTM6J (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 08:58:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rvcQl4z66z9t17; Wed, 20 Jul 2016 22:58:07 +1000 (AEST)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1469019487;
	bh=UFpECSpqDG/PVNk6AHVD/Kl1eMDdKKoUHU4fG8Dh6tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jj/ZBDj7N5HoDdOgBVPJW6WkZnYq/Xlg5Jv4GRGsW/wd6nnRfx4j0jmPCUDrUuS/q
	 354Ejew0ciZtCvBdjwUZCBVk0n/S3SUKecz2aHJsZBlpN4vxl5ZzPQMxihnrE+wxia
	 hdyBoyYKRe50Ly+4xNvDHoUb4k+PH+Lz/yHLoef8=
Date:	Wed, 20 Jul 2016 19:34:28 +1000
From:	David Gibson <david@gibson.dropbear.id.au>
To:	Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH v3 05/10] Rename MMUAccessType to MemoryAccessType
Message-ID: <20160720093428.GE27358@voom.fritz.box>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
 <1468990980-4598-6-git-send-email-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Content-Disposition: inline
In-Reply-To: <1468990980-4598-6-git-send-email-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: ZpqA/YX+XlkW


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 10:02:55PM -0700, Andrey Smirnov wrote:
> Rename MMUAccessType to MemoryAccessType and MMU_*
> constants to corresponding MEM_* constants, so it would be possible to
> re-use these defenitions in other, non MMU-related, contexts.
>=20
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/exec/exec-all.h       |  2 +-
>  include/qom/cpu.h             | 14 +++++++-------
>  softmmu_template.h            | 18 +++++++++---------
>  target-alpha/cpu.h            |  2 +-
>  target-alpha/mem_helper.c     |  4 ++--
>  target-arm/internals.h        |  2 +-
>  target-arm/op_helper.c        | 14 +++++++-------
>  target-cris/op_helper.c       |  2 +-
>  target-i386/mem_helper.c      |  2 +-
>  target-lm32/op_helper.c       |  2 +-
>  target-m68k/op_helper.c       |  2 +-
>  target-microblaze/op_helper.c |  2 +-
>  target-mips/cpu.h             |  2 +-
>  target-mips/helper.c          | 14 +++++++-------
>  target-mips/op_helper.c       |  8 ++++----
>  target-moxie/helper.c         |  2 +-
>  target-openrisc/mmu_helper.c  |  2 +-
>  target-ppc/mmu_helper.c       |  2 +-
>  target-s390x/helper.c         |  2 +-
>  target-s390x/mem_helper.c     |  8 ++++----
>  target-s390x/mmu_helper.c     | 10 +++++-----
>  target-sh4/op_helper.c        |  2 +-
>  target-sparc/cpu.h            |  2 +-
>  target-sparc/ldst_helper.c    |  4 ++--
>  target-tricore/op_helper.c    |  2 +-
>  target-unicore32/op_helper.c  |  2 +-
>  target-xtensa/cpu.h           |  2 +-
>  target-xtensa/op_helper.c     |  4 ++--
>  28 files changed, 67 insertions(+), 67 deletions(-)
>=20
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index acda7b6..1d5c71e 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -361,7 +361,7 @@ extern uintptr_t tci_tb_ptr;
>  struct MemoryRegion *iotlb_to_region(CPUState *cpu,
>                                       hwaddr index, MemTxAttrs attrs);
> =20
> -void tlb_fill(CPUState *cpu, target_ulong addr, MMUAccessType access_typ=
e,
> +void tlb_fill(CPUState *cpu, target_ulong addr, MemoryAccessType access_=
type,
>                int mmu_idx, uintptr_t retaddr);
> =20
>  #endif
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index a6c6ed8..b23b4b1 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -60,11 +60,11 @@ typedef uint64_t vaddr;
>  #define CPU_CLASS(class) OBJECT_CLASS_CHECK(CPUClass, (class), TYPE_CPU)
>  #define CPU_GET_CLASS(obj) OBJECT_GET_CLASS(CPUClass, (obj), TYPE_CPU)
> =20
> -typedef enum MMUAccessType {
> -    MMU_DATA_LOAD  =3D 0,
> -    MMU_DATA_STORE =3D 1,
> -    MMU_INST_FETCH =3D 2
> -} MMUAccessType;
> +typedef enum MemoryAccessType {
> +    MEM_DATA_LOAD  =3D 0,
> +    MEM_DATA_STORE =3D 1,
> +    MEM_INST_FETCH =3D 2
> +} MemoryAccessType;
> =20
>  typedef struct CPUWatchpoint CPUWatchpoint;
> =20
> @@ -148,7 +148,7 @@ typedef struct CPUClass {
>      void (*do_interrupt)(CPUState *cpu);
>      CPUUnassignedAccess do_unassigned_access;
>      void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
> -                                MMUAccessType access_type,
> +                                MemoryAccessType access_type,
>                                  int mmu_idx, uintptr_t retaddr);
>      bool (*virtio_is_big_endian)(CPUState *cpu);
>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
> @@ -723,7 +723,7 @@ static inline void cpu_unassigned_access(CPUState *cp=
u, hwaddr addr,
>  }
> =20
>  static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
> -                                        MMUAccessType access_type,
> +                                        MemoryAccessType access_type,
>                                          int mmu_idx, uintptr_t retaddr)
>  {
>      CPUClass *cc =3D CPU_GET_CLASS(cpu);
> diff --git a/softmmu_template.h b/softmmu_template.h
> index 284ab2c..e872a21 100644
> --- a/softmmu_template.h
> +++ b/softmmu_template.h
> @@ -67,10 +67,10 @@
>  #endif
> =20
>  #ifdef SOFTMMU_CODE_ACCESS
> -#define READ_ACCESS_TYPE MMU_INST_FETCH
> +#define READ_ACCESS_TYPE MEM_INST_FETCH
>  #define ADDR_READ addr_code
>  #else
> -#define READ_ACCESS_TYPE MMU_DATA_LOAD
> +#define READ_ACCESS_TYPE MEM_DATA_LOAD
>  #define ADDR_READ addr_read
>  #endif
> =20
> @@ -338,7 +338,7 @@ void helper_le_st_name(CPUArchState *env, target_ulon=
g addr, DATA_TYPE val,
>      retaddr -=3D GETPC_ADJ;
> =20
>      if (a_bits > 0 && (addr & ((1 << a_bits) - 1)) !=3D 0) {
> -        cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
> +        cpu_unaligned_access(ENV_GET_CPU(env), addr, MEM_DATA_STORE,
>                               mmu_idx, retaddr);
>      }
> =20
> @@ -346,7 +346,7 @@ void helper_le_st_name(CPUArchState *env, target_ulon=
g addr, DATA_TYPE val,
>      if ((addr & TARGET_PAGE_MASK)
>          !=3D (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK))) {
>          if (!VICTIM_TLB_HIT(addr_write, addr)) {
> -            tlb_fill(ENV_GET_CPU(env), addr, MMU_DATA_STORE, mmu_idx, re=
taddr);
> +            tlb_fill(ENV_GET_CPU(env), addr, MEM_DATA_STORE, mmu_idx, re=
taddr);
>          }
>          tlb_addr =3D env->tlb_table[mmu_idx][index].addr_write;
>      }
> @@ -381,7 +381,7 @@ void helper_le_st_name(CPUArchState *env, target_ulon=
g addr, DATA_TYPE val,
>          tlb_addr2 =3D env->tlb_table[mmu_idx][index2].addr_write;
>          if (page2 !=3D (tlb_addr2 & (TARGET_PAGE_MASK | TLB_INVALID_MASK=
))
>              && !VICTIM_TLB_HIT(addr_write, page2)) {
> -            tlb_fill(ENV_GET_CPU(env), page2, MMU_DATA_STORE,
> +            tlb_fill(ENV_GET_CPU(env), page2, MEM_DATA_STORE,
>                       mmu_idx, retaddr);
>          }
> =20
> @@ -421,7 +421,7 @@ void helper_be_st_name(CPUArchState *env, target_ulon=
g addr, DATA_TYPE val,
>      retaddr -=3D GETPC_ADJ;
> =20
>      if (a_bits > 0 && (addr & ((1 << a_bits) - 1)) !=3D 0) {
> -        cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
> +        cpu_unaligned_access(ENV_GET_CPU(env), addr, MEM_DATA_STORE,
>                               mmu_idx, retaddr);
>      }
> =20
> @@ -429,7 +429,7 @@ void helper_be_st_name(CPUArchState *env, target_ulon=
g addr, DATA_TYPE val,
>      if ((addr & TARGET_PAGE_MASK)
>          !=3D (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK))) {
>          if (!VICTIM_TLB_HIT(addr_write, addr)) {
> -            tlb_fill(ENV_GET_CPU(env), addr, MMU_DATA_STORE, mmu_idx, re=
taddr);
> +            tlb_fill(ENV_GET_CPU(env), addr, MEM_DATA_STORE, mmu_idx, re=
taddr);
>          }
>          tlb_addr =3D env->tlb_table[mmu_idx][index].addr_write;
>      }
> @@ -464,7 +464,7 @@ void helper_be_st_name(CPUArchState *env, target_ulon=
g addr, DATA_TYPE val,
>          tlb_addr2 =3D env->tlb_table[mmu_idx][index2].addr_write;
>          if (page2 !=3D (tlb_addr2 & (TARGET_PAGE_MASK | TLB_INVALID_MASK=
))
>              && !VICTIM_TLB_HIT(addr_write, page2)) {
> -            tlb_fill(ENV_GET_CPU(env), page2, MMU_DATA_STORE,
> +            tlb_fill(ENV_GET_CPU(env), page2, MEM_DATA_STORE,
>                       mmu_idx, retaddr);
>          }
> =20
> @@ -504,7 +504,7 @@ void probe_write(CPUArchState *env, target_ulong addr=
, int mmu_idx,
>          !=3D (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK))) {
>          /* TLB entry is for a different page */
>          if (!VICTIM_TLB_HIT(addr_write, addr)) {
> -            tlb_fill(ENV_GET_CPU(env), addr, MMU_DATA_STORE, mmu_idx, re=
taddr);
> +            tlb_fill(ENV_GET_CPU(env), addr, MEM_DATA_STORE, mmu_idx, re=
taddr);
>          }
>      }
>  }
> diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
> index ac5e801..700f616 100644
> --- a/target-alpha/cpu.h
> +++ b/target-alpha/cpu.h
> @@ -323,7 +323,7 @@ hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, v=
addr addr);
>  int alpha_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                   MMUAccessType access_type,
> +                                   MemoryAccessType access_type,
>                                     int mmu_idx, uintptr_t retaddr);
> =20
>  #define cpu_list alpha_cpu_list
> diff --git a/target-alpha/mem_helper.c b/target-alpha/mem_helper.c
> index 1b2be50..d6ffabe 100644
> --- a/target-alpha/mem_helper.c
> +++ b/target-alpha/mem_helper.c
> @@ -99,7 +99,7 @@ uint64_t helper_stq_c_phys(CPUAlphaState *env, uint64_t=
 p, uint64_t v)
>  }
> =20
>  void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                   MMUAccessType access_type,
> +                                   MemoryAccessType access_type,
>                                     int mmu_idx, uintptr_t retaddr)
>  {
>      AlphaCPU *cpu =3D ALPHA_CPU(cs);
> @@ -145,7 +145,7 @@ void alpha_cpu_unassigned_access(CPUState *cs, hwaddr=
 addr,
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-arm/internals.h b/target-arm/internals.h
> index cd57401..d6fafc5 100644
> --- a/target-arm/internals.h
> +++ b/target-arm/internals.h
> @@ -477,7 +477,7 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env=
, ARMMMUIdx mmu_idx);
> =20
>  /* Raise a data fault alignment exception for the specified virtual addr=
ess */
>  void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> -                                 MMUAccessType access_type,
> +                                 MemoryAccessType access_type,
>                                   int mmu_idx, uintptr_t retaddr);
> =20
>  /* Call the EL change hook if one has been registered */
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 3e8588e..74526a2 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -117,7 +117,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t =
template_syn,
>   * NULL, it means that the function was called in C code (i.e. not
>   * from generated code or from helper.c)
>   */
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      bool ret;
> @@ -149,14 +149,14 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUA=
ccessType access_type,
>          /* For insn and data aborts we assume there is no instruction sy=
ndrome
>           * information; this is always true for exceptions reported to E=
L1.
>           */
> -        if (access_type =3D=3D MMU_INST_FETCH) {
> +        if (access_type =3D=3D MEM_INST_FETCH) {
>              syn =3D syn_insn_abort(same_el, 0, fi.s1ptw, syn);
>              exc =3D EXCP_PREFETCH_ABORT;
>          } else {
>              syn =3D merge_syn_data_abort(env->exception.syndrome, target=
_el,
>                                         same_el, fi.s1ptw,
> -                                       access_type =3D=3D MMU_DATA_STORE=
, syn);
> -            if (access_type =3D=3D MMU_DATA_STORE
> +                                       access_type =3D=3D MEM_DATA_STORE=
, syn);
> +            if (access_type =3D=3D MEM_DATA_STORE
>                  && arm_feature(env, ARM_FEATURE_V6)) {
>                  fsr |=3D (1 << 11);
>              }
> @@ -171,7 +171,7 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAcc=
essType access_type,
> =20
>  /* Raise a data fault alignment exception for the specified virtual addr=
ess */
>  void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> -                                 MMUAccessType access_type,
> +                                 MemoryAccessType access_type,
>                                   int mmu_idx, uintptr_t retaddr)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
> @@ -199,12 +199,12 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vadd=
r vaddr,
>          env->exception.fsr =3D 0x1;
>      }
> =20
> -    if (access_type =3D=3D MMU_DATA_STORE && arm_feature(env, ARM_FEATUR=
E_V6)) {
> +    if (access_type =3D=3D MEM_DATA_STORE && arm_feature(env, ARM_FEATUR=
E_V6)) {
>          env->exception.fsr |=3D (1 << 11);
>      }
> =20
>      syn =3D merge_syn_data_abort(env->exception.syndrome, target_el,
> -                               same_el, 0, access_type =3D=3D MMU_DATA_S=
TORE,
> +                               same_el, 0, access_type =3D=3D MEM_DATA_S=
TORE,
>                                 0x21);
>      raise_exception(env, EXCP_DATA_ABORT, syn, target_el);
>  }
> diff --git a/target-cris/op_helper.c b/target-cris/op_helper.c
> index 5043039..c83e955 100644
> --- a/target-cris/op_helper.c
> +++ b/target-cris/op_helper.c
> @@ -41,7 +41,7 @@
>  /* Try to fill the TLB and return an exception if error. If retaddr is
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      CRISCPU *cpu =3D CRIS_CPU(cs);
> diff --git a/target-i386/mem_helper.c b/target-i386/mem_helper.c
> index 5bc0594..679322c 100644
> --- a/target-i386/mem_helper.c
> +++ b/target-i386/mem_helper.c
> @@ -140,7 +140,7 @@ void helper_boundl(CPUX86State *env, target_ulong a0,=
 int v)
>   * from generated code or from helper.c)
>   */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-lm32/op_helper.c b/target-lm32/op_helper.c
> index 2177c8a..bc78f3c 100644
> --- a/target-lm32/op_helper.c
> +++ b/target-lm32/op_helper.c
> @@ -144,7 +144,7 @@ uint32_t HELPER(rcsr_jrx)(CPULM32State *env)
>   * NULL, it means that the function was called in C code (i.e. not
>   * from generated code or from helper.c)
>   */
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-m68k/op_helper.c b/target-m68k/op_helper.c
> index e41ae46..43f556e 100644
> --- a/target-m68k/op_helper.c
> +++ b/target-m68k/op_helper.c
> @@ -39,7 +39,7 @@ static inline void do_interrupt_m68k_hardirq(CPUM68KSta=
te *env)
>  /* Try to fill the TLB and return an exception if error. If retaddr is
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-microblaze/op_helper.c b/target-microblaze/op_helper.c
> index 4a856e6..1e1690a 100644
> --- a/target-microblaze/op_helper.c
> +++ b/target-microblaze/op_helper.c
> @@ -33,7 +33,7 @@
>   * NULL, it means that the function was called in C code (i.e. not
>   * from generated code or from helper.c)
>   */
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-mips/cpu.h b/target-mips/cpu.h
> index 5182dc7..55a3e34 100644
> --- a/target-mips/cpu.h
> +++ b/target-mips/cpu.h
> @@ -657,7 +657,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, va=
ddr addr);
>  int mips_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                  MMUAccessType access_type,
> +                                  MemoryAccessType access_type,
>                                    int mmu_idx, uintptr_t retaddr);
> =20
>  #if !defined(CONFIG_USER_ONLY)
> diff --git a/target-mips/helper.c b/target-mips/helper.c
> index 9fbca26..bd3f7cd 100644
> --- a/target-mips/helper.c
> +++ b/target-mips/helper.c
> @@ -88,13 +88,13 @@ int r4k_map_address (CPUMIPSState *env, hwaddr *physi=
cal, int *prot,
>              if (!(n ? tlb->V1 : tlb->V0)) {
>                  return TLBRET_INVALID;
>              }
> -            if (rw =3D=3D MMU_INST_FETCH && (n ? tlb->XI1 : tlb->XI0)) {
> +            if (rw =3D=3D MEM_INST_FETCH && (n ? tlb->XI1 : tlb->XI0)) {
>                  return TLBRET_XI;
>              }
> -            if (rw =3D=3D MMU_DATA_LOAD && (n ? tlb->RI1 : tlb->RI0)) {
> +            if (rw =3D=3D MEM_DATA_LOAD && (n ? tlb->RI1 : tlb->RI0)) {
>                  return TLBRET_RI;
>              }
> -            if (rw !=3D MMU_DATA_STORE || (n ? tlb->D1 : tlb->D0)) {
> +            if (rw !=3D MEM_DATA_STORE || (n ? tlb->D1 : tlb->D0)) {
>                  *physical =3D tlb->PFN[n] | (address & (mask >> 1));
>                  *prot =3D PAGE_READ;
>                  if (n ? tlb->D1 : tlb->D0)
> @@ -338,7 +338,7 @@ static void raise_mmu_exception(CPUMIPSState *env, ta=
rget_ulong address,
>      CPUState *cs =3D CPU(mips_env_get_cpu(env));
>      int exception =3D 0, error_code =3D 0;
> =20
> -    if (rw =3D=3D MMU_INST_FETCH) {
> +    if (rw =3D=3D MEM_INST_FETCH) {
>          error_code |=3D EXCP_INST_NOTAVAIL;
>      }
> =20
> @@ -347,7 +347,7 @@ static void raise_mmu_exception(CPUMIPSState *env, ta=
rget_ulong address,
>      case TLBRET_BADADDR:
>          /* Reference to kernel address from user mode or supervisor mode=
 */
>          /* Reference to supervisor address from user mode */
> -        if (rw =3D=3D MMU_DATA_STORE) {
> +        if (rw =3D=3D MEM_DATA_STORE) {
>              exception =3D EXCP_AdES;
>          } else {
>              exception =3D EXCP_AdEL;
> @@ -355,7 +355,7 @@ static void raise_mmu_exception(CPUMIPSState *env, ta=
rget_ulong address,
>          break;
>      case TLBRET_NOMATCH:
>          /* No TLB match for a mapped address */
> -        if (rw =3D=3D MMU_DATA_STORE) {
> +        if (rw =3D=3D MEM_DATA_STORE) {
>              exception =3D EXCP_TLBS;
>          } else {
>              exception =3D EXCP_TLBL;
> @@ -364,7 +364,7 @@ static void raise_mmu_exception(CPUMIPSState *env, ta=
rget_ulong address,
>          break;
>      case TLBRET_INVALID:
>          /* TLB match with no valid bit */
> -        if (rw =3D=3D MMU_DATA_STORE) {
> +        if (rw =3D=3D MEM_DATA_STORE) {
>              exception =3D EXCP_TLBS;
>          } else {
>              exception =3D EXCP_TLBL;
> diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
> index ea2f2ab..dd705f2 100644
> --- a/target-mips/op_helper.c
> +++ b/target-mips/op_helper.c
> @@ -2384,7 +2384,7 @@ void helper_wait(CPUMIPSState *env)
>  #if !defined(CONFIG_USER_ONLY)
> =20
>  void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                  MMUAccessType access_type,
> +                                  MemoryAccessType access_type,
>                                    int mmu_idx, uintptr_t retaddr)
>  {
>      MIPSCPU *cpu =3D MIPS_CPU(cs);
> @@ -2394,11 +2394,11 @@ void mips_cpu_do_unaligned_access(CPUState *cs, v=
addr addr,
> =20
>      env->CP0_BadVAddr =3D addr;
> =20
> -    if (access_type =3D=3D MMU_DATA_STORE) {
> +    if (access_type =3D=3D MEM_DATA_STORE) {
>          excp =3D EXCP_AdES;
>      } else {
>          excp =3D EXCP_AdEL;
> -        if (access_type =3D=3D MMU_INST_FETCH) {
> +        if (access_type =3D=3D MEM_INST_FETCH) {
>              error_code |=3D EXCP_INST_NOTAVAIL;
>          }
>      }
> @@ -2406,7 +2406,7 @@ void mips_cpu_do_unaligned_access(CPUState *cs, vad=
dr addr,
>      do_raise_exception_err(env, excp, error_code, retaddr);
>  }
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-moxie/helper.c b/target-moxie/helper.c
> index 330299f..a7b7b08 100644
> --- a/target-moxie/helper.c
> +++ b/target-moxie/helper.c
> @@ -29,7 +29,7 @@
>  /* Try to fill the TLB and return an exception if error. If retaddr is
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-openrisc/mmu_helper.c b/target-openrisc/mmu_helper.c
> index a44d0aa..e26116c 100644
> --- a/target-openrisc/mmu_helper.c
> +++ b/target-openrisc/mmu_helper.c
> @@ -25,7 +25,7 @@
> =20
>  #ifndef CONFIG_USER_ONLY
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-ppc/mmu_helper.c b/target-ppc/mmu_helper.c
> index 3eb3cd7..be436c1 100644
> --- a/target-ppc/mmu_helper.c
> +++ b/target-ppc/mmu_helper.c
> @@ -2878,7 +2878,7 @@ void helper_check_tlb_flush(CPUPPCState *env)
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> diff --git a/target-s390x/helper.c b/target-s390x/helper.c
> index 54a5177..136c6be 100644
> --- a/target-s390x/helper.c
> +++ b/target-s390x/helper.c
> @@ -199,7 +199,7 @@ hwaddr s390_cpu_get_phys_page_debug(CPUState *cs, vad=
dr vaddr)
>          vaddr &=3D 0x7fffffff;
>      }
> =20
> -    if (mmu_translate(env, vaddr, MMU_INST_FETCH, asc, &raddr, &prot, fa=
lse)) {
> +    if (mmu_translate(env, vaddr, MEM_INST_FETCH, asc, &raddr, &prot, fa=
lse)) {
>          return -1;
>      }
>      return raddr;
> diff --git a/target-s390x/mem_helper.c b/target-s390x/mem_helper.c
> index 99bc5e2..c56cfa0 100644
> --- a/target-s390x/mem_helper.c
> +++ b/target-s390x/mem_helper.c
> @@ -36,7 +36,7 @@
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> @@ -77,7 +77,7 @@ static void fast_memset(CPUS390XState *env, uint64_t de=
st, uint8_t byte,
>      int mmu_idx =3D cpu_mmu_index(env, false);
> =20
>      while (l > 0) {
> -        void *p =3D tlb_vaddr_to_host(env, dest, MMU_DATA_STORE, mmu_idx=
);
> +        void *p =3D tlb_vaddr_to_host(env, dest, MEM_DATA_STORE, mmu_idx=
);
>          if (p) {
>              /* Access to the whole page in write mode granted.  */
>              int l_adj =3D adj_len_to_page(l, dest);
> @@ -100,8 +100,8 @@ static void fast_memmove(CPUS390XState *env, uint64_t=
 dest, uint64_t src,
>      int mmu_idx =3D cpu_mmu_index(env, false);
> =20
>      while (l > 0) {
> -        void *src_p =3D tlb_vaddr_to_host(env, src, MMU_DATA_LOAD, mmu_i=
dx);
> -        void *dest_p =3D tlb_vaddr_to_host(env, dest, MMU_DATA_STORE, mm=
u_idx);
> +        void *src_p =3D tlb_vaddr_to_host(env, src, MEM_DATA_LOAD, mmu_i=
dx);
> +        void *dest_p =3D tlb_vaddr_to_host(env, dest, MEM_DATA_STORE, mm=
u_idx);
>          if (src_p && dest_p) {
>              /* Access to both whole pages granted.  */
>              int l_adj =3D adj_len_to_page(l, src);
> diff --git a/target-s390x/mmu_helper.c b/target-s390x/mmu_helper.c
> index b11a027..5324dfb 100644
> --- a/target-s390x/mmu_helper.c
> +++ b/target-s390x/mmu_helper.c
> @@ -71,7 +71,7 @@ static void trigger_prot_fault(CPUS390XState *env, targ=
et_ulong vaddr,
>  {
>      uint64_t tec;
> =20
> -    tec =3D vaddr | (rw =3D=3D MMU_DATA_STORE ? FS_WRITE : FS_READ) | 4 =
| asc >> 46;
> +    tec =3D vaddr | (rw =3D=3D MEM_DATA_STORE ? FS_WRITE : FS_READ) | 4 =
| asc >> 46;
> =20
>      DPRINTF("%s: trans_exc_code=3D%016" PRIx64 "\n", __func__, tec);
> =20
> @@ -88,7 +88,7 @@ static void trigger_page_fault(CPUS390XState *env, targ=
et_ulong vaddr,
>      int ilen =3D ILEN_LATER;
>      uint64_t tec;
> =20
> -    tec =3D vaddr | (rw =3D=3D MMU_DATA_STORE ? FS_WRITE : FS_READ) | as=
c >> 46;
> +    tec =3D vaddr | (rw =3D=3D MEM_DATA_STORE ? FS_WRITE : FS_READ) | as=
c >> 46;
> =20
>      DPRINTF("%s: trans_exc_code=3D%016" PRIx64 "\n", __func__, tec);
> =20
> @@ -97,7 +97,7 @@ static void trigger_page_fault(CPUS390XState *env, targ=
et_ulong vaddr,
>      }
> =20
>      /* Code accesses have an undefined ilc.  */
> -    if (rw =3D=3D MMU_INST_FETCH) {
> +    if (rw =3D=3D MEM_INST_FETCH) {
>          ilen =3D 2;
>      }
> =20
> @@ -291,7 +291,7 @@ static int mmu_translate_asce(CPUS390XState *env, tar=
get_ulong vaddr,
> =20
>      r =3D mmu_translate_region(env, vaddr, asc, asce, level, raddr, flag=
s, rw,
>                               exc);
> -    if (rw =3D=3D MMU_DATA_STORE && !(*flags & PAGE_WRITE)) {
> +    if (rw =3D=3D MEM_DATA_STORE && !(*flags & PAGE_WRITE)) {
>          trigger_prot_fault(env, vaddr, asc, rw, exc);
>          return -1;
>      }
> @@ -348,7 +348,7 @@ int mmu_translate(CPUS390XState *env, target_ulong va=
ddr, int rw, uint64_t asc,
>           * Instruction: Primary
>           * Data: Secondary
>           */
> -        if (rw =3D=3D MMU_INST_FETCH) {
> +        if (rw =3D=3D MEM_INST_FETCH) {
>              r =3D mmu_translate_asce(env, vaddr, PSW_ASC_PRIMARY, env->c=
regs[1],
>                                     raddr, flags, rw, exc);
>              *flags &=3D ~(PAGE_READ | PAGE_WRITE);
> diff --git a/target-sh4/op_helper.c b/target-sh4/op_helper.c
> index 0204b03..b00addd 100644
> --- a/target-sh4/op_helper.c
> +++ b/target-sh4/op_helper.c
> @@ -24,7 +24,7 @@
> =20
>  #ifndef CONFIG_USER_ONLY
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
> index a3d64a4..5134f1d 100644
> --- a/target-sparc/cpu.h
> +++ b/target-sparc/cpu.h
> @@ -541,7 +541,7 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, v=
addr addr);
>  int sparc_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr ad=
dr,
> -                                                 MMUAccessType access_ty=
pe,
> +                                                 MemoryAccessType access=
_type,
>                                                   int mmu_idx,
>                                                   uintptr_t retaddr);
> =20
> diff --git a/target-sparc/ldst_helper.c b/target-sparc/ldst_helper.c
> index 6ce5ccc..042227c 100644
> --- a/target-sparc/ldst_helper.c
> +++ b/target-sparc/ldst_helper.c
> @@ -2351,7 +2351,7 @@ void sparc_cpu_unassigned_access(CPUState *cs, hwad=
dr addr,
> =20
>  #if !defined(CONFIG_USER_ONLY)
>  void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr add=
r,
> -                                                 MMUAccessType access_ty=
pe,
> +                                                 MemoryAccessType access=
_type,
>                                                   int mmu_idx,
>                                                   uintptr_t retaddr)
>  {
> @@ -2372,7 +2372,7 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CP=
UState *cs, vaddr addr,
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
> index ac02e0a..ead24e7 100644
> --- a/target-tricore/op_helper.c
> +++ b/target-tricore/op_helper.c
> @@ -2828,7 +2828,7 @@ static inline void QEMU_NORETURN do_raise_exception=
_err(CPUTriCoreState *env,
>      cpu_loop_exit(cs);
>  }
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-unicore32/op_helper.c b/target-unicore32/op_helper.c
> index 0872c29..1927efe 100644
> --- a/target-unicore32/op_helper.c
> +++ b/target-unicore32/op_helper.c
> @@ -244,7 +244,7 @@ uint32_t HELPER(ror_cc)(CPUUniCore32State *env, uint3=
2_t x, uint32_t i)
>  }
> =20
>  #ifndef CONFIG_USER_ONLY
> -void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
> +void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_t=
ype,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> diff --git a/target-xtensa/cpu.h b/target-xtensa/cpu.h
> index 7fe82a3..22c4471 100644
> --- a/target-xtensa/cpu.h
> +++ b/target-xtensa/cpu.h
> @@ -414,7 +414,7 @@ hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, =
vaddr addr);
>  int xtensa_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                    MMUAccessType access_type,
> +                                    MemoryAccessType access_type,
>                                      int mmu_idx, uintptr_t retaddr);
> =20
>  #define cpu_signal_handler cpu_xtensa_signal_handler
> diff --git a/target-xtensa/op_helper.c b/target-xtensa/op_helper.c
> index 0a4b214..11e0432 100644
> --- a/target-xtensa/op_helper.c
> +++ b/target-xtensa/op_helper.c
> @@ -35,7 +35,7 @@
>  #include "qemu/timer.h"
> =20
>  void xtensa_cpu_do_unaligned_access(CPUState *cs,
> -        vaddr addr, MMUAccessType access_type,
> +        vaddr addr, MemoryAccessType access_type,
>          int mmu_idx, uintptr_t retaddr)
>  {
>      XtensaCPU *cpu =3D XTENSA_CPU(cs);
> @@ -49,7 +49,7 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
>      }
>  }
> =20
> -void tlb_fill(CPUState *cs, target_ulong vaddr, MMUAccessType access_typ=
e,
> +void tlb_fill(CPUState *cs, target_ulong vaddr, MemoryAccessType access_=
type,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      XtensaCPU *cpu =3D XTENSA_CPU(cs);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj0WkAAoJEGw4ysog2bOSwSMP/jF8laRkYVTzF3HzjMuouAv7
HihULr9YdhoyV3rcPXFAU6ifVS+dNYZSFs9j6eYtL2sODcxJFnT7oK73lJ2dZ2AQ
ogfDw0Wwq5uLvntqWLDjA25G9Vga3fB1rH4S9RcK2gKuVqvHj6m6OfYABCtHlphq
oyGhSH1nsAVilyGXWkEkzL58bp7zRXAAUG+UqGt41LX9WCSOm3/BIB/suNtcNlZ3
cILjstNQKnBv6c8Ww7QxfaPh1drB6EhiHzKkJuNL4JOuzWAVbe0z7vwCGxtjP1SX
7Kkh1XwJUMCUblj0i85q4aIab9CE3ERSVCFEZZtl57++dFL/PwphtZnIO34DHqdt
wD7E7m30G+vU+3VvNl+PulyVi9++dl0gE6cSN/brm/U7mLl6DQABF1diek06Arpv
eXT4cWorwPIw/XcsvYJGnmTr7RvHIbocmj8w/iWoGT/gSQyrcd0hD3Pe9YwDDYOc
OOQ7zxgPHTyMEnwsZt7JLSD5hMyAeJTpn0QAkqBrqpKjea4VW1s56MriTxc2+HG4
ura8IdZs6KV4YuLEfNSMZqq1WqK4iWmuOZ6Q6WlyCaRWVoz0svfPw1Llzabgj8PB
4ozj56qstfx30oxaW+2oXBVYdEiz43dDpf4lIHnI+SeYF5XwWGfXVb055/KjqhRJ
ukjVLYN1rzdiDLo7ljcK
=rNcO
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--
