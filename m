Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB45CCF9EC
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:09:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL2U-0001m0-BU; Mon, 27 Oct 2025 07:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL2R-0001gK-8P
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:05:23 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1a-0005eJ-IK
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:05:23 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b6d4e44c54aso793210866b.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563033; x=1762167833; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2nbP5MgtaqXwfRlBFEZTbsu+DGPvAW3IhkFVTkZlGB4=;
 b=QW8ixkxKbiMg+3OYqZLmXRL3rvjc8TeskQof/8AZKDEUn/+vUFa9tYdP1xA87Xc3yt
 ulIIw5ym3RvWzX8AzYb1SuWOSVU17bk3SKBKiFNnap8GG9eDUJFAI3qn6UKxw/KtByPo
 rW7TPZvJSqLMxL9fIaDS68G6shlt4v3yQps06Y994Bb11EC6y5KfVlOCAPopMxLbpjb3
 l9n+D+6Fz83FZCri5we2CLTF63uLGhS/Ciku6GAlWMH6ZcpqW3MiIPBtGlDxFqFZorg1
 dZtGQmWg5St75MouB5q9PP/15NfSM7R3/IdAnZHsaroAyswffRh9WtMLwwc/tWn+wrQk
 VChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563033; x=1762167833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2nbP5MgtaqXwfRlBFEZTbsu+DGPvAW3IhkFVTkZlGB4=;
 b=a+R/mXy5qI7sC+vdUnsz3uBfZZz5VcIMW8G1UG9uZmDgVJ4drEZ9SN4bzBAjLBDe5Z
 ljz3usfRpw5PdJ3JS0UVIHNzcptwcrbbMUnc/N464URT36tiHw3N1luQfaQeZTiml83U
 Fgdc4otbCM2PuZTTaRxJ2CH9TUW7gtwPopY2TeEp09I8P1Gf0E39wx3YwLWnIeLU7Tuo
 Ze6kHqkSOUFUD7/kRRju4vRxCDG/JKd3qRqR1un8qJI2cHL2TeZuWGSs+oNNinqLqUeD
 BJWLN+fsKt/TUmPQOp7bbCJgyYVFEtg3/kEa8puCQV1RKhIV7eWO2TDHxOXjcpjD8q00
 0iXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2kbGJDB4hPvzZeZxQBcCSjBY0mOISFYIa1Vu86mTkCZSfhbNHxdJRNdMgszCSx8WPJOM9hBWnBQ==@nongnu.org
X-Gm-Message-State: AOJu0YyO3XcW/8OzLT6+Ufh7BWaGvM8xE1wG3BPw/7V2/3MiQqtlmioS
 mbYrhcD1BaNlYt+Tl1/mfYicauBVQZ2xsnxfAqmrc7cLC5/zW/LUwUXEVAtrUEoTw2I=
X-Gm-Gg: ASbGnctOfmU606fXAHmPnfSWvkwBBpx4iGSTu1S94iR+tn811yjfZ7JpXKZH2Gp0v4x
 G4WP1ghFLxlokKNT0BMHL/OrxPn5ZAwDFl8PGsCUoIJPN1JiehEMAkme8haTGoR8ujsyE+hfEbe
 LNLoNgqDPt5d+PfkQTBIDO7kC84x3IovmVPxVTpKOpfLVcRpGuivpty+bHISISBQVOdeQ2Du30d
 GfEorMlp2bnHjLoNf3d1Mi+pv6gXXhLaGWwFkLO1ZJyo/z40ePbFOYuZJMr9wgUqsHnuJwSHxff
 mJhYDJdLzchi8LOf1p4Os/IPuSmkw9oXC+s0bsJq6IQJgJznOsbXOA11fEIKh8GHlt9Dp1+1PYq
 B0MlzExhDYUGu+A9M0TQCZolExeh0RFRnnuIeqr9nJeZkmmeWmanJ2d55bo4+JI78DCP9c5BYTh
 hV
