Received: by 10.25.21.96 with SMTP id l93csp481225lfi;
        Wed, 15 Jun 2016 03:46:32 -0700 (PDT)
X-Received: by 10.200.38.120 with SMTP id v53mr17110243qtv.90.1465987592752;
        Wed, 15 Jun 2016 03:46:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r84si21693541qhr.96.2016.06.15.03.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Jun 2016 03:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:41305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bD8LA-0000hI-1k
	for alex.bennee@linaro.org; Wed, 15 Jun 2016 06:46:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bD8L3-0000ds-4t
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 06:46:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bD8Ky-00078t-0M
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 06:46:24 -0400
Received: from forward19p.cmail.yandex.net ([77.88.31.22]:58349)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bD8Kw-00077j-7i; Wed, 15 Jun 2016 06:46:19 -0400
Received: from mxback6g.mail.yandex.net (mxback6g.mail.yandex.net
	[77.88.29.167])
	by forward19p.cmail.yandex.net (Yandex) with ESMTP id 0F1DF210FA;
	Wed, 15 Jun 2016 13:45:59 +0300 (MSK)
Received: from web9g.yandex.ru (web9g.yandex.ru [95.108.252.109])
	by mxback6g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	iLNJcIgZ11-jwKmatI2; Wed, 15 Jun 2016 13:45:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1465987558; bh=j1V4pd9Mc8bHUsesI3PekH8/Z6Qfab0q9klRmhI1Hl0=;
	h=X-Yandex-Sender-Uid:From:To:Cc:In-Reply-To:References:Subject:
	MIME-Version:Message-Id:X-Mailer:Date:Content-Transfer-Encoding:
	Content-Type;
	b=ke0Y6nFD+V7/xinw6qe4N3xK37+De9Z1+0roCYXXbjDVE4/+INjNbh2IL1GlOdDAa
	YXnY5Hp/PzvdgD1lZL5zCbaRcWi2Wzs+xqnjOSn3myj2frwWdQOXmrG1Gj74kt1zeh
	3Sl/CRX90HscnA2B9MZg3XqpW9thIPzxziIJ9Fdg=
Authentication-Results: mxback6g.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0,
	1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 37377968
X-Yandex-Sender-Uid: 15784356
Received: by web9g.yandex.ru with HTTP;
	Wed, 15 Jun 2016 13:45:58 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: David Gibson <david@gibson.dropbear.id.au>
In-Reply-To: <20160615010540.GY4882@voom.fritz.box>
References: <1465907177-1399402-1-git-send-email-afarallax@yandex.ru>
	<20160615010540.GY4882@voom.fritz.box>
MIME-Version: 1.0
Message-Id: <403201465987558@web9g.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 15 Jun 2016 13:45:58 +0300
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 77.88.31.22
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
X-TUID: fI/3jXAraEgK

