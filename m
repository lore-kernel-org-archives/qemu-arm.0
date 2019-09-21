Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp497204wrp;
        Sat, 21 Sep 2019 03:34:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx/2Bkcr9zcpYPUfGqfQEp7JsznHcfcGDtMtR6RYpl5Th/0wkH+jB8mzjBirdyeCCNkrn9m
X-Received: by 2002:aa7:c743:: with SMTP id c3mr20422496eds.241.1569062065122;
        Sat, 21 Sep 2019 03:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569062065; cv=none;
        d=google.com; s=arc-20160816;
        b=CgQQFEEfE6fXLu/+ri3f12djeV3YBuIxsuquzPZOeh72AMYVkWotak2tzliemWg9J3
         YuCBR9H6Dl84XsU5a4hyabKM+yJvrLrqtTzINMQ/023DTgtmKfWiEqzc43Hy7viMozfF
         kcsyv5lP5A3GFxf021TXls+mFtcO1dNl52bg0tY/SIb6m03/0fJZZI7vFccN+1UY5sr0
         VsVBlfHu8GMr8zRhmhzVYSPa8Yjvh1V/W5lsvFLzKFaohGZFb8e0NhThIyERy/xQqmgD
         NrCJC+Sz4OLExhnKi7NGhM5g1S54nfArMR4KC+XI+hw7IKZ/KoGCTvO7JorX8Tf9ak3v
         dqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=d+Fe0leIo16SsXrmZDGKTyeXqu0oGw54YtM9o7TVH2I=;
        b=A2qba0/LtoGD2Z21X+ppPPf8nUTeZHRWkdLpmLrZhXXcM8L+gsKj1hLePPLsVJN6el
         OjbQ7O5tBgAWCL1FasFcCesbZUd/VdC+dcr9vrcXNMJeuHZGaskCUV8xEU0UP4MjEigv
         wXQwXTqGc4H8ZhYiKPjenWL7faMIC27WHIu7ME9vtCmquGs4TK6vcGGEHYgSbGCFkDb1
         nMJTKbErYfTYXv3o6oR4dU4Qzk3ypLr1xG1ayTp5r2nBQdLmbpFmmjXfk9eX+c3p9pRz
         vjL4Knz5TJBjIUqRvNUohpKkEoE7jaIC9+boCXW5X4B+hP5rX1MzFnDMdL6OURPbcxLt
         x2Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si2418766ejh.263.2019.09.21.03.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Sep 2019 03:34:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBcie-0007Pc-3S
	for alex.bennee@linaro.org; Sat, 21 Sep 2019 06:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iBciW-0007PQ-62
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 06:34:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iBciU-0000n5-3Y
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 06:34:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56636)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iBciT-0000md-R4; Sat, 21 Sep 2019 06:34:13 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C61A5307D91F;
 Sat, 21 Sep 2019 10:34:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-61.brq.redhat.com [10.40.204.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA978600C6;
 Sat, 21 Sep 2019 10:34:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] hw/arm/boot: Use the IEC binary prefix definitions
Date: Sat, 21 Sep 2019 12:34:04 +0200
Message-Id: <20190921103405.19623-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Sat, 21 Sep 2019 10:34:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mv4ckj+41P52

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/boot.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index bf97ef3e33..59bb2fa0d3 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1095,7 +1095,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cp=
u,
      * we might still make a bad choice here.
      */
     info->initrd_start =3D info->loader_start +
-        MIN(info->ram_size / 2, 128 * 1024 * 1024);
+        MIN(info->ram_size / 2, 128 * MiB);
     if (image_high_addr) {
         info->initrd_start =3D MAX(info->initrd_start, image_high_addr);
     }
@@ -1155,13 +1155,13 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
                  *
                  * Let's play safe and prealign it to 2MB to give us som=
e space.
                  */
-                align =3D 2 * 1024 * 1024;
+                align =3D 2 * MiB;
             } else {
                 /*
                  * Some 32bit kernels will trash anything in the 4K page=
 the
                  * initrd ends in, so make sure the DTB isn't caught up =
in that.
                  */
-                align =3D 4096;
+                align =3D 4 * KiB;
             }
=20
             /* Place the DTB after the initrd in memory with alignment. =
*/
@@ -1178,7 +1178,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cp=
u,
                 info->loader_start + KERNEL_ARGS_ADDR;
             fixupcontext[FIXUP_ARGPTR_HI] =3D
                 (info->loader_start + KERNEL_ARGS_ADDR) >> 32;
-            if (info->ram_size >=3D (1ULL << 32)) {
+            if (info->ram_size >=3D 4 * GiB) {
                 error_report("RAM size must be less than 4GB to boot"
                              " Linux kernel using ATAGS (try passing a d=
evice tree"
                              " using -dtb)");
--=20
2.20.1

