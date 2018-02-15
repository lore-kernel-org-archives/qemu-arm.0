Received: by 10.28.71.27 with SMTP id u27csp2941527wma;
        Thu, 15 Feb 2018 09:57:24 -0800 (PST)
X-Google-Smtp-Source: AH8x2266gteFkLI8y/15xk1SFEvmY9vmODmvKE0ZUXcaRmiJHSfAzg7WrkiYpghb4Mc5bWuyCCXs
X-Received: by 10.129.198.6 with SMTP id l6mr2661156ywi.495.1518717444685;
        Thu, 15 Feb 2018 09:57:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518717444; cv=none;
        d=google.com; s=arc-20160816;
        b=Wm8byr18/8ePCS1aenCyHXlW4XHbjaQXGVBn+ztZqcG09bc6aUf14MTKNM9MJMYqZ7
         Egbzpqp6YFOe7b9x7o/85x1FpGYDdE9JpFGLU7fWxjHFOHwKgJlsp0h6P1Vxx9VwtcAG
         rHShXShYPmbQ8kJQSTl7MCQtQ84zCfsThwF4f926FlQsT4dSJ5lyG5p+JK1bJy0wmDOa
         o3OFSWS9uE7rt0Gs4ObftxMvXFfGiR7A2GNh4XyTSauHks3Ilk+jCfCioOZAP/zW12Jb
         EPFG+bGWSNGxd4dzJCnFs/Pl4BPGaDfw1pjLInkR8P7e/ocCijkFLmO/kXW+9T+WNGQI
         lDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MopdkQQV6PW6c+YNHGsExPD0m3nXDL5DSNqvawGVMtQ=;
        b=HOTMX3dWnBOcapeoQndC88BNQnCk+zXyG4o8AQARz2Dsp+SDKYT5n+pBlht26YIT85
         sYdSr5wUDPeyWDJTJEnNQgAde3VTKkGtVqS7yxJopkhe39H5GBaMER4YqS/A/LLTIeTX
         LNoJNicvVw3H68fJytZ19mZyJTkOGmwTjjCDCFMDA1Mk1Vlvrp5XA996YJnGM/lCAyLw
         vJ44qht/1cqwppMB8U+6vj+krLe3i4b4LRSm3RdsgjoGHUSmO8ajeo9DIzijF9/kbWo3
         vDpl9NEsYxp1nrrhlMvnqzao0pAhoWbuLoHA+A5qvjpdvgtwtmITltPwog4m75zE/OnW
         RL6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q9si304097ybj.600.2018.02.15.09.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 09:57:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emNme-00084H-30
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 12:57:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1emNmS-00082E-JJ
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 12:57:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1emNmR-0000Z4-Dz
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 12:57:12 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46422)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1emNmR-0000Xo-69; Thu, 15 Feb 2018 12:57:11 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1emNmP-00020Y-0C; Thu, 15 Feb 2018 17:57:09 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 15 Feb 2018 17:57:04 +0000
Message-Id: <20180215175707.15491-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180215175707.15491-1-peter.maydell@linaro.org>
References: <20180215175707.15491-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/3] loader: Add new load_ramdisk_as()
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
X-TUID: 9LFVS5+0SFD6

Add a function load_ramdisk_as() which behaves like the existing
load_ramdisk() but allows the caller to specify the AddressSpace
to use. This matches the pattern we have already for various
other loader functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/loader.h | 12 +++++++++++-
 hw/core/loader.c    |  8 +++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 355fe0f5a2..1fd4256782 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -163,16 +163,26 @@ int load_uimage(const char *filename, hwaddr *ep,
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

