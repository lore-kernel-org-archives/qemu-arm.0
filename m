Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1484575ejb;
        Mon, 7 Aug 2023 07:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2ZEX+E74CrCnOzMNKdda1Ui2mn16F/xXc8Tpc6iuWkzq70z/hkGBTF3t3l1qgnGBB8Ck7
X-Received: by 2002:a05:622a:14c8:b0:403:b645:86fa with SMTP id u8-20020a05622a14c800b00403b64586famr13373736qtx.24.1691417820554;
        Mon, 07 Aug 2023 07:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691417820; cv=none;
        d=google.com; s=arc-20160816;
        b=pIJ08ALLWElCGw6foo0bClDEjxnLpE6Cf6Q19HRoqZdccotFXKzefoDM2j+vQGPTQ5
         MEzxYaMqTUgL+Lb45uEGSTsnMUAWyKxS1RrxlsKcn8ZhFGmVTgbgr+fs+AWSCX5EejPz
         nq0wS4qW6+QQ3QwuZjbYD/FTLywhgP/jE8vf6YJechk8EgkAnO4kmCiI+YuwhUvXiTMZ
         kFHbXxhPm6pIBLsEyVzk4erFMGRrYrFxQ9iDxNRWZRwtdHgGoXNE0hgXdmZ5z+zGmSJU
         RvipTS85jdYf/k1KwBPUJ8SY0Pt4RaXFn6Q0vjku73g2RG/l1LRbwy19b2WbbJX8aBA1
         fZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cr23TIsFZ3PjCpnV8UZBDI6iYURVIWjSxhQhgKrusGQ=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=pDXqYhGpauhrEFXFV4yFo/E3+MtB+0xJVOT35/ZZiAJENg5ytme2kti6X+Ui+6a9np
         901hBUqD9gB7l53+AI+MXuGDpgzF99aCwa8GlHQbivtVOXTegE490FzeEKO4stFs4EJO
         ajIc+JxgXRVOVSJGD4iMQQa8vLeJILfLLCFyLfamtX0u/UjoXyg5HGEus7z3kGTUnj8j
         3Muykg/obC4uvrmcRbG31lsiRRm8LHlEKEuZ9PtF+G1yzl7xdfgYMNIgVNN72poxw2Cm
         H9Kbeno1dsySuTiQRGgjT8Y4DBUnTUjhN2BY9BSzcoMiXczCizyh6tPe3m9jdJwjGcVl
         pA4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giZh0fYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a05622a118100b00404b2c39d3fsi4823318qtk.784.2023.08.07.07.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giZh0fYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT12U-00027D-0t; Mon, 07 Aug 2023 10:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT118-0000Az-Uv
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:34 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT114-0005VA-Dp
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:30 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fe167d4a18so44649175e9.0
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417724; x=1692022524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cr23TIsFZ3PjCpnV8UZBDI6iYURVIWjSxhQhgKrusGQ=;
 b=giZh0fYhUvDjCGYQSXSlD0We98uOeWc4tt1dJ0qBDzDSupVTUrhUQL2YfxLJfAfCIM
 R0L4fzFykUtfElyEqEcyy4QDh2Te8HPOCVD5a5L8kiWruqC9eW4chsfcQiJsu4StL+39
 fhX29I1ZfpQrOKDYqjaAclKUhI/gxkzqqf/4T5EceihvZrOGlFeFfbY1ETXfowmuDbcI
 bDL8fXyBWTzeOzTdwMU+K2M4kiejDLkvpf08fimFAHaFgqKf2tfYNpK7Ch14swTKDhx+
 qm4lCpI7e5ouj4m0wedBRCs7qyPefcqCBS4ywIUmV+O11htddSEix4/R4+IlAEH0jn4C
 z0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417724; x=1692022524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cr23TIsFZ3PjCpnV8UZBDI6iYURVIWjSxhQhgKrusGQ=;
 b=H/OuVhaxUQwcO4NaUs4gL/OCeknf4/54RO9ywsVA6S20G4TFzb4DrtuSMd0QKq0oqp
 EzSf5iw2xHKryJsKiKxk6lxK0+J20abu9a2heVA7T9siQJ7lAAXzVgEZfb45YARHNrkv
 1SuNG2eIb6sQVQN41AJrBbqli2/LhaCQOBEEtAJPc7S0QIApc2GmQ5kiZyTRd6DnlbEK
 P6yFtHlIYzN0+Fo/ECbhCNayniVHljzgO6Xs0ykWQF79Hk9odHww2XgiQTOgmWlIWBui
 4U6FwB8hV4Se4EoHDJNeRjGrnFpGnqnvg62/KnWdhQbBYuiWlI0/0FMLTud1lq1v68XA
 5U+w==
X-Gm-Message-State: AOJu0YxX5DCKzLb3IjrQyVjoMr3BO0LufjdoU4LQBoKwplekwrQ1outY
 KtEvp3/48BF5YmQivBPaoaHdBDp/98u5/cmTKUU=
X-Received: by 2002:a7b:cbc7:0:b0:3fb:bc6d:41f1 with SMTP id
 n7-20020a7bcbc7000000b003fbbc6d41f1mr7496434wmi.17.1691417723922; 
 Mon, 07 Aug 2023 07:15:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c261400b003fe2ebf479fsm10835617wma.36.2023.08.07.07.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:15:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] target/arm/ptw: Report stage 2 fault level for stage
 2 faults on stage 1 ptw
Date: Mon,  7 Aug 2023 15:15:13 +0100
Message-Id: <20230807141514.19075-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807141514.19075-1-peter.maydell@linaro.org>
References: <20230807141514.19075-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ctzcqg5cmb2s

When we report faults due to stage 2 faults during a stage 1
page table walk, the 'level' parameter should be the level
of the walk in stage 2 that faulted, not the level of the
walk in stage 1. Correct the reporting of these faults.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index fbb0f8a0bf2..07832eb8f76 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2048,9 +2048,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
  do_translation_fault:
     fi->type = ARMFault_Translation;
  do_fault:
-    fi->level = level;
-    /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
-    fi->stage2 = fi->s1ptw || regime_is_stage2(mmu_idx);
+    if (fi->s1ptw) {
+        /* Retain the existing stage 2 fi->level */
+        assert(fi->stage2);
+    } else {
+        fi->level = level;
+        fi->stage2 = regime_is_stage2(mmu_idx);
+    }
     fi->s1ns = fault_s1ns(ptw->in_space, mmu_idx);
     return true;
 }
-- 
2.34.1

