Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378444ejx;
        Mon, 5 Dec 2022 01:54:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6S7e+NPDzvPluBUGMqWfTAsyEPQ61CF3V6D656ymQyQwK+2KnnU3E4EWduRYIiL6exKMLd
X-Received: by 2002:a05:620a:2723:b0:6fc:22e6:3897 with SMTP id b35-20020a05620a272300b006fc22e63897mr53605188qkp.412.1670234076242;
        Mon, 05 Dec 2022 01:54:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234076; cv=none;
        d=google.com; s=arc-20160816;
        b=j9eB+ig9K7q6L7fYsSRd4kLnRHHKqSBvF38/5/nx/Un9arLOJrln/kUpL+kHY8znwi
         MaauZB7J/FhloVzrJAVW3dIL17in5+NGYNewEyyuDec2/hWMKMuSwjPemNakS3m9PLxp
         aRjo+YTv7hvlCsRpN8TX9IVf+LPqCQC/1vO4IGaw6A36ILrcG7arXuAyA8Ndl5Og5L7D
         Lm+032Wv5k9OFJTQnObEKU7xkUTh5tWpFLtx0rK0oetp1ETV5mbFSwPJyp2LgyiDi51q
         3IAcPm93R7NTIK0vXmN1graefL7FF6c4T5NyUsoSi8i7C7VFq0Zn6Sg6j4Ebw35A0VLC
         /M+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VpGPqFxym62K9GH7MKfAV+SJq1q0meLvnvyfpQU3Eqk=;
        b=Fn2bYBhlTtixGr6SIffkg02ipCfn1yBQKOdEPN5fPi43LtCTVRxC+OTGpVrr7YOLAJ
         9CeceiIbqXa6GWWTMa4gTws5pf+dVH3wGrR1676B6VLFQ/nbiGsoLN7ctJUi6Uarem0P
         TkNcMyKszsGzo1f1BCih9HdgpscYZIBqoAKBBhA9jNMyYNB4JWbwOQaJNa7rNYNfN8e3
         K86ZCI+jyUdb8cGvwh+sHig7mvasl0Ah3DZsSCoQCYBbxXM9C8eNl7Qkcp6ifq1RRS9g
         awjYyfpoYe+MXPSXFH6XTDO+UiZuPk+Woen2kAH2QA/WJ6PfFoftv+9De6QD267Mwvzf
         +7/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kca4sefs;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id r22-20020ac867d6000000b003a51b82f290si7160661qtp.495.2022.12.05.01.54.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:54:36 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kca4sefs;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpGPqFxym62K9GH7MKfAV+SJq1q0meLvnvyfpQU3Eqk=;
	b=Kca4sefsK7IuHKD9dunrWR4LWeSxC+IXdOW2csPy+v3cVnQcRN79v9wbjxoD0xABlkfRkC
	0Yt8mzI5aemEq59hh7csKxyMp0nc5FiUu7Mm8xpET+b2xp+Rm2w7SzcgB/CZGyLEKcFaOu
	sHeXe5DFxFyqcPEvHsCPFHSACsFcN60=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-AUpsFNRrNQKqMyJYVcGvEQ-1; Mon, 05 Dec 2022 04:54:31 -0500
X-MC-Unique: AUpsFNRrNQKqMyJYVcGvEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E9A6299E755;
	Mon,  5 Dec 2022 09:54:30 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32C382166B29;
	Mon,  5 Dec 2022 09:54:23 +0000 (UTC)
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
Subject: [PATCH v2 14/51] hw/virtio: add started_vu status field to vhost-user-gpio
Date: Mon,  5 Dec 2022 10:51:51 +0100
Message-Id: <20221205095228.1314-15-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: kDxy5Nu3UfAt

From: Alex Bennée <alex.bennee@linaro.org>

As per the fix to vhost-user-blk in f5b22d06fb (vhost: recheck dev
state in the vhost_migration_log routine) we really should track the
connection and starting separately.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221130112439.2527228-4-alex.bennee@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user-gpio.h | 10 ++++++++++
 hw/virtio/vhost-user-gpio.c         | 11 ++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/hw/virtio/vhost-user-gpio.h b/include/hw/virtio/vhost-user-gpio.h
index 4fe9aeecc0..a9305c5e6c 100644
--- a/include/hw/virtio/vhost-user-gpio.h
+++ b/include/hw/virtio/vhost-user-gpio.h
@@ -28,7 +28,17 @@ struct VHostUserGPIO {
     VhostUserState vhost_user;
     VirtQueue *command_vq;
     VirtQueue *interrupt_vq;
+    /**
+     * There are at least two steps of initialization of the
+     * vhost-user device. The first is a "connect" step and
+     * second is a "start" step. Make a separation between
+     * those initialization phases by using two fields.
+     *
+     * @connected: see vu_gpio_connect()/vu_gpio_disconnect()
+     * @started_vu: see vu_gpio_start()/vu_gpio_stop()
+     */
     bool connected;
+    bool started_vu;
     /*< public >*/
 };
 
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index 0b40ebd15a..be9be08b4c 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -86,6 +86,7 @@ static int vu_gpio_start(VirtIODevice *vdev)
         error_report("Error starting vhost-user-gpio: %d", ret);
         goto err_guest_notifiers;
     }
+    gpio->started_vu = true;
 
     /*
      * guest_notifier_mask/pending not used yet, so just unmask
@@ -126,16 +127,12 @@ static void vu_gpio_stop(VirtIODevice *vdev)
     struct vhost_dev *vhost_dev = &gpio->vhost_dev;
     int ret;
 
-    if (!k->set_guest_notifiers) {
+    if (!gpio->started_vu) {
         return;
     }
+    gpio->started_vu = false;
 
-    /*
-     * We can call vu_gpio_stop multiple times, for example from
-     * vm_state_notify and the final object finalisation. Check we
-     * aren't already stopped before doing so.
-     */
-    if (!vhost_dev_is_started(vhost_dev)) {
+    if (!k->set_guest_notifiers) {
         return;
     }
 
-- 
2.38.1
