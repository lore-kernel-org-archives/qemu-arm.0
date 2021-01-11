Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2936553lfq;
        Mon, 11 Jan 2021 11:28:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2b/IZ1Ik5Ab8dosEWBoG1RIfWbcv2rO5RjZGX6oXwje0GlMVIongWN2YuYgc9BBQsAMPF
X-Received: by 2002:a25:880a:: with SMTP id c10mr1877127ybl.456.1610393337161;
        Mon, 11 Jan 2021 11:28:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610393337; cv=none;
        d=google.com; s=arc-20160816;
        b=ff2p6t94Vehd4GAkKTjZi2JU/anCjfG3f+M8e15yxnKb3JFqobVCuKSslBqkPbzef2
         csZfyB2NirnGFsUXMV5G2yE4mMzcK33LtyXNKbZ/jkKU+fmsjy2DBVbDA8J/ZSi76LIu
         KNi1CaGo/GK5HOxg3GFVHtuu20EQCF0Tmgn/LDoBGkAH6lOkSm61Bf7m7W7fSlzOKjXa
         XqwdJQ88c7LC/CbDBr/bn9HtJ4bopG5bhwMHJGJRRXPTtFoOnudiAPu4YdFo67Vgjk4z
         atfm4zcUh91zezhJ/vSEWUQpUaUeqA/jugRN8GcD9nlnBOWGYDclLA9ZzCiqMKA+gB+k
         1L4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
        b=ZMHPwePmTJ5CnGoE2SDDwCV5uAz2VOSjPftl08m6XilsW/tzIc2RNf7rQqJuuLPJrY
         pKYBsrRE5R+nP/Z7FEzmqka+QHIhs4c2aomzrwnh8JrtyQYUGuyQhHB1kqBxMYw+JJr3
         YmHTeqdYywVEWxhho1prgTgr+DlDd5egoqFnM8S/J/qtlsFW0iquuwvHy3BLdZMNGx3A
         9EHPPmWmdnHNBvHefdf5DUHgadhmYKGe09qMnx/9qlfOoB8NjJ4hB0d/r8DIXsMOZhMj
         AVQWP4oXvTlLcoRGDgUhtsaPMumkUustIqARs6rR2mUNguyFKFOHO0s/fkaBIfPzhAXg
         T81w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aNNkL5kp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d23si568144ybh.453.2021.01.11.11.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:28:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aNNkL5kp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2s4-0005oB-JB
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S3-0006NV-L8
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:02:04 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rx-0006VD-VW
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:02:03 -0500
Received: by mail-pf1-x431.google.com with SMTP id t22so505274pfl.3
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
 b=aNNkL5kpHsitk+eokZ5wfjXV25BmxKQCerYTYVQndR6s82frYIutzN3vtQHwxsoJpI
 t91Hh74HJXBBn8kguYjZ8G78BeFJy9vl0HEXUJ6i61VRwUvhXSm6zlYp13gGkRDMEw0d
 aND7xadZR00v+WNIZRecqTLNOU+yMpLZ3kTrvJHjq4WM07oJ2wtR96rgR03VU85Y5AkS
 HWFVbEVtwdh5S1+1+bL3j7S6tV7mTS5MkISjRSPEpv5Q5S94pehbjFdOZUo8E47+q9fs
 MTAMkGY4U+NvDcEIoQ14LvJ/rHqRpOetS17CnD03IrUAZMi/KUMTvc64DduYIR6kQ6TK
 8/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
 b=LBjzqs4SJ4CrKLhKqVpjCfonf5S7mF2M4D+bZOxSYZMd7GEcJu8wAgtBQi+ug5RSEz
 MW/wUJBz/ZW2o8RVTHJAsACGojjglv1fcjSuQaqmFSSdesNEToaPaDEVALB3HF174P4w
 myDA5Eip568OlokQHoEu4DK3jwwMCD5OLfQFbNqfNt4DBU7FeHJhXhqUdM5Dkw+CScVv
 U2UpW/M7LHEnAO/hBtsSZXf3Z5sOmjb0Ov+gw9/+rNLb6ngAHzyRmDxXrY25IneBuinJ
 SJiTra/Leu64QnnseVgtoHfaFOKjgKZjOkdooAaS0vJD6i9C7hwWtCXJ2XYMwEJFqIII
 X2Jw==
X-Gm-Message-State: AOAM532OXIYeutnhaQ5RYhE5l8ESJ5yWkw/I2/8E32pmZ5vkMgtZZ6l5
 q5XTKIXFO4sd614TlvFtbKbhSQ==
X-Received: by 2002:a62:7857:0:b029:19d:fe6a:3069 with SMTP id
 t84-20020a6278570000b029019dfe6a3069mr805550pfc.3.1610391716595; 
 Mon, 11 Jan 2021 11:01:56 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/30] target/arm: Enforce alignment for VLDn/VSTn (single)
Date: Mon, 11 Jan 2021 09:01:06 -1000
Message-Id: <20210111190113.303726-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rSE/UqkiJfhP

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

