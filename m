Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A19CEACC1
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:11:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK086-0006k6-W4; Fri, 14 Nov 2025 15:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03T-0007za-8w
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:05:59 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03R-00055n-Hd
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:05:59 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477632d45c9so18305065e9.2
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150756; x=1763755556; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4UXacg8QXXqCJVu+ViWlRptMSM7MqADu/UIOis6wkvM=;
 b=CEf/h3H4sxyJtxdWzhjipYSFRAwUTLpSUdvUGpJo7OGuqJWt3OrH5Isik7BCfJ2PdE
 6u+aHtiPwtp7uClOMni6xMAJfJj31MfRQdAV8BfpqJUMzXJkI2GkWGNWGiwuWW5CxKMn
 AVDc8xBOSrJwPE//QNZ8yzKzVEO3Pfb2WsFvbuTb5+6MXFfgonr6rZeWH0XVWq7VKlDJ
 7BIfI4z6OF6I2BepQeIJ9D6xZrt4G4Rp9go0/Z/NfzIKD7/zjoNB3JGLceZGAByb5zva
 AyeIu1THv900rI6zqbvca7muVVXvZv1JsFNfqFQFVZPbs8IDLnta+1f4U5a13y3BGaGW
 u/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150756; x=1763755556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4UXacg8QXXqCJVu+ViWlRptMSM7MqADu/UIOis6wkvM=;
 b=R0TegAHQMNhzz8AUGufs/KIgcQLT9XKWQSju3rVlUaTmgHiPeWI7Hhh5myw5Fr3Szm
 pyxp5LdLC/RNNLslAxJAkPbquvSmsNtMdDx/jC1lp+q3qquvalVNYsNkomLYZz8n3BDr
 JRnbTfKEMLCfAAXAXyGmOEGHHcOXsiyy2zGVyCTOjm2CxQH+HxOfl2zg9KLQS08EuWtQ
 vwPKdow+KeWE7Zc7TVzM4jiEAS6sM1S/aXUXtMKdROF6oBhTkyVLhBbpJr1M8yQq4prB
 wGt0fMnNT7VMNybvcRBJ1DqboVks2lTZE76bEXC7TLfX1wFDbCosvXT6ocv5MIHp6Oix
 Puqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbD5mk4l6Uaio3P0WVM6GsmWd70iW3vrZuSjNshHWJ5XDf5UPtNZxsrJFKwFMqqptl13BDqvdiwg==@nongnu.org
X-Gm-Message-State: AOJu0YzyvcO5cu9EwVapHK8A8hgQ6qhDDuxIkEdFIsxYkBRK3GzDjNhG
 rxm2B5jOnbXg/7QRXlZofruZ7JVxvwNDX+G8Bfu4bevrg69o5p1dwDvA6gNpUn9ATVo=
X-Gm-Gg: ASbGnct+MvWqNDYlBDK3vJcCrJDyqYyLx+X0Z9odfFu75hw1PtSUY4DsoZkZhIPF5bZ
 Q5UggYi24idJOA3bztPE9FeD+eb/jDQ6PDqcDIJIyaM/lhZJyLlsgA/D/9xxXTRVkMssoKe7Sd0
 Cw0qzthlVwpywPKUpROtON/UGtiWRgOzmS/n8ah2F2o3MWbRk3hDqvBkyM6v/nMb5psHZtIuPQp
 BNlug0j1ql13yRuDnsjpiO0HzV5Qs59MVfUida7q8G3oKWFPw/AKUf5VYIadGjK9LGj+ZiGXfEa
 8i/6fXJHIqcEH5HSyPo10d3qzJ1BVnyRzsszY94cN1u1B4p9Z1U3cZS8FrVRlsg3XyNlPNGwijU
 WZtqv91Hc9OgCz/COoxFOZgEj8OZJJ1euKZ6LZE404QOEkielYfaaHRBM4POpWjXnULaZ1P0VGm
 LWj51E3gbSuQOeSKbglaiI2/EUHVXOxtkvvtY/YLDKGmIvrSrPbaIGBEiWJikP
X-Google-Smtp-Source: AGHT+IEARf3ZThoR38zz2G3mdjP23hTUAO3pxkBTNJOegE24DLiZZNCWuy83AM7Op9fQkJeISM0Z5g==
X-Received: by 2002:a05:600c:3593:b0:477:557b:6917 with SMTP id
 5b1f17b1804b1-4778fe4fdecmr45111725e9.18.1763150756053; 
 Fri, 14 Nov 2025 12:05:56 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e2b835sm161692475e9.2.2025.11.14.12.05.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:05:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 12/19] accel/hvf: Skip WFI if CPU has work to do
Date: Fri, 14 Nov 2025 21:04:14 +0100
Message-ID: <20251114200422.4280-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Avoid sleeping vCPU thread for any pending work, not just IRQs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0f584b8137a..5e46e8bf4dd 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1737,8 +1737,11 @@ static void hvf_wfi(CPUState *cpu)
     uint64_t nanos;
     uint32_t cntfrq;
 
-    if (cpu_test_interrupt(cpu, CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)) {
-        /* Interrupt pending, no need to wait */
+    if (cpu_has_work(cpu)) {
+        /*
+         * Don't bother to go into our "low power state" if
+         * we would just wake up immediately.
+         */
         return;
     }
 
-- 
2.51.0


