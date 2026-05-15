Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1FFCD4F47
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:14:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtHD-00086D-BP; Fri, 15 May 2026 10:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtHA-0007z1-8Q
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:12:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtH8-0004JD-Mb
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:12:27 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so58246215e9.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854345; x=1779459145; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ElGFD+og27a+qig6P/7TdWyM3lA7CN7DxfP82EoGOvw=;
 b=SuPVXQxbBiodBKjsUCJWeQTydIKH4CjnIcGj7Xn1XAg3E8n1CWLRtOfHaZ62jtf/YP
 XWXAivU5rKkTi9lSj+PANLXi7JJPovIFKlStbqaMMjWF55bQz6Kqe2JyTzhGTGzLYEN9
 9qqCUfQr7CfrasjW/FjH9Xp8ZJM9q7NfrFw69hCLw7ozn9efp+gCA5Sx7/Lg9CowexW4
 x8RAITiNADIgiO//VpwhSeZQfAfOp5R4LwPYkE25d9ZWz2BzwjMEdY54Ko9ZvyY+15Wc
 EOxHuGDHKC05dx8BKENy4pwdO50P9NEXfh9okYrSkJvrcFOFJGTDA4HCikzjyHM8vAnU
 7pEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854345; x=1779459145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ElGFD+og27a+qig6P/7TdWyM3lA7CN7DxfP82EoGOvw=;
 b=mQze+dSbAyTxBJdEx6sdZNPBipb1sceK/1XPXh478SxwAVXXCBqHkZ/4cCjLN9ppx4
 5NtjZ6O7uob5Eh4wqRw8uOyG2LCA0ivzP0WLos36uOD7eyHoo/bTkO3QZRgxGQGuX+0i
 43HoKjTW5XvEdNLDQoFonSKerBJxJbLjDAJipMtTn3TJRxeBkWEWlhnn8Q16+mSbd/7S
 WcldikMRhGNj0xczGyrYy5vzXxicvuxN4yO0s9hU8L+mqq/7jKXQ+90L4jU4dJ3v75Ia
 q6d5cTdACyqyo7v3rpzJPUCuBW2PPiGk2qwvdPjE/fuP/82tnwplxPH45JDTMrxwdS7q
 Losg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/GmKqf3qLxYmTED98IZzrJBx2NjiadelgnewcaTzd7C4dRCM1kb3dydBkjXHeKTvobopElWAhqTg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8AwAe/jVbph+n3/+LhlO4wZEJPyjxQ9kyxkfmPXmht1YszpIU
 XtmgEsAZm21R2z9pJbkYR3gdMFKEHNApBpS3D75ug2MF8OAQn3fjcPWBU5LHAgwRamw=
X-Gm-Gg: Acq92OHYvdV71uM/YClgXKwvHLuFAM0gbJNMloC8NnxV1zCGwrnFt/PwmD8tbu5ZDwS
 5Tov9ONTwkFL+EpqEZv13Y0bBDciEMpgwiMIJ51+U8CXhJTjI5cAyZRr64nUG+KZ/UqigukSS4G
 2zyq5Vg1trAkQ3pIE1e7M9IbXV/2Be62OL5UPo6TCikFp2v2TB2HHL4jmdp4a0AAMrBDBngDxO3
 9VugRQ7GLU4dDmvNn4f5PmJuP6/2/LcUT/ytefnYX6PH3Kx9MENazJ6uj3Ocm8ZE8QgOHbt2Skl
 VP+U583fhM3iUVQw8bJBCt4tqxCihlR44Qoqtjxj0/VOpF6wTmjwVJSaY+GE+LyAiCIJzmnqICF
 jkFerqTF1RDgQmt4zn4wnguLySiyHizf/yPRtH5qVYQgRUpyyoRpGW+Elev2E4llVebBPd2kPFV
 4vhm3vu0qrLDplCCh4NL46uxF2cK5f0dj23sfxVroADcKdswKGAaLL590LYcjIef/c51XVq81j
X-Received: by 2002:a05:600c:1389:b0:48f:d1b8:9a9a with SMTP id
 5b1f17b1804b1-48fe60e515cmr56940105e9.5.1778854345206; 
 Fri, 15 May 2026 07:12:25 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c833fcsm61741655e9.2.2026.05.15.07.12.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:12:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 15/20] target/arm: Only set %kvm_target when KVM is enabled
Date: Fri, 15 May 2026 16:10:26 +0200
Message-ID: <20260515141032.3271-16-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b38a78aac3f..7b2f09cf8ec 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -701,7 +701,9 @@ static void aarch64_a57_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
+    if (kvm_enabled()) {
+        cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
+    }
     cpu->midr = 0x411fd070;
     cpu->revidr = 0x00000000;
     cpu->reset_fpsid = 0x41034070;
-- 
2.53.0


