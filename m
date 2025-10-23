Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33217CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:32:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwLT-0002h9-D5; Thu, 23 Oct 2025 10:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLR-0002YN-2B
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLO-0001re-CD
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:12 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so566338f8f.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761229868; x=1761834668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7QBs13fwIjO7kuSvhwOAAtMaY6vnhC/TwMzIPPo1l8=;
 b=dwdCWWQwB0bHFH56hsc12nBeTLhZyKn3KnnWxv0QlWBno0cha/u7IrW5eOwHAPrxkr
 MGZZSORFv8dwMDpPUSR69pwt8L+H7ePdbtWn3yH7ioPEbE8jhCUF9ZlpERLQz0VDS7Hy
 Tsy5iYEFQSizeIj8hNE4MI91A/bI0jj2pVQ/F9Fnb2e2e5q4/jlmWtjWDKFDGJ/ll9Qw
 Re6bpFR6QvaRzD58u8OBvb5hLO6a/I+h5cxoWd2lsaJjZ9m+5syaEyVvADZD4KAvwPLP
 xZ1yi1NuQRWxV6jn3rOD60T5Ik6mT1Gk6THyrRT9Kufe862TqRvxbwYCXVKTJR0+nAlj
 Y8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229868; x=1761834668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7QBs13fwIjO7kuSvhwOAAtMaY6vnhC/TwMzIPPo1l8=;
 b=Nu12/RkwcYH3dbAOL1GG4tEHbe307Q0fw+UuKTEcC6nI5o9t5yaoZCrGjwErWNcXcj
 HmhinmAPdnZjk+1pIrLzFqZVAq7WQmFbX8xd86mJB/iFb8yGV+7l9EJW6tIBrPCCc9kI
 0BZdDZ6JmWxailJnplM/0T7jEfEmszEuBQlXojXHKvsYhqFxk+TKW6APKjCsQtOnhB6i
 GLDfvTKcuyXsHontI36WZDP3wXu38i/GysVcEia3ErxgpA/1+Rk7lzcADk0Am5jcv9IZ
 fx26fwm1U+YxRpzMSdw3M/TnClaWMeEeNXTmGjRRwuphS4AJSBf/moS8Eci5cNY64n7W
 5jWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7DMF9HADl5G1HB+ggqyh/HvhmGjweZ7KMn3wodGszp9SF9tl0JS+e1aYR53VM+r4DndJr7OZXjg==@nongnu.org
X-Gm-Message-State: AOJu0YwC2rWw4+0OQz/gaFMd61i743+IOhtV6SNpMgsVG0O+ULkSHuVw
 BNiO3nY0uc71ncCAv1eLqISU67pdvrGMRclBiJjdQsSx8sYqT2sgP73aY3UHumb5vt0=
X-Gm-Gg: ASbGnctyrgxezCLLoLBofc69wVOSg/wThyKXb5CR2LvTTwo/XdyLhD2VNbhZvKn32jm
 MlFvz3LrXriIba0cKfySjVqU2PZSBtOgjR7NNhrkWbOsNYFRJ5R9XjZjGTvbOWPRFSKkZXJdRrI
 Y/LM5PHfsxeUSjdyXd8h7HXctLsdKJj6umtasmVqf1rYdnQInroTPZDuwW+UOCHwRQrUH/MJnfn
 x/jQ12oxqSELNoOIF6trZm6Y+PUEc5LBf2tVawpaJWb05DZ4oduDbCz0IyUgcxt1iqgYGCPpMJy
 dfHzcuiJAAFiiJsISDQ7ZvbZrpHYBQiQsume/EwnyYA9UstSbTi7Ma8MS/amJ8NKvSiWKPHGMxX
 ZiKnbA0HZIw2sdyJFo9+Lm6byDPNggPeMX9qyaogVkRmf5j5QGccRqNJ3bw1n8MIefrFxm/cD4C
 AM/q6OrX3nwDuvdYikOx10w8sS38APML+2523ZdxSUBQSyUD2anI6FVyidP6GcZ07jdXbnEbo=
X-Google-Smtp-Source: AGHT+IEFBH2UqisSvsEaSXVNhvjBovLf6eF+c90xGmup8Zdbp61fnyasxTGb0uW7yN5vp2DgZR0yiw==
X-Received: by 2002:a05:6000:2383:b0:3df:c5e3:55f8 with SMTP id
 ffacd0b85a97d-42704e0ee2fmr18050724f8f.54.1761229868143; 
 Thu, 23 Oct 2025 07:31:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57b7sm4275050f8f.16.2025.10.23.07.31.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:31:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Peter Collingbourne <pcc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 23/58] target/arm: Call aarch64_add_pauth_properties() once
 in host_initfn()
Date: Thu, 23 Oct 2025 16:30:44 +0200
Message-ID: <20251023143051.11195-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 26cf7e6dfa2..f81cfd0113c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -762,20 +762,20 @@ static void aarch64_a53_initfn(Object *obj)
 
 static void aarch64_host_initfn(Object *obj)
 {
-#if defined(CONFIG_KVM)
     ARMCPU *cpu = ARM_CPU(obj);
+#if defined(CONFIG_KVM)
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
-        aarch64_add_pauth_properties(obj);
     }
 #elif defined(CONFIG_HVF)
-    ARMCPU *cpu = ARM_CPU(obj);
     hvf_arm_set_cpu_features_from_host(cpu);
-    aarch64_add_pauth_properties(obj);
 #else
     g_assert_not_reached();
 #endif
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        aarch64_add_pauth_properties(obj);
+    }
 }
 
 static void aarch64_max_initfn(Object *obj)
-- 
2.51.0


