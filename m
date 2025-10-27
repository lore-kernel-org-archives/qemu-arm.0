Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BF1CCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:11:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL25-0001Aj-3U; Mon, 27 Oct 2025 07:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1l-0000ob-Te
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:04:48 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1Q-0005eW-Dm
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:04:41 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-63c0c9a408aso7200497a12.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563034; x=1762167834; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZIvi1/lYtWJC7eyEqsDEoShyfCc3iWMPs/r4/flWQto=;
 b=bb3AQ3j5l8zXhSgmO2adb56/xGa/DxgutMM8okdS+t9VSAsiSnknXjfUDanz0U6iv+
 MT1oIc1pnmyh42/jfFsg0jaBpG8U1KqwyLRq9gGDU44JIIFGXezQX5D6CAjiJTp3EHtM
 +lREopgl3SQW3gIhxFUwjEPT0xdxKxfOnO046GqdKKpKGI4wrFzhMvyYk+p1igxvKoTj
 4xjXOwGMk4eKBs7kbawuT/CQu+dY02w4stT0SRpvPG7xkzgWjI/6Ta+XxEqOdGHdg92D
 ZVLLtM99Q2kijBF+rdOYkvhAwZAMasJeW7GlFHv6ELJ2pmxED40/0h6bbcx5qJiOQcmg
 nFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563034; x=1762167834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZIvi1/lYtWJC7eyEqsDEoShyfCc3iWMPs/r4/flWQto=;
 b=ku6NnP1jI+tz5L/MLzEXKMWX1WsME7TSAnVlPQcVepx2ivuxy55d1iTYrcD4n5Yqgx
 AzwoQd9Y/fdzV+c/B7Z5XI9aF6ykwcUmglkD2n2Xu6Uv3E1fWfXok7/2dPvCMR43M8u6
 z2X8Rpl+QivoQh0/vFmQgUbOeSQ+RXNAzb2nN79mW3dNou8+zQRW/gEbbN1BrBT00Enu
 eesJgtVbyna/raTrh8PraK7JGCa5v2ur55XwtGF2BnA3VVLs8nZdNfWPpr6BoSw4KJFB
 za/2Mmc8kVydH7qbYgtpEPVyozEsQzXM3RSsIJILJwu0QSrI5GveZJWgRJScRwMd/WDF
 k8Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7/WYXDs394kb+M4VQBfPnuAr62xjSXZPKKrfuGm9Bap9969dwX3r2Ej5zCnAn31Y+VECU5IQewQ==@nongnu.org
X-Gm-Message-State: AOJu0YyW3yzRxw1/HG+S452VE4xBWEAofxnVLoNBTysEEGncwcGTaGNl
 9JU9mLtCCa+OM3Srf+nna8F16yEuKOvBqZpKvhhuhuSm7tMGN3OO08ufiHFpO2rAir8=
X-Gm-Gg: ASbGncsGDjKRZdZwu4JPZTf2bf6Gqq+ALiXveoAmFXRz1T4CvdBmC0BbJNUN1JwQ+WR
 nWIWUHhqeVdjbgfnBNnvQ8Zm2t75Y8djQCenAXmW19EI/L51Zdnh56q/q8Le6j3DRojjB3mfabY
 siaMI+7XY82DRY8ATj44txGjxts5tbTk0UC4esgmCOj52KH0t0MydlR6eCFnbQPZoobPcX3tXe1
 SMS8USCtjQ9TGb0DLn9nejmwFs8luAXA1t0v80I6azUFYeogQPgNbNFjlnzOR9l6u+ZKOVpUOYL
 JL3ce53VezJYFnSp6+g6FnNN6ovRSuEu5ZTEXWPXcbBVfSbAh+h2Tz3buGoUliyR8FDY7Yyjn5O
 kDtDo3Kg0E50R45qUyCLqHG0BdZS6hGVos+geUMkKOVQF4J/dP2Dwv+IPtsB8TDt0Ws0VDaZBCD
 PD
X-Google-Smtp-Source: AGHT+IFqi4DYTDraZDVQCAqaxCZQ9SXHunmox4MeAZ4HIYUvpZkNnk2vLu7C3k7LDzTFBAJiKPtWYw==
X-Received: by 2002:a05:6402:3554:b0:63c:4d42:993d with SMTP id
 4fb4d7f45d1cf-63c4d429b92mr29963363a12.31.1761563033853; 
 Mon, 27 Oct 2025 04:03:53 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7efd0fabsm5717380a12.34.2025.10.27.04.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F03305FAF1;
 Mon, 27 Oct 2025 11:03:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Julian Ganz <neither@nut.email>
