Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154D5E81A3C
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 16:04:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vs150-0002AV-CB; Mon, 16 Feb 2026 11:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vs14n-00027w-KH
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 11:03:58 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vs14l-0005nM-DW
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 11:03:57 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso25526275e9.0
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 08:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771257833; x=1771862633; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QbBuvUw9blZWZ8nku4XhCXzyBFDPHIgEib9kHdOYrNs=;
 b=nj6GHOx8HjFrsBgwYWFIfRLcefKUTzSaQMZxvtii47sgG/F1LrQz1tAMeINb7gs5Qy
 8xibiTZQTCkwZCk/dqnTKU4TMm5LtYkGKAL0Qw9kkYQr0o9ri7g4k454kbaiA5vDMf+m
 Qf6TI8kMChIH922AtP0cTRDztDdSHfSM1B7yPOVXSoVpWDZ+4GD5P1B3Xxl+vyCrpXKG
 Ws548oRA0WwN0Zy4ooPhxEwK1+/aQd6bmGueJ5qWGo7t5hAEb24H9wxwuN/6chKrUjnX
 Gx73VkB192EJ1ZB10tc4QAEe9vR3Sosaq+6RHK2pooPKmPyvxQUCg52uEuk8JpIhgiJg
 6tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771257833; x=1771862633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QbBuvUw9blZWZ8nku4XhCXzyBFDPHIgEib9kHdOYrNs=;
 b=YoQTFW9CJejQ0ji9b5Gvk2WT7DfXRWtP0zpfG9a2HzgZvem8FRZENUpY0Dz3ir8Y5S
 KYFAvfgCmDnk16jy9qlTlL9JrIpyQbs5iq660bk/4BJhooqpFIVq3i2xvX2IuWmMBuCf
 yqvkyvVwxRK+SWvpnlIyaWUFdP2A4UsEK0k0mbKyhTDoDwVWUED7qVFPmEud2Jop3Hwj
 V125ZQihyz9wkScImA9nkppUG6Nm6aRbyM5c89V1wb1vnnzowg0Imz9d2sI5gAtgJx/g
 OaIqo6g3mWloGEJJodcV6inXeemN8NAZgA8nq40eJ5uqWMOG2YE6OGhvDzNjr3YskIJd
 0mOg==
X-Gm-Message-State: AOJu0Ywt2mf1DQRo+KrkO5uhKj3Y0O5u1c0NoOnG23nbhjwbhdMcaKgg
 M4b+MighVa5O+h674+ZXrGWgRlszhQFWEbEDEvk9SGKlwzHApPGFDM/7Ts21lYYsnP9YQ/qcYVK
 /RxS0
X-Gm-Gg: AZuq6aJZEZ30HIbk2/uW/5SzX9izf98FERX8yg7zfC3k5+FwIfmCXacaJ7PVAAxsWHL
 mFTziGd/63IhS7YzCLHiF0K8so/zye2W0FQQcSL4s8n9wQ0BErHBYsCdCWrOBGXlchnRlo8DxGv
 4Rbu43yG8y9DPOSNkyehkBVPPGtvZXSxwXTn3d7+0NrNLYPQHakMr9otzQRBgzIX3TScT/otUVE
 hCy0+8Ij25D+Hkmb0saNJ9gdCxymZK6IOqxfIRWsG2MmJqySRjCpxa4iWwti1BzZ+Hre3x0S9R0
 +mPyhkvawILb9EjaDqQmkN3t7vvzcj1pdtbqWSVSro0aTpB1nvw6pxcXDYqdjPvnXgGPUJdwhgX
 HdkDNGwJxFdG6S7jE8JAxlgrTAFFHAviEg2e/ts9OC9PIf+PG2dBoskR9Ce//Kw6McLlbh3N/nX
 WXhCgt7ujBJuovrr50meoQgaieyHlD4vSMXiif1W7/RgsjenEvSdyH+c+slIvbQ+te+obGSZ7JZ
 +m0xRL4YU0rxHcEOD23rWouvjMZF6I=
X-Received: by 2002:a05:600c:1d24:b0:480:4a90:1b00 with SMTP id
 5b1f17b1804b1-48373a5d80dmr194005935e9.20.1771257833319; 
 Mon, 16 Feb 2026 08:03:53 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d92267bsm661713185e9.0.2026.02.16.08.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:03:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 2/2] target/arm: Don't require helper prototypes in helper.c
Date: Mon, 16 Feb 2026 16:03:49 +0000
Message-ID: <20260216160349.3079657-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216160349.3079657-1-peter.maydell@linaro.org>
References: <20260216160349.3079657-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
---
 target/arm/helper.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8c5769477c..033baf7e71 100644
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
2.43.0


