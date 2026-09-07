Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B22CC79FA9
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:44:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3cRg-0007ul-EY; Mon, 07 Sep 2026 12:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cRe-0007qv-RU
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:43:46 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cRc-0002uC-JC
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:43:46 -0400
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so38009965e9.2
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 09:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799420; x=1789404220;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cBS24KyVkFdx9K1mrb9mnaPLSyXbJlcPXKfV6TpuYbc=;
 b=OFSl7LpS5Gwyg1yiQtFty273ubJwJgsyPGGQ4pSR6TewmHNE0rtfQgwqHvFB7rkhK4
 u5ox4FcrUhGZHHqGebWRoQX9IDBrADzlqkPz6GgfZA38KkX8D9QIajm+moP3cmW8D+c+
 Ak9KXX1PzMo6wY/byxzBGHNrFeDgvFG/Th7eV9Y0ZIA2JPDQ0Duam8o2JgG3CUqe4J6G
 7+WrkU8GsjpjwZCWe0ZFJlmRhJ1eAhu8UyJGXXbFo3X7MUv6Y2ulaBbPAzItoXBrOIcW
 aEYQoERIENC+/Jcpw/NDYPH6EcDrNSkp6ErH9WfoG6VkFY9dZXjLpfRcrA3IYjR5uRlF
 E6lw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzh9/t7jN/s/ZCH5eCncnYXN2v0lfrwgaIbZIKGIw0AFLnUEctcvmO8l/IidD17V4+kS3wXwdzwjQ==@nongnu.org
X-Gm-Message-State: AFuF++maeF8KkhFGqIi06MYaRa+8ZBVw1mwfCX9g3RfLjuhqc0ghLYe4
 UmiXbrk4KMNCELOBaI0FYGNHgdplQPAxAOFVBEgxvjK+yowyyOpqVDks
X-Gm-Gg: AYBFou1ns7q0gG0CxRzFz+k3rPzG2bRkeknWc9WiCreKoRhxClS4ryr/pjThcU7gGWM
 Gr8AsVz4Z9mPV5d91vT6PAs/ZkRp7seD+VzQhyPTcvkY8SgIDzJ2e7hmewdF95Jep2p+6HQ1nGc
 PnBCTCWh2dbMO7LC5fIY7gO8uB7mmUVD360OhbLVkoFmDWARNbXC23XWhYCDcB2phNbz3bpiSS4
 lr65NlK+Yq3OvJpV6QNqzhkrHGk6Atl4M04Kh+tRXL21ZPmWD9RZoElGIriQ9kWmXSgfvbrAkwW
 NeJ2DkIbwy2fC9u8My3RSOBp4kAtvg4bTwNGrPtdVxvQcOcjIX/2Ttq0T7znxAVI4JPQ1Yum1Op
 gibq6ufIiODK6wzBlBYfF8P9SYd8RjS0oHrdpZapG9yMrCcCIF7/8zV4SSBPnV0ZVNxdAfBTKGr
 6bCaV6qxpYZ5kny8RM1k4vlHI+Vs9eJsH8uBYQUqcqy7mKi2CaCwt4ueFyMg3Tm7TL3UMyGYyww
 YcfFlgdfq5a6f5eBjBzdY5tzTpy8VLT4Rw=
X-Received: by 2002:a05:600c:474a:b0:49c:e42b:a4ac with SMTP id
 5b1f17b1804b1-49cf823f60amr211651975e9.11.1788799420181; 
 Mon, 07 Sep 2026 09:43:40 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5563c6csm349072185e9.4.2026.09.07.09.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:43:39 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:41:56 +0200
Subject: [PATCH 06/50] hw/i2c: pca954x: migrate mux state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-6-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799319; l=1912;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=6X3qtF5y9bDFv2QNu2TGa306El/FnP4ElGjKxh8N7cM=;
 b=RiY+touNeouJPHPg0XaLz54f1yFoRxrHYeecw6h5+E0u9TudjvUcFTHm+cxKznm1V2R++OJcC
 WWf1JvKmu5fD9TJJYF0+bv84pS8EjMvOlHxF49uXBu7d64srbnWoc5A
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.45; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f45.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The pca954x model had no VMStateDescription, so neither the channel
selection nor the PCA9545 interrupt status survived a migration.

This changes the migration stream of the pre-existing PCA9546 and
PCA9548, which an older QEMU rejects.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/i2c/i2c_mux_pca954x.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 4bb078a03c..597e57d99a 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -28,6 +28,7 @@
 #include "hw/core/irq.h"
 #include "hw/core/qdev.h"
 #include "hw/core/qdev-properties.h"
+#include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/queue.h"
 #include "qom/object.h"
@@ -270,6 +271,28 @@ static void pca954x_init(Object *obj)
     }
 }
 
+static int pca954x_post_load(void *opaque, int version_id)
+{
+    Pca954xState *s = PCA954X(opaque);
+
+    pca954x_enable_channel(s, s->control);
+    qemu_set_irq(s->int_out, s->int_status == 0);
+    return 0;
+}
+
+static const VMStateDescription vmstate_pca954x = {
+    .name = "pca954x",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = pca954x_post_load,
+    .fields = (const VMStateField[]) {
+        VMSTATE_SMBUS_DEVICE(parent, Pca954xState),
+        VMSTATE_UINT8(control, Pca954xState),
+        VMSTATE_UINT8(int_status, Pca954xState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const Property pca954x_props[] = {
     DEFINE_PROP_STRING("name", Pca954xState, name),
 };
@@ -287,6 +310,7 @@ static void pca954x_class_init(ObjectClass *klass, const void *data)
 
     dc->desc = "Pca954x i2c-mux";
     dc->realize = pca954x_realize;
+    dc->vmsd = &vmstate_pca954x;
 
     k->write_data = pca954x_write_data;
     k->receive_byte = pca954x_read_byte;

-- 
2.50.1


