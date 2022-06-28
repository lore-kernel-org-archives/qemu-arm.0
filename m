Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2893341lft;
        Mon, 27 Jun 2022 21:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uaG1QV73ejtNESg8ljd4NAO1lLfqotyVFDdgUcDgByODUlXHXbd6f9A6zuvPPx4U/3P6C8
X-Received: by 2002:a05:620a:4050:b0:6a7:8524:c555 with SMTP id i16-20020a05620a405000b006a78524c555mr10057523qko.365.1656391639898;
        Mon, 27 Jun 2022 21:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656391639; cv=none;
        d=google.com; s=arc-20160816;
        b=MHLWgRVHcRU1cN9fR6vGKA9y9cCOFKAeeOGA/Zu0tHMCvZummLhNOHTawpHEMf6eDg
         JHFe5XbG/bm5Ahsq4/46qS9+hlEhjbDF9SJTT4k68cBPw3Gd5+7xJ6CMyu6IQEheSjc5
         rSXYTi6S13vNdkfLXSPiTn6pHdVjqCuoaftMgFfnFfCemL1ABC1PZfUnucu9k8GMfAXa
         gmUqcJ4zZqAWswtnb7SQ7Zf47h4spVfOspxLzE7GiIwjcIurSzyO0ACZbQnsgD2N7RQK
         tS8wd3gDLhJDYpqRnLUApRDfy/5ncbWqZOH/zG/0q0NQCA6DaNMDXUMGeMWnEJNAVDYW
         waaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VPMml4Tfq67+y3oqJMSmdBs/iUTANF8r3DziFKMfYRY=;
        b=07kir98UXt1ISHxq/Xju6W9lOhDKcQm89kp8ZTOiABOFtCVsD+uvyECWqZlEYGBsID
         iEZICaJQm/wl/Ojr5jm82HBgjadNEgRwzhop9FfPvRYoJiTSFropSp7kXh1VVqZEJEiT
         kxGLN3XuyL9vGTCf1iWEiziHHjIaCgsXGB2GlHg3OEQRtd4oaflRMWPhkSyF3UPV5m4Z
         6IcTxNlnrRsEZarg2/NgUh+JbAcQ8mxQtp1gwyxUvp5XA8z/dI6jSWdPh5dB6/8hQECD
         cGxr8WBnORa1a2d46BsKEutnIHj6ix7JLgXP9C+6RcgGjyzwewCmsUJh8leLrMmObG5+
         AHFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNMv5KJ4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05620a290a00b006af164ad906si4665807qkp.628.2022.06.27.21.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:47:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNMv5KJ4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o638B-0003IQ-Bd
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kX-0002sA-Rx
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kW-0003mt-5h
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:53 -0400
Received: by mail-pl1-x634.google.com with SMTP id m14so9985013plg.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VPMml4Tfq67+y3oqJMSmdBs/iUTANF8r3DziFKMfYRY=;
 b=qNMv5KJ4/nrWDTYoTfCVBMX18+24NTGEJBQX0ZTv0L+ahPfTg5P6WxN8SLRKd7VnQ1
 gGHWIaNAZFu+3X+qTv9QqTIRRq9Swtlh+BlIfurGpJmUS0uFm2s9/o3Y1lRAxTtl4gZi
 xwphL7fgW42NeUufUras1zZDD/MpKBobJBOXzVQ91B/TuRH5uleufFlb4FqaYGFoSZvS
 x0uYL6S180ghHP0Zsy8JwUVj33M7R2bLoVlACt2dmS0G2EfYgquclUPb7iP1k8Jc410m
 yJ0Zd1vR1gTUVm8iLEMbGBgrlDYNuAeUjNC/ZSA5nqWBRmFabEEw9DrDCrhKdKqD64sZ
 vD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VPMml4Tfq67+y3oqJMSmdBs/iUTANF8r3DziFKMfYRY=;
 b=2JvaHgil/VMlYYyNbFdEO11z/mcp37Mxr6Kv0sZNYjKAWtc7V7r8fvPWL6EY6BtehY
 I0uTjJv5LVX/JPPoJ76Skhu1U632WQSPdD8Jkrw0ABnpaM3m6egAu3o0X7iOCVwF3f5H
 lXwtmemPDJEoIXQKlFesjIZEp597HNuWB2OUCtOK9XlotaUKtMCx/1GsAGyxNLIgS+BU
 lptvhycjNjn6GjlovLeDk7jskCATPxtMQ66MvgYScvlOspuNlZKdOANvc64eNa9yzHDP
 6eExP2PLhttz9N6aH/dGGGqdkzEMCIMRThHnznaiUCgJ7Bqddwci/D1lrOh+zxl2gw90
 9EQA==
X-Gm-Message-State: AJIora8LcTlSuRknNuxpR4Pw5VAd6DGFvRtEWE4Z1CyQzBCfw1Z20jEk
 ZHfBEb4MmvsT3zeEMgqPeV3+jEDKPqulfw==
X-Received: by 2002:a17:90b:1b4d:b0:1ec:c42a:7eb5 with SMTP id
 nv13-20020a17090b1b4d00b001ecc42a7eb5mr19503118pjb.122.1656390168179; 
 Mon, 27 Jun 2022 21:22:48 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 36/45] linux-user/aarch64: Tidy target_restore_sigframe
 error return
Date: Tue, 28 Jun 2022 09:51:08 +0530
Message-Id: <20220628042117.368549-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ob9OQ0ho+z4f

Fold the return value setting into the goto, so each
point of failure need not do both.

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

