Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5207763lfc;
        Mon, 8 Jun 2020 09:07:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxcQOsqhlrK0GQ/8gvYSw8bKe9VbBs0O6NiWZwT1jlGW60NTL5MwFePuCOCaLNivxEvXax
X-Received: by 2002:a1f:6e88:: with SMTP id j130mr3861303vkc.67.1591632433363;
        Mon, 08 Jun 2020 09:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591632433; cv=none;
        d=google.com; s=arc-20160816;
        b=xvVe9JgqgrbNht+ZixYCHqtdYjM7iOasO95QzIWaJJR9+5PulhKOqkVFXQySE16d/a
         ybF50zSp7+qsEro078G/Bu/QfpV0PDjDO+b5dehLfEZF2xO9vcQ/4QPLj1xIpnv/UUhj
         HeAwtUcK7Aon4WeEWYZld/awxpS1ViFbFw0ApbcWrLkQJhCTRS/SWEC75AULtJD0O+7B
         YjWO9+3SAgWPiCELxyw1PNXWA8dMdIoUpwocApbeI9n6GTsLYF12894svvRt3MQe2EaI
         rV1D+oVGvsmNoHmIYkSAeoYTo3mhN0S7eFykEsaTiNpZlsBZxhuuT40quzjqCVUGCER9
         Dmkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O7Ly94SWL+SMdJ3uuRJWrIP/iOhgME/DwBVu03IUalo=;
        b=B9rdJUhgPqTsqn4T5S2YRYcf2yAT8LgX8BlViMkBhR39AENNsNu276T42ROK/0VWhb
         8zg3Ho9IztDtns57mcJlC+Z3eZlwOBU5kur71f2cWUxa4X9sw9zEah3kAMlHYM5QN1FQ
         cCgzW8iDbZBxndx1/JqFiNjK8jtU96/PNzaSDiiT5v6PRpJOz7UCSGRQaxYiEgjXsSSo
         /ZugkUjjSR0FVn18lwH04S3Gw6Ez33Z2oXmWgifL11TnwhRtmVRIciQXAZx4uwg/RRrC
         9rpth75zN8jJ42r3yY+SF8hH3onOaFnZClz1sZUiVcR44kjc8GSp001dZXgOrRYxBRWw
         XDXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aWfUrJ81;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si13979uar.42.2020.06.08.09.07.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aWfUrJ81;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKIq-0003fN-Ih
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKD8-00066e-85
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34942
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKD7-0007Z8-7M
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7Ly94SWL+SMdJ3uuRJWrIP/iOhgME/DwBVu03IUalo=;
 b=aWfUrJ81vnrmlHnd2S4WerUHe+sJsL6Wbix6IwTBSBvznZjf/EGRzAWPfwRs3gxjEKc+7F
 9hqmi48rmcZnWyzn5RheECiE5AcW49/DE5WS70PdAZIkJhUibOJwu8j38tI4hb6AOVyoXH
 pbnF1ZK0lt8ypmoYs0ND/VALyghqriY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-qNAj61UBNXui_-XYuj6aVA-1; Mon, 08 Jun 2020 12:01:11 -0400
X-MC-Unique: qNAj61UBNXui_-XYuj6aVA-1
Received: by mail-wm1-f69.google.com with SMTP id r1so4456wmh.7
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O7Ly94SWL+SMdJ3uuRJWrIP/iOhgME/DwBVu03IUalo=;
 b=r9GLd1BTDd73lnjZJFKQqnv531ZLgHTTkZFB7kzkTp7pJT9J/82AHAAu2fjq9SPTVT
 I7dgJex5In/sTQqYlig8gT3pb3mhk9I349owJAf+BRM5QygfrEI8sT4/9UDIxliHjz7H
 dH10T02Fh26Uqx09sOW/T8gt2Br8HAvt7pejK7gPsFn2HNg7vEbtd0DTKb/zm2+xMDFQ
 z/22njb00P8HrpKVTrVb9Zx2dcMiCIiPPB8K+zv/304pdi8VOpYzvxfRTx13nC5JwHAJ
 swVe2HCIB78vzgLESyOOlX+aj/gZsAmbw7lCTLXdJlP1LCp2v/oFcusny/nSmDGzd0JJ
 P9XA==
X-Gm-Message-State: AOAM532CgObj7lw00jxwD3e3uvLYSEAu1KrynEnsown23SNUgojmE8mY
 njFYkbLqm2rGBsFZ7oPglnllT6jFyZz7XuNIFAlXQHLQID2SOrifPxRxLw7q1KPMag9NTCwwHF9
 6CihBU1BJY+xZ
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr25749811wrw.277.1591632070241; 
 Mon, 08 Jun 2020 09:01:10 -0700 (PDT)
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr25749771wrw.277.1591632069976; 
 Mon, 08 Jun 2020 09:01:09 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id e12sm163622wro.52.2020.06.08.09.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/35] hw/arm/pxa2xx: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:13 +0200
Message-Id: <20200608160044.15531-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ISiWJwBINXyn

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/pxa2xx.c          | 3 +++
 hw/display/pxa2xx_lcd.c  | 3 +++
 hw/input/pxa2xx_keypad.c | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index e649f8930c..483003d161 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -27,6 +27,7 @@
 #include "sysemu/qtest.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
+#include "hw/qdev-deprecated.h"
 
 static struct {
     hwaddr io_base;
@@ -1768,6 +1769,8 @@ static PXA2xxI2SState *pxa2xx_i2s_init(MemoryRegion *sysmem,
 {
     PXA2xxI2SState *s = g_new0(PXA2xxI2SState, 1);
 
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     s->rx_dma = rx_dma;
     s->tx_dma = tx_dma;
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index ff90104b80..cf6241ff21 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -20,6 +20,7 @@
 /* FIXME: For graphic_rotate. Should probably be done in common code.  */
 #include "sysemu/sysemu.h"
 #include "framebuffer.h"
+#include "hw/qdev-deprecated.h"
 
 struct DMAChannel {
     uint32_t branch;
@@ -1011,6 +1012,8 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     PXA2xxLCDState *s;
     DisplaySurface *surface;
 
+    qdev_warn_deprecated_function_used();
+
     s = (PXA2xxLCDState *) g_malloc0(sizeof(PXA2xxLCDState));
     s->invalidated = 1;
     s->irq = irq;
diff --git a/hw/input/pxa2xx_keypad.c b/hw/input/pxa2xx_keypad.c
index 62aa6f6b15..6de1e9e4bb 100644
--- a/hw/input/pxa2xx_keypad.c
+++ b/hw/input/pxa2xx_keypad.c
@@ -17,6 +17,7 @@
 #include "migration/vmstate.h"
 #include "hw/arm/pxa.h"
 #include "ui/console.h"
+#include "hw/qdev-deprecated.h"
 
 /*
  * Keypad
@@ -316,6 +317,8 @@ PXA2xxKeyPadState *pxa27x_keypad_init(MemoryRegion *sysmem,
 {
     PXA2xxKeyPadState *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (PXA2xxKeyPadState *) g_malloc0(sizeof(PXA2xxKeyPadState));
     s->irq = irq;
 
-- 
2.21.3

