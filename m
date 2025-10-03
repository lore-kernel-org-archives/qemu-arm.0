Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DF7CCD183
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:26:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jNj-0001j6-1C; Fri, 03 Oct 2025 13:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jLD-0006me-I6
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:15 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jK5-0007nn-K7
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:09 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-76e6cbb991aso2191776b3a.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511516; x=1760116316; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1eM/ogX572hxBEuVlhOMBDoukbDClGwOpCBVh9GL5Bc=;
 b=JGPOHgnoDrammGBHfg3s/JbUfqB6w5bQ0UswlUYSl3xjWO+qROmzfopF5b2cSqxtKK
 A7tUghXAnJd/9f75OW5jhXUaQUIfQzO1Uv21BvdH7TbBdqIIfl+ztHhUf6VMZXCB1dcQ
 vJH3Ryv3pkzl9hj8BsELo2TP1t35GEkSWpPZXH4opmWXLcedcVn5db0wMxiu5npal137
 lR1w7rn7ASBeXravn+R6ZrYdXDCuxoh97RIt8aAmT0nsMN+X+mmomN+zL6Oi0PRDdI7D
 PlNzJT8Pp3vUwUJre4imt9DpBJnXxgN/jVWCv7jP8HDMIIO2m4GcuIixLzmBaiWcXu++
 GtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511516; x=1760116316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1eM/ogX572hxBEuVlhOMBDoukbDClGwOpCBVh9GL5Bc=;
 b=iJOIVjT1Ck5v9t3Dp2mLexogfTCPE6vRo8jeXIm8zOL7vXXF5zXs57BvgOTeze+41v
 znWUcHM5KQtdTXNQHySR7sgaIm2V9saWOTB7sdAL3x12MKw/1uuOpGAy+tMBiK8MTqPC
 2Uouta1xfKNA7pxRiN85yD6euIu8AXx2qlc7KyoM4pBltXyxoGsuacD3rw7K1F+CC6fA
 /SOdJq6s4IvWSI0ITR/Vm/XdlM9c8X73VNKuv9NoacrP+KuPn5+CzTqbJ/fUfyah7ON4
 0tvncL8j+JZAhGt7QRr00AbJtxgx29t+3E/3+O3kX910cMUJafwtv6sC+P4vYOGfnOxQ
 1Osg==
X-Gm-Message-State: AOJu0YxDbAdcgB15pKYIKAAraz3NPzK+CHhYKmV1q4vUKkCnytfmigry
 VcplajIoiOyZDS5XfplT3gGiennCy+i+Hi0p0Zddla7NK+Z6ouHf9Ub4waq8EqB8FjptOvNf3wS
 KPJ4wAnE=
X-Gm-Gg: ASbGncv0dD1sSQamCMYtuuZePFpQhubwcktZiYLys6HxuPa/hEu2iBm7BamzXulpgi9
 aFd1wYYJ7qvQWYPZKzfk7fSxHHD6z3II+EfpcDaIZ4S1cxNtoDMkF5RbFAVFA2gfUaf043m3Xmh
 24K2fpQtwmFLRq3TC7mxJpxDyHOdDiR1xiQC9Mg/lnRmBWNZgygfweyWr6+N6jueLGcybjE+fVs
 uAMYDfupNAlRBseJ7TAoQskxJmtxPyMzXGa28c22cX6AAqE8K+xc7pqANdyERC6odqvjRA+K66z
 yIiZoJ9Ly36B0sewuZnGSOZs2Y9NWW/Q+62xct5tBIqCjZuiJT41Ywd6kYDUVLx9yoV/wwIqWbj
 Ve0fuls07AFL8QGBMExn7/zGFn6i0qHCwHhswfwvHYgFfn8l0RolGbimi
X-Google-Smtp-Source: AGHT+IEl0+PzCzzyQ5t0GKUwVb8Xeh8l0uQJ3WpMbQ0IAKL6uVCZD0bET2AnbFRqlscxkog5gWjOzg==
X-Received: by 2002:a05:6a20:a125:b0:2e0:3905:657 with SMTP id
 adf61e73a8af0-32b620b18bcmr4839064637.35.1759511515760; 
 Fri, 03 Oct 2025 10:11:55 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 60/73] target/arm: Copy EXLOCKEn to EXLOCK on exception to
 the same EL
Date: Fri,  3 Oct 2025 10:07:47 -0700
Message-ID: <20251003170800.997167-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Per R_WTXBY, PSTATE.EXLOCK is 0 on an exception to a higher EL,
and copied from EXLOCKEn otherwise.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a62b7ba430..e518c59877 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9065,8 +9065,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         } else {
             addr += 0x600;
         }
-    } else if (pstate_read(env) & PSTATE_SP) {
-        addr += 0x200;
+    } else {
+        if (pstate_read(env) & PSTATE_SP) {
+            addr += 0x200;
+        }
+        if (is_a64(env) && (env->cp15.gcscr_el[new_el] & GCSCR_EXLOCKEN)) {
+            new_mode |= PSTATE_EXLOCK;
+        }
     }
 
     switch (cs->exception_index) {
-- 
2.43.0


