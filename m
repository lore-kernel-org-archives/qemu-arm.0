Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D067CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:15:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBw50-0005sY-D3; Thu, 23 Oct 2025 10:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw4t-0005pm-RJ
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:14:09 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw4q-0007O2-0A
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:14:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-421851bca51so846407f8f.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761228841; x=1761833641; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8YWr4zExFLVkS/USY8dnF7Z2qM9YsNMJfD7DIjDOS2k=;
 b=Re+VSc/4URZQ/dH+o8iJwGvAfA5CEgfcExw7kZi7D1XFLfj+RSgItN8hJxnvo70S+7
 wHEI0BdI7oqnYOYIAGjJks5+61hy2qInyQPWelFmvdMxK+gdrT8tzyjPI2kB8mBkhtQj
 Jns0hByKyrkWkGBeKIn3MU5onwOsmItoMWDvHqtrFCCacJcb7UJ93XOrD+YJlG9Vqpvo
 J/b0RAAlU+bXYCgoDC3h1zraYCL4eKxR8vIOjZ+YDHyyDr0ysfrngQkSgSoYfP6ZGa1H
 UmALz7YoGz2sfC7z7rA3dLUgEVBP2sWIoTrg6dS4MM51p8yRqZOlJekijGPk7j/aUY93
 hsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228841; x=1761833641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8YWr4zExFLVkS/USY8dnF7Z2qM9YsNMJfD7DIjDOS2k=;
 b=Z/HPj5TdEmc0llPBHA9/Y2qldt9/JT/UcXjEc7AMCU92jrfCZePhDglK7hSIiLf8AL
 /WyQrgT+oohTo5Ok/j/dQ4+SjTmMfiFSGf80jw2mTk35uJTA4mdf7lnCYkZqwKTCDWtf
 BWvZ3/bmWzBV4/EIVasL6MRzRptg8SAEjz+ayMs2jAUjBzV88Z5lA8txr9vzFrmDQ58b
 X45MFoxKBNwCQydb3/dYJA71bjvXT4w+zCelbASjCi7TSXZTYlmuCVQf33Ol3TiS4deB
 RQ8XyaHHZAloHaFlW7LPvlPUMvQxB8U5DHhAeHbID2MCum9oSLg7oywwOcs0D7Be6GjH
 pemw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIBGzDMQzlMd3QEh4LD3SqLcOrhhUJRl2485oNPUaytE9p1itMNpQMo8eQvwvCHiNZNcBmGf87nA==@nongnu.org
X-Gm-Message-State: AOJu0YyGawLZs0K2BH60l+Co9sK3EjnfjBbOvb2D0ZatYzemnlHyk34u
 VJd6JS9OC4GkQl9zqwX2qbJi4U2s+yLLiyhL4rDjX9vgmYGtyMjBlOBrhA9ZP0RS0aA=
X-Gm-Gg: ASbGncvIK94cQGnjphZVVXb74KELK56qyxOduz/LhHdNvGN8Q1tXIQyqaVRplFJm1s8
 DKxQzuUTadl6ly70hiPXdkUGyy9tlJ49eyfIAYnzfVA5oXvaruTRMAlkerUD2LMZedOVZflu9pE
 FOgL7cISDFjkdTM+GpCxI47ogNHOeMG+21k5KO6sATTtHpHKKbIBVSUWuDWysohGGUn7n/t3iAn
 URFIP7qK82+Cx1Sorxozix+Sbcd4d4ynJKH7HI8F2voPKDLq7Nmkbrll6+TvX+0R0XiHW3HtH5H
 YQp06PtTyt88Fje1waK7i21tX8SOT7af71F5MHG1eit6yBl0owQf8s8E0Fz0WEnMlguAbRMpTP0
 lX6qv8SgOp6pfvmGSwuHfmieTZJ3c62EQMfqPib3qpQodx2BRHGCcD/xC0d79bYs8Sh7mMTBPFu
 hpvJk0N9ac6xSrZtNUVQC2ZVzblbFgbHb/suEeqdjg7wLoxeA1oQ==
X-Google-Smtp-Source: AGHT+IE5kJMbKIloHuIF+iO0x/rjaYysicQVlzEsz/rTTGf5wI8KNHrB+CP6oynYwyhQy10+JtgltQ==
X-Received: by 2002:a5d:5f82:0:b0:425:86c8:c4ff with SMTP id
 ffacd0b85a97d-42704d90011mr18488871f8f.22.1761228841290; 
 Thu, 23 Oct 2025 07:14:01 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57cesm4406320f8f.17.2025.10.23.07.14.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:14:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v2 14/58] target/arm/hvf: Hardcode Apple MIDR
Date: Thu, 23 Oct 2025 16:13:33 +0200
Message-ID: <20251023141339.10143-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

From: Mohamed Mediouni <mohamed@unpredictable.fr>

Hardcode MIDR because Apple deliberately doesn't expose
a divergent MIDR across systems.

Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index d13ccf5508c..890e9266f93 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -763,6 +763,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     hv_vcpu_t fd;
     hv_return_t r = HV_SUCCESS;
     hv_vcpu_exit_t *exit;
+    uint64_t t;
     int i;
 
     ahcf->dtb_compatible = "arm,armv8";
@@ -781,9 +782,19 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     for (i = 0; i < ARRAY_SIZE(regs); i++) {
         r |= hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val);
     }
-    r |= hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &ahcf->midr);
     r |= hv_vcpu_destroy(fd);
 
+    /*
+     * Hardcode MIDR because Apple deliberately doesn't expose a divergent
+     * MIDR across systems.
+     */
+    t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0x61); /* Apple */
+    t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf); /* v7 or later */
+    t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 0);
+    t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
+    t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
+    ahcf->midr = t;
+
     clamp_id_aa64mmfr0_parange_to_ipa_size(&host_isar);
 
     /*
-- 
2.51.0


