Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4785022lfp;
        Sun, 16 Feb 2020 23:43:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgM7zlpji+bJULDG7d6ztSzDhj7VGBseaF9y1kyVmDH86mmuqBC7aPKvaEv7H8D3vDy5y/
X-Received: by 2002:ac8:694f:: with SMTP id n15mr12177206qtr.372.1581925417510;
        Sun, 16 Feb 2020 23:43:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581925417; cv=none;
        d=google.com; s=arc-20160816;
        b=p6VuJ71KaV1dZAa1p9XgIbHQLQAY8yXlCEr8up+iJ08zwijGPTY603FkYIA/34FTfG
         qVvtrFxg/zNKtCL/+EnIJ01Ii58xy1nra9c1Ng75XRFqqzSJ0JzbkGN298Jc5TAQBtku
         iiwg7X4vsXP431mbeoXGpZc98jDA24EzodEmtmMJw+vmSFklpONjYR08TfNahiUwVp6X
         uOvjOW/Hxvwu5m8W2mybYcJReoNgr/aWTaK/uz8P3Q8sgoOJHm6Eezo5XJrvtxr4+ANo
         qsAaoApMlwdiJAkcU8VkggwhgrinxGDERWuAxGLRmE+uWoq4rmiaBYpjKVyqyNfX0IrM
         m8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=fHUygRcnWSblJjHh0kqrOZVRzxnQvmgn8770GDvUy48=;
        b=VJqxhvSTtp/Nccn0wqn0h6kUGF3OK9Jpsil4eZ0dYrjFHH1R3F163CT9CyD+VIBm0G
         TNW9z0gF0+okbeUEYfr3CdV9C/fqInkwK2cVpbO84O+dvSFAgnidakTr/6oZIBcoqMzv
         altzclNKdP/7jCLYaSBihWIHdTq/MorBqzwURG9+CyrPeUEVAPSv1oVr4UldloT18zSc
         J2m1H7fitCu/LxVB7rirtTQRAbRiVAfa225dt+16mSBQreBeL/ioLIh6jYyXpG3Wi3Zl
         1rvjJ9wdDkjQM/Kf+tM6XA1s5gS1OylmnOBcfxFBSLtVjipwf0rfqDS63Vgc/4tTYXXB
         P7FA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si6005995qvu.9.2020.02.16.23.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 23:43:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3b44-00062p-VK
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 02:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39254)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xuyandong2@huawei.com>) id 1j3b2u-0004Gy-IZ
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:42:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xuyandong2@huawei.com>) id 1j3b2s-0000So-Tm
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:42:24 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:36470 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xuyandong2@huawei.com>)
 id 1j3b2q-0000JD-FD; Mon, 17 Feb 2020 02:42:20 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EAFCB999BEF12C43F04B;
 Mon, 17 Feb 2020 15:42:13 +0800 (CST)
Received: from localhost (10.175.124.177) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 15:42:07 +0800
From: Xu Yandong <xuyandong2@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH RFC 06/16] hw/arm/virt: split MSI related codes from create_gic
Date: Mon, 17 Feb 2020 02:51:18 -0500
Message-ID: <1581925888-103620-7-git-send-email-xuyandong2@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
References: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.177]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: zhang.zhanghailiang@huawei.com, slp@redhat.com,
 Xu Yandong <xuyandong2@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YueinfqCHN8D

GICv2m and GICits is not always needed.

Signed-off-by: Xu Yandong <xuyandong2@huawei.com>
---
 hw/arm/virt.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9031fd6757..32c3977e32 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -605,6 +605,15 @@ static void create_v2m(VirtMachineState *vms)
     fdt_add_v2m_gic_node(vms);
 }
 
+static void gic_set_msi_interrupt(VirtMachineState *vms)
+{
+    if (vms->gic_version == 3 && vms->its) {
+        create_its(vms);
+    } else if (vms->gic_version == 2) {
+        create_v2m(vms);
+    }
+}
+
 static void create_gic(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
@@ -719,12 +728,7 @@ static void create_gic(VirtMachineState *vms)
     }
 
     fdt_add_gic_node(vms);
-
-    if (type == 3 && vms->its) {
-        create_its(vms);
-    } else if (type == 2) {
-        create_v2m(vms);
-    }
+    gic_set_msi_interrupt(vms);
 }
 
 static void create_uart(const VirtMachineState *vms, int uart,
-- 
2.18.1

