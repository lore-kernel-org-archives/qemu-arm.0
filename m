Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp273493ejv;
        Tue, 7 Nov 2023 04:26:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtbZu/bxU9UhW8uFkgp4rkJHpwjYm4UkIIKWLRI4QDKYYjWriOIpt+PioI5Skw8OPQyHEA
X-Received: by 2002:ad4:5943:0:b0:66d:9d71:9b28 with SMTP id eo3-20020ad45943000000b0066d9d719b28mr36529174qvb.11.1699359982747;
        Tue, 07 Nov 2023 04:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699359982; cv=none;
        d=google.com; s=arc-20160816;
        b=TDY6O99ilt3KndA8CDf7n7mysZq0Ux5iQisIbfuuzzfL1ZtI+fS2eODflVQsRCemwJ
         tzjjqBWJcDC8bGLv+b9T3zQTuVFuNozS8SU0SVFovT/SCR155Hd0cNRgkGl9qB5GxDZn
         qAFxpLQXkawzl5wEnpSuKJltRI2voRAcpcGCsvcho0AV3i35K3aaPIAs2f/6Uat9lnGg
         XWJLJs+VCgGb5iRIeff2zWwAxqLYhYUh3IVcSNFFStxIGO1piX6cqpDILGBi7j0viyrR
         TASjUZY61lOJ1elgizF5vxQ/78et5jrvLwJ6TIoconnlL2Zp0nPEM7fV6QNxnBp3k0KA
         ojuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IukOQrcvFKTQKQHU+Gn7+JZ4VvtRt6lfWofdjUUbwSE=;
        fh=YV4gNTMS90pCJFtdEnyCZ1ABVtsCB59kwLHicky2n2c=;
        b=ixoihB2iUKzJfxSDwIVUSOZC1j3rPhJQQBp0dK4oIIKSJL66e0o0UQcVnbCznV/l9f
         n0oXiEbe5XDuVoYvhpgoAgelqXMteD3x2AsRUC3jXI+MO2Lz2vk7rFmPc6LxLdSnnr5v
         LbLZ6vk5Qy/VBctc6S6yKqpR86lDTagYPEvl8u4YEFkbPIQ5f2dXY/YlfH9F3pKwE18N
         08YC75+FvZo1RGTeaAVHPCKyfj1xL/bnSJ+XFShTKEbR9TYC2uyfTjhwzhzR6V62yvAj
         CEBqVb5ZFK38E9SYD2mjb+On6Ux5zEe4ZGfNNyvSoLE21hdYzV1QH5Kp0NbShFRT4Us/
         u9fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uoGCNbkP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020ad4430e000000b0066d239d89bdsi6759908qvs.445.2023.11.07.04.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 04:26:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uoGCNbkP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0L91-0005ZF-St; Tue, 07 Nov 2023 07:25:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L90-0005YW-QW
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:25:22 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8i-0004lY-VW
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:25:22 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso42898915e9.1
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 04:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359903; x=1699964703; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IukOQrcvFKTQKQHU+Gn7+JZ4VvtRt6lfWofdjUUbwSE=;
 b=uoGCNbkPbk5ggg2wqkztH6sYNd/Ke1nPYSEC+ls9IyKuOIkdpsnze50BZTVi8UhmB5
 AvRtYcvC3O6W+G4pYuW8CLjmtSU4GitY42Rg+dN3ACV/9IlwR2eGP88d3078LsHJ3hF2
 U//PYLOGSYhAKVYzWyHP4gQT37QmRIKLBUFngFXH3uowx3fO6Hvs630dOGEbITZXtxW8
 HbLDLekwFoJrBSH9gA4PCkvB4dQYgFol2bY8SwrA6B+H916AgHE2x7i1ioodgUkq4uks
 UMbIqNAYi2lpGu3NxcAKvUhSbA17CU2vnVd6epwOiE8dcngwPmf0Y4WcoXaMsCW9ZKQx
 PQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359903; x=1699964703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IukOQrcvFKTQKQHU+Gn7+JZ4VvtRt6lfWofdjUUbwSE=;
 b=AcZ7/fA8eL6xKSsTGDBWugbvv9SMBw4Q6GPj2Oh5N7vBkUMfJJPLNE2XPWnwi9fdEq
 MAJ8mCH7VVx9WKK+PtmgJlDKQulPLE9ajSdX9Cu+omaouqRMb0OhaeNHpoADDRbHa0Ux
 5LY7yzd2JdWa1ZOTYcv1rTzLAAkvlqqO8GAJB+XhHg43PQmbF3f4NaipNE9wq0cf/YfS
 XDdGkwsZdKjpmIHetD0OLT4aStv7m1odzHmYaoD5T/UV0wLXnQv+gFkvYL8cdHgriTSx
 rYnMW7cIq3UEnukIU9t6MJOBng0jVTtHcr3fD/6NPRmM5/n7dYfPOyW86WyCjSpm4/Dl
 AWmQ==
