Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E771DCA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 14:59:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHUM-0001Wu-Uv; Mon, 12 Oct 2026 10:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHUB-0001Ul-UE
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:58:48 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHU0-0005fB-7f
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:58:40 -0400
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48c02782159so1210675f8f.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 07:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817111; x=1792421911;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cBS24KyVkFdx9K1mrb9mnaPLSyXbJlcPXKfV6TpuYbc=;
 b=nJsBMXsnLBXAIUbrFyv51cShA/VnuGfac1XugPNe8hVeMg7KSkTrL6j1v5WVsNEFRT
 JVPFHox7qZH/tVXSSqNmott/75NJ9lqJIkq+EetChnvBMCNLLEvHVQB04okVix2x7f/V
 teQ5XIx3B5IVD1pZdNSLxhDxh7icq3PBRBcS6r8W5M3RCV7v4C4GqNDsVBzsNK5TISNl
 aypT7/AF6sZldVbYHNOTNLryuuFkiPXDwz7919ylIY1gkNfWlExRULkHtqhKiR7lSE8s
 fsUedHAhpWK00WL5LJnKxuEiuQlHok4ea8SPHLzGHvRnZV/ymA+6efl4s50w32wpBgZV
 keRA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxDF/PhTFINdXDpfSMGUYSeL4iViz+x6TO5IdduaEqF8UqGh1zj2wQivAO2WV5PBshQqm5iPTx5TA==@nongnu.org
X-Gm-Message-State: AFq9FYKmGC8IlvySJm5wUuzhsvna9ISJqgH0eYPizdSDViL8AwS0ZNxA
 pjVWVEvrdAxEt9I+hg+12hObhPzY6BVTV1gQUn5BtSVFE1h6WAo7oPxZ
X-Gm-Gg: AYBFou3XQr9ZcQ3gZvqo1C9VcQL+qQsio1o6aHfCoUB/3QhuNdeuiVOlT/oDj5TyLNY
 B0n4DM/eOrqDd0JR4yGS6d9sEmxpZDfykNR8bp5uE5MZhWN4d2iSRGKAmxoggAxKLzscfvcdqz6
 /FyuqV1SW1o7sK+ObuhOhOKDi1z4wSSrJfgdSl1S9QnzSY+bAEyPDRoMqyCktNBTlCQhkNBbfra
 B9f5jbEwCmA2mBJ0PWb8bUqvkrCQT0RlDNNCnGr5X9ujyWG5VJoy0mpyfB8zKtXtMZq6p38feb/
 nu9s4HmapokoDEJraTJV+Lrr2SlmPcseQQqfOtp2T4Wn4ytWcMMuEBIC7Q4y+jkjVdzk1bGJbpG
 QWIb92uXXfuxmQUF2ar1VuB/3/u+d9cqmwgqsxpn9oRD/vijDaewWFt5pDQpI95etk26OzzLCuq
 NHvE5KuA1rVEDXR+MBTE4XnE/ZI5UuNJsRRaI2U4PwEtIsh8CKibRUncvjJWXCXBI5TWaMd0asZ
 eLAsEQISz/u7OzMTzfpB2HYF6k0IKpO911TXH2nyfXaAA==
X-Received: by 2002:a5d:5e01:0:b0:487:35d:cb0f with SMTP id
 ffacd0b85a97d-48dbaadde6dmr19172721f8f.14.1791817110618; 
 Mon, 12 Oct 2026 07:58:30 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acfa28sm20117000f8f.51.2026.10.12.07.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 07:58:30 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:31:59 +0200
Subject: [PATCH v2 06/50] hw/i2c: pca954x: migrate mux state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-6-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815519; l=1912;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=6X3qtF5y9bDFv2QNu2TGa306El/FnP4ElGjKxh8N7cM=;
 b=a/5no+gY9vkPrY0vzsK8im6C2uagcbkgarXXe3eLjxbo6dEPrkuWZVv3+pquCSlmGHutp1fVZ
 M4UyIV9d2W9BZCOIO8chhhFYJQro60j5KZq24p4nRLpQIdLv5ilwr2h
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.41; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f41.google.com
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