15.06.2016, 06:03, "David Gibson" <david@gibson.dropbear.id.au>:
> On Tue, Jun 14, 2016 at 03:26:17PM +0300, Sergey Sorokin wrote:
>> =C2=A0There are functions tlb_fill(), cpu_unaligned_access() and
>> =C2=A0do_unaligned_access() that are called with access type and mmu i=
ndex
>> =C2=A0arguments. But these arguments are named 'is_write' and 'is_user=
' in their
>> =C2=A0declarations. The patches fix the arguments to avoid a confusion=
.
>>
>> =C2=A0Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
>> =C2=A0---
>> =C2=A0In the second version of the patch a type of access_type argumen=
t
>> =C2=A0was changed from int to MMUAccessType. To allow it the declarati=
on of
>> =C2=A0MMUAccessType was moved from exec/cpu-common.h into qom/cpu.h
>> =C2=A0The series of two patches was merged into one.
>>
>> =C2=A0=C2=A0include/exec/cpu-common.h | 6 ------
>> =C2=A0=C2=A0include/exec/exec-all.h | 4 ++--
>> =C2=A0=C2=A0include/qom/cpu.h | 15 +++++++++++----
>> =C2=A0=C2=A0target-alpha/cpu.h | 3 ++-
>> =C2=A0=C2=A0target-alpha/mem_helper.c | 7 ++++---
>> =C2=A0=C2=A0target-arm/internals.h | 5 +++--
>> =C2=A0=C2=A0target-arm/op_helper.c | 30 +++++++++++++++++-------------
>> =C2=A0=C2=A0target-cris/op_helper.c | 6 +++---
>> =C2=A0=C2=A0target-i386/mem_helper.c | 6 +++---
>> =C2=A0=C2=A0target-lm32/op_helper.c | 6 +++---
>> =C2=A0=C2=A0target-m68k/op_helper.c | 6 +++---
>> =C2=A0=C2=A0target-microblaze/op_helper.c | 6 +++---
>> =C2=A0=C2=A0target-mips/cpu.h | 3 ++-
>> =C2=A0=C2=A0target-mips/op_helper.c | 10 +++++-----
>> =C2=A0=C2=A0target-moxie/helper.c | 6 +++---
>> =C2=A0=C2=A0target-openrisc/mmu_helper.c | 4 ++--
>> =C2=A0=C2=A0target-ppc/mmu_helper.c | 8 ++++----
>> =C2=A0=C2=A0target-s390x/mem_helper.c | 6 +++---
>> =C2=A0=C2=A0target-sh4/op_helper.c | 6 +++---
>> =C2=A0=C2=A0target-sparc/cpu.h | 7 ++++---
>> =C2=A0=C2=A0target-sparc/ldst_helper.c | 13 +++++++------
>> =C2=A0=C2=A0target-tricore/op_helper.c | 6 +++---
>> =C2=A0=C2=A0target-unicore32/op_helper.c | 4 ++--
>> =C2=A0=C2=A0target-xtensa/cpu.h | 3 ++-
>> =C2=A0=C2=A0target-xtensa/op_helper.c | 11 ++++++-----
>> =C2=A0=C2=A025 files changed, 100 insertions(+), 87 deletions(-)
>>
>> =C2=A0diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common=
.h
>> =C2=A0index aaee995..9ac1eaf 100644
>> =C2=A0--- a/include/exec/cpu-common.h
>> =C2=A0+++ b/include/exec/cpu-common.h
>> =C2=A0@@ -23,12 +23,6 @@ typedef struct CPUListState {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0FILE *file;
>> =C2=A0=C2=A0} CPUListState;
>>
>> =C2=A0-typedef enum MMUAccessType {
>> =C2=A0- MMU_DATA_LOAD =3D 0,
>> =C2=A0- MMU_DATA_STORE =3D 1,
>> =C2=A0- MMU_INST_FETCH =3D 2
>> =C2=A0-} MMUAccessType;
>> =C2=A0-
>> =C2=A0=C2=A0#if !defined(CONFIG_USER_ONLY)
>>
>> =C2=A0=C2=A0enum device_endian {
>> =C2=A0diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> =C2=A0index c1f59fa..db79ab6 100644
>> =C2=A0--- a/include/exec/exec-all.h
>> =C2=A0+++ b/include/exec/exec-all.h
>> =C2=A0@@ -361,8 +361,8 @@ extern uintptr_t tci_tb_ptr;
>> =C2=A0=C2=A0struct MemoryRegion *iotlb_to_region(CPUState *cpu,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0hwaddr index, MemTxAttrs attrs);
>>
>> =C2=A0-void tlb_fill(CPUState *cpu, target_ulong addr, int is_write, i=
nt mmu_idx,
>> =C2=A0- uintptr_t retaddr);
>> =C2=A0+void tlb_fill(CPUState *cpu, target_ulong addr, MMUAccessType a=
ccess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr);
>>
>> =C2=A0=C2=A0#endif
>>
>> =C2=A0diff --git a/include/qom/cpu.h b/include/qom/cpu.h
>> =C2=A0index 32f3af3..422ac41 100644
>> =C2=A0--- a/include/qom/cpu.h
>> =C2=A0+++ b/include/qom/cpu.h
>> =C2=A0@@ -60,6 +60,12 @@ typedef uint64_t vaddr;
>> =C2=A0=C2=A0#define CPU_CLASS(class) OBJECT_CLASS_CHECK(CPUClass, (cla=
ss), TYPE_CPU)
>> =C2=A0=C2=A0#define CPU_GET_CLASS(obj) OBJECT_GET_CLASS(CPUClass, (obj=
), TYPE_CPU)
>>
>> =C2=A0+typedef enum MMUAccessType {
>> =C2=A0+ MMU_DATA_LOAD =3D 0,
>> =C2=A0+ MMU_DATA_STORE =3D 1,
>> =C2=A0+ MMU_INST_FETCH =3D 2
>> =C2=A0+} MMUAccessType;
>> =C2=A0+
>> =C2=A0=C2=A0typedef struct CPUWatchpoint CPUWatchpoint;
>>
>> =C2=A0=C2=A0typedef void (*CPUUnassignedAccess)(CPUState *cpu, hwaddr =
addr,
>> =C2=A0@@ -142,7 +148,8 @@ typedef struct CPUClass {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void (*do_interrupt)(CPUState *cpu=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUUnassignedAccess do_unassigned_=
access;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void (*do_unaligned_access)(CPUSta=
te *cpu, vaddr addr,
>> =C2=A0- int is_write, int is_user, uintptr_t retaddr);
>> =C2=A0+ MMUAccessType access_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool (*virtio_is_big_endian)(CPUSt=
ate *cpu);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int (*memory_rw_debug)(CPUState *c=
pu, vaddr addr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t *buf, int len, bool is_write);
>> =C2=A0@@ -716,12 +723,12 @@ static inline void cpu_unassigned_access(C=
PUState *cpu, hwaddr addr,
>> =C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0static inline void cpu_unaligned_access(CPUState *cpu, vad=
dr addr,
>> =C2=A0- int is_write, int is_user,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+ MMUAccessType access_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUClass *cc =3D CPU_GET_CLASS(cpu=
);
>>
>> =C2=A0- cc->do_unaligned_access(cpu, addr, is_write, is_user, retaddr)=
;
>> =C2=A0+ cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retad=
dr);
>> =C2=A0=C2=A0}
>> =C2=A0=C2=A0#endif
>>
>> =C2=A0diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
>> =C2=A0index e71ea70..cfbb615 100644
>> =C2=A0--- a/target-alpha/cpu.h
>> =C2=A0+++ b/target-alpha/cpu.h
>> =C2=A0@@ -323,7 +323,8 @@ hwaddr alpha_cpu_get_phys_page_debug(CPUStat=
e *cpu, vaddr addr);
>> =C2=A0=C2=A0int alpha_cpu_gdb_read_register(CPUState *cpu, uint8_t *bu=
f, int reg);
>> =C2=A0=C2=A0int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *b=
uf, int reg);
>> =C2=A0=C2=A0void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr ad=
dr,
>> =C2=A0- int is_write, int is_user, uintptr_t retaddr);
>> =C2=A0+ MMUAccessType access_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr);
>>
>> =C2=A0=C2=A0#define cpu_list alpha_cpu_list
>> =C2=A0=C2=A0#define cpu_exec cpu_alpha_exec
>> =C2=A0diff --git a/target-alpha/mem_helper.c b/target-alpha/mem_helper=
.c
>> =C2=A0index 7f4d15f..1b2be50 100644
>> =C2=A0--- a/target-alpha/mem_helper.c
>> =C2=A0+++ b/target-alpha/mem_helper.c
>> =C2=A0@@ -99,7 +99,8 @@ uint64_t helper_stq_c_phys(CPUAlphaState *env,=
 uint64_t p, uint64_t v)
