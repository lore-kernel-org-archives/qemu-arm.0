Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C756C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 13:36:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfHab-000880-Rk; Thu, 02 Jul 2026 09:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wfHaa-00087U-CK
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 09:36:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wfHaX-00019X-Mo
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 09:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782999380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2nwuEdbqG1bbvwDCO52/KE1VtY4ihgBaPJMPHTbLYw=;
 b=gFbCNGRUjouyJIMIhPSC+3LXuTYd/wtl8rqpy90zPWpSRqJISCW25oQQGxiv1VALz9Y6N1
 gEL563idQq2+RTNJ7Vv26MnLm25jIykUtL0CZuCmMPUAh+hpoQKMYeex0AvypVwsLLkC0W
 cWepehK3JeIb+ULOflmbQ7JXn2Tu7sw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-J5eIz-PuM2KZquamzQi4FA-1; Thu, 02 Jul 2026 09:36:17 -0400
X-MC-Unique: J5eIz-PuM2KZquamzQi4FA-1
X-Mimecast-MFC-AGG-ID: J5eIz-PuM2KZquamzQi4FA_1782999375
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-492488f8583so27586395e9.2
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 06:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782999375; x=1783604175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z2nwuEdbqG1bbvwDCO52/KE1VtY4ihgBaPJMPHTbLYw=;
 b=PZHyuxhtWq/V5573KApVQQLQ6uARSrb9wIXVZ3YwEoUm7my6CN6zOIuh6vYz5QOXKy
 5fXlSkN0Fp54bOMv4AbkXWcy6NLqHWq0eupErwRy8ecbV90BRq1H8pz9XzrgGz4Yl1tF
 ZEdll2tU5biWWIGSDKnHQUpmJQYcGUCa4bdQPRcNQuNae4nfquAjTr4B4951OJGVBZAX
 Yg5F77D+JNVL9+Sq2mAAFEqgRhHTigaZr5TY8GpaoHIMQKj/2cm1usJ9rRHyDF+n3oRH
 Qu8n4Y7W1AakFukJ7eDy/fr8OSeQ8vbp/lgbHtsQv9Y3vEcJYsJVgxm3Hfc43546e/zY
 UsYw==
X-Gm-Message-State: AOJu0Yytw6VZWoUr/O5GR1CMpVg+zGZVj4XR3FejYUsDLByDJUodumu+
 gCXMEjLE1777LMX9T3yTUKB2l5NoObAKdSgYP9xxgl/6DynMVNpsw8Py1J6Mls/ZtkWH04uXUao
 GOKPjMyLYAeK2UD+3Mc7cZwqYYfgNCrd2MJAHHNXyEUKUevhw+GsO7Q==
X-Gm-Gg: AfdE7cmKHdXjNIGIXjJUNsNmyUBmC0HVeY3kdt2j/nk8T4MWqBDJuXXvcwTOe/ds+w6
 8uoiLr2aAW8FLSjAgvoksdgpu17rmo756nTVtwbitqPTougD2+HR40v1lB1twmcp873PYJNxw8t
 vco0yd0FLwzfgcW1trQkXQfojR3A1Xnf0G29ZamG4I50uu8K3qdYIEFzadfHxt0G9GZGtXs1MF4
 dGiRLdZlF/GeEOZ7Cah7zs0sOvRZkJxvfRIodjDeT8n3RgigENPycRjBFHAff3cI0URvsFE3QgR
 HKGD80E4yWDszno97pv38oMw88pN0B2V0IgzBN9OIvUO0LzugNyEkBSy/lJEv45IW7XnSr1Ichw
 dqe4FeopfZS0mHcYNXPYS2VC/V2pR9ifFEBsakzNMoLCQzG/792eid3uDa5xPzD1zJl1lOvCBCw
 ==
X-Received: by 2002:a7b:cb55:0:b0:493:aaa2:f034 with SMTP id
 5b1f17b1804b1-493c2b7a70bmr69475335e9.26.1782999374515; 
 Thu, 02 Jul 2026 06:36:14 -0700 (PDT)
X-Received: by 2002:a7b:cb55:0:b0:493:aaa2:f034 with SMTP id
 5b1f17b1804b1-493c2b7a70bmr69474715e9.26.1782999373932; 
 Thu, 02 Jul 2026 06:36:13 -0700 (PDT)
Received: from rh.fritz.box
 (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dbb01sm9135980f8f.1.2026.07.02.06.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:36:13 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v4 2/3] arm: handle CCSIDR_EL1 as a demuxed register
Date: Thu,  2 Jul 2026 15:36:05 +0200
Message-ID: <20260702133606.34529-3-sebott@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702133606.34529-1-sebott@redhat.com>
References: <20260702133606.34529-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wEEgiZG3yV4AvSaCGIl0fKR4LD3zHJVKK_PPmFxT7lg_1782999375
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Cornelia Huck <cohuck@redhat.com>

