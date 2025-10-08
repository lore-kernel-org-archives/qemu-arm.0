Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A10CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:06:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cD9-0001D2-H7; Wed, 08 Oct 2025 18:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cD7-0001BK-GV
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:37 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCV-0007PQ-JS
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:37 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-77f68fae1a8so383992b3a.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960795; x=1760565595; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIGC+NB44/a0H+dR2upS+UgyhxrsXnOzX4fio5wssx8=;
 b=YfNIqPRlSHEp61Z+AMEmIudgV46zG6PRtl1DC4rteT497ACnLH7Gz95vIzVeh3J9c0
 KwobHRuRfbhRgKdhxOIGfZWAXbpn1xq+1SjajSiStH0tQ5W7obqlwH5Q+ELErIsPkPLq
 dATKPV2Ifzm1cUDgtadEosOsLINW8z82Mz++w6g9qO4TzE3sLUMzJN09ZnWumSN4IbPX
 403OnfX9KC6G1LaqMBF8WDbUMIb/yrA7TQS3lCUECYUVzK/p8KxwhnQPKyPcXuVm+5qv
 gzksPA33bJkFX7WDZ975elnanCK1t/ST1G4IvPMAl+a1l582mzFq1O3JMpNanTIIC/GD
 sr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960795; x=1760565595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIGC+NB44/a0H+dR2upS+UgyhxrsXnOzX4fio5wssx8=;
 b=Qx+XMlRp7YqRZ/GtJe0wogbi4dYRUKp62OrOTGZk2/z07IUkRPHp7NvYP7tqdvQSHm
 1sMAdbBT844G8LOPO3tigqFiNuWGF1FJLTpTJjIZY/eGbM6JLHY8I33tginHIW4OpGGp
 UIbG8G42dyE/WCaVDBd0osogVt9YX5BkJXeZE5uhJ58/UX+maBRYlMaqttJ4cewETTMw
 mySqn1pD1CmfdX0l4tv5I8aHUMYxEDyNGfOF/8ZwKvNZjA4Z0rWojBF0XjG6tKxzyEp/
 vYqzfeEIv4GiJp8wkTnW8s7DRj2Rho7IQnHs55xyXyQDfeZuVyA+WuKAqTWoACynQnrS
 UagA==
X-Gm-Message-State: AOJu0YyeVVKuKHlrGSOX5mgqUoOomHrT/0BRwYfW0ZiTwL1BqwCxwDQG
 IUbx85IWrfR2L+z64XTUXXL7h4Q6gjNnOCFXetye8oI4qWKINTC5oiReUHHk0/26z+k=
X-Gm-Gg: ASbGncu99okwgsV1Ol5xJCZsnOgvcT3GGtHVGFTcaA/MarI6ww/38x9WZu67ozUfcAh
 +EmBLDxPgaCVYd7GHyTvf4CYQV3FYKsUpTKXqkyrCAa87l6jbCzPTjWweBdQm0EWzMSpLwhGavY
 KxJAQC4i3YnRkTIin0RjlBnyWqniaU252krmISe5jwX0kxxnax05ymvK/1HZ24XinJ0xFjZdcWO
 eDzsUIY5pWQZweA/hek2vmTvwRMbLoEm9fUQFhIRC9XjKvlwHBVCfhmg35cZjBckhhukJYqAsTF
 zNtk5zpje5ZGp1S29sVhrWGshFwHlxxfRYOzqAKwdir3xzHV1KBZlU3fiEmiFIthyAi1SupOm/n
 9JOp54Z5AnL6NeTaxp76oSeSaYJZEC9OQpwHF6KuulQMtJGpvgWsb8+xr
X-Google-Smtp-Source: AGHT+IHe7wnLO5tL0J9y3n18M3NhsgUh0CCuOalgyyaqyXn3RTbbmnRdJNPB258VXxC5Cv7qAdVsiA==
X-Received: by 2002:a05:6a00:8d5:b0:793:1b79:ee61 with SMTP id
 d2e1a72fcca58-79387434292mr5599572b3a.22.1759960794532; 
 Wed, 08 Oct 2025 14:59:54 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 61/73] target/arm: Implement EXLOCK check during exception
 return
Date: Wed,  8 Oct 2025 14:56:01 -0700
Message-ID: <20251008215613.300150-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 08b7db7c46..ba1d775d81 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -675,6 +675,17 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         goto illegal_return;
     }
 
+    /*
+     * If GetCurrentEXLOCKEN, the exception return path must use GCSPOPCX,
+     * which will set PSTATE.EXLOCK.  We need not explicitly check FEAT_GCS,
+     * because GCSCR_ELx cannot be set without it.
+     */
+    if (new_el == cur_el &&
+        (env->cp15.gcscr_el[cur_el] & GCSCR_EXLOCKEN) &&
+        !(env->pstate & PSTATE_EXLOCK)) {
+        goto illegal_return;
+    }
+
     bql_lock();
     arm_call_pre_el_change_hook(cpu);
     bql_unlock();
-- 
2.43.0


