Received: by 10.28.4.212 with SMTP id 203csp4894727wme;
        Tue, 8 May 2018 20:47:37 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpriVrKs8CrpcXvqCeXTB4AQ1Pj9fjDRDChq5SliLhJUNXpRVhkd317vlF0N+S49m6qCctn
X-Received: by 10.233.214.29 with SMTP id r29mr35475616qkk.109.1525837657228;
        Tue, 08 May 2018 20:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525837657; cv=none;
        d=google.com; s=arc-20160816;
        b=l3MkRI6REqK2ZHGDWH0sPhm6se2aWRgPsi75bXFRx4xk4YLZB29YXmMF5zT6s7W7Yp
         bzctv+ExNivfvWafp0x7DXa3WSjcADLYXNscGZqAM1zZYfs2F7SLEqcqL9fim8Ek1zwa
         GbIKneAmnSBp1NDwDXbKsrirbg4OyICWRZo86AE1tgEgMEnlS1+vi6Y+PNBAklMu/cJz
         MxTBFcRcDmIsZhDqID598f/SIgcr6xzYE5TmnAOUNLH2M5nXSMb5zV2GnWGUw1sLRznE
         1B5WiJKTLtOWYZlFZy390xV/pQYjEauR39ZrQdk0D/yu6IAtAUDGzQGT/5CPO6HI/+AA
         +gww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=0K8P6/Wt4w4nkhyYxnOWUyEc0T+chC9SWQ0QEmY8s8w=;
        b=kKCOyaA6UJ377Cs666CdKa1jwxgywXO3q++2ciX31iuV/1UHJVpGpRuA6WdHbF9zT+
         PR+VSanphfr+W/c8IL4dujHgOfUICZKnAq31UujwViIpap7NTiEnu7hCmer78GYOZPTV
         oGTtN8I7RnFJp7WHttrfw100dPj4WB0C1xjAkGzCl0mcmsg4AjGdvKv4Gpy28r8ow4px
         r5euNSBvQTlBZ/BKZ4ER67oqxv9T6AohQddIEBbBPieJ8L8RlXQWjehUpO8MRb0sUV5V
         APg5Ik+3Qy9HQ6jHhpqoisAX+jbtz1bpds/K4RcJOOAkI0lTuiIYujTM+iiX1HTlTUIr
         oCkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k55+H9eA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a11-v6si25585522qtc.235.2018.05.08.20.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 20:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k55+H9eA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGG4m-0004OM-HB
	for alex.bennee@linaro.org; Tue, 08 May 2018 23:47:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGG4R-0004Mn-3H
	for qemu-arm@nongnu.org; Tue, 08 May 2018 23:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGG4P-0002OP-Qz
	for qemu-arm@nongnu.org; Tue, 08 May 2018 23:47:15 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:39641)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGG4M-0002GD-Gq; Tue, 08 May 2018 23:47:10 -0400
Received: by mail-qk0-x242.google.com with SMTP id z75so26495290qkb.6;
	Tue, 08 May 2018 20:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0K8P6/Wt4w4nkhyYxnOWUyEc0T+chC9SWQ0QEmY8s8w=;
	b=k55+H9eAdrxXHpf4H7IY6z3kQAz88fNvtw/XtoBmbtXunPZOQaZCZaX74hOLwkM7Ng
	bDQ5HvAZ06y+Cgfatyu/lTi4Z0UZrbwDBO/7u/DT1fdrBm/UVLFbMPsO0D3k+xWBrdbR
	d6pw+y1FUcIFCiBA5EFQEiSiGGJ82XWgsThyNpu4Qb0fVT5Q9Nmd13wupr/ibd/bOkaL
	ZCA3YZ3KZOKNyXFRTXLBLlLWxDrbAfXlyi2wNKHY8XSRcFnr5Im8VOWWUMyyPYSJCAug
	Mxj7cBB1jYrQUzc5dXNDsz2pw1UmtIj5wE9IA/LQGTWWz0BxAt0XXjNjp/yFeQENPv4Q
	GlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0K8P6/Wt4w4nkhyYxnOWUyEc0T+chC9SWQ0QEmY8s8w=;
	b=Gt5YI/9LHwWao6Q6A7n4hoG8X2QdzzhhngsBSpQdu1dV3WbsrWIKk4mpe4r+jR6Vqc
	ITR9lS58sW4aHqCl5Z7OYGK5fYz3etTWXaY98OjL5YSy/ihZrokFxaQtlszEA+KGo7nW
	dTbNZo8OuBtY1J5uR0eo3vxBpGisDANDWWjve+sR3Xn+ZOifdduQxMW+t4vSLDgY+vHv
	f48Qz8kqjAlMy/R+hz5cmtR3hOc2H1jDJwVrRsAzaQnuTQXJQXIajxXsXkzEiwFs+kqd
	+aXK6ezwccFTnRntKhnKn+MxAOzJGyeQ/No42K/5ltLUilUU/eCyrtOvxGblyM7FoI1O
	6LVg==
