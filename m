Received: by 10.182.158.201 with SMTP id ww9csp3416092obb;
        Wed, 2 Dec 2015 16:29:21 -0800 (PST)
X-Received: by 10.140.226.198 with SMTP id w189mr8147575qhb.83.1449102561815;
        Wed, 02 Dec 2015 16:29:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r129si4141503qhb.44.2015.12.02.16.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:29:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hlx-0006Qn-EJ
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:29:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcE-0004ZF-2X
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcC-00026O-QM
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:17 -0500
Received: from mail-qg0-x230.google.com ([2607:f8b0:400d:c04::230]:34348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4HcC-000262-L2; Wed, 02 Dec 2015 19:19:16 -0500
Received: by qgeb1 with SMTP id b1so48726172qge.1;
	Wed, 02 Dec 2015 16:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Vag73/bxn6aC2tNbpzDxTsRT5ngLAvYbR2mhc8nkrr8=;
	b=bBjNIlZPznxhRlo2poZ7qxZZBvxNI0Ibk/2waip+1JtarmeScfQMNQx5AwvuGIsY2q
	wVFWrK/hkTkHdg+4kh8hT3tK5DCqrBzaoylShWkI4O8Y9cupHmiNWnQCDSvvOj0d6g2M
	9mgnKuiacJG4lk/c5xcy4leHAA6LIvAVPuiYXmhm1w8gYb3yvn4Rtp7AIcV+MDojxsEC
	pbdxGnwU6sQv2sk3xXE8F7IsnMXMXAM9Pq22E5RC5Ka6A17IYSXnjifFe/23/YWJHTuF
	tFd1YDngL+O4FbErj81mrW+XgPeETwTGAASMUQrxdiyry2+r3Nxdiaq6m+FsAPqjYx5r
	sA8w==
X-Received: by 10.140.31.194 with SMTP id f60mr7857502qgf.60.1449101956231;
	Wed, 02 Dec 2015 16:19:16 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:15 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:52 -0500
Message-Id: <1449101933-24928-26-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::230
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 25/26] armv7m: remove extra cpu_reset()
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
X-TUID: wR+4eKM7/4Hv

cpu_reset() is called as a side-effect
of realizing the CPU.
arm_cpu_reset() calls rom_ptr(0), which
expects to find the image mapped.
This was happening way before load_*()
and was worked around with a second call to cpu_reset().
Now wait to realize until after the image is mapped.
---
 hw/arm/armv7m.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index fb805fe..41b9596 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -159,13 +159,6 @@ static void armv7m_bitband_init(void)
 
 /* Board init.  */
 
-static void armv7m_reset(void *opaque)
-{
-    ARMCPU *cpu = opaque;
-
-    cpu_reset(CPU(cpu));
-}
-
 void armv7m_init(const char *cpu_model)
 {
     ARMCPU *cpu;
@@ -206,9 +199,6 @@ void armv7m_realize(int mem_size, const char *kernel_filename)
     uint64_t lowaddr;
     int big_endian;
 
-    qdev_init_nofail(DEVICE(cpu));
-    qdev_init_nofail(nvic);
-
 #ifdef TARGET_WORDS_BIGENDIAN
     big_endian = 1;
 #else
@@ -233,7 +223,11 @@ void armv7m_realize(int mem_size, const char *kernel_filename)
         }
     }
 
-    qemu_register_reset(armv7m_reset, cpu);
+    /* Realizing cpu calls cpu_reset(), which must have rom image
+     * already mapped to find the correct entry point.
+     */
+    qdev_init_nofail(DEVICE(cpu));
+    qdev_init_nofail(nvic);
 }
 
 static Property bitband_properties[] = {
-- 
2.1.4

