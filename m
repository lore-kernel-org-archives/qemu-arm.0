Received: by 10.25.150.194 with SMTP id y185csp2101162lfd;
        Tue, 22 Nov 2016 08:03:56 -0800 (PST)
X-Received: by 10.200.44.196 with SMTP id 4mr11800639qtx.262.1479830636871;
        Tue, 22 Nov 2016 08:03:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r89si9377476qtd.314.2016.11.22.08.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Nov 2016 08:03:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9DY4-0001eV-BM
	for alex.bennee@linaro.org; Tue, 22 Nov 2016 11:03:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <c.jayachandran@gmail.com>) id 1c9CUO-0007Q1-H5
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 09:56:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <c.jayachandran@gmail.com>) id 1c9CUK-00037G-Lk
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 09:56:04 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:36123)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <c.jayachandran@gmail.com>)
	id 1c9CUK-00036T-F1
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 09:56:00 -0500
Received: by mail-pg0-x243.google.com with SMTP id x23so2310293pgx.3
	for <qemu-arm@nongnu.org>; Tue, 22 Nov 2016 06:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KIqvyESfUcM84fm9maxQg7EZ1xZKlXES9Z4VSw6+MuU=;
	b=BTaUIUUvw+hYdplZ53VKqixvFReOj2Rsdoi+MUu8cX77Tqgl1IDM5nDhwkr/7y0JRe
	hH69IT95FVajHBXKhTjL/jvZMAq9YLj7x72tsRA9y87gxllnU0g8WNLuR2yA77kHS71Y
	3b/NnpPAWFA0EIlAwV/jTlYTH0FWBdpJIhj7F2/nqvZ7aM3wWX7wWjckH2ry/n7AMv5S
	ilyF4uKUBnXCuTDb+DzAbE9sjl0pFAKrKOBF38GpuaWuhomT+ItinjQAmYatpjlcrsRu
	fwTDPcXGNX+8guFGzOKNLjEUaKK6qt9+EP5fqD/fNq9HnNcJn8l5OVt7osNx63kDjx5j
	3VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KIqvyESfUcM84fm9maxQg7EZ1xZKlXES9Z4VSw6+MuU=;
	b=DVyNUvndmmGl/a4NbUL2b20thJIfSsvkTz7YWVaAs20yixQ+kKxvwX1xUmwuXlUewr
	C9a0oXSFum8U0ovdRfsRzdj5FQqXpLOgTWzuUQB2OKRCGg+NsmXD5McmKVtDXbhV/pAK
	e/ty/gCHhYjZBt5lASJnf5W7UGXiTll0gsBsOMRoWk04Nia/AR9viPJMGVvSNs5GaxKl
	O6D04gTypOg2D9MiMfgNR4JrmSnQTKIOoRxLxn4soLylwI0zU6e28KUKxUniz8HKM1YL
	k4Pxajr1t2E/QQsONeB+ndeeAs/atJDEp1hPaTp9Cqkx3PncKMpHWUm7yIzLn3SQW087
	rvGw==
X-Gm-Message-State: AKaTC03hThZVUttI/zkd1KwtgVUbja7MFqfY+7BQ/fdtZqVRCyhZ9QKwzmHRJtm4vBXvww==
X-Received: by 10.84.212.2 with SMTP id d2mr426573pli.24.1479826559129;
	Tue, 22 Nov 2016 06:55:59 -0800 (PST)
Received: from localhost.localdomain ([106.51.16.216])
	by smtp.gmail.com with ESMTPSA id
	d1sm45942374pfb.76.2016.11.22.06.55.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Nov 2016 06:55:58 -0800 (PST)
From: Jayachandran C <c.jayachandran@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue, 22 Nov 2016 20:24:20 +0530
Message-Id: <1479826460-24100-1-git-send-email-c.jayachandran@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::243
X-Mailman-Approved-At: Tue, 22 Nov 2016 11:03:48 -0500
Subject: [Qemu-arm] [RFC PATCH] hw/intc/arm_gic: Fix crash on register
 access from monitor
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jayachandran C <c.jayachandran@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ILvpaI1Sejaj

'current_cpu' is NULL when the GIC registers are accessed from
the monitor command line, and this causes qemu to crash in call
to gic_get_current_cpu().

Fix this by using the cpu returned by monitor_get_cpu_index()
for current cpu if current_cpu is NULL.

Signed-off-by: Jayachandran C <c.jayachandran@gmail.com>
---

This is marked RFC because I am not completely sure this is the right
fix. The issue is: qemu aarch64 with gicv2 crashes when reading the
GIC registers from monitor command line with 'xp'.
 
 hw/intc/arm_gic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 521aac3..17ef4fd 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "monitor/monitor.h"
 #include "hw/sysbus.h"
 #include "gic_internal.h"
 #include "qapi/error.h"
@@ -49,6 +50,9 @@ static const uint8_t gic_id_gicv2[] = {
 
 static inline int gic_get_current_cpu(GICState *s)
 {
+    if (!current_cpu) {
+        return monitor_get_cpu_index();
+    }
     if (s->num_cpu > 1) {
         return current_cpu->cpu_index;
     }
-- 
2.7.4

