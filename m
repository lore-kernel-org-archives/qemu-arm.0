Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6647108wrt;
        Mon, 3 Dec 2018 03:05:07 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VwwLfzjhDIdowC1KfWdaofLM/qNwkSGYzY4Kbf0txBBrSMNNNKyFtg3XKr6N+r3erVwsGu
X-Received: by 2002:a81:5d5:: with SMTP id 204mr4170966ywf.338.1543835106941;
        Mon, 03 Dec 2018 03:05:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543835106; cv=none;
        d=google.com; s=arc-20160816;
        b=m1WTZPA0VcICtHrl+v0drYC77gqQIOp6v8/JQzRBdt5vflOHReymirrQIO46c22rJr
         7cpV0Mvvp/pMy9tTrq11ZSAxWIKguqk18A+f8XWjifa1rJvEVPyZ9OlooElgQOq1vTc5
         W5ftYE4YEUIH0vOsBYz8GhvUbWSgizIh4ZdiUGRTB/DvGcM5cU/HOrKw57Xb1qr2CRPE
         HY4lR2eHuqavfiBasVroDysbEdDWsIaU4YQGZgRcGQks2yjgOzCPO6rD9bPN/yoCNvWH
         ri+jVTjJ181/Gz0nqV6ikeSvj7hssHHW5hw+of3Y4CN/IW80zPHncUBt4rUVAgnd1xIT
         XeFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=RTzQtyOYu23bLTN0PGViBPJWOoF7YiOKy7WJ8y/rEcU=;
        b=w1EnrI7lVO88sBHP79K8Gpi5Ha+kncgXYVn2MuEvdM6TMdwtEYfMbdjyQHvbA6E5EX
         p1SVceTvvGm/fZpQagAIVfPZ7dyM+BK1HpNAeQrWuybfQYo817wy3ZaFbTZtjl7qJkDr
         AddqEInBjgTjgAked1vFIeSdA1KSEgBcwtNUqGIjuVw2rP81vfBf3UZuNEUieAJKVPu7
         pR0X/VG5o6oIrWJ8kjIfzxFF+DfjgztUwk4f0mjVbrns+0kHC1/dlTQHf9OMamT8iX6T
         kXgxy5N4e/MUPRCV0R7heo7ZFs3DD9k1pLISWUsYdbCjJjDJ0hQiGm3VIm7cxWMaIwHT
         QN+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m139si8201646ywd.112.2018.12.03.03.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:05:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTm2E-0004RC-Ao
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:05:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1g-00045h-Bt
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1c-0002aW-Pq
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:32 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:58682 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gTm1c-0002Ym-FK; Mon, 03 Dec 2018 06:04:28 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 7CED758095A4319E685D;
	Mon,  3 Dec 2018 19:04:26 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB3B4EmT097970;
	Mon, 3 Dec 2018 19:04:14 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120319042187-14451343 ;
	Mon, 3 Dec 2018 19:04:21 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 4 Dec 2018 03:26:48 +0800
Message-Id: <1543865209-50994-8-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-03 19:04:21,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-03 19:04:14,
	Serialize complete at 2018-12-03 19:04:14
X-MAIL: mse01.zte.com.cn wB3B4EmT097970
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V11 7/8] hw/arm/virt: use the configure interface
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: avTsgN27ILOr

Use the configure interface for pvpanic-mmio.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/virt-acpi-build.c | 5 ++++-
 hw/arm/virt.c            | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4215ca6..4990a0d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -785,7 +785,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
-    acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC]);
+
+    if (vms->pvpanic) {
+        acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC]);
+    }
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index fdd3f20..a63e9e1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -198,6 +198,9 @@ static void create_pvpanic_device(const VirtMachineState *vms)
     hwaddr base = vms->memmap[VIRT_PVPANIC].base;
     hwaddr size = vms->memmap[VIRT_PVPANIC].size;
 
+    if (!vms->pvpanic) {
+        return;
+    }
     sysbus_create_simple(TYPE_PVPANIC_MMIO, base, NULL);
 
     nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
-- 
1.8.3.1

