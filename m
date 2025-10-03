Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81759CCA472
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:36:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jQ5-0004nA-Pz; Fri, 03 Oct 2025 13:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jLs-0007vO-0E
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:52 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jKF-0007sO-Dt
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:50 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so2134385b3a.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511522; x=1760116322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JF8VeHAMXnS+KlXHqFd9bhXPg9cRL1eKSmFQYNi3XjE=;
 b=HqKRAUo/qb8YS8dXwX0r23ye7NfWcxu0Yiwi+HWKBHNemgcgNoo+9Pdq5ojIcQiutn
 gF0ANBiWL7KgpoT2agaqf1xC3I+PdEqflkdfZlZOy9bq7jGXPoOWohLFsVk2QxBrj56Z
 kwV/foNGHFBvoZD9uY6BSMQAT1V6imqSxtuDPYFKJt+tx1ayVWqTcrLXp9BOTvPDCbDR
 nynWBNiwfDEC91Lx8R0lZmfXUthD1wenb43bZ3R2jgZhDQEBxTFAVpJV2hioD9cxL2fQ
 tPq/y+snjhcttwrpxvODcSVitMQCM9NNq7t1Db4dBx4Fr3n1UW8clnJd2u7p70wFxzFT
 vuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511522; x=1760116322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JF8VeHAMXnS+KlXHqFd9bhXPg9cRL1eKSmFQYNi3XjE=;
 b=I54nSWmGIyyGjREJur7C93WTYDdHQZmWnDqUuVG1yL8IlJCE3HnJntQyILC/u8Sv97
 pu9BDZmdrXBfBZYTPaNxMiSr2rSmAcgY+EN4HyQhs2wg0IgzLlJqcrxXvTFZAVYeTllB
 iV0pyruW4pjZ20NBixCqVe+V1zPm8To+hPsvWA2w2SZ2OEXUaoHG//yTlhHCJ9RW5eM2
 17D2OXcysLHfHsoyP9ZtbkLJlVk5Ty7d3SrvbA3SwrNgPBAPZot1HQWN3hrRLY6PZEKR
 Ap4ePs+Lx2ucISBh7kEcvAQlJOniOug4h/3QpqGqO/kp2HMuQNiBCSFEjOUFdRTFkkZf
 rMqg==
X-Gm-Message-State: AOJu0YyVQkzdT8n8qijaFlW6hfGWH7sAMJH3z5OJKtTlJRAceHO8NxNt
 3m9hHDeGKIC/wj5HtXwdKV0ZvKWG35KWzIl8ZYhAFSUzvCW/T78Osor55VYbWm6WtlI=
X-Gm-Gg: ASbGncuOqBvQviXBbvn6d47hu9lAET009wFiwajQwHWI16IyEiwW2SArcFx23tfc+Li
 DzA24fcpxCMiaIsLKlYjI+Ia9z7eE67uMYPkypG5zBD4GQtSYagUL+7LMCsFJzJz0Cn+GWTNPO4
 wSRdL19tz299SuKSkXtdfs16boTomeL7ZD3TdqWeicmzER55S63GjsX/85ME2DGMZMKbM9oqHqA
 lIfPKSHVfLAIKaWNe45xH1HybNQ8IklZr7X62g/ytImc6VfgKd7E+TSO/o+LOfbJ46DFMDDoB5w
 JD3spqdSUO2ShaezEQHYOXUtgpE3Wl90TJf+nm0Czb5/WsSOjrUokUYhbP+cgWBeJKKcZFHSEHi
 /9jggXD13bKDIuPp92WhXl8BeazKD6+IMIj03Ha6omnIqSnMK/c+M6C8i
X-Google-Smtp-Source: AGHT+IGKp6Udj4mRZD07nDWrecDrx/uFIoBJCo57u/1eSoZLBx/UjQYXES+FI2lasDrJ4FkjjiLGog==
X-Received: by 2002:a05:6a00:6e9b:b0:781:1af:d3d9 with SMTP id
 d2e1a72fcca58-78b02204bcdmr7109447b3a.4.1759511522057; 
 Fri, 03 Oct 2025 10:12:02 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:12:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 67/73] target/arm: Enable GCSPR_EL0 for read in user-mode
Date: Fri,  3 Oct 2025 10:07:54 -0700
Message-ID: <20251003170800.997167-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8ecf8a5e4d..98da468313 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -311,6 +311,10 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
         env->cp15.mdscr_el1 |= 1 << 12;
         /* Enable FEAT_MOPS */
         env->cp15.sctlr_el[1] |= SCTLR_MSCEN;
+        /* For Linux, GCSPR_EL0 is always readable. */
+        if (cpu_isar_feature(aa64_gcs, cpu)) {
+            env->cp15.gcscr_el[0] = GCSCRE0_NTR;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.43.0


