Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4160162wru;
        Tue, 14 Aug 2018 07:44:57 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwBIDDCC87Bzw7J/2MV9PevzzOrHueZAMCnZ0/hpVaQECMtKm6e7aTWUULPr+6j1bBZFE7o
X-Received: by 2002:a0c:9843:: with SMTP id e3-v6mr19416990qvd.44.1534257897727;
        Tue, 14 Aug 2018 07:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534257897; cv=none;
        d=google.com; s=arc-20160816;
        b=JviVQp+2G0alvGdreaj6+eCEcEKmxzaROa/UkpHQ+0t01gR9Rnb4i8JcK3+td3io1x
         GH6jdBpdh+qRcM8iZMWU1wy4E0R/I3pDtWB8pqWEMmIUDBKzrlpCOp7a8qw7cPdgT3wP
         TfUP9v1CGqq+U3UcYBmP1w2vlg6CwUA6EWizIMdHllqO3IQReLor6O8eywMUo9C0UHy4
         9dqfXwRTofTKHkf3mt31m+SA2DXByRtK2gcXmniZvi4W9GMmOH8o9DRj0PvQiemFkp9k
         YKujMdEhWkKi6LiU9l5GNFwmGxpZlLwC/f94myyPGwXGPnV5eDRjEGAq62wNvK42GRNZ
         Rjpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=/TTtw87KR6Pwotwq7I+AirjS//9tpwmtyESSaJWIKxk=;
        b=geektEd6taXqM+34SEnGjU71ewYJCLvdJSC6xJsRk7ATYhVGf6dO3SJC15vTMYhRmq
         zPPQMsaZYyrr+QTNyCdIyIob1aL63FMvhkp8E8yZQuormlTbjx1mblwxe7VMdFdoUhlS
         TrTs6cGr++Vc6JjKFmVomvasBpdxMDacAGk2g3Cpu1lcV53fedlJMeOZvESzXezta7n9
         MTObCHYSUbWdX4GN3QccJxSvg+A8KjNwKnmvQA7x0ProYLYcR93k6Eh+10eA8CoCLCZ+
         A22l7YIKty6qPINB2DGOBX9F3lg/ulhQDtNE7oSPbeOu1CPnJKuAiBRSnDHLI9mqNLTZ
         e8ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w3-v6si7259316qth.350.2018.08.14.07.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaZ7-0005vc-7y
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:44:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYt-0005uU-Q4
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYs-00049i-RF
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44380)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpaYs-00049E-J7; Tue, 14 Aug 2018 10:44:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpaYr-0006zl-FQ; Tue, 14 Aug 2018 15:44:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 15:44:31 +0100
Message-Id: <20180814144436.679-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814144436.679-1-peter.maydell@linaro.org>
References: <20180814144436.679-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/8] hw/display/bcm2835_fb: Drop unused size and
 pitch fields
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
X-TUID: DO+D5SG1thgo

The BCM2835FBState struct has a 'pitch' field which is a
cached copy of xres * (bpp >> 3), and a 'size' field which is
a cached copy of pitch * yres. However we don't actually do
anything with these fields; delete them. We retain the
now-unused slots in the VMState struct for migration
compatibility.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/display/bcm2835_fb.h |  4 ----
 hw/display/bcm2835_fb.c         | 19 ++++++++-----------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
index b965698d28a..69cbf2d1fd9 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -47,10 +47,6 @@ typedef struct {
     bool lock, invalidate, pending;
 
     BCM2835FBConfig config;
-
-    /* These are just cached values calculated from the config settings */
-    uint32_t size;
-    uint32_t pitch;
 } BCM2835FBState;
 
 void bcm2835_fb_reconfigure(BCM2835FBState *s, BCM2835FBConfig *newconfig);
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 8155de5d0b1..9faabf0d0b4 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -184,6 +184,9 @@ static void fb_update_display(void *opaque)
 
 static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
 {
+    uint32_t pitch;
+    uint32_t size;
+
     value &= ~0xf;
 
     s->lock = true;
@@ -201,12 +204,12 @@ static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
 
     /* TODO - Manage properly virtual resolution */
 
-    s->pitch = s->config.xres * (s->config.bpp >> 3);
-    s->size = s->config.yres * s->pitch;
+    pitch = s->config.xres * (s->config.bpp >> 3);
+    size = s->config.yres * pitch;
 
-    stl_le_phys(&s->dma_as, value + 16, s->pitch);
+    stl_le_phys(&s->dma_as, value + 16, pitch);
     stl_le_phys(&s->dma_as, value + 32, s->config.base);
-    stl_le_phys(&s->dma_as, value + 36, s->size);
+    stl_le_phys(&s->dma_as, value + 36, size);
 
     s->invalidate = true;
     qemu_console_resize(s->con, s->config.xres, s->config.yres);
@@ -223,9 +226,6 @@ void bcm2835_fb_reconfigure(BCM2835FBState *s, BCM2835FBConfig *newconfig)
 
     /* TODO - Manage properly virtual resolution */
 
-    s->pitch = s->config.xres * (s->config.bpp >> 3);
-    s->size = s->config.yres * s->pitch;
-
     s->invalidate = true;
     qemu_console_resize(s->con, s->config.xres, s->config.yres);
     s->lock = false;
@@ -301,8 +301,7 @@ static const VMStateDescription vmstate_bcm2835_fb = {
         VMSTATE_UINT32(config.yoffset, BCM2835FBState),
         VMSTATE_UINT32(config.bpp, BCM2835FBState),
         VMSTATE_UINT32(config.base, BCM2835FBState),
-        VMSTATE_UINT32(pitch, BCM2835FBState),
-        VMSTATE_UINT32(size, BCM2835FBState),
+        VMSTATE_UNUSED(8), /* Was pitch and size */
         VMSTATE_UINT32(config.pixo, BCM2835FBState),
         VMSTATE_UINT32(config.alpha, BCM2835FBState),
         VMSTATE_END_OF_LIST()
@@ -335,8 +334,6 @@ static void bcm2835_fb_reset(DeviceState *dev)
     s->config.xoffset = 0;
     s->config.yoffset = 0;
     s->config.base = s->vcram_base + BCM2835_FB_OFFSET;
-    s->pitch = s->config.xres * (s->config.bpp >> 3);
-    s->size = s->config.yres * s->pitch;
 
     s->invalidate = true;
     s->lock = false;
-- 
2.18.0

