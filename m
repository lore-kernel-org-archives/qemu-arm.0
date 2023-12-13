Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1431065ejo;
        Tue, 12 Dec 2023 22:41:58 -0800 (PST)
X-Received: by 2002:a0d:eac3:0:b0:5e2:decb:b121 with SMTP id t186-20020a0deac3000000b005e2decbb121mr173961ywe.34.1702449717529;
        Tue, 12 Dec 2023 22:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449717; cv=none;
        d=google.com; s=arc-20160816;
        b=qFp3Ixqj7B2iiOlNqVC9nxO+KbzZkKaufW+gk1JXyig3AVLKcA5VcL8uPVXbGt52C6
         nBExyNVwvE1HQ6BjGYplRfJTEeJ8dpSlHVJ6FZSvhGA7bfywe/B3TJKUIbQCu0aOEz0q
         qL00I+aR9pqz9ZaQnQPrdMmrCVoRyaazz7OcH/NY/rEKGecP0qpmybFhQNdtzLSyiRLJ
         yYHViAJPkiDkky5UUqL447wkHpXoZtf0EbaJY/PnyoZnntKDkcdINtCmV9GsCHP7FMJa
         larlgAteo8PudJsar70nr2GG2mU6idCXEiuGqJg4puNLex5DkdxNueTjQyuqhyuoJzC3
         +4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=Wk9I4XtBiDiZBOIcVMJjzuN0+GK4MrCgd6fXluNhXec=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=ryt85ylLcos6D+kfk1XGIRIRhkwfGRapVQgjS2IGwevlDP7GCuaLBXcmacdGq6VAOr
         vxnbfAiuaEJfW6IVa20W5G7wnhomsNZ4oSVGEtOgPxLaoJqL8ZkRpK8FCXnmI9FYsfF+
         BryuvRliBXZPuRzj2hn/63cR04meIR63IJvqg7pi+jCeWFR2GRt/Y65Gucq/oa3TpCrN
         sLh3azSA0b4Cy4jy+6VpKNIMrTqeH+Pedu0U/Kl+gbWtbWOGPUVN4u13Cpv/XIWr+kUM
         ORis4Vuq6RMWosSqv/5yrNHLJx6dQl8a0IDgADMOhvkRbK6DESa9Wa3XbKZ/vONrnEMY
         B68w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=WH5V0Q8X;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i71-20020a0ddf4a000000b005e2b6807af3sor290798ywe.4.2023.12.12.22.41.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:41:57 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=WH5V0Q8X;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449717; x=1703054517; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wk9I4XtBiDiZBOIcVMJjzuN0+GK4MrCgd6fXluNhXec=;
        b=WH5V0Q8XvgC6i4Zs301btWzlJm73Gl/mDlCfuZhvRcdAyAk81KpwfdOhRnKet5yYm/
         HqRSvo5eoNc8UvmC9kJpQ9WX2Bo2cN+qSqXzoeLwKCBUll2d3CaZZjxW2aBgExleDvMh
         yA9r8PHyi1W1DGZvuexXV4Nl1VuJ3yx6RQaOmHYdKUj0TAgKSiB0h0SpwYCTWF4Nntuc
         XpjOIZUBb50FdtTXeCgFS2ANypw+J14jkf0+WbQkueM8pnl01QRmNCfRNQpv4GZHgqgj
         1kphdRDj82DRR+vsP1vEag6RGh4ea+TFnZv9WiAAG5QJDJObatqcQh7btN6/x8GX3det
         zREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449717; x=1703054517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wk9I4XtBiDiZBOIcVMJjzuN0+GK4MrCgd6fXluNhXec=;
        b=MOWaFL9IV+CWbqJB+nTlFSPeadpFcbqOZEEfgmkkKvjogkelub+Gj+c6EEwR9IDaWD
         MmxxAPewi+8J1t1ZWpGgZMgtdyLTpUwNuPdUNBqb41hYul/RDQjhDRKakRThaUCdvH0b
         xkKlVDsjSSBc8kzM+jERdS0g2NjEs7nxcURFTLLaKccG58Au5sT9/xryN2Vc7lUASpHz
         9+OjVgQM4v3nFeD9gv0xrGrNPJlwLPE4QiovOADuDLeAS+gaSD8PO/Fp46Q6b9eYnJ6M
         IIGNQsh9A91GzacjzIGtjJIMFQBlu+F6De1kpWVCorrxlz3kXaz2rstG5A9Wm985pKN4
         5q/w==