X-Gm-Message-State: ALQs6tC5ztM6g9WTHJ2TEbWve+7QvVWGprPK1G+LDOvHkuQyY7oCFluP
	5BIndi6QFpBbtpoTngbwpCgYAPby
X-Received: by 10.233.244.13 with SMTP id y13mr36313259qkl.53.1525837629562;
	Tue, 08 May 2018 20:47:09 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w12-v6sm14497002qtb.80.2018.05.08.20.47.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 May 2018 20:47:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Date: Wed,  9 May 2018 00:46:45 -0300
Message-Id: <20180509034658.26455-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509034658.26455-1-f4bug@amsat.org>
References: <20180509034658.26455-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH v2 01/14] sdcard: Use the ldst API
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
Cc: Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Michael Walle <michael@walle.cc>,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gHSL8LpsHB/c

The load/store API will ease further code movement.

Per the Physical Layer Simplified Spec. "3.6 Bus Protocol":

  "In the CMD line the Most Significant Bit (MSB) is transmitted
   first, the Least Significant Bit (LSB) is the last."

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/bcm2835_sdhost.c    | 13 +++++--------
 hw/sd/milkymist-memcard.c |  3 +--
 hw/sd/omap_mmc.c          |  6 ++----
 hw/sd/pl181.c             | 11 ++++-------
 hw/sd/sdhci.c             | 15 +++++----------
 hw/sd/ssi-sd.c            |  6 ++----
 6 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index ebf3b926c2..4df4de7d67 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -118,8 +118,6 @@ static void bcm2835_sdhost_send_command(BCM2835SDHostState *s)
         goto error;
     }
     if (!(s->cmd & SDCMD_NO_RESPONSE)) {
-#define RWORD(n) (((uint32_t)rsp[n] << 24) | (rsp[n + 1] << 16) \
-                  | (rsp[n + 2] << 8) | rsp[n + 3])
         if (rlen == 0 || (rlen == 4 && (s->cmd & SDCMD_LONG_RESPONSE))) {
             goto error;
         }
@@ -127,15 +125,14 @@ static void bcm2835_sdhost_send_command(BCM2835SDHostState *s)
             goto error;
         }
         if (rlen == 4) {
-            s->rsp[0] = RWORD(0);
+            s->rsp[0] = ldl_be_p(&rsp[0]);
             s->rsp[1] = s->rsp[2] = s->rsp[3] = 0;
         } else {
-            s->rsp[0] = RWORD(12);
-            s->rsp[1] = RWORD(8);
-            s->rsp[2] = RWORD(4);
-            s->rsp[3] = RWORD(0);
+            s->rsp[0] = ldl_be_p(&rsp[12]);
+            s->rsp[1] = ldl_be_p(&rsp[8]);
+            s->rsp[2] = ldl_be_p(&rsp[4]);
+            s->rsp[3] = ldl_be_p(&rsp[0]);
         }
