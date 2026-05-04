Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C67FF885A
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:52:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJvZx-00010x-4U; Mon, 04 May 2026 11:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZv-000109-Gj
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:27 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZt-0006Eh-Po
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:27 -0400
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-50d876329bbso35813211cf.2
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777909885; x=1778514685; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=giIrFw4uQ5vf/7JK4azr8Lzs9BpiUv+KWk/6RVqDIRg=;
 b=Gs9va19+GdX8Nx9hmrthX+wD5f7Qlaej1dn/6bAQ6WSTUuzPhSLv2pvJA100PW7wSz
 EKlzckGOkuQUYxckQe4SOPLhZZG3Lek0NTU4hZAbgPX123lPS7e/Y2KCZBAvfdN0RNIh
 GAyy6CUjeaxfvEqJ6MtEs1epD8TvqPo+1K4719WcHUSqndUVYxRlfpCQRS2FgU5Fp3Fq
 L1B36BPnKGakstWtQ59pA+pzJoYwSo6MB/zZggi45e535oW2ZfOjezI2M21o5Jc9AJhy
 v/XqQra95sCs258t8NYDTCgRy4Yo8p4q6xlyGCC1TB4ZCQpuQPgPcw+Gmcg0mdAmjDJm
 DaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777909885; x=1778514685;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=giIrFw4uQ5vf/7JK4azr8Lzs9BpiUv+KWk/6RVqDIRg=;
 b=ULA/tNaiWWVZyXRmfd96wSZZ9Jbnp+pCLTA+aoJqTS9L7sipRctK2ym2kg4QYtdxdy
 6AIaVqlVDVrqoVIbLULcea/IVAlCmVknXW6FaqJvf+L0ooD0QbS5uzsSZdRZZR0+6c2Z
 VvV2ZmutySruQMqy6M2CemQX4sTLxJ+USLXzGd426t9oAyRp6fzAscItSW/kL9KAxice
 ETY6I2Uv+BA6jGVRqzpOcM4kN1jdS7bm2SLO06/bDDOR/FyrCPSOZ9dm4IyOtoaeyYL8
 5bGvURaemne/g7d64cIdT9bBLkpgvWyOhAfW2jSdriNiHgEgXuMF/DdxqRRb124hWmSB
 gVew==
X-Forwarded-Encrypted: i=1;
 AFNElJ//rXY8YFi2uTYLOIakfijzAdzRkQsyzXFEzakst/+m/ChNCx7ijLXE+uBTdDnTTwA8M8iR1MZAHw==@nongnu.org
X-Gm-Message-State: AOJu0Yyf8I/5gvCxJm848v4AJWsoJXBRf7oIcYHiMbXVwKQE34WWltzb
 NTIg3JridaoAoo9fXOTyP/KUfMC3p+kSHiqwLpNoSi8VPaV5vRoiS1mKrSsnrcFM
X-Gm-Gg: AeBDievj2C6BpOteyyj/EgmAmFXZwnn0KGkfFz1mmZ6brK39X3VN++EbLOCBlnwSogr
 6UgZwKAsK2h05f4gAdw5uXZJhC+kVa2wBoHSRuOaTJ7HeKmUSfagUesfYkQiwOUfI9QE+vWqWQf
 JQ8gETTDdK8NbUaMlfS/2eq/sIMcimLJexdfqUu9KrdU1qvWZEAdHYeyGNM07gbMuBo66q/kIgk
 lZocuiRxaQWl/jhQ6bbQwrLMXabvfNrQNkYd3yLitn60sPXt4ehWl9P0pEnhyKxxFrqn2BLcJia
 rKW0hHXh7HxiG011muFEgKpfpUxaTP8kB3f3aOKF9LNHJrIvptqoK/lHm2BEoVkvXYuIBYDsOn9
 Ak8pcd+QHo7nIBO9Z7jOzoE+UyupZZNvZ9jUazwPqNpE68LqQO4n4bfUedQDMa1NeH/Q7d7Oinf
 ZRFhr/ayebsGoJioF6Aq/UjmRzYsXCYo26T60TsxdaveOoCjsLGVA=
X-Received: by 2002:ac8:5a41:0:b0:50f:b81e:c655 with SMTP id
 d75a77b69052e-5104bfece53mr147778491cf.57.1777909884502; 
 Mon, 04 May 2026 08:51:24 -0700 (PDT)