X-Gm-Message-State: AOJu0YyYuvRAkrEjy+vQLKmfoNMdIdkxfHsKNswJwwBYbE1/oY1uWMti
	/BadysNHX6HT3tieG6AnXnRT5g==
X-Google-Smtp-Source: AGHT+IEGJjXaarJavMbnk99fn7weOCL85tIE4zJxS6JklQFF3YFTIKLHYyZrkAFVD+c0uW2tfm873w==
X-Received: by 2002:a81:8405:0:b0:5e2:bbce:3077 with SMTP id u5-20020a818405000000b005e2bbce3077mr393851ywf.27.1702449717030;
        Tue, 12 Dec 2023 22:41:57 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id m10-20020a170902db0a00b001d331bd4d50sm2912476plx.91.2023.12.12.22.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:41:56 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:03 +0900
Subject: [PATCH v17 04/14] gdbstub: Use GDBFeature for
 gdb_register_coprocessor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231213-gdb-v17-4-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
X-TUID: Cd73kkbGMw6i

This is a tree-wide change to introduce GDBFeature parameter to
gdb_register_coprocessor(). The new parameter just replaces num_regs
and xml parameters for now. GDBFeature will be utilized to simplify XML
lookup in a following change.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h     |  2 +-
 gdbstub/gdbstub.c          | 13 +++++++------
 target/arm/gdbstub.c       | 35 +++++++++++++++++++----------------
 target/hexagon/cpu.c       |  3 +--
 target/loongarch/gdbstub.c |  2 +-
 target/m68k/helper.c       |  6 +++---
 target/microblaze/cpu.c    |  5 +++--
 target/ppc/gdbstub.c       | 11 ++++++-----
 target/riscv/gdbstub.c     | 20 ++++++++++++--------
 target/s390x/gdbstub.c     | 28 +++++++---------------------
 10 files changed, 60 insertions(+), 65 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index d8a3c56fa2b8..ac6fce99a64e 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -38,7 +38,7 @@ typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
  */
 void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
-                              int num_regs, const char *xml, int g_pos);
+                              const GDBFeature *feature, int g_pos);
 
 /**
  * gdbserver_start: start the gdb server
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 46d752bbc2cd..068180c83c76 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -544,7 +544,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
 
 void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
-                              int num_regs, const char *xml, int g_pos)
+                              const GDBFeature *feature, int g_pos)
 {
     GDBRegisterState *s;
     guint i;
@@ -553,7 +553,7 @@ void gdb_register_coprocessor(CPUState *cpu,
         for (i = 0; i < cpu->gdb_regs->len; i++) {
             /* Check for duplicates.  */
             s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-            if (strcmp(s->xml, xml) == 0) {
+            if (strcmp(s->xml, feature->xmlname) == 0) {
                 return;
             }
         }
