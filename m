Received: by 10.28.4.212 with SMTP id 203csp1036468wme;
        Fri, 27 Apr 2018 10:36:31 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqi/VllBCIdalePU8trFojdkb5kExuboG2DyLYAGPgUCecFmi6N8/RpcD12vGLYRurg5Ma4
X-Received: by 2002:a0c:8975:: with SMTP id 50-v6mr2885993qvq.177.1524850591599;
        Fri, 27 Apr 2018 10:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524850591; cv=none;
        d=google.com; s=arc-20160816;
        b=pNvz97KP2n8232XV9ljHpS8E3aepDJSx2kv3ATbeRYAxKetljsC8vuNEIKZkSXQcnj
         bQaUErROlcW58Xyk0d3u070LCf6gC8RyBoCvig21wp9ZrIG4JLEUxLDvO/6JpzQBWwBT
         2/qsNhq7WW/ZG9a2ID4Y8UGzEd3LOKk9xGvfnNAzOGmNrm6PAH60Y/vEBQwcv+PAbmUz
         phVFsB+HZ61FTzsjrgsdBeL8XUa+BFukRNUEfLivkUq8QXr9zk/6h44vVBWgcM0I1iZ4
         e58NTX68UqCCaHnJVOd8/KNcx98jeIqmXz7FJ1nQ82vM5LZAhfp9BhIwzMQm9IMf9b3F
         I+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=wywN5wm07+TWQ27AGPPpTy8NtpzDsCkyDmF1fqPhpr4=;
        b=XGeagSpk8hD149o+/S8Qsa7cO7cyp2SoFQMA0WxYTsPFw5b1875/Ii3jiU/2KS8E0l
         EbYJyYQr9LNZ7o09Z23AubJxSglnwfOdccFehLnhECTR2HwSPx9atAhAAtZIuB6rMDLD
         HRVfeuyO0VkOY7VuUzo+7oPS32WTqv89X7wvaElc5D4w614Jw0qC8HO0x8vwm1mY913H
         aWJj4qFYI+TwE96/Z9LsK/bhIktCYlBV0WEIeRXxISCAGEVGeXyNsQK3tKdwrwMA2sIZ
         EQXqEn2KTQPpotnryTtqa3MAHX7wTPkPSnE5ITaPP0kOB9PxF92sjAWxp/TUjfoCZXy6
         LNDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g190si1750412qkd.72.2018.04.27.10.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 10:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC7IN-0004WQ-42
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 13:36:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fC7I9-0004Ue-5f
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:36:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fC7I8-0007tD-BW
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:36:17 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fC7I8-0007qu-4F; Fri, 27 Apr 2018 13:36:16 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fC7I4-0001WD-RM; Fri, 27 Apr 2018 18:36:12 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 27 Apr 2018 18:36:10 +0100
Message-Id: <20180427173611.10281-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180427173611.10281-1-peter.maydell@linaro.org>
References: <20180427173611.10281-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/2] hw/usb/tusb6010: Convert away from old_mmio
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
X-TUID: g5F/Rwr5fiUf

Convert the tusb6010 device away from using the old_mmio field
of MemoryRegionOps. This device is used only in the n800 and n810
boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/usb/tusb6010.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index 2662c060ed..a2128024c1 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -641,11 +641,43 @@ static void tusb_async_writew(void *opaque, hwaddr addr,
     }
 }
 
+static uint64_t tusb_async_readfn(void *opaque, hwaddr addr, unsigned size)
+{
+    switch (size) {
+    case 1:
+        return tusb_async_readb(opaque, addr);
+    case 2:
+        return tusb_async_readh(opaque, addr);
+    case 4:
+        return tusb_async_readw(opaque, addr);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tusb_async_writefn(void *opaque, hwaddr addr,
+                               uint64_t value, unsigned size)
+{
+    switch (size) {
+    case 1:
+        tusb_async_writeb(opaque, addr, value);
+        break;
+    case 2:
+        tusb_async_writeh(opaque, addr, value);
+        break;
+    case 4:
+        tusb_async_writew(opaque, addr, value);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static const MemoryRegionOps tusb_async_ops = {
-    .old_mmio = {
-        .read = { tusb_async_readb, tusb_async_readh, tusb_async_readw, },
-        .write =  { tusb_async_writeb, tusb_async_writeh, tusb_async_writew, },
-    },
+    .read = tusb_async_readfn,
+    .write = tusb_async_writefn,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.17.0

