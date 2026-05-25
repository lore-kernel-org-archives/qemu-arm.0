Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9321CCD5BC0
	for <qemu-arm@archiver.kernel.org>; Mon, 25 May 2026 06:39:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wROvF-000573-5L; Mon, 25 May 2026 02:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1wROta-0002zY-Om
 for qemu-arm@nongnu.org; Mon, 25 May 2026 02:34:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1wROtY-0001K5-7y
 for qemu-arm@nongnu.org; Mon, 25 May 2026 02:34:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779690875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBHFQLtRMrdfnvQtSsd7u7e5jcNyISFb5lV/307G3wI=;
 b=Z37rs8LPF1KT0AnADxoF49zNhUIJzMHdEAjCA841yLDz3PlHdFKqllyBuYU9wAvxgKfEXO
 dBHJClKLN52hlrm7rV4/dOu3fHPfo0tVDtV2VxOqMLmMh7jtmG4ssdth9UfREl56QBV/xF
 JahR93KPNkkrLMDJ5+qfc00B/S7QxAw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-133-oe1ga9oePWys5YOVoLEYNg-1; Mon,
 25 May 2026 02:34:30 -0400
X-MC-Unique: oe1ga9oePWys5YOVoLEYNg-1
X-Mimecast-MFC-AGG-ID: oe1ga9oePWys5YOVoLEYNg_1779690869
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8E50219560A2; Mon, 25 May 2026 06:34:29 +0000 (UTC)
Received: from localhost (unknown [10.44.22.6])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 120B818004A3; Mon, 25 May 2026 06:34:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Jan Kiszka <jan.kiszka@web.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Musicpal)
Subject: [PULL v3 16/38] hw/arm/musicpal: Use Linux key codes
Date: Mon, 25 May 2026 10:31:59 +0400
Message-ID: <20260525063223.1409791-17-marcandre.lureau@redhat.com>
In-Reply-To: <20260525063223.1409791-1-marcandre.lureau@redhat.com>
References: <20260525063223.1409791-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 2GC0oN_G4ys8cDL6BzSmCLMqfcjmaK4wrfYDTBEkSpw_1779690869
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

QemuInputEvent now stores Linux key codes for key events. Use those
codes directly instead of translating between internal key code
representations.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260520-input-v3-8-7c9e4c7abe34@rsg.ci.i.u-tokyo.ac.jp>
---
 hw/arm/musicpal.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index c8985a58f99..e2630243eb7 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -24,6 +24,7 @@
 #include "hw/core/ptimer.h"
 #include "hw/core/qdev-properties.h"
 #include "hw/block/flash.h"
+#include "standard-headers/linux/input-event-codes.h"
 #include "ui/console.h"
 #include "hw/i2c/i2c.h"
 #include "hw/i2c/bitbang_i2c.h"
@@ -1069,40 +1070,39 @@ static void musicpal_key_event(DeviceState *dev, QemuConsole *src,
                                QemuInputEvent *evt)
 {
     musicpal_key_state *s = MUSICPAL_KEY(dev);
-    int qcode = qemu_input_linux_to_qcode(evt->key.key);
     uint32_t event = 0;
     int i;
 
-    switch (qcode) {
-    case Q_KEY_CODE_UP:
+    switch (evt->key.key) {
+    case KEY_UP:
         event = MP_KEY_WHEEL_NAV | MP_KEY_WHEEL_NAV_INV;
         break;
 
-    case Q_KEY_CODE_DOWN:
+    case KEY_DOWN:
         event = MP_KEY_WHEEL_NAV;
         break;
 
-    case Q_KEY_CODE_LEFT:
+    case KEY_LEFT:
         event = MP_KEY_WHEEL_VOL | MP_KEY_WHEEL_VOL_INV;
         break;
 
-    case Q_KEY_CODE_RIGHT:
+    case KEY_RIGHT:
         event = MP_KEY_WHEEL_VOL;
         break;
 
-    case Q_KEY_CODE_F:
+    case KEY_F:
         event = MP_KEY_BTN_FAVORITS;
         break;
 
-    case Q_KEY_CODE_TAB:
+    case KEY_TAB:
         event = MP_KEY_BTN_VOLUME;
         break;
 
-    case Q_KEY_CODE_RET:
+    case KEY_ENTER:
         event = MP_KEY_BTN_NAVIGATION;
         break;
 
-    case Q_KEY_CODE_M:
+    case KEY_M:
         event = MP_KEY_BTN_MENU;
         break;
     }
-- 
2.54.0


