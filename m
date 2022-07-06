Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4583110lft;
        Wed, 6 Jul 2022 02:54:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uNGuGB4yq7S51SafuzW4lsD6t/smCE7PNEMU3jVI7SOO5DWl0XknkZ36I0Lh9l6DxMoEqt
X-Received: by 2002:ac8:4e54:0:b0:31d:36a5:70cb with SMTP id e20-20020ac84e54000000b0031d36a570cbmr22543354qtw.18.1657101245365;
        Wed, 06 Jul 2022 02:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657101245; cv=none;
        d=google.com; s=arc-20160816;
        b=cVnXF7suo2/7MutNToGTU9agm1JGsdLeH65SWkfu5ibcvxuNZUCHsMgKQ6EL90cJxK
         7bSKbLtKyLMCDcBHBJJIAE1sVj2r2hVnLE2qVpefFYM8lSEU4XSP7bAekO/fbqoXCXMF
         QnQuCODwmAU0g0+9wtJbPSCmmencoMnERkyCumpqPtWzy8CE/AtJZ2rha8nRDhMSTXCK
         rcAJBxx6CqDotxbC8tAI27XoSopN0qfLxPcsVqZEFWcEnrHPSGqc+97nAWwPipXHOVr1
         Q+8EKlvJAtq7JYk4+l1HEL/FQQa7seT8GdES6DEhdLYg1aXxmAjAF/aONGDcV57KVEzi
         rVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u6i1Exm7OWbV1UGGZQ+hkV1UWXfqGJYzldSUkhdBqXw=;
        b=zazTqj0L8GZw00OtCHWMqLm2G4/JDoVCmLJaVIiboMoP0qG4HFNmH1kjivYshLcd/+
         hufMCzL9ojO4GcGURQ8MXnV6+bCcppEHHTx+ErMzTC/Q+s6IwuSAGMYt+JYkoxlgjX42
         Yk0C+86iJu2PtBSE+pVSmGqnB764ypIClctgpW3WnjPc3tp9CmY5HZrV9K3SIbrU26wg
         fDZAPbDSQxIw1z+dnyXHbzrelAg52oCUj2Er/DAGRSBMYzOsPTgoLdPTWoRZ0/9s/80O
         VYq2+R7Yqu0aaTXnANvLSJR+ZFzRvsAwljEphxPSsUm6SyDVAdtBO3hXytvpRh709dOG
         MG+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rkOEzuCd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3-20020ac85fc3000000b002f347192afesi22656225qta.125.2022.07.06.02.54.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rkOEzuCd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91jQ-0005Ov-Or
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M9-0006xE-IH
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:57 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M7-0000gp-QJ
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:57 -0400
Received: by mail-pg1-x533.google.com with SMTP id s206so13468813pgs.3
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u6i1Exm7OWbV1UGGZQ+hkV1UWXfqGJYzldSUkhdBqXw=;
 b=rkOEzuCdy72QBazxfH4WOLbSjgTeSOVXIAJAtC3bTScY5R+y59a1Z7P9mtNaXxDPIG
 kdjf2kZ1Ik7QeONBTLnHc2PFEKKFGqlT+8KGKViUxYX1yoycv+WKzbZVPDOO/u6swk6y
 4OAXbkI2Pz2YOFHwfg2hYH0CwG4gHTUjxBR9+hvML64zBaFNWl8lzNDjijbhbc1gTd4h
 v7F3kyN7MW5zEG9+2PHtB28q5q6axS3G34U2V+O/C+DH+6AMGiV5/PdTUHHohAoxBtqw
 gUsoeXRMm2vBxtODQ+iFZtDKwET9bPesKdOWvr+cOCboT+wfo8SCCo8fcmb0DrCypv8h
 Do8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6i1Exm7OWbV1UGGZQ+hkV1UWXfqGJYzldSUkhdBqXw=;
 b=Qm2tHdQNANYi8y7Aum5P8tqqEB4isp27BPFh7Hw8YFRJ3GS86L9lMmAZvPhBUOZ+MT
 ag9i1Ryqv1zPqHtPI+3SY0MXygB4mWNGp8KMp56dlmgSY+joB1D9PI7Sw/k6C+meo0k6
 XBN7Jl1vA2vmY729tFBMIDq2rJykqUUXz2deW+1vjZauRszOprjKDG+Ud0KFdSWEYDE+
 zZZHnAPzPzx1hU+5pgWds/CI5O0kGUdCD8KJLqAVlrHZePwzf1MbHgv0rKizODbYvYnv
 0+xrt7JNnKYbQFg+JQjcse0zhS0aZMPSlsSkmjGLt/HCPUuX2w7SRAIx31ct5YoXmnFp
 GFrA==
