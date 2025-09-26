Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087C1CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 00:14:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1w4O-0002NH-UL; Thu, 25 Sep 2025 20:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w4N-0002Mv-Gh
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:12:15 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w3z-0005Eu-2i
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:12:15 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b555ab7fabaso1507136a12.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 17:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758845502; x=1759450302; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CxjHHRJTw3hUZ1UsocmE5vCuaQ9siO6rI5yfDT7Lfcs=;
 b=LumKvdg7w+HUfzGqZL9wQIzlZsOOfbDgch1OBfAK0ng3asuFrXGgEJAfkVl4maFKDX
 4/3+PuBEEq2YHguIgACxvRiz2CY+1EW/MOMqEoglCp9flSGRauiyyDdoklojQTS70mOx
 mipxaRIjTCl+Bjz9ry1nUSP25KGfbSP2ljAD0OyIIRmQihI+DwRjiNp81f9Nj0rEH5Mb
 riSuuVN/2DFTz7wAivRFh26GirSFnbcIC8uLofThLRzj1ANDT1obCnuqc7Ha2iR3KFq6
 PU5HlrtAKUdGE+SJIqlZdophq4vlxTbRkh21B1ybSQFN+Eg54rcYTlZTm0KSYTXPRrRR
 GOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758845502; x=1759450302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CxjHHRJTw3hUZ1UsocmE5vCuaQ9siO6rI5yfDT7Lfcs=;
 b=X6/1EcgdowpGcDXG85R/dWpyNHTW+ADrEyIrzJ4nJr03D386z7WpP08ixArr523lc7
 14mMCAp+NAjo/VXIUTvV8AGiTuOpP343DiguhinwfObqYZutwrMO/X2J+gSvbYNEDlrA
 oNRgtG7Zv4t6bVTz/gr1vhSN+0BXdfFTW5/SkXAbbE0+E1FwK09IsRooaGCR3QyKWO7S
 ATqPUgWgkavpZISya8mjWDP0Ucj663xmY5pvrPOiWD6NVSLn5/O75cCFZmgNxgyT4vRy
 W6KNCrxGPyaPcwNbYkTFjsUPZPqo7/vMUtk5VvWRLs5VCSQeof6xKp9yPTOjpTGRFDIi
 IIXg==
X-Gm-Message-State: AOJu0YyDK01NN5QM029Uy9SyL/Ihww7OlX9GWgmUIqw7YzyJpUMaRmvJ
 8mMtXYT13Ja5LZo7XOv1jI0fBcMg0JDdj0LBgzsQdn2GKrlm+OHKBCquZ1fa+wPWINo=
X-Gm-Gg: ASbGncs/HcotEupJkIc4TYPVhpnVrNYkx6BD6mSO+hnh8AKg865Kx8p8LlTzsxJHwRP
 Qwf2bCvhJVlCi6vZofWvWdHxc5X0+o6ryCMv4XhQVupz5EMYvwQNXYOEDNdINEhl3Q3NshAfPlX
 oqqLeZqqh0qt2cL32BOoGxqhqOAFhaLmOoQpbO9VSUcnU5iVmy/E7isH4aAhAvOAIUdxHV9G52Y
 67PhpXaF5HmKOfpqYh61QbT+LLWByh7AWzvqEZblnSDiQSCcYVAd9EnZwdErJbCBh4FBYlPkkSR
 pP9Qut6X3LRD1SdBOAQhCOgU3RrqlRpS3OeE5bs/FBZDYKN6xYO0OuaGZdxlIVC739HqAq+jbgf
 uqV+ZsoG6+p1g4bOPbEzqLixt5vtD2GF+XtCxAq8=
X-Google-Smtp-Source: AGHT+IH8hWdSKitCkNzygpMbIA57pTpyDi3inMnTs1Upq/5V8hoVThD7ZRkaBq1nRsBMz2d/992+Hw==
X-Received: by 2002:a17:903:22cb:b0:269:8f2e:e38 with SMTP id
 d9443c01a7336-27ed49b9a40mr61514725ad.6.1758845502387; 
 Thu, 25 Sep 2025 17:11:42 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ac37efsm35829425ad.137.2025.09.25.17.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 17:11:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/10] target/arm: Implement APPSAA
Date: Thu, 25 Sep 2025 17:11:33 -0700
Message-ID: <20250926001134.295547-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926001134.295547-1-richard.henderson@linaro.org>
References: <20250926001134.295547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

This bit allows all spaces to access memory above PPS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 236c3a9569..e03657f309 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -408,9 +408,10 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
      * GPC Priority 3: Secure, Realm or Root address exceeds PPS.
      * R_CPDSB: A NonSecure physical address input exceeding PPS
      * does not experience any fault.
+     * R_PBPSH: Other address spaces have fault suppressed by APPSAA.
      */
     if (paddress & ~pps_mask) {
-        if (pspace == ARMSS_NonSecure) {
+        if (pspace == ARMSS_NonSecure || FIELD_EX64(gpccr, GPCCR, APPSAA)) {
             return true;
         }
         goto fault_fail;
-- 
2.43.0