X-Gm-Message-State: AOJu0Yw7uCt8tzxFwhRPgrCXDHkoBYlmvGsPznQhG+yk+lxq4cQC/Rig
 VcfuzxyMhOooZUQ/XKDJUWwtKA==
X-Received: by 2002:a05:600c:35d1:b0:406:52e4:cd23 with SMTP id
 r17-20020a05600c35d100b0040652e4cd23mr2108351wmq.0.1699359902878; 
 Tue, 07 Nov 2023 04:25:02 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 n30-20020a05600c501e00b00405442edc69sm15681877wmr.14.2023.11.07.04.25.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:25:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 38/75] target/ppc: Move PowerPCCPUClass definition to 'cpu.h'
Date: Tue,  7 Nov 2023 13:24:28 +0100
Message-ID: <20231107122442.58674-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ke42/WESTL3V

The OBJECT_DECLARE_CPU_TYPE() macro forward-declares the
PowerPCCPUClass type. This forward declaration is sufficient
for code in hw/ to use the QOM definitions. No need to expose
the structure definition. Keep it local to target/ppc/ by
moving it to target/ppc/cpu.h.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231013125630.95116-5-philmd@linaro.org>
---
 include/hw/ppc/ppc.h |  2 +-
 target/ppc/cpu-qom.h | 56 --------------------------------------------
 target/ppc/cpu.h     | 51 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 57 deletions(-)

diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
index 17a8dfc107..d5d119ea7f 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -1,7 +1,7 @@
 #ifndef HW_PPC_H
 #define HW_PPC_H
 
-#include "target/ppc/cpu-qom.h"
+#include "target/ppc/cpu.h"
 
 void ppc_set_irq(PowerPCCPU *cpu, int n_IRQ, int level);
 PowerPCCPU *ppc_get_vcpu_by_pir(int pir);
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 0b8dfa5fee..65a640470f 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -21,7 +21,6 @@
 #define QEMU_PPC_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #ifdef TARGET_PPC64
 #define TYPE_POWERPC_CPU "powerpc64-cpu"
@@ -36,10 +35,6 @@ OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
 #define TYPE_HOST_POWERPC_CPU POWERPC_CPU_TYPE_NAME("host")
 
-typedef struct CPUArchState CPUPPCState;
-typedef struct ppc_tb_t ppc_tb_t;
-typedef struct ppc_dcr_t ppc_dcr_t;
-
 /*****************************************************************************/
 /* MMU model                                                                 */
 typedef enum powerpc_mmu_t powerpc_mmu_t;
@@ -133,57 +128,6 @@ enum powerpc_input_t {
     PPC_FLAGS_INPUT_RCPU,
 };
 