Move handling of CCSIDR_EL1 over to the new *_IDREG_DEMUX
infrastructure.

Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 hw/arm/virt.c                 | 19 ++++------
 hw/intc/armv7m_nvic.c         |  2 +-
 target/arm/cpu-max.c          |  6 ++--
 target/arm/cpu-sysregs.h.inc  |  1 +
 target/arm/cpu.h              |  6 ----
 target/arm/cpu64.c            |  6 ++--
 target/arm/helper.c           |  2 +-
 target/arm/tcg/cpu32-system.c | 26 +++++++-------
 target/arm/tcg/cpu64.c        | 68 +++++++++++++++++------------------
 9 files changed, 63 insertions(+), 73 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d8d27f2ef6..e20b5a4fc9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -304,24 +304,19 @@ void set_cpu_cache(CPUCoreCaches *cpu_cache, enum CacheType cache_type,
     int bank_index = ((cache_level - 1) * 2) | is_i_cache0;
     ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
     bool ccidx = cpu_isar_feature(any_ccidx, armcpu);
+    uint64_t ccsidr = GET_IDREG_DEMUX(&armcpu->isar, CCSIDR_EL1, bank_index);
 
     if (ccidx) {
         *cpu_cache = (CPUCoreCaches){
-            .linesize = 1 << (FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1,
-                                         CCIDX_LINESIZE) + 4),
-            .associativity = FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1,
-                                        CCIDX_ASSOCIATIVITY) + 1,
-            .sets = FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1,
-                               CCIDX_NUMSETS) + 1,
+            .linesize = 1 << (FIELD_EX64(ccsidr, CCSIDR_EL1, CCIDX_LINESIZE) + 4),
+            .associativity = FIELD_EX64(ccsidr, CCSIDR_EL1, CCIDX_ASSOCIATIVITY) + 1,
+            .sets = FIELD_EX64(ccsidr, CCSIDR_EL1, CCIDX_NUMSETS) + 1,
         };
     } else {
         *cpu_cache = (CPUCoreCaches){
-            .linesize = 1 << (FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1,
-                                         LINESIZE) + 4),
-            .associativity = FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1,
-                                        ASSOCIATIVITY) + 1,
-            .sets =
-                FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1, NUMSETS) + 1,
+            .linesize = 1 << (FIELD_EX64(ccsidr, CCSIDR_EL1, LINESIZE) + 4),
+            .associativity = FIELD_EX64(ccsidr, CCSIDR_EL1, ASSOCIATIVITY) + 1,
+            .sets = FIELD_EX64(ccsidr, CCSIDR_EL1, NUMSETS) + 1,
         };
     }
     cpu_cache->type = cache_type;
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index a7651f831e..5dd867242b 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1360,7 +1360,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
     case 0xd80: /* CSSIDR */
     {
         int idx = cpu->env.v7m.csselr[attrs.secure] & R_V7M_CSSELR_INDEX_MASK;
-        return cpu->ccsidr[idx];
+        return GET_IDREG_DEMUX(&cpu->isar, CCSIDR_EL1, idx);
     }
     case 0xd84: /* CSSELR */
         return cpu->env.v7m.csselr[attrs.secure];
diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index d38bdfcf81..d2f69b6bcf 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -72,11 +72,11 @@ void aarch64_aa32_a57_init(Object *obj, bool aa32_only)
     cpu->isar.reset_pmcr_el0 = 0x41013000;
     SET_IDREG(isar, CLIDR, 0x0a200023);
     /* 32KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7));
     /* 48KB L1 icache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2));
     /* 2048KB L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 2 * MiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 2 * MiB, 7));
     if (aarch64_enabled) {
         set_dczid_bs(cpu, 4); /* 64 bytes */
         cpu->gic_num_lrs = 4;
diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index 6e8b335b8f..d9e058a57e 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -39,6 +39,7 @@ DEF(MVFR2_EL1, 3, 0, 0, 3, 2)
 DEF(ID_PFR2_EL1, 3, 0, 0, 3, 4)
 DEF(ID_DFR1_EL1, 3, 0, 0, 3, 5)
 DEF(ID_MMFR5_EL1, 3, 0, 0, 3, 6)
