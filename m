Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5222240lfh;
        Thu, 2 Jun 2022 15:46:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHyO5VwEcqpz4acrZozYpZc8e6vobwJIAmEmVPPj6JhQpnQr7AMV86/p0PxrsdSu40adRI
X-Received: by 2002:a37:305:0:b0:6a3:48bd:2ce1 with SMTP id 5-20020a370305000000b006a348bd2ce1mr4684575qkd.697.1654209960551;
        Thu, 02 Jun 2022 15:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654209960; cv=none;
        d=google.com; s=arc-20160816;
        b=J8R2t1p6RzklWjvnwbIJZdfmwaDSQ841kJHLjPEwHbSGd8iqA9AbV17VL5Ihn15nWO
         +Mxvej4Y06Q+WboNaKKifSg6dVdQn0GBHaeGWSJpvv9QyoNAkn5Iz97KsnOa6Vl+Nzie
         JJSsB/f8cV9vrV2n6w5A0e9XmWjUqsPFkiaovxWeMZBQ2HQDU7zUnKCLWnkP7/hH5Kuv
         mnkNH1G3meI0bsv19VgXNGFOUFI3+vvrgSRL9rhlvN3hgS3++Pqze05wl9Q474HSsJlj
         R5vmtECRKHUVI3zWnaY4fFjuDN9zI+n0CFPoZ3oSuLs21Bomiwz7cCpndL2OlRvgdKmi
         uz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xfbnb7TdCVSBLKBo6fQd3FAajC5xAFCP1x/5wXNW3q0=;
        b=Wj1DqGv2pSZ+jYqCaxYQl1lGTklt5F8g6AkMXzo+9rYG//zs1SACUmySQ8MbnAaWm3
         2rp18FX422KoCT/m74ifefU/jNQ9snmn0P33iBKooFbXDLyxqWM+F8LbdMKub38RPiC7
         TrcPDcw0OJUvkczNJTN91z59tkqw6llshCYAba1NsDbFuBVo1K3FdLx4kwUMYS/SDZsl
         hp0cYsroQuFny91N4IjxyRUDmdepVAGNyJZ64SOyVrjuC8h7ur6cdN6/783U0VkxhtCp
         TVy7dHFmQeYIpaGDWBqfgdhP2nvedZ6Tpc7SJT5WUnqZLcjVdGCwbZxV+Z8PJxoFLpeQ
         J1+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v8k2SBmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a370b0c000000b006a5f76b3c0csi2476236qkl.654.2022.06.02.15.46.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:46:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v8k2SBmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtZo-00068V-2A
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0001ig-2x
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskL-0000sf-Kw
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:53 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so5873444pjt.4
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xfbnb7TdCVSBLKBo6fQd3FAajC5xAFCP1x/5wXNW3q0=;
 b=v8k2SBmgfeWDCm5dCMsYKFNEoxiA8XNxvV+gwWW325JQljR9R6pjS6PsSQnD1KKJLa
 9p0oGJ1/8mSLt51aeL52tzYhqO85WNSV/9hMgXmx0BevqYd8jsB7spjV55ohf9XSp4vH
 /doTqwaGp2OssIaF4Xd6CG4TAjCNSftLmcAOZO/iK/mCh3yuafKt+CFZNH9Tx+zxY5t5
 driUzbqVaP+cyP0PU9L2sWNYcS/Ii6ErKa7Rf1uCB0Tj5qjaJy45FTU3GCvaJzmAoaqC
 RzomYQ4lc+BzPqXM9ClWnB1apbhcpJqpwTTqH8dLusQ09x5ZFDmdfn1VYUMUf0WmzvzC
 vX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xfbnb7TdCVSBLKBo6fQd3FAajC5xAFCP1x/5wXNW3q0=;
 b=U8cGgKc+p3iZdflS3Ag/0xredjcQYhch4YiVX6SZkkID16VSMKXyP76uUOQ5iogZv+
 HK1P+DUIzELEfYVNklddulJ4sB1pXfra6qzCxcbF+jz7LR97Y7KJvFJGMS1pUQoRIpiH
 70UEhXfeZW2ygjxSoyIcGieIWaumsbj42q9GaEwoKZTWYZuo8wmwNgkXM+RM+F4Lkwb1
 +l/cv/V67XgzigsJROQe4AjIqaxy1m5X9tlaeLrmWzp40zyaQouaeEjoHwjR7i0Pdzpq
 DCMqwVCmQZ62oG1tlaDo0DGZtYJcTqNAtEL8/EYBuwjf3wIul8awJ2UkR3BXfAKTMGHz
 wK3g==
X-Gm-Message-State: AOAM5301gajjZj+cr7RTMHXtPEgT1duXWlsS6xZ2lOiQyRxrd30kT9Zj
 UBSrSHCTOoo5AGr1qBTfFHWWYp/ATDRAVw==
X-Received: by 2002:a17:903:11d0:b0:155:c240:a2c0 with SMTP id
 q16-20020a17090311d000b00155c240a2c0mr6866622plh.143.1654206768753; 
 Thu, 02 Jun 2022 14:52:48 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 62/71] linux-user/aarch64: Tidy target_restore_sigframe error
 return
Date: Thu,  2 Jun 2022 14:48:44 -0700
Message-Id: <20220602214853.496211-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: 3wwyS9Ej1Bta

Fold the return value setting into the goto, so each
point of failure need not do both.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 08a9746ace..e9ff280d2a 100644
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