>> =C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr add=
r,
>> =C2=A0- int is_write, int is_user, uintptr_t retaddr)
>> =C2=A0+ MMUAccessType access_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AlphaCPU *cpu =3D ALPHA_CPU(cs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUAlphaState *env =3D &cpu->env;
>> =C2=A0@@ -144,12 +145,12 @@ void alpha_cpu_unassigned_access(CPUState =
*cs, hwaddr addr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL, it means that the function was cal=
led in C code (i.e. not
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from generated code or from helper.c) */
>> =C2=A0=C2=A0/* XXX: fix it to restore all registers */
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D alpha_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx=
);
>> =C2=A0+ ret =3D alpha_cpu_handle_mmu_fault(cs, addr, access_type, mmu_=
idx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret !=3D 0)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retadd=
r) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0cpu_restore_state(cs, retaddr);
>> =C2=A0diff --git a/target-arm/internals.h b/target-arm/internals.h
>> =C2=A0index 728ecba..e0d37da 100644
>> =C2=A0--- a/target-arm/internals.h
>> =C2=A0+++ b/target-arm/internals.h
>> =C2=A0@@ -476,7 +476,8 @@ bool arm_tlb_fill(CPUState *cpu, vaddr addre=
ss, int rw, int mmu_idx,
>> =C2=A0=C2=A0bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARM=
MMUIdx mmu_idx);
>>
>> =C2=A0=C2=A0/* Raise a data fault alignment exception for the specifie=
d virtual address */
>> =C2=A0-void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int=
 is_write,
