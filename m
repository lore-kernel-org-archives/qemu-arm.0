Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A383ACCD1A5
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:15:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyAH-0007yM-KA; Mon, 20 Oct 2025 18:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyA5-0007nd-C1
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:29 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyA3-0006nW-IA
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:29 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4711810948aso32632995e9.2
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998526; x=1761603326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P8Smd6hB8Esnqvu82egYFHeZf8DlCaRlaugHzvEKuUo=;
 b=ZpsC7KivzphOtY5ea/OVsltDGsdFBxSoGO6M7LetuMq/ecbI7xuo9dENe/1eFMNowc
 +E7NX1DxdPOFKA0AqVT9m/IomUh8fjcL+pe/wqZU2uhCcsMO4gM0lDlMXoSf1HAtzsQc
 ZCaD/NoFvMWeGlF44ISwN8/jpC0ElEKxqeSLg7Hm0WQWBbPy6ApSMeEqorOzRofjMgm9
 8WKwRFZlxI+pAHP5uYTnOTHFDpwjFNbnP/OIel1tiWxXiaknkVZhcBTHUMJOGswRT/35
 CQ59iYPyp+yOg3ExzKxi39Bh8dVi1kDt37MxtTXbi6yyHE0NzgJk70XIuB1VIArOwl8m
 Ps2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998526; x=1761603326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P8Smd6hB8Esnqvu82egYFHeZf8DlCaRlaugHzvEKuUo=;
 b=cGPgN8gZ7RCQpd/SwdU1lF0YsvpyfSqPNnQt6xasirWIFWmRuVzfupPQR75HU4mUF+
 qSP4nZbm2MMWlVgOaWQdo2P9El1ukg3BBYYvoel6y/X8XxJnsSmVGlYrQ8tnf+qjUXNQ
 TkjErStodc5U9M73s754xNLPaOaMeo0zYFYzhYfzYvLDY9rEms3Q328AAwHr7i/uWd00
 1YfSm7KL/Yo3mVjCioAjKwAw86l1zpSikQnGuWpM9R0yfNa6L6bMZgf8edjymOyP6JNe
 aIKDkhEHjb6CjgDZ2dgPmKc/8X9ufmADltlLGTfYwI8NHzbz8PNGaZZmpL6ewntQaDX2
 H7Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpYLUdZo+ok+Nz3AJD0KpwRV/8uULBpjvH6+t6m3aFNAkdBr+TzMJ66HAityY1KVY01ytT2Mh+Jg==@nongnu.org
X-Gm-Message-State: AOJu0YxiINXKuh04J2J093mOk4jTFRrUkt1bw9oXFZCXY1SObwtDe/8e
 MhvWkemTGR29i/yPfFznU/QufkvtAYQkEO75+n6u6Yx9OlVgFC5yFRg0sIBuQ1CgcjE=
X-Gm-Gg: ASbGnctv5vJXs77jgIWpmRYYHilIsRctfVaxju3gkMBtY/CeJysUyiA9URYi6PNOqq6
 rJKuuAifMrEF1S09NV3gNZMizMYJquD25Cf7JuYvenwzI0/4cmGfLXM1Wsv2gaQ2xgXpt8a9IlX
 RcPykWxF1jkvLTygi3Vtmzkqk/sr7xm+r4oMYjNrduar/chunkn+r8SmsPkJzET5fyL3gVGZz7w
 U6iLlpVCEh/fOo++NvS2hrrU+/x+mwqn9/ySQIHbCq+njbC7YcTldyX8Huzw9d+O0Fo7MVvzWL4
 bFHYMdnCTPidJIC6vwTDeziJBDFjMAM9lPJKXBdowNFFChGQZaeUFR9twQg88YgJA3+kx0itEcA
 B9aOe2dgni5QuIw8zyCLVHt8UD5Yxuwi7n/ly2je1SqJt2hOEwKMuZjeeqKK5zucbqGkrAPeMO+
 Qf+JSDOeCmibepoLelWIfXvAKwwXl6Dg1AJkWt9rEhs9dW2/sPLg==
