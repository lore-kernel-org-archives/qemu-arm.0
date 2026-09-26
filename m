Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2777AC9832A
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:09:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMPx-0002Ia-PH; Sat, 26 Sep 2026 03:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPv-0002Hn-Vb
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:52 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPu-0000SZ-4O
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:51 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33e46a15703so1347986eec.0
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406109; x=1791010909; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/Pnb4009fcr63720pQihUF6v8EokAjQS6rcfppqNlzc=;
 b=NHtfEsqm6Wvwz9fkgmD8IR0ykDcsUsqcdqCPZG0/dzkuyfWtSxjYhsi+aB70TzG0HC
 faJE1Cvr+nQz1MzRLlESnwojOUpb5QGKcdKGanAj8K6Lf8Xdd2gIbrep03gJgMv+e80Z
 zPuCr5vydsN0SkW/EVN5JSI9Om43MjumIntC7N8Ma4idjQdrbn7ZrSah4gO+HiPE0Nq1
 gpUGsl+OUaGUsm+ERyRdia3WP+x5XsdVog4l/CysN0HNYhQim3zoeV5lo1nA3hdI0XNJ
 jrXqLyqR4YeVMtcGGZ/R3sxHr9YQ9vEX9S9xBtOGfoHNE/oqg32HCsUnom+mDEfAz928
 UErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406109; x=1791010909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/Pnb4009fcr63720pQihUF6v8EokAjQS6rcfppqNlzc=;
 b=OhBSpEckJmWS7Tv8qHJL0EQQ9tPASlyQn0AeltksEwW8rkzZmGlLEr7/fmepfiTcXy
 zot7c5U+sHvqSoNkFi0qm+b7w7Bng282HMX/nzY9NKtD7praEzTTXJ7Wtwtsa0ilqN7o
 1c43EWgq8oxUdUYRekcNyoyXcSQcFwyMwVysXddEs/XVkU2iO4D3TEplGg9Cbr4rd/iU
 n3o8XaApFD8ecTR5mOxo6Nx1k3SjThJfnHl0bQigPQHHCdvwjscLjyAnAQCQ2YPvccij
 jGQoe5qA0AbqF8FllOHcbq2z/nlEFZcA0vFVSp16CCC1YD9jEQwCeeZnbXrBKUFOmA11
 /OMg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz0C2uCAuvM7rFklpcAHbwSepvLSRR6fEcecjGgJeYNl0PV84DldmxYsh7lcUdjEkjMzKfrcNKzJA==@nongnu.org
X-Gm-Message-State: AFuF++n1Z/fZbsekkYSj1R2It26oqCVnY72XRAocWBPZNrRFY+KPvscs
 VXmo5bMqUXAy9SwqS06GLrRSerPfh0lRzem8r5ixOBw7oVBGNkyX0QTjhWsVsU/E
X-Gm-Gg: AYBFou37jgVmnKVHzefJTBRKbLiK/U6oPHWyr8owkenARLowBIM6vGlkOZd2SBxlY6B
 V0VSmw1KIy3QegYaHzPbrSwM49D+2fororq/gaO9osGmc/OCc5peMotj49tZjh8NtvaezMTaEq6
 IMdOft5wvKpNVtI0oZq1GSUVGGCDMn1CXwLVVxHysLkIdxz3480cF7QFheTtadH4rCzGnSz7+3n
 E9f3THSHwa8EMmefXv2pmQ6dOQqjHJx0RqkeVOkwnPndGDPNF4Hx7nyV1xaUbJbjGNIoK4Yujf0
 rrkRsSqjdM9FCI28ND7VdBmxNvXD6iy9vgX+GluSzFIEGF0SjqiqBsZqMJyH1pmQVOL2VCyGQLY
 ynefcXIc9yeuDYx1hxfuf44nCI2g5qAY11EiICWQlGxvAW/n/c4nBIDE6IJOFv8Jw6W3wURClmL
 pkN5a7Is775z4d4pAwV12jzGqgxlDVB8Ehfljra68M87p4OZkmQJUy9UgMC6n8kMR8l14D31eQA
 damrWa7/ircpZKTz+t1I/+2vPTMB4Q=
X-Received: by 2002:a05:7301:712:b0:33c:3134:f45 with SMTP id
 5a478bee46e88-3426fccb01cmr1967524eec.5.1790406108596; 
 Sat, 26 Sep 2026 00:01:48 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:01:47 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 11/55] target-info: add target_is_* helpers for each
 architecture
Date: Sat, 26 Sep 2026 15:00:10 +0800
Message-ID: <20260926070057.1234-12-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is added for latter use with is_available.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info.h | 91 +++++++++++++++++++++++++++++++++++++-
 target-info.c              | 83 +++++++++++++++++++++++++++++-----
 2 files changed, 161 insertions(+), 13 deletions(-)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index c48973f20be..89656da1ca4 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -53,6 +53,14 @@ const char *target_cpu_type(void);
  */
 bool target_big_endian(void);
 
+/**
+ * target_is_base_arm:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is ARM or Aarch64.
+ */
+bool target_is_base_arm(const TargetInfo *ti);
+
 /**
  * target_base_arm:
  *
@@ -60,6 +68,14 @@ bool target_big_endian(void);
  */
 bool target_base_arm(void);
 
+/**
+ * target_is_arm:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is ARM (32-bit, not Aarch64).
+ */
+bool target_is_arm(const TargetInfo *ti);
+
 /**
  * target_arm:
  *
@@ -67,6 +83,14 @@ bool target_base_arm(void);
  */
 bool target_arm(void);
 
