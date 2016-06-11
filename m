Received: by 10.25.85.209 with SMTP id j200csp766535lfb;
        Sun, 12 Jun 2016 05:50:00 -0700 (PDT)
X-Received: by 10.55.209.83 with SMTP id s80mr9960512qki.87.1465735800691;
        Sun, 12 Jun 2016 05:50:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p39si12081087qgp.86.2016.06.12.05.50.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 12 Jun 2016 05:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bC4q0-0000jY-2D
	for alex.bennee@linaro.org; Sun, 12 Jun 2016 08:50:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bC4pZ-0000V3-9v
	for qemu-arm@nongnu.org; Sun, 12 Jun 2016 08:49:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bC4pV-0006yS-5O
	for qemu-arm@nongnu.org; Sun, 12 Jun 2016 08:49:33 -0400
Received: from ozlabs.org ([103.22.144.67]:44963)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bC4pU-0006yN-J6
	for qemu-arm@nongnu.org; Sun, 12 Jun 2016 08:49:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rSG236dYhz9sCj; Sun, 12 Jun 2016 22:49:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465735755;
	bh=zJfb9iF6y0BZZXI+hI2IHBF3m1GOXPUPiBt6VHZPmHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=plbxiAT7DjV3uYEMSnON4Xotvf5X6l5d1Rw6eD0MDTzuAP+15aXAGOZ5j3j3y4PKm
	oxpRq8Se2rJWfqE52h00/XGmv5ur9xd1NYPt1CdINZY7LDcgkdRjfH2iarKzfhqy4g
	iPV9vAVgvJqbVmpLk3OEiLS1dZRAFAVdKNPg7GkA=
Date: Sat, 11 Jun 2016 20:28:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Sergey Sorokin <afarallax@yandex.ru>
Message-ID: <20160611102826.GV9226@voom.fritz.box>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
	<1465575999-3594234-3-git-send-email-afarallax@yandex.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dkgfGZfPp4OU3Le7"
Content-Disposition: inline
In-Reply-To: <1465575999-3594234-3-git-send-email-afarallax@yandex.ru>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH 2/2] Fix a confusing argument name in
 tlb_fill() function
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
X-TUID: vCJ5uOmfyrGT


--dkgfGZfPp4OU3Le7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 07:26:39PM +0300, Sergey Sorokin wrote:
> The function tlb_fill() is called with access type argument which is named
> 'is_write' in its declaration. The patch fixes the argument name
> to avoid a confusion.
>=20
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
>  include/exec/exec-all.h       |  2 +-
>  target-alpha/mem_helper.c     |  4 ++--
>  target-arm/op_helper.c        | 12 +++++++-----
>  target-cris/op_helper.c       |  4 ++--
>  target-i386/mem_helper.c      |  4 ++--
>  target-lm32/op_helper.c       |  4 ++--
>  target-m68k/op_helper.c       |  4 ++--
>  target-microblaze/op_helper.c |  4 ++--
>  target-mips/op_helper.c       |  4 ++--
>  target-moxie/helper.c         |  4 ++--
>  target-openrisc/mmu_helper.c  |  4 ++--
>  target-ppc/mmu_helper.c       |  6 +++---
>  target-s390x/mem_helper.c     |  4 ++--
>  target-sh4/op_helper.c        |  4 ++--
>  target-sparc/ldst_helper.c    |  4 ++--
>  target-tricore/op_helper.c    |  4 ++--
>  target-unicore32/op_helper.c  |  4 ++--
>  target-xtensa/op_helper.c     |  7 ++++---
>  18 files changed, 43 insertions(+), 40 deletions(-)

