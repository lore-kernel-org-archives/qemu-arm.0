Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B661C9EC67
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:33:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFEF-0007kd-O6; Mon, 12 Jan 2026 05:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFEA-0007Z3-Nf
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:51 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFE9-0001y4-5y
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:50 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-431048c4068so3049225f8f.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213967; x=1768818767; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yi610Iff36R1meHawrJl8o7aP+kuOQieFdALRJG5fMk=;
 b=uHwd7mSJO4KV+3p+shCXRZbxjuqG+QzFhQikOHjKY8vs2N5FwEzjAtuvcTCtFfcUt+
 iIaHAzoqSCZ/SkEzTgHAJYwc3GFM1As5iG6uqWe2Hq58W8w1QrU2zx6RNxVH9dtJJAs7
 E6E91S8gMAcjL4Sbp3RwNXkQu7kRzg/2TR0/TSP3yNkL7jXn7A1W6anzO4GEVGyM/Dxi
 luVgphGqCU6aM3Zc/gk7iiZIG+Qo3PdN0/LyQgDMYmcE7tzXpGbPOrsHv9kVD3cj+O57
 vyrcKbeVE8jGzMupCQQ8iPJlbgm/s++Ax2FSSvV3sJXPtMeiEK64rv8y5gLuqQkHQhw6
 FpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213967; x=1768818767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Yi610Iff36R1meHawrJl8o7aP+kuOQieFdALRJG5fMk=;
 b=eQgKkwoE+kdxVOETemxhsYDmhD24zLd0z9L0ZN1aq12/r8MIecnCq7baKqocj9NWVD
 QEuRQKV5knLoXeMwlpD+a+kNEhnHlCnof9YXnAlWEcev6oUYDeHla1Si0YCcsoXEusx9
 qzwL0laUMlHG3u1PlALiNxxDOWqG0b2HdYkVpQXafTI3FE8M67zXBS77Nu9MI3EG1tis
 IVT7Ki0PETuqNq9RMmn2qjsJt8N3TuwDH+/sW3FC3FR0ca+1yaUfe5UAmtdQn11pQ5Ex
 DrKPw579/n3ktOGV4X7hiSgxnpzcZDrHXShY3Q2fQ15HS1cOOMdXkwiRgghWJCxgCQea
 /v0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZMP5ocpxnXs/fz7rm0Yt4YxJOJfmqEZi0ir9uP9zFVVpQloCkoKFfdp0+wZmm9qHbpCSbdi49Kw==@nongnu.org
X-Gm-Message-State: AOJu0YwpyH9VDpGmJbptURRLFhsybVAnnQlHeeHXOXTvGQSTr5fW5W+h
 YItfrXrFT99OuvlMB+f70gm1/pH6eNdfo1TMqka40oksyGIrMjSWZjTGt6wroqpBMVA=
X-Gm-Gg: AY/fxX52gfmjYV2SlPT08wP/QFF4fQyx/KyGim8OwPWxhRQA9Ti2vOY8vI6rjgoQiPp
 V17gTE+LhKJyemN+al79/GoWah/vEE/DVuXEYfiijo5k6PSFh868KTL8agFhPVuKf/9qTVFpjTC
 UxxZlvIkEyOCTUHCt4bIhcx8Q50KWJQebdzC+9HRm9kYcVFjQZQ2mRjn9jjz91JbpKAw9UWX5M5
 N4Cr4kPFgLPmcVPCElhSJwCE8KFjulZecJ81pkoBQjRSIIOrqT+/x92RBz5I+TiYnZ0nzRlkRbq
 0uD6LJAPVVOe2k7M8L8O9H/w2QCHvC/l49QXM48inXFUxZal1SF6Pt7ZzM0d0UQcHvAEKSv2v8Y
 8KT8iQp0XPmf7ZIZ7zm3DqnG7mhu2t6mMJa79v66umZWV6PBwARnK2maBJh+qA5kbmuLPgL0YeA
 hNJjvJ3xj4PT2kNgLbjb98OWMCNpFpMbCH9netfPITYNfKpdbDWf7z065yNuYr
X-Google-Smtp-Source: AGHT+IEquge7pQgNftHMqxDhYSqaA5qSgQc2zbRqg0p+uHgbrKs5zaILl9asfJozY1p/Zs0HpN7Mfg==
X-Received: by 2002:a5d:5f51:0:b0:432:84f6:827f with SMTP id
 ffacd0b85a97d-432bcfa133emr25428395f8f.9.1768213967293; 
 Mon, 12 Jan 2026 02:32:47 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e16d2sm39252711f8f.13.2026.01.12.02.32.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:32:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 19/19] target/arm: Only allow disabling NEON when using TCG
Date: Mon, 12 Jan 2026 11:30:33 +0100
Message-ID: <20260112103034.65310-20-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Only allow disabling NEON when using TCG.

This avoids confusing user experience:

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: AArch64 CPUs must have both VFP and Neon or neither

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: can't apply global host-arm-cpu.vfp-d32=off: Property 'host-arm-cpu.vfp-d32' not found

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c1087bf5b92..05fa3339b1a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1460,7 +1460,7 @@ static void arm_cpu_post_init(Object *obj)
 
     if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
         cpu->has_neon = true;
-        if (!kvm_enabled()) {
+        if (tcg_enabled() || qtest_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property);
         }
     }
-- 
2.52.0


