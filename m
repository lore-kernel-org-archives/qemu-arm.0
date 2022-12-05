Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378506ejx;
        Mon, 5 Dec 2022 01:54:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6pXowYNOXwFm6v9gU52TgAAm7C1jUv0mwm8itsf1LqRi9vHtF8opwTCeWgswFctlUAACea
X-Received: by 2002:a05:6214:3301:b0:4c7:343d:2a60 with SMTP id mo1-20020a056214330100b004c7343d2a60mr14959234qvb.42.1670234082756;
        Mon, 05 Dec 2022 01:54:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234082; cv=none;
        d=google.com; s=arc-20160816;
        b=HhKYqqUibSro5BEbKd0zJr8hYmtb8QkuhvWobooxa0OT4HlZXJX1moXIJ4LDK7t1a+
         ba+LknT/5FClSOLW/VNYb9FyFKcw6FjPePz0XA6Qjs+9I4WCH8PM+OuEFErxW7ftcVv4
         MzS3Z5vPO+x+4OJ/UQD8adKtPEKMJtNaSpmK7EVTtJnT6YkreZ8To918d3IXbkxUjRdE
         VxVsZyK+fdocELhY7D12QBXu5c0pon1GxeUuVFYuXrv2n6D6EaAumzxQYgk9i9qstZER
         sF2fUf2rXtg0+pE81czScBhYGwO5vNvIkvtS0TRmzbQ3+7e5Y0iw2Od56Aa+95++myzo
         SnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wv3mQ50z7ELRb+0PxbMX5qClEbrZYnNWGDwG8BSgdlg=;
        b=Gx72LfA+DWzpi2u+7z988HcrFJZGVKs21za1OaNTqazziaa9SGHFkQF4xWMrIGP/sn
         /X3ZoTfps+oUkdnBxlciVT4RK9qRXB1mObhfBZnwn0xKUupmK9o4HnpAI8ULJnLFNq47
         NOYmD5KXJFS0FyaJcBUhTmzIpgNNZZpNcFTtjVXTXCs2DUJgyHjLJOe+xG8LTbJzJw0D
         g7FX7yQtcA2rEjhht4yu5mHNUqLiBmkkG9mExsQ0E8ZbQ95PkGK2UXhI98zhnz97oamP
         ow6gKB1V2CX8aDF4H2wi67Zpmtf6SyXG16Rq44DrO6vR1xKxujTAtlbtKmojOfkLeX+i
         wQXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JxjZiQtR;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l19-20020a05620a28d300b006ee9451ddf1si8729144qkp.322.2022.12.05.01.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:54:42 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JxjZiQtR;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wv3mQ50z7ELRb+0PxbMX5qClEbrZYnNWGDwG8BSgdlg=;
	b=JxjZiQtRXRJPCgvYcHYpoOATuS7Opr3nG9Qn8l3hLlbAjrS01O2dut1qkC8LHYY5FTNUIg
	OQIzYQxDaY1bEZTpiDw7PkDJY4w26XU/pRmjw+KJVdPsjtYNQ0iL/onSNeq1INB6WyTsFf
	2kxKD5QmAOeDmwqCldvd7dXquN3fhHM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-SDGhJug8OKyBI7Not_p4Fg-1; Mon, 05 Dec 2022 04:54:39 -0500
X-MC-Unique: SDGhJug8OKyBI7Not_p4Fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD957101A52A;
	Mon,  5 Dec 2022 09:54:37 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE8AE2166B30;
	Mon,  5 Dec 2022 09:54:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 15/51] hw/virtio: generalise CHR_EVENT_CLOSED handling
Date: Mon,  5 Dec 2022 10:51:52 +0100
Message-Id: <20221205095228.1314-16-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: xz2rEnteeYW7

From: Alex Bennée <alex.bennee@linaro.org>

..and use for both virtio-user-blk and virtio-user-gpio. This avoids
the circular close by deferring shutdown due to disconnection until a
later point. virtio-user-blk already had this mechanism in place so
generalise it as a vhost-user helper function and use for both blk and
gpio devices.

While we are at it we also fix up vhost-user-gpio to re-establish the
event handler after close down so we can reconnect later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20221130112439.2527228-5-alex.bennee@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user.h | 18 +++++++++
 hw/block/vhost-user-blk.c      | 41 +++-----------------
 hw/virtio/vhost-user-gpio.c    | 11 +++++-
 hw/virtio/vhost-user.c         | 71 ++++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+), 37 deletions(-)

diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index c6e693cd3f..191216a74f 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -68,4 +68,22 @@ bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp);
  */
 void vhost_user_cleanup(VhostUserState *user);
 
+/**
+ * vhost_user_async_close() - cleanup vhost-user post connection drop
+ * @d: DeviceState for the associated device (passed to callback)
+ * @chardev: the CharBackend associated with the connection
+ * @vhost: the common vhost device
+ * @cb: the user callback function to complete the clean-up
+ *
+ * This function is used to handle the shutdown of a vhost-user
+ * connection to a backend. We handle this centrally to make sure we
+ * do all the steps and handle potential races due to VM shutdowns.
+ * Once the connection is disabled we call a backhalf to ensure
+ */
+typedef void (*vu_async_close_fn)(DeviceState *cb);
+
+void vhost_user_async_close(DeviceState *d,
+                            CharBackend *chardev, struct vhost_dev *vhost,
+                            vu_async_close_fn cb);
+
 #endif
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 1177064631..aff4d2b8cb 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -369,17 +369,10 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
     vhost_user_blk_stop(vdev);
 
     vhost_dev_cleanup(&s->dev);
-}
 
