Received: by 10.223.172.38 with SMTP id v35csp2016579wrc;
        Sat, 16 Sep 2017 09:46:31 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QABme+L7eNwvsMvyJ8qqMwRRFNqW4XkbAcJQI0Gpewjco4kGJ2NFjt9cRcvIxAshEnDxv54
X-Received: by 10.200.52.117 with SMTP id v50mr44986678qtb.333.1505580391792;
        Sat, 16 Sep 2017 09:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505580391; cv=none;
        d=google.com; s=arc-20160816;
        b=I25z96rsUvYrFOguiFvGcRjQv6RZe9a/CXOtZSRx+ddlDdx3quZ3iaeNiwRP8MpyJD
         JTlAA/fk3AjvnWA5VJihMJH5ipNTRfUv5BE6zCr5iGBMtbeEI08YRZ6j1ET3JcvOpP+4
         I7QfdqoZLDBUeIQSp4SvxUcY5jkYBWUZMG2SGSC6xDjSewZV1f//2eYL4mIT4vM5cZbb
         /pR7/c2jSSBugOic93rcv9Nd4GWHgpkh6rrDQwwq/uFvIRSErxlxwOxRLxBf1GSIVdQp
         pVt8+dcf8sPlypRqsDZ3HJdc4xOZh+R36uW8+YnwsTPA+MXsPj2aEyHGBfcpCmhfK1LD
         AhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=nr07OIf64PqJ+jPUI84GrAq52VIzEuACQMEtP9LzgYM=;
        b=uLr5C8ZvBa0CT1JbfS+6HXfPBLYQNrZlKXPnDixEag3t4NCcOzFjkto8Pw5WNogNg8
         UlUkGbCi/Ay+8JLivmv5H3Io6YxjDDjIlwEocoGumZL5fFre5BLf0APqXiOh922u40KM
         PrOEAXOKHWW9+2EDmWgQ/c4aCSe7ri+juf5tRaPPcwbgkgiW5MnDZyEAWClzQYzO6X92
         r82LJJHVmSwIbm35lpwriCS2otOtulK2H3puGBHPnTNAugj/UmnWsoZ0fY3JYv6AdZLE
         drmPA0pq6ZflDjFE1BlBFLGTtwVuiTlMI+eRYtb4UvfCkFC94b0m/nkzc6/0mGrSlAur
         YOlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n16si3616035qtf.26.2017.09.16.09.46.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Sep 2017 09:46:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtGEf-0008U2-E7
	for alex.bennee@linaro.org; Sat, 16 Sep 2017 12:46:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGEF-0008Eh-Sa
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:46:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGEE-00079x-OO
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:46:03 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dtGEE-00075o-IG; Sat, 16 Sep 2017 12:46:02 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dtGDz-00015X-Gs; Sat, 16 Sep 2017 17:45:47 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 16 Sep 2017 17:46:13 +0100
Message-Id: <1505580378-9044-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/6] hw/arm/palm.c: Don't use old_mmio for
 static_ops
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
X-TUID: QGlHTQFb59j5

Update the static_ops functions to use new-style mmio
rather than the legacy old_mmio functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/palm.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index bf070a2..264f5bd 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -30,26 +30,16 @@
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
 
-static uint32_t static_readb(void *opaque, hwaddr offset)
+static uint64_t static_read(void *opaque, hwaddr offset, unsigned size)
 {
-    uint32_t *val = (uint32_t *) opaque;
-    return *val >> ((offset & 3) << 3);
-}
+    uint32_t *val = (uint32_t *)opaque;
+    uint32_t sizemask = 7 >> size;
 
-static uint32_t static_readh(void *opaque, hwaddr offset)
-{
-    uint32_t *val = (uint32_t *) opaque;
-    return *val >> ((offset & 1) << 3);
-}
-
-static uint32_t static_readw(void *opaque, hwaddr offset)
-{
-    uint32_t *val = (uint32_t *) opaque;
-    return *val >> ((offset & 0) << 3);
+    return *val >> ((offset & sizemask) << 3);
 }
 
-static void static_write(void *opaque, hwaddr offset,
-                uint32_t value)
+static void static_write(void *opaque, hwaddr offset, uint64_t value,
+                         unsigned size)
 {
 #ifdef SPY
     printf("%s: value %08lx written at " PA_FMT "\n",
@@ -58,10 +48,10 @@ static void static_write(void *opaque, hwaddr offset,
 }
 
 static const MemoryRegionOps static_ops = {
-    .old_mmio = {
-        .read = { static_readb, static_readh, static_readw, },
-        .write = { static_write, static_write, static_write, },
-    },
+    .read = static_read,
+    .write = static_write,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.7.4

