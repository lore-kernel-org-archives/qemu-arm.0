Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB51FCA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:08:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkPg-0008JS-RY; Wed, 03 Sep 2025 06:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkPV-0008B5-KQ
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:16 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkPK-0008A2-Tt
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:12 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b79ec2fbeso42993275e9.3
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894081; x=1757498881; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2DEdnXetstwiME2PMs47ROkMyVNCZIiKy5VUOukcBJ8=;
 b=KqVo+Maz2mXpYYxxDjA6+Io23lh63BA4oOFFmrk2q/LElsL5f6fRZUwwH+pAQwGtbo
 OaNXkK+ba6qozCB8B8utOxj19sNmVoSpT6iZY8coflr7mjLw33FuD7HRWnzsupErXY48
 bohEJlbwCpDG/2j6c5nZmN5grh7nuCBZByJMjNH5MVK0iqNFIpidd70p2qH25xVrFAIa
 V7DoEc0YFPGB43oDg2L5CXWYTcNoIYFhwPrI/Wjcdg9zVT8s4yEzt7OiGdQv+4sRCfdu
 GMGg+Bwnsd+ohGwBTS0bFZSNOpEmK1RM7dvEbosuLFZG3i8Ni0D7OkBhtGQp/kc3Jv9T
 HyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894081; x=1757498881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2DEdnXetstwiME2PMs47ROkMyVNCZIiKy5VUOukcBJ8=;
 b=oqyCLPky0KrscGI+rjDXMfisxOsAiDB/iW1tuWU1Pz42P8u3PB5Bg5/B1bLcdQoQJZ
 tyH25rF9bMIgh1nhXRJrPdkpToZfEE+1IW4HCLb1bBclRrDmbBT4bw7RC0p07XtUkhHA
 DSqL03AVO5nzruDUSvAJ+FIi/ydTKl8W7YauWBpkjuPlcz5rTQ3U2D1PMX8+gWe38Qoj
 zSJDm94hRSgILQzPViRSSHTsBKCve/FBaABqR0KDT9t4cU0rQnM6a5Q6+K8V3XKqOQ2c
 38rITmtnq7oAXcw7A1MCnBi3SYHlft2sRgv+hJ+1zyGOVFW8GwspyDmzsaEK4Gs3gXmF
 1kgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOLmLDGFIE/MVCXxKPlVG2o1tik2cu3LMwfyzOEfuTt4bls/Ieyai9XU2aoRqos4gRVICiyJRl3A==@nongnu.org
X-Gm-Message-State: AOJu0Yxe6BNMEgXxOW2ZeD3BM1K2Qywofi2uXs4MIt0sDY/ON5EYaKq5
 zVw4+P60stn25FtJ8cDSK/78ZKgw2kA5MVXGSEtzvK/Pdy5JTJ/oBKjc2SSuTFuUAe8=
X-Gm-Gg: ASbGnctRnBY9leUiui9kpg69MyaWh70rkvGivJ1XWH8AMM6WWtWSK5YbxHHN/akvnlK
 yqb6Thy80H7U2Ii661AnZEh8T/9czumPzdWJTf9r56P3Ph4OYt0nSIswCk+QltuEsZkYXoItVGg
 KSpqU7M8Ne2ZeaprUEZRDhFmHGoIO81FQhlgdPFAGpoF5h3NjCiMk/Iv7F1a+tlkHngDSex+qiu
 A2jHV1p9W3z1nMmegb6yFvQaa8phvsIEUjwaXg+wp4IGizIHLo0XSRHKhH7HO5S8eLc/b5C4Huv
 ImOMtpUWgdsrBPnFeEfxlmROIWW+ZxLLotDbMO/YLjb4opwrybqqn9xjBQLkCAgyebxnZ8PPTNO
 yKtgWMa52VdOF2U0DlZwsdPFYCghbqKWD9BldPz8vIyRVWyzN+UEenIr8W/ACnDoywlOWllTGdy
 Fbt4b8Vg==
X-Google-Smtp-Source: AGHT+IH0sZUfnQmTQp0oWjjR1Ndf6XSsEI1Wriw4ISiO4FOqTOUjqjT43dbZ41Li00nA4nDt3osdRA==
X-Received: by 2002:a05:600c:a46:b0:458:be62:dcd3 with SMTP id
 5b1f17b1804b1-45b8558a78cmr139432685e9.17.1756894081370; 
 Wed, 03 Sep 2025 03:08:01 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e8ab093sm245312015e9.22.2025.09.03.03.07.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:08:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 03/24] target/arm/hvf: Check hv_vcpu_set_vtimer_mask()
 returned value
Date: Wed,  3 Sep 2025 12:06:39 +0200
Message-ID: <20250903100702.16726-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

hv_vcpu_set_vtimer_mask() returns a hv_return_t enum type
(defined in <Hypervisor/hv_error.h>). Assert we succeeded,
as we are not ready to handle any error path.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 65ac0bd71aa..1b59cc0eb04 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1906,7 +1906,8 @@ static void hvf_sync_vtimer(CPUState *cpu)
 
     if (!irq_state) {
         /* Timer no longer asserting, we can unmask it */
-        hv_vcpu_set_vtimer_mask(cpu->accel->fd, false);
+        r = hv_vcpu_set_vtimer_mask(cpu->accel->fd, false);
+        assert_hvf_ok(r);
         cpu->accel->vtimer_masked = false;
     }
 }
-- 
2.51.0