X-Google-Smtp-Source: AGHT+IFr91iPDHDRr3Cmqs3DeVV0sQle3Y3rYCITFpNiuVXCsNTOHYeMDobWwi205Gv4jJIYEE4+dw==
X-Received: by 2002:a17:907:7f1a:b0:b04:5b0a:5850 with SMTP id
 a640c23a62f3a-b6474b36036mr4378079966b.40.1761563033218; 
 Mon, 27 Oct 2025 04:03:53 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8541fb5bsm729708966b.56.2025.10.27.04.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D71305FAE6;
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
Subject: [PATCH 08/35] plugins: add API for registering discontinuity callbacks
Date: Mon, 27 Oct 2025 11:03:15 +0000
Message-ID: <20251027110344.2289945-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
related events, such as VCPU reset, idle and resume. In addition to
those events, we recently defined discontinuity events, which include
traps.

This change introduces a function to register callbacks for these
events. We define one distinct plugin event type for each type of
discontinuity, granting fine control to plugins in term of which events
they receive.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin-event.h |  3 +++
 include/qemu/qemu-plugin.h  | 16 ++++++++++++++++
 plugins/core.c              | 15 +++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/include/qemu/plugin-event.h b/include/qemu/plugin-event.h
index 7056d8427b7..1100dae2123 100644
--- a/include/qemu/plugin-event.h
+++ b/include/qemu/plugin-event.h
@@ -20,6 +20,9 @@ enum qemu_plugin_event {
     QEMU_PLUGIN_EV_VCPU_SYSCALL_RET,
     QEMU_PLUGIN_EV_FLUSH,
     QEMU_PLUGIN_EV_ATEXIT,
+    QEMU_PLUGIN_EV_VCPU_INTERRUPT,
+    QEMU_PLUGIN_EV_VCPU_EXCEPTION,
+    QEMU_PLUGIN_EV_VCPU_HOSTCALL,
     QEMU_PLUGIN_EV_MAX, /* total number of plugin events we support */
 };
 
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 08bf366e363..60de4fdd3fa 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -281,6 +281,22 @@ QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
                                          qemu_plugin_vcpu_simple_cb_t cb);
 
+/**
+ * qemu_plugin_register_vcpu_discon_cb() - register a discontinuity callback
+ * @id: plugin ID
+ * @type: types of discontinuities for which to call the callback
+ * @cb: callback function
+ *
+ * The @cb function is called every time a vCPU receives a discontinuity event
+ * of the specified type(s), after the vCPU was prepared to handle the event.
+ * Preparation entails updating the PC, usually to some interrupt handler or
+ * trap vector entry.
+ */
+QEMU_PLUGIN_API
+void qemu_plugin_register_vcpu_discon_cb(qemu_plugin_id_t id,
+                                         enum qemu_plugin_discon_type type,
+                                         qemu_plugin_vcpu_discon_cb_t cb);
+
 /** struct qemu_plugin_tb - Opaque handle for a translation block */
 struct qemu_plugin_tb;
 /** struct qemu_plugin_insn - Opaque handle for a translated instruction */
diff --git a/plugins/core.c b/plugins/core.c
index ead09fd2f1e..40d001d39ad 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -569,6 +569,21 @@ void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
     plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_RESUME, cb);
 }
 
+void qemu_plugin_register_vcpu_discon_cb(qemu_plugin_id_t id,
+                                         enum qemu_plugin_discon_type type,
+                                         qemu_plugin_vcpu_discon_cb_t cb)
+{
+    if (type & QEMU_PLUGIN_DISCON_INTERRUPT) {
+        plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_INTERRUPT, cb);
+    }
+    if (type & QEMU_PLUGIN_DISCON_EXCEPTION) {
+        plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_EXCEPTION, cb);
+    }
+    if (type & QEMU_PLUGIN_DISCON_HOSTCALL) {
+        plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_HOSTCALL, cb);
+    }
+}
+
 void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,
                                    qemu_plugin_simple_cb_t cb)
 {
-- 
2.47.3