>> =C2=A0- int is_user, uintptr_t retaddr);
>> =C2=A0+void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>> =C2=A0+ MMUAccessType access_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr);
>>
>> =C2=A0=C2=A0#endif
>> =C2=A0diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
>> =C2=A0index 35912a1..3ee2284 100644
>> =C2=A0--- a/target-arm/op_helper.c
>> =C2=A0+++ b/target-arm/op_helper.c
>> =C2=A0@@ -79,7 +79,7 @@ uint32_t HELPER(neon_tbl)(CPUARMState *env, ui=
nt32_t ireg, uint32_t def,
>> =C2=A0=C2=A0static inline uint32_t merge_syn_data_abort(uint32_t templ=
ate_syn,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int target=
_el,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool same_el,
>> =C2=A0- bool s1ptw, int is_write,
>> =C2=A0+ bool s1ptw, bool is_write,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int fsc)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t syn;
>> =C2=A0@@ -97,7 +97,7 @@ static inline uint32_t merge_syn_data_abort(ui=
nt32_t template_syn,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!(template_syn & ARM_EL_ISV) |=
| target_el !=3D 2 || s1ptw) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0syn =3D sy=
n_data_abort_no_iss(same_el,
>> =C2=A0- 0, 0, s1ptw, is_write =3D=3D 1, fsc);
>> =C2=A0+ 0, 0, s1ptw, is_write, fsc);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Fields:=
 IL, ISV, SAS, SSE, SRT, SF and AR come from the template
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* sy=
ndrome created at translation time.
>> =C2=A0@@ -105,7 +105,7 @@ static inline uint32_t merge_syn_data_abort(=
uint32_t template_syn,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0syn =3D sy=
n_data_abort_with_iss(same_el,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00, 0, 0, 0, 0,
>> =C2=A0- 0, 0, s1ptw, is_write =3D=3D 1, fsc,
>> =C2=A0+ 0, 0, s1ptw, is_write, fsc,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0false);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Merge t=
he runtime syndrome with the template syndrome. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0syn |=3D t=
emplate_syn;
>> =C2=A0@@ -117,14 +117,14 @@ static inline uint32_t merge_syn_data_abor=
t(uint32_t template_syn,
>> =C2=A0=C2=A0=C2=A0* NULL, it means that the function was called in C c=
ode (i.e. not
>> =C2=A0=C2=A0=C2=A0* from generated code or from helper.c)
>> =C2=A0=C2=A0=C2=A0*/
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t fsr =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ARMMMUFaultInfo fi =3D {};
>>
>> =C2=A0- ret =3D arm_tlb_fill(cs, addr, is_write, mmu_idx, &fsr, &fi);
>> =C2=A0+ ret =3D arm_tlb_fill(cs, addr, access_type, mmu_idx, &fsr, &fi=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ARMCPU *cp=
u =3D ARM_CPU(cs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUARMStat=
e *env =3D &cpu->env;
>> =C2=A0@@ -149,13 +149,15 @@ void tlb_fill(CPUState *cs, target_ulong a=
ddr, int is_write, int mmu_idx,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* For ins=
n and data aborts we assume there is no instruction syndrome
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* in=
formation; this is always true for exceptions reported to EL1.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
>> =C2=A0- if (is_write =3D=3D 2) {
>> =C2=A0+ if (access_type =3D=3D MMU_INST_FETCH) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0syn =3D syn_insn_abort(same_el, 0, fi.s1ptw, syn);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0exc =3D EXCP_PREFETCH_ABORT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0syn =3D merge_syn_data_abort(env->exception.syndrome, target_=
el,
>> =C2=A0- same_el, fi.s1ptw, is_write, syn);
>> =C2=A0- if (is_write =3D=3D 1 && arm_feature(env, ARM_FEATURE_V6)) {
>> =C2=A0+ same_el, fi.s1ptw,
>> =C2=A0+ access_type =3D=3D MMU_DATA_STORE, syn);
>> =C2=A0+ if (access_type =3D=3D MMU_DATA_STORE
>> =C2=A0+ && arm_feature(env, ARM_FEATURE_V6)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fsr |=3D (1 << 11);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0exc =3D EXCP_DATA_ABORT;
>> =C2=A0@@ -168,8 +170,9 @@ void tlb_fill(CPUState *cs, target_ulong add=
r, int is_write, int mmu_idx,
>> =C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0/* Raise a data fault alignment exception for the specifie=
d virtual address */
>> =C2=A0-void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int=
 is_write,
>> =C2=A0- int is_user, uintptr_t retaddr)
>> =C2=A0+void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>> =C2=A0+ MMUAccessType access_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ARMCPU *cpu =3D ARM_CPU(cs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUARMState *env =3D &cpu->env;
>> =C2=A0@@ -196,12 +199,13 @@ void arm_cpu_do_unaligned_access(CPUState =
*cs, vaddr vaddr, int is_write,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0env->excep=
tion.fsr =3D 0x1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>>
>> =C2=A0- if (is_write =3D=3D 1 && arm_feature(env, ARM_FEATURE_V6)) {
>> =C2=A0+ if (access_type =3D=3D MMU_DATA_STORE && arm_feature(env, ARM_=
FEATURE_V6)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0env->excep=
tion.fsr |=3D (1 << 11);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0syn =3D merge_syn_data_abort(env->=
exception.syndrome, target_el,
>> =C2=A0- same_el, 0, is_write, 0x21);
>> =C2=A0+ same_el, 0, access_type =3D=3D MMU_DATA_STORE,
>> =C2=A0+ 0x21);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0raise_exception(env, EXCP_DATA_ABO=
RT, syn, target_el);
>> =C2=A0=C2=A0}
>>
>> =C2=A0diff --git a/target-cris/op_helper.c b/target-cris/op_helper.c
>> =C2=A0index 675ab86..5043039 100644
>> =C2=A0--- a/target-cris/op_helper.c
>> =C2=A0+++ b/target-cris/op_helper.c
>> =C2=A0@@ -41,8 +41,8 @@
>> =C2=A0=C2=A0/* Try to fill the TLB and return an exception if error. I=
f retaddr is
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL, it means that the function was cal=
led in C code (i.e. not
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from generated code or from helper.c) */
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CRISCPU *cpu =3D CRIS_CPU(cs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUCRISState *env =3D &cpu->env;
>> =C2=A0@@ -50,7 +50,7 @@ void tlb_fill(CPUState *cs, target_ulong addr,=
 int is_write, int mmu_idx,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0D_LOG("%s pc=3D%x tpc=3D%x ra=3D%p=
\n", __func__,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
env->pc, env->pregs[PR_EDA], (void *)retaddr);
>> =C2=A0- ret =3D cris_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx)=
;
>> =C2=A0+ ret =3D cris_cpu_handle_mmu_fault(cs, addr, access_type, mmu_i=
dx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retadd=
r) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0/* now we have a real cpu fault */
>> =C2=A0diff --git a/target-i386/mem_helper.c b/target-i386/mem_helper.c
>> =C2=A0index c2f4769..5bc0594 100644
>> =C2=A0--- a/target-i386/mem_helper.c
>> =C2=A0+++ b/target-i386/mem_helper.c
>> =C2=A0@@ -140,12 +140,12 @@ void helper_boundl(CPUX86State *env, targe=
t_ulong a0, int v)
>> =C2=A0=C2=A0=C2=A0* from generated code or from helper.c)
>> =C2=A0=C2=A0=C2=A0*/
>> =C2=A0=C2=A0/* XXX: fix it to restore all registers */
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D x86_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
>> =C2=A0+ ret =3D x86_cpu_handle_mmu_fault(cs, addr, access_type, mmu_id=
x);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0X86CPU *cp=
u =3D X86_CPU(cs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUX86Stat=
e *env =3D &cpu->env;
>> =C2=A0diff --git a/target-lm32/op_helper.c b/target-lm32/op_helper.c
>> =C2=A0index 7a550d1..2177c8a 100644
>> =C2=A0--- a/target-lm32/op_helper.c
>> =C2=A0+++ b/target-lm32/op_helper.c
>> =C2=A0@@ -144,12 +144,12 @@ uint32_t HELPER(rcsr_jrx)(CPULM32State *en=
v)
>> =C2=A0=C2=A0=C2=A0* NULL, it means that the function was called in C c=
ode (i.e. not
>> =C2=A0=C2=A0=C2=A0* from generated code or from helper.c)
>> =C2=A0=C2=A0=C2=A0*/
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D lm32_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx)=
;
>> =C2=A0+ ret =3D lm32_cpu_handle_mmu_fault(cs, addr, access_type, mmu_i=
dx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retadd=
r) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0/* now we have a real cpu fault */
>> =C2=A0diff --git a/target-m68k/op_helper.c b/target-m68k/op_helper.c
>> =C2=A0index ff32e35..e41ae46 100644
>> =C2=A0--- a/target-m68k/op_helper.c
>> =C2=A0+++ b/target-m68k/op_helper.c
>> =C2=A0@@ -39,12 +39,12 @@ static inline void do_interrupt_m68k_hardirq=
(CPUM68KState *env)
>> =C2=A0=C2=A0/* Try to fill the TLB and return an exception if error. I=
f retaddr is
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL, it means that the function was cal=
led in C code (i.e. not
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from generated code or from helper.c) */
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D m68k_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx)=
;
>> =C2=A0+ ret =3D m68k_cpu_handle_mmu_fault(cs, addr, access_type, mmu_i=
dx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retadd=
r) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0/* now we have a real cpu fault */
>> =C2=A0diff --git a/target-microblaze/op_helper.c b/target-microblaze/o=
p_helper.c
>> =C2=A0index 0533939..c52253d 100644
>> =C2=A0--- a/target-microblaze/op_helper.c
>> =C2=A0+++ b/target-microblaze/op_helper.c
>> =C2=A0@@ -33,12 +33,12 @@
>> =C2=A0=C2=A0=C2=A0* NULL, it means that the function was called in C c=
ode (i.e. not
>> =C2=A0=C2=A0=C2=A0* from generated code or from helper.c)
>> =C2=A0=C2=A0=C2=A0*/
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D mb_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
>> =C2=A0+ ret =3D mb_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retadd=
r) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0/* now we have a real cpu fault */
>> =C2=A0diff --git a/target-mips/cpu.h b/target-mips/cpu.h
>> =C2=A0index 4ce9d47..3e6221a 100644
>> =C2=A0--- a/target-mips/cpu.h
>> =C2=A0+++ b/target-mips/cpu.h
>> =C2=A0@@ -651,7 +651,8 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState=
 *cpu, vaddr addr);
>> =C2=A0=C2=A0int mips_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf=
, int reg);
>> =C2=A0=C2=A0int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *bu=
f, int reg);
>> =C2=A0=C2=A0void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr add=
r,
>> =C2=A0- int is_write, int is_user, uintptr_t retaddr);
>> =C2=A0+ MMUAccessType access_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr);
>>
>> =C2=A0=C2=A0#if !defined(CONFIG_USER_ONLY)
>> =C2=A0=C2=A0int no_mmu_map_address (CPUMIPSState *env, hwaddr *physica=
l, int *prot,
>> =C2=A0diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
>> =C2=A0index 7cf9807..11ee8ac 100644
>> =C2=A0--- a/target-mips/op_helper.c
>> =C2=A0+++ b/target-mips/op_helper.c
>> =C2=A0@@ -2383,8 +2383,8 @@ void helper_wait(CPUMIPSState *env)
>> =C2=A0=C2=A0#if !defined(CONFIG_USER_ONLY)
>>
>> =C2=A0=C2=A0void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr=
,
>> =C2=A0- int access_type, int is_user,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+ MMUAccessType access_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MIPSCPU *cpu =3D MIPS_CPU(cs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUMIPSState *env =3D &cpu->env;
>> =C2=A0@@ -2405,12 +2405,12 @@ void mips_cpu_do_unaligned_access(CPUSta=
te *cs, vaddr addr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0do_raise_exception_err(env, excp, =
error_code, retaddr);
>> =C2=A0=C2=A0}
>>
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D mips_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx)=
;
>> =C2=A0+ ret =3D mips_cpu_handle_mmu_fault(cs, addr, access_type, mmu_i=
dx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MIPSCPU *c=
pu =3D MIPS_CPU(cs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUMIPSSta=
te *env =3D &cpu->env;
>> =C2=A0diff --git a/target-moxie/helper.c b/target-moxie/helper.c
>> =C2=A0index d51e9b9..330299f 100644
>> =C2=A0--- a/target-moxie/helper.c
>> =C2=A0+++ b/target-moxie/helper.c
>> =C2=A0@@ -29,12 +29,12 @@
>> =C2=A0=C2=A0/* Try to fill the TLB and return an exception if error. I=
f retaddr is
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL, it means that the function was cal=
led in C code (i.e. not
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from generated code or from helper.c) */
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D moxie_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx=
);
>> =C2=A0+ ret =3D moxie_cpu_handle_mmu_fault(cs, addr, access_type, mmu_=
idx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retadd=
r) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0cpu_restore_state(cs, retaddr);
>> =C2=A0diff --git a/target-openrisc/mmu_helper.c b/target-openrisc/mmu_=
helper.c
>> =C2=A0index c0658c3..a44d0aa 100644
>> =C2=A0--- a/target-openrisc/mmu_helper.c
>> =C2=A0+++ b/target-openrisc/mmu_helper.c
>> =C2=A0@@ -25,12 +25,12 @@
>>
>> =C2=A0=C2=A0#ifndef CONFIG_USER_ONLY
>>
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D openrisc_cpu_handle_mmu_fault(cs, addr, is_write, mmu_=
idx);
>> =C2=A0+ ret =3D openrisc_cpu_handle_mmu_fault(cs, addr, access_type, m=
mu_idx);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retadd=
r) {
>> =C2=A0diff --git a/target-ppc/mmu_helper.c b/target-ppc/mmu_helper.c
>> =C2=A0index 485d5b8..3eb3cd7 100644
>> =C2=A0--- a/target-ppc/mmu_helper.c
>> =C2=A0+++ b/target-ppc/mmu_helper.c
>> =C2=A0@@ -2878,8 +2878,8 @@ void helper_check_tlb_flush(CPUPPCState *e=
nv)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL, it means that the function was cal=
led in C code (i.e. not
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from generated code or from helper.c) */
>> =C2=A0=C2=A0/* XXX: fix it to restore all registers */
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>
> If you're using MMUAccessType here..
>
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PowerPCCPU *cpu =3D POWERPC_CPU(cs=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PowerPCCPUClass *pcc =3D POWERPC_C=
PU_GET_CLASS(cs);
>> =C2=A0@@ -2887,9 +2887,9 @@ void tlb_fill(CPUState *cs, target_ulong a=
ddr, int is_write, int mmu_idx,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (pcc->handle_mmu_fault) {
>> =C2=A0- ret =3D pcc->handle_mmu_fault(cpu, addr, is_write, mmu_idx);
>> =C2=A0+ ret =3D pcc->handle_mmu_fault(cpu, addr, access_type, mmu_idx)=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
>> =C2=A0- ret =3D cpu_ppc_handle_mmu_fault(env, addr, is_write, mmu_idx)=
;
>> =C2=A0+ ret =3D cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_i=
dx);
>
> ..surely the prototype of cpu_ppc_handle_mmu_fault() and all the
> others should be change to use it as well.
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret !=3D 0)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (likely=
(retaddr)) {
>> =C2=A0diff --git a/target-s390x/mem_helper.c b/target-s390x/mem_helper=
.c
>> =C2=A0index ec8059a..99bc5e2 100644
>> =C2=A0--- a/target-s390x/mem_helper.c
>> =C2=A0+++ b/target-s390x/mem_helper.c
>> =C2=A0@@ -36,12 +36,12 @@
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL, it means that the function was cal=
led in C code (i.e. not
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from generated code or from helper.c) */
>> =C2=A0=C2=A0/* XXX: fix it to restore all registers */
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D s390_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx)=
;
>> =C2=A0+ ret =3D s390_cpu_handle_mmu_fault(cs, addr, access_type, mmu_i=
dx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret !=3D 0)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (likely=
(retaddr)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0/* now we have a real cpu fault */
>> =C2=A0diff --git a/target-sh4/op_helper.c b/target-sh4/op_helper.c
>> =C2=A0index 303e83e..0204b03 100644
>> =C2=A0--- a/target-sh4/op_helper.c
>> =C2=A0+++ b/target-sh4/op_helper.c
>> =C2=A0@@ -24,12 +24,12 @@
>>
>> =C2=A0=C2=A0#ifndef CONFIG_USER_ONLY
>>
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D superh_cpu_handle_mmu_fault(cs, addr, is_write, mmu_id=
x);
>> =C2=A0+ ret =3D superh_cpu_handle_mmu_fault(cs, addr, access_type, mmu=
_idx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* now we =
have a real cpu fault */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retadd=
r) {
>> =C2=A0diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
>> =C2=A0index ba37f4b..78c9010 100644
>> =C2=A0--- a/target-sparc/cpu.h
>> =C2=A0+++ b/target-sparc/cpu.h
>> =C2=A0@@ -540,9 +540,10 @@ void sparc_cpu_dump_state(CPUState *cpu, FI=
LE *f,
>> =C2=A0=C2=A0hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr =
addr);
>> =C2=A0=C2=A0int sparc_cpu_gdb_read_register(CPUState *cpu, uint8_t *bu=
f, int reg);
>> =C2=A0=C2=A0int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *b=
uf, int reg);
>> =C2=A0-void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu,
>> =C2=A0- vaddr addr, int is_write,
>> =C2=A0- int is_user, uintptr_t retaddr);
>> =C2=A0+void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu,=
 vaddr addr,
>> =C2=A0+ MMUAccessType access_type,
>> =C2=A0+ int mmu_idx,
>> =C2=A0+ uintptr_t retaddr);
>>
>> =C2=A0=C2=A0#ifndef NO_CPU_IO_DEFS
>> =C2=A0=C2=A0/* cpu_init.c */
>> =C2=A0diff --git a/target-sparc/ldst_helper.c b/target-sparc/ldst_help=
er.c
>> =C2=A0index f73cf6d..e941cac 100644
>> =C2=A0--- a/target-sparc/ldst_helper.c
>> =C2=A0+++ b/target-sparc/ldst_helper.c
>> =C2=A0@@ -2420,9 +2420,10 @@ void sparc_cpu_unassigned_access(CPUState=
 *cs, hwaddr addr,
>> =C2=A0=C2=A0#endif
>>
>> =C2=A0=C2=A0#if !defined(CONFIG_USER_ONLY)
>> =C2=A0-void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs,
>> =C2=A0- vaddr addr, int is_write,
>> =C2=A0- int is_user, uintptr_t retaddr)
>> =C2=A0+void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, =
vaddr addr,
>> =C2=A0+ MMUAccessType access_type,
>> =C2=A0+ int mmu_idx,
>> =C2=A0+ uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SPARCCPU *cpu =3D SPARC_CPU(cs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUSPARCState *env =3D &cpu->env;
>> =C2=A0@@ -2441,12 +2442,12 @@ void QEMU_NORETURN sparc_cpu_do_unaligne=
d_access(CPUState *cs,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL, it means that the function was cal=
led in C code (i.e. not
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from generated code or from helper.c) */
>> =C2=A0=C2=A0/* XXX: fix it to restore all registers */
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D sparc_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx=
);
>> =C2=A0+ ret =3D sparc_cpu_handle_mmu_fault(cs, addr, access_type, mmu_=
idx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retadd=
r) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0cpu_restore_state(cs, retaddr);
>> =C2=A0diff --git a/target-tricore/op_helper.c b/target-tricore/op_help=
er.c
>> =C2=A0index a73ed53..873a123 100644
>> =C2=A0--- a/target-tricore/op_helper.c
>> =C2=A0+++ b/target-tricore/op_helper.c
>> =C2=A0@@ -2833,11 +2833,11 @@ static inline void QEMU_NORETURN do_rais=
e_exception_err(CPUTriCoreState *env,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cpu_loop_exit(cs);
>> =C2=A0=C2=A0}
>>
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, in=
t mmu_idx,
>> =C2=A0- uintptr_t retaddr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>> =C2=A0- ret =3D cpu_tricore_handle_mmu_fault(cs, addr, is_write, mmu_i=
dx);
>> =C2=A0+ ret =3D cpu_tricore_handle_mmu_fault(cs, addr, access_type, mm=
u_idx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0TriCoreCPU=
 *cpu =3D TRICORE_CPU(cs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUTriCore=
State *env =3D &cpu->env;
>> =C2=A0diff --git a/target-unicore32/op_helper.c b/target-unicore32/op_=
helper.c
>> =C2=A0index a782d33..0872c29 100644
>> =C2=A0--- a/target-unicore32/op_helper.c
>> =C2=A0+++ b/target-unicore32/op_helper.c
>> =C2=A0@@ -244,12 +244,12 @@ uint32_t HELPER(ror_cc)(CPUUniCore32State =
*env, uint32_t x, uint32_t i)
>> =C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0#ifndef CONFIG_USER_ONLY
>> =C2=A0-void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType ac=
cess_type,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0- ret =3D uc32_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx)=
;
>> =C2=A0+ ret =3D uc32_cpu_handle_mmu_fault(cs, addr, access_type, mmu_i=
dx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retadd=
r) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0/* now we have a real cpu fault */
>> =C2=A0diff --git a/target-xtensa/cpu.h b/target-xtensa/cpu.h
>> =C2=A0index 442176a..3c1aaf4 100644
>> =C2=A0--- a/target-xtensa/cpu.h
>> =C2=A0+++ b/target-xtensa/cpu.h
>> =C2=A0@@ -414,7 +414,8 @@ hwaddr xtensa_cpu_get_phys_page_debug(CPUSta=
te *cpu, vaddr addr);
>> =C2=A0=C2=A0int xtensa_cpu_gdb_read_register(CPUState *cpu, uint8_t *b=
uf, int reg);
>> =C2=A0=C2=A0int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *=
buf, int reg);
>> =C2=A0=C2=A0void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr a=
ddr,
>> =C2=A0- int is_write, int is_user, uintptr_t retaddr);
>> =C2=A0+ MMUAccessType access_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr);
>>
>> =C2=A0=C2=A0#define cpu_exec cpu_xtensa_exec
>> =C2=A0=C2=A0#define cpu_signal_handler cpu_xtensa_signal_handler
>> =C2=A0diff --git a/target-xtensa/op_helper.c b/target-xtensa/op_helper=
.c
>> =C2=A0index bc3667f..0a4b214 100644
>> =C2=A0--- a/target-xtensa/op_helper.c
>> =C2=A0+++ b/target-xtensa/op_helper.c
>> =C2=A0@@ -35,7 +35,8 @@
>> =C2=A0=C2=A0#include "qemu/timer.h"
>>
>> =C2=A0=C2=A0void xtensa_cpu_do_unaligned_access(CPUState *cs,
>> =C2=A0- vaddr addr, int is_write, int is_user, uintptr_t retaddr)
>> =C2=A0+ vaddr addr, MMUAccessType access_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0XtensaCPU *cpu =3D XTENSA_CPU(cs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUXtensaState *env =3D &cpu->env;
>> =C2=A0@@ -48,19 +49,19 @@ void xtensa_cpu_do_unaligned_access(CPUState=
 *cs,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> =C2=A0=C2=A0}
>>
>> =C2=A0-void tlb_fill(CPUState *cs,
>> =C2=A0- target_ulong vaddr, int is_write, int mmu_idx, uintptr_t retad=
dr)
>> =C2=A0+void tlb_fill(CPUState *cs, target_ulong vaddr, MMUAccessType a=
ccess_type,
>> =C2=A0+ int mmu_idx, uintptr_t retaddr)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0XtensaCPU *cpu =3D XTENSA_CPU(cs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPUXtensaState *env =3D &cpu->env;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t paddr;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t page_size;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned access;
>> =C2=A0- int ret =3D xtensa_get_physical_addr(env, true, vaddr, is_writ=
e, mmu_idx,
>> =C2=A0+ int ret =3D xtensa_get_physical_addr(env, true, vaddr, access_=
type, mmu_idx,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0&paddr, &page_size, &access);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_log_mask(CPU_LOG_MMU, "%s(%08=
x, %d, %d) -> %08x, ret =3D %d\n",
>> =C2=A0- __func__, vaddr, is_write, mmu_idx, paddr, ret);
>> =C2=A0+ __func__, vaddr, access_type, mmu_idx, paddr, ret);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret =3D=3D 0) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tlb_set_pa=
ge(cs,
>
> --
> David Gibson | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au | minimalist, thank you. NOT _the_ _othe=
r_
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| _way_ _around_!
> http://www.ozlabs.org/~dgibson

I agree. But I think it's a subject for a separate patch.
May be I'll fix it later, but I didn't plan it for a nearest future.