-static void vhost_user_blk_chr_closed_bh(void *opaque)
-{
-    DeviceState *dev = opaque;
-    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
-    VHostUserBlk *s = VHOST_USER_BLK(vdev);
-
-    vhost_user_blk_disconnect(dev);
+    /* Re-instate the event handler for new connections */
     qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_event,
-                             NULL, opaque, NULL, true);
+                             NULL, dev, NULL, true);
 }
 
 static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
@@ -398,33 +391,9 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
         }
         break;
     case CHR_EVENT_CLOSED:
-        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
-            /*
-             * A close event may happen during a read/write, but vhost
-             * code assumes the vhost_dev remains setup, so delay the
-             * stop & clear.
-             */
-            AioContext *ctx = qemu_get_current_aio_context();
-
-            qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
-                    NULL, NULL, false);
-            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
-
-            /*
-             * Move vhost device to the stopped state. The vhost-user device
-             * will be clean up and disconnected in BH. This can be useful in
-             * the vhost migration code. If disconnect was caught there is an
-             * option for the general vhost code to get the dev state without
-             * knowing its type (in this case vhost-user).
-             *
-             * FIXME: this is sketchy to be reaching into vhost_dev
-             * now because we are forcing something that implies we
-             * have executed vhost_dev_stop() but that won't happen
-             * until vhost_user_blk_stop() gets called from the bh.
-             * Really this state check should be tracked locally.
-             */
-            s->dev.started = false;
-        }
+        /* defer close until later to avoid circular close */
+        vhost_user_async_close(dev, &s->chardev, &s->dev,
+                               vhost_user_blk_disconnect);
         break;
     case CHR_EVENT_BREAK:
     case CHR_EVENT_MUX_IN:
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index be9be08b4c..b7b82a1099 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -233,6 +233,8 @@ static int vu_gpio_connect(DeviceState *dev, Error **errp)
     return 0;
 }
 
+static void vu_gpio_event(void *opaque, QEMUChrEvent event);
+
 static void vu_gpio_disconnect(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -245,6 +247,11 @@ static void vu_gpio_disconnect(DeviceState *dev)
 
     vu_gpio_stop(vdev);
     vhost_dev_cleanup(&gpio->vhost_dev);
+
+    /* Re-instate the event handler for new connections */
+    qemu_chr_fe_set_handlers(&gpio->chardev,
+                             NULL, NULL, vu_gpio_event,
+                             NULL, dev, NULL, true);
 }
 
 static void vu_gpio_event(void *opaque, QEMUChrEvent event)
@@ -262,7 +269,9 @@ static void vu_gpio_event(void *opaque, QEMUChrEvent event)
         }
         break;
     case CHR_EVENT_CLOSED:
-        vu_gpio_disconnect(dev);
+        /* defer close until later to avoid circular close */
+        vhost_user_async_close(dev, &gpio->chardev, &gpio->vhost_dev,
+                               vu_gpio_disconnect);
         break;
     case CHR_EVENT_BREAK:
     case CHR_EVENT_MUX_IN:
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index abe23d4ebe..8f635844af 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/sockets.h"
+#include "sysemu/runstate.h"
 #include "sysemu/cryptodev.h"
 #include "migration/migration.h"
 #include "migration/postcopy-ram.h"
@@ -2670,6 +2671,76 @@ void vhost_user_cleanup(VhostUserState *user)
     user->chr = NULL;
 }
 
+
+typedef struct {
+    vu_async_close_fn cb;
+    DeviceState *dev;
+    CharBackend *cd;
+    struct vhost_dev *vhost;
+} VhostAsyncCallback;
+
+static void vhost_user_async_close_bh(void *opaque)
+{
+    VhostAsyncCallback *data = opaque;
+    struct vhost_dev *vhost = data->vhost;
+
+    /*
+     * If the vhost_dev has been cleared in the meantime there is
+     * nothing left to do as some other path has completed the
+     * cleanup.
+     */
+    if (vhost->vdev) {
+        data->cb(data->dev);
+    }
+
+    g_free(data);
+}
+
+/*
+ * We only schedule the work if the machine is running. If suspended
+ * we want to keep all the in-flight data as is for migration
+ * purposes.
+ */
+void vhost_user_async_close(DeviceState *d,
+                            CharBackend *chardev, struct vhost_dev *vhost,
+                            vu_async_close_fn cb)
+{
+    if (!runstate_check(RUN_STATE_SHUTDOWN)) {
+        /*
+         * A close event may happen during a read/write, but vhost
+         * code assumes the vhost_dev remains setup, so delay the
+         * stop & clear.
+         */
+        AioContext *ctx = qemu_get_current_aio_context();
+        VhostAsyncCallback *data = g_new0(VhostAsyncCallback, 1);
+
+        /* Save data for the callback */
+        data->cb = cb;
+        data->dev = d;
+        data->cd = chardev;
+        data->vhost = vhost;
+
+        /* Disable any further notifications on the chardev */
+        qemu_chr_fe_set_handlers(chardev,
+                                 NULL, NULL, NULL, NULL, NULL, NULL,
+                                 false);
+
+        aio_bh_schedule_oneshot(ctx, vhost_user_async_close_bh, data);
+
+        /*
+         * Move vhost device to the stopped state. The vhost-user device
+         * will be clean up and disconnected in BH. This can be useful in
+         * the vhost migration code. If disconnect was caught there is an
+         * option for the general vhost code to get the dev state without
+         * knowing its type (in this case vhost-user).
+         *
+         * Note if the vhost device is fully cleared by the time we
+         * execute the bottom half we won't continue with the cleanup.
+         */
+        vhost->started = false;
+    }
+}
+
 static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
 {
     if (!virtio_has_feature(dev->protocol_features,
-- 
2.38.1
