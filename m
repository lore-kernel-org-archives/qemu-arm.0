Received: by 10.182.158.201 with SMTP id ww9csp329347obb;
        Mon, 16 Nov 2015 12:50:57 -0800 (PST)
X-Received: by 10.129.107.134 with SMTP id g128mr11646104ywc.248.1447707057191;
        Mon, 16 Nov 2015 12:50:57 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u66si25079441ywa.211.2015.11.16.12.50.57
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 12:50:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:49241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyQjo-0004a0-Ob
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 15:50:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlt-0008VG-09
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlp-0008AM-4T
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:37 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:33898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlo-0008AE-UG
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:33 -0500
Received: by wmvv187 with SMTP id v187so176114254wmv.1
	for <qemu-devel@nongnu.org>; Mon, 16 Nov 2015 05:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HF2mFex19OaTGrFshSlX/zoSUOHHW66ad8Vz5aEgzpw=;
	b=HC8ujKQI2e/c8fhpLzRDTBoDN+tXxey5TnZeoVo2N7P3Ap0Kg9UjnU5PZjddTSxJGj
	6RhfnGBGxnC5A4oUiphmG9XjAN+O5Dw7iaYL7VQvmtN6p6GkUCkRgSXYvHphAklm/MHC
	1cKw6t4cotHw3oL4G0M8qhNmEwXM8FidHuarkvrhyPlernNbfxD1HDle4yp7QhOtlOzj
	MSBKLpPSenmZtInHO7TIe/jr7D+QdgiJWXG6UCxqDrqj+gkMF5zxx1YcStCtNEZXRHBQ
	MpSqqBTAXHJU+B3R245iqOI28nMKknR5kbRzKX0G0nlPHE1zFVyKO5HNDbUrJtN87RzH
	dKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HF2mFex19OaTGrFshSlX/zoSUOHHW66ad8Vz5aEgzpw=;
	b=L6Vd4vH6P9i3wa1Y1AJ8Px9F4FlPhkHxNMVqQwDZwqR+KyaHWuAwCVvNSZpqw3d35E
	zxT8rSBoIb3HafC05pQqG7DM2tzi2nzprCyT/4WseypMRPre3wJn8url7YLhwg+HgjzN
	tdS6auFEUr3lSA/lX5x6BlQSv4JB1k4q6gnOtKDLkqLHXT7cCi0OoEpFYzC/RLJObi7d
	+J57PuA3YX9Shg5AfDcHcTmdFixnDhlHPW3JveVGTTQwEWtsSXP0PmRnYTiL17lmX4mQ
	ljpIZfPv4+ePTVrDjjWX05q22czwpAyGEC3A1gbsF248AW/DY+GLQgDptOBTQlpLJDiU
	wuGA==
X-Gm-Message-State: ALoCoQmqaNGDC3TbpkVrCB5rTBYEHIn9h2lmzVmrN/O0tPIz7UARgobcqh+Z3L8Ir8u598o2xMop
X-Received: by 10.194.84.4 with SMTP id u4mr37034353wjy.149.1447680272335;
	Mon, 16 Nov 2015 05:24:32 -0800 (PST)
Received: from localhost ([78.129.130.236]) by smtp.gmail.com with ESMTPSA id
	w67sm18599841wmw.17.2015.11.16.05.24.30
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 05:24:31 -0800 (PST)
From: shannon.zhao@linaro.org
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	imammedo@redhat.com, wei@redhat.com
Date: Mon, 16 Nov 2015 21:23:09 +0800
Message-Id: <1447680189-2128-9-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::231
Cc: zhaoshenglong@huawei.com, qemu-devel@nongnu.org, graeme.gregory@linaro.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-devel] [PATCH v3 8/8] hw/arm/virt: Add gpio-keys node for
	Poweroff using DT
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7Kx90oHJK0LX

From: Shannon Zhao <shannon.zhao@linaro.org>

Add a gpio-keys node. This is used for Poweroff for the systems which
use DT not ACPI.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cb1d45b..3394262 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -561,6 +561,7 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
 
     pl061_dev = sysbus_create_simple("pl061", base, pic[irq]);
 
+    uint32_t phandle = qemu_fdt_alloc_phandle(vbi->fdt);
     nodename = g_strdup_printf("/pl061@%" PRIx64, base);
     qemu_fdt_add_subnode(vbi->fdt, nodename);
     qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
@@ -573,6 +574,20 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
                            GIC_FDT_IRQ_FLAGS_LEVEL_HI);
     qemu_fdt_setprop_cell(vbi->fdt, nodename, "clocks", vbi->clock_phandle);
     qemu_fdt_setprop_string(vbi->fdt, nodename, "clock-names", "apb_pclk");
+    qemu_fdt_setprop_cell(vbi->fdt, nodename, "phandle", phandle);
+
+    qemu_fdt_add_subnode(vbi->fdt, "/gpio-keys");
+    qemu_fdt_setprop_string(vbi->fdt, "/gpio-keys", "compatible", "gpio-keys");
+    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys", "#size-cells", 0);
+    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys", "#address-cells", 1);
+    qemu_fdt_setprop(vbi->fdt, "/gpio-keys", "autorepeat", NULL, 0);
+
+    qemu_fdt_add_subnode(vbi->fdt, "/gpio-keys/poweroff");
+    qemu_fdt_setprop_string(vbi->fdt, "/gpio-keys/poweroff",
+                            "label", "GPIO Key Poweroff");
+    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys/poweroff", "linux,code", 116);
+    qemu_fdt_setprop_cells(vbi->fdt, "/gpio-keys/poweroff",
+                           "gpios", phandle, 3, 0);
 
     /* connect powerdown request */
     qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
-- 
2.1.0