X-Gm-Message-State: AJIora/RdVFM+CwpgDTejTVreF9BOEEEzfCsgR0r6XLY8AmrnCrMVG+D
 Hk/xdjOR9e1rzCNbDQjC6TLI6kKjT4OVbopf
X-Received: by 2002:a05:6a00:84d:b0:525:3ce6:9c33 with SMTP id
 q13-20020a056a00084d00b005253ce69c33mr45074554pfk.47.1657095954501; 
 Wed, 06 Jul 2022 01:25:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 36/45] linux-user/aarch64: Tidy target_restore_sigframe
 error return
Date: Wed,  6 Jul 2022 13:54:02 +0530
Message-Id: <20220706082411.1664825-37-richard.henderson@linaro.org>
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
X-TUID: zdPwyb4xsZXW

Fold the return value setting into the goto, so each
point of failure need not do both.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 3cef2f44cf..8b352abb97 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -287,7 +287,6 @@ static int target_restore_sigframe(CPUARMState *env,
     struct target_sve_context *sve = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
-    bool err = false;
     int vq = 0, sve_size = 0;
 
     target_restore_general_frame(env, sf);
@@ -301,8 +300,7 @@ static int target_restore_sigframe(CPUARMState *env,
         switch (magic) {
         case 0:
             if (size != 0) {
-                err = true;
-                goto exit;
+                goto err;
             }
             if (used_extra) {
                 ctx = NULL;
@@ -314,8 +312,7 @@ static int target_restore_sigframe(CPUARMState *env,
 
         case TARGET_FPSIMD_MAGIC:
             if (fpsimd || size != sizeof(struct target_fpsimd_context)) {
-                err = true;
-                goto exit;
+                goto err;
             }
             fpsimd = (struct target_fpsimd_context *)ctx;
             break;
@@ -329,13 +326,11 @@ static int target_restore_sigframe(CPUARMState *env,
                     break;
                 }
             }
-            err = true;
-            goto exit;
+            goto err;
 
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
-                err = true;
-                goto exit;
+                goto err;
             }
             __get_user(extra_datap,
                        &((struct target_extra_context *)ctx)->datap);
@@ -348,8 +343,7 @@ static int target_restore_sigframe(CPUARMState *env,
             /* Unknown record -- we certainly didn't generate it.
              * Did we in fact get out of sync?
              */
-            err = true;
-            goto exit;
+            goto err;
         }
         ctx = (void *)ctx + size;
     }
@@ -358,17 +352,19 @@ static int target_restore_sigframe(CPUARMState *env,
     if (fpsimd) {
         target_restore_fpsimd_record(env, fpsimd);
     } else {
-        err = true;
+        goto err;
     }
 
     /* SVE data, if present, overwrites FPSIMD data.  */
     if (sve) {
         target_restore_sve_record(env, sve, vq);
     }
-
- exit:
     unlock_user(extra, extra_datap, 0);
-    return err;
+    return 0;
+
+ err:
+    unlock_user(extra, extra_datap, 0);
+    return 1;
 }
 
 static abi_ulong get_sigframe(struct target_sigaction *ka,
-- 
2.34.1

