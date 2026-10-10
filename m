Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70431CA9EBE
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Oct 2026 07:12:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFRDX-0001co-4O; Sat, 10 Oct 2026 03:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDT-0001bg-Em
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:10:00 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDR-0001B3-1Y
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:09:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48b03f23305so345362f8f.1
 for <qemu-arm@nongnu.org>; Sat, 10 Oct 2026 00:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791616195; x=1792220995; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6z90lw1XaEosdcXqk+KR1eAhu30BjyibiuTA1LqnWCE=;
 b=lH57ZXCopeyy4HmJFS3WeyeDnH3vIdOO05fYpZ2LFH000euDS7J0PNdvxfDYGp+Hcj
 vkjINT+6X5vVSpBtyn6Gu3pKwc3rlSdxqgKLWvwM90TX+vYBeLfHOHYUZa4ZNNXvmHL8
 JaXjekRBKNLGtBtHgIfrhK8PJxB3bjnfeyn8tcWqajULpSCommQtb3K3GJdASISkkqr+
 nEkVZn52gtnsR5n7mmz30jTnsw2PZZKlNrLjUfB26hjSdj622RpS5N7yJ2zis7xrDi2o
 TtN6fNCv2tyd1m43lG1zGiz5hx/37JQ5gXAn0chniSvKLU3B6KCNuWiytGlNS9L9lI0I
 241Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791616195; x=1792220995;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6z90lw1XaEosdcXqk+KR1eAhu30BjyibiuTA1LqnWCE=;
 b=NGvqJ21KsYpm1m39/8GVu2FljfvyDck2I6FttTPxKGL3N1yYlOAP1K3E55EWwbdEzA
 jRn8Mnr0wWKLObQ8Opbj+iMjjxMQQ6bfeFRG2It3xbNJLSdMmabEOI0fXPt6A7tCfmL6
 jJkA4DpJcxfYEy7HsiIEiv1eiKRqSxA3XCJjfscdgpMQspJD3yhL7rVSxykyDzvRWobs
 jxZKQ+qluRU6X5Vxf7SUpKkT+QAbPc7jpQb4PXPuh44M8YuHiHS2WdLxWVJwbOzCnGWA
 PzUx+/RWwPLDnKP7VF8X2WOmUqu+1kV6B80C2WnBvyj+tNY1thRRcTg0/0YaVE8DMAsT
 57Jw==
X-Gm-Message-State: AFq9FYJdnSE6SDu9WAKPiCIiZ6s9+CHd8gGzDUyeH1WBaKUt/3YSIdAq
 UU8LcHwDVaUzC7J7XoURr5zxMhkkEyq6hG3Gyjb+vSN31D8t7kWt1lMlsBtx2jclQmE=
X-Gm-Gg: AYBFou3R3zwXOGHjkOTKRg52uH4iGGMHm4xpGoOry+FV+rdoaMt87UXdl/8djHJnHmv
 9MmjZngWREAJxDj3X/dLDty5ElhG+xNgL3KJINrRsM8mUtbc4rSHFZ/CVI0rbMfB55FPC+le6Ek
 /qF9t+cXxFZZVi2P6q7gj12kUuKjn0Lqqrnr/zA9loI1VBgl2tRrHpjTL7p7clcrVVhJZM7cSao
 IvqAXG2ancEleIjVYUca/kLC64unyfBFpSGfwh8tnFWe1p3Qls1XBdTj9ZTl+IdUVl9AjhgkBVt
 P/vWGr2Szx2lA2GZV4FqYkCkNql6hElmIXBgcxipGf8hcYv5Z+QOqY8dgSlDL8R5BgP9Eq5NyU9
 vWuH9g1WziTHF5incSNu4WJQ3TK4ZesIpo5IbZfAD7HLRmUS2lDpxBStDTj+7W44okhQ7a2AgpD
 Ys9lWu/Ag/0K9V1NQny9HQIPcoB0iNYHYQx3q74nV3WfclpdYhmhCu8XiHdwyOhO2f7mDdqYR2g
 EZUe3ROwtD0r7lT/Zlk1Q==
X-Received: by 2002:a05:6000:2505:b0:48b:123e:2f60 with SMTP id
 ffacd0b85a97d-48dbace0bb1mr7759353f8f.39.1791616195336; 
 Sat, 10 Oct 2026 00:09:55 -0700 (PDT)
Received: from stoup.local ([2a00:1e:e082:2901:a2d3:66fa:95e6:7d81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abda3csm7662252f8f.36.2026.10.10.00.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 00:09:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 1/6] target/arm: Rename isar_feature_aa64_idst
Date: Sat, 10 Oct 2026 09:09:47 +0200
Message-ID: <20261010070952.323466-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010070952.323466-1-richard.henderson@linaro.org>
References: <20261010070952.323466-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Rename from isar_feature_aa64_ids to match the feature name: FEAT_IDST.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h      | 2 +-
 target/arm/tcg/op_helper.c     | 2 +-
 target/arm/tcg/translate-a64.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index a9eebb45564..2fc1bf02cbe 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1403,7 +1403,7 @@ static inline bool isar_feature_aa64_fwb(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64MMFR2, FWB) != 0;
 }
 
-static inline bool isar_feature_aa64_ids(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_idst(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64MMFR2, IDS) != 0;
 }
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index af56eff9f18..6a673e5ae6e 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1136,7 +1136,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         break;
     case CP_ACCESS_UNDEFINED:
         /* CP_ACCESS_UNDEFINED is never direct to a specified EL */
-        if (cpu_isar_feature(aa64_ids, cpu) && isread &&
+        if (cpu_isar_feature(aa64_idst, cpu) && isread &&
             arm_cpreg_in_idspace(ri)) {
             /*
              * FEAT_IDST says this should be reported as EC_SYSTEMREGISTERTRAP,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5d5b11e2da9..0c712e7ac2e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2675,7 +2675,7 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
      */
     uint32_t syndrome;
 
-    if (isread && dc_isar_feature(aa64_ids, s) &&
+    if (isread && dc_isar_feature(aa64_idst, s) &&
         arm_cpreg_encoding_in_idspace(op0, op1, op2, crn, crm)) {
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
     } else {
-- 
2.53.0


