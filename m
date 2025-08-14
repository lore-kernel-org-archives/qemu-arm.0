Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EB6CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:16:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXek-0004Wa-L5; Thu, 14 Aug 2025 09:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdu-0003Md-U7
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:19 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXde-0005NN-0A
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:18 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-76e2e6038cfso1402806b3a.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176699; x=1755781499; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52VfTzYDSgjyTkCxi2KMOJnfbsQ5A6/k4xx3za3L80c=;
 b=ZhubJs+/BwZY0lumJQn1nYBtM6oFZcZw1e21YQxrqPynYS3xH+lF7arO5BrxUi0Exc
 pok/qVjqrc5q57UrQE4Ye0lRtM0D806uPuZNC2isd3t+kFFZE38utXgd7M2GP8AyeFYd
 twSLzlW78rJ7LqLqJywsRCYfZ5txIRB4OE15oW+uICyp7RvlezWh0rk7ct4yTrQiheFY
 wIg0q2UEHlzldck6H/eQFzSh7Y7VCiiDuW03HWEdsJG6WCCW2VufvimFTnFcUNhBJWsg
 78Az97GpdYh5vQCVefeboaSzom/v3jp6AJeDMIgW/+8GVKhgYins1/0DCButtlniidJL
 gtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176699; x=1755781499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=52VfTzYDSgjyTkCxi2KMOJnfbsQ5A6/k4xx3za3L80c=;
 b=MW6V/G8ZGWcs6BZDLzbJ2AqlVz0yhZiprl+qqm6R6K9yAH03b5bXdUSHIgXMuTmCoo
 0dAiooRq6Rz00xnkWwphCeHvsDhM81xZ+ZyKHdJKWbGmc6dyS6loNa9Cq8fi2MITNl1D
 gNGnL0okX0l1pDs2B8VWnV27Yf+KMSLLa3orV0OrNwlziXoul+quvigT4DlvZLZz1bSQ
 8KH9oE0LJYrRkP6+UV+r5LPBBFZNDEhkWaMxI9RXTWKxuc7LjkiSHlWcxkx5cLFnScKN
 WMjfYG3irY47vxVAOnvjmqIBzWEcXpGfBxfE3ZHs6wWXp7dR2MbrLanDDQ80X6vuf7PL
 nDUw==
X-Gm-Message-State: AOJu0YwMGhZvou1KWXh34EasBBM0H6FCHCJhOMBn2/kZxjmeUGeM+L2o
 9fWlQ9sTGj+dsbxV0LO4/cz100DE9MvZFJ0ujyWbWd8ZarC5d03ZLct41yoJvFfQSvc=
X-Gm-Gg: ASbGncviD/teoE3VRrOXmpDfhAgWfPHfJw8ftTNt1ihAB0Tvgya+Exba75Fw9quSIrU
 oFPbk28q6cvZyUDhEkHnRUeXcbvEtxGCvhdsfvqeDOQlHIouyni5Br9e1poI56ktD3pMV+D3OPJ
 wFROgNAXFNF4fLdeXbP/EVz0Ee0K8Fco6DgCPQhqckLruNrb6Qe8qkzBPYEb0oU/K1zKRrW/iYZ
 M/kHM93hFyNOvDRgbO4bSh68cZ7I8W4Fc84CCtDG4EOYZyvTWg5MQ20uTbZdMzEaovs6ok+TX83
 h858qHJecjiNeydKPXGMRDaHCPsRX0kk1Tb0RyxcB+98MYJC3Av9LR7zRZTqR+XDnrWbt4j4UFk
 Dkq48ooqQi3LlqKQhoKU/NNsPI57hOy0tS5hNTyNzrPTUjx0=
X-Google-Smtp-Source: AGHT+IFYy6VeKxegeUXeSlAob6/MtLuOQ3HsrHHD3yLrNCg8ojehEmagSqWqjoHYpFGC42rI/oGmkA==
X-Received: by 2002:a05:6a20:728e:b0:240:c3d:2449 with SMTP id
 adf61e73a8af0-240bd2b465emr4986051637.42.1755176699035; 
 Thu, 14 Aug 2025 06:04:59 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:04:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 72/85] target/arm: Implement EXLOCK check during exception
 return
Date: Thu, 14 Aug 2025 22:57:39 +1000
Message-ID: <20250814125752.164107-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index f61adf1f80..7ab7ddf7c4 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -694,6 +694,17 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
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


