Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF68DCA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:14:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNwY-0001Fj-Px; Sat, 30 Aug 2025 11:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMy-0006Gs-GF
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:43:20 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMw-0004Mj-Ga
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:43:19 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7704f3c4708so3310806b3a.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532597; x=1757137397; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WyUpmSL2n3VZMAxXx348SkKtQF1BK17TOs08zG5lW3A=;
 b=jZ6FB/zAgKNtZqFvIDMRmPphe9GrNFnxQsXSTRZOCtwbuy0sS4oEzgBQVKTP36RiYW
 Otd0eooyRKkApe6CSr5KkW/t+m8WdLe66QTF40MLFVtLyqjOT6+vBETzcpHgyGBVO8NX
 fuBcJpomyfJWXbL6tFlwkcIM/W4GCGt/z/evPYfk14Z8p3i0ssp4ToPifJhnMCdm6OXt
 DxeYjLfsBtLGrQ0IE8/UtEGW485MmaoTT+VgxpYE31C74fmNTggphpBZfmnGbRx8hnk1
 dscS32h9CInmPhYm1q9zyOh+ZMxROXcLF8ohmEeMV42YujDIQU7Kh/MHGkooe215almM
 Euqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532597; x=1757137397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WyUpmSL2n3VZMAxXx348SkKtQF1BK17TOs08zG5lW3A=;
 b=jQb2p7x2UQJ6jNE2tnMy4wt6ylgQK6MhLXQKbpcZtdaB/g8CSuN4Uii0XudnCJRRvv
 gK48tfwY0H4Nx7ixLuzCmoOxCUA/C2vITS+hsUQPu5ukvqQGNOWolxDDdKSfPMqEgbtI
 5jZMqBOZNNyMgCtwz+Tdldi2cBBrTact305LIFJPFs5gv9jEWR/0c/pcoXU03Rkd2wj+
 Zq4li2ZGLABfMixSW1i4fw10LaZtwEQkd6nG/3qMkEQ3IkbrK20PmhUvfqndG9M+2cBh
 shCtsdA2dno19q7nz52g9lt1zaTUK7AltO5TCMH5+Cnb5bc64C/xfZbJlsx/JlbhPZKs
 zZwA==
X-Gm-Message-State: AOJu0YxT/GO9h5oNqaFx2AL9OQ8yAO4qqDczpQFYIsHUGLfHOvOEXzvv
 4tNbUCU/Is9rgsNct+lwP4IxIu642kBvmfQa1G63Arq63RVh5Pwg/zZwF7Kru35GulI=
X-Gm-Gg: ASbGncvo2S281HU5sYrJ2RlAm7h2XIzkfTyywLCFlylvjyuJw2WRfkOE/FjnYa6sGJM
 H+qAFvSZmtR5HcYBvgPrZzKBjpS5ZWH8KwWIpTjWbvxFfpT0lrumEq+yLBFX8GS1z9+ox/l1Zwq
 8nbZKa7ya9umaBP93Sf79N+slUFgsb5thbd2XPDc8r+Z79BxxABU3NhABlY/hB1lO23wmPl5/MI
 mLObH6gti4uXQdMFTTqMHgRdAP1rHdUpQ7MVpekTBOKGd1vYMC+/GaO/U5w22fIAX3pg+njH87N
 Um1Yp6RwRGAw3phIQUzlT3Jh5tTOtUptzQy1DooBLXgZsNZi1dyk6AsYMSUiunWCrif4j8UzjM3
 G93yEpWlQAi3MxHW0R8e0ASEUn0+ttbfdHJzS/KIRxlKJ6bxUdhNYJMa0/zEsNpe5vTEOXVM=
X-Google-Smtp-Source: AGHT+IHsFwib7iOntDGZ3rUAOn54TapKLGJF6g6a9kg2W5VoPDYwo57Ng0Nog70/sQ2Grp6MM9Cchg==
X-Received: by 2002:a05:6a20:5483:b0:243:d5ab:d202 with SMTP id
 adf61e73a8af0-243d6e0090emr1696768637.15.1756532597177; 
 Fri, 29 Aug 2025 22:43:17 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:43:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 37/84] target/arm: Remove unused env argument from
 regime_is_pan
Date: Sat, 30 Aug 2025 15:40:41 +1000
Message-ID: <20250830054128.448363-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/ptw.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a9f44a23cd..2ef81a00ab 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1027,7 +1027,7 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
-static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
+static inline bool regime_is_pan(ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_Stage1_E1_PAN:
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5adea5cd65..a8c450d28b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1394,10 +1394,10 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
          * We make the IMPDEF choices that SCR_EL3.SIF and Realm EL2&0
          * do not affect EPAN.
          */
-        if (user_rw && regime_is_pan(env, mmu_idx)) {
+        if (user_rw && regime_is_pan(mmu_idx)) {
             prot_rw = 0;
         } else if (cpu_isar_feature(aa64_pan3, cpu) && is_aa64 &&
-                   regime_is_pan(env, mmu_idx) &&
+                   regime_is_pan(mmu_idx) &&
                    (regime_sctlr(env, mmu_idx) & SCTLR_EPAN) && !xn) {
             prot_rw = 0;
         }
@@ -1536,7 +1536,7 @@ static int get_S1prot_indirect(CPUARMState *env, S1Translate *ptw,
             p_perm &= ~(PAGE_RWX | PAGE_GCS);
             u_perm &= ~(PAGE_RWX | PAGE_GCS);
         }
-        if ((u_perm & (PAGE_RWX | PAGE_GCS)) && regime_is_pan(env, mmu_idx)) {
+        if ((u_perm & (PAGE_RWX | PAGE_GCS)) && regime_is_pan(mmu_idx)) {
             p_perm &= ~(PAGE_READ | PAGE_WRITE);
         }
         perm = regime_is_user(env, mmu_idx) ? u_perm : p_perm;
-- 
2.43.0


