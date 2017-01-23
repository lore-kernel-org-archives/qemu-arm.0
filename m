Received: by 10.25.77.65 with SMTP id a62csp961311lfb;
        Sun, 22 Jan 2017 16:56:14 -0800 (PST)
X-Received: by 10.237.34.116 with SMTP id o49mr20990434qtc.122.1485132974772;
        Sun, 22 Jan 2017 16:56:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t76si9657308qki.337.2017.01.22.16.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Jan 2017 16:56:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cVSvc-00086t-4e
	for alex.bennee@linaro.org; Sun, 22 Jan 2017 19:56:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cVSvV-00086A-Ue
	for qemu-arm@nongnu.org; Sun, 22 Jan 2017 19:56:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cVSvV-0004Qa-4O
	for qemu-arm@nongnu.org; Sun, 22 Jan 2017 19:56:06 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:22278)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1cVSvO-0004P5-Ml; Sun, 22 Jan 2017 19:55:59 -0500
Received: from 172.24.1.60 (EHLO SZXEML424-HUB.china.huawei.com)
	([172.24.1.60])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id COJ19716; Mon, 23 Jan 2017 08:55:33 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML424-HUB.china.huawei.com (10.82.67.153) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 23 Jan 2017 08:55:24 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 23 Jan 2017 08:55:04 +0800
Message-ID: <1485132904-17632-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 119.145.14.66
Subject: [Qemu-arm] [PATCH V2] virtio: Fix no interrupt when not creating
 msi controller
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, mst@redhat.com,
	christoffer.dall@linaro.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a9KR9+/9prL6

From: Shannon Zhao <shannon.zhao@linaro.org>

For ARM virt machine, if we use virt-2.7 which will not create ITS node,
the virtio-net can not recieve interrupts so it can't get ip address
through dhcp.
This fixes commit 83d768b(virtio: set ISR on dataplane notifications).

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
V2: Factor out a common function instead of duplicating code
---
 hw/virtio/virtio.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index aa4f38f..00e8f74 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1441,6 +1441,12 @@ void virtio_notify_irqfd(VirtIODevice *vdev, VirtQueue *vq)
     event_notifier_set(&vq->guest_notifier);
 }
 
+static void virtio_irq(VirtQueue *vq)
+{
+    virtio_set_isr(vq->vdev, 0x1);
+    virtio_notify_vector(vq->vdev, vq->vector);
+}
+
 void virtio_notify(VirtIODevice *vdev, VirtQueue *vq)
 {
     if (!virtio_should_notify(vdev, vq)) {
@@ -1448,8 +1454,7 @@ void virtio_notify(VirtIODevice *vdev, VirtQueue *vq)
     }
 
     trace_virtio_notify(vdev, vq);
-    virtio_set_isr(vq->vdev, 0x1);
-    virtio_notify_vector(vdev, vq->vector);
+    virtio_irq(vq);
 }
 
 void virtio_notify_config(VirtIODevice *vdev)
@@ -2082,7 +2087,7 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
 {
     VirtQueue *vq = container_of(n, VirtQueue, guest_notifier);
     if (event_notifier_test_and_clear(n)) {
-        virtio_notify_vector(vq->vdev, vq->vector);
+        virtio_irq(vq);
     }
 }
 
-- 
2.0.4


