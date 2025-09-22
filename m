Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63452CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:50:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbi-0004jt-Vg; Mon, 22 Sep 2025 14:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbe-0004fa-Qb
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:46 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbZ-00046K-Cl
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:46 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-77f35113821so1180262b3a.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566979; x=1759171779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5qYsKVv/0Yzl1Fc8tjOv531eP5nXOOQ3pSGhOVd0kDg=;
 b=pZrdmiMIkso0FIjmqoLxRAQQCcsThnrj3LpMZcX8YMecJoDk/MyeNWT2f3joHf+blC
 opA4g1Xw7oV15En5I190ddpA01lHfHsoveF2Wg0QqOoQjh2+4UtM/Fxcu2hpNBi3Iqx8
 I3nh7HXfGl1H2WMBbDedNTcB301Ne/kuIgILJQjsVaPRFoGn1FJXG3rqp47h7If5+DnH
 4XZteZ8UzHiyluCT/iYPW69lfVJCpeE1rMyW8wrfaqnPclNhsG1QL7JDcF+YhJL1Yjai
 WexAslM5nizOGNLcyaFoocxwJiKTcA7hZASHra0KqmM6OT9Fs7FrV9K1wU51Hy3AYROx
 /H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566979; x=1759171779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5qYsKVv/0Yzl1Fc8tjOv531eP5nXOOQ3pSGhOVd0kDg=;
 b=mlql8SJApsOQATMVtjM2vZlSK7T8tRMON1AaXKvnO4phqF25ZP9JEIQWp7TWgI5AGt
 O/8HcPCmrUjbeTa5K/+gF+P3glDuXphx5jEEff/sLcZmIRu1nmH4kOWuN2zjTYCp9Ug2
 +yNquG1IORfHQ0X3/rZOpPEPvr+tA67o2IpSQYOXhxwYZmn+5mYS36Qn1jzerTbPZa4H
 UYhGvJkvvMj5ewpUmuZaoc37ClA/2KiIEu/WklrUoCmyOzICiba/6TCWTImTlKd0TxXM
 cq9SgB21CYB4I8gsQDZcHdggSTQ1Bn7Kw4civ++iqhE1RlqBrYs+gk9mbSh9XdMx8zjn
 31NA==
X-Gm-Message-State: AOJu0YwdfGu5oGZUgqfrE+irKwNYpeoRSErIyArdE0BZERfymMvS2m74
 BBWuX66e+CjHNOWI1JUG+g9iPzBd1XRDt9tjJCvQrAJMpC/ySq9OV1n18sx3BXREIGcgJ5lteVL
 oE3B7
X-Gm-Gg: ASbGnct+1FGEIN60+OSMlmW6N6qTV3TQFV9DuBW/54wW6m3KDlml0xZKPrKUjAT4HqC
 SuuANQARIqR464/OLU1nYdqZ5dxe9x4OoypK+7yCzFe2L/3h4ddNV9Siyq0OVyX7N4JIZ6WhYzB
 YNeTOxx2BPg+zpENevCIHHoAQhFCH364ij0nUlHW/Q7cfm9gEkBwX/m1XlrRGEz9KQCO0tKMdI9
 sU7aiCuC30OlQA5kAbApfGR+DHi+rdFQAqQQ3r8nqsFnURhK9qssSbu0fAzZVd39BHixUy7z5YT
 igSbTcVl/IWz7YUDkzjqunkSj3PX7H0GW3mEG+6ur09mHJrB4R1NU7IgI0af1p4dHT4mZfM4j1t
 wECem6UsNVcalBi/4jB6jnq6zhj1K
X-Google-Smtp-Source: AGHT+IGUOwMwENYtjwI4BovoztmW5nJb5378E6zXA1gZpZM4cCkZ6p0m0eKdHfsWz+x+zCboEQRO+g==
X-Received: by 2002:a05:6a20:3ca7:b0:252:9bf:ad80 with SMTP id
 adf61e73a8af0-2cff12bbe5fmr115904637.54.1758566978885; 
 Mon, 22 Sep 2025 11:49:38 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 10/76] target/arm: Expand syndrome parameter to
 raise_exception*
Date: Mon, 22 Sep 2025 11:48:18 -0700
Message-ID: <20250922184924.2754205-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Prepare for raising exceptions with 64-bit syndromes.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 6 +++---
 target/arm/tcg-stubs.c     | 2 +-
 target/arm/tcg/op_helper.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index aa41054af0..0ebcf566ec 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -304,14 +304,14 @@ FIELD(CNTHCTL, CNTPMASK, 19, 1)
  * and never returns because we will longjump back up to the CPU main loop.
  */
 G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
-                                uint32_t syndrome, uint32_t target_el);
+                                uint64_t syndrome, uint32_t target_el);
 
 /*
  * Similarly, but also use unwinding to restore cpu state.
  */
 G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
-                                      uint32_t syndrome, uint32_t target_el,
-                                      uintptr_t ra);
+                                   uint64_t syndrome, uint32_t target_el,
+                                   uintptr_t ra);
 
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
index aac99b2672..aeeede8066 100644
--- a/target/arm/tcg-stubs.c
+++ b/target/arm/tcg-stubs.c
@@ -16,7 +16,7 @@ void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
     g_assert_not_reached();
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
     g_assert_not_reached();
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 5373e0e998..dd3700dc6f 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -46,7 +46,7 @@ int exception_target_el(CPUARMState *env)
 }
 
 void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint32_t syndrome, uint32_t target_el)
+                     uint64_t syndrome, uint32_t target_el)
 {
     CPUState *cs = env_cpu(env);
 
@@ -70,7 +70,7 @@ void raise_exception(CPUARMState *env, uint32_t excp,
     cpu_loop_exit(cs);
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
-- 
2.43.0


