Received: by 10.25.44.15 with SMTP id s15csp982383lfs;
        Fri, 14 Jul 2017 07:10:47 -0700 (PDT)
X-Received: by 10.237.35.239 with SMTP id k44mr11071059qtc.125.1500041447054;
        Fri, 14 Jul 2017 07:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500041447; cv=none;
        d=google.com; s=arc-20160816;
        b=lZv8iqi34PyUt7PC/6WY0Oef+RnS3q7Yt7tn5Oc+3On5zgU0XHNfTNpd/2P7+D6xkU
         vBLwdN1fsO+bwPlnQO9thd52kDZ9Y2Pol/KlnicLwWWGLUaY5yHSaRwVtlAyzjncx4FP
         ZdUgH7CYbgCzG0GLZdcmlBCzmEXv3YDZ8TCmzfWjqLAadKr5vcFjqTAuFf2mYvaL15Sz
         m2m6QmYgY0JKi27xTdIw9SEdLGHLQXP8uINMV1Dh5hKTOdyNAAQgG1hAbs86PoGhCHh6
         B+naB2zKgTkwbvOkMsqA3ULk5CCqOEkm9kmPOecaAYbrte+IYw5qxTFxRoo4PcZmeQmN
         CpTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=zaNBW3jeQ5avsoVvGLGUO0rBHm0eCg/pXzcP74RCQfA=;
        b=H/uxZD61L/i/B8WpfDGN+ciEdgXE/MOexRH/d/V22LPT3lRkPsSWOhqejkZdcKi/ry
         JK91y3FSbY/mW55j6TfpkF9CP7LJVBBeSLCMhRT/3DPolgn1bhfRp5xqI8jH0n/Zcj7H
         RsSxC2NNfQJYylW+GuLvT5gYyTsU8sGaVpGJXrvSy3ZnxYZibvUz58Am7rHTeAn9hSHx
         hgFG0kI1smweFeV4hkENwujcA25bdH1DPYqaBcF19rGaNu+wXf7in1SLyQwSQ+2mT4OT
         k2lhSvcPZ5OuBe/rKC8lOpqL/qHJau//0isZrTMF36QFV5gb7/Kilbg89uabe984IP+k
         WrpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w64si7793562qkd.327.2017.07.14.07.10.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 07:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dW1Iq-00034m-Ec
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 10:10:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dW12W-0002YY-CR
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 09:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dW12V-0001vx-9h
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 09:53:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36318)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dW12V-0001v0-0G; Fri, 14 Jul 2017 09:53:51 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0CB4267D4;
	Fri, 14 Jul 2017 13:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D0CB4267D4
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D0CB4267D4
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5639B60608;
	Fri, 14 Jul 2017 13:53:48 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jul 2017 15:52:12 +0200
Message-Id: <1500040339-119465-22-git-send-email-imammedo@redhat.com>
In-Reply-To: <1500040339-119465-1-git-send-email-imammedo@redhat.com>
References: <1500040339-119465-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 14 Jul 2017 13:53:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 21/28] arm: replace cpu_arm_init() with
 cpu_generic_init()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Andrzej Zaborowski <balrogg@gmail.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C1ji4bBYaFF5

it's just a wrapper, drop it and use cpu_generic_init() directly

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Jan Kiszka <jan.kiszka@web.de>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Andrzej Zaborowski <balrogg@gmail.com>
CC: qemu-arm@nongnu.org
---
 target/arm/cpu.h    | 3 +--
 hw/arm/musicpal.c   | 2 +-
 hw/arm/omap1.c      | 2 +-
 hw/arm/omap2.c      | 2 +-
 hw/arm/pxa2xx.c     | 4 ++--
 hw/arm/strongarm.c  | 2 +-
 target/arm/helper.c | 5 -----
 7 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 16a1e59..c9be0ac 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -746,7 +746,6 @@ int aarch64_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 #endif
 
-ARMCPU *cpu_arm_init(const char *cpu_model);
 target_ulong do_arm_semihosting(CPUARMState *env);
 void aarch64_sync_32_to_64(CPUARMState *env);
 void aarch64_sync_64_to_32(CPUARMState *env);
@@ -1999,7 +1998,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
     return unmasked || pstate_unmasked;
 }
 
-#define cpu_init(cpu_model) CPU(cpu_arm_init(cpu_model))
+#define cpu_init(cpu_model) cpu_generic_init(TYPE_ARM_CPU, cpu_model)
 
 #define cpu_signal_handler cpu_arm_signal_handler
 #define cpu_list arm_cpu_list
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 9c710f7..0d519f9 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1593,7 +1593,7 @@ static void musicpal_init(MachineState *machine)
     if (!cpu_model) {
         cpu_model = "arm926";
     }
-    cpu = cpu_arm_init(cpu_model);
+    cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, cpu_model));
     if (!cpu) {
         fprintf(stderr, "Unable to find CPU definition\n");
         exit(1);
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 54582bd..391eb28 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -3863,7 +3863,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *system_memory,
 
     /* Core */
     s->mpu_model = omap310;
-    s->cpu = cpu_arm_init(core);
+    s->cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, core));
     if (s->cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
         exit(1);
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 91f5733..a20bb1f 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2261,7 +2261,7 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sysmem,
 
     /* Core */
     s->mpu_model = omap2420;
-    s->cpu = cpu_arm_init(core ?: "arm1136-r2");
+    s->cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, core ?: "arm1136-r2"));
     if (s->cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
         exit(1);
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 629e6c6..2f1c141 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -2065,7 +2065,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
     if (!revision)
         revision = "pxa270";
 
-    s->cpu = cpu_arm_init(revision);
+    s->cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, revision));
     if (s->cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
         exit(1);
@@ -2197,7 +2197,7 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
 
     s = g_new0(PXA2xxState, 1);
 
-    s->cpu = cpu_arm_init("pxa255");
+    s->cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, "pxa255"));
     if (s->cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
         exit(1);
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 7683edc..a27d7c8 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -1597,7 +1597,7 @@ StrongARMState *sa1110_init(MemoryRegion *sysmem,
         exit(1);
     }
 
-    s->cpu = cpu_arm_init(rev);
+    s->cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, rev));
 
     if (!s->cpu) {
         error_report("Unable to find CPU definition");
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2594faa..86e69a6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5237,11 +5237,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 }
 
-ARMCPU *cpu_arm_init(const char *cpu_model)
-{
-    return ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, cpu_model));
-}
-
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
-- 
2.7.4

