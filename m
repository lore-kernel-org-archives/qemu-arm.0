Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278C4C982F0
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Jan 2026 18:59:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgp24-0001Ja-E8; Fri, 16 Jan 2026 13:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vgp22-0001Id-Km
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 13:58:50 -0500
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vgp20-0000j4-Mv
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 13:58:50 -0500
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-2ae61424095so2602055eec.1
 for <qemu-arm@nongnu.org>; Fri, 16 Jan 2026 10:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768589927; x=1769194727; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a2VzYKViNUvVEcwTta/XWL6992PKe7R1pUg9Nem8mSo=;
 b=fxrpmGGK8zebCfTLfrQENovd2ZWwNhnVTK4YyBU9LdTVwyif7NXyhqhTISuIiGQPN/
 qO+qowvhbn1Hczx85Hay6bRrNg3ZMFkF9KSoqNb2vTaIG0PNXUJzaHOY46eYGwVB2fOJ
 DfXYsEmZc1ClUuHopxk5RKPEKF/Qdgww35/W1eALaQGKsM73ZakT4/IFLdNBfCqUhmnd
 5614dy/o6Z1FpA+6bBtNKYfq2vAGEIbhS+sC44R1tn+C07uJ/8vxL/QXHZdkM+f87uvS
 MurisdnLMeLTYE0fnuckWYIukJYYQH0dI8H36UUWRtX8sZEN/ssZh/Cow0HQU4GWFZdC
 BfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768589927; x=1769194727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a2VzYKViNUvVEcwTta/XWL6992PKe7R1pUg9Nem8mSo=;
 b=D5tC/l3ZqUt9GktYmJTtCLzKSs0aNMrnxs4dxr+L8X5Uw4dLgliqKJiHp0O7Jm5z/Z
 L8s25Ionxm6llY5pw+AC43d3+kp7GPsPEGJKP59R6QceWxsbRcBwU86KUrQLG0CjBdgN
 OfZKLr7HtTsglN5r3o9UBjES3n+FZYPMoQARQdNoiMJfdrQNgwHVivdvyGkUgdDN6Xj3
 SLNGO93TFUjRCrj///0VHxb+q7WbTWiullgbDNTsMHkyDlM4+Q6GL6m+wXdH8cckQNO3
 ZO8rAHceb7tYzwke9WVRuJLLWesDvEKHcE0ld2yPopzgtU+IAkhskBawIHlVcxl1WBsv
 LLpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPHuSJYGcBmUcYKe9TBwaYKcBxoeNNxSmxHDDuJfGlFLzdWLiaCwbB8Kay39cI/vgJ8Us493DQIg==@nongnu.org
X-Gm-Message-State: AOJu0Yz5REKo9OTKruBWUSwHfQzuaGQp3pGVSE/86e6i0i7N69YM0Smg
 Q973o7TSrr9V5TcIBfHllbLtFzkovNgxDLk+veEg6Pzzb36kSlMi225uRYakT+BqcTg=
X-Gm-Gg: AY/fxX7QI0JpekZvryG5P1RgM7y4KBoswu5G4pYSIkxlH9VFtjoSfCDVTVbyIG0ioXQ
 dSK/cbp9mxGW8zDvdTjJRoY0K2I2l1jmEbNhp1VQljyZoPKgvG+0Ejs/4+xuBRp27X9ntpVzhAt
 0tKPsKDVFJh36UVXzRMXo1Us49LMkXoSvsr9WEvVIn9fsOFmOkjRCeqRNDxU7Z7iriLHtq3dldR
 Gond3QDrd3NKL/SiIwFQe173KuRlwKMyeSnrV9NssMQwAP2LQXRC7GyYPD1Fxw2Ei9ZQ+xB0QnP
 xXaelEbnOXri0gMOFNhm0B2bpNXRsp5wcFw1EUJVJfxfktxmnB66dpTdbHPnMVRumeLMR5T3xlu
 /6FmsrHLHHrwGDryKy0EqtP9RwK2oGrZfudvM+5FSv6Ml9cdrwv5jv4pr8jrAeWA8HOdtEQcdhK
 LLmFErQMOmTLxj+hcE3GxFb1SA
X-Received: by 2002:a05:7300:6c27:b0:2ae:5297:4ce2 with SMTP id
 5a478bee46e88-2b6b4eaa7damr3092426eec.34.1768589926097; 
 Fri, 16 Jan 2026 10:58:46 -0800 (PST)
Received: from gromero0.. ([191.8.214.17]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6c2de1f29sm1524126eec.15.2026.01.16.10.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 10:58:45 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v4 1/4] target/arm: Initialize AS 0 first
Date: Fri, 16 Jan 2026 15:58:11 -0300
Message-Id: <20260116185814.108560-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116185814.108560-1-gustavo.romero@linaro.org>
References: <20260116185814.108560-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1334;
 envelope-from=gustavo.romero@linaro.org; helo=mail-dy1-x1334.google.com
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

Move the initialization of AS of index 0 (ARMASIdx_NS) so it happens
before the initialization of the other address spaces. This is purely a
code organization change with no effect on behavior.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Suggested-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index caf7980b1f..9254e0d06c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2158,6 +2158,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cs->num_ases = 1 + has_secure;
     }
 
+    cpu_address_space_init(cs, ARMASIdx_NS, "cpu-memory", cs->memory);
+
     if (has_secure) {
         if (!cpu->secure_memory) {
             cpu->secure_memory = cs->memory;
@@ -2175,8 +2177,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    cpu_address_space_init(cs, ARMASIdx_NS, "cpu-memory", cs->memory);
-
     /* No core_count specified, default to smp_cpus. */
     if (cpu->core_count == -1) {
         cpu->core_count = smp_cpus;
-- 
2.34.1


