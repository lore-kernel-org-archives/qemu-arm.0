Received: by 10.223.172.38 with SMTP id v35csp2016396wrc;
        Sat, 16 Sep 2017 09:46:16 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAAIvoPWREx6ooqfzvByzMsCNQicj6dFxK0n2oSEfLmm8Qb9Uhm6HowytFN1wU5zQDH2ZBO
X-Received: by 10.55.114.194 with SMTP id n185mr13971222qkc.180.1505580376050;
        Sat, 16 Sep 2017 09:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505580376; cv=none;
        d=google.com; s=arc-20160816;
        b=utNXKVBi4mzYdAVjlcbsoplRC6SwYRsjlAh1vp/4IR6oSjLJIHy2X5417hMp1WxPR8
         agMKHaAH9Uchu/1bf6QLLi3HTv1fNT+phVK5XnXP2Ev8z/Vv5KMCuxawvTeXM2YMUNZ4
         hhKVD/spNFp2+FWwsSvClWMHLJR7EJvAE4jtcFvC2dOE3hCNsTy1335T86kLKsa6nPwM
         46rnCD/TwSEyLgBZ2RZllVZiUDof495MuM5tmjAgdrIIVU+9aJ41DY+qTn/eNY+k4vdx
         YnzAa2eXP+eGAy707p7e7yMl4SztPuizAAREPAGKXQPWrHNFmCMhEp2uslhM0xeuUoXr
         rwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=oPFgGbzv7TmXaDro6rgmG6gL2MQDoHDyVHlFDYqAWgY=;
        b=ZN+Ctuh8eiGuKap47gSyue5w+XKf27529QbUon4V5rFGtGzmSs3DrCu3UUQugrnV16
         BQWEBNeu7EsomPczdzK0MY7s/AJRdVwCY1DcD/QiaGo1a6IclPLsTAYWH8Y3d6cV8M6j
         okh2Y5ccZNkS9yak9znGAXt/cPOD42tjk+9r/i+eDRtPtTHh2UM8W+rmhDvgWzwBJ/dO
         cgDI3HwqME/aPv/BxqReQShv9qq98+IinHJjYcHNDklHwkSZNnYzUjGZ+Pb8/GgcPOX3
         /KS2eVabFDQv/+4TuxBlXRpybZfyFqE/sw4PZ/EBXL7Q1Ly5XUSFCmEHUTfxZOhpxltX
         OTVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m62si3431319qkh.303.2017.09.16.09.46.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Sep 2017 09:46:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtGEP-0008Dv-LW
	for alex.bennee@linaro.org; Sat, 16 Sep 2017 12:46:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGEA-0008CF-RZ
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:45:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGE9-00077r-VI
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:45:58 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dtGE9-00075o-O6; Sat, 16 Sep 2017 12:45:57 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dtGE2-00017U-Ru; Sat, 16 Sep 2017 17:45:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 16 Sep 2017 17:46:18 +0100
Message-Id: <1505580378-9044-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/6] hw/arm/omap2.c: Don't use old_mmio
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
X-TUID: 8JjZPcsLppOh

Don't use old_mmio in the memory region ops struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap2.c | 49 +++++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index ece25ae..f35d265 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2087,19 +2087,44 @@ static void omap_sysctl_write(void *opaque, hwaddr addr,
     }
 }
 
+static uint64_t omap_sysctl_readfn(void *opaque, hwaddr addr,
+                                   unsigned size)
+{
+    switch (size) {
+    case 1:
+        return omap_sysctl_read8(opaque, addr);
+    case 2:
+        return omap_badwidth_read32(opaque, addr); /* TODO */
+    case 4:
+        return omap_sysctl_read(opaque, addr);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void omap_sysctl_writefn(void *opaque, hwaddr addr,
+                                uint64_t value, unsigned size)
+{
+    switch (size) {
+    case 1:
+        omap_sysctl_write8(opaque, addr, value);
+        break;
+    case 2:
+        omap_badwidth_write32(opaque, addr, value); /* TODO */
+        break;
+    case 4:
+        omap_sysctl_write(opaque, addr, value);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static const MemoryRegionOps omap_sysctl_ops = {
-    .old_mmio = {
-        .read = {
-            omap_sysctl_read8,
-            omap_badwidth_read32,	/* TODO */
-            omap_sysctl_read,
-        },
-        .write = {
-            omap_sysctl_write8,
-            omap_badwidth_write32,	/* TODO */
-            omap_sysctl_write,
-        },
-    },
+    .read = omap_sysctl_readfn,
+    .write = omap_sysctl_writefn,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.7.4

