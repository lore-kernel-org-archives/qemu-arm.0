Received: by 10.25.21.96 with SMTP id l93csp66974lfi;
        Wed, 15 Jun 2016 18:00:35 -0700 (PDT)
X-Received: by 10.55.71.138 with SMTP id u132mr1877184qka.1.1466038835125;
        Wed, 15 Jun 2016 18:00:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r17si24257428qtr.122.2016.06.15.18.00.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Jun 2016 18:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDLfe-0004a7-CY
	for alex.bennee@linaro.org; Wed, 15 Jun 2016 21:00:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bDLfX-0004XC-MC
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 21:00:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bDLfT-0002i5-0R
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 21:00:26 -0400
Received: from ozlabs.org ([103.22.144.67]:51436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bDLfQ-0002hD-NM; Wed, 15 Jun 2016 21:00:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rVQ656BVnz9t1y; Thu, 16 Jun 2016 11:00:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1466038813;
	bh=O1GB8GOohyqMa1E878JtKMTeW0GMDqNhxEhi0/llnto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NAkGLUW92A9vGQE4KrSsqmOceGJGgTrKKx1fNChLJtWk53+RtlU3Nq70ldLMIAY0P
	K1bOs8oIIpmtiKEIk7ZUVlSYRNBz+W2cR2BXXyWZbM1sSwKG3YaE0FP6Ax0rhyW8ZU
	AG4lCEEsw5UC4TW5/7+X5rRCasGqGoIZvHs5lxqo=
Date: Thu, 16 Jun 2016 10:53:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Sergey Sorokin <afarallax@yandex.ru>
Message-ID: <20160616005305.GF28087@voom.fritz.box>
References: <1465907177-1399402-1-git-send-email-afarallax@yandex.ru>
	<20160615010540.GY4882@voom.fritz.box>
	<403201465987558@web9g.yandex.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Content-Disposition: inline
In-Reply-To: <403201465987558@web9g.yandex.ru>
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
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cKRGjVOhrVjz


--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 01:45:58PM +0300, Sergey Sorokin wrote:
> 15.06.2016, 06:03, "David Gibson" <david@gibson.dropbear.id.au>:
> > On Tue, Jun 14, 2016 at 03:26:17PM +0300, Sergey Sorokin wrote:
> >> =A0There are functions tlb_fill(), cpu_unaligned_access() and
> >> =A0do_unaligned_access() that are called with access type and mmu index
> >> =A0arguments. But these arguments are named 'is_write' and 'is_user' i=
n their
> >> =A0declarations. The patches fix the arguments to avoid a confusion.
> >>
> >> =A0Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> >> =A0---
> >> =A0In the second version of the patch a type of access_type argument
> >> =A0was changed from int to MMUAccessType. To allow it the declaration =
of
> >> =A0MMUAccessType was moved from exec/cpu-common.h into qom/cpu.h
> >> =A0The series of two patches was merged into one.
> >>
> >> =A0=A0include/exec/cpu-common.h | 6 ------
> >> =A0=A0include/exec/exec-all.h | 4 ++--
> >> =A0=A0include/qom/cpu.h | 15 +++++++++++----
> >> =A0=A0target-alpha/cpu.h | 3 ++-
> >> =A0=A0target-alpha/mem_helper.c | 7 ++++---
> >> =A0=A0target-arm/internals.h | 5 +++--
> >> =A0=A0target-arm/op_helper.c | 30 +++++++++++++++++-------------
> >> =A0=A0target-cris/op_helper.c | 6 +++---
> >> =A0=A0target-i386/mem_helper.c | 6 +++---
> >> =A0=A0target-lm32/op_helper.c | 6 +++---
> >> =A0=A0target-m68k/op_helper.c | 6 +++---
> >> =A0=A0target-microblaze/op_helper.c | 6 +++---
> >> =A0=A0target-mips/cpu.h | 3 ++-
> >> =A0=A0target-mips/op_helper.c | 10 +++++-----
> >> =A0=A0target-moxie/helper.c | 6 +++---
> >> =A0=A0target-openrisc/mmu_helper.c | 4 ++--
> >> =A0=A0target-ppc/mmu_helper.c | 8 ++++----
> >> =A0=A0target-s390x/mem_helper.c | 6 +++---
> >> =A0=A0target-sh4/op_helper.c | 6 +++---
> >> =A0=A0target-sparc/cpu.h | 7 ++++---
> >> =A0=A0target-sparc/ldst_helper.c | 13 +++++++------
> >> =A0=A0target-tricore/op_helper.c | 6 +++---
> >> =A0=A0target-unicore32/op_helper.c | 4 ++--
> >> =A0=A0target-xtensa/cpu.h | 3 ++-
> >> =A0=A0target-xtensa/op_helper.c | 11 ++++++-----
> >> =A0=A025 files changed, 100 insertions(+), 87 deletions(-)
> >>
> >> =A0diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> >> =A0index aaee995..9ac1eaf 100644
> >> =A0--- a/include/exec/cpu-common.h
> >> =A0+++ b/include/exec/cpu-common.h
> >> =A0@@ -23,12 +23,6 @@ typedef struct CPUListState {
> >> =A0=A0=A0=A0=A0=A0FILE *file;
> >> =A0=A0} CPUListState;
> >>
> >> =A0-typedef enum MMUAccessType {
> >> =A0- MMU_DATA_LOAD =3D 0,
> >> =A0- MMU_DATA_STORE =3D 1,
> >> =A0- MMU_INST_FETCH =3D 2
> >> =A0-} MMUAccessType;
> >> =A0-
> >> =A0=A0#if !defined(CONFIG_USER_ONLY)
> >>
> >> =A0=A0enum device_endian {
> >> =A0diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> >> =A0index c1f59fa..db79ab6 100644
> >> =A0--- a/include/exec/exec-all.h
> >> =A0+++ b/include/exec/exec-all.h
> >> =A0@@ -361,8 +361,8 @@ extern uintptr_t tci_tb_ptr;
> >> =A0=A0struct MemoryRegion *iotlb_to_region(CPUState *cpu,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0hwaddr index, MemTxAttrs at=
trs);
> >>
> >> =A0-void tlb_fill(CPUState *cpu, target_ulong addr, int is_write, int =
mmu_idx,
> >> =A0- uintptr_t retaddr);
> >> =A0+void tlb_fill(CPUState *cpu, target_ulong addr, MMUAccessType acce=
ss_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr);
> >>
> >> =A0=A0#endif
> >>
> >> =A0diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> >> =A0index 32f3af3..422ac41 100644
> >> =A0--- a/include/qom/cpu.h
> >> =A0+++ b/include/qom/cpu.h
> >> =A0@@ -60,6 +60,12 @@ typedef uint64_t vaddr;
> >> =A0=A0#define CPU_CLASS(class) OBJECT_CLASS_CHECK(CPUClass, (class), T=
YPE_CPU)
> >> =A0=A0#define CPU_GET_CLASS(obj) OBJECT_GET_CLASS(CPUClass, (obj), TYP=
E_CPU)
> >>
> >> =A0+typedef enum MMUAccessType {
> >> =A0+ MMU_DATA_LOAD =3D 0,
> >> =A0+ MMU_DATA_STORE =3D 1,
> >> =A0+ MMU_INST_FETCH =3D 2
> >> =A0+} MMUAccessType;
> >> =A0+
> >> =A0=A0typedef struct CPUWatchpoint CPUWatchpoint;
> >>
> >> =A0=A0typedef void (*CPUUnassignedAccess)(CPUState *cpu, hwaddr addr,
> >> =A0@@ -142,7 +148,8 @@ typedef struct CPUClass {
> >> =A0=A0=A0=A0=A0=A0void (*do_interrupt)(CPUState *cpu);
> >> =A0=A0=A0=A0=A0=A0CPUUnassignedAccess do_unassigned_access;
> >> =A0=A0=A0=A0=A0=A0void (*do_unaligned_access)(CPUState *cpu, vaddr add=
r,
> >> =A0- int is_write, int is_user, uintptr_t retaddr);
> >> =A0+ MMUAccessType access_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr);
> >> =A0=A0=A0=A0=A0=A0bool (*virtio_is_big_endian)(CPUState *cpu);
> >> =A0=A0=A0=A0=A0=A0int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0uint8_t *buf, int len, bool is_write);
> >> =A0@@ -716,12 +723,12 @@ static inline void cpu_unassigned_access(CPUS=
tate *cpu, hwaddr addr,
> >> =A0=A0}
> >>
> >> =A0=A0static inline void cpu_unaligned_access(CPUState *cpu, vaddr add=
r,
> >> =A0- int is_write, int is_user,
> >> =A0- uintptr_t retaddr)
> >> =A0+ MMUAccessType access_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0CPUClass *cc =3D CPU_GET_CLASS(cpu);
> >>
> >> =A0- cc->do_unaligned_access(cpu, addr, is_write, is_user, retaddr);
> >> =A0+ cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
> >> =A0=A0}
> >> =A0=A0#endif
> >>
> >> =A0diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
> >> =A0index e71ea70..cfbb615 100644
> >> =A0--- a/target-alpha/cpu.h
> >> =A0+++ b/target-alpha/cpu.h
> >> =A0@@ -323,7 +323,8 @@ hwaddr alpha_cpu_get_phys_page_debug(CPUState *=
cpu, vaddr addr);
> >> =A0=A0int alpha_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int=
 reg);
