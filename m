Received: by 10.80.166.35 with SMTP id d32csp844720edc;
        Thu, 3 Nov 2016 13:42:29 -0700 (PDT)
X-Received: by 10.200.50.227 with SMTP id a32mr10304801qtb.32.1478205749298;
        Thu, 03 Nov 2016 13:42:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si5232373qky.98.2016.11.03.13.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Nov 2016 13:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c2OqC-0002a9-MC
	for alex.bennee@linaro.org; Thu, 03 Nov 2016 16:42:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <james.h.bates@gmail.com>) id 1c2Nat-0006CI-7F
	for qemu-arm@nongnu.org; Thu, 03 Nov 2016 15:22:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <james.h.bates@gmail.com>) id 1c2Naq-0001pt-Ts
	for qemu-arm@nongnu.org; Thu, 03 Nov 2016 15:22:35 -0400
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f]:34286)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <james.h.bates@gmail.com>)
	id 1c2Naq-0001ph-OE
	for qemu-arm@nongnu.org; Thu, 03 Nov 2016 15:22:32 -0400
Received: by mail-qk0-x22f.google.com with SMTP id q130so70683003qke.1
	for <qemu-arm@nongnu.org>; Thu, 03 Nov 2016 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=eb9mqUEA2/tr3FZTnlovIXIxLDgk08ROapghh1W6zYw=;
	b=btuHevJ6DLbXKdIPt70Fh0Zet7Qzx2JbJqAG7MDTciUaALI+9IQGl8SgIYYDuOAiSq
	M+Z5PrOJwXPM91I589y4hx1FzYqneOkoPJNL81sRnudX2CaDdi+vRiV2u5hKLnOFau0Q
	CHpKQytsgswqjwrWgz2YR84XFM9ZkNjuOeByiWTAwkySB8/GZtH9WPtTGWB76UXySOD1
	Y8tx0emKZAr7++ddjzGjOdc1wEU2fPVSfpiCgAfCHdVVzNg55f1AFBs6KRVxWeiF5+ui
	6qOZEy34mfT9dr1SWuyoCdrP2IJjpCw+d9hC0USVuEy+D0gYOLzdD2qNpjUC6Ev98cl+
	xE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=eb9mqUEA2/tr3FZTnlovIXIxLDgk08ROapghh1W6zYw=;
	b=QXTH+sqC/2j3Glc4ppK9qCthQIIePuOo63g13IJ6xqK1KIGHO+X7o/ICh/7+LXDro1
	cJMvRPOnCysYqmaSTpBlSwasJFHoyIz1QK0Tv/dXutdigwsMSa/TnBh1FypZKa9PNBnG
	Qsa/sv79Y9lpqMNI0MO6Yb1SuIIFwvypzl+Mj3zjvm5CennKSarNRMU9FE9WduSdfUYM
	rIr3GZvtBgoDkp03tuJepCh17kSITmmRa6zkRicphFiDQ4ww7M/9EIkIrDCAG2gtRUNt
	ABAkN9kLUadbZWIVIeda3qNneOJYys0sNxNt9fS4NPfHvMtvRiwWKAZNY4A3rVIQRpX2
	1S2A==
X-Gm-Message-State: ABUngvcHhBuFdT+uEH6iriyRjrr7ZCX3ZMVVB+JUNYTo1ObubWtp03rtzu24GQAIvDuyBxkuvEAIZx1jMdt32w==
X-Received: by 10.55.124.66 with SMTP id x63mr10642310qkc.196.1478200951593;
	Thu, 03 Nov 2016 12:22:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.43.134 with HTTP; Thu, 3 Nov 2016 12:22:31 -0700 (PDT)
From: James Bates <james.h.bates@gmail.com>
Date: Thu, 3 Nov 2016 20:22:31 +0100
Message-ID: <CAGvmnf5JufXuJsrkPh6MstUM-hmXargXCJ3gWC19+_AD6bTW0g@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22f
X-Mailman-Approved-At: Thu, 03 Nov 2016 16:40:46 -0400
Subject: [Qemu-arm] [PATCH] enable and complete trivial Jazelle
 implementation in qemu-arm
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3CWilY5/JhWh

Hello all,

I am new to qemu-arm, and this message might seem a little "long". I
just want to make sure I cover all my thoughts, and don't leave out
anything important. The "good bits" are at the end of the message, if
you're already familiar with the material ;)

Jazelle, as far as I can tell, was first introduced as an extension on
top of ARMv5TE, called ARMv5TEJ. One of the first processor designs to
implement it was the ARM926 (full name ARM926EJ-S).