@@ -565,17 +565,18 @@ void gdb_register_coprocessor(CPUState *cpu,
     g_array_set_size(cpu->gdb_regs, i + 1);
     s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
     s->base_reg = cpu->gdb_num_regs;
-    s->num_regs = num_regs;
+    s->num_regs = feature->num_regs;
     s->get_reg = get_reg;
     s->set_reg = set_reg;
-    s->xml = xml;
+    s->xml = feature->xml;
 
     /* Add to end of list.  */
-    cpu->gdb_num_regs += num_regs;
+    cpu->gdb_num_regs += feature->num_regs;
     if (g_pos) {
         if (g_pos != s->base_reg) {
             error_report("Error: Bad gdb register numbering for '%s', "
-                         "expected %d got %d", xml, g_pos, s->base_reg);
+                         "expected %d got %d", feature->xml,
+                         g_pos, s->base_reg);
         } else {
             cpu->gdb_num_g_regs = cpu->gdb_num_regs;
         }
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 5949adfb31ae..f2b201d31254 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -483,14 +483,14 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
          */
 #ifdef TARGET_AARCH64
         if (isar_feature_aa64_sve(&cpu->isar)) {
-            int nreg = arm_gen_dynamic_svereg_feature(cs, cs->gdb_num_regs)->num_regs;
+            GDBFeature *feature = arm_gen_dynamic_svereg_feature(cs, cs->gdb_num_regs);
             gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
-                                     aarch64_gdb_set_sve_reg, nreg,
-                                     "sve-registers.xml", 0);
+                                     aarch64_gdb_set_sve_reg, feature, 0);
         } else {
             gdb_register_coprocessor(cs, aarch64_gdb_get_fpu_reg,
                                      aarch64_gdb_set_fpu_reg,
-                                     34, "aarch64-fpu.xml", 0);
+                                     gdb_find_static_feature("aarch64-fpu.xml"),
+                                     0);
         }
         /*
          * Note that we report pauth information via the feature name
@@ -501,19 +501,22 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
         if (isar_feature_aa64_pauth(&cpu->isar)) {
             gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
                                      aarch64_gdb_set_pauth_reg,
-                                     4, "aarch64-pauth.xml", 0);
+                                     gdb_find_static_feature("aarch64-pauth.xml"),
+                                     0);
         }
 #endif
     } else {
         if (arm_feature(env, ARM_FEATURE_NEON)) {
             gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
-                                     49, "arm-neon.xml", 0);
+                                     gdb_find_static_feature("arm-neon.xml"),
+                                     0);
         } else if (cpu_isar_feature(aa32_simd_r32, cpu)) {
             gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
-                                     33, "arm-vfp3.xml", 0);
+                                     gdb_find_static_feature("arm-vfp3.xml"),
+                                     0);
         } else if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
             gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
-                                     17, "arm-vfp.xml", 0);
+                                     gdb_find_static_feature("arm-vfp.xml"), 0);
         }
         if (!arm_feature(env, ARM_FEATURE_M)) {
             /*
@@ -521,29 +524,29 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
              * expose to gdb.
              */
             gdb_register_coprocessor(cs, vfp_gdb_get_sysreg, vfp_gdb_set_sysreg,
-                                     2, "arm-vfp-sysregs.xml", 0);
+                                     gdb_find_static_feature("arm-vfp-sysregs.xml"),
+                                     0);
         }
     }
     if (cpu_isar_feature(aa32_mve, cpu) && tcg_enabled()) {
         gdb_register_coprocessor(cs, mve_gdb_get_reg, mve_gdb_set_reg,
-                                 1, "arm-m-profile-mve.xml", 0);
+                                 gdb_find_static_feature("arm-m-profile-mve.xml"),
+                                 0);
     }
     gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
-                             arm_gen_dynamic_sysreg_feature(cs, cs->gdb_num_regs)->num_regs,
-                             "system-registers.xml", 0);
+                             arm_gen_dynamic_sysreg_feature(cs, cs->gdb_num_regs),
+                             0);
 
 #ifdef CONFIG_TCG
     if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