Received: from [192.168.1.164] ([2600:1009:a021:c665:5296:905f:3e4a:eb90])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51040931552sm99599011cf.12.2026.05.04.08.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 08:51:24 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 04 May 2026 11:50:44 -0400
Subject: [PATCH v5 11/15] target/arm: skip tag bit bounds check if MTX is
 on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-feat-mte4-v5-11-232a648e63c6@gmail.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
In-Reply-To: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777909867; l=5087;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=HMCENyYuzYOzcc9QE9JQvMCcTO5kh+qhX6EVpUZWlXw=;
 b=mQHiEfKFcAecsu5d/Vr2zsSJoPgIVb63ZtKogI6r+QxempCDNK7z4xnw8JRZOYkgskpTPqNnR
 40Iqgb8TgFaB81NQOXKDRlOOSKZiJWBMqNL+KlTgT1YqZCZZdxI9UVw
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Virtual address canonicity checks should ignore mismatch in tag bits
during translation step if MTX is set. This mismatch is checked during
the tag check instead, in that case.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/helper.c    |  6 +++++-
 target/arm/internals.h |  1 +
 target/arm/ptw.c       | 29 ++++++++++++++++++++++++++---
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 18352bd186..0e70822d34 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9693,7 +9693,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
     bool epd, hpd, tsz_oob, ds, ha, hd, pie = false;
-    bool aie = false;
+    bool mtx, aie = false;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -9730,6 +9730,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
         hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
+        mtx = extract64(tcr, 33, 1) && cpu_isar_feature(aa64_mte_mtx, cpu);
     } else {
         bool e0pd;
 
@@ -9745,6 +9746,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             sh = extract32(tcr, 12, 2);
             hpd = extract64(tcr, 41, 1);
             e0pd = extract64(tcr, 55, 1);
+            mtx = extract64(tcr, 60, 1) && cpu_isar_feature(aa64_mte_mtx, cpu);
         } else {
             tsz = extract32(tcr, 16, 6);
             gran = tg1_to_gran_size(extract32(tcr, 30, 2));
@@ -9752,6 +9754,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
             e0pd = extract64(tcr, 56, 1);
+            mtx = extract64(tcr, 61, 1) && cpu_isar_feature(aa64_mte_mtx, cpu);
         }
         ps = extract64(tcr, 32, 3);
         ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
@@ -9851,6 +9854,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .gran = gran,
         .pie = pie,
         .aie = aie,
+        .mtx = mtx,
     };
 }
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 779eafabc8..d313d36603 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1407,6 +1407,7 @@ typedef struct ARMVAParameters {
     ARMGranuleSize gran : 2;
     bool pie        : 1;
     bool aie        : 1;
+    bool mtx        : 1;
 } ARMVAParameters;
 
 /**
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4fdb27697d..4fa50d0320 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1931,7 +1931,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * validation to do here.
      */
     if (inputsize < addrsize) {
-        uint64_t top_bits = sextract64(address, inputsize,
+        /*
+         * If MTX is enabled, bits 56-59 aren't checked for canonicity
+         * during translation, since they will later be checked during
+         * the tag check step.
+         */
+        uint64_t top_bits;
+        uint64_t masked_address = address;
+        if (param.mtx) {
+            masked_address = deposit64(address, 56, 4, param.select * 0xf);
+        }
+        top_bits = sextract64(masked_address, inputsize,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
@@ -3492,15 +3502,28 @@ static bool get_phys_addr_disabled(CPUARMState *env,
         if (arm_el_is_aa64(env, r_el)) {
             int pamax = arm_pamax(env_archcpu(env));
             uint64_t tcr = env->cp15.tcr_el[r_el];
-            int addrtop, tbi;
+            int addrtop, tbi, mtx;
+            bool bit55;
 
             tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+            mtx = aa64_va_parameter_mtx(tcr, mmu_idx);
             if (access_type == MMU_INST_FETCH) {
                 tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
             }
-            tbi = (tbi >> extract64(address, 55, 1)) & 1;
+            bit55 = extract64(address, 55, 1);
+            tbi = (tbi >> bit55) & 1;
+            mtx = (mtx >> bit55) & 1;
             addrtop = (tbi ? 55 : 63);
 
+            /*
+             * With MTX enabled, bits 56-59 are not checked according to
+             * AArch64.S1DisabledOutput.
+             */
+            if (cpu_isar_feature(aa64_mte_mtx, env_archcpu(env)) && mtx &&
+                access_type != MMU_INST_FETCH) {
+                address = deposit64(address, 56, 4, bit55 * 0xF);
+            }
+
             if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
                 fi->type = ARMFault_AddressSize;
                 fi->level = 0;

-- 
2.54.0


