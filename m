Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4161300wru;
        Tue, 14 Aug 2018 07:45:56 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyEuF6OYcVBykKqqj0pKIH9tR1KRxA8UAMNU+uyY48WLE8CAKazyrBImzas58t6hgrmyWI+
X-Received: by 2002:a0c:d60f:: with SMTP id c15-v6mr19350521qvj.70.1534257956444;
        Tue, 14 Aug 2018 07:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534257956; cv=none;
        d=google.com; s=arc-20160816;
        b=IqKxLogRPtKSN9b3iSunGHajJt/a3rWtks6yBscRCygYISmwsgxmZqH3FTe/vOmBQe
         WPLKEZrV2VTKAFYbBA3Arr6cZnWIUWfbxf8nEm2m5cUzH5Nhg7shh28cST+CVPjgQtly
         yw6SczUucCWUD9A72q0v/9cYugpg+gCXBlc2nPZIc//3HMMBWHUIZWD6BaYfwLgv5Ulq
         Xl1JCs7RgzK+Tfyz/TT7Yeenx9iEKbnA+NGvKmBKFcqLOnPpY9vTZhcgQfS1jo4GHVJG
         u6FvbUauli6Wec7YqQOb61oHjrVME2zivg60eQeZGaiS59qJjsV3b9jUEV1qZz8Fpcm2
         FoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=p0+JDqE/skbH6YQowtGNmT5gVp2iAdH2Eo04kLaRL5w=;
        b=ItbShqw0ogjQaptWXSHXyCYFnAmuknlj5vlDg4xJwU1mdNKDxKyakEgqpkLMzJU9bO
         G/6qceqpk1ruKp8YJyIRVqKZoy9tVv89AqysRU0+44g6l+fU7eKwDyt8qmwtqtsLWITC
         O3nTFVHZMYub/6zgj2jG9Gu8c6B+jl1QG7X6Nam7KMIo9ABETbrPAn581pVAluVH/cT6
         RGMu9CNvZSDT3il6vzJ485Jw0OxGfXylrkmJ3KhuLVozPdCkkxa8A5N+CLJ/7vAUTIsC
         ebxOukKE4SeGG5Vu4OPW+8JUv2DrQqrwSo2Y4izpVx1RVUw543BxfzYOuhG/LekjAbOM
         jEGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a80-v6si5943444qkj.57.2018.08.14.07.45.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:45:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaa3-0008AY-Tw
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:45:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYz-0005zl-U1
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYy-0004Dj-Ty
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:49 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44392)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpaYy-0004Bm-MG; Tue, 14 Aug 2018 10:44:48 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpaYw-00072F-GQ; Tue, 14 Aug 2018 15:44:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 15:44:36 +0100
Message-Id: <20180814144436.679-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814144436.679-1-peter.maydell@linaro.org>
References: <20180814144436.679-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 8/8] hw/display/bcm2835_fb: Validate
 bcm2835_fb_mbox_push() config
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
X-TUID: w//4UKAkCezs

Refactor bcm2835_fb_mbox_push() to work by calling
bcm2835_fb_validate_config() and bcm2835_fb_reconfigure(),
so that config set this way is also validated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/bcm2835_fb.c | 63 ++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 3edb8b5cfcb..d534d00a65f 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -248,38 +248,6 @@ void bcm2835_fb_validate_config(BCM2835FBConfig *config)
     }
 }
 
-static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
-{
-    uint32_t pitch;
-    uint32_t size;
-
-    value &= ~0xf;
-
-    s->lock = true;
-
-    s->config.xres = ldl_le_phys(&s->dma_as, value);
-    s->config.yres = ldl_le_phys(&s->dma_as, value + 4);
-    s->config.xres_virtual = ldl_le_phys(&s->dma_as, value + 8);
-    s->config.yres_virtual = ldl_le_phys(&s->dma_as, value + 12);
-    s->config.bpp = ldl_le_phys(&s->dma_as, value + 20);
-    s->config.xoffset = ldl_le_phys(&s->dma_as, value + 24);
-    s->config.yoffset = ldl_le_phys(&s->dma_as, value + 28);
-
-    s->config.base = s->vcram_base | (value & 0xc0000000);
-    s->config.base += BCM2835_FB_OFFSET;
-
-    pitch = bcm2835_fb_get_pitch(&s->config);
-    size = bcm2835_fb_get_size(&s->config);
-
-    stl_le_phys(&s->dma_as, value + 16, pitch);
-    stl_le_phys(&s->dma_as, value + 32, s->config.base);
-    stl_le_phys(&s->dma_as, value + 36, size);
-
-    s->invalidate = true;
-    qemu_console_resize(s->con, s->config.xres, s->config.yres);
-    s->lock = false;
-}
-
 void bcm2835_fb_reconfigure(BCM2835FBState *s, BCM2835FBConfig *newconfig)
 {
     s->lock = true;
@@ -291,6 +259,37 @@ void bcm2835_fb_reconfigure(BCM2835FBState *s, BCM2835FBConfig *newconfig)
     s->lock = false;
 }
 
+static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
+{
+    uint32_t pitch;
+    uint32_t size;
+    BCM2835FBConfig newconf;
+
+    value &= ~0xf;
+
+    newconf.xres = ldl_le_phys(&s->dma_as, value);
+    newconf.yres = ldl_le_phys(&s->dma_as, value + 4);
+    newconf.xres_virtual = ldl_le_phys(&s->dma_as, value + 8);
+    newconf.yres_virtual = ldl_le_phys(&s->dma_as, value + 12);
+    newconf.bpp = ldl_le_phys(&s->dma_as, value + 20);
+    newconf.xoffset = ldl_le_phys(&s->dma_as, value + 24);
+    newconf.yoffset = ldl_le_phys(&s->dma_as, value + 28);
+
+    newconf.base = s->vcram_base | (value & 0xc0000000);
+    newconf.base += BCM2835_FB_OFFSET;
+
+    bcm2835_fb_validate_config(&newconf);
+
+    pitch = bcm2835_fb_get_pitch(&newconf);
+    size = bcm2835_fb_get_size(&newconf);
+
+    stl_le_phys(&s->dma_as, value + 16, pitch);
+    stl_le_phys(&s->dma_as, value + 32, newconf.base);
+    stl_le_phys(&s->dma_as, value + 36, size);
+
+    bcm2835_fb_reconfigure(s, &newconf);
+}
+
 static uint64_t bcm2835_fb_read(void *opaque, hwaddr offset, unsigned size)
 {
     BCM2835FBState *s = opaque;
-- 
2.18.0