-            arm_gen_dynamic_m_systemreg_feature(cs, cs->gdb_num_regs)->num_regs,
-            "arm-m-system.xml", 0);
+            arm_gen_dynamic_m_systemreg_feature(cs, cs->gdb_num_regs), 0);
 #ifndef CONFIG_USER_ONLY
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
             gdb_register_coprocessor(cs,
                 arm_gdb_get_m_secextreg, arm_gdb_set_m_secextreg,
-                arm_gen_dynamic_m_secextreg_feature(cs, cs->gdb_num_regs)->num_regs,
-                "arm-m-secext.xml", 0);
+                arm_gen_dynamic_m_secextreg_feature(cs, cs->gdb_num_regs), 0);
         }
 #endif
     }
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 9d1ffc3b4bb6..65ac9c75ad08 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -341,8 +341,7 @@ static void hexagon_cpu_realize(DeviceState *dev, Error **errp)
 
     gdb_register_coprocessor(cs, hexagon_hvx_gdb_read_register,
                              hexagon_hvx_gdb_write_register,
-                             NUM_VREGS + NUM_QREGS,
-                             "hexagon-hvx.xml", 0);
+                             gdb_find_static_feature("hexagon-hvx.xml"), 0);
 
     qemu_init_vcpu(cs);
     cpu_reset(cs);
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index 5fc2f19e965e..843a869450ee 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -118,5 +118,5 @@ static int loongarch_gdb_set_fpu(CPULoongArchState *env,
 void loongarch_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     gdb_register_coprocessor(cs, loongarch_gdb_get_fpu, loongarch_gdb_set_fpu,
-                             41, "loongarch-fpu.xml", 0);
+                             gdb_find_static_feature("loongarch-fpu.xml"), 0);
 }
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 0a1544cd68d9..675f2dcd5ad4 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -152,10 +152,10 @@ void m68k_cpu_init_gdb(M68kCPU *cpu)
 
     if (m68k_feature(env, M68K_FEATURE_CF_FPU)) {
         gdb_register_coprocessor(cs, cf_fpu_gdb_get_reg, cf_fpu_gdb_set_reg,
-                                 11, "cf-fp.xml", 18);
+                                 gdb_find_static_feature("cf-fp.xml"), 18);
     } else if (m68k_feature(env, M68K_FEATURE_FPU)) {
-        gdb_register_coprocessor(cs, m68k_fpu_gdb_get_reg,
-                                 m68k_fpu_gdb_set_reg, 11, "m68k-fp.xml", 18);
+        gdb_register_coprocessor(cs, m68k_fpu_gdb_get_reg, m68k_fpu_gdb_set_reg,
+                                 gdb_find_static_feature("m68k-fp.xml"), 18);
     }
     /* TODO: Add [E]MAC registers.  */
 }
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index bbb3335cadd8..1998f69828f9 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -297,8 +297,9 @@ static void mb_cpu_initfn(Object *obj)
     CPUMBState *env = &cpu->env;
 
     gdb_register_coprocessor(CPU(cpu), mb_cpu_gdb_read_stack_protect,
-                             mb_cpu_gdb_write_stack_protect, 2,
-                             "microblaze-stack-protect.xml", 0);
+                             mb_cpu_gdb_write_stack_protect,
+                             gdb_find_static_feature("microblaze-stack-protect.xml"),
+                             0);
 
     set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
 
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index e3be3dbd109a..09b852464f38 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -570,23 +570,24 @@ void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
 {
     if (pcc->insns_flags & PPC_FLOAT) {
         gdb_register_coprocessor(cs, gdb_get_float_reg, gdb_set_float_reg,
-                                 33, "power-fpu.xml", 0);
+                                 gdb_find_static_feature("power-fpu.xml"), 0);
     }
     if (pcc->insns_flags & PPC_ALTIVEC) {
         gdb_register_coprocessor(cs, gdb_get_avr_reg, gdb_set_avr_reg,
-                                 34, "power-altivec.xml", 0);
+                                 gdb_find_static_feature("power-altivec.xml"),
+                                 0);
     }
     if (pcc->insns_flags & PPC_SPE) {
         gdb_register_coprocessor(cs, gdb_get_spe_reg, gdb_set_spe_reg,
-                                 34, "power-spe.xml", 0);
+                                 gdb_find_static_feature("power-spe.xml"), 0);
     }
     if (pcc->insns_flags2 & PPC2_VSX) {
         gdb_register_coprocessor(cs, gdb_get_vsx_reg, gdb_set_vsx_reg,
-                                 32, "power-vsx.xml", 0);
+                                 gdb_find_static_feature("power-vsx.xml"), 0);
     }
 #ifndef CONFIG_USER_ONLY
     gdb_gen_spr_feature(cs);
     gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