> >> =A0=A0int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, in=
t reg);
> >> =A0=A0void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> >> =A0- int is_write, int is_user, uintptr_t retaddr);
> >> =A0+ MMUAccessType access_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr);
> >>
> >> =A0=A0#define cpu_list alpha_cpu_list
> >> =A0=A0#define cpu_exec cpu_alpha_exec
> >> =A0diff --git a/target-alpha/mem_helper.c b/target-alpha/mem_helper.c
> >> =A0index 7f4d15f..1b2be50 100644
> >> =A0--- a/target-alpha/mem_helper.c
> >> =A0+++ b/target-alpha/mem_helper.c
> >> =A0@@ -99,7 +99,8 @@ uint64_t helper_stq_c_phys(CPUAlphaState *env, ui=
nt64_t p, uint64_t v)
> >> =A0=A0}
> >>
> >> =A0=A0void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> >> =A0- int is_write, int is_user, uintptr_t retaddr)
> >> =A0+ MMUAccessType access_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0AlphaCPU *cpu =3D ALPHA_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0CPUAlphaState *env =3D &cpu->env;
> >> =A0@@ -144,12 +145,12 @@ void alpha_cpu_unassigned_access(CPUState *cs=
, hwaddr addr,
> >> =A0=A0=A0=A0=A0NULL, it means that the function was called in C code (=
i.e. not
> >> =A0=A0=A0=A0=A0from generated code or from helper.c) */
> >> =A0=A0/* XXX: fix it to restore all registers */
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0int mmu_idx, uintptr_t=
 retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D alpha_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D alpha_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx=
);
> >> =A0=A0=A0=A0=A0=A0if (unlikely(ret !=3D 0)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (retaddr) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0cpu_restore_state(cs, retadd=
r);
> >> =A0diff --git a/target-arm/internals.h b/target-arm/internals.h
> >> =A0index 728ecba..e0d37da 100644
> >> =A0--- a/target-arm/internals.h
> >> =A0+++ b/target-arm/internals.h
> >> =A0@@ -476,7 +476,8 @@ bool arm_tlb_fill(CPUState *cpu, vaddr address,=
 int rw, int mmu_idx,
> >> =A0=A0bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx=
 mmu_idx);
> >>
> >> =A0=A0/* Raise a data fault alignment exception for the specified virt=
ual address */
> >> =A0-void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is=
_write,
> >> =A0- int is_user, uintptr_t retaddr);
> >> =A0+void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> >> =A0+ MMUAccessType access_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr);
> >>
> >> =A0=A0#endif
> >> =A0diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> >> =A0index 35912a1..3ee2284 100644
> >> =A0--- a/target-arm/op_helper.c
> >> =A0+++ b/target-arm/op_helper.c
> >> =A0@@ -79,7 +79,7 @@ uint32_t HELPER(neon_tbl)(CPUARMState *env, uint3=
2_t ireg, uint32_t def,
> >> =A0=A0static inline uint32_t merge_syn_data_abort(uint32_t template_sy=
n,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0unsign=
ed int target_el,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0bool s=
ame_el,
> >> =A0- bool s1ptw, int is_write,
> >> =A0+ bool s1ptw, bool is_write,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0int fs=
c)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0uint32_t syn;
> >> =A0@@ -97,7 +97,7 @@ static inline uint32_t merge_syn_data_abort(uint3=
2_t template_syn,
> >> =A0=A0=A0=A0=A0=A0=A0*/
> >> =A0=A0=A0=A0=A0=A0if (!(template_syn & ARM_EL_ISV) || target_el !=3D 2=
 || s1ptw) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0syn =3D syn_data_abort_no_iss(same_el,
> >> =A0- 0, 0, s1ptw, is_write =3D=3D 1, fsc);
> >> =A0+ 0, 0, s1ptw, is_write, fsc);
> >> =A0=A0=A0=A0=A0=A0} else {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* Fields: IL, ISV, SAS, SSE, SRT, SF an=
d AR come from the template
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0* syndrome created at translation tim=
e.
> >> =A0@@ -105,7 +105,7 @@ static inline uint32_t merge_syn_data_abort(uin=
t32_t template_syn,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0*/
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0syn =3D syn_data_abort_with_iss(same_el,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00, 0, 0, 0, 0,
> >> =A0- 0, 0, s1ptw, is_write =3D=3D 1, fsc,
> >> =A0+ 0, 0, s1ptw, is_write, fsc,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0false);
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* Merge the runtime syndrome with the t=
emplate syndrome. */
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0syn |=3D template_syn;
> >> =A0@@ -117,14 +117,14 @@ static inline uint32_t merge_syn_data_abort(u=
int32_t template_syn,
> >> =A0=A0=A0* NULL, it means that the function was called in C code (i.e.=
 not
> >> =A0=A0=A0* from generated code or from helper.c)
> >> =A0=A0=A0*/
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0bool ret;
> >> =A0=A0=A0=A0=A0=A0uint32_t fsr =3D 0;
> >> =A0=A0=A0=A0=A0=A0ARMMMUFaultInfo fi =3D {};
> >>
> >> =A0- ret =3D arm_tlb_fill(cs, addr, is_write, mmu_idx, &fsr, &fi);
> >> =A0+ ret =3D arm_tlb_fill(cs, addr, access_type, mmu_idx, &fsr, &fi);
> >> =A0=A0=A0=A0=A0=A0if (unlikely(ret)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ARMCPU *cpu =3D ARM_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CPUARMState *env =3D &cpu->env;
> >> =A0@@ -149,13 +149,15 @@ void tlb_fill(CPUState *cs, target_ulong addr=
, int is_write, int mmu_idx,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* For insn and data aborts we assume th=
ere is no instruction syndrome
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0* information; this is always true fo=
r exceptions reported to EL1.
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0*/
> >> =A0- if (is_write =3D=3D 2) {
> >> =A0+ if (access_type =3D=3D MMU_INST_FETCH) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0syn =3D syn_insn_abort(same_=
el, 0, fi.s1ptw, syn);
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0exc =3D EXCP_PREFETCH_ABORT;
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0} else {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0syn =3D merge_syn_data_abort=
(env->exception.syndrome, target_el,
> >> =A0- same_el, fi.s1ptw, is_write, syn);
> >> =A0- if (is_write =3D=3D 1 && arm_feature(env, ARM_FEATURE_V6)) {
> >> =A0+ same_el, fi.s1ptw,
> >> =A0+ access_type =3D=3D MMU_DATA_STORE, syn);
> >> =A0+ if (access_type =3D=3D MMU_DATA_STORE
> >> =A0+ && arm_feature(env, ARM_FEATURE_V6)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0fsr |=3D (1 << 1=
1);
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0exc =3D EXCP_DATA_ABORT;
> >> =A0@@ -168,8 +170,9 @@ void tlb_fill(CPUState *cs, target_ulong addr, =
int is_write, int mmu_idx,
> >> =A0=A0}
> >>
> >> =A0=A0/* Raise a data fault alignment exception for the specified virt=
ual address */
> >> =A0-void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is=
_write,
> >> =A0- int is_user, uintptr_t retaddr)
> >> =A0+void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> >> =A0+ MMUAccessType access_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0ARMCPU *cpu =3D ARM_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0CPUARMState *env =3D &cpu->env;
> >> =A0@@ -196,12 +199,13 @@ void arm_cpu_do_unaligned_access(CPUState *cs=
, vaddr vaddr, int is_write,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0env->exception.fsr =3D 0x1;
> >> =A0=A0=A0=A0=A0=A0}
> >>
> >> =A0- if (is_write =3D=3D 1 && arm_feature(env, ARM_FEATURE_V6)) {
> >> =A0+ if (access_type =3D=3D MMU_DATA_STORE && arm_feature(env, ARM_FEA=
TURE_V6)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0env->exception.fsr |=3D (1 << 11);
> >> =A0=A0=A0=A0=A0=A0}
> >>
> >> =A0=A0=A0=A0=A0=A0syn =3D merge_syn_data_abort(env->exception.syndrome=
, target_el,
> >> =A0- same_el, 0, is_write, 0x21);
> >> =A0+ same_el, 0, access_type =3D=3D MMU_DATA_STORE,
> >> =A0+ 0x21);
> >> =A0=A0=A0=A0=A0=A0raise_exception(env, EXCP_DATA_ABORT, syn, target_el=
);
> >> =A0=A0}
> >>
> >> =A0diff --git a/target-cris/op_helper.c b/target-cris/op_helper.c
> >> =A0index 675ab86..5043039 100644
> >> =A0--- a/target-cris/op_helper.c
> >> =A0+++ b/target-cris/op_helper.c
> >> =A0@@ -41,8 +41,8 @@
> >> =A0=A0/* Try to fill the TLB and return an exception if error. If reta=
ddr is
> >> =A0=A0=A0=A0=A0NULL, it means that the function was called in C code (=
i.e. not
> >> =A0=A0=A0=A0=A0from generated code or from helper.c) */
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0CRISCPU *cpu =3D CRIS_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0CPUCRISState *env =3D &cpu->env;
> >> =A0@@ -50,7 +50,7 @@ void tlb_fill(CPUState *cs, target_ulong addr, in=
t is_write, int mmu_idx,
> >>
> >> =A0=A0=A0=A0=A0=A0D_LOG("%s pc=3D%x tpc=3D%x ra=3D%p\n", __func__,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0env->pc, env->pregs[PR_EDA], (void=
 *)retaddr);
> >> =A0- ret =3D cris_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D cris_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
> >> =A0=A0=A0=A0=A0=A0if (unlikely(ret)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (retaddr) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* now we have a real cpu fa=
ult */
> >> =A0diff --git a/target-i386/mem_helper.c b/target-i386/mem_helper.c
> >> =A0index c2f4769..5bc0594 100644
> >> =A0--- a/target-i386/mem_helper.c
> >> =A0+++ b/target-i386/mem_helper.c
> >> =A0@@ -140,12 +140,12 @@ void helper_boundl(CPUX86State *env, target_u=
long a0, int v)
> >> =A0=A0=A0* from generated code or from helper.c)
> >> =A0=A0=A0*/
> >> =A0=A0/* XXX: fix it to restore all registers */
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D x86_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D x86_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
> >> =A0=A0=A0=A0=A0=A0if (ret) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0X86CPU *cpu =3D X86_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CPUX86State *env =3D &cpu->env;
> >> =A0diff --git a/target-lm32/op_helper.c b/target-lm32/op_helper.c
> >> =A0index 7a550d1..2177c8a 100644
> >> =A0--- a/target-lm32/op_helper.c
> >> =A0+++ b/target-lm32/op_helper.c
> >> =A0@@ -144,12 +144,12 @@ uint32_t HELPER(rcsr_jrx)(CPULM32State *env)
> >> =A0=A0=A0* NULL, it means that the function was called in C code (i.e.=
 not
> >> =A0=A0=A0* from generated code or from helper.c)
> >> =A0=A0=A0*/
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D lm32_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D lm32_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
> >> =A0=A0=A0=A0=A0=A0if (unlikely(ret)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (retaddr) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* now we have a real cpu fa=
ult */
> >> =A0diff --git a/target-m68k/op_helper.c b/target-m68k/op_helper.c
> >> =A0index ff32e35..e41ae46 100644
> >> =A0--- a/target-m68k/op_helper.c
> >> =A0+++ b/target-m68k/op_helper.c
> >> =A0@@ -39,12 +39,12 @@ static inline void do_interrupt_m68k_hardirq(CP=
UM68KState *env)
> >> =A0=A0/* Try to fill the TLB and return an exception if error. If reta=
ddr is
> >> =A0=A0=A0=A0=A0NULL, it means that the function was called in C code (=
i.e. not
> >> =A0=A0=A0=A0=A0from generated code or from helper.c) */
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D m68k_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D m68k_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
> >> =A0=A0=A0=A0=A0=A0if (unlikely(ret)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (retaddr) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* now we have a real cpu fa=
ult */
> >> =A0diff --git a/target-microblaze/op_helper.c b/target-microblaze/op_h=
elper.c
> >> =A0index 0533939..c52253d 100644
> >> =A0--- a/target-microblaze/op_helper.c
> >> =A0+++ b/target-microblaze/op_helper.c
> >> =A0@@ -33,12 +33,12 @@
> >> =A0=A0=A0* NULL, it means that the function was called in C code (i.e.=
 not
> >> =A0=A0=A0* from generated code or from helper.c)
> >> =A0=A0=A0*/
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D mb_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D mb_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
> >> =A0=A0=A0=A0=A0=A0if (unlikely(ret)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (retaddr) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* now we have a real cpu fa=
ult */
> >> =A0diff --git a/target-mips/cpu.h b/target-mips/cpu.h
> >> =A0index 4ce9d47..3e6221a 100644
> >> =A0--- a/target-mips/cpu.h
> >> =A0+++ b/target-mips/cpu.h
> >> =A0@@ -651,7 +651,8 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *c=
pu, vaddr addr);
> >> =A0=A0int mips_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int =
reg);
> >> =A0=A0int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int=
 reg);
> >> =A0=A0void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> >> =A0- int is_write, int is_user, uintptr_t retaddr);
> >> =A0+ MMUAccessType access_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr);
> >>
> >> =A0=A0#if !defined(CONFIG_USER_ONLY)
> >> =A0=A0int no_mmu_map_address (CPUMIPSState *env, hwaddr *physical, int=
 *prot,
> >> =A0diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
> >> =A0index 7cf9807..11ee8ac 100644
> >> =A0--- a/target-mips/op_helper.c
> >> =A0+++ b/target-mips/op_helper.c
> >> =A0@@ -2383,8 +2383,8 @@ void helper_wait(CPUMIPSState *env)
> >> =A0=A0#if !defined(CONFIG_USER_ONLY)
> >>
> >> =A0=A0void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> >> =A0- int access_type, int is_user,
> >> =A0- uintptr_t retaddr)
> >> =A0+ MMUAccessType access_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0MIPSCPU *cpu =3D MIPS_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0CPUMIPSState *env =3D &cpu->env;
> >> =A0@@ -2405,12 +2405,12 @@ void mips_cpu_do_unaligned_access(CPUState =
*cs, vaddr addr,
> >> =A0=A0=A0=A0=A0=A0do_raise_exception_err(env, excp, error_code, retadd=
r);
> >> =A0=A0}
> >>
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D mips_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D mips_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
> >> =A0=A0=A0=A0=A0=A0if (ret) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0MIPSCPU *cpu =3D MIPS_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CPUMIPSState *env =3D &cpu->env;
> >> =A0diff --git a/target-moxie/helper.c b/target-moxie/helper.c
> >> =A0index d51e9b9..330299f 100644
> >> =A0--- a/target-moxie/helper.c
> >> =A0+++ b/target-moxie/helper.c
> >> =A0@@ -29,12 +29,12 @@
> >> =A0=A0/* Try to fill the TLB and return an exception if error. If reta=
ddr is
> >> =A0=A0=A0=A0=A0NULL, it means that the function was called in C code (=
i.e. not
> >> =A0=A0=A0=A0=A0from generated code or from helper.c) */
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D moxie_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D moxie_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx=
);
> >> =A0=A0=A0=A0=A0=A0if (unlikely(ret)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (retaddr) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0cpu_restore_state(cs, retadd=
r);
> >> =A0diff --git a/target-openrisc/mmu_helper.c b/target-openrisc/mmu_hel=
per.c
> >> =A0index c0658c3..a44d0aa 100644
> >> =A0--- a/target-openrisc/mmu_helper.c
> >> =A0+++ b/target-openrisc/mmu_helper.c
> >> =A0@@ -25,12 +25,12 @@
> >>
> >> =A0=A0#ifndef CONFIG_USER_ONLY
> >>
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0int mmu_idx, uintptr_t=
 retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D openrisc_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx=
);
> >> =A0+ ret =3D openrisc_cpu_handle_mmu_fault(cs, addr, access_type, mmu_=
idx);
> >>
> >> =A0=A0=A0=A0=A0=A0if (ret) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (retaddr) {
> >> =A0diff --git a/target-ppc/mmu_helper.c b/target-ppc/mmu_helper.c
> >> =A0index 485d5b8..3eb3cd7 100644
> >> =A0--- a/target-ppc/mmu_helper.c
> >> =A0+++ b/target-ppc/mmu_helper.c
> >> =A0@@ -2878,8 +2878,8 @@ void helper_check_tlb_flush(CPUPPCState *env)
> >> =A0=A0=A0=A0=A0NULL, it means that the function was called in C code (=
i.e. not
> >> =A0=A0=A0=A0=A0from generated code or from helper.c) */
> >> =A0=A0/* XXX: fix it to restore all registers */
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >
> > If you're using MMUAccessType here..
> >
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cs);
> >> =A0@@ -2887,9 +2887,9 @@ void tlb_fill(CPUState *cs, target_ulong addr=
, int is_write, int mmu_idx,
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0=A0=A0=A0=A0=A0if (pcc->handle_mmu_fault) {
> >> =A0- ret =3D pcc->handle_mmu_fault(cpu, addr, is_write, mmu_idx);
> >> =A0+ ret =3D pcc->handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> >> =A0=A0=A0=A0=A0=A0} else {
> >> =A0- ret =3D cpu_ppc_handle_mmu_fault(env, addr, is_write, mmu_idx);
> >> =A0+ ret =3D cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
> >
> > ..surely the prototype of cpu_ppc_handle_mmu_fault() and all the
> > others should be change to use it as well.
> >
> >> =A0=A0=A0=A0=A0=A0}
> >> =A0=A0=A0=A0=A0=A0if (unlikely(ret !=3D 0)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (likely(retaddr)) {
> >> =A0diff --git a/target-s390x/mem_helper.c b/target-s390x/mem_helper.c
> >> =A0index ec8059a..99bc5e2 100644
> >> =A0--- a/target-s390x/mem_helper.c
> >> =A0+++ b/target-s390x/mem_helper.c
> >> =A0@@ -36,12 +36,12 @@
> >> =A0=A0=A0=A0=A0NULL, it means that the function was called in C code (=
i.e. not
> >> =A0=A0=A0=A0=A0from generated code or from helper.c) */
> >> =A0=A0/* XXX: fix it to restore all registers */
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D s390_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D s390_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
> >> =A0=A0=A0=A0=A0=A0if (unlikely(ret !=3D 0)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (likely(retaddr)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* now we have a real cpu fa=
ult */
> >> =A0diff --git a/target-sh4/op_helper.c b/target-sh4/op_helper.c
> >> =A0index 303e83e..0204b03 100644
> >> =A0--- a/target-sh4/op_helper.c
> >> =A0+++ b/target-sh4/op_helper.c
> >> =A0@@ -24,12 +24,12 @@
> >>
> >> =A0=A0#ifndef CONFIG_USER_ONLY
> >>
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D superh_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D superh_cpu_handle_mmu_fault(cs, addr, access_type, mmu_id=
x);
> >> =A0=A0=A0=A0=A0=A0if (ret) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* now we have a real cpu fault */
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (retaddr) {
> >> =A0diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
> >> =A0index ba37f4b..78c9010 100644
> >> =A0--- a/target-sparc/cpu.h
> >> =A0+++ b/target-sparc/cpu.h
> >> =A0@@ -540,9 +540,10 @@ void sparc_cpu_dump_state(CPUState *cpu, FILE =
*f,
> >> =A0=A0hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> >> =A0=A0int sparc_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int=
 reg);
> >> =A0=A0int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, in=
t reg);
> >> =A0-void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu,
> >> =A0- vaddr addr, int is_write,
> >> =A0- int is_user, uintptr_t retaddr);
> >> =A0+void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu, va=
ddr addr,
> >> =A0+ MMUAccessType access_type,
> >> =A0+ int mmu_idx,
> >> =A0+ uintptr_t retaddr);
> >>
> >> =A0=A0#ifndef NO_CPU_IO_DEFS
> >> =A0=A0/* cpu_init.c */
> >> =A0diff --git a/target-sparc/ldst_helper.c b/target-sparc/ldst_helper.c
> >> =A0index f73cf6d..e941cac 100644
> >> =A0--- a/target-sparc/ldst_helper.c
> >> =A0+++ b/target-sparc/ldst_helper.c
> >> =A0@@ -2420,9 +2420,10 @@ void sparc_cpu_unassigned_access(CPUState *c=
s, hwaddr addr,
> >> =A0=A0#endif
> >>
> >> =A0=A0#if !defined(CONFIG_USER_ONLY)
> >> =A0-void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs,
> >> =A0- vaddr addr, int is_write,
> >> =A0- int is_user, uintptr_t retaddr)
> >> =A0+void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vad=
dr addr,
> >> =A0+ MMUAccessType access_type,
> >> =A0+ int mmu_idx,
> >> =A0+ uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0SPARCCPU *cpu =3D SPARC_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0CPUSPARCState *env =3D &cpu->env;
> >> =A0@@ -2441,12 +2442,12 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_a=
ccess(CPUState *cs,
> >> =A0=A0=A0=A0=A0NULL, it means that the function was called in C code (=
i.e. not
> >> =A0=A0=A0=A0=A0from generated code or from helper.c) */
> >> =A0=A0/* XXX: fix it to restore all registers */
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D sparc_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D sparc_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx=
);
> >> =A0=A0=A0=A0=A0=A0if (ret) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (retaddr) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0cpu_restore_state(cs, retadd=
r);
> >> =A0diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
> >> =A0index a73ed53..873a123 100644
> >> =A0--- a/target-tricore/op_helper.c
> >> =A0+++ b/target-tricore/op_helper.c
> >> =A0@@ -2833,11 +2833,11 @@ static inline void QEMU_NORETURN do_raise_e=
xception_err(CPUTriCoreState *env,
> >> =A0=A0=A0=A0=A0=A0cpu_loop_exit(cs);
> >> =A0=A0}
> >>
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int m=
mu_idx,
> >> =A0- uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >> =A0- ret =3D cpu_tricore_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D cpu_tricore_handle_mmu_fault(cs, addr, access_type, mmu_i=
dx);
> >> =A0=A0=A0=A0=A0=A0if (ret) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0TriCoreCPU *cpu =3D TRICORE_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CPUTriCoreState *env =3D &cpu->env;
> >> =A0diff --git a/target-unicore32/op_helper.c b/target-unicore32/op_hel=
per.c
> >> =A0index a782d33..0872c29 100644
> >> =A0--- a/target-unicore32/op_helper.c
> >> =A0+++ b/target-unicore32/op_helper.c
> >> =A0@@ -244,12 +244,12 @@ uint32_t HELPER(ror_cc)(CPUUniCore32State *en=
v, uint32_t x, uint32_t i)
> >> =A0=A0}
> >>
> >> =A0=A0#ifndef CONFIG_USER_ONLY
> >> =A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
> >> =A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType acces=
s_type,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0int mmu_idx, uintptr_t=
 retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0int ret;
> >>
> >> =A0- ret =3D uc32_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
> >> =A0+ ret =3D uc32_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
> >> =A0=A0=A0=A0=A0=A0if (unlikely(ret)) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (retaddr) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* now we have a real cpu fa=
ult */
> >> =A0diff --git a/target-xtensa/cpu.h b/target-xtensa/cpu.h
> >> =A0index 442176a..3c1aaf4 100644
> >> =A0--- a/target-xtensa/cpu.h
> >> =A0+++ b/target-xtensa/cpu.h
> >> =A0@@ -414,7 +414,8 @@ hwaddr xtensa_cpu_get_phys_page_debug(CPUState =
*cpu, vaddr addr);
> >> =A0=A0int xtensa_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, in=
t reg);
> >> =A0=A0int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, i=
nt reg);
> >> =A0=A0void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> >> =A0- int is_write, int is_user, uintptr_t retaddr);
> >> =A0+ MMUAccessType access_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr);
> >>
> >> =A0=A0#define cpu_exec cpu_xtensa_exec
> >> =A0=A0#define cpu_signal_handler cpu_xtensa_signal_handler
> >> =A0diff --git a/target-xtensa/op_helper.c b/target-xtensa/op_helper.c
> >> =A0index bc3667f..0a4b214 100644
> >> =A0--- a/target-xtensa/op_helper.c
> >> =A0+++ b/target-xtensa/op_helper.c
> >> =A0@@ -35,7 +35,8 @@
> >> =A0=A0#include "qemu/timer.h"
> >>
> >> =A0=A0void xtensa_cpu_do_unaligned_access(CPUState *cs,
> >> =A0- vaddr addr, int is_write, int is_user, uintptr_t retaddr)
> >> =A0+ vaddr addr, MMUAccessType access_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0XtensaCPU *cpu =3D XTENSA_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0CPUXtensaState *env =3D &cpu->env;
> >> =A0@@ -48,19 +49,19 @@ void xtensa_cpu_do_unaligned_access(CPUState *c=
s,
> >> =A0=A0=A0=A0=A0=A0}
> >> =A0=A0}
> >>
> >> =A0-void tlb_fill(CPUState *cs,
> >> =A0- target_ulong vaddr, int is_write, int mmu_idx, uintptr_t retaddr)
> >> =A0+void tlb_fill(CPUState *cs, target_ulong vaddr, MMUAccessType acce=
ss_type,
> >> =A0+ int mmu_idx, uintptr_t retaddr)
> >> =A0=A0{
> >> =A0=A0=A0=A0=A0=A0XtensaCPU *cpu =3D XTENSA_CPU(cs);
> >> =A0=A0=A0=A0=A0=A0CPUXtensaState *env =3D &cpu->env;
> >> =A0=A0=A0=A0=A0=A0uint32_t paddr;
> >> =A0=A0=A0=A0=A0=A0uint32_t page_size;
> >> =A0=A0=A0=A0=A0=A0unsigned access;
> >> =A0- int ret =3D xtensa_get_physical_addr(env, true, vaddr, is_write, =
mmu_idx,
> >> =A0+ int ret =3D xtensa_get_physical_addr(env, true, vaddr, access_typ=
e, mmu_idx,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0&paddr, &page_size, &access);
> >>
> >> =A0=A0=A0=A0=A0=A0qemu_log_mask(CPU_LOG_MMU, "%s(%08x, %d, %d) -> %08x=
, ret =3D %d\n",
> >> =A0- __func__, vaddr, is_write, mmu_idx, paddr, ret);
> >> =A0+ __func__, vaddr, access_type, mmu_idx, paddr, ret);
> >>
> >> =A0=A0=A0=A0=A0=A0if (ret =3D=3D 0) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0tlb_set_page(cs,
> >
>=20
> I agree. But I think it's a subject for a separate patch.
> May be I'll fix it later, but I didn't plan it for a nearest future.

Ok, fair enough.  In that case, ppc pieces are

Acked-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYfhxAAoJEGw4ysog2bOSgmoQAN7+fcwFvJy2Xm6O2jvLDlaX
3QYRruGClS1bHnCnkbnLDUEtKa0GNW2FARQCFEG+OrzWYB8eVkDEhW3hU3vMzFZ3
SdoWN7vvVq8DnEsPnIiz5iiwY18ynEjGrVVdM+7gBLMpwKMLnc4du3OztMjnzPyD
HryIukAEOw0SK1+/NuiRAOgAVPQeJoCI3QlKi6B/P68VZUhPa3BLeInh4npl+qpu
W6ARVXLJxlB0Py2ykniN++/y2HDYgmdFfoJPERM05r/ufsja4HZ/Uop2M1hZ8Vw5
wJ31hbo4/3OWbB2Bfd3xL8SbqB6N2HLE6hbtL381KZuvA0gBiMesn7R0NnPmej7j
Zsb2RTbymJLoTtIsdr4RApz+AdCSRhsa0Gx5bINhyXO8FDK3BE8c6aBTABTfIlzy
Nzro2Rtbx7YTYO+60B3k2xDG3gFqZu0rAu+UaDic+bjQMWx4ewKYRbhxsL1Se0p4
PoFIZgAzgKbv3o3xbimY3nY7yAHzOgQ7T1+6cUQMre+qlqYkm8O6h9d/fdHQbY8r
HVCiPprj286bhdfadHuv1dPcCy7sBAhhBRYgGQ+6CLa92I46QjHFISUjvBylJ//L
pHFGwjVUv1Sl3LwN59EwLf4anfIZD5W/rD4kgdzJB8RjuJ/hKspobGsjFOAf32uV
AU5t6qLne05y8yyitb7K
=FhQ2
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--
