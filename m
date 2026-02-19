Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A83E9A03B
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 04:03:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsvF5-0008N4-A1; Wed, 18 Feb 2026 23:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvF3-0008Lw-SL
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:17 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvEy-0001D3-F8
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:17 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2a91215c158so3253935ad.0
 for <qemu-arm@nongnu.org>; Wed, 18 Feb 2026 20:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771473731; x=1772078531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X+EWQStl3OxtO/agizp2TzeqNHuyOddWzArd5felHRI=;
 b=QWL0H7Kce/kelE9D1liCOoc+wHrwa+TpZDX/4mvSF3JWPlYnQsoFF7q/eoWNC1Eg5S
 S2p82B8E72nA4pcDNK8KKfWipKm46PaiTrC2lp4XIui7JcvEDrVK1TR8v8k87NqjU0Cf
 zUo2o52as15wgTGZpNROxyfpz2cBCrdsGvZeG6LMeXjgmRgabCgPMd597U6AA354KhZR
 i4f9i48ccOFL+ytLBO+3QHTB1MY+k+TpDq98V/YLmJXZ1hfHEdLaAtyquHc61XyOP/XP
 lFY8iajxS7U5ExZFbgUjqE9bV+ER7kM+Dq5LDTV4AQdKIn2HBV49yDpSZSZxT/9VMb00
 SPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771473731; x=1772078531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X+EWQStl3OxtO/agizp2TzeqNHuyOddWzArd5felHRI=;
 b=rPjGJUiaSFrIQQqNFNOThD61HEOVMasAI/DCGCK0RbM3cbT5kji5y3m3OY0zSildKY
 z37HuxjwD1dr50XZ4OsVgzK9bp7S/Oy8FFFeaVs7/bOH73Nfo6O5zWJs9rLYfFAbHq4G
 qEpKjlNWNrg/zX5e05YRMCPGMMF9KkPtvpZmey9U7DMMfuI19nPQnQL1aKWU1HVjNNZV
 LrOHOwQ8KtCflPlJ6APuGh05YnlF3oZ9kGUP4hPRkDOqoe+ixiVY8pOiRRYDy7e59rCH
 lKMuA+svWX5QW7k5vJqtDYpOQ0ZDaDOylfJXc1m0sCXAHiBClS5q9FDiG7mqplMoBv3H
 DFww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe7jJCI+zOzNx6iuUX7r1Xc+F0vl8dY5I4OwAMNYGNBR6XLvFvvEgyHVyWD2Vr7qshv8QHvB/R8g==@nongnu.org
X-Gm-Message-State: AOJu0Yy3rvqL/x4cA/AuOsYfHtbf8sA85lso27rq1sAXvKohdisKIcmb
 ecKhMh2IyHHx4Uld5M+tbndOXjZgwJLxHmip02iccINTPbeDX9GjWScaZl+RKVXm7mY=
X-Gm-Gg: AZuq6aLfZUlo7uLTrtGpWJzrECPJVEKmMK5ldPf+CZ0Xz/IU4czrpmalbAX08NVmF4u
 bZUHr7FeJbBDzCK+BGAe1bozGxLcfME3D03WO6VOxBXW1XuWMlDdWN9rxC4I+iB/vOYCOinXYq0
 9wayyje1PxTjaEX/BnYJKuasb9Mx7cfHFBdypSdkPRgb4kd5FazJch6OjfBii0vB2AVYkUK/8fH
 GrBbkEns1GyeHI0qGDTw5LpU5QT4dvHfn8GTpd8ea5sZC1/du5tq6HeXnbUnTtKwgP3XmeX2IfQ
 bXYh21N1HZlsaE+uNPS2EPvtd2js436AYU2ttsmBtpL5/vgyv8i4x0qbFeEEm+iJPF3setqawyO
 avHyjQOd8laQwx6QJLmi2C2mH0dBbPr2wpZnCNvSQJjzB0xneoxAYp6YJLtRPQWJss6z71ftf/B
 CXHyYYiEEKAkBdpXKCBpaVO3nsrF9YGk+NqMShjMIhmfJOIkku1tJ2y/dHODJC+qUVmunu0ZnTE
 a6U
X-Received: by 2002:a17:903:32c7:b0:2aa:d60c:d48a with SMTP id
 d9443c01a7336-2ad50e77664mr37975015ad.7.1771473730975; 
 Wed, 18 Feb 2026 20:02:10 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a73200asm147636225ad.36.2026.02.18.20.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 20:02:10 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, anjo@rev.ng,
 Peter Maydell <peter.maydell@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v4 02/14] target/arm: Don't require helper prototypes in
 helper.c
Date: Wed, 18 Feb 2026 20:01:38 -0800
Message-ID: <20260219040150.2098396-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
References: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

In arm_cpu_do_interrupt_aarch64() we call the TCG helper function
helper_rebuild_hflags_a64(), which requires helper.c to include the
TCG helper function prototypes even when this file is being compiled
with TCG disabled.

We don't actually need to do this -- because we have already written
the new EL into pstate and updated env->aarch64, we can call
aarch64_rebuild_hflags() to achieve the same effect. This is the
function we use everywhere else in this file to update hflags.

Switch to aarch64_rebuild_hflags() and drop the include of the
TCG helper headers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8c5769477cf..033baf7e715 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -36,9 +36,6 @@
 #include "target/arm/gtimer.h"
 #include "qemu/plugin.h"
 
-#define HELPER_H "tcg/helper.h"
-#include "exec/helper-proto.h.inc"
-
 static void switch_mode(CPUARMState *env, int mode);
 
 int compare_u64(const void *a, const void *b)
@@ -9473,7 +9470,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     aarch64_restore_sp(env, new_el);
 
     if (tcg_enabled()) {
-        helper_rebuild_hflags_a64(env, new_el);
+        arm_rebuild_hflags(env);
     }
 
     env->pc = addr;
-- 
2.47.3


