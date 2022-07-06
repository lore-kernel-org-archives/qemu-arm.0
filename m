Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4573901lft;
        Wed, 6 Jul 2022 02:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vTd+VRcDe04unBnce3uAAJJmU4LacbW5vbyGYdc0WBgnHCFtrPjt0EbsXgs0yphn4ObUSE
X-Received: by 2002:a25:b74a:0:b0:66a:775d:a257 with SMTP id e10-20020a25b74a000000b0066a775da257mr42136681ybm.381.1657100303450;
        Wed, 06 Jul 2022 02:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657100303; cv=none;
        d=google.com; s=arc-20160816;
        b=yQ8QTTsZzPwVoEYLlrmqwTdfGwcn5bkUt7JPv9yP3qrceuAF9TLamVwa28FLCkimr0
         XoNF3TqXPwyQEpMWddvQn97uQ9FEtfN7gj6lqZToq/W5KYODWc+Fffd/PmOAU2vMnofO
         A2FUriRM/KUGp98Wmayih/J3QuoU+QffyzdxpU7PAKOZC7t5fMlHfHUrdeCPce/Lew2Y
         DDPr7KDD3Hd3M1a/gCb4RIYqDIM/oI+S3IqmgdbHmiJexfgOcyVW7OhAiTPPFdi8KVxX
         8B48zbWV01qOQFWOHtm5EZiSJb7mXC7MFWgL4u25kCzo9NTckrL8cp8lORlJUik73ffK
         xE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=suiCkAICShG42hE+LmFGlXABJkWbjcp+Qv1m7n85pMU=;
        b=IoxrQlmbCD8Gcx7S/FDzY2st6ek7sdMW16tx33hmag1cvOSjuZZFw8kFnk1QSEvP/w
         FmwT8+dZjGB38Bo3ivN2rDqQgGlS/DmGKU1MpUb3UR5BxJKTKNXsTqBo2AyjPhkbtid6
         EzaWCcn4DeyG36zRGDFNsm1MJk97IoDsN2oJuMyBx/L89jYdWzYAUe3EymbB0KuXjPTc
         u2hsfA2+Z/N2B7JpDiG0WOu1MvqmcVmHn+TFCyWuoOokJLR5kWjexHjDkOPTYnp0Kioh
         172sWwSJI8hmcn05NYE88n+dlKAGSQQ8RVKr8sP/tD2tyd68cB8EZefLfSkTVMOdnDJL
         pqZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fS6aY3aR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d186-20020a25cdc3000000b0066dc0a82758si20445861ybf.36.2022.07.06.02.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:38:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fS6aY3aR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91UE-0004mY-CE
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90MF-00071p-T4
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:26:05 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90ME-0000gp-5z
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:26:03 -0400
Received: by mail-pg1-x533.google.com with SMTP id s206so13469034pgs.3
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=suiCkAICShG42hE+LmFGlXABJkWbjcp+Qv1m7n85pMU=;
 b=fS6aY3aRde/oNzQqsP1SjVfUfZNJdYvMtfnR8i4iVRBNLOPd3nE9FB/CSLXPxcYUIw
 DkXUXHQEoCGYzuvyEJ9CNwIJMzIrvI02CTh9MkXPjMDaqBPWODm+aWbhILfJdDdjOWti
 /uCJSRER+e76YQPLR4UvbRBvff/oEwfhlqkWXZwdG8yX+XkSciOwvSm/Ovg3NUJTFmR3
 9c0Dc4s23a49GsJECbAwEbFIXO7+IPMXNBQ8N3MwN5ezohB9pggarRWyXK8RNizdaKcL
 z4lVlP+FDjD48BQsDCX76nmN4QyMs56Gm7JdurzWzXwSvvnKXDtK9ZWpNqfBQZ9HXO93
 5zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=suiCkAICShG42hE+LmFGlXABJkWbjcp+Qv1m7n85pMU=;
 b=I+ET7bgQRZvuZjO6Ej8C3Ws7ulBn8KqlQafzkuVIXaBVroJLPwZcFlzWHC+2FalDqh
 i0n4U5lEnuC+BO3gIQGtTN0/CFQDKt2o/vRnmSJYmErOkphHAMEzDyRlcJRlRv1XbsSc
 CThPPkIzvV3rtK6SQr43Dp30rHjqs9inHW6vAWKGhhkj8Qe+fF8ibiFpb7Hv98R0gvYC
 5v9TQ2+M5oJLVa6vE9ZRnm/zPy6RUIXY4Zw4XojNfnN/xYBmQ7j2+ebmT5RI5y4V+dEH
 ESl2W4kULxzKid8JQeObEVHw4/KAq+WD179HIbtrS+f7nLxRHsEV+TG7QpLgQ2eTrW1F
 VNsw==
X-Gm-Message-State: AJIora/YpnNZFOuFSsap8OsKx6fFaaGJfIQI3aORtAFZZmS8FN7CTa+g
 plDhXEb/rtGsMnf4+buYChIDZw==
X-Received: by 2002:a05:6a00:2395:b0:525:8980:5dc7 with SMTP id
 f21-20020a056a00239500b0052589805dc7mr46939596pfc.8.1657095961422; 
 Wed, 06 Jul 2022 01:26:01 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:26:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 39/45] linux-user/aarch64: Move sve record checks into
 restore
Date: Wed,  6 Jul 2022 13:54:05 +0530
Message-Id: <20220706082411.1664825-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
X-TUID: vn60ix3v+Ait

Move the checks out of the parsing loop and into the
restore function.  This more closely mirrors the code
structure in the kernel, and is slightly clearer.

Reject rather than silently skip incorrect VL and SVE record sizes,
bringing our checks in to line with those the kernel does.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 51 +++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 9ff79da4be..22d0b8b4ec 100644
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
+    vq = sve_vq(env);
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
-                vq = sve_vq(env);
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