+/**
+ * target_is_aarch64:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is Aarch64.
+ */
+bool target_is_aarch64(const TargetInfo *ti);
+
 /**
  * target_aarch64:
  *
@@ -74,6 +98,14 @@ bool target_arm(void);
  */
 bool target_aarch64(void);
 
+/**
+ * target_is_base_ppc:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is PowerPC 32-bit or 64-bit.
+ */
+bool target_is_base_ppc(const TargetInfo *ti);
+
 /**
  * target_base_ppc:
  *
@@ -81,6 +113,14 @@ bool target_aarch64(void);
  */
 bool target_base_ppc(void);
 
+/**
+ * target_is_ppc:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is PowerPC 32-bit.
+ */
+bool target_is_ppc(const TargetInfo *ti);
+
 /**
  * target_ppc:
  *
@@ -88,6 +128,14 @@ bool target_base_ppc(void);
  */
 bool target_ppc(void);
 
+/**
+ * target_is_ppc64:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is PowerPC 64-bit.
+ */
+bool target_is_ppc64(const TargetInfo *ti);
+
 /**
  * target_ppc64:
  *
@@ -95,6 +143,14 @@ bool target_ppc(void);
  */
 bool target_ppc64(void);
 
+/**
+ * target_is_s390x:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is S390x.
+ */
+bool target_is_s390x(const TargetInfo *ti);
+
 /**
  * target_s390x:
  *
@@ -102,17 +158,48 @@ bool target_ppc64(void);
  */
 bool target_s390x(void);
 
+/**
+ * target_is_base_riscv:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is RISC-V 32-bit or 64-bit.
+ */
+bool target_is_base_riscv(const TargetInfo *ti);
+
+/**
+ * target_base_riscv:
+ *
+ * Returns whether the target architecture is RISC-V 32-bit or 64-bit.
+ */
+bool target_base_riscv(void);
+
+/**
+ * target_is_riscv32:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is RISC-V 32-bit.
+ */
+bool target_is_riscv32(const TargetInfo *ti);
+
 /**
  * target_riscv32:
  *
- * Returns whether the target architecture is riscv32
+ * Returns whether the target architecture is RISC-V 32-bit.
  */
 bool target_riscv32(void);
 
+/**
+ * target_is_riscv64:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is RISC-V 64-bit.
+ */
+bool target_is_riscv64(const TargetInfo *ti);
+
 /**
  * target_riscv64:
  *
- * Returns whether the target architecture is riscv64
+ * Returns whether the target architecture is RISC-V 64-bit.
  */
 bool target_riscv64(void);
 
diff --git a/target-info.c b/target-info.c
index 6e66f48e1ff..6d57cad5d33 100644
--- a/target-info.c
+++ b/target-info.c
@@ -96,9 +96,9 @@ bool target_big_endian(void)
     return target_endian_mode() == ENDIAN_MODE_BIG;
 }
 
-bool target_base_arm(void)
+bool target_is_base_arm(const TargetInfo *ti)
 {
-    switch (target_arch()) {
+    switch (ti->target_arch) {
     case SYS_EMU_TARGET_ARM:
     case SYS_EMU_TARGET_AARCH64:
         return true;
@@ -107,19 +107,34 @@ bool target_base_arm(void)
     }
 }
 
+bool target_base_arm(void)
+{
+    return target_is_base_arm(target_info());
+}
+
+bool target_is_arm(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_ARM;
+}
+
 bool target_arm(void)
 {
-    return target_arch() == SYS_EMU_TARGET_ARM;
+    return target_is_arm(target_info());
+}
+
+bool target_is_aarch64(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_AARCH64;
 }
 
 bool target_aarch64(void)
 {
-    return target_arch() == SYS_EMU_TARGET_AARCH64;
+    return target_is_aarch64(target_info());
 }
 
-bool target_base_ppc(void)
+bool target_is_base_ppc(const TargetInfo *ti)
 {
-    switch (target_arch()) {
+    switch (ti->target_arch) {
     case SYS_EMU_TARGET_PPC:
     case SYS_EMU_TARGET_PPC64:
         return true;
@@ -128,27 +143,73 @@ bool target_base_ppc(void)
     }
 }
 
+bool target_base_ppc(void)
+{
+    return target_is_base_ppc(target_info());
+}
+
+bool target_is_ppc(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_PPC;
+}
+
 bool target_ppc(void)
 {
-    return target_arch() == SYS_EMU_TARGET_PPC;
+    return target_is_ppc(target_info());
+}
+
+bool target_is_ppc64(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_PPC64;
 }
 
 bool target_ppc64(void)
 {
-    return target_arch() == SYS_EMU_TARGET_PPC64;
+    return target_is_ppc64(target_info());
+}
+
+bool target_is_s390x(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_S390X;
 }
 
 bool target_s390x(void)
 {
-    return target_arch() == SYS_EMU_TARGET_S390X;
+    return target_is_s390x(target_info());
+}
+
+bool target_is_base_riscv(const TargetInfo *ti)
+{
+    switch (ti->target_arch) {
+    case SYS_EMU_TARGET_RISCV32:
+    case SYS_EMU_TARGET_RISCV64:
+        return true;
+    default:
+        return false;
+    }
+}
+
+bool target_base_riscv(void)
+{
+    return target_is_base_riscv(target_info());
+}
+
+bool target_is_riscv32(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_RISCV32;
 }
 
 bool target_riscv32(void)
 {
-    return target_arch() == SYS_EMU_TARGET_RISCV32;
+    return target_is_riscv32(target_info());
+}
+
+bool target_is_riscv64(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_RISCV64;
 }
 
 bool target_riscv64(void)
 {
-    return target_arch() == SYS_EMU_TARGET_RISCV64;
+    return target_is_riscv64(target_info());
 }
-- 
2.52.0.windows.1


