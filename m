Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F2BECD99E
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 20:02:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo5Vl-00078Z-FN; Thu, 05 Feb 2026 14:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5Vd-0006vY-JJ
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:59:25 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5VZ-0003Ah-Fv
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:59:25 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so1401317f8f.1
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 11:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770321560; x=1770926360; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0CayTsyi6p8w45gl32kyiBwM+aaroeJuLz0N2LnaBc=;
 b=KGj6hoH2tMjOkoSB8NtCX2TxeFPxm33xYdlfKWCb4GpSY4pZHMp/zq1sBiZLlfuk06
 BH3fvw1tVqIY5Gtez8bkiYvkeLV8aZ5U/Sn2qpAV2L83XIWbLR6j1GnlKs5kOz5X2Shh
 yC+qGxz/99YXEE0WIWjczvX1p6ZBcGfp3lr3W0S6LwmrFamPSAXV8klmMzfBSigETD/J
 yFR99znNsb0ynNrRom+mWAVkx9cjJ//G34tIP3lwI8+kwLr8OXb8dCtSjBe7+/dqqrIF
 ihZOxS7D0S2n7ppLfJcClXfvetphDbELKZz0Ecw7p2BW5L2KQqXQb4lRvmAfswWMnRW1
 4Ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770321560; x=1770926360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M0CayTsyi6p8w45gl32kyiBwM+aaroeJuLz0N2LnaBc=;
 b=JL8Z5ua4e/3OUOnU26rUOOboe2PyfelG2hSteqUDHNRTPrnQO9vHyYkXKj65sqGL4L
 oB3QA5dkI0lK0OFeRLCuYLnsDi54ZcpaSljyckZQX6sAVSZWRkpZ+jQz+BP6rBS/KJuo
 3LOPDdi1tKdT7LL2eaA11sq+WZYIq9XE6W8fJ+PJci5doxkSDagaISZexDl6wTA4ptTu
 rQKbKCGigkIt0pGaq7wl04z/VfyB+ICWqtXNs7d0rtTvjY/Jgcasmj/J6amA7TBVimMk
 jmP6dcBiIA5yAy8nz3mOja31N3o2jWbGCQMzJylSQaPPn5jT8tqU9hxCkYY0ZzkCA7Vp
 oj0Q==
X-Gm-Message-State: AOJu0YyKhHkZ50BMZfbYc9SzPZwvi3lA+RqGtoM6Ap3Jc9mrK8n/8Gxm
 K85FTfOO5DEZc/Yf3rj2sS/FzhwcpUmA9U4SJjdyytTUq8xRL+omAnsA
X-Gm-Gg: AZuq6aKpvxC7fvdg9+vaeC5V1geSD5vLO7EZlPg403+cEj4dARRioRGJqfoZ9OgZh9g
 icX9CsAxJ6lspfqlV8K1fEXyiuO52mP/0THi0by7i3dmY2KRfwueK5WMO08AJnLp1+H9sxyVtIv
 fEG3bUOWGLzUnezvmtIfqcxrrIaDrdhliVoNwDCrhHnNGfjE4ZvAiIv2QoplXYuxmPSvn7RQ+sP
 1i/39c+9lXWyANq/SpTlNpE9nRLzvsG90pRFS0oOjV0aA0qyvLdxa3SLLcVhd1sax63273HmVg/
 PhWXe0z2ohDea9jgCfFF1bOHUxkzwYgUhZ0s95+LNUCPgUad++oYlfxpvEtFKXQo/Hcj/paQQt1
 mwqCjDSqDkqteTe2lPJ5mBO62Fkrt0vmqnBA/c+RvDxoF4uYKXI8BBGyQgOqODS+EnGTazOPmLo
 fpnqNEHgPMM3QKTwd0e4rsLFKwy4WiDQ==
X-Received: by 2002:a05:6000:310b:b0:436:1973:3b05 with SMTP id
 ffacd0b85a97d-4362933bdf4mr568935f8f.2.1770321559945; 
 Thu, 05 Feb 2026 11:59:19 -0800 (PST)
Received: from thinkpad-t470s.. ([93.140.16.93])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-436297450b4sm514079f8f.34.2026.02.05.11.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 11:59:19 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 francisco.iglesias@amd.com, Ruslan_Ruslichenko@epam.com,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH 24/29] hw/core: Add FDT support to Remote Port GPIO
Date: Thu,  5 Feb 2026 20:58:19 +0100
Message-ID: <20260205195824.2610192-25-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
References: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Implement the FDTGenericIntc interface for the Remote
Port GPIO device.

This enables the device to be recognized as an interrupt
controller when instantiated via the fdt-generic framework.
It allows other devices defined in the Device Tree to connect
their interrupt lines to this GPIO controller using standard
FDT properties (e.g., 'interrupts' and 'interrupt-parent').

The implementation maps the interrupt specifier from the
Device Tree cells to the corresponding internal GPIO input
line based on the configured cell offset.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/remote-port-gpio.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/core/remote-port-gpio.c b/hw/core/remote-port-gpio.c
index b9bdbcc5a5..c17a65f63a 100644
--- a/hw/core/remote-port-gpio.c
+++ b/hw/core/remote-port-gpio.c
@@ -19,6 +19,8 @@
 #include "hw/core/irq.h"
 #include "trace.h"
 
+#include "hw/core/fdt_generic_util.h"
+
 #include "hw/core/remote-port.h"
 #include "hw/core/remote-port-proto.h"
 #include "hw/core/remote-port-gpio.h"
@@ -153,14 +155,34 @@ static Property rp_properties[] = {
     DEFINE_PROP_BOOL("posted-updates", RemotePortGPIO, posted_updates, true),
 };
 
+static int rp_fdt_get_irq(FDTGenericIntc *obj, qemu_irq *irqs,
+                          uint32_t *cells, int ncells, int max,
+                          Error **errp)
+{
+    RemotePortGPIO *s = REMOTE_PORT_GPIO(obj);
+
+    if (cells[s->cell_offset_irq_num] >= s->num_gpios) {
+        error_setg(errp, "RP-GPIO was setup for %u interrupts: index %"
+                   PRIu32 " requested", s->num_gpios,
+                   cells[s->cell_offset_irq_num]);
+        return 0;
+    }
+
+    (*irqs) = qdev_get_gpio_in(DEVICE(obj), cells[s->cell_offset_irq_num]);
+    return 1;
+};
+
 static void rp_gpio_class_init(ObjectClass *oc, const void *data)
 {
     RemotePortDeviceClass *rpdc = REMOTE_PORT_DEVICE_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    FDTGenericIntcClass *fgic = FDT_GENERIC_INTC_CLASS(oc);
+
     rpdc->ops[RP_CMD_interrupt] = rp_gpio_interrupt;
     dc->legacy_reset = rp_gpio_reset;
     dc->realize = rp_gpio_realize;
     device_class_set_props_n(dc, rp_properties, ARRAY_SIZE(rp_properties));
+    fgic->get_irq = rp_fdt_get_irq;
 }
 
 static const TypeInfo rp_info = {
@@ -171,6 +193,7 @@ static const TypeInfo rp_info = {
     .class_init    = rp_gpio_class_init,
     .interfaces    = (InterfaceInfo[]) {
         { TYPE_REMOTE_PORT_DEVICE },
+        { TYPE_FDT_GENERIC_INTC },
         { },
     },
 };
-- 
2.43.0


