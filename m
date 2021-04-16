Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp662216lfr;
        Fri, 16 Apr 2021 12:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdPGHWbnp0VA2p54mzhH0GRhYu15qMsfDY+fpRrDn2+RME5zL+E+csDefGml6wWqXMRRIE
X-Received: by 2002:a02:c492:: with SMTP id t18mr2821182jam.59.1618600791776;
        Fri, 16 Apr 2021 12:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600791; cv=none;
        d=google.com; s=arc-20160816;
        b=upheAIMT/noGuPsVOnKtZ7kYubhOVc2OqelIQkPAnP88uQwEdNV7oAjdp0z/abSPcA
         bnGa9w9WnAX7lcovFsgsU0Wsw2+0FrNzaLvklXQLn81LfaXUIv0Dt3s6j72OZREUHaog
         LUQ8HEhi2KkaP9pV4aJUBOAST1lGHMSMFQS9d9uK6KA0ysyTc0qpa0lkWAXoyfh8L2zX
         +7C2zUJ3ta298vXyFruu9lWt/cUVPXbGYwytzrTSx62lLDeSEYVcql7aDwPj7GpWhKlo
         xbgV7NFm3uAwLtQSjEHJ2KGIPGkR6L+rUiDTq2vukKwTUY95rxbeZ2TK8jYnPZ00In22
         cWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
        b=jduEx1rJMpbxMjp66Baz7GTh244M5zmJuXsebye1j7QCihEDOdQ4qLYFrdO5lI/XT7
         GDOpS7sJrsEtJQkROnCVsGouyjOaXMeqgI1zvkdSf7ENP8BIVx5gRz76JfXzR4x/+efj
         kwMLnlVjcKrDqfF6T6zIcgLVpG17NXq7JDIu4Nrz+pRnymmhVuzi08AsYeqI7mWiEVsg
         vWoePfPJ4UeIKrgNcNDJTaYWf+kCnWXffAAPhwL4Cb0ygzwHKo6b4dq3x0PEDP678ENh
         cPCzpMzLYpciZC7ep/BZmko5cuyv9JnaEbwXLj4qt2/KC6IRvDdTSyVIN0zdWw9rGYHF
         3MIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ltAYMOAt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si6787661iln.4.2021.04.16.12.19.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:19:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ltAYMOAt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXU0N-0005Ge-1r
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThz-00042x-IS
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:55 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThZ-0004SS-2H
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:50 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso15104865pjh.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
 b=ltAYMOAt86lv/kmqVDsSgs7r/fplbUiH7CHIQvfEob9VCNhNGMUH71QwSfCGDJ4KVS
 f+3EfUd2SDe71jLl105Km2G8Wfq9ob33dnPVRedreDdkD1wb3JsoCbRbBXZA06b16Ixp
 bEaxJmQ6zFbGn7ZYHjRBNqIr/+D10cEh8ktfYSmcJhF7BLPpcv39HkkJrr3Y492es2pr
 DZPYpT0aSfgrqw9KV1BntVqTIvQFnpU4XDbCwU+j7NZKt1u8EBQX8ro1MQbq+JFBr5ve
 Uk3U700QurPN2mSi4Fc53AzofS3GhGfv3fAlQd8EuVQqX1p68GaUcJfLJ+gtVokDgx6i
 T53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
 b=S9CBEobv2gFLgDMNnNzU/wx7VU+aVAz6SuTVMmr0s+3J6/zykhiY3+IDT7J4sQlw18
 wLDl+qW/h1vLYaKx07vIulDk6F5BLIw2qYGU3mGvd2bytUd7vQjlAWZJhl+gVoSqjivw
 mzAty0T8SSwywbNcSyo93h5pxaaDtI4a6soTtdhCZq5vCQD24Ih/xet/0EO0sZl4qlvV
 0e59wiMczYeEw9lnsWBEX+Z0cEmPbAjKT4LMX5p8gzXYQTx0I8Fappq9CUXqfUT8FdLy
 wYJaf1lTWWj4XlhhNf67UK0s2XSFKMb4rXq2ZzhGfCUxjcGYtJyBJ8Z0nCPwjhyFNaAV
 9HkA==
X-Gm-Message-State: AOAM532q/ivfT9QmvN+QvFfcPl/p4RX83ZF+l3HjZYJ9BLlc5J2KGLvL
 LQ+0qilr5jVLoQP+p+PBVtGs0O0O8KM6Yw==
X-Received: by 2002:a17:90b:30d2:: with SMTP id
 hi18mr10960343pjb.94.1618599623561; 
 Fri, 16 Apr 2021 12:00:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/30] target/arm: Enforce alignment for VLDn/VSTn (single)
Date: Fri, 16 Apr 2021 11:59:52 -0700
Message-Id: <20210416185959.1520974-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WnMvlOJOG7Wp

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

