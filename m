Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113F5CD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:49:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLjW-0001Tr-1h; Tue, 19 May 2026 10:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLjS-00018C-Ks
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:47:42 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLjM-0007xZ-FQ
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:47:41 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-44b330c5cc6so2659767f8f.1
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779202045; x=1779806845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1RNRxHUIKIoHhD2L2k2Kf0WRpvOKC9u30TJYtxRtPNw=;
 b=HFU9fuvSYr0yRESLSFAl1u9Ep9gY3+oE/CdqI6cS0L3IX7XJEn14Zq5GbBdnR/jRBd
 d9YPRf98JiVCPmJPCqt7Fyzq6kdHpfSlnlv03XO/nIctb2B/kGB438iqP/Fd2y7d57Fd
 8d8BFl42rkfiS97NoY40znIku3RpbTR0s47lZGozqVBhUVAISDcZWQdSqW/LU6t5Ns9C
 8y2NeAj1JTrf0g6d8mKm8cFzz8WcFiCPtvTHCQjSEA98pNoaw4oSQ9TCRlCPbAL3QfnW
 CRZcssEFsIczPEZWCTDYQ3nmL8KdszetLClYFW47EOGh5Rk3LxeLyT85ekB/MR5mYVOb
 3HTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779202045; x=1779806845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1RNRxHUIKIoHhD2L2k2Kf0WRpvOKC9u30TJYtxRtPNw=;
 b=EMhUY0LynkmcT8e9kowD4wtdf2ZujJj0414D+inq0LnBAdvUxBO+dwzWhXESG0jXJM
 W2c5QU/VVKLjCc3cM9uUASqzWRrY1JFq7NH/iE9ucOID2HXkPH0y/J+mg5RZw2+Z43C/
 uS/+yJnMeZIliIvXb68qIa90lQ5Nk6eT0fcp9j48uJWuNfmVH9SoKRn1FBJAcnJQML1Z
 Wtw6QUGsbDOQLxM4vGGYK+8Hpk59pfwfdybuMgXAwLTn6XLs5CNiSwynCj9CtACQ9Dzf
 OwJ71A5GHYEMe37gCrxTuzIQvTQ8qCpFQB5UHXUj+xziSxk8HE0QkdA2llRAK1Nu2/L3
 pd8A==
X-Gm-Message-State: AOJu0Yy2so5i+e0HfNsR7vCE3EZj6LItyjlM6YATUK1lsBgKNSRlWNo5
 Yn9ocXxO9Bn2H709pZ2ZcoCgCBKTceXZ/7yZ9XRR0wJg5fUXuybcFS/zt7Wb0oUz5e7UccLvutE
 +Ld+eqoM=
X-Gm-Gg: Acq92OEz1MYksJrNIn3rgR14Qcgf2gcqdBF1BCsc23zhW9aRCMakDlr9ifPSv8j/ooY
 79trd4yAWi3mOm0fjQ9Wh+1bEZBCeooCE2ve7CB9eiyUmUFZWX6ABwQ6KTXllOBvUGGNS3BHhoe
 YnFMYK/U3ki02IVXjPPsjSQw5CB8oE64qJNEJ4i/9Cftlp64EbmzJHNylyRTn1nKcn+lxcjYlaQ
 S4AXxIvWlbP9X2Y4GJuwJUvF/7Fq1RpJOGeu1TqM6+vzHREopE0o1Rmu5VWi0ugeV8c/fDTdGOj
 Mdt52bMxUhiGaSx6WeA36mbiy9jJcYXwkDcg6r44eybm8lw+a5Xtjm2dkj2h00E/jdmF/HNNTyr
 WhQIEcPYLjJfdC8bsKeNvi0vEiZbjJvqyhUVfgluqjvETVQjLU08UtUJfbINKYVTo3JOQFTtrwq
 7FuWCVtpQE6/CNSv+LwFpn5Mv8jFp5ct3YJwjV3xUcAA27k0dUXYtkCnCnq6dMvG/uIj7lClPlc
 eobcwjs02M=
X-Received: by 2002:a05:6000:2304:b0:44b:e349:e6bc with SMTP id
 ffacd0b85a97d-45e5c5bbd76mr30216412f8f.3.1779202044162; 
 Tue, 19 May 2026 07:47:24 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe0fecsm42595487f8f.26.2026.05.19.07.47.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:47:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 13/18] target/arm: Only set %kvm_target when KVM is enabled
Date: Tue, 19 May 2026 16:45:48 +0200
Message-ID: <20260519144553.91483-14-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
References: <20260519144553.91483-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
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