-#undef RWORD
     }
     /* We never really delay commands, so if this was a 'busywait' command
      * then we've completed it now and can raise the interrupt.
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 5570c1e9a0..ff2b92dc64 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -100,8 +100,7 @@ static void memcard_sd_command(MilkymistMemcardState *s)
     SDRequest req;
 
     req.cmd = s->command[0] & 0x3f;
-    req.arg = (s->command[1] << 24) | (s->command[2] << 16)
-              | (s->command[3] << 8) | s->command[4];
+    req.arg = ldl_be_p(s->command + 1);
     req.crc = s->command[5];
 
     s->response[0] = req.cmd;
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 5b47cadf11..51c6c124b2 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -162,8 +162,7 @@ static void omap_mmc_command(struct omap_mmc_s *host, int cmd, int dir,
                 CID_CSD_OVERWRITE;
         if (host->sdio & (1 << 13))
             mask |= AKE_SEQ_ERROR;
-        rspstatus = (response[0] << 24) | (response[1] << 16) |
-                (response[2] << 8) | (response[3] << 0);
+        rspstatus = ldl_be_p(response);
         break;
 
     case sd_r2:
@@ -181,8 +180,7 @@ static void omap_mmc_command(struct omap_mmc_s *host, int cmd, int dir,
         }
         rsplen = 4;
 
-        rspstatus = (response[0] << 24) | (response[1] << 16) |
-                (response[2] << 8) | (response[3] << 0);
+        rspstatus = ldl_be_p(response);
         if (rspstatus & 0x80000000)
             host->status &= 0xe000;
         else
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 3ba1f7dd23..c9b1a6cb23 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -183,23 +183,20 @@ static void pl181_send_command(PL181State *s)
     if (rlen < 0)
         goto error;
     if (s->cmd & PL181_CMD_RESPONSE) {
-#define RWORD(n) (((uint32_t)response[n] << 24) | (response[n + 1] << 16) \
-                  | (response[n + 2] << 8) | response[n + 3])
         if (rlen == 0 || (rlen == 4 && (s->cmd & PL181_CMD_LONGRESP)))
             goto error;
         if (rlen != 4 && rlen != 16)
             goto error;
-        s->response[0] = RWORD(0);
+        s->response[0] = ldl_be_p(&response[0]);
         if (rlen == 4) {
             s->response[1] = s->response[2] = s->response[3] = 0;
         } else {
-            s->response[1] = RWORD(4);
-            s->response[2] = RWORD(8);
-            s->response[3] = RWORD(12) & ~1;
+            s->response[1] = ldl_be_p(&response[4]);
+            s->response[2] = ldl_be_p(&response[8]);
+            s->response[3] = ldl_be_p(&response[12]) & ~1;
         }
         DPRINTF("Response received\n");
         s->status |= PL181_STATUS_CMDRESPEND;
-#undef RWORD
     } else {
         DPRINTF("Command sent\n");
         s->status |= PL181_STATUS_CMDSENT;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 63c44a4ee8..f6fe93f033 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -344,17 +344,13 @@ static void sdhci_send_command(SDHCIState *s)
 
     if (s->cmdreg & SDHC_CMD_RESPONSE) {
         if (rlen == 4) {
-            s->rspreg[0] = (response[0] << 24) | (response[1] << 16) |
-                           (response[2] << 8)  |  response[3];
+            s->rspreg[0] = ldl_be_p(response);
             s->rspreg[1] = s->rspreg[2] = s->rspreg[3] = 0;
             trace_sdhci_response4(s->rspreg[0]);
         } else if (rlen == 16) {
-            s->rspreg[0] = (response[11] << 24) | (response[12] << 16) |
-                           (response[13] << 8) |  response[14];
-            s->rspreg[1] = (response[7] << 24) | (response[8] << 16) |
-                           (response[9] << 8)  |  response[10];
-            s->rspreg[2] = (response[3] << 24) | (response[4] << 16) |
-                           (response[5] << 8)  |  response[6];
+            s->rspreg[0] = ldl_be_p(&response[11]);
+            s->rspreg[1] = ldl_be_p(&response[7]);
+            s->rspreg[2] = ldl_be_p(&response[3]);
             s->rspreg[3] = (response[0] << 16) | (response[1] << 8) |
                             response[2];
             trace_sdhci_response16(s->rspreg[3], s->rspreg[2],
@@ -398,8 +394,7 @@ static void sdhci_end_transfer(SDHCIState *s)
         trace_sdhci_end_transfer(request.cmd, request.arg);
         sdbus_do_command(&s->sdbus, &request, response);
         /* Auto CMD12 response goes to the upper Response register */
-        s->rspreg[3] = (response[0] << 24) | (response[1] << 16) |
-                (response[2] << 8) | response[3];
+        s->rspreg[3] = ldl_be_p(response);
     }
 
     s->prnsts &= ~(SDHC_DOING_READ | SDHC_DOING_WRITE |
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index ae04b6641b..dbcff4013d 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -97,8 +97,7 @@ static uint32_t ssi_sd_transfer(SSISlave *dev, uint32_t val)
             uint8_t longresp[16];
             /* FIXME: Check CRC.  */
             request.cmd = s->cmd;
-            request.arg = (s->cmdarg[0] << 24) | (s->cmdarg[1] << 16)
-                           | (s->cmdarg[2] << 8) | s->cmdarg[3];
+            request.arg = ldl_be_p(s->cmdarg);
             DPRINTF("CMD%d arg 0x%08x\n", s->cmd, request.arg);
             s->arglen = sdbus_do_command(&s->sdbus, &request, longresp);
             if (s->arglen <= 0) {
@@ -123,8 +122,7 @@ static uint32_t ssi_sd_transfer(SSISlave *dev, uint32_t val)
                 /* CMD13 returns a 2-byte statuse work. Other commands
                    only return the first byte.  */
                 s->arglen = (s->cmd == 13) ? 2 : 1;
-                cardstatus = (longresp[0] << 24) | (longresp[1] << 16)
-                             | (longresp[2] << 8) | longresp[3];
+                cardstatus = ldl_be_p(longresp);
                 status = 0;
                 if (((cardstatus >> 9) & 0xf) < 4)
                     status |= SSI_SDR_IDLE;
-- 
2.17.0

