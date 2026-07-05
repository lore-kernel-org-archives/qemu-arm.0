Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35983C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:43:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEdz-00008n-Dt; Sun, 05 Jul 2026 00:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcX-0005JA-Ea
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:21 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcB-0004Vq-N3
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:20 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2cace7da66eso16209365ad.0
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226278; x=1783831078; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Gu1/Z4NGRci2zl7OUGsQFq715jKZAcS9WoRfcTkKu9k=;
 b=Su/JF5JrKq1V8q1V/FaNCvHr4pcFgGbupwdxgqCAVKJMC9YzCrUrHykerA2mkDwYha
 LfdoegNXxtMptpEisy0bBC+drwMGYAA3A3Ew4BZOa5I/N06zmxhwqBqogci+xngUBOjr
 4r8TyfwfDNsxZIbnrziwZcypZcSd63ohASa0KH7qYpvjIWWqFMzHWWTTL/6nIY4DxTnC
 d1ZA+9wsVl4r1J+Z/h00weZTQP2fRnWUMR2KiRFixq6W0WT3ZzCSDvCKGMNpAUCTQFnS
 zvd+xMGd106RC5XArwFYi54bL3CUKfsPBdKs/BOfNiaB870lDH7Olt3nvnFlqdIwK21l
 6euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226278; x=1783831078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Gu1/Z4NGRci2zl7OUGsQFq715jKZAcS9WoRfcTkKu9k=;
 b=V8SA5W+FaXwxes5YoZB5/4B/d9Vacvo3vTZbu8BWClfL4whUPt1aY90oT2kQrxztg1
 0fByIolFu0P3L+23i4Ht15u2VmBqJ2bjoXWDMyj+ODmijDqiXWjzhhLCCxK7DaGJN+Dl
 6U8dNSiaNrM+IVupAIs5m54Mxnh7OqbdJBJY6T88F0wD0e3JBkO28ACn9mqCylX2ZJiR
 dxnWfApdVrqjfnf/fbzbkFkKJtAYbWV3xlfCYsXkB7DjSda4R4risaKTAZzFpHE8+l/W
 lZZWBRbYbGzJmX5sO2XasQhFKRJ3dXshtvLYDI2wTQbAnM8iyxpE6qXOhN4roaJkLy2G
 vnaw==
X-Gm-Message-State: AOJu0Ywx84w7WOHaPAKEoEnb1vqknPx5sZY+pVUz+Dy1cZSRlE5ss6zZ
 n/93hgpzw+zZQQqGqHwOEvv+2FxKDigxzWadlylokJAk/Rbe6gWwi9u7pMdZqCnC8+tbeUS8dYT
 Vl8sb
X-Gm-Gg: AfdE7cmFD/2d5iCb8XQurlyFdTbtHqsSafwIoo2QpDutNDdXv4qW6A1aTsPw+QOC7UM
 ZBMacdwgBvjp9sf0lJgUYm84DQtTI9fdLfAG0EBvNeZaiSH0cS66t04jnvRW3q5c3FiC9S7luju
 qHd1vFhYBoO17mGZG10vK8FNRdKoeD37ntJcvOdANwfy3tHUxGF7vyb6MXObOHins7UW5fFF1Fz
 zER+CXybgxj84LYgnSGQnugbWcctHkwDxCkyHKiPQk3wBOVnklnr06IbIOt/jL33oAGSaQoBB86
 6sB8Yi/IkCoagmHXePwpZoYsEHGoxExqw8CKE/R5ClK5scEgRlx6+d3XLHaovlvaPlB3oxPUDaS
 tVxN88e7rFAOK8Q5HuiwPjdBQHxNAbTTogqaMh0s7MlWmNsOoQzvUdne2u3jPeVPr3PND0wGeSN
 9X2SuLWFosmYl3v+kLdIW8kTN4JEECjHxtmmnQISVOEfVhKHY=
X-Received: by 2002:a17:903:198e:b0:2c6:9f14:c50c with SMTP id
 d9443c01a7336-2cbb7cba325mr55750965ad.13.1783226278227; 
 Sat, 04 Jul 2026 21:37:58 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 37/46] target/ppc: Simplify ppc_cpu_debug_check_watchpoint
Date: Sat,  4 Jul 2026 21:37:16 -0700
Message-ID: <20260705043725.1373137-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

We don't need to check either ISA bit, because that's already
done starting with SPR registration.  Replace target_ulong with
uint64_t, as we're under TARGET_PPC64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/tcg-excp_helper.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper.c
index 99ffe4a820..4065440949 100644
--- a/target/ppc/tcg-excp_helper.c
+++ b/target/ppc/tcg-excp_helper.c
@@ -353,35 +353,23 @@ bool ppc_cpu_debug_check_watchpoint(CPUState *cs, CPUBreakpoint *wp)
 {
 #if defined(TARGET_PPC64)
     CPUPPCState *env = cpu_env(cs);
-    bool wt, wti, hv, sv, pr;
-    uint32_t dawrx;
+    uint32_t dawrx = env->spr[wp->id ? SPR_DAWRX1 : SPR_DAWRX0];
+    bool wt = extract32(dawrx, PPC_BIT_NR(59), 1);
+    bool wti = extract32(dawrx, PPC_BIT_NR(60), 1);
+    bool hv = extract32(dawrx, PPC_BIT_NR(61), 1);
+    bool sv = extract32(dawrx, PPC_BIT_NR(62), 1);
+    bool pr = extract32(dawrx, PPC_BIT_NR(62), 1);
 
-    if ((env->insns_flags2 & PPC2_ISA207S) &&
-        (wp == env->dawr_watchpoint[0])) {
-        dawrx = env->spr[SPR_DAWRX0];
-    } else if ((env->insns_flags2 & PPC2_ISA310) &&
-               (wp == env->dawr_watchpoint[1])) {
-        dawrx = env->spr[SPR_DAWRX1];
-    } else {
+    if ((env->msr & (1ull << MSR_PR)) && !pr) {
         return false;
-    }
-
-    wt = extract32(dawrx, PPC_BIT_NR(59), 1);
-    wti = extract32(dawrx, PPC_BIT_NR(60), 1);
-    hv = extract32(dawrx, PPC_BIT_NR(61), 1);
-    sv = extract32(dawrx, PPC_BIT_NR(62), 1);
-    pr = extract32(dawrx, PPC_BIT_NR(62), 1);
-
-    if ((env->msr & ((target_ulong)1 << MSR_PR)) && !pr) {
-        return false;
-    } else if ((env->msr & ((target_ulong)1 << MSR_HV)) && !hv) {
+    } else if ((env->msr & (1ull << MSR_HV)) && !hv) {
         return false;
     } else if (!sv) {
         return false;
     }
 
     if (!wti) {
-        if (env->msr & ((target_ulong)1 << MSR_DR)) {
+        if (env->msr & (1ull << MSR_DR)) {
             return wt;
         } else {
             return !wt;
-- 
2.43.0


