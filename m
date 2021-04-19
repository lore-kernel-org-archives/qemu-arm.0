Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1505739lfb;
        Mon, 19 Apr 2021 13:59:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTLn1cqbdhoA6fEOfgO6Jk5Jtpm5cOiXK5B5hU+3C/TMDSOh1ucHgeFeIhWI49SMv052p1
X-Received: by 2002:a02:6c0e:: with SMTP id w14mr8772966jab.4.1618865956823;
        Mon, 19 Apr 2021 13:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618865956; cv=none;
        d=google.com; s=arc-20160816;
        b=qjtH6fiWnagVZSXi54pW0Vlq/5/bD5ogbXYJxDYmofTg2KFUB6hNxRSvAeovzZgWEE
         ntreWnfAqCrjcSWg9btzUnjq4wyOnNbl2vW8fkk3uRcKjoZqt3ypQoFTlKvFGSuB6PaZ
         J8YaSGdssNQrPYTIHAJYMz4/2T35XFCL2Ek7LZE5iEASjKs+aQ8ZtMeGqAFlmX/TACfZ
         WHn4u7bfIfgp7cI8JtwPCsj9XNUqvqJO3Rfv6AICaCBb2DX5stnm9JtNFdBBITCV/2W7
         WsMvC3GKtDD46APUlQ6Od82L7dORAgU+fFgaZxwYoti9dDGoyvjDOZVq5bb37aWAZldW
         949g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
        b=DXFMgPImvQ3Xb8pYz83tGyofThNU6ZAGr4cmsy8P1O8um7++e3moef56KH8wbDr4B0
         p7qfIq5t1BRYzlxgUEFa7melckINc9ecx9OcU65vdgcy6t+3zNmhh4b8oxLMGe8EIOkA
         bjdWuRUw0esyostwYRG2fgIylXp5UTNDqrFSi8ixBhwSAW/Jv4dEE2IMHxrcv8Tm09cF
         ifrY2Gy5XR9AOh/sO5KIxxsnrdkp+v8PDq5FyVWc0Xk3ueamxLJY3FJpy7beub9YTzK9
         nDPQzXBdBfIwycPd+nqYnp+59KBNAE0ubzf3VHObQ6aTvPXQ4C3+hV1ZQcT8f085juHx
         fClA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TtYpPdbg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si854541jak.104.2021.04.19.13.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:59:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TtYpPdbg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYazE-0004UV-5U
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQt-0007uB-TJ
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:48 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:36703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQp-0002kZ-LU
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:47 -0400
Received: by mail-qv1-xf34.google.com with SMTP id i9so17368469qvo.3
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 13:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
 b=TtYpPdbgWfreAnJpgwHYNOa14LJ6lt0tSsbAv4dPkG2NVEVIwlC+KPOE18I3PaMaUO
 TJVkhclL9RuyM6YkGOMfV2O9oAYhZ8gtJR4OR9Ruk7l67Ht7T4oQuvpTPOlVEbIHAaZA
 MNoIRnrHgK7JM9xLCHleQi52DAhJEZqAk+/NHtOHe6G+aAULjD25WupoPWqNlYFj2lqG
 aQzXV7PW9aSCmZFfOAc5zkAzTNdHENgKXjiwyKbHnn/wAkIEL63MW+nYDGY7a9pOB0OC
 VVW/hRn9RDhMqM0/xHOtDSbghXJePLUFsomU1VRHW4U5hYN8K14nY6BZlZNHSqIRfOrA
 TsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
 b=a57ihINo5Hez+o9N4kPUg3RDf5KgkY05FTI7R82ZJ3Kidm8oXd7HYg5zzssnc4AnUu
 x/bvdwQN/ELIwZAYsg9toH7guogryudBXad+cculw8FPImWZZdGi6ZJAx7hFfRjcuIUl
 Yp1YCfvosE/z2ZLvM8/McuSnLPbZlTDLzxvEkwkGrRkD6SOxz47wsTsY7bsHmX1RfUIi
 gcwV+DMbzgkI3bNW466HXPdL05XFQCqOVu5p8QRbS0GDARaHdBwVh/KM96V3gobxxIxz
 P+0+aMygzmWCHD8WjuopRqntqLFdJbBLYlSWVlLU46/kRx2cnWvbqrgAOA1CHCuM/Udg
 /K0Q==
X-Gm-Message-State: AOAM532VmFrCN9/8/TYxhFNnnL6zTC7NUqYOOB+keVZ7GbkYrYPDUckV
 FbgjhOXGDQuYq8XLsWtS9zPDPnG451xQAVWt
X-Received: by 2002:a05:6214:176a:: with SMTP id
 et10mr23354359qvb.23.1618863822653; 
 Mon, 19 Apr 2021 13:23:42 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 24/31] target/arm: Enforce alignment for VLDn/VSTn (single)
Date: Mon, 19 Apr 2021 13:22:50 -0700
Message-Id: <20210419202257.161730-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: on5s6vtouXkL

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 48 ++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index e706c37c80..a02b8369a1 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -629,6 +629,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     int nregs = a->n + 1;
     int vd = a->vd;
     TCGv_i32 addr, tmp;
+    MemOp mop;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -678,23 +679,58 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         return true;
     }
 
+    /* Pick up SCTLR settings */
+    mop = finalize_memop(s, a->size);
+
+    if (a->align) {
+        MemOp align_op;
+
+        switch (nregs) {
+        case 1:
+            /* For VLD1, use natural alignment. */
+            align_op = MO_ALIGN;
+            break;
+        case 2:
+            /* For VLD2, use double alignment. */
+            align_op = pow2_align(a->size + 1);
+            break;
+        case 4:
+            if (a->size == MO_32) {
+                /*
+                 * For VLD4.32, align = 1 is double alignment, align = 2 is
+                 * quad alignment; align = 3 is rejected above.
+                 */
+                align_op = pow2_align(a->size + a->align);
+            } else {
+                /* For VLD4.8 and VLD.16, we want quad alignment. */
+                align_op = pow2_align(a->size + 2);
+            }
+            break;
+        default:
+            /* For VLD3, the alignment field is zero and rejected above. */
+            g_assert_not_reached();
+        }
+
+        mop = (mop & ~MO_AMASK) | align_op;
+    }
+
     tmp = tcg_temp_new_i32();
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
-    /*
-     * TODO: if we implemented alignment exceptions, we should check
-     * addr against the alignment encoded in a->align here.
-     */
+
     for (reg = 0; reg < nregs; reg++) {
         if (a->l) {
-            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), a->size);
+            gen_aa32_ld_internal_i32(s, tmp, addr, get_mem_index(s), mop);
             neon_store_element(vd, a->reg_idx, a->size, tmp);
         } else { /* Store */
             neon_load_element(tmp, vd, a->reg_idx, a->size);
-            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), a->size);
+            gen_aa32_st_internal_i32(s, tmp, addr, get_mem_index(s), mop);
         }
         vd += a->stride;
         tcg_gen_addi_i32(addr, addr, 1 << a->size);
+
+        /* Subsequent memory operations inherit alignment */
+        mop &= ~MO_AMASK;
     }
     tcg_temp_free_i32(addr);
     tcg_temp_free_i32(tmp);
-- 
2.25.1

