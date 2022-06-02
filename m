Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5223678lfh;
        Thu, 2 Jun 2022 15:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynUzMfu/o9LD8gln+8Z2DZn4goksnH6KOhCFveej1jewl5NClgTbLNtZvvIGg5HJSTlV+D
X-Received: by 2002:a05:620a:c4c:b0:6a6:6c46:a153 with SMTP id u12-20020a05620a0c4c00b006a66c46a153mr4720652qki.113.1654210189253;
        Thu, 02 Jun 2022 15:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654210189; cv=none;
        d=google.com; s=arc-20160816;
        b=QlwQulAb/izQsPXwb6AefY8Z5hKK4AV1sS4mWwrjoo8Q7ZoDq+/3JOeWhHu1F5GPgp
         pE6EKQlYBC/LEVz3r1Bt8wAvDaRGStT0y1HiY0pvJD7hFscs/fKog0ghi8xEwhq+2APS
         8kpXxDo3L+Jc9CSwaQgD3+QHOqTRYsyrVGvWK+PnSPZOhifSDpj+OAASPm+BvOdcOXYq
         JyqOl9gmZ00803nk3WBbKpcDT5/zqSK5j8WVFvFTOaS5Sd+vk70jg36adLbbuari+2Sq
         +c9TTpCH+uTyTXUoP3ijA/vQEhIULKsAww7pwL4/Dkh/+7iXQprin7vXrX0YjAy5Yx1L
         bVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=G9tBDIOox4Y0NhHvT3VV3KFHeeNFnyNER4ZnNO5qAIM=;
        b=EN4Bit8qNedjyhsclSObdZ0mt3UC6q+EYCZW/ilSaAPXz908/EpMPFnnvcVcQ9bLNz
         4P1pjO9c8KbzDYyhnbyqw1jXhHBi8k7ALy2izQ3S6kMT6DsoTU0nm+4BDfWmCW7Tl80g
         pkCymb8U/auyYd6MQ7YqmKEomMaF1BP2ZMn7ptc4KzCYXCYJ+gJY6txJ488ZyFOuuhDy
         xPQFWkeoRSJcnUWyvgSKBTJfOvc8imquhOAL/98PbM8IXQyg5QL0irw7+0Xnm99XaT12
         DxrxE/dMJ0OeN3wY0QinzszOQywkOXPz36NDcYwo8U9xenD5I9YW72/2lU7ofEwOODfh
         FjPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N3/1BKJ1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g75-20020a379d4e000000b006a69c04b0b1si65194qke.121.2022.06.02.15.49.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:49:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N3/1BKJ1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtdU-0006ud-NQ
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskR-0001iq-Al
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskP-0000yx-Iw
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:55 -0400
Received: by mail-pf1-x433.google.com with SMTP id b135so5781581pfb.12
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G9tBDIOox4Y0NhHvT3VV3KFHeeNFnyNER4ZnNO5qAIM=;
 b=N3/1BKJ1Ko8TBV5VQwomspi2MMYZSTWZqHyMBd8DEEgcJHJ1Ir5g3Z7D4pf3VqMD4a
 K9Ijgdq30ZarfSdZyT/d52nxkThBfOaFCGhLcxV6KJsEuVeKiYlT/Dm8m5kOVjJ93+W9
 +TVYltkMfUc7/6uW7TxbrrqQCrbZi893QAynu/fKqpqCJA9R351Wt7uMoL5+IENzkWha
 VVzWqVNJFu6cnnUwq6BLAMvRcjl8sTLe7uFisSwMNtQAyQ+bfw13iATF2RD8f2Rj3pT3
 sARvnKsKcdehbvbrEbTcuzf7JZlOJfXKuR1nYf5AyLQH3qzkscK2eytaBbXsaNfE4bia
 R76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G9tBDIOox4Y0NhHvT3VV3KFHeeNFnyNER4ZnNO5qAIM=;
 b=MF/pAuS55Ma4dhaAHJo1f1bTHCiEKUzVc3oRtAlG8Cwv/cUNxJvFF78yGkSM98dwH1
 8cr6HlEQ2Vf/1PrWkRkzwkMJtQevH/rvNt1EL0ZIZBjywgYQdwLqei5N3h3dYcfcGrbJ
 X6IsEtZfPPsWzWfaCf1rZ4nvzs0sZz4BkttmWW+Beg6OCV97leq+BOySUACfuzZToafA
 E0EVxJ74rT1iXH26QO6ybNycBrwYirHKjtpcoMm8tCJixgDfbsP2KrHW3Mzs27OoWaWZ
 LiOMgmd2giU74IWY6Wgc5pR/XIFo9HrmJKX31yOWZeyrmoXB5PFYX3WEpNSjqTNZIUjm
 PqAA==
