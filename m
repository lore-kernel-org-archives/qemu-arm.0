Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp347099lft;
        Fri, 8 Jul 2022 08:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tnGDMGIDcYYXdWdasPPcYP7wwMSHUwbumA+pNkb91MQ2HTB4luYvZBY2sMSUGs4tH0HoYn
X-Received: by 2002:a05:622a:50:b0:31d:29af:8224 with SMTP id y16-20020a05622a005000b0031d29af8224mr3593678qtw.350.1657295014562;
        Fri, 08 Jul 2022 08:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295014; cv=none;
        d=google.com; s=arc-20160816;
        b=xoe3bEH7z6cJ888cLswIoozKjayv0ZHS3VLniqwKJ/liN29M+QkROD9PXi67fdzher
         JpOgmeIkwFVYQ9H3oJgQK1Vy/PFvgxzq0bOIL+M2KFRporHPuty/lLzh+VxOV91uuBwR
         9Cr6GuSK6iWxEMBwa9nnRevWXvQRmd32/GJrEIjAT6kBJmNThN/X/wwysXo0ZCf1SAGP
         873ucy9CwFHVlg0C3Z78bOFgBsgYYjeA1qHKWLzBcjYG7RkZTLMEpH2AjMeetyjzm63/
         MAGIV0JoK77jQm0eUi49Z7Hxhfac1OkhC5Vf6JMci6o5rHpJIQAOeyAQyB/aBbWX6aja
         85Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=suiCkAICShG42hE+LmFGlXABJkWbjcp+Qv1m7n85pMU=;
        b=MRV+GbyHASnEqAPXaiCTDTzLsDl3sID1u1JHhaomudrT/BLxbNWYgF8JmFW8MLu0iX
         T/HjbROx6WY9hBSRhvEm54pR1uAT/YCygIL4EQ7G3Vi3IJ4SrMVNik2ezMHTOXYk/rq3
         xAwh9WxXOMa19lLlyvx7Y0heRo6Z3XgduyIUbQbYkFTPJZeuiE404+kmunLMJDj+UX0R
         GfFHLv0F23+IniyQXLFwy3FNnDIy3S5TeoNcVmKovSI/gI1JT0BquvqHrOhW+5SnF9Gd
         HueDMIeuo9NlCCZchVPyEvCLTeYWOAWSNtByhEIpWCNm0brHbmAsYyfL3zYjykbxOPN1
         x/nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n4Mt5u75;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw4-20020a0562140f0400b004709844831bsi29536951qvb.222.2022.07.08.08.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n4Mt5u75;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9q8k-0005J4-1a
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjl-0004S3-9r
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:46 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjj-0002ZA-LB
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:45 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e132so22610239pgc.5
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=suiCkAICShG42hE+LmFGlXABJkWbjcp+Qv1m7n85pMU=;
 b=n4Mt5u75pC0Eo/kXJNeBm3RulDjKnIAA4EAeCt4a+vPQqhIT5B2PUUIyyJYTIQMDil
 FycSTq79D+fxohvetFvF5CZrheSC2A7sxk7ggWQ2aCe79CbOZjo4u2CvUVnmmXhF+2J1
 v+N2qCFTLKR/uqkJ+85HWxvsCPkWFCl9Hs9frajvG56lEInA8iC+RpNqXhpM/t2R0BIn
 doG9oVCr5QIeR5fdzlUSwsY4sgBv2DuhpZG+MFNkpAA9sXUuYwaLvipC+7qNd/bNMJ7m
 Hbu8RWCmXRqLy0c8BYE1ciLWHymZvnhL2Te1buH/PSjGGdazOPspEDkTmpjYeWs/ykM9
 4Ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=suiCkAICShG42hE+LmFGlXABJkWbjcp+Qv1m7n85pMU=;
 b=AysrNyxhaHWGJzUV1Dv66Gh2iLjmUhO5AEXyJR3O3K/ZpFqufSOTafd1/7wxJYgpCv
 5k1+cmVyFAzoH9UhVCKhLJ/eqBHdUjBQ4mRmNzW8w+zk7LdwfIW37P59EV606wnV/orY
 SvtIEDeXf3uJvSRlLNO0Cwx3Alr/+Fdkv+V4IfqytTkN3aBU10eTHtkHAGAXr1CPkXxQ
 v2f2pIrzEeFI+RveL8Ua7rAXbCmnK7KnVvu1K/wr++x+b9Elcqxlh+iSqJtEjC/gv8hA
 gfKG8iVC6d4IoqFlqX7yDuLuCvz3jiJM5cYqW08JONPGGGyU5BfKoSXLTyPv0VpVzHow
 3Img==
X-Gm-Message-State: AJIora+bHjQeH03HQCmagFz0nT52SnXhgrlGfvQCXeLXCmFm+8/RXd0/
 Em707OcbicgZ/X7xooHh9jJECg==
X-Received: by 2002:aa7:8e45:0:b0:528:9e96:744b with SMTP id
 d5-20020aa78e45000000b005289e96744bmr4296473pfr.19.1657293462788; 
 Fri, 08 Jul 2022 08:17:42 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 39/45] linux-user/aarch64: Move sve record checks into
 restore
Date: Fri,  8 Jul 2022 20:45:34 +0530
Message-Id: <20220708151540.18136-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-TUID: Gyne4iAwsRir

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

