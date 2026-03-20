Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561901098781
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:16:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3Zi2-00065F-4X; Fri, 20 Mar 2026 09:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhs-0005v0-Hs
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:05 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhp-0000Lc-6i
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:03 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b97a06d7629so237061866b.0
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774012558; x=1774617358; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ox09lJlrIlX36nSOA8lgaot7ry6qFt0dJt6CN6nPMoA=;
 b=sU4T0j5rQj+oBfkRNHDvtITvBCKkewC10WuPK0PZ8UwtHmGiUtLpKYCpP575Xp4JES
 V6rJ6SCxtFxvJ9rP0moxYYatgkAcKdTrzr+4dG6yKqG6oxHUOscSgg7cImQNXmN0NbYR
 R9fgtwd/nrtK3aTCytvMtCKHVFQyAr/xohL6LJ+D9xEe8MMxDuh/s+DxW+miycjKncc3
 jjnB3Goa7iTT4+lxEnxPkLGLmeAh7ZesoYZHksrmttfrsqQgeBKq0urZbmFJDYCAd+7F
 rtROuEYxgNycP+l3JioXUlB/lx/PfEIrIeStdoirwruh+7+fXq2MDZV/5Uj5Bdj1myVk
 QPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774012558; x=1774617358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ox09lJlrIlX36nSOA8lgaot7ry6qFt0dJt6CN6nPMoA=;
 b=a4FdHLR9aV5Bgolcyl83o2ds5dW4Ud8ov1UwcE5HCh89saUoM7T+FqEVGleCxk1txJ
 OZgtmWjy8XKjvoIuRr3LSWykipCFeaeKu1InoQp/Yn64iuuaL7+i9WM+zLpUvEaaV5pU
 N5BigL2Y3u9vHTJS1jcIH2UdaRz7a5h4iNx/pN2LuZzO2ghcJ9XqfAmZTnUa2sHU1oja
 ToXNJTqkzKkiiZKpStxJTbH1fmu3/txlrJ1OZe1qGAqI0QHEqQNbK7aUSNCPni4QEQLY
 EbJq4q3pckaNXNVVWNWYetyLjJUxN+GV/XhEPbdCIaMOZsbVLKvCyGbkpH1kRByuc4PZ
 ZW1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZK6PyR3g9iTkoFNcsEvW6Ks6s0PScRfGU4+EUYlId9vCws8UCxSCYyOABwkE5mzyxV+KnqkmpnA==@nongnu.org
X-Gm-Message-State: AOJu0YyAlcIbJZljQ2TA1UqREhZY1BRVoNP8PO/V1yZ0rToiMRjqODs1
 Dh9itDfFk6ysBC94IgkIax65IiMkK3vLTHSBwv/eQ/sBTx4AzasE/TrnDpBeyWkacqc=
X-Gm-Gg: ATEYQzyww4fQqOGPIR3c6cOr1MKCUNF2ry2BelhetCxElHgwNSkglbLqTv+byUpc1AZ
 hdY8h9RkY0WwIqN5MyTUHDAxxdfPUmxISypi9NyS1cHL8gs9ariAabnMSbWI3MqJx2E88IzfHWm
 hFfYnIGUjP56/zWF/bNKYo6DWNcleDDUst6Vi+en5s1WGk4MjdGgtBAcAo433bdkKIJcxbzS8na
 JKYJIT8Gbdfw/zOirH0qpmm8FoUAW65/pFPKE4DaVJjgN4PeIVhlR6q7XdtXrVZxzikzq8LFbzL
 qPSCOT85t3wqlFVD1mO9cZr9e4bTuIU6qWKFTdoGiqQRH+hZGKvo0t0Q0w7wLraok3xGozitndr
 iJS4OVdRKV6PoAMl553QPyDMjI0+Ra4jGngQzV1N4MLiaSPPIaBqvTyKxZ29svxL0fC74gzwmgy
 01c4aHtdJsB94FHmCcS2QNUd4=
X-Received: by 2002:a17:906:8406:b0:b93:99a8:c366 with SMTP id
 a640c23a62f3a-b982f3df9d1mr182055366b.55.1774012558228; 
 Fri, 20 Mar 2026 06:15:58 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8db2fsm163039866b.23.2026.03.20.06.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:15:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 20F0E5F9E2;
 Fri, 20 Mar 2026 13:06:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 18/35] target/arm: make whpx use syndrome helpers for
 decode
Date: Fri, 20 Mar 2026 13:05:49 +0000
Message-ID: <20260320130607.2071996-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

Rather than open coding a bunch of shifts and masks we can use the
syndrome definitions. While we are at it assert it really is a
EC_DATAABORT.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/whpx/whpx-all.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index 513551bec1b..f5646e7127e 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -356,15 +356,16 @@ static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     uint64_t syndrome = ctx->Syndrome;
 
-    bool isv = syndrome & ARM_EL_ISV;
-    bool iswrite = (syndrome >> 6) & 1;
-    bool sse = (syndrome >> 21) & 1;
-    uint32_t sas = (syndrome >> 22) & 3;
+    bool isv = FIELD_EX32(syndrome, DABORT_ISS, ISV);
+    bool iswrite = FIELD_EX32(syndrome, DABORT_ISS, WNR);
+    bool sse = FIELD_EX32(syndrome, DABORT_ISS, SSE);
+    uint32_t sas = FIELD_EX32(syndrome, DABORT_ISS, SAS);
     uint32_t len = 1 << sas;
-    uint32_t srt = (syndrome >> 16) & 0x1f;
-    uint32_t cm = (syndrome >> 8) & 0x1;
+    uint32_t srt = FIELD_EX32(syndrome, DABORT_ISS, SRT);
+    uint32_t cm = FIELD_EX32(syndrome, DABORT_ISS, CM);
     uint64_t val = 0;
 
+    assert(syn_get_ec(syndrome) == EC_DATAABORT);
     assert(!cm);
     assert(isv);
 
-- 
2.47.3