X-Google-Smtp-Source: AGHT+IGDJV1j2qvhmyx1gU9Tp5zGj45COJw2Tz0+2g8skC5TouzCZe73nQk7KMs3xTba4vaMdXRdEA==
X-Received: by 2002:a05:600c:870b:b0:46e:3709:d88a with SMTP id
 5b1f17b1804b1-4711791cb7amr120595395e9.33.1760998525706; 
 Mon, 20 Oct 2025 15:15:25 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b9fdfsm17067003f8f.40.2025.10.20.15.15.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:15:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 19/30] qemu/target-info: Add target_base_arch()
Date: Tue, 21 Oct 2025 00:14:57 +0200
Message-ID: <20251020221508.67413-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

When multiple QEMU targets are variants (word size, endianness)
of the same base architecture, target_base_arch() returns this
base. For example, for the Aarch64 target it will return
SYS_EMU_TARGET_ARM as common base.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/target-info-impl.h |  2 ++
 include/qemu/target-info-qapi.h |  7 +++++++
 target-info-stub.c              |  1 +
 target-info.c                   | 10 ++++++++++
 4 files changed, 20 insertions(+)

diff --git a/include/qemu/target-info-impl.h b/include/qemu/target-info-impl.h
index e446585bf53..2c171f8359b 100644
--- a/include/qemu/target-info-impl.h
+++ b/include/qemu/target-info-impl.h
@@ -17,6 +17,8 @@ typedef struct TargetInfo {
     const char *target_name;
     /* related to TARGET_ARCH definition */
     SysEmuTarget target_arch;
+    /* related to TARGET_BASE_ARCH definition (target/${base_arch}/ path) */
+    SysEmuTarget target_base_arch;
     /* runtime equivalent of TARGET_LONG_BITS definition */
     unsigned long_bits;
     /* runtime equivalent of CPU_RESOLVING_TYPE definition */
diff --git a/include/qemu/target-info-qapi.h b/include/qemu/target-info-qapi.h
index d5ce0523238..65ed4ca8eea 100644
--- a/include/qemu/target-info-qapi.h
+++ b/include/qemu/target-info-qapi.h
@@ -19,6 +19,13 @@
  */
 SysEmuTarget target_arch(void);
 
+/**
+ * target_base_arch:
+ *
+ * Returns: QAPI SysEmuTarget enum (i.e. SYS_EMU_TARGET_I386).
+ */
+SysEmuTarget target_base_arch(void);
+
 /**
  * target_endian_mode:
  *
diff --git a/target-info-stub.c b/target-info-stub.c
index d96d8249c1d..d2cfca1b4c2 100644
--- a/target-info-stub.c
+++ b/target-info-stub.c
@@ -19,6 +19,7 @@ QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
 static const TargetInfo target_info_stub = {
     .target_name = TARGET_NAME,
     .target_arch = SYS_EMU_TARGET__MAX,
+    .target_base_arch = SYS_EMU_TARGET__MAX,
     .long_bits = TARGET_LONG_BITS,
     .cpu_type = CPU_RESOLVING_TYPE,
     .machine_typename = TYPE_MACHINE,
diff --git a/target-info.c b/target-info.c
index e567cb4c40a..332198e40a2 100644
--- a/target-info.c
+++ b/target-info.c
@@ -33,6 +33,16 @@ SysEmuTarget target_arch(void)
     return arch;
 }
 
+SysEmuTarget target_base_arch(void)
+{
+    SysEmuTarget base_arch = target_info()->target_base_arch;
+
+    if (base_arch == SYS_EMU_TARGET__MAX) {
+        base_arch = target_arch();
+    }
+    return base_arch;
+}
+
 const char *target_cpu_type(void)
 {
     return target_info()->cpu_type;
-- 
2.51.0


