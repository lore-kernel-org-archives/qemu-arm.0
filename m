Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FE3EA71A4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:18:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Rx-0008Ia-61; Tue, 21 Apr 2026 01:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RK-0007za-FF
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:32 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RI-0006S4-Rn
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:26 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2b24fcc2b5dso24160565ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748463; x=1777353263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/eF6UxrydbmzCRXNoWVc07UBJDv6wjeDkTY/rB2YuA=;
 b=S0O5fUqfJZc0h1mUXKbWRdu3BT9gOHU2T9Ya41lnyB+twSinZNNx310O6ysDF8LWat
 r+uDvNjHTqXmZSrx4CDi80/XZhYPsfets2x/k76QxI0K4S2aF5lsyOQVDlbHOFBwJX7p
 7xAnFTqWet0yUOHGAXbB3y5gFQTUms3o68fg4PUzfiVXcHTkRKY6fvNDVe0ES2Ngj8Sr
 T+k97HXCgJIQKNzkA892kTUk2+fN8EKrDFGzefJMe3awNlMoTh/rqwZ6XxmTYcPE/cA8
 sCUUslPLT5jrtxE7bt86V5HU1zGECOi71Z1GiEwcrpcJoXUhoI0hpOenWWIzdnt6XZ1J
 ajXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748463; x=1777353263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q/eF6UxrydbmzCRXNoWVc07UBJDv6wjeDkTY/rB2YuA=;
 b=UHB3dk7yf6GuRF0bi4H4YnQaUnd+rBhF6wIAfndlednRx4KS1QbLxA2N4GXTWqQFxr
 GHrmChi7kk+jlw1B5ng7hB1t2xuXpDPfzPY/XZ3LPVBx2EPSotl0/P4JZtKdR5xX1M+u
 258Ydrc8LNX/7SVNfj1yERCelZE0Fj7ffkj35omFLepgfNGudF56G0NaYJhXjaNwfy16
 deP+hF0w5ATHlpykzT89r3FrgsdvLxTMSLLQUDqGOcD0QoR7HQ59z35Dor1vnOlvbIcc
 FbY/uKZLJjsA74zjGoHdUOmP1Vz50Rp+AsgeoFe4BjBHwTUQaXRuDXboT6ReADIthUYU
 auzQ==
X-Gm-Message-State: AOJu0YxYZIym1YZUPp2wgY7drULkebnR15HWouBQJbv7MfDASg4OlHdj
 dS4dpTQWN2l49nc5ELWsKoa1vW4gTkXhDaSvM6muW4xc2052bCViQWy9H0sLSR+iFKE=
X-Gm-Gg: AeBDietOxqXS7m2i0vjU9kQEueIx0esS0cClc4PG1rrlB1VNqTtbh3cNUKtGlSLS77O
 DmkcgO9wzI2GPtFlaF3jzedYUj3yZGuveK+nPX7Vpkugtvt2UGfT92sNZM1RjwWXG+QMsclkxw+
 yzxXP4iklLazdzQsMrnZQ6xfd+zi4ocKQ976mVZpqa2t+nTW6jkNxThptafOnjjwJvcYGvuAJ9J
 GEIoEMOO1SNmGPAYcbkC/5uBADGgCVVTKFjGvWiu2QbP0GRWDT6BzZUiJlbj0/ZdnkgCQVC1BZs
 sUHGyXB3ENpWH1n+0JrhIoFj0tY2OpfBmFcl6h/aiUR6jsGsHXEMMp8+JQGZ29JdPfOkjxiY/gY
 y4YHwO7jwpVCHMsdM6jZtRT5GxasukXLzxr5IQBWj1v2pszFLjA+7VHY9ixxgqIrJz+HZF2Day7
 0/EN7W0wSlSXFYPlOAojsTQ4QTJ3zyRJpIOTIQWfF2
X-Received: by 2002:a17:902:aa98:b0:2b4:5cb8:99eb with SMTP id
 d9443c01a7336-2b5f9f8808amr126443295ad.27.1776748462900; 
 Mon, 20 Apr 2026 22:14:22 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/37] target/arm: Trap direct acceses to FPMR
Date: Tue, 21 Apr 2026 15:13:22 +1000
Message-ID: <20260421051346.41106-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ef6038e98b..d132e051ca 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2898,6 +2898,10 @@ static void handle_sys(DisasContext *s, bool isread,
     }
 
     if (!skip_fp_access_checks) {
+        if ((ri->type & ARM_CP_FPMR) && s->fpmr_el != 0) {
+            gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, s->fpmr_el);
+            return;
+        }
         if ((ri->type & ARM_CP_FPU) && !fp_access_check_only(s)) {
             return;
         } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
-- 
2.43.0


