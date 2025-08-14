Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C906CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:23:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXZL-0003wC-U5; Thu, 14 Aug 2025 09:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXZ9-00032v-7j
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:00:23 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYx-0004UL-Tz
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:00:19 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-321cfa7ad29so1526323a91.1
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176402; x=1755781202; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/0IpRgg6t34zaimtrRMdlDr3oUmrGBXYyd7BxUgZh4=;
 b=Ytsj21XNAg+1gqn6o9VdkWHnuX35807UqFGg+HqdlO2V3zuwTfnYnbNoQQVkn1PwQG
 TmQXJslYzBBBYZJUKLdafqbssk+tChuaQTK9aD6VkX+MOqgACKfQxTF4hFV3Alyb9WbA
 hiF+il1xZzldiJIeIvfKArgQS5sl2soWnolNkJITnDHgaudef2d7PC44ef4kKMsxIiMx
 d38UZj4TvHc9koMQS49iK/7ADRNrvsGHemiZ5CMzQPcEkXMtethX/F7JL4LKd1IKF61q
 jbxggA6Yu1clhoYA74znY1UXHUet/cZNtQl8MKLLvagBV9+JT2Japd9n8M+JM9lXRyG9
 ILXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176402; x=1755781202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/0IpRgg6t34zaimtrRMdlDr3oUmrGBXYyd7BxUgZh4=;
 b=lUUhycMkbPxBzJ3LrgqKvSOEd+nzp/fjnw/zRmlUyrpauwbeljLsOQ5Bu752E6TwUz
 4XBSG1UPveD9ki87y35iIo7y1i00cZr8rr46DdSe9aNrYxK5g9L2bfH1rE9UBJOGtXgc
 vrMx+woReehXc6kWi+TFzKhGNKlSog1wd0pUuZk67aIIcFuyyOblnP/zz0x3wyvq8WC9
 ymXe7H8KHeFgNi6G53FgCSH/juGC4NvYV46Ic6AgOcf/uimy72WtSHTrGd0Jy3Zh6vo1
 yK0s5KQlXxlEtNucstV5cggeIcRSYUmltlJne3eKw/AMGskz8gratAOkDdR/E1v+UmFJ
 DmjA==
X-Gm-Message-State: AOJu0YxHYUHv9nSjixyhrnStZZfCYWvwwqdgXzeCzwz3kxswMB0jpr3q
 2oUrosfn6r/zaOIcq+lHUJhtdzV2urA2UOorTyvOchhw1y9ITTT5WEdM0upcQ94mOpc=
X-Gm-Gg: ASbGnctafATcnSWTOHJ1f1IG34DQeu+KvPpog74qUj7Qp6fdYBWZtYiOKQz70KJzO1P
 ZH+/LaEvwyY1OoQs4syL0X9TtB+uLHIDyhEXLXKXoJEZHk3sIJ7URWVfS7GTsib4OKhk20GpZs9
 +U4S5D+te+42E7e9aPj+xwyGsADVUO0WD5QXtcVxdAD/B6AfrimggWMvZSSR6Bw8tm6HjVMLPmU
 ULP/ERwFQXx9WIOcZ/cfvOZULzMrZieTQEzY46HE5xSxOqkVphm6eZQetEIqkmjS90CZ8oc/c/j
 X9zpFeEdHW6fukYzcJ1XpcU6xVbiwZv8L7vvcjj9qTI5dv0SO163dSAkAt+jGawhfkeCB4U6e6l
 QRZ8u8q16FnVsrMNrBfptGTYlOIhEOVYxwlkhg0KBnT7LFOQ=
X-Google-Smtp-Source: AGHT+IGt5QpqCa5lWoGezXXfy9akMqbB1GCv3xNXn4zTk2H/Ex+69winOrS5ok6KAIb1OjAMal08XA==
X-Received: by 2002:a17:90a:c2cd:b0:312:dbcd:b94f with SMTP id
 98e67ed59e1d1-32329ab24f7mr4201738a91.11.1755176402488; 
 Thu, 14 Aug 2025 06:00:02 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:00:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 37/85] target/arm: Remove unused env argument from
 regime_is_pan
Date: Thu, 14 Aug 2025 22:57:04 +1000
Message-ID: <20250814125752.164107-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
index 0322646753..962fc423a6 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1029,7 +1029,7 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
-static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
+static inline bool regime_is_pan(ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_Stage1_E1_PAN:
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 30c83334b6..c75b15b263 100644
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


