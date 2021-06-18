Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1598663lff;
        Fri, 18 Jun 2021 07:12:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqaUfbPs+aVFQRLyZ1PlASxILt7xwrRAefjBU+2UWf6pIsRGzXojgdlSyU+BjLRJSQVFmN
X-Received: by 2002:a17:906:2c52:: with SMTP id f18mr11237606ejh.258.1624025526835;
        Fri, 18 Jun 2021 07:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624025526; cv=none;
        d=google.com; s=arc-20160816;
        b=KPHn64De6GGKVavMClTS/VsJCX842Ravh3f0zz7zuESI0CBgS7nMeA7J03bWR54UJh
         Y2270qSy5NmC5kDzHyEp4iZnFMYeF/RIhGfIfQbGcTvc07TlTuo5NRPfEEBQ/g+H041m
         QD/WADYyT1kS6KXshroyE0oCk7ykkJ9D+oz5RnmMR4dfmvwuUr7AUFqFU3BvM4xZxG/v
         45ONuujDVbBUCxQLnVQFy+I8rt6cdkMRzLny1I0WRkHKzLTqkASW9cCXXvh+GQqQqLj3
         olzQ1M55eetILshNn7EyVUmFgQd4a4/ygVbBHqgsuwfxPscBgzfWq+hMTFAaz/G76CYl
         ZpAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pGYtozpvnJsI8f1HWKWhkwq5RfsGSkgw1OuyAEOVRpk=;
        b=KhcSgvUGSxaMcZUJjW+PhkKEWfdyvwxVfIrZ6ES+JRsCT8pm+5vQhJrShc78ErkYLj
         AOmjnRkunczwcGDVM0pfck7tyM37iiUO1gBnm15IDIpLFLhAqyonXGnOY9pOgHnh+2Vh
         X3p5C2oN3yL44UEUu/uIu0Ds9N0NzGIRgdS3XxO349Yz0vOkqHmV+V1eVccF1Ax9Ma0O
         F9ruRuCDeHsBj+vs3pGm5TmlFcNsayLsJwuzZERi90JyOOLUvrYpCMXxOnjORp653wZ7
         T2qNLVx5tDOmnRhg9QQBTTSigP4cZXE8G0YRJivosuKhb8IAf69qsPYoHergBJ0lK21l
         /EXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BfG8W0kJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si9072500edw.438.2021.06.18.07.12.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 07:12:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BfG8W0kJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luFE5-0000ek-Qe
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 10:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCq-0007bL-AB
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 10:10:48 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCV-000211-Gv
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 10:10:47 -0400
Received: by mail-wr1-x429.google.com with SMTP id m18so10941865wrv.2
 for <qemu-arm@nongnu.org>; Fri, 18 Jun 2021 07:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pGYtozpvnJsI8f1HWKWhkwq5RfsGSkgw1OuyAEOVRpk=;
 b=BfG8W0kJbiP8zjiNotpPeFcCiXGjsYAC5JIj3qK2NQcKIP/CAMppq7ZSAy7pp4X4oH
 SkLWWacByCVREEKxXdQR0AY/5I+dEenMpeDOF5mCJ1JVP8qx/xR87DGHpK6JlG7oWeby
 fU9uc0HMU5JfxM9cgbjSY1Gx7CgTXsWCmRfRBeu4bkBw2pTGxp8wdX7VOXlEC53+DXO3
 pf2kYUGXl3njig0lUNgSwkpCAFnLE7ffKJalIPEVwwGbF43y3/nrGGqFkljInf4OSgGW
 AXuxVnFcssjCOoZjDlkofthwIvBSYlzAvIBDi9tcx4gN0bP3s//9Xggu95c+Q9gGQ89F
 rUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pGYtozpvnJsI8f1HWKWhkwq5RfsGSkgw1OuyAEOVRpk=;
 b=qrDKNwcWzHCxo+HdcnxbMpjr1yVuFVUk6GDOGIXJ6PsQoe8Ia50gZZ8hcRtQKRKQHL
 inoNxn/BxBoXotTxCKfsgDU6oF9Tk+QT4eDy9jJtopNpAG64gKhzQJ4uBsb0c4wU8A14
 ZOd8QTrRoQ7ZKEmux/6rGV2D/zZY27Byb/nG03+Ivn94rbW11y8TMpkrA4TcCD1knmYa
 cYi19vzDaDcbn8o+IVVFgKd9zCz9KpFLCkArYvsJoaGPHdf/ihOdgebKhae8c1iKAw0B
 IcA+lMuaa8YV3BU1h6dPvKe6gyd8Z/xyODOhpG6TeeG7f7oG/VdLIv6VyQ0UZEowIBzd
 kXDw==
X-Gm-Message-State: AOAM532S5cL1uuxIyBvZEyggUteQp7Gw5T2PH0bE4PtMy0VLIZk/vmiK
 x6oWMB0VF2sP6P5/YUx603yJQdVggsmvqT0W
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr11463386wrw.173.1624025426065; 
 Fri, 18 Jun 2021 07:10:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j11sm7751661wmq.4.2021.06.18.07.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:10:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/7] target/arm: Factor FP context update code out into helper
 function
