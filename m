Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2432699lfb;
        Tue, 7 Jun 2022 14:42:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5muyFlNrX++iK3f2PbzUJty6Xa1WifhbQjxvaPPG+0sGe2HefcWSoPWugiT47LUi6WVde
X-Received: by 2002:a05:620a:4249:b0:6a3:303b:6d26 with SMTP id w9-20020a05620a424900b006a3303b6d26mr21384080qko.0.1654638158750;
        Tue, 07 Jun 2022 14:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654638158; cv=none;
        d=google.com; s=arc-20160816;
        b=QmwlLyISPSWBQECD17Oz79QEc4Au3I0fT0OQNajBrHkw6SZfYqxUE08ffFMyUYSGUV
         o8Y7LLsJl/LMjzDIJwyxHpQj6+bY5PGjK3X7r5iC5LNcEAbtdiZe74bSbfqKDexve7be
         9sBJgZdK+HatmWTcZ6dPPy8/w7+rM0TxfrARA3oEYIIUpTQ1uVcM38hZ+DbQ4JzhPnaw
         YUJ0Pa++8cHS0JD+oM9ws1oHsSBHtsKaGLJS0ya7eq/v+UbHdTne8wQeUuvMFK3wXAaH
         yPHAgi/Dpgm6n9w0ru3iNDI79B4QvTZKaOS7oxnsa2E1nHXS8fnMZc5t10Yxlioq7Ofr
         fVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VPMml4Tfq67+y3oqJMSmdBs/iUTANF8r3DziFKMfYRY=;
        b=prYOvumxG+djoqoxEF224hrXhlUcnwtdVkb6CKPDqdIWdUoIkysa6B04wUp4HQKU+K
         aUvxjsDPdupfXz1f9OvMDuKj+0qsNQXEqVDnbm4s3oYH//ie2joGkbA8YpBbo7WijMHf
         +5eV+J6TSuTgrhcvmKwVmOeAmV/h7h3SB/2fs5sgIqci/CXsVSZE7bqpzzwK6zhr4IS1
         2vpfMHB6wVwrC1urXEpOtp4h8Dtz9OaWrB7MKzaDUw9JeHnoMu3HiBrDZQ20e2Mj657C
         xIdbzFpTCIF3zzHvWy9kIqEIWWojZB8EqkKOzaDffHp6fKht33Q/AvB9RUjQihELjrBC
         kMoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nfz1MpKC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd7-20020a05622a418700b002f7a43bf153si9012600qtb.556.2022.06.07.14.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:42:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nfz1MpKC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygyE-00008L-61
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfww-0007Ij-AY
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:14 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwo-0008LT-LT
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:14 -0400
Received: by mail-pj1-x1034.google.com with SMTP id gd1so16677941pjb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VPMml4Tfq67+y3oqJMSmdBs/iUTANF8r3DziFKMfYRY=;
 b=nfz1MpKCsMT7Ha55I8sMlCCDjs8bWbhEPVNCx5AgdWzPszcMGHln+rAdK7Lzw3/qRQ
 Nnor7vO7dFiwwbly/9IzCuo+jOZkV92gAcq+lIT4oLr0P867whnsS9qHAjVf6hbtap+R
 TVXQO7HqMN5gJdaSUT0oYHqj3GnGOz1FuPKFVsH6k+GxkolqXHjh8ECjj40fAZnXdNLC
 K8QT150+ygfbjw/TkzRGsQ3Nz+tSpWnpiPcWf9NakKVriOkliKfXR7FhYY5welnS6bl2
 rvhtnQKjf9Om+paGqG8hkJb592N2UBNIFi9tM8/S3X+VIT3lKAqYe5mmWozzayVQR5Y5
 2+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VPMml4Tfq67+y3oqJMSmdBs/iUTANF8r3DziFKMfYRY=;
 b=KWVHjCw2/S+9pbWmnE7gIP/DVGZR6T12xECoco9DJm+piIBePiOyZQeloGnCPUQJKI
 SFYIq6rFmLmeH8rPx+m65POc+OcCJh/q6wbLdycnna8Kl+paSMt2Z61qiyxOFvuYBU1J
 m7+5rk8JHALr5Y/0KNFXvAJ3qnhrRWzWO+CsGFMjS+HXVYWK/zbHYFkITGn5dG15b+dm
 Uz7LzymExkwwRxGq2y4SkiuzN85vxgiCO46t7w3j4oz0fXDPa3rKixEhDAmR7ZFzJZDk
 AxS5n8Kq0a8ZqauXwXEvZhH5sXjdqelBYiYcMvtUMqjKx+yrocqijxMCztpahLtsxihR
 F7DQ==
X-Gm-Message-State: AOAM531UMvyfeWnMptDfD+y0nMjZRb3EdKn4fVPJAi9E0Lu0IKj8reAU
 Ji+1Hphq09xf/d/TiV52WRRYvqKHEExMUw==
X-Received: by 2002:a17:902:d0cb:b0:167:8f4d:92e6 with SMTP id
 n11-20020a170902d0cb00b001678f4d92e6mr6489076pln.83.1654634225313; 
 Tue, 07 Jun 2022 13:37:05 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 62/71] linux-user/aarch64: Tidy target_restore_sigframe
 error return
Date: Tue,  7 Jun 2022 13:32:57 -0700
Message-Id: <20220607203306.657998-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: 0nCl3n+IkO1v

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

