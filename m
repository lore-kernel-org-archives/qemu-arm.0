Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2646251wrp;
        Mon, 23 Sep 2019 06:12:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6NWdWrLJX44Zpi7Dqf7jkxFY7pEyyjdVcgtXnVXtKCIYsO0wSGMjEaRXPeMoBkUx5fJi5
X-Received: by 2002:aed:2f42:: with SMTP id l60mr16451511qtd.315.1569244367387;
        Mon, 23 Sep 2019 06:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569244367; cv=none;
        d=google.com; s=arc-20160816;
        b=I0eEI2bbhM7prGCat/64Aqojrndgm5p84AjiV6giIoaqVx9wqsp0Wjwlbju7DfheEO
         O2QHMyn9YyXPdK38LGrNgo6Q0cPtaRHHUSOa7IzXx+m3AjFwqs8wu5/IH2h8jZ3OLHMz
         OxZe/QV5Aq6Ng/7lRU4u2y8cmstOxrr+m6Lj967dOPE7N7EtPV5xkYXtil9s/fY47yJX
         n+UhoU3+JAqW1w4sTa1i6EmMEJq8hKzV93Mgh0r6Q2KHG+F86/NptdZkvesRf844tSJv
         Mx8AX3itSMz2Cl7HqFM7vyex8+AuDGa6Dk1OPAny5XyY/Pk0y7dqRJcrUuxKNvyJiNdY
         jVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=Uoe3nT8xILeY1maY0zt9IQLNsgw6i65Xb2ydAtj1+bY=;
        b=QSHW9hOTBtwHcavVzTnPkVoHksgBnhOMR36fBSC45QT2vBxm3u5fhZILoZArCsiPrK
         2AORIPWOZ9reYPNv3jLN8hP+2Q5HkBDuSEjf1o1ABGksTuTgs+rpioIZOa6q2bg6nsVc
         s01C5Q+ylQeUyYVoAdZ0w82JVzUeiFB22UvTPIok9SAwn44YnFO2ErHiZArdxfFfdiCV
         1icJUbFU7xRa3IN0yUuqof3kAJ+GFMaivKYhZbai514pTRX8z1HJU+O8YxH2qNgPyt/R
         XW76tAw+elbTIWeuTyhVy3u339fNkKt2a4JGsIbzuvVIb0SkEDmg/imZZ5wTVRbMlbnC
         jeNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si7480251qtp.398.2019.09.23.06.12.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 06:12:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCO90-00020x-FB
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 09:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iCO7g-0001wp-2R
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:11:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iCO7e-0006Ux-VC
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:11:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56514)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iCO7a-0006Tk-1d; Mon, 23 Sep 2019 09:11:19 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A62A4C01B81A;
 Mon, 23 Sep 2019 13:11:16 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1659710013D9;
 Mon, 23 Sep 2019 13:11:10 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH v2] hw/arm/boot: Use the IEC binary prefix definitions
Date: Mon, 23 Sep 2019 15:11:08 +0200
Message-Id: <20190923131108.21459-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 23 Sep 2019 13:11:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uGoDo1jiig4a

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Use 4*GiB in arm_load_dtb (sgarzare)
---
 hw/arm/boot.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index bf97ef3e33..bc3e7be1e6 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -575,7 +575,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
         goto fail;
     }
=20
-    if (scells < 2 && binfo->ram_size >=3D (1ULL << 32)) {
+    if (scells < 2 && binfo->ram_size >=3D 4 * GiB) {
         /* This is user error so deserves a friendlier error message
          * than the failure of setprop_sized_cells would provide
          */
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

