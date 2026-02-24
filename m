Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A531F3C9A0
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 15:45:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuuZx-00081z-Ku; Tue, 24 Feb 2026 10:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vuuZn-0007rD-7Q
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 10:43:56 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vuuZj-0006IM-4o
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 10:43:53 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-65bebcbffe8so10594867a12.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771947829; x=1772552629; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RknEFktl1l1nRixJn9Vq+u4/vTHFy/2B7DICOzHIBkQ=;
 b=cczSN063W1/aEXzWX/w960b89lKSe36X0KhS2Ow60UbrgNBdzLAi+8bzOzmMH/oLFN
 0RLVbIMC1BvVADu4elzyCIikiv4epLLC6/AggRaaruqaSBETB45C5PzzzomWIH8A4PEJ
 SjZQ35whn5OGqvHSymW1crRiGbDMG+caE+FYbuZYr3axNhetEbh0Px7SRbgCFe9tGB6S
 RtWKq8nYlkAlBBiCiXhxWYcUlPmfkegdiUas5ODLIGr9WNr3t0XW2RyNv66qY1b3WS2J
 FbADUnvgmTM/dpluGFQpjRYM4fWpLFZESTF+RupSrMnqvyE7nOnQiEid3axeFV28UCtd
 XySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771947829; x=1772552629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RknEFktl1l1nRixJn9Vq+u4/vTHFy/2B7DICOzHIBkQ=;
 b=Q5VDV8YfsTJFEdcKqT9Edtzj7wtYzhog7PXQ7F77v5BgIKpazjw903ri0y5d7oizfo
 nhijnYvhDMvhDjCOOfR0tNn5q5xb0pIPWIrJB629uz9C14FrAte8CbR1oE6ZPNNhj+GL
 U2M6f0kQmV7tmbE3cBbtF0bSbM9S+SGD47u3s2yE9QnwD/MLY4qtwymUJv7zhobnMHds
 emuTV8SZIIbdhJOJj0vVZe2YRqwyYpJDyK7TnZPwOeIdqyl7lhCmC+UCW7OBwu/bpSQq
 pRKAZ6PYdxs1NlgdpE2j9wGJb5mL0MbmQ3UVm7xI7yQTijQ4sHRosFnCU07ugJ1OVnwd
 wGgA==
X-Gm-Message-State: AOJu0YxaKXTjIDJXWagJDuUVcq4ZtpS04tVJLBm40PMEgHmkm6OCEixy
 5IGWccHY1tr9YgRRuouvuxg9z9w3voraVzm1rO7qLkPMCJGLIaZFD8nx5iXurRaETmxm+qYK+uD
 XVI8i
X-Gm-Gg: ATEYQzyjUHfWNtxLzX+dlgg6MsGlz4naGce1dIxrz2oLgAlUbuTDNKxYkgvorEVUQZN
 UuswebBEEzxo5dJaq04OrZn2EJ/5by9y81iAruXNiR2/ZX000EDslU4kR7dhTYMtphALiKMApm7
 +ZNygXmRRk85ZN8B9kOM8wduy3kCtpvp7XskIm0NltrkxvSLTzhvBECOD52xfN5Ba7XD3l8y9o4
 nM0eDKUrelHwCyppRvRnhyQZtyMQtoju5P+NuoY9fvCFlCqQPpLmnkbpOkmMyCYI9wmTjhIpxB9
 UQJJcrUGCkgREUAiJY1HrSkRbH7N9WUrIS4H4gW7vciUdaNgCaWUrav1kw4nM+cyFMK2xpXYKkD
 FEr5D75DPpT5u/KweyUFl0NOc8iY82/FfCAlWSfUURNZcV4X7gjo0FgQTKXXi40UTszVDsaQ6ox
 eGs2mpYIKqltdtUqtbf0Sv/JOTKPFG/9uSZA==
X-Received: by 2002:a05:6402:354b:b0:65a:cdfb:58a7 with SMTP id
 4fb4d7f45d1cf-65ea4ed0c0fmr7219653a12.9.1771947829014; 
 Tue, 24 Feb 2026 07:43:49 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eaba2f978sm3638841a12.27.2026.02.24.07.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 07:43:48 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4D3B65F8BA;
 Tue, 24 Feb 2026 15:43:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 1/4] target/arm: set the correct TI bits for WFIT traps
Date: Tue, 24 Feb 2026 15:43:43 +0000
Message-ID: <20260224154347.344219-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224154347.344219-1-alex.bennee@linaro.org>
References: <20260224154347.344219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

The WFIT trap should be reported as 0b10.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/tcg/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 4d708635068..aa14f15eb62 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -448,7 +448,7 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
 
     if (target_el) {
         env->pc -= 4;
-        raise_exception(env, excp, syn_wfx(1, 0xe, 0, false), target_el);
+        raise_exception(env, excp, syn_wfx(1, 0xe, 2, false), target_el);
     }
 
     if (uadd64_overflow(timeout, offset, &nexttick)) {
-- 
2.47.3