-                             pcc->gdb_spr.num_regs, "power-spr.xml", 0);
+                             &pcc->gdb_spr, 0);
 #endif
 }
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 76b72a959549..a879869fa1aa 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -311,28 +311,32 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     CPURISCVState *env = &cpu->env;
     if (env->misa_ext & RVD) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
-                                 32, "riscv-64bit-fpu.xml", 0);
+                                 gdb_find_static_feature("riscv-64bit-fpu.xml"),
+                                 0);
     } else if (env->misa_ext & RVF) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
-                                 32, "riscv-32bit-fpu.xml", 0);
+                                 gdb_find_static_feature("riscv-32bit-fpu.xml"),
+                                 0);
     }
     if (env->misa_ext & RVV) {
         gdb_register_coprocessor(cs, riscv_gdb_get_vector,
                                  riscv_gdb_set_vector,
-                                 ricsv_gen_dynamic_vector_feature(cs, cs->gdb_num_regs)->num_regs,
-                                 "riscv-vector.xml", 0);
+                                 ricsv_gen_dynamic_vector_feature(cs, cs->gdb_num_regs),
+                                 0);
     }
     switch (mcc->misa_mxl_max) {
     case MXL_RV32:
         gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
                                  riscv_gdb_set_virtual,
-                                 1, "riscv-32bit-virtual.xml", 0);
+                                 gdb_find_static_feature("riscv-32bit-virtual.xml"),
+                                 0);
         break;
     case MXL_RV64:
     case MXL_RV128:
         gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
                                  riscv_gdb_set_virtual,
-                                 1, "riscv-64bit-virtual.xml", 0);
+                                 gdb_find_static_feature("riscv-64bit-virtual.xml"),
+                                 0);
         break;
     default:
         g_assert_not_reached();
@@ -340,7 +344,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 
     if (cpu->cfg.ext_zicsr) {
         gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                                 riscv_gen_dynamic_csr_feature(cs, cs->gdb_num_regs)->num_regs,
-                                 "riscv-csr.xml", 0);
+                                 riscv_gen_dynamic_csr_feature(cs, cs->gdb_num_regs),
+                                 0);
     }
 }
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index 6fbfd41bc867..02c388dc323b 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -69,8 +69,6 @@ int s390_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 /* the values represent the positions in s390-acr.xml */
 #define S390_A0_REGNUM 0
 #define S390_A15_REGNUM 15
