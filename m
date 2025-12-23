Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001A0E748FC
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Dec 2025 22:28:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYAqW-0005Xw-W5; Tue, 23 Dec 2025 17:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vYAqU-0005WM-VD
 for qemu-arm@nongnu.org; Tue, 23 Dec 2025 17:27:11 -0500
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vYAqT-0007NW-Jf
 for qemu-arm@nongnu.org; Tue, 23 Dec 2025 17:27:10 -0500
Received: by mail-dl1-x1229.google.com with SMTP id
 a92af1059eb24-11b6bc976d6so9472744c88.0
 for <qemu-arm@nongnu.org>; Tue, 23 Dec 2025 14:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766528828; x=1767133628; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ux7V/vcnfKVnQVQzXuR5cKKTLtK6T4UuaelCSQB/P7E=;
 b=HdKK4PNgm3qBR16Y9TyYu/kNDw6to1oCzlr38Yy7W38T06RwbvT5cnDWn98RYU1vxy
 Ws9BYn1nW8vOBdLy8dN7QlQ/ZxFBrUj4h3YT7UBWMJTPx/TL25Tz+sVVbw1T9qKXpW/Z
 YIwE27SlVmRrvdVQLWceqRU0yGtN5kEbnPQ92LxbPkyx5upvnop6AE9EkgGZZQypTIHO
 rpR6sTzRmmiJR3W1G9j5QgU3wAAeZ1I9m9A4tNVc+RCAIFSL+T8h8Do0hhFwDNIj+i9F
 ZQ4/yryfAe6SZFP93IN+ivyqGBau5kvl2hgHXTWgAdxAGOSLlBNuLkPXbEtXp/DsRtJy
 JfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766528828; x=1767133628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ux7V/vcnfKVnQVQzXuR5cKKTLtK6T4UuaelCSQB/P7E=;
 b=RISKzPGk4U2z3aWyLs2l6IOtTFHIzxhwIeatwhM4WvhKl5NHN5ia9ATpgm+BCNdg1w
 cBbv6+wpKjR3BbUV5lW5zWsBSdC8OkQw/SLP9qvOhWbBoYKC1bnNG8NVlI9thLUJgtnH
 TvcGOlaY/Vy36oNeebwmqK0YMOVTXvokzyGGPFuVModlKFtJVIbc0D/Dk1TvBDCdFE27
 hDXEWV0ewQmMNBN+wmzjAYhviINrMGjbm5MfkqGejGhCDRqruNLa8f2qOhoo1pdEL+Yp
 ugmuBGMB2VW7MMlOHV71+KEel+/nFY9/ImVHGbnWugIRt0z2JZRTWqCDpxgbVZE3YjYB
 9/dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe4pFhZUqtxjj1QQJ8DOvjiR9NNPZMoU8c5bpmTCzxdRhZTHpyNZpgIZkzMv3WlhpElmfuoiWK9g==@nongnu.org
X-Gm-Message-State: AOJu0Yyq2AZnFHlx0L781EVLsI3joCP2bCjwTaYndh4HXGykB/l21QMi
 uSw+oG6lmGz2MjQ4ByawJ6YkUCemVoIG1dosklSizFllYAB6mVg9ShCstC1JHZkL9Ow=
X-Gm-Gg: AY/fxX6LznhTUkUL9mHhxXJnvWyMDmDEewy8JX44IbGzeZOMWHdb27vHdtkJ/LYIFft
 w7BQJVI8rWYEmJjhX4zvdNVun7Nm0W72C6pxSRCvrEdyBMWUf32X/d88+FAp02shk0p0OAEXmqi
 eDQ+ae1RtCbdTw3ZnbmGykeTx0xBW/tilwTxJOQb3+J4gk3KqpakPJZIqS9NiXyKpCR9jJDSI/C
 ox1oz1ktwcAboybIAtXbG6O8f5RlbZByKvbEcEhf4fGowb2f2Bzn1UAOOTUD8vqD/5Vl/0Itt5P
 7ZDpLL8Ouzbz9eoYuanj8W/YTi4EgxNL0rQPXTnTOqim7NB3uiqW+UZj1oDXCizr0YL7wqYSMmt
 Q2JbiMkZQjuRpfFrz0XLeQ9sten62GkN2yWyLNCqlY/KTckJEv5UyVmp7hfb4Vn9PbbTj3h5Xq1
 QsoqA6oLypWYJ7lLsB
X-Google-Smtp-Source: AGHT+IH19+EvTqHNNFtNuRaE7xkCgFwDqAi0qHrZYmTJQ7d1jpYQGp39xBAw/i70s2RS1toCOubYew==
X-Received: by 2002:a05:7022:d9a:b0:11e:3e9:3e92 with SMTP id
 a92af1059eb24-12061991f3bmr12231854c88.23.1766528827859; 
 Tue, 23 Dec 2025 14:27:07 -0800 (PST)
Received: from gromero0.. ([179.93.129.179]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217243bbe3sm62803123c88.0.2025.12.23.14.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 14:27:07 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v3 1/4] target/arm: Initialize AS 0 first
Date: Tue, 23 Dec 2025 19:26:46 -0300
Message-Id: <20251223222649.187935-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223222649.187935-1-gustavo.romero@linaro.org>
References: <20251223222649.187935-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1229;
 envelope-from=gustavo.romero@linaro.org; helo=mail-dl1-x1229.google.com
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

Move the initialization of AS of index 0 (ARMASIdx_NS) so it happens
before the initialization of the other address spaces. This is purely a
code organization change with no effect on behavior.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Suggested-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 39292fb9bc..1640b20b4d 100644
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