Date: Fri, 18 Jun 2021 15:10:17 +0100
Message-Id: <20210618141019.10671-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141019.10671-1-peter.maydell@linaro.org>
References: <20210618141019.10671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M3359ln2Tb//

Factor the code in full_vfp_access_check() which updates the
ownership of the FP context and creates a new FP context
out into its own function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 104 +++++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 46 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 8987ef2e5b9..85418dee2e4 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -131,6 +131,62 @@ void gen_preserve_fp_state(DisasContext *s)
     }
 }
 
+/*
+ * Generate code for M-profile FP context handling: update the
+ * ownership of the FP context, and create a new context if
+ * necessary. This corresponds to the parts of the pseudocode
+ * ExecuteFPCheck() after the inital PreserveFPState() call.
+ */
+static void gen_update_fp_context(DisasContext *s)
+{
+    /* Update ownership of FP context: set FPCCR.S to match current state */
+    if (s->v8m_fpccr_s_wrong) {
+        TCGv_i32 tmp;
+
+        tmp = load_cpu_field(v7m.fpccr[M_REG_S]);
+        if (s->v8m_secure) {
+            tcg_gen_ori_i32(tmp, tmp, R_V7M_FPCCR_S_MASK);
+        } else {
+            tcg_gen_andi_i32(tmp, tmp, ~R_V7M_FPCCR_S_MASK);
+        }
+        store_cpu_field(tmp, v7m.fpccr[M_REG_S]);
+        /* Don't need to do this for any further FP insns in this TB */
+        s->v8m_fpccr_s_wrong = false;
+    }
+
+    if (s->v7m_new_fp_ctxt_needed) {
+        /*
+         * Create new FP context by updating CONTROL.FPCA, CONTROL.SFPA,
+         * the FPSCR, and VPR.
+         */
+        TCGv_i32 control, fpscr;
+        uint32_t bits = R_V7M_CONTROL_FPCA_MASK;
+
+        fpscr = load_cpu_field(v7m.fpdscr[s->v8m_secure]);
+        gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+        tcg_temp_free_i32(fpscr);
+        if (dc_isar_feature(aa32_mve, s)) {
+            TCGv_i32 z32 = tcg_const_i32(0);
+            store_cpu_field(z32, v7m.vpr);
+        }
+
+        /*
+         * We don't need to arrange to end the TB, because the only
+         * parts of FPSCR which we cache in the TB flags are the VECLEN
+         * and VECSTRIDE, and those don't exist for M-profile.
+         */
+
+        if (s->v8m_secure) {
+            bits |= R_V7M_CONTROL_SFPA_MASK;
+        }
+        control = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_ori_i32(control, control, bits);
+        store_cpu_field(control, v7m.control[M_REG_S]);
+        /* Don't need to do this for any further FP insns in this TB */
+        s->v7m_new_fp_ctxt_needed = false;
+    }
+}
+
 /*
  * Check that VFP access is enabled. If it is, do the necessary
  * M-profile lazy-FP handling and then return true.
@@ -173,52 +229,8 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
         /* Trigger lazy-state preservation if necessary */
         gen_preserve_fp_state(s);
 
-        /* Update ownership of FP context: set FPCCR.S to match current state */
-        if (s->v8m_fpccr_s_wrong) {
-            TCGv_i32 tmp;
-
-            tmp = load_cpu_field(v7m.fpccr[M_REG_S]);
-            if (s->v8m_secure) {
-                tcg_gen_ori_i32(tmp, tmp, R_V7M_FPCCR_S_MASK);
-            } else {
-                tcg_gen_andi_i32(tmp, tmp, ~R_V7M_FPCCR_S_MASK);
-            }
-            store_cpu_field(tmp, v7m.fpccr[M_REG_S]);
-            /* Don't need to do this for any further FP insns in this TB */
-            s->v8m_fpccr_s_wrong = false;
-        }
-
-        if (s->v7m_new_fp_ctxt_needed) {
-            /*
-             * Create new FP context by updating CONTROL.FPCA, CONTROL.SFPA,
-             * the FPSCR, and VPR.
-             */
-            TCGv_i32 control, fpscr;
-            uint32_t bits = R_V7M_CONTROL_FPCA_MASK;
-
-            fpscr = load_cpu_field(v7m.fpdscr[s->v8m_secure]);
-            gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-            tcg_temp_free_i32(fpscr);
-            if (dc_isar_feature(aa32_mve, s)) {
-                TCGv_i32 z32 = tcg_const_i32(0);
-                store_cpu_field(z32, v7m.vpr);
-            }
-
-            /*
-             * We don't need to arrange to end the TB, because the only
-             * parts of FPSCR which we cache in the TB flags are the VECLEN
-             * and VECSTRIDE, and those don't exist for M-profile.
-             */
-
-            if (s->v8m_secure) {
-                bits |= R_V7M_CONTROL_SFPA_MASK;
-            }
-            control = load_cpu_field(v7m.control[M_REG_S]);
-            tcg_gen_ori_i32(control, control, bits);
-            store_cpu_field(control, v7m.control[M_REG_S]);
-            /* Don't need to do this for any further FP insns in this TB */
-            s->v7m_new_fp_ctxt_needed = false;
-        }
+        /* Update ownership of FP context and create new FP context if needed */
+        gen_update_fp_context(s);
     }
 
     return true;
-- 
2.20.1

