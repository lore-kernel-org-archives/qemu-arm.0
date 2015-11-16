Received: by 10.182.158.201 with SMTP id ww9csp371008obb;
        Mon, 16 Nov 2015 14:33:29 -0800 (PST)
X-Received: by 10.31.8.193 with SMTP id 184mr283293vki.131.1447713209569;
        Mon, 16 Nov 2015 14:33:29 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 145si242900vkc.161.2015.11.16.14.33.29
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 14:33:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:50972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZySL3-0004y8-60
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 17:33:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlj-0008V3-3F
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJli-00088y-0V
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:27 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:36449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlh-00088k-Q8
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:25 -0500
Received: by wmww144 with SMTP id w144so109966129wmw.1
	for <qemu-devel@nongnu.org>; Mon, 16 Nov 2015 05:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IbCBQ8LwDn28ZQPsgvssvDjCAtCWGKJ4LmZ7WXXSPpQ=;
	b=ukMvrQ0LmEXQNLQI3EILUo74x/tLjL2u4tYdThAb7nngS8vSa3duoOwOXpTcAdyLEB
	Akye9dhEdxzNO074RSGN6SKgUFSxz+FATLX+GU4ZcD75QbQxEyYlnrWkLwOi6lbI+mbJ
	o+/+s4MGOhpVWEY6PsaR1NJ+9/lcXg2CNWwmoyDUghGNs6EmzupXy4dqIdo1z84yTqAa
	rhRjHunhSAc+fjHFCplL0zZ/5Hci68Iiwvkn46MX3UOzACCUCj0VSFUKqG2Grq6d+xFQ
	luwyGUVj0tjfDeLFywBy/FHCTVMVeu+eEDS8wIDPXlSu0xydbQJ2euOedJOp74piwDH3
	/ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IbCBQ8LwDn28ZQPsgvssvDjCAtCWGKJ4LmZ7WXXSPpQ=;
	b=krKiZXIn12raTrA1i/3UBOAVS9nMDbHtH/+HrZA+Qtys9jVzo5DCgKDzkEJ95ZK/pE
	TW2DMjMqsR8bNwsaw0+5SaA6dIKhhQegcVwGfJ5yTnu4/7yFgsGdMCUF5Ov5bBdk2Uam
	Hs6wQbaCy76+rikY1a1R84XwvuFrcJWTRxFaKdv+PcGxPRubDsV3IQwqaTPfRb88CPTj
	8DB6yzav45wRZecDTelxp92Pugm3XYEe41jkCFEJZLZxZOHmuZ75WWk7bUgsiMQJ1wP6
	GTcqE2ArPgL04DpCDO2wUlYwwMreexHre26yQyBNuhZiWWxo9oe9mdcyS5na5laD4b1n
	hrbw==
X-Gm-Message-State: ALoCoQmfb2ZkpMU5maOB37CPFTIc/QZiuWx7hRrHSfzmQlqxF7Olueo2NwjmHDM8KUQzzfykshiF
X-Received: by 10.194.8.9 with SMTP id n9mr37718250wja.22.1447680265253;
	Mon, 16 Nov 2015 05:24:25 -0800 (PST)
Received: from localhost ([78.129.130.236]) by smtp.gmail.com with ESMTPSA id
	d66sm18549445wma.21.2015.11.16.05.24.23
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 05:24:24 -0800 (PST)
From: shannon.zhao@linaro.org
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	imammedo@redhat.com, wei@redhat.com
Date: Mon, 16 Nov 2015 21:23:08 +0800
Message-Id: <1447680189-2128-8-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::232
Cc: zhaoshenglong@huawei.com, qemu-devel@nongnu.org, graeme.gregory@linaro.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-devel] [PATCH v3 7/8] hw/arm/virt: Add QEMU powerdown
	notifier and hook it to GPIO Pin 3
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
X-TUID: ouawdrii40WA

From: Shannon Zhao <shannon.zhao@linaro.org>

Currently mach-virt model doesn't support powerdown request. Guest VM
doesn't react to system_powerdown from monitor console (or QMP) because
there is no communication mechanism for such requests. This patch registers
GPIO Pin 3 with powerdown notification. So guest VM can receive notification
when such powerdown request is triggered.

Signed-off-by: Wei Huang <wei@redhat.com>
Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Wei Huang <wei@redhat.com>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7977e3c..cb1d45b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -540,6 +540,17 @@ static void create_rtc(const VirtBoardInfo *vbi, qemu_irq *pic)
     g_free(nodename);
 }
 
+static DeviceState *pl061_dev;
+static void virt_powerdown_req(Notifier *n, void *opaque)
+{
+    /* use gpio Pin 3 for power button event */
+    qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
+}
+
+static Notifier virt_system_powerdown_notifier = {
+    .notify = virt_powerdown_req
+};
+
 static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
 {
     char *nodename;
@@ -548,7 +559,7 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
     int irq = vbi->irqmap[VIRT_GPIO];
     const char compat[] = "arm,pl061\0arm,primecell";
 
-    sysbus_create_simple("pl061", base, pic[irq]);
+    pl061_dev = sysbus_create_simple("pl061", base, pic[irq]);
 
     nodename = g_strdup_printf("/pl061@%" PRIx64, base);
     qemu_fdt_add_subnode(vbi->fdt, nodename);
@@ -563,6 +574,9 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
     qemu_fdt_setprop_cell(vbi->fdt, nodename, "clocks", vbi->clock_phandle);
     qemu_fdt_setprop_string(vbi->fdt, nodename, "clock-names", "apb_pclk");
 
+    /* connect powerdown request */
+    qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
+
     g_free(nodename);
 }
 
-- 
2.1.0

