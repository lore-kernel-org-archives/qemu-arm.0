Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1204965lfh;
        Fri, 27 May 2022 11:18:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7D6iTrFbYa0bHyY9oJvy0jNlOs8nnYXmg8JBHD/SrThPR8T/aK4Qi8taoHrTF2HsQjiWW
X-Received: by 2002:a05:620a:280e:b0:680:d1b9:6b0 with SMTP id f14-20020a05620a280e00b00680d1b906b0mr29616120qkp.391.1653675509713;
        Fri, 27 May 2022 11:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653675509; cv=none;
        d=google.com; s=arc-20160816;
        b=HYDmgimWip4K63YGGjSxKE5sxYXgBbCdT7qaYUn8NEfPKH2j4/726lRKDvzUXsVSQk
         HiyvlhApBJqTe0pfBaxffK4fHk3fnUR6s06nPXK4jrX8+tCwGZn8ZsU9E+d8sgtMHM3x
         bpmjcLj3acc4MLDYicF+Ce352AfcNRXGacMgmLHepUtNKl+WsG8LjssxaFcfnUrao184
         jveSLrO5GnC/NCJ2MG5tvvzKhovU+IfmbH3llzddAHtXPY+4+nV0ySIGvARqlb25l0aI
         sUp6d5zvPusls7iEuyZAcXjp3VRvcFpH2HZmisa0qULi/+mZxKQ9cT5mdRiH76U+FMat
         4vkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YQBC+HGfZ3unALHl+XHeGZSFGW//i/p32TgROg9703s=;
        b=kaUFHcuXIUCZNu8GY4yszvHx+USzOGSCpnj2W8XOOwP+9MsCZxjUJovP95vyat6t8b
         FOj2nRaCaLJCBd4ZSLu5xSMiuICHJqFuMO4wuPGRiyAw3dzIYDEJ+thWDy4uy0SgJt+7
         +rAn3JcHv2Ja8QW2Ky5wpQn2Ebj+szjvbv/433QL/9WDSiBj2VNqt5uRhM9peHn26nar
         0RRuh1wKQ1laYNEXJzOecJgeH8er50BzshxIUnySLB6if1jpRNWZjhvlO3IZEleOkX+a
         OVlxatG31iJiJehQLTCovEW91oVIzJOSY4B6axhOxceUIdEo/uBQlyafAvj0BO7TnnoR
         FOaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUJzKXCQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020ac85a82000000b002f3ed707503si3149409qtc.622.2022.05.27.11.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:18:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUJzKXCQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueXd-0004HH-32
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMC-00039s-Bd
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:40 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM6-0001fC-PU
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:39 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c65so4387793pfb.1
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQBC+HGfZ3unALHl+XHeGZSFGW//i/p32TgROg9703s=;
 b=uUJzKXCQcD2u8U0Q9JWZvJpQr2QS7gaJy2YKFndmq0NaS0n3vmgwSDk81hLmte6PXL
 l7ezbkkdQ0oZ58p0p5DVGKQJ3Eb4Fiys1niaU6kADVUc5C4l3Qkvvcol3ARy109RqQI6
 ugFS+PK+UHa2MbGFGEK2vn/L+CUsK5tzE7jVk/xGx+bA2l5odWmkU0usGXntAvOqtiVu
 jJR/5Eu6bENWDtRSyDXE2Ol85ctUhpzDfxfgnKmXu454yQNMon3yG/bAJA+TNK+znKCY
 JU2tOeCS+KVgjbb4m7jXA2RTG37ZDB/r/bi7f1macWb+CCKp/ma8WbabGNnXp/cJLkME
 n7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQBC+HGfZ3unALHl+XHeGZSFGW//i/p32TgROg9703s=;
 b=bAkFQL9x3Jr0WQ5xVFtRS3tMxH4bRQWq1OBA4UaCY3tg0IUj7sg3qJlTZqAMzOTNhj
 0pY1RLmFyJ/00D4ezS/L/WJ+eWDLoASIXS27tnLSXarLC65nU+mXgS+iYzYOAHXlAqlA
 7Snw2mjJqb/8rNkH5ErXo1Hzcgif7L9RVfxK8kZhgiVcGWTaX7dU6mmXhI0rChVQzcmD
 sk3O2GkLPkKzTbxh+Ibl9WDFJcbrCB3Rn9Oi3tI3waVI3pqQ2KteJJgkmwoGf29B5Fp1
 ACRt244nQA1N9PF7bQ67etEqPF2zLrJR3HTbwo1P8LVp9iVJ4uFu8suCysU9945GI85K
 ckWA==
