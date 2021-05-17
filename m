Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1165958lfm;
        Mon, 17 May 2021 04:07:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCYpdO/Djkr9mFYVFihKSF4cMzOGfnSkFl4WqbCpxyuFhBxRBOS4dMagF+6A9/sRJHGpf2
X-Received: by 2002:a9f:3d8e:: with SMTP id c14mr51924697uai.56.1621249628230;
        Mon, 17 May 2021 04:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621249628; cv=none;
        d=google.com; s=arc-20160816;
        b=QwW7U+zJUibfw1Ci3A+gddCoQx+EWtUayQIMlNbUj5fyhK1MHvljpnNU1VeiKyXVk5
         PZcgsn4Dii88pXB1zUrBkqir2CECpfHvXct6tnF775g0PDRQmyTokemxpLMTjhSxWFZA
         cbuIjwIbNZ+qcNWonUD4voVxOoJbucp8n7cHtqb7T2vZ30mvdBmWmScOo02pMg8ZIvOJ
         hiXZnlnyIoqRaQdaXtqUCqMx2cm1k0xC5uN3fA+jWezGiOI7RlUz+ST2k5DpaeGkfe0n
         e+ZfpLtWvMaQEhszamgxgqDTiQvS4WG9I8Y7AGy29+hiogHyJjH9P7ydV+vmDKwb/186
         NhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Dw1xNt8fMjOUvBAaIK7tDLqLF14cF0ULOaAdWbFvGnU=;
        b=Z0rRnyFcOBc4Dw5gnNQTFNiBQbM0I8gAhj6viO9vLFG69KeaIaLFCHZVJSWrvLrebZ
         7isq7vxd5nZ6+hxqCxykJk7RPJoNcd6P3i2+OsqRx1/rUpMXt6MV+uhQi0ZZFoHHZoD2
         Y3JMEoht3Aqf+ZFzP3nPLg0Js2tpQEpmSGUUYe/ZAugP2kQDt4YuUfeL/gASUJioqoVM
         5GlAbPPkFjQ+0ONZjkz3k+V00G+OcFedeFnXbjONh5lKOXsMi616Qn+E72uu/E8bjy8s
         w3f2fBqs9rNVQroEJTDl4CEHYz4EaWo81skhBMcnH6b/RYpo5ornYOtlFofe2BeQd/az
         MdGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cc184CW8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si3156753vsl.412.2021.05.17.04.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 04:07:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cc184CW8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lib5W-0001V1-Ko
	for alex.bennee@linaro.org; Mon, 17 May 2021 07:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liasL-0008M5-P9; Mon, 17 May 2021 06:53:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liasJ-0007FQ-Ty; Mon, 17 May 2021 06:53:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id n2so5950315wrm.0;
 Mon, 17 May 2021 03:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dw1xNt8fMjOUvBAaIK7tDLqLF14cF0ULOaAdWbFvGnU=;
 b=cc184CW8NKPOOBD44+OcxjcqSvTc7XrVxKwSGpTMOMonDv+ieiKKK7e/gCIPd/r01d
 sL8XF5B4ooV1N3l3SVYQhDEEvyCLOmgZC+dOwISAcABxLU5nTrlq3+bkcevbWnxVAwOZ
 4/AuuWyzFh12j36T16inLj5CMrFFt5kOnKWCRtmcJsKKpaDdwWPKBabgcQMXSKRpyCsT
 60lleuL6juUjJ4LlVkoV+lzo+XbOIiz4kEIfFZWXz9rRV89xzi8Qvkeei+8jSAHrSuEy
 WD1FuLM5HwW1Sx38x/qY3Bo5+QWvhmtWhJqADrqGK3DgtOK72JuLz0A14fJrh72A/iBK
 IA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dw1xNt8fMjOUvBAaIK7tDLqLF14cF0ULOaAdWbFvGnU=;
 b=P5WKLF+uGY9bnEUl8m80LWWXNXI5nr6YsbE1jI65dcpMMcqW8I001BUG66sJ04RQzG
 YU/q7aSJjVOl+1kRvcAHM43XlGAT7Deij/Hn0iDbhc2zB3ZJm86tfgTTwbt5uI1PtsSe
 XuQl/UsItnCTXzF/b/adle3dGdLYQw8j3wRI7cdpyH+/RldDuFO2Dm3rM0uU+nNF+4Bb
 0biwrWdc4JXAsraOV/HWzpggM6wU9ID0GD2uquuDQ4oEKsbRtaW1FXDtcPDDDkekJkId
 DRgmFmj/u6eTyaBJvxYXciIZHnmlGey2WZ+IMy9NU8tOrXF0uetA9zdhPb6Ig+vm35r8
 stng==
X-Gm-Message-State: AOAM533FhI2dTAuQa10eLm6PCmodM9cpcdNzIKtTWawUtsSyhWylLaoo
 c/TLD3We6C5xJZNmpgTsLQQ3vMuZ1zBT3g==
X-Received: by 2002:a05:6000:43:: with SMTP id
 k3mr29956305wrx.222.1621248804766; 
 Mon, 17 May 2021 03:53:24 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id y2sm23430073wmq.45.2021.05.17.03.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:53:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/23] cpu: Move CPUClass::get_memory_mapping to
 SysemuCPUOps
Date: Mon, 17 May 2021 12:51:38 +0200
Message-Id: <20210517105140.1062037-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TMQn0R/ivMDf

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 3 ---
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu-sysemu.c             | 4 ++--
 target/i386/cpu.c                | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b4d3a21bbf0..c95fc76064d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -94,7 +94,6 @@ struct AccelCPUClass;
  * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
  * @get_paging_enabled: Callback for inquiring whether paging is enabled.
- * @get_memory_mapping: Callback for obtaining the memory mappings.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
  *       setting the PC from a source such as an ELF file entry point;
@@ -138,8 +137,6 @@ struct CPUClass {
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
-    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
-                               Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 7f8ff641854..959523315ba 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @get_memory_mapping: Callback for obtaining the memory mappings.
+     */
+    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
+                               Error **errp);
     /**
      * @get_phys_page_debug: Callback for obtaining a physical address.
      */
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index b31c33ad2b5..3850fcb27f0 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -39,8 +39,8 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_memory_mapping) {
-        cc->get_memory_mapping(cpu, list, errp);
+    if (cc->sysemu_ops->get_memory_mapping) {
+        cc->sysemu_ops->get_memory_mapping(cpu, list, errp);
         return;
     }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1092305cb43..26640d9cacf 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6716,6 +6716,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .get_memory_mapping = x86_cpu_get_memory_mapping,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
@@ -6754,7 +6755,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
-    cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.26.3

