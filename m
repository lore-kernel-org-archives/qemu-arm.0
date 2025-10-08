Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A65CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:13:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6c9q-0004BQ-5a; Wed, 08 Oct 2025 17:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9o-0004Ad-Tr
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:12 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c95-0006ea-SK
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:12 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b4fb8d3a2dbso174867a12.3
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960583; x=1760565383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ud9vGgDdoT6jxZodqNWxrrBEL296XjYMaUJkjzXXc8=;
 b=TnJ6DlJv0eE4sod6Nu3uprVJl2ssi3Sc/EGXprGISAxvR2te+BvTejRzKg8nkc47se
 NlMnU5fKj/DblBFUonEBPuNZBQmbAa2Ga8uyXufjs+Fikm33ENB6VjTAAymgIyL6LeWj
 0wpX4gY3NzTDtsdrcZAeNN2XXRszv5rwRue2LZ9bxhQoiVdFk39WDJO9Sp7yvQpw/mOE
 VyIrOi90HTI6sj1BYAHsr2jrOh4slbvYxEQsHpEPhpKFnKAcMk30zce8J9suvCqLcn73
 ZPb8DGv4vfqYC38uOoaOLO9ff1fv/oc0fjW9XE/1lNxClKhCfgFh/jPcHlFBfSSg2Pja
 kXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960583; x=1760565383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ud9vGgDdoT6jxZodqNWxrrBEL296XjYMaUJkjzXXc8=;
 b=tMxWCrtQh+cQDz6Dq/4icZ3fC7x/0TKgU+Yc5fPguGXvtBhXHQSA5xySxztyeApPme
 BVNbnWe06MsbmGaH7Opl5hPMbePLYMeeclMI32Lqn110UksKNFse9FPOi0GfDaDMvf1C
 NJ77Yf1Opb7JybPqaCVfpV/zEeECZRqvS6oEMy2BrvWUJIcYnRrS/D197lBsIj9/RlDA
 VSHLzbojdoC5Ag4bKyi74+3yIqaJk4TgcLAJHT7b/N/E8SQfLQm9SuikH9Xss/8eGXfw
 86i8i5lqx7SGbep80Mjpp+ZwCe9AHgQjB3SlU1j64d97ZgUenmwLJMy0hxz2KH35Wqew
 XUsg==
X-Gm-Message-State: AOJu0Yy3hZAI66McjtTaVGMQ8lb/VUsxRK7Hj2KpmBYUcUQlK4LbnswQ
 1A4mJdBdIkR9vIjpB96eZmJjStHsnHhLF3EJR5JVkwKFuptAfL66yxfnz5BlihEfz/enw3WgKxP
 AaxbKA1U=
X-Gm-Gg: ASbGncuE5pT6VRUUM1OXrpAvR6oOXWyGnUbf7qxFpELs8VaNEe8Yr2pb2Tz6+XeOhiD
 DzdB37KNsr421Oin+MV0YMLjnqIqwoOwifiN1Al264qYTsezewgRdhKJm3OzjnTm1P9h0W1CEjI
 X+0D+JHodDrsdy1J0YaNGPAzukd8KcBdSNZubFOE/gq6pjxFAeJF510vp7BGcWlwf5H1Ou7q7o8
 zkUNZ/KyaNyHNO1mVh3Yqtfu1VybbFJ/wuVeHrYmX84zKwMfpdLIdi2z06VvyMYJ/Odwc5VWw2k
 JNfFM5yKR91puwXUw3nwxsiXPVzh4i5H3HTz/VrtMhFX7UxI2jYzwsdgSQxLualvWV9rvmyrRxf
 +a1W/C3l1teO3UEpFK6YUhiaQs6+kWh6oFOLigbWMeAZ94c1yDavUbl7i
X-Google-Smtp-Source: AGHT+IGtW3HUHCMOpO6gAGqW4C7T7rObNClbEPu+KsdQaPx9O0fcj/O7WjMhenl835XYvshj+vyrag==
X-Received: by 2002:a17:903:9cb:b0:28e:caee:40dc with SMTP id
 d9443c01a7336-29027237d65mr61947215ad.14.1759960583551; 
 Wed, 08 Oct 2025 14:56:23 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 13/73] target/arm: Enable FEAT_S1PIE and FEAT_S2PIE on -cpu
 max
Date: Wed,  8 Oct 2025 14:55:13 -0700
Message-ID: <20251008215613.300150-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 8c617fe37b..f024db1d29 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1327,6 +1327,8 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR3, TCRX, 1);       /* FEAT_TCR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S1PIE, 1);    /* FEAT_S1PIE */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S2PIE, 1);    /* FEAT_S2PIE */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
     t = GET_IDREG(isar, ID_AA64ZFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 1aa0a6e4c3..c779a50570 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -123,6 +123,8 @@ the following architecture extensions:
 - FEAT_RME_GPC2 (RME Granule Protection Check 2 Extension)
 - FEAT_RNG (Random number generator)
 - FEAT_RPRES (Increased precision of FRECPE and FRSQRTE)
+- FEAT_S1PIE (Stage 1 permission indirections)
+- FEAT_S2PIE (Stage 2 permission indirections)
 - FEAT_S2FWB (Stage 2 forced Write-Back)
 - FEAT_SB (Speculation Barrier)
 - FEAT_SCTLR2 (Extension to SCTLR_ELx)
-- 
2.43.0


