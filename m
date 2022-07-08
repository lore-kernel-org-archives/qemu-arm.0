Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp340067lft;
        Fri, 8 Jul 2022 08:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u3ZzV9EgRoN5TLBk7EfXNOpK/H5CQdCAM23bCVP4JOFlV040YbjTAhusUxRjG4ajMi8Q5R
X-Received: by 2002:ac8:4e56:0:b0:31d:38c0:b749 with SMTP id e22-20020ac84e56000000b0031d38c0b749mr3431230qtw.682.1657294283020;
        Fri, 08 Jul 2022 08:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657294283; cv=none;
        d=google.com; s=arc-20160816;
        b=dX0j9Mi1mjQuGiX/hP0l20MH5Ajxn0AAoED1Ry4o9CmM7FfaTuBnsLqMWeR1PRRpzQ
         LiEivt953QjW4Ge+p6Ui7fi5hvS4hLglsrFtyvexX4VDrIJpUBhvkmbDTbDgsZ10y9ed
         H2iuvtFnA92DVcoRVBfQ38Jwg8WHHHHEz8cbHaN1Cwxbg1IfpRUtee9xq8X1Vxfw5y6C
         CPeVzdKEHIjYn2XO/nq/UNbNsxF7EqQGWn6+iH+9O/XK2t8W/bhhD/Iy4oVkGdMnTCw9
         ++nAWaUdWfdfSQjrBqb4DdhF/v1StzJa7T/qrxqQVrK6/s1lcM7CBlliWLO0qMgky4hH
         LVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u6i1Exm7OWbV1UGGZQ+hkV1UWXfqGJYzldSUkhdBqXw=;
        b=dKVvfa6dZv9MPNk0f47gFY5jCMBGuBD/bLETOHVMElYIubDIGwLKv1RdKdek+0HP8k
         Chcv+DpHkzDhQYlAp7QLxr/E8/wkr4Oh9UmmTEKcqvpvbdwZ29iyqy9mpZ3joM6ghjit
         RzC/nMsJrJbBU62yOHBrFzWybCtD32U75l3ZrRnpoo/coTDRUuQXHsKKCQdpmzpN0iSe
         OFNX+qt92vWNZNkPx7He6Kw/XXP28dzaf8dEg1hxSasUU/pfDp6wnSjG7R+nlZze3Db0
         HUaFpO+Upd9bcvhgwDKOBc3tunQ0GjXwR5tRLH0xfUx6gWFbCv9Bl6k7CC/dbVMkd18X
         /qHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rt0nNnyN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020ac84e94000000b00304e3b84349si23790169qtp.618.2022.07.08.08.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rt0nNnyN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9pww-0007yZ-GB
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjd-0004Q8-0k
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:40 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjb-0002ZA-Bb
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:36 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e132so22609902pgc.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u6i1Exm7OWbV1UGGZQ+hkV1UWXfqGJYzldSUkhdBqXw=;
 b=rt0nNnyNQ1uHsjGVm3/byx2d9Hw3ePkexkIcAo3cBtU6byzZF2DOOtydSjwAB2W+jo
 l5BsfDYtCUu9RDBvKYIAonxnwma7OdDnGYbquOCpRCjINpc1qxOGqXT4tWIG5FE+FdTY
 tH/fPcPisz+BemVMeSpB/DzM1Qec8IsoR+k1b8OHeUiCN6z3BOuAkFwyBei0N4Ul+rHU
 xG8PzPKfrtK/Bx/17F+kvbZ90YF83DRvPMB6SrNmphuo0R9vCMSeDVw2nbMOqrodPkc/
 q9+31FQh7ZGrvCb+/QnqTpH5EpwAWtBvVWfN1j9WGDNZnZoieXzxGDHlrHL6RNT4VWE6
 R2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6i1Exm7OWbV1UGGZQ+hkV1UWXfqGJYzldSUkhdBqXw=;
 b=tV9AT4u9QEXJPmhyTP3kKpTmUg1vOJbE4nhFI2dErMPbvhmisTByDdBqZ3W1GGmE/D
 y/3COrWgamxRlvc3tVpHUIhNK7sfyVJtkY6QT087PNA8PFy53FYqQ+d6/desqbyYOEHL
 QDDTyeT4ZGOGUe+y5FYzWR7k12C4vXQQ1G6UgAZ7uiJmu6rLUxPsJFOTM06h5t2xo6iU
 fz7xOfjo3cFANl+7lwLdaFJ/P0N6ulY84n0uqmbUR4XD+3EjHfhAKY8ER18g9VJUrlPt
 cpt3cvFhup1a+nIuWrXvCpeO6276d1DJH/DVvwRfiQGtHgD+qjuyzZDL9L0X5hPh8p+I
 nMdQ==
X-Gm-Message-State: AJIora8iSh9nKik2TIsDv0SgJlmPMv3XKPjj3WKSrJdxDMESorKGAnGe
 LfMY1qBkrLUPaVcD3YqX5aNE3qRFD3QZhvni
X-Received: by 2002:a05:6a00:9a9:b0:505:974f:9fd6 with SMTP id
 u41-20020a056a0009a900b00505974f9fd6mr4587839pfg.12.1657293454069; 
 Fri, 08 Jul 2022 08:17:34 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 36/45] linux-user/aarch64: Tidy target_restore_sigframe
 error return
Date: Fri,  8 Jul 2022 20:45:31 +0530
Message-Id: <20220708151540.18136-37-richard.henderson@linaro.org>
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
X-TUID: gjXLtmsF02YU

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

