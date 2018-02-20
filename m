Received: by 10.28.71.27 with SMTP id u27csp1376186wma;
        Tue, 20 Feb 2018 10:07:15 -0800 (PST)
X-Google-Smtp-Source: AH8x226fNKRjKoAsdyHpPVqhs1IfQwKz3/aIwKHlmWTXtNoGEaeeunrp8pgfBDCjXD6ucPx2XwoV
X-Received: by 2002:a25:c942:: with SMTP id z63-v6mr470401ybf.250.1519150035437;
        Tue, 20 Feb 2018 10:07:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519150035; cv=none;
        d=google.com; s=arc-20160816;
        b=tVGMyklbUfcPUsWwaUFr2/tV/iDC6yN+j8TKZD2PkrzW5YQTe/Q4FF4W+RApRmkZVX
         Zp5L7Ph+v/CvUVG9f0YK2pztNv0GJYdKnCbm/alj/yhA0OjqTtqR+c3OUbKK2pVAgRBa
         REUr/LeCK/iU9UpUigavEvHEMo9AIK2RhmnFNTWIchOCB8D8PYJWLFTFA04RjV1fZNri
         S4OAQXXXUZTZ/lpRGAs/3gPHOFPiJjYnXz5jC4uzZLfhCCrCP596NjUeY33nXzSVw3uI
         xuGALNAymGy/3VIutj424tmz2/nVuv3p5ycWEcE0iOv9o/PEMUslMX4hqIeJ49XYqqrc
         c/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=7f0sNNTmrWJTgLGdjJGjEqgA0HBDv0++gqLlWY9ztKE=;
        b=kkLf3Csv+nXzlWEx/WbFoB/pHEPzY6f10FD9LEh3ErQaMRd0PGLeWlvBTJd17SYXw8
         G2BQaghx72BJPLjcHLG8arwu0vWXrP8blaoboJ3KRpN06dWktsWEy4uCCFJN9UYcGJ/n
         rUjO84lkjYU2PtSfEPbF8EfYJAgIIboeL+V0xzizMlvP3tVd8oQwDbNxI6gI6WV3qbAU
         3U75EsghusfOCa0dhv3YwoiBMJl1uZ9CA6Op2yEX/5vz5XG6HSXF53z5dW1vjf4pjxMw
         ie2Jz6Y9dqs8KpQwh/ZgmuYz6YF66kpEvlrUMppd/vl0eXnnlbY4uq2o4xiP/OT0GjfA
         dubQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 188si2333107ybs.259.2018.02.20.10.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:07:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCJu-0002ec-Oq
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:07:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGY-0008Bz-4P
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGW-0001gx-HW
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:46 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGW-0001ae-3i; Tue, 20 Feb 2018 13:03:44 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGF-0008QD-25; Tue, 20 Feb 2018 18:03:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:07 +0000
Message-Id: <20180220180325.29818-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 01/19] loader: Add new load_ramdisk_as()
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qut0D7SwchbE

Add a function load_ramdisk_as() which behaves like the existing
load_ramdisk() but allows the caller to specify the AddressSpace
to use. This matches the pattern we have already for various
other loader functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/loader.h | 12 +++++++++++-
 hw/core/loader.c    |  8 +++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 5edbe02b1c..2504cc2259 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -162,16 +162,26 @@ int load_uimage(const char *filename, hwaddr *ep,
                 void *translate_opaque);
 
 /**
- * load_ramdisk:
+ * load_ramdisk_as:
  * @filename: Path to the ramdisk image
  * @addr: Memory address to load the ramdisk to
  * @max_sz: Maximum allowed ramdisk size (for non-u-boot ramdisks)
+ * @as: The AddressSpace to load the ELF to. The value of address_space_memory
+ *      is used if nothing is supplied here.
  *
  * Load a ramdisk image with U-Boot header to the specified memory
  * address.
  *
  * Returns the size of the loaded image on success, -1 otherwise.
  */
+int load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_sz,
+                    AddressSpace *as);
+
+/**
+ * load_ramdisk:
+ * Same as load_ramdisk_as(), but doesn't allow the caller to specify
+ * an AddressSpace.
+ */
 int load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz);
 
 ssize_t gunzip(void *dst, size_t dstlen, uint8_t *src, size_t srclen);
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 91669d65aa..2b9e7394a1 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -729,9 +729,15 @@ int load_uimage_as(const char *filename, hwaddr *ep, hwaddr *loadaddr,
 
 /* Load a ramdisk.  */
 int load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz)
+{
+    return load_ramdisk_as(filename, addr, max_sz, NULL);
+}
+
+int load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_sz,
+                    AddressSpace *as)
 {
     return load_uboot_image(filename, NULL, &addr, NULL, IH_TYPE_RAMDISK,
-                            NULL, NULL, NULL);
+                            NULL, NULL, as);
 }
 
 /* Load a gzip-compressed kernel to a dynamically allocated buffer. */
-- 
2.16.1

