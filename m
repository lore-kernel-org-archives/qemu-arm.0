Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5035CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 17:17:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSeMV-0006W7-Qr; Thu, 28 May 2026 13:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wSeMM-0006TH-H1
 for qemu-arm@nongnu.org; Thu, 28 May 2026 13:17:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wSeMJ-00046Y-Ox
 for qemu-arm@nongnu.org; Thu, 28 May 2026 13:17:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49041fb8c23so53838225e9.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 10:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779988646; x=1780593446; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HArTwgODQoYaXXWISLaGAP/t/ZOAHV1MrGfG2day6lw=;
 b=Afp90UcRSByqxn8a3+HUxQt6poAfoY4iV3X4S4Jsia/AjU/yMZVeFEJV8dNarNpf8+
 tuN2hXtbVgyzs8Pw4sJWAMXb55HMTZfYba47UZCqnxz+Od2e2YcaM5fINwkOVTUYGYV5
 I1ZDvBHCrjbzz7XkbX5ZqXUDhMwCe16fMoBAisAAwEhxTMRFOuV3PxEdWeyhJo+O32PQ
 9arXEEKbZ7BGxG5LnerYjUHHhCRBn8bg/k4NLcM0xOH7rJYbkz4Cwm8FxAZMgoNJGu1V
 N2ojKSTfkTw1u7pXMSgSLT9wb88UK5JQmQRgugCPT1/IaOCjeN1YczZheQmpKWAwoBIq
 k3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779988646; x=1780593446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HArTwgODQoYaXXWISLaGAP/t/ZOAHV1MrGfG2day6lw=;
 b=jeW5DMS9UM2KfJzUJZb3cMolXzHXEzA8p57JLFP8N3OpVz6hwy2RJ+oUbb/jpBJe2B
 Hl6sK+fZyXuIjRxHkc5NMXV54AANWvDpz52x9wW4p1T4LnARvey6TG9uxPCmpYa2GbFq
 pIUlDcJhACvQyuliYaQAwskGbNQSnmTV4eU/Fe10WpjW11hiMhUFcnA+dqwFzgCTKzVO
 A13QEUm8pTpaZovq3uhWoM8jJDnJ6tWst0DODlvsjIw7+dr24psHUjnJKgDJbb4BPnqb
 pwMrCy8d0yHLkBvmkKX7jRWFcRSaUKRjSx4Rp6kMpqYpwJmBcrvW6XsF2JsCfu8d91TZ
 odMA==
X-Gm-Message-State: AOJu0YxcCNPgL5Yr5zgUB9dGijYCluQOMcvft5GeGaHywhJIS5V/k0UL
 oZbgjd9kew1nbrv3QtxXHeMGFToPMpyJdnhwJDEuab3B1heEF9mBWUv12gEvwhAG
X-Gm-Gg: Acq92OE9pk39vygRLNwjmcHRvA61033uWubf312C0cWXr72ds2xYWKsvyvMIvzjpXHo
 uAE7qF5Mks126hun4z+/SWsR+jZPA3oqGd7ISiXRxQ6WzMzqaR9349C27HD97s9CGscov4KZs9P
 /6c/ax+h+IIjF3lmXjULPHMrLmEl36I/ugOh5yF5vU3a230Rd5tkAxFw+FEsy3XMcmKUTwEZMha
 Nj+ox1VT7+Jq0rYZ3EJ7NgHGPPV1CwlOcJdVZV9lTKa7n/rUX3TzJF3LOTDDsFIPBYkfO4Ts44j
 TuF6uo9K8dGmmKjHRGApLroJkcPGdP3mdQz1BGLGAw3Ks1JcX7V5XRo4bccDFRltr747nD/2QSp
 54RvUfNetIS/3BaOE3s6M/ChAZ7DbOThbwymNtMJhkUXnYP8gdSehBEGbj4xz2RSXFkkXwSLy58
 Egf4Zma8bzmBNJaElftufZgiKRR1Yv8tc79ajAl8MvzQ8lgKjw7Ne3tfwU6ud1+e0B
X-Received: by 2002:a05:600c:c3cd:20b0:48a:58ae:993b with SMTP id
 5b1f17b1804b1-490428c97a1mr328552935e9.16.1779988646074; 
 Thu, 28 May 2026 10:17:26 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49092968066sm53774085e9.15.2026.05.28.10.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 10:17:25 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrey Volkov <andrey@volkov.fr>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v4 1/7] hw/arm/sabrelite: Open code DEFINE_MACHINE_ARM
Date: Thu, 28 May 2026 19:17:11 +0200
Message-ID: <8c31da0ef6b6c49d9f43979040f0a723632c6c4e.1779986496.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779986496.git.matyas.bobek@gmail.com>
References: <cover.1779986496.git.matyas.bobek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Open code the DEFINE_MACHINE_ARM macro in preparation of creating
SabreliteMachineState class.

Signed-off-by: Matyáš Bobek <matyas.bobek@gmail.com>
Signed-off-by: Pavel Pisa <pisa@fel.cvut.cz>
Tested-by: Pavel Pisa <pisa@fel.cvut.cz>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Pavel Pisa <pisa@fel.cvut.cz>
---
 hw/arm/sabrelite.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index db5669c5c2..04484aaa14 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -104,8 +104,10 @@ static void sabrelite_init(MachineState *machine)
     }
 }
 
-static void sabrelite_machine_init(MachineClass *mc)
+static void sabrelite_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Freescale i.MX6 Quad SABRE Lite Board (Cortex-A9)";
     mc->init = sabrelite_init;
     mc->max_cpus = FSL_IMX6_NUM_CPUS;
@@ -114,4 +116,18 @@ static void sabrelite_machine_init(MachineClass *mc)
     mc->auto_create_sdcard = true;
 }
 
-DEFINE_MACHINE_ARM("sabrelite", sabrelite_machine_init)
+static const TypeInfo sabrelite_machine_init_typeinfo = {
+    .name          = MACHINE_TYPE_NAME("sabrelite"),
+    .parent        = TYPE_MACHINE,
+    .class_init    = sabrelite_machine_class_init,
+    .instance_size = sizeof(MachineState),
+    .abstract      = false,
+    .interfaces    = arm_machine_interfaces,
+};
+
+static void sabrelite_machine_init_register_types(void)
+{
+    type_register_static(&sabrelite_machine_init_typeinfo);
+}
+
+type_init(sabrelite_machine_init_register_types)
-- 
2.54.0