X-Gm-Message-State: AOAM533c5dY/LHHXkexsHs5uhOYV0TePzsgBP5RE5FpynDEibLZIgFQV
 irKcm2v2y9xfKW9N4OvFUjp2yA==
X-Received: by 2002:a63:d054:0:b0:3f2:50df:e008 with SMTP id
 s20-20020a63d054000000b003f250dfe008mr38073831pgi.317.1653674793370; 
 Fri, 27 May 2022 11:06:33 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 10/15] target/arm: Split out load/store primitives to
 sve_ldst_internal.h
Date: Fri, 27 May 2022 11:06:18 -0700
Message-Id: <20220527180623.185261-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lQeL/bn1PyQL

Begin creation of sve_ldst_internal.h by moving the primitives
that access host and tlb memory.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_ldst_internal.h | 127 +++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c        | 107 +--------------------------
 2 files changed, 128 insertions(+), 106 deletions(-)
 create mode 100644 target/arm/sve_ldst_internal.h

diff --git a/target/arm/sve_ldst_internal.h b/target/arm/sve_ldst_internal.h
new file mode 100644
index 0000000000..ef9117e84c
--- /dev/null
+++ b/target/arm/sve_ldst_internal.h
@@ -0,0 +1,127 @@
+/*
+ * ARM SVE Load/Store Helpers
+ *
+ * Copyright (c) 2018-2022 Linaro
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef TARGET_ARM_SVE_LDST_INTERNAL_H
+#define TARGET_ARM_SVE_LDST_INTERNAL_H
+
+#include "exec/cpu_ldst.h"
+
+/*
+ * Load one element into @vd + @reg_off from @host.
+ * The controlling predicate is known to be true.
+ */
+typedef void sve_ldst1_host_fn(void *vd, intptr_t reg_off, void *host);
+
+/*
+ * Load one element into @vd + @reg_off from (@env, @vaddr, @ra).
+ * The controlling predicate is known to be true.
+ */
+typedef void sve_ldst1_tlb_fn(CPUARMState *env, void *vd, intptr_t reg_off,
+                              target_ulong vaddr, uintptr_t retaddr);
+
+/*
+ * Generate the above primitives.
+ */
+
+#define DO_LD_HOST(NAME, H, TYPEE, TYPEM, HOST)                              \
+static inline void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host) \
+{ TYPEM val = HOST(host); *(TYPEE *)(vd + H(reg_off)) = val; }
+
+#define DO_ST_HOST(NAME, H, TYPEE, TYPEM, HOST)                              \
+static inline void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host) \
+{ TYPEM val = *(TYPEE *)(vd + H(reg_off)); HOST(host, val); }
+
+#define DO_LD_TLB(NAME, H, TYPEE, TYPEM, TLB)                              \
+static inline void sve_##NAME##_tlb(CPUARMState *env, void *vd,            \
+                        intptr_t reg_off, target_ulong addr, uintptr_t ra) \
+{                                                                          \
+    TYPEM val = TLB(env, useronly_clean_ptr(addr), ra);                    \
+    *(TYPEE *)(vd + H(reg_off)) = val;                                     \
+}
+
+#define DO_ST_TLB(NAME, H, TYPEE, TYPEM, TLB)                              \
+static inline void sve_##NAME##_tlb(CPUARMState *env, void *vd,            \
+                        intptr_t reg_off, target_ulong addr, uintptr_t ra) \
+{                                                                          \
+    TYPEM val = *(TYPEE *)(vd + H(reg_off));                               \
+    TLB(env, useronly_clean_ptr(addr), val, ra);                           \
+}
+
+#define DO_LD_PRIM_1(NAME, H, TE, TM)                   \
+    DO_LD_HOST(NAME, H, TE, TM, ldub_p)                 \
+    DO_LD_TLB(NAME, H, TE, TM, cpu_ldub_data_ra)
+
+DO_LD_PRIM_1(ld1bb,  H1,   uint8_t,  uint8_t)
+DO_LD_PRIM_1(ld1bhu, H1_2, uint16_t, uint8_t)
+DO_LD_PRIM_1(ld1bhs, H1_2, uint16_t,  int8_t)
+DO_LD_PRIM_1(ld1bsu, H1_4, uint32_t, uint8_t)
+DO_LD_PRIM_1(ld1bss, H1_4, uint32_t,  int8_t)
+DO_LD_PRIM_1(ld1bdu, H1_8, uint64_t, uint8_t)
+DO_LD_PRIM_1(ld1bds, H1_8, uint64_t,  int8_t)
+
+#define DO_ST_PRIM_1(NAME, H, TE, TM)                   \
+    DO_ST_HOST(st1##NAME, H, TE, TM, stb_p)             \
+    DO_ST_TLB(st1##NAME, H, TE, TM, cpu_stb_data_ra)
+
+DO_ST_PRIM_1(bb,   H1,  uint8_t, uint8_t)
+DO_ST_PRIM_1(bh, H1_2, uint16_t, uint8_t)
+DO_ST_PRIM_1(bs, H1_4, uint32_t, uint8_t)
+DO_ST_PRIM_1(bd, H1_8, uint64_t, uint8_t)
+
+#define DO_LD_PRIM_2(NAME, H, TE, TM, LD) \
+    DO_LD_HOST(ld1##NAME##_be, H, TE, TM, LD##_be_p)    \
+    DO_LD_HOST(ld1##NAME##_le, H, TE, TM, LD##_le_p)    \
+    DO_LD_TLB(ld1##NAME##_be, H, TE, TM, cpu_##LD##_be_data_ra) \
+    DO_LD_TLB(ld1##NAME##_le, H, TE, TM, cpu_##LD##_le_data_ra)
+
+#define DO_ST_PRIM_2(NAME, H, TE, TM, ST) \
+    DO_ST_HOST(st1##NAME##_be, H, TE, TM, ST##_be_p)    \
+    DO_ST_HOST(st1##NAME##_le, H, TE, TM, ST##_le_p)    \
+    DO_ST_TLB(st1##NAME##_be, H, TE, TM, cpu_##ST##_be_data_ra) \
+    DO_ST_TLB(st1##NAME##_le, H, TE, TM, cpu_##ST##_le_data_ra)
+
+DO_LD_PRIM_2(hh,  H1_2, uint16_t, uint16_t, lduw)
+DO_LD_PRIM_2(hsu, H1_4, uint32_t, uint16_t, lduw)
+DO_LD_PRIM_2(hss, H1_4, uint32_t,  int16_t, lduw)
+DO_LD_PRIM_2(hdu, H1_8, uint64_t, uint16_t, lduw)
+DO_LD_PRIM_2(hds, H1_8, uint64_t,  int16_t, lduw)
+
+DO_ST_PRIM_2(hh, H1_2, uint16_t, uint16_t, stw)
+DO_ST_PRIM_2(hs, H1_4, uint32_t, uint16_t, stw)
+DO_ST_PRIM_2(hd, H1_8, uint64_t, uint16_t, stw)
+
+DO_LD_PRIM_2(ss,  H1_4, uint32_t, uint32_t, ldl)
+DO_LD_PRIM_2(sdu, H1_8, uint64_t, uint32_t, ldl)
+DO_LD_PRIM_2(sds, H1_8, uint64_t,  int32_t, ldl)
+
+DO_ST_PRIM_2(ss, H1_4, uint32_t, uint32_t, stl)
+DO_ST_PRIM_2(sd, H1_8, uint64_t, uint32_t, stl)
+
+DO_LD_PRIM_2(dd, H1_8, uint64_t, uint64_t, ldq)
+DO_ST_PRIM_2(dd, H1_8, uint64_t, uint64_t, stq)
+
+#undef DO_LD_TLB
+#undef DO_ST_TLB
+#undef DO_LD_HOST
+#undef DO_LD_PRIM_1
+#undef DO_ST_PRIM_1
+#undef DO_LD_PRIM_2
+#undef DO_ST_PRIM_2
+
+#endif /* TARGET_ARM_SVE_LDST_INTERNAL_H */
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e0f9aa9983..ea4c835689 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -21,12 +21,12 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg.h"
 #include "vec_internal.h"
+#include "sve_ldst_internal.h"
 
 
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
@@ -5299,111 +5299,6 @@ void HELPER(sve_fcmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
  * Load contiguous data, protected by a governing predicate.
  */
 
-/*
- * Load one element into @vd + @reg_off from @host.
- * The controlling predicate is known to be true.
- */
-typedef void sve_ldst1_host_fn(void *vd, intptr_t reg_off, void *host);
-
-/*
- * Load one element into @vd + @reg_off from (@env, @vaddr, @ra).
- * The controlling predicate is known to be true.
- */
-typedef void sve_ldst1_tlb_fn(CPUARMState *env, void *vd, intptr_t reg_off,
-                              target_ulong vaddr, uintptr_t retaddr);
-
-/*
- * Generate the above primitives.
- */
-
-#define DO_LD_HOST(NAME, H, TYPEE, TYPEM, HOST) \
-static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
-{                                                                      \
-    TYPEM val = HOST(host);                                            \
-    *(TYPEE *)(vd + H(reg_off)) = val;                                 \
-}
-
-#define DO_ST_HOST(NAME, H, TYPEE, TYPEM, HOST) \
-static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
-{ HOST(host, (TYPEM)*(TYPEE *)(vd + H(reg_off))); }
-
-#define DO_LD_TLB(NAME, H, TYPEE, TYPEM, TLB) \
-static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
-                             target_ulong addr, uintptr_t ra)               \
-{                                                                           \
-    *(TYPEE *)(vd + H(reg_off)) =                                           \
-        (TYPEM)TLB(env, useronly_clean_ptr(addr), ra);                      \
-}
-
-#define DO_ST_TLB(NAME, H, TYPEE, TYPEM, TLB) \
-static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
-                             target_ulong addr, uintptr_t ra)               \
-{                                                                           \
-    TLB(env, useronly_clean_ptr(addr),                                      \
-        (TYPEM)*(TYPEE *)(vd + H(reg_off)), ra);                            \
-}
-
-#define DO_LD_PRIM_1(NAME, H, TE, TM)                   \
-    DO_LD_HOST(NAME, H, TE, TM, ldub_p)                 \
-    DO_LD_TLB(NAME, H, TE, TM, cpu_ldub_data_ra)
-
-DO_LD_PRIM_1(ld1bb,  H1,   uint8_t,  uint8_t)
-DO_LD_PRIM_1(ld1bhu, H1_2, uint16_t, uint8_t)
-DO_LD_PRIM_1(ld1bhs, H1_2, uint16_t,  int8_t)
-DO_LD_PRIM_1(ld1bsu, H1_4, uint32_t, uint8_t)
-DO_LD_PRIM_1(ld1bss, H1_4, uint32_t,  int8_t)
-DO_LD_PRIM_1(ld1bdu, H1_8, uint64_t, uint8_t)
-DO_LD_PRIM_1(ld1bds, H1_8, uint64_t,  int8_t)
-
-#define DO_ST_PRIM_1(NAME, H, TE, TM)                   \
-    DO_ST_HOST(st1##NAME, H, TE, TM, stb_p)             \
-    DO_ST_TLB(st1##NAME, H, TE, TM, cpu_stb_data_ra)
-
-DO_ST_PRIM_1(bb,   H1,  uint8_t, uint8_t)
-DO_ST_PRIM_1(bh, H1_2, uint16_t, uint8_t)
-DO_ST_PRIM_1(bs, H1_4, uint32_t, uint8_t)
-DO_ST_PRIM_1(bd, H1_8, uint64_t, uint8_t)
-
-#define DO_LD_PRIM_2(NAME, H, TE, TM, LD) \
-    DO_LD_HOST(ld1##NAME##_be, H, TE, TM, LD##_be_p)    \
-    DO_LD_HOST(ld1##NAME##_le, H, TE, TM, LD##_le_p)    \
-    DO_LD_TLB(ld1##NAME##_be, H, TE, TM, cpu_##LD##_be_data_ra) \
-    DO_LD_TLB(ld1##NAME##_le, H, TE, TM, cpu_##LD##_le_data_ra)
-
-#define DO_ST_PRIM_2(NAME, H, TE, TM, ST) \
-    DO_ST_HOST(st1##NAME##_be, H, TE, TM, ST##_be_p)    \
-    DO_ST_HOST(st1##NAME##_le, H, TE, TM, ST##_le_p)    \
-    DO_ST_TLB(st1##NAME##_be, H, TE, TM, cpu_##ST##_be_data_ra) \
-    DO_ST_TLB(st1##NAME##_le, H, TE, TM, cpu_##ST##_le_data_ra)
-
-DO_LD_PRIM_2(hh,  H1_2, uint16_t, uint16_t, lduw)
-DO_LD_PRIM_2(hsu, H1_4, uint32_t, uint16_t, lduw)
-DO_LD_PRIM_2(hss, H1_4, uint32_t,  int16_t, lduw)
-DO_LD_PRIM_2(hdu, H1_8, uint64_t, uint16_t, lduw)
-DO_LD_PRIM_2(hds, H1_8, uint64_t,  int16_t, lduw)
-
-DO_ST_PRIM_2(hh, H1_2, uint16_t, uint16_t, stw)
-DO_ST_PRIM_2(hs, H1_4, uint32_t, uint16_t, stw)
-DO_ST_PRIM_2(hd, H1_8, uint64_t, uint16_t, stw)
-
-DO_LD_PRIM_2(ss,  H1_4, uint32_t, uint32_t, ldl)
-DO_LD_PRIM_2(sdu, H1_8, uint64_t, uint32_t, ldl)
-DO_LD_PRIM_2(sds, H1_8, uint64_t,  int32_t, ldl)
-
-DO_ST_PRIM_2(ss, H1_4, uint32_t, uint32_t, stl)
-DO_ST_PRIM_2(sd, H1_8, uint64_t, uint32_t, stl)
-
-DO_LD_PRIM_2(dd, H1_8, uint64_t, uint64_t, ldq)
-DO_ST_PRIM_2(dd, H1_8, uint64_t, uint64_t, stq)
-
-#undef DO_LD_TLB
-#undef DO_ST_TLB
-#undef DO_LD_HOST
-#undef DO_LD_PRIM_1
-#undef DO_ST_PRIM_1
-#undef DO_LD_PRIM_2
-#undef DO_ST_PRIM_2
-
 /*
  * Skip through a sequence of inactive elements in the guarding predicate @vg,
  * beginning at @reg_off bounded by @reg_max.  Return the offset of the active
-- 
2.34.1