X-Gm-Message-State: AOAM5311yP1BeILDTeROC7i3GGwhNx6ND9ry7Q4nqDhW2kOWBxCtEhgH
 +tOyNyh7KC1LVjXODE48sV9gWlVTlEKbtQ==
X-Received: by 2002:a05:6a00:882:b0:510:a043:d4bc with SMTP id
 q2-20020a056a00088200b00510a043d4bcmr7156291pfj.64.1654206771596; 
 Thu, 02 Jun 2022 14:52:51 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 65/71] linux-user/aarch64: Move sve record checks into restore
Date: Thu,  2 Jun 2022 14:48:47 -0700
Message-Id: <20220602214853.496211-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uh5cVPLb8zkx

Move the checks out of the parsing loop and into the
restore function.  This more closely mirrors the code
structure in the kernel, and is slightly clearer.

Reject rather than silently skip incorrect VL and SVE record sizes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 51 +++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 711fd19701..73b15038ad 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -250,12 +250,36 @@ static void target_restore_fpsimd_record(CPUARMState *env,
     }
 }
 
-static void target_restore_sve_record(CPUARMState *env,
-                                      struct target_sve_context *sve, int vq)
+static bool target_restore_sve_record(CPUARMState *env,
+                                      struct target_sve_context *sve,
+                                      int size)
 {
-    int i, j;
+    int i, j, vl, vq;
 
-    /* Note that SVE regs are stored as a byte stream, with each byte element
+    if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+        return false;
+    }
+
+    __get_user(vl, &sve->vl);
+    vq = sve_vq_cached(env);
+
+    /* Reject mismatched VL. */
+    if (vl != vq * TARGET_SVE_VQ_BYTES) {
+        return false;
+    }
+
+    /* Accept empty record -- used to clear PSTATE.SM. */
+    if (size <= sizeof(*sve)) {
+        return true;
+    }
+
+    /* Reject non-empty but incomplete record. */
+    if (size < TARGET_SVE_SIG_CONTEXT_SIZE(vq)) {
+        return false;
+    }
+
+    /*
+     * Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian load
      * of our 64-bit hunks.
      */
@@ -277,6 +301,7 @@ static void target_restore_sve_record(CPUARMState *env,
             }
         }
     }
+    return true;
 }
 
 static int target_restore_sigframe(CPUARMState *env,
@@ -287,7 +312,7 @@ static int target_restore_sigframe(CPUARMState *env,
     struct target_sve_context *sve = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
-    int vq = 0, sve_size = 0;
+    int sve_size = 0;
 
     target_restore_general_frame(env, sf);
 
@@ -321,15 +346,9 @@ static int target_restore_sigframe(CPUARMState *env,
             if (sve || size < sizeof(struct target_sve_context)) {
                 goto err;
             }
-            if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = sve_vq_cached(env);
-                sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (size == sve_size) {
-                    sve = (struct target_sve_context *)ctx;
-                    break;
-                }
-            }
-            goto err;
+            sve = (struct target_sve_context *)ctx;
+            sve_size = size;
+            break;
 
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
@@ -362,8 +381,8 @@ static int target_restore_sigframe(CPUARMState *env,
     }
 
     /* SVE data, if present, overwrites FPSIMD data.  */
-    if (sve) {
-        target_restore_sve_record(env, sve, vq);
+    if (sve && !target_restore_sve_record(env, sve, sve_size)) {
+        goto err;
     }
     unlock_user(extra, extra_datap, 0);
     return 0;
-- 
2.34.1