ppc portion

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index e076397..f425576 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -363,7 +363,7 @@ extern uintptr_t tci_tb_ptr;
>  struct MemoryRegion *iotlb_to_region(CPUState *cpu,
>                                       hwaddr index, MemTxAttrs attrs);
> =20
> -void tlb_fill(CPUState *cpu, target_ulong addr, int is_write, int mmu_id=
x,
> +void tlb_fill(CPUState *cpu, target_ulong addr, int access_type, int mmu=
_idx,
>                uintptr_t retaddr);
> =20
>  #endif
> diff --git a/target-alpha/mem_helper.c b/target-alpha/mem_helper.c
> index cfb4898..53fdae4 100644
> --- a/target-alpha/mem_helper.c
> +++ b/target-alpha/mem_helper.c
> @@ -144,12 +144,12 @@ void alpha_cpu_unassigned_access(CPUState *cs, hwad=
dr addr,
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D alpha_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D alpha_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret !=3D 0)) {
>          if (retaddr) {
>              cpu_restore_state(cs, retaddr);
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 04316b5..dd97760 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -117,14 +117,14 @@ static inline uint32_t merge_syn_data_abort(uint32_=
t template_syn,
>   * NULL, it means that the function was called in C code (i.e. not
>   * from generated code or from helper.c)
>   */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
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
> -                                       same_el, fi.s1ptw, is_write =3D=
=3D 1, syn);
> -            if (is_write =3D=3D 1 && arm_feature(env, ARM_FEATURE_V6)) {
> +                                       same_el, fi.s1ptw,
> +                                       access_type =3D=3D MMU_DATA_STORE=
, syn);
> +            if (access_type =3D=3D MMU_DATA_STORE
> +                && arm_feature(env, ARM_FEATURE_V6)) {
>                  fsr |=3D (1 << 11);
>              }
>              exc =3D EXCP_DATA_ABORT;
> diff --git a/target-cris/op_helper.c b/target-cris/op_helper.c
> index 675ab86..fbb71bc 100644
> --- a/target-cris/op_helper.c
> +++ b/target-cris/op_helper.c
> @@ -41,7 +41,7 @@
>  /* Try to fill the TLB and return an exception if error. If retaddr is
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      CRISCPU *cpu =3D CRIS_CPU(cs);
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
> index c2f4769..b1ea08c 100644
> --- a/target-i386/mem_helper.c
> +++ b/target-i386/mem_helper.c
> @@ -140,12 +140,12 @@ void helper_boundl(CPUX86State *env, target_ulong a=
0, int v)
>   * from generated code or from helper.c)
>   */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D x86_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D x86_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (ret) {
>          X86CPU *cpu =3D X86_CPU(cs);
>          CPUX86State *env =3D &cpu->env;
> diff --git a/target-lm32/op_helper.c b/target-lm32/op_helper.c
> index 7a550d1..5f29343 100644
> --- a/target-lm32/op_helper.c
> +++ b/target-lm32/op_helper.c
> @@ -144,12 +144,12 @@ uint32_t HELPER(rcsr_jrx)(CPULM32State *env)
>   * NULL, it means that the function was called in C code (i.e. not
>   * from generated code or from helper.c)
>   */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D lm32_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D lm32_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {
>              /* now we have a real cpu fault */
> diff --git a/target-m68k/op_helper.c b/target-m68k/op_helper.c
> index ff32e35..12d942e 100644
> --- a/target-m68k/op_helper.c
> +++ b/target-m68k/op_helper.c
> @@ -39,12 +39,12 @@ static inline void do_interrupt_m68k_hardirq(CPUM68KS=
tate *env)
>  /* Try to fill the TLB and return an exception if error. If retaddr is
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D m68k_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D m68k_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {
>              /* now we have a real cpu fault */
> diff --git a/target-microblaze/op_helper.c b/target-microblaze/op_helper.c
> index 0533939..8bdd9f4 100644
> --- a/target-microblaze/op_helper.c
> +++ b/target-microblaze/op_helper.c
> @@ -33,12 +33,12 @@
>   * NULL, it means that the function was called in C code (i.e. not
>   * from generated code or from helper.c)
>   */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D mb_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D mb_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {
>              /* now we have a real cpu fault */
> diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
> index b5f1641..8f440e8 100644
> --- a/target-mips/op_helper.c
> +++ b/target-mips/op_helper.c
> @@ -2405,12 +2405,12 @@ void mips_cpu_do_unaligned_access(CPUState *cs, v=
addr addr,
>      do_raise_exception_err(env, excp, error_code, retaddr);
>  }
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D mips_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D mips_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (ret) {
>          MIPSCPU *cpu =3D MIPS_CPU(cs);
>          CPUMIPSState *env =3D &cpu->env;
> diff --git a/target-moxie/helper.c b/target-moxie/helper.c
> index d51e9b9..8097004 100644
> --- a/target-moxie/helper.c
> +++ b/target-moxie/helper.c
> @@ -29,12 +29,12 @@
>  /* Try to fill the TLB and return an exception if error. If retaddr is
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D moxie_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D moxie_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {
>              cpu_restore_state(cs, retaddr);
> diff --git a/target-openrisc/mmu_helper.c b/target-openrisc/mmu_helper.c
> index c0658c3..37ea725 100644
> --- a/target-openrisc/mmu_helper.c
> +++ b/target-openrisc/mmu_helper.c
> @@ -25,12 +25,12 @@
> =20
>  #ifndef CONFIG_USER_ONLY
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type,
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
> index 485d5b8..78179ee 100644
> --- a/target-ppc/mmu_helper.c
> +++ b/target-ppc/mmu_helper.c
> @@ -2878,7 +2878,7 @@ void helper_check_tlb_flush(CPUPPCState *env)
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
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
>      }
>      if (unlikely(ret !=3D 0)) {
>          if (likely(retaddr)) {
> diff --git a/target-s390x/mem_helper.c b/target-s390x/mem_helper.c
> index ec8059a..acc9eb9 100644
> --- a/target-s390x/mem_helper.c
> +++ b/target-s390x/mem_helper.c
> @@ -36,12 +36,12 @@
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D s390_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D s390_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret !=3D 0)) {
>          if (likely(retaddr)) {
>              /* now we have a real cpu fault */
> diff --git a/target-sh4/op_helper.c b/target-sh4/op_helper.c
> index 303e83e..49bd57a 100644
> --- a/target-sh4/op_helper.c
> +++ b/target-sh4/op_helper.c
> @@ -24,12 +24,12 @@
> =20
>  #ifndef CONFIG_USER_ONLY
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D superh_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D superh_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (ret) {
>          /* now we have a real cpu fault */
>          if (retaddr) {
> diff --git a/target-sparc/ldst_helper.c b/target-sparc/ldst_helper.c
> index f1cb821..bc60325 100644
> --- a/target-sparc/ldst_helper.c
> +++ b/target-sparc/ldst_helper.c
> @@ -2442,12 +2442,12 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(=
CPUState *cs,
>     NULL, it means that the function was called in C code (i.e. not
>     from generated code or from helper.c) */
>  /* XXX: fix it to restore all registers */
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D sparc_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D sparc_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (ret) {
>          if (retaddr) {
>              cpu_restore_state(cs, retaddr);
> diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
> index a73ed53..64337b7 100644
> --- a/target-tricore/op_helper.c
> +++ b/target-tricore/op_helper.c
> @@ -2833,11 +2833,11 @@ static inline void QEMU_NORETURN do_raise_excepti=
on_err(CPUTriCoreState *env,
>      cpu_loop_exit(cs);
>  }
> =20
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_=
idx,
>                uintptr_t retaddr)
>  {
>      int ret;
> -    ret =3D cpu_tricore_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D cpu_tricore_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (ret) {
>          TriCoreCPU *cpu =3D TRICORE_CPU(cs);
>          CPUTriCoreState *env =3D &cpu->env;
> diff --git a/target-unicore32/op_helper.c b/target-unicore32/op_helper.c
> index a782d33..2eadb81 100644
> --- a/target-unicore32/op_helper.c
> +++ b/target-unicore32/op_helper.c
> @@ -244,12 +244,12 @@ uint32_t HELPER(ror_cc)(CPUUniCore32State *env, uin=
t32_t x, uint32_t i)
>  }
> =20
>  #ifndef CONFIG_USER_ONLY
> -void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
> +void tlb_fill(CPUState *cs, target_ulong addr, int access_type,
>                int mmu_idx, uintptr_t retaddr)
>  {
>      int ret;
> =20
> -    ret =3D uc32_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> +    ret =3D uc32_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {
>              /* now we have a real cpu fault */
> diff --git a/target-xtensa/op_helper.c b/target-xtensa/op_helper.c
> index 32dcbdf..e9aab6d 100644
> --- a/target-xtensa/op_helper.c
> +++ b/target-xtensa/op_helper.c
> @@ -50,18 +50,19 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
>  }
> =20
>  void tlb_fill(CPUState *cs,
> -              target_ulong vaddr, int is_write, int mmu_idx, uintptr_t r=
etaddr)
> +              target_ulong vaddr, int access_type,
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

--dkgfGZfPp4OU3Le7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXW+fKAAoJEGw4ysog2bOSvcoQAN7yg+wDYWkuZzl6zWfM/KlW
YWm/bXT+PRqKhYDaYP8zLF6yGSsE6nyC5vRqcvGXpG0Oty1UaBMshrEqzczJqtK0
j/J7pw2sX3WhZNRW47WJ4s7kLVXaMiGevAsPKWrJXmXyFaTWLYAjmEe+Atqy1Wq7
DISuHxZNLwZx9e6yJoGeO7paCI5dVRnPzVvTiX4feA30rTWwv9Dh/wzbdJeYDHBo
hgNeKDYyuch4qDDkbfEHNz04f4Np0cyC5NwwBKbE9SBG0XS6Aw9qYcgrU07SvDHl
xYADQGgg4CPMeNu5K95h+zX4h1QsIrwXMq+tcEkf0LZkzNsnoCu/N+5JwCYTHMZV
H5XIE297qIZrskKhu5Xwj9ZQkOeEFQ8MPG3VpA9t/XZ43kt4wtQrf3Cl0ydqwaUh
HV7RcXCICTyCEkauhwdn2oL160eJcvkAE0+K+tpmL8dJ12LRjE3EHq1tYTTWkTag
3LODuZUzBbnYwtRPr8nGkZ6+YaHJU8W7e5yssn2Ae9wUmwHS0eZ0tofIeew5NDII
xJ/uYfs95Tb5jZZITGto5l8hiusDcu5CszbYHWyds6dRd2r2CeH/ILtNfE6znhD7
cuXRdOKtE7k/+9QzeEJkrouiOolkWbBngIPOlcOtzjIEn9a2Dw9UnegeIsiHHoOa
Mjy976zhZHt1bpdSrD//
=pUPW
-----END PGP SIGNATURE-----

--dkgfGZfPp4OU3Le7--
