Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74DAE7DEF2
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 15:37:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmvyg-0008WJ-TR; Mon, 02 Feb 2026 10:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vmvyf-0008VV-TH
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 10:36:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vmvye-0005FX-8z
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 10:36:37 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-481188b7760so30275405e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 07:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770046595; x=1770651395; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4n+u17ZiiyoK+LjjE2G+gKBx4QJYPePuRaxBrDh5JQ=;
 b=znYn+nPckeCO8sZszbU5skVxNlI/cFTpKpbzQi9LVZqpAItGC+wQnc8sfEIb0spSuy
 iWhDlIli0BIfpbZnarIwixJseDPoEIna4wGVcXmmrfYElm5DSe8FPzG90eWv/sakqVH1
 9T3izHNdkCO6XUVJdyA1Suf+oytRIxnq5MSbHh6cn8zE1oquiXHlLA5WrDyPMt8OmvGu
 /s+JSaANLQ1dUKhVUW36Pvwjs1hBIjNzxkZw3cyREOVj/uZnI0RXJQISNBKVCqj8s15C
 lwQt9cW7qD61yoIMOcadyTRSY9UnYbxa3SxIi5O74zrj3VjYNffCzsoXuu9HMlsweLwC
 CmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770046595; x=1770651395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/4n+u17ZiiyoK+LjjE2G+gKBx4QJYPePuRaxBrDh5JQ=;
 b=UfklvYM7udGgN3XblnEHwJa2+wqJpRZq6N/OhvlUk9vOXXUMuOTCQdkIHXhcqfRtR2
 V91Gip4O4XojM1JvJvf7QmVJeQdS1BqueyfKHJrEf9NZ2MbsRxOeFhegAFnpiq5Rg5gp
 H7D/snw8jqM5vuLyZM8dXbPyQPzh3BZhdPuqDakX2qp9pQSzHLn9C2AyeyEZvGmmD5Oc
 Uf0SnTx0bE9MqqjEBuhSvmpwbl9XKrrKIlHTStaJSlBYpJPrQ2KVUH5uxCfTxhH3PykS
 tXSW/fGHQI4T7Y6f4itTFPzc9ej3Yq1FpjOTKo5ArRo1TMg3uG9H3quLAhBJA9oAO0MN
 040g==
X-Gm-Message-State: AOJu0YwVRQvABI8+AKDHhwMqQYt5EwT6q+jrvzGqxpm7pqKdzgELgneW
 01XVjDfQCrl8OJn3R5/E7gVNFAhoGEC9+W7x+EdWwA6Hi+j8bOeJabhNJN3XHbdJj69l4hjYUbR
 ZML+AFy4=
X-Gm-Gg: AZuq6aLgPmBG8boTvvxGtYhsM1GMTuKvhEiUgNRjxujMEP83cJE8A4yzb3pQmdFAuqB
 QOVksw8H9jm/7r9f7otj6jvUXNYYGiv733lL2oKsoyNm3+IA7cfqgXt+/x99PNX/CSRZCdR8Qa/
 7Zlg8BXiD/EhouVA7YPTE89G3Sc11LhHSWgXX6RA1kZXSGeZHeE+Tb7uKnvxYAJxF+Y2xnne1gW
 kRZ19P03Mg2optsl69paGQQzhbmMkYsTvcPs3SnG/Ph/12drycrVjgTbDXfkkeCQbBMRdVKV+9N
 XiF3C9iNc+701h+CCVuoTET0s1b9Baob6BXdoYJAUo94WCcw77d2TYBl18FzQnOjg8qK95RuDAu
 rsdDxKeMnz9HZ0IBfoSiPsyzXU7FIX6KHCeNy8tJn6KjjmGp42D9KPSArFsyIDGiMOLnFg1vM5F
 k/va38bm22rbw+g07fNI0EnBw6zuX9trRKlSI9rbyj8c8Yf79VDYME4JIfCX3z
X-Received: by 2002:a05:600c:1d03:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-482db4567d6mr177172465e9.1.1770046594688; 
 Mon, 02 Feb 2026 07:36:34 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bfb59asm444779065e9.7.2026.02.02.07.36.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Feb 2026 07:36:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 2/2] target/arm: Deprecate '-cpu any' (remplaced by '-cpu
 max')
Date: Mon,  2 Feb 2026 16:36:18 +0100
Message-ID: <20260202153618.78675-3-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202153618.78675-1-philmd@linaro.org>
References: <20260202153618.78675-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Since more then 5 years the '-cpu any' is aliased to '-cpu max'
(see commit a0032cc5427 "target/arm: Make 'any' CPU just an alias
for 'max'"). Time to deprecate the alias so we can eventually
remove the alias code. Emit a warnig meanwhile.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/about/deprecated.rst | 8 ++++++++
 target/arm/cpu.h          | 2 +-
 target/arm/cpu.c          | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1d5c4f3707c..c544f23cab5 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -181,6 +181,14 @@ is going to be so much slower it wouldn't make sense for any serious
 instrumentation. Due to implementation differences there will also be
 anomalies in things like memory instrumentation.
 
+User emulation CPUs
+-------------------
+
+Arm 'any' CPU (since 11.0)
+''''''''''''''''''''''''''
+
+The Arm 'any' CPU is an alias for the 'max' CPU. Use the latter instead.
+
 System emulator CPUs
 --------------------
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 21fee5e840b..3a888eb3fb6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2390,7 +2390,7 @@ static inline bool arm_sctlr_b(CPUARMState *env)
     return
         /* We need not implement SCTLR.ITD in user-mode emulation, so
          * let linux-user ignore the fact that it conflicts with SCTLR_B.
-         * This lets people run BE32 binaries with "-cpu any".
+         * This lets people run BE32 binaries with "-cpu max".
          */
 #ifndef CONFIG_USER_ONLY
         !arm_feature(env, ARM_FEATURE_V7) &&
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 586202071d0..da664c4e30a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2218,6 +2218,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
      * which has the same semantics as "-cpu max".
      */
     if (!strcmp(cpunamestr, "any")) {
+        warn_report("CPU type 'any' is deprecated, use 'max' instead.");
         cpunamestr = "max";
     }
 #endif
-- 
2.52.0


