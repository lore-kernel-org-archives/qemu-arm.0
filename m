Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1906CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:11:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkQb-00031K-Ue; Wed, 03 Sep 2025 06:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQZ-0002od-4f
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:09:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQW-0008Np-Fg
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:09:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3df35a67434so216964f8f.3
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894155; x=1757498955; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9Lub0mG3fK9Mcfaw6km1T4/o3S1e+r00z5qFSzfzT4=;
 b=nS+0CJqD0IYge4vvigSjvvoE7kurW7HA2ybHB0How2UbUVRrz0t480ogMEwDSC4JvB
 CHHYjZDUiD5k5+alOUmowUXGOwKrMKTeGrCsayQGtccDaoPn9b0WpzavLOFs9isWgiY+
 wxgeT40wz+m6upC441a/YCHFFRwR7MP1BSM2l8rcl+bknIU46cOOfdUfrVan2OjIexUi
 NmqIB8YksXAehiV6GwflSChZYc+VzWR6yNmUXNgAY06vifEk8ovEXK2URJoX7RW1AySZ
 5KmhRK3ZXUf0biKSKdCHfHUNe5NwsnVa+iP2pTzqDgll3zwVHpMPKC7r5aOGzqSOvZm4
 5KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894155; x=1757498955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+9Lub0mG3fK9Mcfaw6km1T4/o3S1e+r00z5qFSzfzT4=;
 b=VkThUqbd3yMveBmJTU0nv6IqAwESF0T80Ts4nknNnajE9P3sqUSkpxngZjsIhZeuq1
 cmimkPKL5xQ5qf87dj00ZttZEcw3oiQk+gI8TjCHTvPVYSHdRb7e+D3Oen3CYW/VqTGS
 agg/EtFdkLvTx3k1xkbMYvR41IQfpVy7nCiJvoNGFuhmgn41YBYVXQ9Oka1tOgE8Io7A
 2j7MCeGdl47Aol7c+4f1NisVUezgsYc0KfPbWJCydCcr/5/VKJw2TuKW6UowRCsYPldL
 iS7jldmTOTH7m6c9kN/Qfg1QGqFYgD8cLcCQdzZ3v/JmIma4moF+OXTSzUoVg0+3io6A
 sJtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcMEHqpE2Hb6lH5UTu/Gay/gmwxVMB6rG1bx2Eaz8Q/j/cCmxlpyL8LOafISTYYzA9MFr+McFqhQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw1ysay6ol9jZVslpzWlBo9QoGsFYvL5TUNOMDnKvyY4kUkSE+E
 GYmt3Drc3bVSYCsiLRqYfZjApPmmJVg5/m6gJiB9bbiWzndjhG+Xly8zJs6gjEd8ZJg=
X-Gm-Gg: ASbGnctNBeNksfo2C/zcEJsc9lVFrk/dMZ87QhoFjCU6MIdcz7AnuqCbhKdlLzQMzZw
 72X1CDQcELlxFG8XZ2eh44mktXPQL4U7f0ikJKQoKl+TQZmWvukO1XNeimGi63VCyFTR1e3h0Gp
 uD+NK30tu35Yb5tgvpaA3npqN8hBMess33ViJd0flqkzfnA16o3bffT0qjO+Ml+43esnPwPvnXw
 DA1IN7Caf0qACT8a6VgJTKq/PnDeYFhUWLEWRNqY5E4gNCPsOyDI+jx1i3uHXQCvRmGrx+dyPMJ
 ciVZ5a/dsQB7j0TCFW5R4XDy5ZgZHdJjXJ/VXjCm392DZ4BBAVDMEkn/dEwelovbEAMdnHq3fK0
 nX+ABbb6jkBsPMcbddmhO1hrUzQIhpUfBFCrfqjI7HvLHAPqiYoIYS7qsc5c+J1Jo/CWZwud9dZ
 pFjLlNJ8bwRWGdFTZx
X-Google-Smtp-Source: AGHT+IGF4hIbag1NsKAusk4447qTLxvqZ3JU4x7geZwtSI/vqGI63CV6F3zhhg0ohbVeQ2sqh49LJg==
X-Received: by 2002:a05:6000:4210:b0:3d5:9efa:fbf2 with SMTP id
 ffacd0b85a97d-3d59efaff51mr8566501f8f.22.1756894154694; 
 Wed, 03 Sep 2025 03:09:14 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e8ab14esm254118825e9.21.2025.09.03.03.09.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:09:14 -0700 (PDT)
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
Subject: [PATCH 14/24] target/arm/hvf: Hardcode Apple MIDR
Date: Wed,  3 Sep 2025 12:06:50 +0200
Message-ID: <20250903100702.16726-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
---
 target/arm/hvf/hvf.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5b3c34014a5..3039c0987dc 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -887,6 +887,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     hv_vcpu_t fd;
     hv_return_t r = HV_SUCCESS;
     hv_vcpu_exit_t *exit;
+    uint64_t t;
     int i;
 
     ahcf->dtb_compatible = "arm,armv8";
@@ -908,6 +909,17 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     r |= hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &ahcf->midr);
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