-typedef struct PPCHash64Options PPCHash64Options;
-
-/**
- * PowerPCCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A PowerPC CPU model.
- */
-struct PowerPCCPUClass {
-    /*< private >*/
-    CPUClass parent_class;
-    /*< public >*/
-
-    DeviceRealize parent_realize;
-    DeviceUnrealize parent_unrealize;
-    ResettablePhases parent_phases;
-    void (*parent_parse_features)(const char *type, char *str, Error **errp);
-
-    uint32_t pvr;
-    /*
-     * If @best is false, match if pcc is in the family of pvr
-     * Else match only if pcc is the best match for pvr in this family.
-     */
-    bool (*pvr_match)(struct PowerPCCPUClass *pcc, uint32_t pvr, bool best);
-    uint64_t pcr_mask;          /* Available bits in PCR register */
-    uint64_t pcr_supported;     /* Bits for supported PowerISA versions */
-    uint32_t svr;
-    uint64_t insns_flags;
-    uint64_t insns_flags2;
-    uint64_t msr_mask;
-    uint64_t lpcr_mask;         /* Available bits in the LPCR */
-    uint64_t lpcr_pm;           /* Power-saving mode Exit Cause Enable bits */
-    powerpc_mmu_t   mmu_model;
-    powerpc_excp_t  excp_model;
-    powerpc_input_t bus_model;
-    uint32_t flags;
-    int bfd_mach;
-    uint32_t l1_dcache_size, l1_icache_size;
-#ifndef CONFIG_USER_ONLY
-    unsigned int gdb_num_sprs;
-    const char *gdb_spr_xml;
-#endif
-    const PPCHash64Options *hash64_opts;
-    struct ppc_radix_page_info *radix_page_info;
-    uint32_t lrg_decr_bits;
-    int n_host_threads;
-    void (*init_proc)(CPUPPCState *env);
-    int  (*check_pow)(CPUPPCState *env);
-};
-
 #ifndef CONFIG_USER_ONLY
 typedef struct PPCTimebase {
     uint64_t guest_timebase;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f3ddfd7a26..55330d9319 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -200,9 +200,14 @@ typedef struct opc_handler_t opc_handler_t;
 /*****************************************************************************/
 /* Types used to describe some PowerPC registers etc. */
 typedef struct DisasContext DisasContext;
+typedef struct ppc_dcr_t ppc_dcr_t;
 typedef struct ppc_spr_t ppc_spr_t;
+typedef struct ppc_tb_t ppc_tb_t;
 typedef union ppc_tlb_t ppc_tlb_t;
 typedef struct ppc_hash_pte64 ppc_hash_pte64_t;
+typedef struct PPCHash64Options PPCHash64Options;
+
+typedef struct CPUArchState CPUPPCState;
 
 /* SPR access micro-ops generations callbacks */
 struct ppc_spr_t {
@@ -1341,6 +1346,52 @@ struct ArchCPU {
     int32_t mig_slb_nr;
 };
 
+/**
+ * PowerPCCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A PowerPC CPU model.
+ */
+struct PowerPCCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
+    ResettablePhases parent_phases;
+    void (*parent_parse_features)(const char *type, char *str, Error **errp);
+
+    uint32_t pvr;
+    /*
+     * If @best is false, match if pcc is in the family of pvr
+     * Else match only if pcc is the best match for pvr in this family.
+     */
+    bool (*pvr_match)(struct PowerPCCPUClass *pcc, uint32_t pvr, bool best);
+    uint64_t pcr_mask;          /* Available bits in PCR register */
+    uint64_t pcr_supported;     /* Bits for supported PowerISA versions */
+    uint32_t svr;
+    uint64_t insns_flags;
+    uint64_t insns_flags2;
+    uint64_t msr_mask;
+    uint64_t lpcr_mask;         /* Available bits in the LPCR */
+    uint64_t lpcr_pm;           /* Power-saving mode Exit Cause Enable bits */
+    powerpc_mmu_t   mmu_model;
+    powerpc_excp_t  excp_model;
+    powerpc_input_t bus_model;
+    uint32_t flags;
+    int bfd_mach;
+    uint32_t l1_dcache_size, l1_icache_size;
+#ifndef CONFIG_USER_ONLY
+    unsigned int gdb_num_sprs;
+    const char *gdb_spr_xml;
+#endif
+    const PPCHash64Options *hash64_opts;
+    struct ppc_radix_page_info *radix_page_info;
+    uint32_t lrg_decr_bits;
+    int n_host_threads;
+    void (*init_proc)(CPUPPCState *env);
+    int  (*check_pow)(CPUPPCState *env);
+};
 
 ObjectClass *ppc_cpu_class_by_name(const char *name);
 PowerPCCPUClass *ppc_cpu_class_by_pvr(uint32_t pvr);
-- 
2.41.0

