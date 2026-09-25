Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA383C98325
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 16:27:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xA8lF-0002Zk-2U; Fri, 25 Sep 2026 12:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xA8kx-0002Ss-GN
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 12:26:39 -0400
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xA8kv-0001DA-KL
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 12:26:39 -0400
Received: by mail-pj2-x0c.google.com with SMTP id
 98e67ed59e1d1-3a0c52f9a45so511168a91.1
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 09:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790353596; x=1790958396; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bGJqGU9a5sJOwWGYZLE1QEWNo6z3xHePlSCDrhFakKw=;
 b=k5WsU44g26gV/NjmLow/UUEzeaU45ge3PC2uQJVGF6HfZYpBl/ARvvwxkeMCFJxf2m
 9zRE6aQ49aOhfGBZ2AXxc0vEXbr1fELfiIMkG6NS2OG6m9MrFk62qCzKZzyysL1Swc1z
 ZzpK0RSVasxc0/jAn9on2kLf4hNaehBl7+o9zbFYOExXdyvRJ9QlSvbdMXrC6tBMtWAB
 UTz+mF7HcVWoC2ia0ESL7+onD+DsBXGl/sv/FA2mLbwWST1N5cfC3a8kMv9eEM7kaj8t
 L6GnQnzBJ82hCenedossfgtI/GUFEAewIIvg+TnmWHo90KyQ2DvRifCuOt747u0SF7NB
 fhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790353596; x=1790958396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bGJqGU9a5sJOwWGYZLE1QEWNo6z3xHePlSCDrhFakKw=;
 b=sUvQ12/b1VMmC1ykFQJ+rB7ioUmIldSyYYmSQ7ZM2s7usfGlgMv8U3Y1h1mw8Vj1nO
 4/eguFHjIWbtRQbEfqI9TAHlm7ks/MvNllgVWb7xbJINlq5op02Y9gU4vnu4g2+TouzW
 ZlPXT80ewCrazTj/zCgLsIZDVwpZA+wmBygnOfWjW36eZFNU79ZA1JSAUqZokNsfzV2b
 HS2ugoR/ZjQqKuw6TRUHdgy3lrkz+SDnUSHv2qtSCp8fIDDCl7SliSgNNAXrjAgSRpiZ
 2Iz7d6/3PLW2t9NYP6RPQPvAu0Y7XXbwWorNVmbFWqwzhw9ctDZq5dAhBkaUCDVjSY3d
 KWEQ==
X-Gm-Message-State: AFuF++ls+J9QazRS70rXB9oWR2sYJsImC63XnLl/Dj5ptGrdot/fg8zN
 /as6+JYH6pxyBpyIDe6AlQPLu3S840jsUYhRE+UWW9FKihLYTCcLWFUMxnZYMDvUXGg=
X-Gm-Gg: AYBFou2EHcEfJVp5mjN08pe5/yHldJN7LW3c7gQrxkyYJ/fLobFN0WcF/yoP4JL9Rx6
 0rbiHKp9DMqQzqL3PukPhPHRxXRSznUqEy2GE0ScxTB3fPPTWr2tRCD5QAdZPEsJ8FnREnkmQ4L
 25VkiQKlllF10M25F3/fx6sfz/fgDUIlbnGuw4+JF/R7CD629spdRS5vf90SNKMVeOZnJofGuGU
 vinQoThFr3CdC5h71eZ9Yg3GwWE0WCdVzZ3LVfIcbUzMQtgOp+Uj/fWlu9NgUUE7HIfTi0t7Cs7
 KippASDkvsRUgPymbK1+JsR8jY7oxMgD0Yx4K7BA4pmu4ZlauwYeMJUMPGmVS+zkVzzArBvdZsy
 dXQCOd+i9JNrA+5v6hO+r0b4z5tBk19iI+nmN4wc6FUdN/cpdd4g5vZ5JCU7qr3xzGu2ZSPGIRg
 NdQSRfN4Pf/oHnY85QFVjo9T3WMEmbKgv1+IsPo1CDxtUbaJW8Y4QrAi0tPjZbvU/36rB5mnOxh
 dxLfAcEkymVddL5vdGPZthiXOd5Rw==
X-Received: by 2002:a17:90b:4403:b0:3a0:cb2a:b501 with SMTP id
 98e67ed59e1d1-3a0cb2ab99cmr939443a91.11.1790353596022; 
 Fri, 25 Sep 2026 09:26:36 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0976cacbesm11464809a91.13.2026.09.25.09.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 09:26:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 3/5] target/arm: Implement SCR_EL3.TID3
Date: Fri, 25 Sep 2026 09:26:30 -0700
Message-ID: <20260925162632.404001-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925162632.404001-1-richard.henderson@linaro.org>
References: <20260925162632.404001-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 26a9fb6c849..6416c402ac0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5957,8 +5957,21 @@ static CPAccessResult access_v7a_tid3(CPUARMState *env, const ARMCPRegInfo *ri,
      * Any other registers in the TID3 trap space should use access_tid3(),
      * so that they trap on v8 and above, but not on v7.
      */
-    if ((arm_current_el(env) < 2) && (arm_hcr_el2_eff(env) & HCR_TID3)) {
-        return CP_ACCESS_TRAP_EL2;
+    switch (arm_current_el(env)) {
+    case 1:
+        if (arm_hcr_el2_eff(env) & HCR_TID3) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+        /* fall through */
+    case 2:
+        if (env->cp15.scr_el3 & SCR_TID3) {
+            return CP_ACCESS_TRAP_EL3;
+        }
+        break;
+    case 3:
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     return CP_ACCESS_OK;
-- 
2.53.0


