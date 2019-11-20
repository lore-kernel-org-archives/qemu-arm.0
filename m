Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1718865lfc;
        Wed, 20 Nov 2019 01:10:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqzk4hxORNZu2RUwJYOt5+9k5SO8jEF9XHF8eRv18JVT5bXiCN1bj/ngJhPq3dr8TvCWkhME
X-Received: by 2002:aed:228b:: with SMTP id p11mr1604917qtc.196.1574241041083;
        Wed, 20 Nov 2019 01:10:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574241041; cv=none;
        d=google.com; s=arc-20160816;
        b=BmCE7BgAJSbTcikrnQYuaADdyzwiFTrgQeNO4oh0x8F7r4DphlQktQ+JujHCfolhhs
         yNe2MQUZ9WISqRKywA7zMzTTzubclhojJHzuKX/jNRx+c4gMQXkPoAn4gcPhw96975j7
         KTkAOxZkIQaej1RDPW1x42bfe8IWGAgCoxjiiAWYI+B2gFGQIk7JIhz80pSTiVCsfTSN
         0t/LKu4PeXQQJahJiB1qcZKgqj8av3lxbs5sqhGGJZT0pyOGeUyi1oIwahMskimNnytI
         IfyjckVNSsBDQLV0K8OsdpvxR5+c4obitSzZMax36TrKl68fpn0ISnJYe0418BRZDqxz
         0VCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OpB5waLtmZfOQckiI3lFKLd6zv3FZN9ww3HoGYALFjE=;
        b=eBGlUFLhM81tnB06cxszgWuuBVlhuFSohP33NNpQfvWMRg+gGKSjeyLML47uTuCS3p
         7C47dFR0Ql633yLE0vaun9cAaUEO65Ajsq49n89rD7P7BReeXP1/gY5JPbJVsZkrqafl
         CwyYjEKRCCdaZxubw7E/03iyr8mkzj3Tp8ZlDcBjKEcwLat5AVqOQQhYdSenGM1GGMqL
         p2NYqFie2hQ8CXSj8aOq2UUEmaurhgb6d66xP4n9Z7e5YB4DV2Iat/7GBP70SkoACo1p
         ohaWMIX6kk8I1ALKaw0Cw7+lDguAHtPDHmYW9o2S58KKf7uHfNdCHvLqcKC+dRLMR5UY
         Pvjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xux8kpxb;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id e2si1134019qkl.0.2019.11.20.01.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 01:10:41 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xux8kpxb;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574241040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpB5waLtmZfOQckiI3lFKLd6zv3FZN9ww3HoGYALFjE=;
	b=Xux8kpxbt3A9ilyn8EjUEIYTxY7XwfTDFMUnMKvAHYrJOKDKWI6m8x75YxCcJZcqy547Zx
	EpctLktYm4f8bm5ILBYu13Bj/ZtW+QQuc55YEzfwF4JB/BAOKJd46zOZ/rZc06vY+ft1El
	pmWNcVuFYsK00xgNNZl4sTFvk/LtI+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-TFZQBZjXNbeVMyKfBnfosA-1; Wed, 20 Nov 2019 04:10:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B208100551C;
	Wed, 20 Nov 2019 09:10:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-131.ams2.redhat.com [10.36.116.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8861360BAB;
	Wed, 20 Nov 2019 09:10:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-arm@nongnu.org,
	libvir-list@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-5.0 1/4] hw/arm/nseries: Replace the bluetooth chardev with a "null" chardev
Date: Wed, 20 Nov 2019 10:10:11 +0100
Message-Id: <20191120091014.16883-2-thuth@redhat.com>
In-Reply-To: <20191120091014.16883-1-thuth@redhat.com>
References: <20191120091014.16883-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: TFZQBZjXNbeVMyKfBnfosA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: Dm68/GPZFfjQ

We are going to remove the bitrotten bluetooth backend, so we can
not use it in the n800 and n810 machines anymore. Replace the chardev
here with a "null" chardev and stop including the "hw/bt.h" header.

I am not aware of a full working N8x0 environment that can be used to
test these machines, but the Linux kernel from the Meego project that
can be found on http://stskeeps.subnetmask.net/meego-n8x0/ still seems
to boot as far as it did before.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/nseries.c | 16 +++++++---------
 qemu-doc.texi    |  2 --
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 7e361936a9..3fd196fb30 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "chardev/char.h"
 #include "qemu/cutils.h"
 #include "qemu/bswap.h"
 #include "sysemu/reset.h"
@@ -39,7 +40,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/block/flash.h"
 #include "hw/hw.h"
-#include "hw/bt.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
 #include "qemu/log.h"
@@ -792,13 +792,11 @@ static void n8x0_cbus_setup(struct n800_s *s)
=20
 static void n8x0_uart_setup(struct n800_s *s)
 {
-    Chardev *radio =3D uart_hci_init();
-
-    qdev_connect_gpio_out(s->mpu->gpio, N8X0_BT_RESET_GPIO,
-                    csrhci_pins_get(radio)[csrhci_pin_reset]);
-    qdev_connect_gpio_out(s->mpu->gpio, N8X0_BT_WKUP_GPIO,
-                    csrhci_pins_get(radio)[csrhci_pin_wakeup]);
-
+    Chardev *radio =3D qemu_chr_new("bt-dummy-uart", "null", NULL);
+    /*
+     * Note: We used to connect N8X0_BT_RESET_GPIO and N8X0_BT_WKUP_GPIO
+     * here, but this code has been removed with the bluetooth backend.
+     */
     omap_uart_attach(s->mpu->uart[BT_UART], radio);
 }
=20
@@ -1137,7 +1135,7 @@ static struct omap_partition_info_s {
     { 0, 0, 0, NULL }
 };
=20
-static bdaddr_t n8x0_bd_addr =3D {{ N8X0_BD_ADDR }};
+static uint8_t n8x0_bd_addr[6] =3D { N8X0_BD_ADDR };
=20
 static int n8x0_atag_setup(void *p, int model)
 {
diff --git a/qemu-doc.texi b/qemu-doc.texi
index 3ddf5c0a68..ed3df01dac 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -2308,8 +2308,6 @@ Secure Digital card connected to OMAP MMC/SD host
 @item
 Three OMAP on-chip UARTs and on-chip STI debugging console
 @item
-A Bluetooth(R) transceiver and HCI connected to an UART
-@item
 Mentor Graphics "Inventra" dual-role USB controller embedded in a TI
 TUSB6010 chip - only USB host mode is supported
 @item
--=20
2.23.0