Subject: [PATCH 09/35] plugins: add hooks for new discontinuity related
 callbacks
Date: Mon, 27 Oct 2025 11:03:16 +0000
Message-ID: <20251027110344.2289945-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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

From: Julian Ganz <neither@nut.email>

The plugin API allows registration of callbacks for a variety of VCPU
related events, such as VCPU reset, idle and resume. In addition, we
recently introduced API for registering callbacks for discontinuity
events, specifically for interrupts, exceptions and host calls.

This change introduces the corresponding hooks called from target
specific code inside qemu.

Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin.h | 12 ++++++++++++
 plugins/core.c        | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 8cf20cd96f7..cea0a68858b 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -161,6 +161,9 @@ void qemu_plugin_vcpu_exit_hook(CPUState *cpu);
 void qemu_plugin_tb_trans_cb(CPUState *cpu, struct qemu_plugin_tb *tb);
 void qemu_plugin_vcpu_idle_cb(CPUState *cpu);
 void qemu_plugin_vcpu_resume_cb(CPUState *cpu);
+void qemu_plugin_vcpu_interrupt_cb(CPUState *cpu, uint64_t from);
+void qemu_plugin_vcpu_exception_cb(CPUState *cpu, uint64_t from);
+void qemu_plugin_vcpu_hostcall_cb(CPUState *cpu, uint64_t from);
 void
 qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1,
                          uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5,
@@ -258,6 +261,15 @@ static inline void qemu_plugin_vcpu_idle_cb(CPUState *cpu)
 static inline void qemu_plugin_vcpu_resume_cb(CPUState *cpu)
 { }
 
+static inline void qemu_plugin_vcpu_interrupt_cb(CPUState *cpu, uint64_t from)
+{ }
+
+static inline void qemu_plugin_vcpu_exception_cb(CPUState *cpu, uint64_t from)
+{ }
+
+static inline void qemu_plugin_vcpu_hostcall_cb(CPUState *cpu, uint64_t from)
+{ }
+
 static inline void
 qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1, uint64_t a2,
                          uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6,
diff --git a/plugins/core.c b/plugins/core.c
index 40d001d39ad..35a252d2729 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -105,6 +105,30 @@ static void plugin_vcpu_cb__simple(CPUState *cpu, enum qemu_plugin_event ev)
     }
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
+static void plugin_vcpu_cb__discon(CPUState *cpu,
+                                   enum qemu_plugin_event ev,
+                                   enum qemu_plugin_discon_type type,
+                                   uint64_t from)
+{
+    struct qemu_plugin_cb *cb, *next;
+    uint64_t to = cpu->cc->get_pc(cpu);
+
+    if (cpu->cpu_index < plugin.num_vcpus) {
+        /* iterate safely; plugins might uninstall themselves at any time */
+        QLIST_FOREACH_SAFE_RCU(cb, &plugin.cb_lists[ev], entry, next) {
+            qemu_plugin_vcpu_discon_cb_t func = cb->f.vcpu_discon;
+
+            func(cb->ctx->id, cpu->cpu_index, type, from, to);
+        }
+    }
+}
+
 /*
  * Disable CFI checks.
  * The callback function has been loaded from an external library so we do not
@@ -557,6 +581,24 @@ void qemu_plugin_vcpu_resume_cb(CPUState *cpu)
     }
 }
 
+void qemu_plugin_vcpu_interrupt_cb(CPUState *cpu, uint64_t from)
+{
+    plugin_vcpu_cb__discon(cpu, QEMU_PLUGIN_EV_VCPU_INTERRUPT,
+                           QEMU_PLUGIN_DISCON_INTERRUPT, from);
+}
+
+void qemu_plugin_vcpu_exception_cb(CPUState *cpu, uint64_t from)
+{
+    plugin_vcpu_cb__discon(cpu, QEMU_PLUGIN_EV_VCPU_EXCEPTION,
+                           QEMU_PLUGIN_DISCON_EXCEPTION, from);
+}
+
+void qemu_plugin_vcpu_hostcall_cb(CPUState *cpu, uint64_t from)
+{
+    plugin_vcpu_cb__discon(cpu, QEMU_PLUGIN_EV_VCPU_HOSTCALL,
+                           QEMU_PLUGIN_DISCON_HOSTCALL, from);
+}
+
 void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
                                        qemu_plugin_vcpu_simple_cb_t cb)
 {
-- 
2.47.3


