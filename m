Received: by 10.80.163.71 with SMTP id 65csp2673916edn;
        Wed, 5 Oct 2016 06:38:39 -0700 (PDT)
X-Received: by 10.129.116.9 with SMTP id p9mr7337073ywc.151.1475674719756;
        Wed, 05 Oct 2016 06:38:39 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z133si7342927ywa.219.2016.10.05.06.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 06:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brmP8-0006oC-V7
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 09:38:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>) id 1brmN1-0005Sq-QI
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 09:36:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>) id 1brmMz-0005ww-4f
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 09:36:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46540)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>)
	id 1brmMt-0005ug-0H; Wed, 05 Oct 2016 09:36:19 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63BFC6A6CE;
	Wed,  5 Oct 2016 13:36:18 +0000 (UTC)
Received: from potion (dhcp-1-247.brq.redhat.com [10.34.1.247])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u95DaEdY019640; Wed, 5 Oct 2016 09:36:15 -0400
Received: by potion (sSMTP sendmail emulation); Wed, 05 Oct 2016 15:36:14 +0200
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Oct 2016 15:35:30 +0200
Message-Id: <20161005133530.5702-3-rkrcmar@redhat.com>
In-Reply-To: <20161005133530.5702-1-rkrcmar@redhat.com>
References: <20161005133530.5702-1-rkrcmar@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 05 Oct 2016 13:36:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/2] coccinelle: use object_new_with_class() in
 obvious cases
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Rob Herring <robh@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Alexander Graf <agraf@suse.de>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KOPo8MAfICCt

object_new_with_class(class) does a better job than
object_new(object_class_get_name(class)), because
object_class_get_name() lost the class->type and object_new() looked it
up again from the name.