-/* total number of registers in s390-acr.xml */
-#define S390_NUM_AC_REGS 16
 
 static int cpu_read_ac_reg(CPUS390XState *env, GByteArray *buf, int n)
 {
@@ -98,8 +96,6 @@ static int cpu_write_ac_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_FPC_REGNUM 0
 #define S390_F0_REGNUM 1
 #define S390_F15_REGNUM 16
-/* total number of registers in s390-fpr.xml */
-#define S390_NUM_FP_REGS 17
 
 static int cpu_read_fp_reg(CPUS390XState *env, GByteArray *buf, int n)
 {
@@ -132,8 +128,6 @@ static int cpu_write_fp_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_V15L_REGNUM 15
 #define S390_V16_REGNUM 16
 #define S390_V31_REGNUM 31
-/* total number of registers in s390-vx.xml */
-#define S390_NUM_VREGS 32
 
 static int cpu_read_vreg(CPUS390XState *env, GByteArray *buf, int n)
 {
@@ -172,8 +166,6 @@ static int cpu_write_vreg(CPUS390XState *env, uint8_t *mem_buf, int n)
 /* the values represent the positions in s390-cr.xml */
 #define S390_C0_REGNUM 0
 #define S390_C15_REGNUM 15
-/* total number of registers in s390-cr.xml */
-#define S390_NUM_C_REGS 16
 
 #ifndef CONFIG_USER_ONLY
 static int cpu_read_c_reg(CPUS390XState *env, GByteArray *buf, int n)
@@ -206,8 +198,6 @@ static int cpu_write_c_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_VIRT_CPUTM_REGNUM  1
 #define S390_VIRT_BEA_REGNUM    2
 #define S390_VIRT_PREFIX_REGNUM 3
-/* total number of registers in s390-virt.xml */
-#define S390_NUM_VIRT_REGS 4
 
 static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
 {
@@ -254,8 +244,6 @@ static int cpu_write_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_VIRT_KVM_PFT_REGNUM    1
 #define S390_VIRT_KVM_PFS_REGNUM    2
 #define S390_VIRT_KVM_PFC_REGNUM    3
-/* total number of registers in s390-virt-kvm.xml */
-#define S390_NUM_VIRT_KVM_REGS 4
 
 static int cpu_read_virt_kvm_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
 {
@@ -303,8 +291,6 @@ static int cpu_write_virt_kvm_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_GS_GSD_REGNUM      1
 #define S390_GS_GSSM_REGNUM     2
 #define S390_GS_GSEPLA_REGNUM   3
-/* total number of registers in s390-gs.xml */
-#define S390_NUM_GS_REGS 4
 
 static int cpu_read_gs_reg(CPUS390XState *env, GByteArray *buf, int n)
 {
@@ -322,33 +308,33 @@ void s390_cpu_gdb_init(CPUState *cs)
 {
     gdb_register_coprocessor(cs, cpu_read_ac_reg,
                              cpu_write_ac_reg,
-                             S390_NUM_AC_REGS, "s390-acr.xml", 0);
+                             gdb_find_static_feature("s390-acr.xml"), 0);
 
     gdb_register_coprocessor(cs, cpu_read_fp_reg,
                              cpu_write_fp_reg,
-                             S390_NUM_FP_REGS, "s390-fpr.xml", 0);
+                             gdb_find_static_feature("s390-fpr.xml"), 0);
 
     gdb_register_coprocessor(cs, cpu_read_vreg,
                              cpu_write_vreg,
-                             S390_NUM_VREGS, "s390-vx.xml", 0);
+                             gdb_find_static_feature("s390-vx.xml"), 0);
 
     gdb_register_coprocessor(cs, cpu_read_gs_reg,
                              cpu_write_gs_reg,
-                             S390_NUM_GS_REGS, "s390-gs.xml", 0);
+                             gdb_find_static_feature("s390-gs.xml"), 0);
 
 #ifndef CONFIG_USER_ONLY
     gdb_register_coprocessor(cs, cpu_read_c_reg,
                              cpu_write_c_reg,
-                             S390_NUM_C_REGS, "s390-cr.xml", 0);
+                             gdb_find_static_feature("s390-cr.xml"), 0);
 
     gdb_register_coprocessor(cs, cpu_read_virt_reg,
                              cpu_write_virt_reg,
-                             S390_NUM_VIRT_REGS, "s390-virt.xml", 0);
+                             gdb_find_static_feature("s390-virt.xml"), 0);
 
     if (kvm_enabled()) {
         gdb_register_coprocessor(cs, cpu_read_virt_kvm_reg,
                                  cpu_write_virt_kvm_reg,
-                                 S390_NUM_VIRT_KVM_REGS, "s390-virt-kvm.xml",
+                                 gdb_find_static_feature("s390-virt-kvm.xml"),
                                  0);
     }
 #endif

-- 
2.43.0