The oldest description of it that I could find, is in the "ARM
Architecture Reference Manual", Issue I (July 2005) [ARM DDI 0100I]
(found a copy here:
http://www.cgl.uwaterloo.ca/wmcowan/teaching/cs452/pdf/arm-architecture.pdf)

According to that manual, Chapter A2.10 ("The Jazelle Extension"),
page A2-53 &ff., a processor implementing the extension:
- provides a new instruction "BXJ" (Chapter A2.10.3, page A2-55)
- provides new configuration and control registers (Chapter A2.10.5,
page A2-62),
 accessible through Coprocessor 14 (CP14). These include at a minium:
* "Jazelle ID register" (CP14, 7, c0, c0, 0). In later reference
manuals, it is called JIDR.
* "Main configuration register" (CP14, 7, c2, c0, 0). In later
reference manuals, it is called JMCR.
* "Operating system control register (CP, 7, c1, c0, 0). In later
reference manuals, it ic called JOSCR.
* Further implementation-defined configuration registers are possible.


Providing an implementation of this extension is mandatory for ARMv6
and later versions, with exceptions for the "M" profiles of ARMv6 and
ARMv7. In ARMv5 is an optional extension, its presence designated by
the "J" in e.g. ARMv5TEJ

An implementation of this extension may be the so-called "trivial
implementation", Chapter A2.10.7, page A2-68. Such an implementation,
in a nutshell:
- provides an instruction "BXJ" which behaves identically to instruction "BX".
- implements the 3 configuration and control registers JIDR, JMCR and
JOSCR in CP14 as RAZ(read-as-azero) registers, which ignore writes.


ARMv8 in its AArch32 instruction set still includes these, but
mandates that the implementation shall be the trivial implementation.
AArch64 has no BXJ instruction, and no configuration registers, and so
is unaffected by Jazelle.

Below is a small test program, with gcc inlined assembler, which tries
out the BXJ instruction, and the 3 configuration registers. It uses a
sigaction handler to catch the probable "illegal instruction" CPU
exceptions.
--------------------------------------------------------------------------------------
test_jazelle.c (compile using <cross-prefix>-gcc -o test_jazelle test_jazelle.c)
--------------------------------------------------------------------------------------
#include <stdio.h>
#include <signal.h>

static void soft_java() {
    printf("Welcome to the software bytecode handler.\n");
}

static void sigill_handler (int signo, siginfo_t *si, void *data) {
    printf("Illegal instruction occurred.\n");

    /* skip illegal instruction: always 4 bytes on ARM */
    ((ucontext_t *)data)->uc_mcontext.arm_pc += 4;
}

int main() {
    const struct sigaction sigill_action
    = {.sa_sigaction = sigill_handler, .sa_flags = SA_SIGINFO};
    sigaction(SIGILL, &sigill_action, NULL);

    volatile register int reg;

    /*
     * If the coprocessor register read (mrc) should fail, the sigill
signal handler
     * will skip it, and resume executing just behind it. This is the
gcc-generated code
     * which will store the value of whatever register it chose for %0
into reg. In
     * other words, reg is always written, whether the mrc succeeded
or not. In order to
     * deal with this, we preload the %0 register with -1, which it
will still contain if
     * the mrc fails, thus allowing the subsequent C-code to detect the fact.
     */
    printf("Attempting to read JIDR... ");
    __asm__("mov %0, #-1\n\tmrc p14, 7, %0, c0, c0, 0" : "=r" (reg));
    if (reg != -1)
    printf("JIDR contents are: 0x%x.\n", reg);

    printf("Attempting to read JOSCR... ");
    __asm__("mov %0, #-1\n\tmrc p14, 7, %0, c1, c0, 0" : "=r" (reg));
    if (reg != -1)
    printf("JOSCR contents are: 0x%x.\n", reg);

    printf("Attempting to read JMCR... ");
    __asm__("mov %0, #-1\n\tmrc p14, 7, %0, c2, c0, 0" : "=r" (reg));
    if (reg != -1)
        printf("JMCR contents are: 0x%x.\n", reg);


    /*
     * BXJ is a jump, not a call. Simulate call by loading lr first.
     * At the MOV instruction, pc will point to itself+8 bytes (pipelining),
     * i.e. just beyond the BXJ instruction. Just what we need.
     */
    printf("Attempting to jump to bytecode handler... ");
    __asm__("mov lr, pc\n\tbxj %0\n" : : "r" (&soft_java) : "lr");

    printf("Have a nice day.\n");
    return 0;
}
------------------------------------------------------------------------------------------

The only ARM silicon I have access to, is a BCM2836 Cortex-A7 ARMv7-A
in my raspberry Pi 2. When I run this program on it, the output is:

Attempting to read JIDR... JIDR contents are: 0x0.
Attempting to read JOSCR... Illegal instruction occurred.
Attempting to read JMCR... Illegal instruction occurred.
Attempting to jump to bytecode handler... Welcome to the software
bytecode handler.
Have a nice day.

The JIDR register shows that the implementation is the trivial
implementation. This is confirmed by
the bxj instruction, which indeed behaves exactly as bx would have.
Reads of JOSCR and JMCR fail, as this program runs at PL0, where such
reads are indeed prohibited (details in Chapter A2.10.5).

To test reading JOSCR and JMCR, we must run code at PL1, e.g. in a
Linux kernel module. Below is a small Linux kernel module to do just
that:
--------------------------------------------------------------------------------------
ktest_jazelle.c (to compile, write "objs-m += ktest_jazelle.o" to
Makefile. Then:
CROSS_COMPILE=<cross-prefix>- ARCH=arm make -C <linux-src> M=$(pwd) modules)
--------------------------------------------------------------------------------------
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("James Bates");
MODULE_DESCRIPTION("Test of ARM Jazelle registers.");
MODULE_VERSION("0.1");

static int __init ktest_jazelle_init(void){

    volatile register unsigned int reg;

    __asm__("mrc p14, 7, %0, c0, c0, 0" : "=r" (reg));
    printk(KERN_INFO "ktest_jazelle: JIDR contents are: 0x%x.\n", reg);
    __asm__("mrc p14, 7, %0, c1, c0, 0" : "=r" (reg));
    printk(KERN_INFO "ktest_jazelle: JOSCR contents are: 0x%x.\n", reg);
    __asm__("mrc p14, 7, %0, c2, c0, 0" : "=r" (reg));
    printk(KERN_INFO "ktest_jazelle: JMCR contents are: 0x%x.\n", reg);
    return 0;
}

static void __exit ktest_jazelle_exit(void){
    printk(KERN_INFO "ktest_jazelle: Have a nice day!\n");
}

module_init(ktest_jazelle_init);
module_exit(ktest_jazelle_exit);
-------------------------------------------------------------------------------------

When loading ktest_jazelle.ko into a native kernel on ARMv7-A silicon,
it produces the following output (in dmesg):

[592366.323303] ktest_jazelle: JIDR contents are: 0x0.
[592366.323327] ktest_jazelle: JOSCR contents are: 0x0.
[592366.323337] ktest_jazelle: JMCR contents are: 0x0.

So, at PL1, JOSCR and JMCR are all accessible, and read as zero, which
is consistent with the expected behaviour of a trivial implementation,
according to Chapter A2.10.7. The BRCM2836 silicon seems to be
behaving well.


Finally, we come to QEMU ;) All that follows was performed on the
latest "master" branch of the qemu git repo at
git://git.qemu.org/qemu.git. It reports itself as "QEMU emulator
version 2.7.50 (v2.7.0-1777-g4eb28ab)". The QEMU host system is a
x86_64. When running QEMU with an emulated ARMv7 (e.g. qemu-arm -cpu
cortex-a8 test_jazelle), the test_jazelle programme produces:

