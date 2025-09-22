Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F38CAC5A7
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 09:43:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0d0n-0004YS-O1; Mon, 22 Sep 2025 05:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czr-0002VR-JW
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czE-0000gq-3a
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:11 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso4473385f8f.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 02:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533848; x=1759138648; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6IMWbDFgDEMOUiMUfT2TDkGRm3klPMgO+lre4zsnFwM=;
 b=ylLRNwcsrOhMLbtImmXvXmGlCCW+qQj8xvLlirvqN9JgzkiRd9b2YoFfSbrQ8/w9Ib
 8ZcK1JGpazrFwwaUEfbBa2Cgzr4k29u76bF+S2C1uMZ52Q1pkWIWVYFsK4oHumHspEZn
 WQEi0PCRwGER/U92RIXnmxzvi98EAr5GAOynSFUjgxKcfnuJCWfaQf6mCxMd84vl5Hqc
 VECnUtF+1Fb1MpQCww7VlRyXSj5EgYvphtOk9OLbw2bfO1pDbtEAS8+9s19wesXc35t7
 K2XD0lXCeRPTa2EqyWlTKjg52ri8ZUbKBHsotzLTVu0sJwGpYF0mo7goQX7EWc/YTk0+
 Lvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533848; x=1759138648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6IMWbDFgDEMOUiMUfT2TDkGRm3klPMgO+lre4zsnFwM=;
 b=AhEKvyCHfSoHKgbK9ZESS7hXd266/3jNsDxdXMZaWOA4nbwnTsqORpRZn5XYOPRUPc
 A3rYWglQQ/r5+gAhkVIGzkiuSQU2DAv2Rbh+z3nX37vT1PK55+6aA4ItasmLNkGq7iYL
 9NVXHVjEDzDl2vOXOkcRFajJOPPQhlHLnXY9PVInFYCi7HQpPGKi9+LLrXrFdtZgHF7F
 FpH9NE4ol8KMc6pE/lve8qT7kGuZAIeU0AO4kJ6VaVlwXsBK38pE/rqaDsqHqW6gwk79
 HwNqy0MG5r9duDHhNCK9T7qUPnbV2c+FUNgvkbNCrd0sKu6Kdhl2WNkng9iT+1f23TKc
 9HTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtmg+x0aD+kiMy1xaLx1rL/ZBQEjmxKx0nHOY3oNSsmyIr8yvutKd27xrX4j7sR40urPyOVQTkrg==@nongnu.org
X-Gm-Message-State: AOJu0YzXOIcgrtPQe91g0frhA8DT8nIKNUHx/yje0WsAvl/wvK5RDlJT
 bVVdZjzOig6WqXSiy+AD4IOHwqcSTgPlT/U7LNBUz+J7qkCdkJ5sO3EXVAoeqdJMUo8=
X-Gm-Gg: ASbGnctz/Y7/bwBSKptogWrIwH47y+H/w/lq/8V9FdN3T0nviS7iB+jInhdrC4ZEMmc
 gl8lGuBurnU80JbWqcheIprUvvJR6nJp296rAbnAbG+XRwd2PCL7HsBF6BKRc7dAZp/+5jin+Kx
 7GM0bSgSZpapI4r7Ex1ta7uy3xbPRMI2prTdt0o4eXdguNEUU5bHxucjpPnzH1pqiSwNeJD4FDq
 2d4BVCNgR75Ey1/+C5JXjbHVSoJZ04oMyrG3ov+0mYzpQ9z+NibuR83pjXQZS2KevbKX5JpSEIc
 65aYb3dgYx0tC/2xFrbbVJMXphO731X4HjEtu4y2TgE1p2YPqK8ZgGAH9FRbZglzlTPwi5ehC96
 /E+C0K0Ksi9EqYXhvSs/rTgQ=
