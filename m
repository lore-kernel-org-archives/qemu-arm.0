Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE24FCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:53:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lfb-0004PV-KH; Mon, 22 Sep 2025 14:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfI-0003hY-Tg
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:33 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lf8-0004wS-PW
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:32 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2445806e03cso60742085ad.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567195; x=1759171995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/+MTJp0FVnVyO2Dilom7VZKL92xrFknYdg/x1N7080=;
 b=AvEVHPYzcutqp9rEGsI6DmDCAn6JOrjaLrdxXIe5/dqP8+lW2znD0ZIhpK7Smgl2UB
 EafwYSyg7jaR6mczjIgYgOQBj9eN6v+RMVnAhP14+5iJI6KtyIlJhn4WOG036acDYHpE
 8xk+QCnYebleVLMT9kZWCnRKnQXHY77AwH4G1jGqIUQ0Ghy9fm9bMKLqwv/zlstSSwcV
 rGhjC7tIdQKW1KbcDUPkCSD7lcEVqVmA0Ry9t40lVFVR8gFgDRqAQwt5rbUGrAwAWnfp
 YR1u8yJANnr6h/F3K/SJPg53aZx1YywOr8Ct9d4mVH26ZYSWaD3lQTW3hRXDCnqNkXjz
 tqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567195; x=1759171995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/+MTJp0FVnVyO2Dilom7VZKL92xrFknYdg/x1N7080=;
 b=XQlr0NSKYpwjog9/iHkzYvzjPVsZOy8cC8c8KGxKCmeYyfhgpwYRzHyLLsjsWuNg96
 7VFsV2wbmqT+JZ2JwVFn69XOk6QilySktTip0KBYTsiHON67musZMu/nfviZDnhrNNDx
 9feWhZd4QSrAK/fArGTjEpGzcQwqV1xgcFEMt7kqLZzwwDWK1jRiGCOSBCBXsiG6BFjG
 0pz6AvgR7k1temSsvkvRUhVFz0ULZ6n4PQ7J2rInP1laEl1rFQFsOW06cZIJDrtqDGjT
 uHzHtcje5Wk8w8epq3jDDI1l+Fj31fNspGSpfdI3NNt8YibdKdpxMc+IiS3E3Ti4R+6z
 gmUA==
X-Gm-Message-State: AOJu0Yy47oyz28xEedg1Yc/WHVLzISk/+lYswMHF+oAG2P6ZV8Xl4fhG
 t08d9huMy1+auMrwrRngQm4739QjCULVaUOPhUrsgDYw6WjNWphFHQ8dVg/jwwSvOtSeni0u/mY
 /Bmk9
X-Gm-Gg: ASbGncu00LNFJKVEIQSgdMLt7ctXzp327T/p/dc0h6iaehm9FaFORdNABkTZNECfEgj
 BldEn5lgsUYl9Ycy4h3ahUwmfgc6zpr8V4tY4TQxL5roelXUQU+uze0caJtSxKsVmnzifAIfSSQ
 nurT6NqKuJvFMPuxQH1A3mzGV7oC+GvTJLk4Cbn/2Yuja9RTyqieZbFcClmlrhqg33dl7FJpHDp
 XjPCk/z1XZT/5m2GCfi7QiEze5vv6hCrouF8Naa2gaMnUl532hAX+siNbUZ0tkLzwNCH83N9cGK
 DpU0wDH/varp8DSDS2r2acitUrQESTMOZ57QT327ZSgYZFhYihXgox/Ma4vLszA3wmfyKk+Qt5N
 lP5k9DFcd29Dj4nxPb2PG4UkQbqtK
X-Google-Smtp-Source: AGHT+IF8q01WYMf2ytLpXH6ORmO9Y+M0xrI2gRQhsTZpJyzz6v3961fWIkQRu4zJ6xX66aLy9BZQmw==
X-Received: by 2002:a17:902:ecc1:b0:272:f9c3:31fa with SMTP id
 d9443c01a7336-272f9c33570mr95270645ad.9.1758567194767; 
 Mon, 22 Sep 2025 11:53:14 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 42/76] target/arm: Use arm_hcr_el2_nvx_eff in access_nv1
Date: Mon, 22 Sep 2025 11:48:50 -0700
Message-ID: <20250922184924.2754205-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e3ea5254c5..8b5ae0c543 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3423,7 +3423,7 @@ static CPAccessResult access_nv1(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     if (arm_current_el(env) == 1) {
-        uint64_t hcr_nv = arm_hcr_el2_eff(env) & (HCR_NV | HCR_NV1 | HCR_NV2);
+        uint64_t hcr_nv = arm_hcr_el2_nvx_eff(env);
 
         if (hcr_nv == (HCR_NV | HCR_NV1)) {
             return CP_ACCESS_TRAP_EL2;
-- 
2.43.0


