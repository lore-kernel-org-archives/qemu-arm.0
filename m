Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860E8EA71A4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:19:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Ry-0008Iv-PW; Tue, 21 Apr 2026 01:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RG-0007yC-Dq
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:29 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RD-0006Nr-I6
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:21 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2a9296b3926so21948585ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748458; x=1777353258; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kor/kiazYWS2SmrFhEuLicDn7WflikUuqZMwHNLbJMA=;
 b=hIBQR1dandDPBrTshfi248tuvCd+9wFnLnSShrDgZ1m7HLuVFMljcKiTW3ApDemx50
 v5BfazWuz8E2ZhQOO9e2DWxANasf1lLECZpN7zKc70x5jVJR/FPevAOLC9souQor3K+C
 u0H1fCCgo2ZcY0mEZQt0gJnPG0b10zdDh7RCLqpqMbMJq0hByNI+jhOMKvDkVXhpWw6R
 uMNtF4vPHZWKz2buz/0oYDBbFafDf3AURjXLa1NIXDlG7vd6VIPBdjs3x4q8Swy9A7e9
 NkOpqBS2aP70G/6xY2xTPTR+6niYiSgCY2emckhWBnBUi3t8JoBlQgL1fWtnf+Um3Bxm
 umng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748458; x=1777353258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kor/kiazYWS2SmrFhEuLicDn7WflikUuqZMwHNLbJMA=;
 b=esom3A85Eet94zqHRah9Ye8NyIZ4VWzU8cCNnnd7zfSrPpgppZ8FkGaUpDONvFTWie
 kW4twaAv7wUzME8lD1NAmVTT3ssCVQduGdX4cECjJSVolp2zz6QSvgEIjenPG9pP/Av+
 EJisSNeG321FmvgeBYPugXTopQvMV1W+4Ov/uH33MTldkfQh2udBB5tNW5hBs/JqVlwx
 dQ9hn4tnnq61vj2AXOoJiLXELJWLtQ1Co4vuE/VdGMYDi0pbFI12idtCl+RLCpsObZrh
 23L0OpYmz9CGpVFj5mhBtS07CHCLfgT8f1bCCa2u6eVkdOx5tq/gTZne6uw8vklG9pNA
 vjwA==
X-Gm-Message-State: AOJu0YyM7mxrUaBJzhLIMgtSptIPo+rC5a8wXRlte8COZIo9K9Qgp2QH
 EVwrTnEheMUvyEdesKHGrPbmiQDl46zP9IidwPudgrAZwP1kfJ78nd2/WK6THlm/eYg=
X-Gm-Gg: AeBDietJIEU11Nh9Pi0UbgZpSETkMCPAxknnFAno/wwQUJoMY1SNXqnxeMmkM4TmoD+
 6ZuOskvDIHzD4OmLH3yXGboMPYztDaC6aBHilMQq40rM1BZYqvGh8V0jNFo+wdrKy0/oKmiTuTB
 Ri+zGX0IutkkHFFwzczxSFBvYstisGydzXMx/MsA43XYD2nQ4xPhtzg++8f09lF9iaDA9LvHZ5k
 7Lp+7WCRNsUi8i7hKbwF3mUw920qFfIrIZYjjOSkyBSY4UMbBxw1Stdbt7g54J9oJHGhdV03MnE
 LnAE6IxE3fO4NEewLovOfXvo7bn051zUc7ulGY9ry8fY6vEIHJp1Qrw8lfMpfz/puIG54qTlbX7
 rjGrdfLZLTa0mr2qtHyb2iSJl6N3QxDwdQ/nHAoleGbWVYlfuoXlTOQjTI8cZwZAU4L1yutI9Qs
 DAaQJ9edKZmxDUOFVY0C7dEjPvyuw/XBYwUHsE4vNW
X-Received: by 2002:a17:902:d590:b0:2b0:608d:d8a8 with SMTP id
 d9443c01a7336-2b5f9e8e4a9mr163007925ad.1.1776748458079; 
 Mon, 20 Apr 2026 22:14:18 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/37] target/arm: Clear FPMR on ResetSVEState
Date: Tue, 21 Apr 2026 15:13:20 +1000
Message-ID: <20260421051346.41106-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

FPMR is cleared when entering or exiting Streaming Mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 06b5fbbe55..6ebd121050 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4913,6 +4913,7 @@ static void arm_reset_sve_state(CPUARMState *env)
     /* Recall that FFR is stored as pregs[16]. */
     memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
     vfp_set_fpsr(env, 0x0800009f);
+    env->vfp.fpmr = 0;
 }
 
 void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
-- 
2.43.0


