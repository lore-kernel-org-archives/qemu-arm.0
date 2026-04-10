Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96305F45A0E
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 20:07:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBI8L-0002cT-Jd; Fri, 10 Apr 2026 16:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI8D-0002WK-Uf
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:07:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI8B-0008PO-Gu
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:07:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43cfce3a195so1530881f8f.2
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 13:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775851624; x=1776456424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yu7BTPNKbreK/lHqYpvo7VBnS3+V5caUf921B6Q8Iis=;
 b=E/mjfdMqxNlqHQVwU3dlMZkCgrqoCJh+3sYWLVvZDWKEqqpSkthk8kniDzXRnSDzUo
 7i6jao2mASKEaLqkNX/jhM0dBWolg88wMl254x0PiZofqBUUr2NB9aoTzKG6X9JTyL3A
 scZgiRQToNPlrYu/AQIEOzUGhATf6K/MYsqzS1jOkOtqlxRhSq36RzfcuhrAwpGHmR+Z
 LypP7ToMG6L1oSWZvTyEO7p8QZGVOlL2cY0uAYaH+8YbdR8RX5OyWaquHr2J0MuxW26h
 b7uAgQBLS5eywWRsgmLVrp8ss5JdAN+t6HgnB7nu0KWnwcLY62WuidDey7WNCNK93IhT
 p4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775851624; x=1776456424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yu7BTPNKbreK/lHqYpvo7VBnS3+V5caUf921B6Q8Iis=;
 b=csSwbg6H6R10avABQN2y5oTqBnumQPY+ZGGrS2iDmOV8NzyMTej75N4Hhj+n1hEQZT
 3/v0H/0De/T6qJ8wcBCf7WFkusA/FhnZTDTY3ewQlSBv/JNWgt2vUG3J3Lh1D4EdCysE
 MDIOTTDMny6DaE0sZq+//W+d6rG0D2uK3yMC3DvyDNrzABplm/bY111ACXcB8XPu52Kn
 +nIgr3EV0yJ94cu39/21iGcokFH87rPOQWCwUS1EdyMSNK21NjP7zT8uCmhMfcBDhTKl
 mVIJ8bCblnKFGpuCfm1DHxLiHvXirbToNjtLup7AerJUa3KaCRlBM4hQ9sAmCPRshqoh
 95Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0km0Powt6HGGAsytfuZB83eqTQpqIt6tFDIxyeKoUI0yMovc0O49bA6D3tu9pUnCxi/9vgaKf5A==@nongnu.org
X-Gm-Message-State: AOJu0YwxAzBQIonYtEMcf6BG1tX5UoNEfMCjQrZKpG7mqHcERXu7ZQYX
 zWbQLD1Dd/MTG8ncHE1q43opGxbtbcKlvz1aLQNPe4Hk83tOScTJAwq6sH3Ot6upHg49tDDMipJ
 VTBG2Wt0=
X-Gm-Gg: AeBDievXzZrK94sPqJUsLUejTBG8sMW0qAL+CKP/yDD6kQJwGwQvQ7tH/gY4NLqYucg
 tqdC670qbj7lQwzQ/qjDcSeXmEifmr0lFCcO1pI+OcKo5LR8wDS1/7QEx6gkpKZRpFrif24cJ9N
 gf5Ws8CYvsJhmzaHPtNMIgS2MXvyLLAzprBTVvXQ8Lr3TPOE1hdPWUt2+LqFRKtHSCrEfoT6TPz
 PL22iks4mCN3f3qImKzsiK9WImzOQWOntD3Ds/Xstj+hKIOJZlfVYqaXsPV1NLmgtDQ3tMl+GJX
 q3kOFmdgsB1wuuuQkLLducTt9RGaNvsEqHyXw96qoNIY8+IuSsjhncizXoKQwxXZu9gGqt6mgr4
 9gimIK/bBCITEe9TccwbCMxuR9GXrzIew20kVzKC4KzWAzj+IHcpQbX7EwtkmCqLFhLkuDknI/+
 JVPA8kTL4mXj7g2XGJnliHUOUlE4TDQCqSyuNxsIPoUCa+n9Q6nWRSsRL/kiniQsfXdktUWEZp
X-Received: by 2002:a05:6000:2909:b0:43c:fed2:bb78 with SMTP id
 ffacd0b85a97d-43d642bd647mr6562322f8f.44.1775851624352; 
 Fri, 10 Apr 2026 13:07:04 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e468d0sm9742801f8f.18.2026.04.10.13.07.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Apr 2026 13:07:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 5/9] target/arm: Introduce mo_endian() helper
Date: Fri, 10 Apr 2026 22:06:24 +0200
Message-ID: <20260410200628.19378-6-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410200628.19378-1-philmd@linaro.org>
References: <20260410200628.19378-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h      | 3 +++
 target/arm/helper.c         | 8 ++++++++
 target/arm/tcg/mve_helper.c | 3 ++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e92a967f575..f21555a69fd 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -28,6 +28,7 @@
 #include "exec/hwaddr.h"
 #include "exec/vaddr.h"
 #include "exec/breakpoint.h"
+#include "exec/memop.h"
 #include "accel/tcg/tb-cpu-state.h"
 #include "hw/core/registerfields.h"
 #include "tcg/tcg-gvec-desc.h"
@@ -46,6 +47,8 @@
 #define BANK_HYP    6
 #define BANK_MON    7
 
+MemOp mo_endian(CPUARMState *env);
+
 static inline int arm_env_mmu_index(CPUARMState *env)
 {
     return EX_TBFLAG_ANY(env->hflags, MMUIDX);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7389f2988c4..037d2bcf376 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -38,6 +38,14 @@
 
 static void switch_mode(CPUARMState *env, int mode);
 
+MemOp mo_endian(CPUARMState *env)
+{
+    if (!is_a64(env) && arm_cpu_data_is_big_endian_a32(env, arm_sctlr_b(env))) {
+        return MO_BE;
+    }
+    return MO_LE;
+}
+
 int compare_u64(const void *a, const void *b)
 {
     if (*(uint64_t *)a > *(uint64_t *)b) {
diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 4bea0991de9..a5a23c97056 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -299,7 +299,8 @@ DO_VSTR(vstrh_w, MO_UW, 2, stw, 4, int32_t)
         unsigned e;                                                     \
         uint32_t addr;                                                  \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (e = 0; e < 16 / 4; e++, mask >>= 4, eci_mask >>= 4) {      \
             if (!(eci_mask & 1)) {                                      \
                 continue;                                               \
-- 
2.53.0


