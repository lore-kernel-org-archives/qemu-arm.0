Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649A0CD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:22:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZ6-0001RB-Kr; Wed, 20 May 2026 13:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ0-0001Mk-IJ
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:34 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYy-0001vD-6b
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:34 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-36931e4f5e8so4454795a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297510; x=1779902310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Qae3c5BjQ+dTxdzUKGbagRfnMHB9QZdBYw5eqt/8KM=;
 b=hKDKyIoBm6s84TFjKpbOa970eNBog+SrJNa7bg0PravRqEJur7eekcSghJq7QHZepR
 co5J4+LQmJoAbHGSWBWVTFK0yWi5alI/4fWWSsWZ5SKGhrqk9jcMh/9VmMsufc18rR1D
 aLzJsTWfwwX+3USTiBss8MvrJNJyHKef3Hy4v1Je2PKPLQwE1/T6bJ0MN6jmDNKY/PvP
 cUqmDWQWs7bx40kdgkqXmN103wYHmmYq7czy4fF5kQYP09h5JkimIWifD0W8km1/w5/6
 D+BurqtN2H3s3Ex7wxHpLqoIW2JMM3cDfZUJA3qLuEud9cJzGudWObxyw6f1xwXNdk91
 LqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297510; x=1779902310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Qae3c5BjQ+dTxdzUKGbagRfnMHB9QZdBYw5eqt/8KM=;
 b=kezbddLkm/5f5LPolS8NnYJj6hk6wP5PNYA2vp3Q9T2onR5dIXXsGtDnpV01E+gFgJ
 n1lpMNloNzzzQCWhFKrCPTYHPEyHkwUWdeDrIhMJjSNLgkLrqYtT9m67hrAN/7HELdbK
 6v5GjzMDf3iEI8y2IN80r74e7auofw+sxn45FccqSl/18+FDKZWGSteONt6bV5eLF0+l
 /vQWfqdaI/maJIInKAMZL6jv4dFnUfrUkNAqTaAdHlxeg6RyIENetTOOiAhsYgPGntFh
 /d2t8tM5Oz3oailNMO/ZaH4wGT3ITk8Gr/GVkjYYUNzXeI9Bp6SItuw6SbYbpsooZ0lG
 UAKg==
X-Gm-Message-State: AOJu0YwnxQ9gaBy2J9BYcEpR7ZNjwvh8nBREqsrZ88rmQabdUJQuSkCn
 8ymlyGPf/Jz1qWBBqMli+p9Yt6LV7ZhDbyhkqc2PD/aLLBGqXo1yuhF2oX+0A8m3BRx+rq1tgOX
 XFcoXBbs=
X-Gm-Gg: Acq92OHdOHQGGHgSZPELlzzJgPA//fZFcA7SFvPP4E47AGBvLP90gOwK4PnigJWMbRY
 R4fsjqvwddtn98+KGL3NgW7vYuKjeNd0GJQoN8/b/wj50/q7P2fdercbN02rftKbs/B9p0jnA0j
 kjek9JVXC58he2XCe7N9XH6q4M+YEIFpSGE9zZ8LEgb256SEinmGfrw/NXwVyhoc28bR39NGakP
 wFBNhbcFREFdDzVDQhWyWpMSE3bsjuE5KX1RyUC6sOBMQ03NfsP8xNoEBImYv659p3ZwpdO8o3V
 v+HcvpwddIgTECoFrvsE62oahNkP2zZDZqVAH3qRZichFaCP5NBuXoCWgc9OLxMoWDqILGx/EKA
 Q26A7obdx+Hxst0/WaCNmlf9VYiKN/Pkbotyps/5hUUaYPcFlV5pbY1XE60kUNbVYlpuUTJ1pmI
 5LkFOvmsl+r9YTD9sheIfVIYUKOwIp5G84J6xQa1k=
X-Received: by 2002:a17:90b:260b:b0:35f:b987:4dac with SMTP id
 98e67ed59e1d1-369519f3559mr27533535a91.12.1779297509783; 
 Wed, 20 May 2026 10:18:29 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 11/30] target/alpha: Use FloatExceptionFlags
Date: Wed, 20 May 2026 10:18:01 -0700
Message-ID: <20260520171820.848839-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Fixes a bug in which we were still using uint8_t.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/fpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/alpha/fpu_helper.c b/target/alpha/fpu_helper.c
index 30f3c7fd18..9af77777da 100644
--- a/target/alpha/fpu_helper.c
+++ b/target/alpha/fpu_helper.c
@@ -40,7 +40,7 @@ void helper_setflushzero(CPUAlphaState *env, uint32_t val)
 
 static uint32_t soft_to_fpcr_exc(CPUAlphaState *env)
 {
-    uint8_t exc = get_float_exception_flags(&FP_STATUS);
+    FloatExceptionFlags exc = get_float_exception_flags(&FP_STATUS);
     uint32_t ret = 0;
 
     if (unlikely(exc)) {
@@ -455,7 +455,7 @@ static uint64_t do_cvttq(CPUAlphaState *env, uint64_t a, int roundmode)
     float64 fa;
     int64_t ret;
     uint32_t exc = 0;
-    int flags;
+    FloatExceptionFlags flags;
 
     fa = t_to_float64(a);
     ret = float64_to_int64_modulo(fa, roundmode, &FP_STATUS);
-- 
2.43.0


