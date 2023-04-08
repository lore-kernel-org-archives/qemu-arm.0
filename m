Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649770ejb;
        Fri, 7 Apr 2023 19:46:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350afGFDwsp6R4RJ/dDfHBuKYcbyNbPX8avIHxUHLeKvzx6sDQD27TYDqqffTeKydnf6bWxKy
X-Received: by 2002:ac8:7d50:0:b0:3e3:92d9:427c with SMTP id h16-20020ac87d50000000b003e392d9427cmr6740083qtb.14.1680921993657;
        Fri, 07 Apr 2023 19:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680921993; cv=none;
        d=google.com; s=arc-20160816;
        b=rXSofSSrcUVwPkKZjA5WRWgzRPExIwPTjxiKhLdNDihHA6upY6aEWRCanvgGjKGB0F
         BBEY/26eTgQkYRmCl6iMice72/W9OqodjhqY1LtBLFzqR4Z5oj7SDXG//eSNe254WNJB
         WQekVWlVCmkh1aD95Bd1Pz2vbFb6p5b4OqgCBGSbbx0nx4CFv3Ny4k3uVHtUdos9DDK8
         bGbYKHNRWm7Q0/PlWhrPKHfhiuU8rgQGO64J9fKR6KoCU8UoiNCCvttpODn9MnabtS7P
         rRqSoVmfKeS8TmTDxMCk9nnbXeGrVK6Ey3cUTApQ4lkohlMCjSx0JwBDoaKJE57qOi9q
         Ch/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FA0INw69Tj2Q65SKKyaFBNoXHTALseJjSoW6NBoZT2Q=;
        b=oR/+1y8sRRLFaE1aahcVvFDjCbvs9qDbyYxT4roCv16KqBH2YAVBzfW4+RHKI/aSGI
         csYvZ2WVcMapk1TDBegjJ6vgSXXz/e60hCloxnAA9/IlWtjicaKF76gA+zKGE5vaM2qU
         zFMFlIQaxtA6QyBAuf9dkT7YIF2UXKEEFNZh9S4sCRpeb2nlRsDVALDxG5lKSLB8lSbO
         lKHilbqQ3POh/VRsbkciRrJP7yUt1yQC8mdSLWXZYinO7jhuankllvN0DjSdaAaqXJ40
         kkNE7OnrtaQlwFL0QvRxH/7R3sgVDR02T0JXDTA31tsDXoiP80bO7wiXxaQFt8ZOuiB9
         lyFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H4Od7XZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22-20020a05622a02d600b003e4dafcc275si3698497qtx.592.2023.04.07.19.46.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H4Od7XZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyY1-00070B-R7; Fri, 07 Apr 2023 22:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXz-0006xK-KV
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:43:23 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXu-0005XA-A5
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:43:23 -0400
Received: by mail-pj1-x102b.google.com with SMTP id w11so235358pjh.5
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FA0INw69Tj2Q65SKKyaFBNoXHTALseJjSoW6NBoZT2Q=;
 b=H4Od7XZt8gHq5kCBnNG9cM4A0TfAe8kIBibt439zggO1qJXNdVNY3Fh5dH3SivF0CJ
 JenqhU6hsbZUbs6Tx8TTRLHhBQMkfim1VVgAWS0Zy6S1BG/BPrp+DJN3UYKTd+/DsiPw
 TqM98AvoKNjYGgjZbCZcUJ7w4plimJMzx9aCq4cdcxwVe6H5lyZKkWvTtbyUlJEyPQpR
 IKEpSosiUU+h1/+p8Z4ea/BXWqg3VP7+zebHtM7I98Zdg5cOMChfKkODgnFahrcGSI2N
 /QAWkwuSFD5yAOT/J7Up8q7wjfxGiCrX7wimyZc1oKBCECPxev0AK0IbOpRC6vSYFKI8
 C14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FA0INw69Tj2Q65SKKyaFBNoXHTALseJjSoW6NBoZT2Q=;
 b=YpdnapwO26g0UZ1FSqzKTIpg3FcpQHf84XDfBnRTnIhAnSVOm9mT+xfATOmt5hvbzx
 kLly2/iXJZ1OfJMhYuOuxy7lPuzxq9i/Owd8K44HrHT694AI6HMZlMxiDBlI/OP346mQ
 mmr0R5ZijjUrbnSsqrfiT5NBms5SGWSnak7X8L9MolUssoDDE0GBaXxQypc+yAcZNxFT
 2SJlC8TvFlLwC4tD5oZpIaKJ8lPF/T40cZzAAc+ahBdJnVVJpdWaJHYJLrW4v+j6JmuV
 tQl2ZLuS6Hf2p6/Z3E+x/KDKobBZxyWBzxIQtDwKQAK/UUjpS/uxn562f8x76zgoGz7d
 PBzg==
X-Gm-Message-State: AAQBX9eBYslqqCLdPEDherdoFGMheQwmCS65XaPQPF7gbR6S98IsV5/F
 Ogo+7/Gb4gUPNmDo/Ym8RubHUpvfvorXyVMUV0M=
X-Received: by 2002:a17:902:f684:b0:1a5:1109:f58e with SMTP id
 l4-20020a170902f68400b001a51109f58emr3569684plg.29.1680921797021; 
 Fri, 07 Apr 2023 19:43:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 01/42] tcg: Replace if + tcg_abort with tcg_debug_assert
Date: Fri,  7 Apr 2023 19:42:33 -0700
Message-Id: <20230408024314.3357414-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: n4lz6rBlnCOt

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                 | 4 +---
 tcg/i386/tcg-target.c.inc | 8 +++-----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bb52bc060b..100f81edb2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1174,9 +1174,7 @@ static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
 {
     TCGTemp *ts;
 
-    if (TCG_TARGET_REG_BITS == 32 && type != TCG_TYPE_I32) {
-        tcg_abort();
-    }
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
 
     ts = tcg_global_alloc(s);
     ts->base_type = type;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4444eb9234..aa7ee16b25 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1369,8 +1369,8 @@ static void tcg_out_addi(TCGContext *s, int reg, tcg_target_long val)
     }
 }
 
-/* Use SMALL != 0 to force a short forward branch.  */
-static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, int small)
+/* Set SMALL to force a short forward branch.  */
+static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
 {
     int32_t val, val1;
 
@@ -1385,9 +1385,7 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, int small)
             }
             tcg_out8(s, val1);
         } else {
-            if (small) {
-                tcg_abort();
-            }
+            tcg_debug_assert(!small);
             if (opc == -1) {
                 tcg_out8(s, OPC_JMP_long);
                 tcg_out32(s, val - 5);
-- 
2.34.1

