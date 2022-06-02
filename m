Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5203174lfh;
        Thu, 2 Jun 2022 15:04:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhCc242WbE5fOVhlYeycEoJyrsef6wyMusdxO6UsHB6q2e0TkV0cuDk/Rtb8TNlP1v+vJY
X-Received: by 2002:a05:620a:1a8b:b0:6a6:349e:ee9 with SMTP id bl11-20020a05620a1a8b00b006a6349e0ee9mr4601234qkb.143.1654207496435;
        Thu, 02 Jun 2022 15:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654207496; cv=none;
        d=google.com; s=arc-20160816;
        b=SNkHIddl6NOVVyuoCQA0DfBB1XYtjQPdoXXu0Pvtju8J90N20iebQif0YbvXshjrnq
         2gdtMNkgCdgqcKNJ4ty7Pox0+8As5dfCSNmcVcQXdEo9mwp7MFLutKGOW3vtXS2jMetm
         eueIzamCC0y12XniCVWJeQ58Mx+/p2/3Q5Ksxm13TSefZJrkLhhmfvax+xRRV/xE2ITj
         VT0UvBxuydkD6/Bgqmlky1MRINLV7E0Uvh3lvWFuUTimCPWXjZFghy9awntwcudr9UEY
         6e5FjANcO6i+s9OYHwC77lt2qEBI31YLgwGtTamDJZwvW4sHO6gCKH9e2p1rpeTLYE2y
         Rejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F4rHpbD5Ee0Gqq7jh/rhx4dfJgd9LnpoppwR09o1CsY=;
        b=B3OTZh6RcMKjJQOJadCGxwzAfUoj4oody7Zq9YRGG+eFvT+jyUrCq55eFudhrCevy7
         PfofKkMdWe+7l3fi5y4+e7VPtBBTfHbJoyoz80PVi0U5pPYi9l//L1iHk3OV18mF2uem
         t6xDtgslIQ3dvIODY2HHcPC24oqtEusztrxZ7sxxFhKxAVwei3o5JqdtQbNJHWzaZWdi
         If6J36aQ6zz1F+OuJe89KOxdqudp2S3umr7lHIUGGkDOQtYDzYzd1jPT57cSkxVd9Hx+
         d1X+h6NeuJdi8pvN4ZhxBSGwyzclW5ut/StVAtAu7ocLi4Fn4rM7hpTsXtHNV5Z2tnX8
         xPcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWY0ctmt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020ac85c43000000b002f91176c27esi2728998qtj.10.2022.06.02.15.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWY0ctmt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwsw3-00039q-V2
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgo-0004fr-Hc
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:10 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgk-0008UD-Ky
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:10 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso6070513pjb.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F4rHpbD5Ee0Gqq7jh/rhx4dfJgd9LnpoppwR09o1CsY=;
 b=NWY0ctmtTpDldBeAWXB8jEGJcYtIubk5aMg3PW6/k3GtBw+HYdfEJBNnfmbRRDa8B3
 uESckvfxNOoxel7Pu/E/+PramxgrR7qjz+gJkul9KLugCOeEjuaYgfxoQxNDQki0JgEU
 y/3LXTcW3I0CUCb9yeNWQBXec/GySElBb0AvfZaeRBBFWEkv/myo2wDW9KzqOB2jQ/qP
 2Jqeo6kUIdcrH9bR9HviMOZ9qKEBmKvNN+cKU6+TOq2Q6IgHaDype8VIJzYTxAUPLmmP
 Tkd7D8AiIn3aRkIiYa5bvW1FxP9zqSDLf6CpodtZy5RiI4lhmDB2S84OeosJYTupyl4y
 iXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F4rHpbD5Ee0Gqq7jh/rhx4dfJgd9LnpoppwR09o1CsY=;
 b=vTtjCFpPqDznNqzm6KE2UuOXr/+BOmtgURPwUnLuS4AFLMeJmbzzazxLqxkfsLDG1/
 fQwtFnQGpp5Fbp0iHTdGX8fh3+8GR1JX0OJ3I0OKwnkIUpaKBtAKtPNFZAQSpzU0bdeH
 iEkNhFMged3PMaapyzZewMRsmdD4Nh+PC9XXMQRuaXJgYjU3vloEhwGLKN9bB6QUEbFh
 7IHywjYVrvO7fv+6s4q3xP7qsMpT8d+E6+L8NzzJd7Bk04jwiZ7v6diVbz351KU7CMSs
 B53EOb9E963cx8jaai7F0wsrJcLiyt0BtXgTVo1O+36ATouvIvKn+Pb+QXrc6BKxTvFQ
 W/Ig==
X-Gm-Message-State: AOAM531v6dPv3gR2/fDBwV4kIubiBTJANkKLtaxY+jvKdWpVI8RHa3E5
 xw8HzF8NGgSQEzWpFUXrNnXweD/TS2tqdw==
X-Received: by 2002:a17:90b:4c8c:b0:1df:c760:e4af with SMTP id
 my12-20020a17090b4c8c00b001dfc760e4afmr7576996pjb.78.1654206545819; 
 Thu, 02 Jun 2022 14:49:05 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 13/71] target/arm: Split out load/store primitives to
 sve_ldst_internal.h
Date: Thu,  2 Jun 2022 14:47:55 -0700
Message-Id: <20220602214853.496211-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: udx2X++Y+lPb

Begin creation of sve_ldst_internal.h by moving the primitives
that access host and tlb memory.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 3bdcd4ce9d..0c6dde00aa 100644
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
@@ -5301,111 +5301,6 @@ void HELPER(sve_fcmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
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

