Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp364941wrw;
        Sat, 17 Nov 2018 03:01:19 -0800 (PST)
X-Google-Smtp-Source: AJdET5ecSDZMCTcyJOCLtlIvqkQwhZxeEuk8IJodqXcf0qflSomXQPqy/19+MfJrIIWoys9UymZN
X-Received: by 2002:ac8:3a64:: with SMTP id w91mr13715765qte.70.1542452479614;
        Sat, 17 Nov 2018 03:01:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542452479; cv=none;
        d=google.com; s=arc-20160816;
        b=E1qol4QTUi1b+3mWTn+B1LrtVuXiz3mk9uF2F8PIwifMn7Zgn+VM6+Yt3YpdyZbR2e
         t/NbZAmmXUrYLn7J37kr2z1FMnTT0XsQzHNHQ/p7vSCgy7kwz5j7rc0njiBZ8KjO5FXX
         YQg7B82zJcJ/vMpmUct2RW/l/mke+YlHJUHyFOvzPnjeJd/8ilJFMK8qMbicgJQr7yi4
         HW4Vd5h/HG1gbZgaNgV5d/B+52ZqVQSimOZXYbgg+j/vpdK1N80jD816m8ruOrgqAMOx
         MN7DrEFyCjXTO0k7RknFTHDAOUPCuFWuDRwk1lfP6G0q6uWPksQuzIMJyXVnazuosWJe
         gDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=2o4hlqLxFg/bVCl/P0e+Sl8PKOEsJlZcOyjvO27sAZI=;
        b=Zkwokr/yoXMu/4Kv6cnkdsHzZ4jU3+aS7sS4K5xsmIknRZSEyc6MC+wUjrsQ/4Nppp
         PyRltaAXfFcF/sSqUWR6RY9pETj0NHPhpMTTPzZRYj8DkKihgbaZlKoeCHg4ffYxcnaR
         OwETaSr4oAmPtPTX9cuCLxc5FMt8QwpS2fjn87qsPC/bBf8Z9dxV/m/4Vi8MmvQUzMOW
         UITWLp108KQ2ZjMabhv8hSElMKSHrR+82YudYpLgF3+u8ZruRxNHpXAdHY0JMFj8K9Mx
         gH2lFXbTB8bLK3wyeqTQAp3F4n/ddR5bfwj07V5YygQ0AIx5OOdPFNDdqFB3ZulPgXg6
         jB+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w90si3172905qvw.209.2018.11.17.03.01.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Nov 2018 03:01:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNyLn-0006e2-0u
	for alex.bennee@linaro.org; Sat, 17 Nov 2018 06:01:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNyLY-0006b9-1q
	for qemu-arm@nongnu.org; Sat, 17 Nov 2018 06:01:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNyLU-0003xf-UL
	for qemu-arm@nongnu.org; Sat, 17 Nov 2018 06:01:04 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:17884)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gNyLU-0003us-Jt; Sat, 17 Nov 2018 06:01:00 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 9950634DA987A0496E83;
	Sat, 17 Nov 2018 19:00:49 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAHB0fZn057762;
	Sat, 17 Nov 2018 19:00:42 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111719012931-11314418 ;
	Sat, 17 Nov 2018 19:01:29 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org
Date: Sun, 18 Nov 2018 03:22:46 +0800
Message-Id: <1542482566-91660-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-17 19:01:29,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-17 19:00:22,
	Serialize complete at 2018-11-17 19:00:22
X-MAIL: mse01.zte.com.cn wAHB0fZn057762
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH] hw/arm/sysbus-fdt: fix assert in match function
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
X-TUID: I9T1CyTKjVLs

In match function it should not call OBJECK_CHECK. When there is
a mismatch, we should continue to match rather than assert().

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/sysbus-fdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 0e24c80..41b962d 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -419,10 +419,15 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
 static bool vfio_platform_match(SysBusDevice *sbdev,
                                 const BindingEntry *entry)
 {
-    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
+    VFIOPlatformDevice *vdev;
     const char *compat;
     unsigned int n;
 
+    vdev = (VFIOPlatformDevice *) object_dynamic_cast(OBJECT(sbdev),
+                                                TYPE_VFIO_PLATFORM);
+    if (!vdev)
+        return false;
+
     for (n = vdev->num_compat, compat = vdev->compat; n > 0;
          n--, compat += strlen(compat) + 1) {
         if (!strcmp(entry->compat, compat)) {
-- 
1.8.3.1

