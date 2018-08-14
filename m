Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4160240wru;
        Tue, 14 Aug 2018 07:45:02 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx0dGny4gfqiVHQ14OMZBfHAtYY4tDlvmBt0fhI8LmW7NRI4vx7/CHM9eFOka4ev+XFDZhn
X-Received: by 2002:a37:1224:: with SMTP id c36-v6mr20364052qkh.26.1534257902129;
        Tue, 14 Aug 2018 07:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534257902; cv=none;
        d=google.com; s=arc-20160816;
        b=lqKl/6seBzZXiw/zKSLKvas04BFqAF2epw641v3tn/WLPbr/75bBNHdp/dc7oU0Yjt
         VxnXypYI9KjlLllDy/+wruHtOxaF1HbKiKWTo5N2nyauxWiI+6EmLNNlK1sLBY1CrHU4
         NgN5+j5Ojn3BY/7uUOBt9KiVtFc+XrUPVDdFUriyqn6gNkU3Aq1a7H0baILQIzZToXwJ
         lHFRXfdUSMQoICSbAJSRU17aZlzXMPYUF+qumNaU38irLgNgpkBkCNZ6x2fEFso7Tat8
         PGZtD3gEmzxF4zP9aUr705UTG4pcxlpagjmkJG4LHT/GRjUI5ker+dqBUgGhQlxUd9yP
         9vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ciU2Co1/BZetVVurj7ZzAh2mRZuWYKajyImfIxqeNZo=;
        b=dBFSS3tSjS6t9ZFtMHC3BEqCVNZR3UsSLWI+PAvSqosQiGK+jsgpCz4rcACLE7IGJl
         ZCHC9VWg8fVmbRyk4bp7YbqQH2PIvK59Ssi/Sbw1lLkgNwDZeqiucSLqtFHlpWwJyLXd
         6EsAevCXCD9snJVYaEyNGCCEFPkdpFEy4vutsqx4LTaahD1KJr9yYHJFiDMNApPDuo7s
         Dxm6VlkOPgM+15XNY9rZht9ppFd3s7LDwfswJolqNYWr8pmtZSUO/u2W51J9HdrNcAhf
         Put1LF38gZKBOyM/iydsebM7Ip2B7Bb+sV8yQAM8w918VKzhn2D1G1m2DzUi5yLiqYjH
         potw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b29-v6si4188302qkj.363.2018.08.14.07.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:45:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaZB-0005xq-Jx
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:45:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYv-0005uu-I2
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYu-0004Ad-Jw
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:45 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44374)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpaYu-00046w-AJ; Tue, 14 Aug 2018 10:44:44 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpaYs-000703-GA; Tue, 14 Aug 2018 15:44:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 15:44:32 +0100
Message-Id: <20180814144436.679-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814144436.679-1-peter.maydell@linaro.org>
References: <20180814144436.679-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/8] hw/display/bcm2835_fb: Reset resolution,
 etc correctly
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
X-TUID: A58OiEMIpLmh

The bcm2835_fb's initial resolution and other parameters are set
via QOM properties. We should reset to those initial values on
device reset, which means we need to save the QOM property
values somewhere that they are not overwritten by guest
changes to the framebuffer configuration.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/display/bcm2835_fb.h |  1 +
 hw/display/bcm2835_fb.c         | 27 +++++++++++++++------------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
index 69cbf2d1fd9..374de546121 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -47,6 +47,7 @@ typedef struct {
     bool lock, invalidate, pending;
 
     BCM2835FBConfig config;
+    BCM2835FBConfig initial_config;
 } BCM2835FBState;
 
 void bcm2835_fb_reconfigure(BCM2835FBState *s, BCM2835FBConfig *newconfig);
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 9faabf0d0b4..d95686c74c8 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -329,11 +329,7 @@ static void bcm2835_fb_reset(DeviceState *dev)
 
     s->pending = false;
 
-    s->config.xres_virtual = s->config.xres;
-    s->config.yres_virtual = s->config.yres;
-    s->config.xoffset = 0;
-    s->config.yoffset = 0;
-    s->config.base = s->vcram_base + BCM2835_FB_OFFSET;
+    s->config = s->initial_config;
 
     s->invalidate = true;
     s->lock = false;
@@ -357,6 +353,13 @@ static void bcm2835_fb_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* Fill in the parts of initial_config that are not set by QOM properties */
+    s->initial_config.xres_virtual = s->initial_config.xres;
+    s->initial_config.yres_virtual = s->initial_config.yres;
+    s->initial_config.xoffset = 0;
+    s->initial_config.yoffset = 0;
+    s->initial_config.base = s->vcram_base + BCM2835_FB_OFFSET;
+
     s->dma_mr = MEMORY_REGION(obj);
     address_space_init(&s->dma_as, s->dma_mr, NULL);
 
@@ -370,13 +373,13 @@ static Property bcm2835_fb_props[] = {
     DEFINE_PROP_UINT32("vcram-base", BCM2835FBState, vcram_base, 0),/*required*/
     DEFINE_PROP_UINT32("vcram-size", BCM2835FBState, vcram_size,
                        DEFAULT_VCRAM_SIZE),
-    DEFINE_PROP_UINT32("xres", BCM2835FBState, config.xres, 640),
-    DEFINE_PROP_UINT32("yres", BCM2835FBState, config.yres, 480),
-    DEFINE_PROP_UINT32("bpp", BCM2835FBState, config.bpp, 16),
-    DEFINE_PROP_UINT32("pixo",
-                       BCM2835FBState, config.pixo, 1), /* 1=RGB, 0=BGR */
-    DEFINE_PROP_UINT32("alpha",
-                       BCM2835FBState, config.alpha, 2), /* alpha ignored */
+    DEFINE_PROP_UINT32("xres", BCM2835FBState, initial_config.xres, 640),
+    DEFINE_PROP_UINT32("yres", BCM2835FBState, initial_config.yres, 480),
+    DEFINE_PROP_UINT32("bpp", BCM2835FBState, initial_config.bpp, 16),
+    DEFINE_PROP_UINT32("pixo", BCM2835FBState,
+                       initial_config.pixo, 1), /* 1=RGB, 0=BGR */
+    DEFINE_PROP_UINT32("alpha", BCM2835FBState,
+                       initial_config.alpha, 2), /* alpha ignored */
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.18.0

