Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB48D1950F
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 17:46:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkQd1-0001XA-TO; Mon, 26 Jan 2026 12:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQck-0001M7-Cc
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:40 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQch-0008WV-Ul
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:38 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4359a316d89so3553842f8f.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 09:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769449414; x=1770054214; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xooLCZtH0ZC3/iJjGv3DYg/vTW0gVjlRUxdeK15JZ+0=;
 b=cV58PGDpO4wvlGzywNssRzq6xRQ4jTWTXQfAanxzjRO0AP8YxcdCjrsh/QMELiZ9ZJ
 ZeRwrkcewRV0u0r4KmcfsVVJjxyEiAjsOVaaSt40KCNfLeg1tgF58yIoLtX+1zGdixJe
 hO5hA5matTA7UUXFEW8P1WK/njddnYHGtHyiTWFCSJ4sEZEO6V4P1b+6qaTyjkFFwtp9
 XYYUwGIvyULckfRX6m8qXqTF7SnrZtEHp9g1STQQ/ajaoe9TDfHw1eft3fCX04Q0XeYQ
 pLuJMxiWA5lB/2LpfLow9jd5daHEJWUTmxwpF2p59hgk1acwayY7Yp5WtYOeaZiQKfQY
 7tzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769449414; x=1770054214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xooLCZtH0ZC3/iJjGv3DYg/vTW0gVjlRUxdeK15JZ+0=;
 b=p/m46XktIeiRqHpyqCNkfAoUj5Q5lMmdYCMdmVBpZxVwP7y7px+2s/0ZlhKsQzylGt
 u2jPt2Bxl7KKs2IrcM2SE9oDkOVbLrhEOgpa9HJq646824YapUGO2R7YyH4ui9gCIJAT
 /6+bAeO4URCujpM+n2E6avRqRyOUP93psktWt+yQPusQom6wLGcePWqnLfHGcV64I3jO
 atzf8k//yhX2cWdd2Nde03/404/xDmgkBIgY+85HWW9li4YXb/4VLYE0xXW4jtbH7TXN
 OaTpgaYyuc22j6Nb9gsec5u+02Qogh2fDeYtSb7IyvcQWTQO4e49ngu/gmyNAfmOKEOC
 w11Q==
X-Gm-Message-State: AOJu0YwzKfkORok7LJiTXsm3uHaFPyFqBBLmKBZF4mgFZH0F1JOwOHzr
 ArrtaxSlod1BbpwbDqg1kpwMzmBkogq6vWy2UaXnpcez/DgkmPbVvKJN
X-Gm-Gg: AZuq6aLiNsk4ABdZjWY559k+y4oUiuyL1jT15ZkPCDK2E+MqbqssLpyd7gxrYqAr41o
 FHNsq9A4+EiWqFfU9HpVMVcr2QCzuyQx0pIs1fr7AXzrF8PaT76SkZtKqfYvWFCnmBbuGPbRgBL
 3zqVi18BE8nQK3KsC08J+nMwQj1M3J5lqUWtA7Z7mOW1T28F9YZCyveAlvo6HeDgHit5c7ecE9g
 aY6lRIg6I3VS4kJHr+t3eHQOuPklJ0k0xhVDZG5MwHzB8c20+IR6DAutReCteAX4MpHyfXMH+ui
 a8jcmyS/qVjH9aE5uL5Ph8T+CdWhBRR98877B15uKy3nNSuzRoedu6fQFY2cfbVfrItaTmNV9R2
 EiEt4xExJZyF2XuHXUiCoaXhNziLQQJSunEk74tjXQTZIt4axbIe2y75YVCsNwWBM5kWC74L5ga
 a7Gm8SgDsnChP2sYKAYrlecGvI6fiXtYWpWa/aR0VlHz4w9zqFStJMTUsq84plhWTl
X-Received: by 2002:a5d:64e3:0:b0:430:fdb8:8510 with SMTP id
 ffacd0b85a97d-435ca071e29mr8186664f8f.24.1769449414157; 
 Mon, 26 Jan 2026 09:43:34 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-71-105.adsl.net.t-com.hr.
 [93.143.71.105]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71730sm34199603f8f.26.2026.01.26.09.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:43:33 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com
Subject: [PATCH 10/27] hw/core/fdt_generic_util: actually realize device
Date: Mon, 26 Jan 2026 18:42:56 +0100
Message-ID: <20260126174313.1418150-11-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Actually realize objects with TYPE_DEVICE after main
allocations done and properties set for qdev.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index c1d6ed9105..2c3f4d6b09 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -741,6 +741,26 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
         fdt_init_qdev_scalar_prop(OBJECT(dev), p, fdti, node_path, prop);
     }
 
+    if (object_dynamic_cast(dev, TYPE_DEVICE)) {
+        const char *short_name = qemu_devtree_get_node_name(fdti->fdt,
+                                                            node_path);
+
+        /* Regular TYPE_DEVICE houskeeping */
+        DB_PRINT_NP(0, "Short naming node: %s\n", short_name);
+        (DEVICE(dev))->id = g_strdup(short_name);
+
+        if (object_dynamic_cast(dev, TYPE_CPU_CLUSTER)) {
+            /*
+             * CPU clusters must be realized at the end to make sure all child
+             * CPUs are parented.
+             */
+            fdt_init_register_user_cpu_cluster(fdti, OBJECT(dev));
+        } else {
+            object_property_set_bool(OBJECT(dev), "realized", true,
+                                     &error_fatal);
+        }
+    }
+
     g_free(dev_type);
 
     return 0;
-- 
2.43.0


