Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp241585lfb;
        Thu, 22 Apr 2021 03:53:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIoc/P2SHAbnaFIyzJLq4EV70RI3mzGNkfFB+QxlbgKFE0eOaXxack8K4aIeQCwVi7T7Gp
X-Received: by 2002:ad4:5f8a:: with SMTP id jp10mr2696861qvb.56.1619088787975;
        Thu, 22 Apr 2021 03:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619088787; cv=none;
        d=google.com; s=arc-20160816;
        b=gBnbdX7TtoXbbXDMIDF+66ijqbDtNjaU/N1En29KVXqb4Po7Tqrs+yMSdi5DTLDJ6C
         otp8j/UcIwVQeqmQABaX0eQudQR/e+tqMZDx4GqW3z+2VPQZYASGA+RWvBMMzBOfuuqZ
         HcxZ0RgyREqp5c7wJIp37+klChs1k02BEfwf7ZfLe0MTwxnrWp/MwLlEHwMIgMRpblbF
         Hla8xGogkCjxKY1NUQTq+9XSVcJM8XdNKaq1jUGxMsPL5+MoNxmL3XA4I0Fq+RW19t8Q
         qydb66+5qE4kMHwPh5r3s6u4HNQP9JYxkYZ6YohDnSLNaD546tqip7ReY7tkjxT9eCTw
         GcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kHEK4AhSZFQVUn4HZfyzLvc603glcsJJgxbrmPqHznQ=;
        b=TeiSsXfJrdqkctyFTVl9jv7Ss1OrjgX5Gh+L5Z6yaQMMyQFzdaNoCWEgFM4GaeyVGv
         lYWUnVPH6Qz+mfqLxFc2OTbt03nFM7dIpQPlKFkuaTU2nqos7BgCo/feI1rVqetFNEpj
         OcrUB220Vf6gYflxXDV4LCBcH1ReVWMS+LIkFiwr0jpSjiClzv65xetyaB6K336JfBj+
         dM5WemHdwKr8nYz8PAXAZstlA923NEHFSFkhoQWFJYIZGJcIjL4b7/VrSmvfjDprzqez
         eQ8sbQV0wu81jiuIMCNaHzUlr+a1dr1L7J8bEui3nbtGuiDinrLvmn3IUCsnv2mAwAOh
         fHjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Uc6wRXG1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 101si2005777qte.263.2021.04.22.03.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Apr 2021 03:53:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Uc6wRXG1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZWxH-000409-3j
	for alex.bennee@linaro.org; Thu, 22 Apr 2021 06:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWsY-00075Y-W9; Thu, 22 Apr 2021 06:48:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWsX-0005QF-9Q; Thu, 22 Apr 2021 06:48:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id j5so43333393wrn.4;
 Thu, 22 Apr 2021 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kHEK4AhSZFQVUn4HZfyzLvc603glcsJJgxbrmPqHznQ=;
 b=Uc6wRXG14XGpPSQQcIVOJ3MJttZR2A1Z98NhO6Grx298pdcbUoze+NMMM3qcoQdzOb
 MIpCDwEka9ZHdatuEDQGeHGdutOboHpGVyioZ1juC8bk0h1uGnIK1c7LuYeix8FtTTDw
 THX8MeH6jwvDa08kAagjhL9KAznGs2aME4rqQxaZTS0v1T/JhUMSWUWhpjlsBqQgDL40
 +k+X5SHbVCyenr4u5xTWmxXblwbaMo8QknAQZLkwlFkA9cK2HsFqac2AjwWIpNkgszC6
 98mFk4kz0fpCzhwI0+M6h3dUb1vlgKSA1BoXQw2BrGKsjuIH9wLeKbj78O8jU+qifIRp
 mCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kHEK4AhSZFQVUn4HZfyzLvc603glcsJJgxbrmPqHznQ=;
 b=YY6+GZTD33c4GfQ9y5/9tukh/j4J1C1dQpAgwqRPiki2/ZRIeAwAPmT2gyy3My+zg1
 QjbukxLTAbia6M4tKEC/0XL+BInOdINCEAuqHZ0t5WilBDWOEF4HvGHRM7Xk3zP+xstL
 UX1rGoxU1PXEZvP0/3r01vM5qlvnBrIvfWUZLwFI4Ein94f78qUxrLqbydIfRvwEX5Fm
 Sfzsk0PRfuKZq36z2JB8F7D9fBIJee2IVAxox5daaHuauPGpeINiy4m+r3o670kTUEy4
 OMTiq+iaHSAFZ6bTNMsspJX/VqOVna8Q7DPkE778QW+BbpAbiCDcPpHkaPay0SzGdFCn
 nknQ==
X-Gm-Message-State: AOAM5315qcXOsZyoBRlkRtQrcnVy9q58Q5mTfQ+VuKww4r2O9iiX7NAv
 0KCWvcOR8x4RZqpsLrL50JiSSjPwgvv0uA==
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr3414411wrq.161.1619088489529; 
 Thu, 22 Apr 2021 03:48:09 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p18sm2821742wrs.68.2021.04.22.03.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:48:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/15] cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps
Date: Thu, 22 Apr 2021 12:47:00 +0200
Message-Id: <20210422104705.2454166-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422104705.2454166-1-f4bug@amsat.org>
References: <20210422104705.2454166-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1gCztnKAvXW8

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 3 ---
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu.c                    | 4 ++--
 target/arm/cpu.c                 | 2 +-
 target/i386/cpu.c                | 2 +-
 5 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b7095bc4192..28c4fc541a2 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -108,8 +108,6 @@ struct AccelCPUClass;
  *       associated memory transaction attributes to use for the access.
  *       CPUs which use memory transaction attributes should implement this
  *       instead of get_phys_page_debug.
- * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
- *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
@@ -151,7 +149,6 @@ struct CPUClass {
     hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
     hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
-    int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 60c667801ef..3c3f211136d 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
+     *       a memory access with the specified memory transaction attributes.
+     */
+    int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     /**
      * @get_crash_info: Callback for reporting guest crash information in
      * GUEST_PANICKED events.
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index c74390aafbf..c44229205ff 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -116,8 +116,8 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret = 0;
 
-    if (cc->asidx_from_attrs) {
-        ret = cc->asidx_from_attrs(cpu, attrs);
+    if (cc->sysemu_ops->asidx_from_attrs) {
+        ret = cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
         assert(ret < cpu->num_ases && ret >= 0);
     }
     return ret;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 326ed9180cc..ff356094b13 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1945,6 +1945,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
@@ -1990,7 +1991,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
-    cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4ee64461b43..5269fa484e1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7393,6 +7393,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
     .write_elf32_note = x86_cpu_write_elf32_note,
     .write_elf64_note = x86_cpu_write_elf64_note,
@@ -7434,7 +7435,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
-    cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->sysemu_ops = &i386_sysemu_ops;
-- 
2.26.3