+DEF_MUX(CCSIDR_EL1, 3, 1, 0, 0, 0, 16)
 DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
 DEF(ID_AA64ZFR0_EL1, 3, 0, 0, 4, 4)
 DEF(CTR_EL0, 3, 3, 0, 0, 1)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5668deee4c..de2304c049 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1122,10 +1122,6 @@ struct ArchCPU {
     uint64_t pmceid0;
     uint64_t pmceid1;
     uint64_t mp_affinity; /* MP ID without feature bits */
-    /* The elements of this array are the CCSIDR values for each cache,
-     * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
-     */
-    uint64_t ccsidr[16];
     uint64_t reset_cbar;
     uint32_t reset_auxcr;
     bool reset_hivecs;
@@ -2139,8 +2135,6 @@ FIELD(MFAR, FPA, 12, 40)
 FIELD(MFAR, NSE, 62, 1)
 FIELD(MFAR, NS, 63, 1)
 
-QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
-
 /* If adding a feature bit which corresponds to a Linux ELF
  * HWCAP bit, remember to update the feature-bit-to-hwcap
  * mapping in linux-user/elfload.c:get_elf_hwcap().
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 48a0421674..9bcef81dce 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,11 +748,11 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.reset_pmcr_el0 = 0x41033000;
     SET_IDREG(isar, CLIDR, 0x0a200023);
     /* 32KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7));
     /* 32KB L1 icache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 1, 64, 32 * KiB, 2);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 1, 64, 32 * KiB, 2));
     /* 1024KB L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 1 * MiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 1 * MiB, 7));
     set_dczid_bs(cpu, 4); /* 64 bytes */
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 93e3d8b575..04cace7b8f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -882,7 +882,7 @@ static uint64_t ccsidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     uint32_t index = A32_BANKED_REG_GET(env, csselr,
                                         ri->secure & ARM_CP_SECSTATE_S);
 
-    return cpu->ccsidr[index];
+    return GET_IDREG_DEMUX(&cpu->isar, CCSIDR_EL1, index);
 }
 
 static void csselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/tcg/cpu32-system.c b/target/arm/tcg/cpu32-system.c
index 6e98390089..f00c996db3 100644
--- a/target/arm/tcg/cpu32-system.c
+++ b/target/arm/tcg/cpu32-system.c
@@ -270,9 +270,9 @@ static void cortex_a8_initfn(Object *obj)
     SET_IDREG(isar, ID_ISAR4, 0x00111142);
     cpu->isar.dbgdidr = 0x15141000;
     SET_IDREG(isar, CLIDR, (1 << 27) | (2 << 24) | 3);
-    cpu->ccsidr[0] = 0xe007e01a; /* 16k L1 dcache. */
-    cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
-    cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, 0xe007e01a); /* 16k L1 dcache. */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, 0x2007e01a); /* 16k L1 icache. */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, 0xf0000000); /* No L2 icache. */
     cpu->reset_auxcr = 2;
     cpu->isar.reset_pmcr_el0 = 0x41002000;
     define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
@@ -346,8 +346,8 @@ static void cortex_a9_initfn(Object *obj)
     SET_IDREG(isar, ID_ISAR4, 0x00111142);
     cpu->isar.dbgdidr = 0x35141000;
     SET_IDREG(isar, CLIDR, (1 << 27) | (1 << 24) | 3);
-    cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
-    cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, 0xe00fe019); /* 16k L1 dcache. */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, 0x200fe019); /* 16k L1 icache. */
     cpu->isar.reset_pmcr_el0 = 0x41093000;
     define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
 }
@@ -418,9 +418,9 @@ static void cortex_a7_initfn(Object *obj)
     cpu->isar.dbgdevid = 0x01110f13;
     cpu->isar.dbgdevid1 = 0x1;
     SET_IDREG(isar, CLIDR, 0x0a200023);
-    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
-    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, 0x701fe00a); /* 32K L1 dcache */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, 0x201fe00a); /* 32K L1 icache */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, 0x711fe07a); /* 4096K L2 unified cache */
     cpu->isar.reset_pmcr_el0 = 0x41072000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
 }
@@ -466,9 +466,9 @@ static void cortex_a15_initfn(Object *obj)
     cpu->isar.dbgdevid = 0x01110f13;
     cpu->isar.dbgdevid1 = 0x0;
     SET_IDREG(isar, CLIDR, 0x0a200023);
-    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
-    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, 0x701fe00a); /* 32K L1 dcache */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, 0x201fe00a); /* 32K L1 icache */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, 0x711fe07a); /* 4096K L2 unified cache */
     cpu->isar.reset_pmcr_el0 = 0x410F3000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
 }
