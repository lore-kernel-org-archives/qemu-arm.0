Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7F6C56208
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 16:40:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws18G-0006lY-C2; Thu, 06 Aug 2026 12:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18D-0006jn-Gd
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:45 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18A-0000HN-UO
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:45 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2cace91f112so28248285ad.0
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 09:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786034381; x=1786639181; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JQVXlhf8twHyD4IKFKJt8HG/wz/ubfI6lRd4dbnWJZY=;
 b=aT4xbk8ellZmCHbPnsb7esxbNihke+wo/weCirO84tcEwp7xK0qV7KFj4nl7ds4oA3
 QX3MQwTR5jayKh7AKHtQZ8e8hPDXVmS7HiOxo4JEOY+xe2cJuRIB4DLOs+4dgmXtFTX2
 zfxedPzxtEfJFxfY1rlGOFXskTl2LeXS8govIllDC4U961RldoeAgCRLuJs8bgSCbyCL
 IUX/zZivpR+VrK5O1bZTlXm8n+hqVNWA/uHcR/AAEpxuVMsSHIZfE3FE4emTGTHaOfxd
 5vLi4U51RdTb4X2xtJBqIFs+e1sh8nA5sVv0DARKt8zFElrtBsP4CJoLVGuJLFd067wh
 +cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786034381; x=1786639181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JQVXlhf8twHyD4IKFKJt8HG/wz/ubfI6lRd4dbnWJZY=;
 b=e2EfP8SbAXTdhB8EHSRSzKtw6ILwylld4uiImbtvENmxpMCE2C13fPeCtz95iX29EJ
 sc7eBwzkXe+dsmjDeZfDUnSfvh7fYzkCMqkDNzXcSmnQazGVOqOwhaB88q0VhYOMc5+m
 64TkQX2m+nIhN/oKyiQdgfyZl782gkqud6oQQZ3AD/D5ltTgV+Jm1SuOg6VqlMQaYEm4
 S8OhSQxSiuAClA2oy5vuliq+FeN0fFHnMHayUvjX6BKWpnHi17kgsyP4GxPDnUU5LmBW
 /0C2jchA+FSPreMO5tVZpQzlXTwTo31wy5bGLKK4j/WACqMhpeMUj/0gmyig+rrIPd1d
 89ZQ==
X-Gm-Message-State: AOJu0YwgS9G2Lsw3mazz0KhAu7yjWeqswU4SN0blVYHyZVEB9z5ZWqW/
 IVfS+Gu/XuNuwgcQYeBjum/DJGugej5smJYUZzJKI3EJkeIbQo491Y85R4bxZMQ0+ko=
X-Gm-Gg: AR+sD110Q9Lqcpa9sM7fNWZNc3zdfJvpvAZxh8zlSnpa4dO1/PkzOntR/Q9LSK3PEsH
 KuBa37BMU/V9h2N8y4Q/wvhGtg3a8pWdcS1oEnvOJQ4hToySX1xigoea+47eOs3yR69i2dDOFm2
 tbi+FKW3xRFBgxjacEtFPaEgNIVO3iqi0+GFm+gMPw8CT+WYoNHef9ikoJw30PVmIyI3KXLQO9+
 D9KGa2oNu5Pm4Z7uzZwAyPpde7NuTVBjmoscyuYKsUo83++wHdYMbXAAeeYQJvxX2r4ZUZgLSOQ
 tGYC0LZ1ftDKPYaQKEXkX5GIRVUao68O9kj/lBB5G0G2gaAQH5CWbcCHZOiUciVcSpinwSlEz0W
 TNkQBTTJW3K+SVPArV/ClSHalnNzD4AYvUQ2UWskn4BCOb5l/JxdJSyTQMSgR68KFZ9nBjDE0dy
 Zhe/5pH/O0AqmIhXQBwIVZOh9wYLm0MFaeB4ZMLt1RD14XcooKK4lPcHWw2MwoSUyohGCvXvQGy
 sQdb5uI3Ehv0FoJ5Rq5+Voc56rcs1ej
X-Received: by 2002:a17:902:f54d:b0:2ca:ecf6:9104 with SMTP id
 d9443c01a7336-2d0ca711c8emr175409245ad.4.1786034381514; 
 Thu, 06 Aug 2026 09:39:41 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d0aa4ec8c7sm34280735ad.80.2026.08.06.09.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 09:39:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/7] target/arm: Tidy cpu_max_initfn
Date: Thu,  6 Aug 2026 09:39:33 -0700
Message-ID: <20260806163939.328201-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806163939.328201-1-richard.henderson@linaro.org>
References: <20260806163939.328201-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Once we have eliminated hwaccel_enabled, only tcg and qtest remain.
We don't really need to test for it anymore, but convert the if to
and assert.

Remove an assert on aarch64_enabled that is directly protected by
a preceding if.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-max.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index 88b7c04633..089f514bd8 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -203,9 +203,9 @@ static void cpu_max_initfn(Object *obj)
         return;
     }
 
-    if (tcg_enabled() || qtest_enabled()) {
-        aarch64_aa32_a57_init(obj, !aarch64_enabled);
-    }
+    assert(tcg_enabled() || qtest_enabled());
+
+    aarch64_aa32_a57_init(obj, !aarch64_enabled);
 
     if (!aarch64_enabled) {
         aa32_max_features(cpu);
@@ -218,8 +218,7 @@ static void cpu_max_initfn(Object *obj)
          */
         cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
 #endif
-    } else if (tcg_enabled()) {
-        assert(aarch64_enabled);
+    } else {
         /*
          * '-cpu max' for TCG: we currently do this as
          * "A57 with extra things"
-- 
2.43.0