Manually changed vl.c to fit into 80 character line.

Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
---
 hw/arm/exynos4210.c                            | 2 +-
 hw/arm/highbank.c                              | 2 +-
 hw/arm/integratorcp.c                          | 2 +-
 hw/arm/realview.c                              | 2 +-
 hw/arm/versatilepb.c                           | 2 +-
 hw/arm/vexpress.c                              | 2 +-
 hw/arm/xilinx_zynq.c                           | 2 +-
 qom/cpu.c                                      | 2 +-
 scripts/coccinelle/object_new_with_class.cocci | 5 +++++
 target-alpha/cpu.c                             | 2 +-
 target-i386/cpu.c                              | 2 +-
 target-m68k/helper.c                           | 2 +-
 target-s390x/cpu_models.c                      | 2 +-
 target-xtensa/helper.c                         | 2 +-
 vl.c                                           | 4 ++--
 15 files changed, 20 insertions(+), 15 deletions(-)
 create mode 100644 scripts/coccinelle/object_new_with_class.cocci

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index be3c96d21ea3..6be8ef4b25d1 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -153,7 +153,7 @@ Exynos4210State *exynos4210_init(MemoryRegion *system=
_mem,
     assert(cpu_oc);
=20
     for (n =3D 0; n < EXYNOS4210_NCPUS; n++) {
-        Object *cpuobj =3D object_new(object_class_get_name(cpu_oc));
+        Object *cpuobj =3D object_new_with_class(cpu_oc);
=20
         /* By default A9 CPUs have EL3 enabled.  This board does not cur=
rently
          * support EL3 so the CPU EL3 property is disabled before realiz=
ation.
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 80e5fd458bee..0a4eb83748d3 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -248,7 +248,7 @@ static void calxeda_init(MachineState *machine, enum =
cxmachines machine_id)
         Object *cpuobj;
         ARMCPU *cpu;
=20
-        cpuobj =3D object_new(object_class_get_name(oc));
+        cpuobj =3D object_new_with_class(oc);
         cpu =3D ARM_CPU(cpuobj);
=20
         object_property_set_int(cpuobj, QEMU_PSCI_CONDUIT_SMC,
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 039812a3fd86..211abe1caae6 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -555,7 +555,7 @@ static void integratorcp_init(MachineState *machine)
         exit(1);
     }
=20
-    cpuobj =3D object_new(object_class_get_name(cpu_oc));
+    cpuobj =3D object_new_with_class(cpu_oc);
=20
     /* By default ARM1176 CPUs have EL3 enabled.  This board does not
      * currently support EL3 so the CPU EL3 property is disabled before
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 8eafccaf1de8..e63fae0450d2 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -103,7 +103,7 @@ static void realview_init(MachineState *machine,
     }
=20
     for (n =3D 0; n < smp_cpus; n++) {
-        Object *cpuobj =3D object_new(object_class_get_name(cpu_oc));
+        Object *cpuobj =3D object_new_with_class(cpu_oc);
=20
         /* By default A9,A15 and ARM1176 CPUs have EL3 enabled.  This bo=
ard
          * does not currently support EL3 so the CPU EL3 property is dis=
abled
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 8ae5392bcc16..ab54d94edb85 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -208,7 +208,7 @@ static void versatile_init(MachineState *machine, int=
 board_id)
         exit(1);
     }
=20
-    cpuobj =3D object_new(object_class_get_name(cpu_oc));
+    cpuobj =3D object_new_with_class(cpu_oc);
=20
     /* By default ARM1176 CPUs have EL3 enabled.  This board does not
      * currently support EL3 so the CPU EL3 property is disabled before
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 58760f40ca22..41eb6df18d77 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -215,7 +215,7 @@ static void init_cpus(const char *cpu_model, const ch=
ar *privdev,
=20
     /* Create the actual CPUs */
     for (n =3D 0; n < smp_cpus; n++) {
-        Object *cpuobj =3D object_new(object_class_get_name(cpu_oc));
+        Object *cpuobj =3D object_new_with_class(cpu_oc);
=20
         if (!secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 7dac20d67dce..181da39ca100 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -177,7 +177,7 @@ static void zynq_init(MachineState *machine)
     }
     cpu_oc =3D cpu_class_by_name(TYPE_ARM_CPU, cpu_model);
=20
-    cpu =3D ARM_CPU(object_new(object_class_get_name(cpu_oc)));
+    cpu =3D ARM_CPU(object_new_with_class(cpu_oc));
=20
     /* By default A9 CPUs have EL3 enabled.  This board does not
      * currently support EL3 so the CPU EL3 property is disabled before
diff --git a/qom/cpu.c b/qom/cpu.c
index 484c49388d6d..9f9dc6e6a3d2 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -73,7 +73,7 @@ CPUState *cpu_generic_init(const char *typename, const =
char *cpu_model)
         goto out;
     }
=20
-    cpu =3D CPU(object_new(object_class_get_name(oc)));
+    cpu =3D CPU(object_new_with_class(oc));
     object_property_set_bool(OBJECT(cpu), true, "realized", &err);
=20
 out:
diff --git a/scripts/coccinelle/object_new_with_class.cocci b/scripts/coc=
cinelle/object_new_with_class.cocci
new file mode 100644
index 000000000000..2b1413675322
--- /dev/null
+++ b/scripts/coccinelle/object_new_with_class.cocci
@@ -0,0 +1,5 @@
+@@
+expression x;
+@@
+- object_new(object_class_get_name(x))
++ object_new_with_class(x)
diff --git a/target-alpha/cpu.c b/target-alpha/cpu.c
index 6d01d7f75e9e..f89880451bcf 100644
--- a/target-alpha/cpu.c
+++ b/target-alpha/cpu.c
@@ -162,7 +162,7 @@ AlphaCPU *cpu_alpha_init(const char *cpu_model)
         /* Default to ev67; no reason not to emulate insns by default.  =
*/
         cpu_class =3D object_class_by_name(TYPE("ev67"));
     }
-    cpu =3D ALPHA_CPU(object_new(object_class_get_name(cpu_class)));
+    cpu =3D ALPHA_CPU(object_new_with_class(cpu_class));
=20
     object_property_set_bool(OBJECT(cpu), true, "realized", NULL);
=20
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 13505ab156e0..9a4c6ec190cf 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -2866,7 +2866,7 @@ static void x86_cpu_apic_create(X86CPU *cpu, Error =
**errp)
     APICCommonState *apic;
     ObjectClass *apic_class =3D OBJECT_CLASS(apic_get_class());
=20
-    cpu->apic_state =3D DEVICE(object_new(object_class_get_name(apic_cla=
ss)));
+    cpu->apic_state =3D DEVICE(object_new_with_class(apic_class));
=20
     object_property_add_child(OBJECT(cpu), "lapic",
                               OBJECT(cpu->apic_state), &error_abort);
diff --git a/target-m68k/helper.c b/target-m68k/helper.c
index 89bbe6dfa6fc..bffbb26aba1c 100644
--- a/target-m68k/helper.c
+++ b/target-m68k/helper.c
@@ -110,7 +110,7 @@ M68kCPU *cpu_m68k_init(const char *cpu_model)
     if (oc =3D=3D NULL) {
         return NULL;
     }
-    cpu =3D M68K_CPU(object_new(object_class_get_name(oc)));
+    cpu =3D M68K_CPU(object_new_with_class(oc));
     env =3D &cpu->env;
=20
     register_m68k_insns(env);
diff --git a/target-s390x/cpu_models.c b/target-s390x/cpu_models.c
index 3ff6a702f9af..3865fdc1c9ef 100644
--- a/target-s390x/cpu_models.c
+++ b/target-s390x/cpu_models.c
@@ -334,7 +334,7 @@ static void cpu_model_from_info(S390CPUModel *model, =
const CpuModelInfo *info,
         error_setg(errp, "The CPU definition '%s' requires KVM", info->n=
ame);
         return;
     }
-    obj =3D object_new(object_class_get_name(oc));
+    obj =3D object_new_with_class(oc);
     cpu =3D S390_CPU(obj);
=20
     if (!cpu->model) {
diff --git a/target-xtensa/helper.c b/target-xtensa/helper.c
index 768b32c41724..7672a13521ea 100644
--- a/target-xtensa/helper.c
+++ b/target-xtensa/helper.c
@@ -124,7 +124,7 @@ XtensaCPU *cpu_xtensa_init(const char *cpu_model)
         return NULL;
     }
=20
-    cpu =3D XTENSA_CPU(object_new(object_class_get_name(oc)));
+    cpu =3D XTENSA_CPU(object_new_with_class(oc));
     env =3D &cpu->env;
=20
     xtensa_irq_init(env);
diff --git a/vl.c b/vl.c
index f3abd99eb2f9..df15bd5bf883 100644
--- a/vl.c
+++ b/vl.c
@@ -4076,8 +4076,8 @@ int main(int argc, char **argv, char **envp)
     }
 #endif
=20
-    current_machine =3D MACHINE(object_new(object_class_get_name(
-                          OBJECT_CLASS(machine_class))));
+    current_machine =3D MACHINE(
+                           object_new_with_class(OBJECT_CLASS(machine_cl=
ass)));
     if (machine_help_func(qemu_get_machine_opts(), current_machine)) {
         exit(0);
     }
--=20
2.10.0