@@ -657,8 +657,8 @@ static void cortex_r52_initfn(Object *obj)
     SET_IDREG(isar, ID_ISAR5, 0x00010001);
     cpu->isar.dbgdidr = 0x77168000;
     SET_IDREG(isar, CLIDR, (1 << 27) | (1 << 24) | 0x3);
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, 0x700fe01a); /* 32KB L1 dcache */
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, 0x201fe00a); /* 32KB L1 icache */
 
     cpu->pmsav7_dregion = 16;
     cpu->pmsav8r_hdregion = 16;
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index ae3952a1ed..ff9811d90b 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -82,11 +82,11 @@ static void aarch64_a35_initfn(Object *obj)
 
     /* From B2.29 Cache ID registers */
     /* 32KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7));
     /* 32KB L1 icache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 2);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 2));
     /* 512KB L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 512 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 512 * KiB, 7));
 
     /* From B3.5 VGIC Type register */
     cpu->gic_num_lrs = 4;
@@ -250,11 +250,11 @@ static void aarch64_a55_initfn(Object *obj)
 
     /* From B2.23 CCSIDR_EL1 */
     /* 32KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7));
     /* 32KB L1 icache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 2);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 2));
     /* 512KB L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 512 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 512 * KiB, 7));
 
     /* From B2.96 SCTLR_EL3 */
     cpu->reset_sctlr = 0x30c50838;
@@ -320,11 +320,11 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.reset_pmcr_el0 = 0x41023000;
     SET_IDREG(isar, CLIDR, 0x0a200023);
     /* 32KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7));
     /* 48KB L1 dcache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2));
     /* 1MB L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 1 * MiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 1 * MiB, 7));
     set_dczid_bs(cpu, 4); /* 64 bytes */
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
@@ -383,11 +383,11 @@ static void aarch64_a76_initfn(Object *obj)
 
     /* From B2.18 CCSIDR_EL1 */
     /* 64KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7));
     /* 64KB L1 icache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2));
     /* 512KB L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 512 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 512 * KiB, 7));
 
     /* From B2.93 SCTLR_EL3 */
     cpu->reset_sctlr = 0x30c50838;
@@ -455,11 +455,11 @@ static void aarch64_a78ae_initfn(Object *obj)
 
     /* From 3.2.33 CCSIDR_EL1 */
     /* 64KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7));
     /* 64KB L1 icache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2));
     /* 512KB L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 512 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 512 * KiB, 7));
 
     /* From 3.2.118 SCTLR_EL3 */
     cpu->reset_sctlr = 0x30c50838;
@@ -512,11 +512,11 @@ static void aarch64_a64fx_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64ZFR0, 0x0000000000000000);
     SET_IDREG(isar, CLIDR, 0x0000000080000023);
     /* 64KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 7));
     /* 64KB L1 icache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 2);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 2));
     /* 8MB L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 256, 8 * MiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 256, 8 * MiB, 7));
     set_dczid_bs(cpu, 6); /* 256 bytes */
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
@@ -704,11 +704,11 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
 
     /* From B2.23 CCSIDR_EL1 */
     /* 64KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7));
     /* 64KB L1 icache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2));
     /* 1MB L2 dcache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7));
 
     /* From B2.98 SCTLR_EL3 */
     cpu->reset_sctlr = 0x30c50838;
@@ -792,11 +792,11 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
      * L3: No L3 (this matches the CLIDR_EL1 value).
      */
     /* 64KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
     /* 64KB L1 icache */
-    cpu->ccsidr[1] = cpu->ccsidr[0];
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
     /* 1MB L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 1 * MiB, 0);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 1 * MiB, 0));
 
     /* From 3.2.115 SCTLR_EL3 */
     cpu->reset_sctlr = 0x30c50838;
@@ -1034,11 +1034,11 @@ static void aarch64_a710_initfn(Object *obj)
      * L2: 8-way set associative 64 byte line size, total either 256K or 512K.
      */
     /* L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
     /* L1 icache */
-    cpu->ccsidr[1] = cpu->ccsidr[0];
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
     /* L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 512 * KiB, 0);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 512 * KiB, 0));
 
     /* FIXME: Not documented -- copied from neoverse-v1 */
     cpu->reset_sctlr = 0x30c50838;
@@ -1136,11 +1136,11 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
      * L2: 8-way set associative 64 byte line size, total either 512K or 1024K.
      */
     /* L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
     /* L1 icache */
-    cpu->ccsidr[1] = cpu->ccsidr[0];
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
     /* L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 512 * KiB, 0);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 512 * KiB, 0));
     /* FIXME: Not documented -- copied from neoverse-v1 */
     cpu->reset_sctlr = 0x30c50838;
 
@@ -1169,13 +1169,13 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     SET_IDREG(isar, CLIDR, 0x8200123);
     /* 64KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7));
     /* 64KB L1 icache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2));
     /* 1MB L2 unified cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7));
     /* 2MB L3 unified cache */
-    cpu->ccsidr[4] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 * MiB, 7);
+    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 4, make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 * MiB, 7));
 
     /*
      * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default
-- 
2.54.0


