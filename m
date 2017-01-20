Received: by 10.25.190.12 with SMTP id o12csp611110lff;
        Thu, 19 Jan 2017 18:51:42 -0800 (PST)
X-Received: by 10.55.23.78 with SMTP id i75mr10256999qkh.212.1484880701990;
        Thu, 19 Jan 2017 18:51:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s23si3969601qka.23.2017.01.19.18.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Jan 2017 18:51:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUPIh-0006Rd-Hy
	for alex.bennee@linaro.org; Thu, 19 Jan 2017 21:51:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cUPIe-0006RK-VG
	for qemu-arm@nongnu.org; Thu, 19 Jan 2017 21:51:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cUPIW-0003XP-J7
	for qemu-arm@nongnu.org; Thu, 19 Jan 2017 21:51:32 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:31304)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1cUPIV-0003Te-VL; Thu, 19 Jan 2017 21:51:28 -0500
Received: from 172.24.1.47 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DTP56722; Fri, 20 Jan 2017 10:51:09 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml432-hub.china.huawei.com (10.82.67.209) with Microsoft SMTP
	Server id 14.3.235.1; Fri, 20 Jan 2017 10:51:01 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <pbonzini@redhat.com>
Date: Fri, 20 Jan 2017 10:50:49 +0800
Message-ID: <1484880649-12600-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.58817B1E.00FF, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: faff97aab1e3dda14f4e650385b46d8f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 119.145.14.65
Subject: [Qemu-arm] [PATCH] virtio: Fix no interrupt when not creating msi
 controller
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, shannon.zhao@linaro.org,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: na10jctYkdo5

From: Shannon Zhao <shannon.zhao@linaro.org>

For ARM virt machine, if we use virt-2.7 which will not create ITS node,
the virtio-net can not recieve interrupts so it can't get ip address
through dhcp.
This fixes commit 83d768b(virtio: set ISR on dataplane notifications).

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index aa4f38f..709b718 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2082,6 +2082,7 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
 {
     VirtQueue *vq = container_of(n, VirtQueue, guest_notifier);
     if (event_notifier_test_and_clear(n)) {
+        virtio_set_isr(vq->vdev, 0x1);
         virtio_notify_vector(vq->vdev, vq->vector);
     }
 }
-- 
2.0.4