Attempting to read JIDR... Illegal instruction occurred.
Attempting to read JOSCR... Illegal instruction occurred.
Attempting to read JMCR... Illegal instruction occurred.
Attempting to jump to bytecode handler... Illegal instruction occurred.
Have a nice day.

The JIDR register is not readable, and the BXJ instruction is an
"illegal instruction". Likewise, trying to load ktest_jazelle.ko into
an ARMv7-a linux kernel running in qemu, produces:

# insmod ktest_jazelle.ko
Internal error: Oops - undefined instruction: 0 [#1] ARM
Modules linked in: ktest_jazelle(O+)
CPU: 0 PID: 54 Comm: insmod Tainted: G           O    4.4.0 #1
Hardware name: ARM-Versatile PB
task: cf279140 ti: cf2a8000 task.ti: cf2a8000
PC is at ktest_jazelle_init+0x4/0x5c [ktest_jazelle]
...

An illegal instruction occurs at the second (offset +0x4) instruction
inside ktest_jazelle_init:
$ objdump -d ktest_jazelle.ko

ktest_jazelle.ko:     file format elf32-littlearm


Disassembly of section .init.text:

00000000 <init_module>:
   0: e52de004 push {lr} ; (str lr, [sp, #-4]!)
   4: eef03e10 mrc 14, 7, r3, cr0, cr0, {0}
...

Indeed, it's the mrc attempted read of JIDR.

The conclusion is that qemu-arm, even when emulating architecture
versions that require the Jazelle extensions (possibly the trivial
one), doesn't provide it: neither BXJ, nor reads of the JIDR, JOSCR
and JMCR are available, whether at PL0 or PL1.

Checking the qemu sources, I notice (in target-arm/translate.c), that
there is actually code to deal with "BXJ" (l. 8252-8257), but that it
is permantenly disabled, because of this definition
(target-arm/translation.c, l. 44):

#define ENABLE_ARCH_5J    0

On the other hand, none of the required trivial jazelle registers
(JIDR, JOCR, JMCR) are implemented (in helper.c).

Below, I provide a patch against the current git qemu "master" branch, which:

- defines a feature ARM_FEATURE_JAZELLE in target-arm/cpu.h
- activates this feature for any ARMv6 or above cpu, and adds it to
the arm926 cpu definition (in target-arm/cpu.c)
- activates the BXJ instruction if ARM_FEATURE_JAZELLE is available
(in target-arm/translate.c)
- provides trivial read-as-zero registers JIDR, JOCR and JMCR if
ARM_FEATURE_JAZELLE is available (in target-arm/helper.c)

Applying the patch, and running the user (PL0) mode test_jazelle, and
kernel (PL1) module ktest_jazelle.ko through qemu again, now
produces identical results to the behaviour on real hardware (my RPI-2 BCM2836).

Since the change is not very big or complex, might I request
considering adding it to the qemu-arm mainline code, thus rendering
the arm emulation more standards-compliant, and (hopefully) allowing
so-called "EJVM"s (Chapter A2.10.6, page A2-67) to run in qemu?

Thank you and kind regards,
James Bates

-----------------------------------------------------------------------------------------------
qemu-enable-jazelle.patch
-----------------------------------------------------------------------------------------------
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 99f0dbe..7e693da 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -605,6 +605,7 @@ static void arm_cpu_realizefn(DeviceState *dev,
Error **errp)
     if (arm_feature(env, ARM_FEATURE_V6)) {
         set_feature(env, ARM_FEATURE_V5);
         if (!arm_feature(env, ARM_FEATURE_M)) {
+            set_feature(env, ARM_FEATURE_JAZELLE);
             set_feature(env, ARM_FEATURE_AUXCR);
         }
     }
@@ -786,6 +787,7 @@ static void arm926_initfn(Object *obj)

     cpu->dtb_compatible = "arm,arm926";
     set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_JAZELLE);
     set_feature(&cpu->env, ARM_FEATURE_VFP);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index ca5c849..caa2128 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1124,6 +1124,7 @@ enum arm_features {
     ARM_FEATURE_V8_SHA256, /* implements SHA256 part of v8 Crypto Extensions */
     ARM_FEATURE_V8_PMULL, /* implements PMULL part of v8 Crypto Extensions */
     ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
+    ARM_FEATURE_JAZELLE, /* has Jazelle (possibly trivial) support */
     ARM_FEATURE_PMU, /* has PMU support */
 };

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 25b15dc..6dba14b 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -1380,6 +1380,19 @@ static const ARMCPRegInfo t2ee_cp_reginfo[] = {
     REGINFO_SENTINEL
 };

+static const ARMCPRegInfo jazelle_cp_reginfo[] = {
+    { .name = "JIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 7, .opc2 = 0,
+      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
+      .resetvalue = 0 },
+    { .name = "JOSCR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 7, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
+      .resetvalue = 0 },
+    { .name = "JMCR", .cp = 14, .crn = 2, .crm = 0, .opc1 = 7, .opc2 = 0,
+      .access = PL1_R | PL0_W, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
+      .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
+
 static const ARMCPRegInfo v6k_cp_reginfo[] = {
     { .name = "TPIDR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 2, .crn = 13, .crm = 0,
@@ -4882,6 +4895,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (arm_feature(env, ARM_FEATURE_THUMB2EE)) {
         define_arm_cp_regs(cpu, t2ee_cp_reginfo);
     }
+    if (arm_feature(env, ARM_FEATURE_JAZELLE)) {
+        define_arm_cp_regs(cpu, jazelle_cp_reginfo);
+    }
     if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
         define_arm_cp_regs(cpu, generic_timer_cp_reginfo);
     }
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 0ad9070..c305969 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -41,7 +41,7 @@
 #define ENABLE_ARCH_5     arm_dc_feature(s, ARM_FEATURE_V5)
 /* currently all emulated v5 cores are also v5TE, so don't bother */
 #define ENABLE_ARCH_5TE   arm_dc_feature(s, ARM_FEATURE_V5)
-#define ENABLE_ARCH_5J    0
+#define ENABLE_ARCH_5J    arm_dc_feature(s, ARM_FEATURE_JAZELLE)
 #define ENABLE_ARCH_6     arm_dc_feature(s, ARM_FEATURE_V6)
 #define ENABLE_ARCH_6K    arm_dc_feature(s, ARM_FEATURE_V6K)
 #define ENABLE_ARCH_6T2   arm_dc_feature(s, ARM_FEATURE_THUMB2)
------------------------------------------------------------------------------------------------------
