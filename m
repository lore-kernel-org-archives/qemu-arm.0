Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28D7CAC598
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:29:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWat-0006O0-6M; Tue, 16 Sep 2025 10:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaX-0005vA-GB
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:21 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaT-0008Nl-Cx
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:21 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-24456ce0b96so62678145ad.0
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032583; x=1758637383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9C7TeSELE/I78PqGnfI0xNq18ESqIf/4E122jlCx3E=;
 b=XYNnMLfgUDiMeEYl9kSNrge8OkddtfEgo/p1ugxdy2+ZUpeWb8cfpyDOSbqAoaBWvj
 uIM22Y0lNmIIGmLoBd8KJNhDrK9gjtEPLtkGlCLsGLqm2FZiE4lAK4ZteZyvWOKsEpHH
 Ubo4R6gB4sQV48406v5B/lKEQp+tt6muxMuVqzDCqTToFQ4eLpk0Nm4gDo//Y+7XGSrm
 RKdnmF3sbaeHmQjmatj+Ae6f+JAb17DYFcGNT4odf7eaRxnrpRXUT0zVjNPLPawOMVcq
 dkOjeTgRl9slBfYVI2rjCZb2YEcZHjmtnE6csS9RyPOU84ORXdHjGHEg8gs89rGQXDEA
 CsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032583; x=1758637383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9C7TeSELE/I78PqGnfI0xNq18ESqIf/4E122jlCx3E=;
 b=eOKD3I5iPMaDMxW8OnfhjKxz0eE4UvSaV1rnosEhqvBvFsU1bEyWyHgOSsvukOK9H0
 yoGBjNLtTB3ZJCQtBTprdmirZtJr6TcVuoYZ8An3nO1zJEHzL7cGve3IRaSMNtDKPvzA
 89M+sYZMCQJfTYec0GMvNq4yyHV/u/EctJDsWFIjCjNI6v64iWkPm9fOR2pxB5XyuLVg
 XnIJ/tU/6Yw46ZEupRCFpCDpstCqrNgWVCmCc1+FlTFM/pFNfH9ASz6B6x4GgK5hojEY
 Uo0UFoihPYUqOYY7B8qKovf/K4uKYnhZ07Ai5LLmIWq60j1twKCa3swC5iXfxWQA5Ol3
 wSFA==
X-Gm-Message-State: AOJu0YwuxG/50cJ7qZUxZq5df4xHU/+KN8FPlN73KwPpuUzbpfr95xqJ
 LFVPl/o378IREUBnyOn1U06ejtfwuHQgmm3tQdw7Kvp+8xFgMmzx5mGZ5NBDNTcxwKs=
X-Gm-Gg: ASbGnctPVTt+6IFrDl6eWWLiD/ICG+PmfZTwfq/Ze1wmJlZ2nIYsm1VMWQLW81fBbmk
 NdLPa0qGMMXbaXS0xiuWdU03NJSmX30L1JgH4fUfi+G4aMlMgz1tNdGlouMQEalZaoU07rX6m2q
 mew5iGj9zV4fXJIIg1un0iGOnZhkBLsTKWpvDNNBhHGIksaPRP+BnSk6A42esgt3jFapyO71xk+
 ek/JDCBLV/RMSrmxS7WVJ80hZFq/U0RPH/FWlzqIKEEHZor0xhp3PgqF1RHmTl6tSESl02CDFAj
 2bwi5L5tPnlzdEXoyGP37iUk6uct0K3g2SZWORfZYaYvfZx9qWe8tlRBd5FURpuOZpZ1z0N/1bD
 6iyIpBPIvgOtktIN58RgvVFt5Oa3L
X-Google-Smtp-Source: AGHT+IE+Qfbk0b0Y3115cRAlVaar1X+didrD2Gf9E3LVprk0+7tgZLKad651m7yXduDlH2+ZtlQ1nQ==
X-Received: by 2002:a17:902:cccc:b0:267:c1ae:8f04 with SMTP id
 d9443c01a7336-267d15f1e77mr28050565ad.20.1758032583386; 
 Tue, 16 Sep 2025 07:23:03 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:23:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 30/36] target/arm: Move endianness fixup for 32-bit
 registers
Date: Tue, 16 Sep 2025 07:22:31 -0700
Message-ID: <20250916142238.664316-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Move the test outside of the banked register block,
and repeat the AA32 test.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7828268c7f..0f681c15e0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7493,14 +7493,21 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, ARMCPRegInfo *r,
                  */
                 r->type |= ARM_CP_ALIAS;
             }
-
-            if (HOST_BIG_ENDIAN &&
-                r->state == ARM_CP_STATE_BOTH && r->fieldoffset) {
-                r->fieldoffset += sizeof(uint32_t);
-            }
         }
     }
 
+    /*
+     * For 32-bit AArch32 regs shared with 64-bit AArch64 regs,
+     * adjust the field offset for endianness.  This had to be
+     * delayed until banked registers were resolved.
+     */
+    if (HOST_BIG_ENDIAN &&
+        state == ARM_CP_STATE_AA32 &&
+        r->state == ARM_CP_STATE_BOTH &&
+        r->fieldoffset) {
+        r->fieldoffset += sizeof(uint32_t);
+    }
+
     /*
      * Special registers (ie NOP/WFI) are never migratable and
      * are not even raw-accessible.
-- 
2.43.0