X-Google-Smtp-Source: AGHT+IHzcbP4ZgAQ4czQX/WUR2ZTlhWheiedH3ZK+CqlCjpak/wZDsCWom84WogTfvuujwoB7Ghnwg==
X-Received: by 2002:a05:6000:42c9:b0:3f7:b7ac:f3aa with SMTP id
 ffacd0b85a97d-3f7b7acf7e9mr3396731f8f.29.1758533847808; 
 Mon, 22 Sep 2025 02:37:27 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3fd84338ca2sm4200856f8f.42.2025.09.22.02.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2C5255FA29;
 Mon, 22 Sep 2025 10:37:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 17/25] contrib/plugins/uftrace: skeleton file
Date: Mon, 22 Sep 2025 10:37:02 +0100
Message-ID: <20250922093711.2768983-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We define a scoreboard that will hold our data per cpu. As well, we
define a buffer per cpu that will be used to read registers and memories
in a thread-safe way.

For now, we just instrument all instructions with an empty callback.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250902075042.223990-2-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/uftrace.c   | 73 +++++++++++++++++++++++++++++++++++++
 contrib/plugins/meson.build |  3 +-
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 contrib/plugins/uftrace.c

diff --git a/contrib/plugins/uftrace.c b/contrib/plugins/uftrace.c
new file mode 100644
index 00000000000..4af0130b159
--- /dev/null
+++ b/contrib/plugins/uftrace.c
@@ -0,0 +1,73 @@
+/*
+ * Copyright (C) 2025, Pierrick Bouvier <pierrick.bouvier@linaro.org>
+ *
+ * Generates a trace compatible with uftrace (similar to uftrace record).
+ * https://github.com/namhyung/uftrace
+ *
+ * See docs/about/emulation.rst|Uftrace for details and examples.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <qemu-plugin.h>
+#include <glib.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+typedef struct Cpu {
+    GByteArray *buf;
+} Cpu;
+
+static struct qemu_plugin_scoreboard *score;
+
+static void track_callstack(unsigned int cpu_index, void *udata)
+{
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t n_insns = qemu_plugin_tb_n_insns(tb);
+
+    for (size_t i = 0; i < n_insns; i++) {
+        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
+
+        uintptr_t pc = qemu_plugin_insn_vaddr(insn);
+        qemu_plugin_register_vcpu_insn_exec_cb(insn, track_callstack,
+                                               QEMU_PLUGIN_CB_R_REGS,
+                                               (void *) pc);
+    }
+}
+
+static void vcpu_init(qemu_plugin_id_t id, unsigned int vcpu_index)
+{
+    Cpu *cpu = qemu_plugin_scoreboard_find(score, vcpu_index);
+    cpu->buf = g_byte_array_new();
+}
+
+static void vcpu_end(unsigned int vcpu_index)
+{
+    Cpu *cpu = qemu_plugin_scoreboard_find(score, vcpu_index);
+    g_byte_array_free(cpu->buf, true);
+    memset(cpu, 0, sizeof(Cpu));
+}
+
+static void at_exit(qemu_plugin_id_t id, void *data)
+{
+    for (size_t i = 0; i < qemu_plugin_num_vcpus(); ++i) {
+        vcpu_end(i);
+    }
+
+    qemu_plugin_scoreboard_free(score);
+}
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info,
+                                           int argc, char **argv)
+{
+    score = qemu_plugin_scoreboard_new(sizeof(Cpu));
+    qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
+    qemu_plugin_register_atexit_cb(id, at_exit, NULL);
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+
+    return 0;
+}
diff --git a/contrib/plugins/meson.build b/contrib/plugins/meson.build
index 1876bc78438..7eb3629c95d 100644
--- a/contrib/plugins/meson.build
+++ b/contrib/plugins/meson.build
@@ -1,5 +1,6 @@
 contrib_plugins = ['bbv', 'cache', 'cflow', 'drcov', 'execlog', 'hotblocks',
-                   'hotpages', 'howvec', 'hwprofile', 'ips', 'stoptrigger']
+                   'hotpages', 'howvec', 'hwprofile', 'ips', 'stoptrigger',
+                   'uftrace']
 if host_os != 'windows'
   # lockstep uses socket.h
   contrib_plugins += 'lockstep'
-- 
2.47.3


