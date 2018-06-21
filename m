Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2304461wrq;
        Thu, 21 Jun 2018 11:03:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKcOHy+mmmxNaTA+Q0vH7H+9GMh3SBetU5/er5istkJlQ3FB9xa5bqdzMIUxeswLJMflljG
X-Received: by 2002:a37:db09:: with SMTP id e9-v6mr22372229qki.63.1529604213853;
        Thu, 21 Jun 2018 11:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529604213; cv=none;
        d=google.com; s=arc-20160816;
        b=iU/kxewW8dQ29j62EpjSGMW1mWU0Pz8LKYVEMMz3OYz6t9lniupmTPWm6FpVCxoZz1
         LGtMhb0DAgkkvebj3laHfGHmrrUqCmlMJ/AxUSkB4DGS9F+KkENpT5r2q2MFcvYA7jST
         ip02OioKrFR1AfL4sINYg9QFl2R/ZpdFqS7Lx7BERwNIxBQQMs9d/xMXu0Y+RYx9CVbD
         6Y7Jj3dOnZRvRBTkJ16LJpbQ9QTxP73FgVONjcsQdEbf/HmOCuDG+dSlWTN+TjFVmmOi
         8EdtVKpI7mUdzIbURLmNzifHpqe9ANIZ3Wa0uR2BiGg0hYdL8zq4cbKm7V4qVjR/cFQg
         1GUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=8Yx2i1Od8rnw3oJmsQll+N/JHRoObWEqXtlopD+7TZo=;
        b=FNFJhoSWn2FDX55461wiUtf41CFgs3dr5/jchPyBwQl+hXXuriNBifG4fnNDnwFzns
         IQqAcyhoOw7X00GaSNbEAu+L2pYiNEwrFHOHkAf6ttdyBWP/oKxtn9NpeaBSceCmlymy
         lE/x9fZ9ZfIHmahLGFR3aSGkpzGoKCfOKVauyvpNBUCX+/BSFg83PTEAdH8CwbVK2R3Q
         zsfOlyx8WP0RTa3fa6pE/MdfNwxyG+Jrwxci7h8oJAOiNBbWERj0MiuVMpbsr4RBam9W
         dw+E001eTbKVCX85+XH/GzrhA98+768FluNLM6vzlXEiDJMuhdkv5hgiZ+yB1Ivcy7Hx
         E5Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M8k4HBKH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y10-v6si1858897qta.355.2018.06.21.11.03.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 11:03:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M8k4HBKH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW3vh-0000ZP-8o
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 14:03:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3uz-0000VG-8v
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:02:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3uy-0006V1-6k
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:02:49 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:44658)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3uy-0006Uv-0c; Thu, 21 Jun 2018 14:02:48 -0400
Received: by mail-qt0-x242.google.com with SMTP id x5-v6so2950141qte.11;
	Thu, 21 Jun 2018 11:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8Yx2i1Od8rnw3oJmsQll+N/JHRoObWEqXtlopD+7TZo=;
	b=M8k4HBKHMfOFSgau+ruxJZlIjBgch2o4OLFe0WDuuqZj2SBsKz3AVa7eztAoB81Wbi
	7likgHeO0zDjUO+ZOmHYMT0LijbkxuWQq4qQqI3H+OOLHkrFVT0z7VZGUXw4gxVTldnL
	iJB6n+XjYfUTe/9iKWRtfoP5lprwtC+I240BnPGhyJ0hc6L4TJYS6Z/kCwegdL7HE1P+
	JE07sgmprrQjFFwaqeoDTUsBsqJ+y8X5hj8V/di/JQShK1w2JQMySYMKTJFKDMlsVm5n
	DoRRjjVUqGtW5hkPChztd5nyHheyhDo8gdQFMb+pjXjTq5Hd4Ira1J9VLp3FBOab4KpX
	6KQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8Yx2i1Od8rnw3oJmsQll+N/JHRoObWEqXtlopD+7TZo=;
	b=GJK3/oFPP5Svelya0EXk6j0PjV8Jvgl/UNOmSjXbEIBEy/dJBwaGmm5w9QwFsYqrfO
	qBogxVJ+ed8r5fl6ehB1rIRMPi8NgtnteeLGlZ1mi+NwZhXB6rHHsQbTzTt7nJ1gzLeD
	GFzR90KXvlYtrs0wTPs9kKnWUpGz+I8hIuhLYVL9Kgq3LvgouBP8FNxK7hHjUsfIrTx6
	Dw8Am/exSCQ5Fmw94RSJNgzk3jAsIaBDzno/mFzBJA29cblGHbazf9BN3KPfOycjmsrB
	4uvpY5HQ1W09rIXVL2SjXrIIoDlH53g1WeV+oZDIJLrAR1Rl5wsCexzstnP2HbVvBUHr
	suuQ==
X-Gm-Message-State: APt69E2nUC8esCT1MFUA2DFcpyRxn/SqOoBKIUNPMNYBULDyvKlhtvRm
	rNGXvsE8Y77oitaT+y0npOndguBv
X-Received: by 2002:a0c:9123:: with SMTP id
	q32-v6mr23499814qvq.136.1529604167468; 
	Thu, 21 Jun 2018 11:02:47 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jun 2018 15:02:17 -0300
Message-Id: <20180621180224.8312-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH 04/11] hw/dma/omap_dma: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xPu3TgeAw26S

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/dma/omap_dma.c | 66 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index ab3a1b0451..a4a786f546 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -879,15 +879,18 @@ static int omap_dma_ch_reg_write(struct omap_dma_s *s,
         ch->burst[0] = (value & 0x0180) >> 7;
         ch->pack[0] = (value & 0x0040) >> 6;
         ch->port[0] = (enum omap_dma_port) ((value & 0x003c) >> 2);
-        if (ch->port[0] >= __omap_dma_port_last)
-            printf("%s: invalid DMA port %i\n", __func__,
-                            ch->port[0]);
-        if (ch->port[1] >= __omap_dma_port_last)
-            printf("%s: invalid DMA port %i\n", __func__,
-                            ch->port[1]);
+        if (ch->port[0] >= __omap_dma_port_last) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid DMA port %i\n",
+                          __func__, ch->port[0]);
+        }
+        if (ch->port[1] >= __omap_dma_port_last) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid DMA port %i\n",
+                          __func__, ch->port[1]);
+        }
         ch->data_type = 1 << (value & 3);
         if ((value & 3) == 3) {
-            printf("%s: bad data_type for DMA channel\n", __func__);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: bad data_type for DMA channel\n", __func__);
             ch->data_type >>= 1;
         }
         break;
@@ -1899,14 +1902,20 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         if (value & 2)						/* SOFTRESET */
             omap_dma_reset(s->dma);
         s->ocp = value & 0x3321;
-        if (((s->ocp >> 12) & 3) == 3)				/* MIDLEMODE */
-            fprintf(stderr, "%s: invalid DMA power mode\n", __func__);
+        if (((s->ocp >> 12) & 3) == 3) {
+            /* MIDLEMODE */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid DMA power mode\n",
+                          __func__);
+        }
         return;
 
     case 0x78:	/* DMA4_GCR */
         s->gcr = value & 0x00ff00ff;
-	if ((value & 0xff) == 0x00)		/* MAX_CHANNEL_FIFO_DEPTH */
-            fprintf(stderr, "%s: wrong FIFO depth in GCR\n", __func__);
+        if ((value & 0xff) == 0x00) {
+            /* MAX_CHANNEL_FIFO_DEPTH */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: wrong FIFO depth in GCR\n",
+                          __func__);
+        }
         return;
 
     case 0x80 ... 0xfff:
@@ -1935,9 +1944,11 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
     case 0x00:	/* DMA4_CCR */
         ch->buf_disable = (value >> 25) & 1;
         ch->src_sync = (value >> 24) & 1;	/* XXX For CamDMA must be 1 */
-        if (ch->buf_disable && !ch->src_sync)
-            fprintf(stderr, "%s: Buffering disable is not allowed in "
-                            "destination synchronised mode\n", __func__);
+        if (ch->buf_disable && !ch->src_sync) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Buffering disable is not allowed in "
+                          "destination synchronised mode\n", __func__);
+        }
         ch->prefetch = (value >> 23) & 1;
         ch->bs = (value >> 18) & 1;
         ch->transparent_copy = (value >> 17) & 1;
@@ -1947,9 +1958,11 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         ch->suspend = (value & 0x0100) >> 8;
         ch->priority = (value & 0x0040) >> 6;
         ch->fs = (value & 0x0020) >> 5;
-        if (ch->fs && ch->bs && ch->mode[0] && ch->mode[1])
-            fprintf(stderr, "%s: For a packet transfer at least one port "
-                            "must be constant-addressed\n", __func__);
+        if (ch->fs && ch->bs && ch->mode[0] && ch->mode[1]) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: For a packet transfer at least one port "
+                          "must be constant-addressed\n", __func__);
+        }
         ch->sync = (value & 0x001f) | ((value >> 14) & 0x0060);
         /* XXX must be 0x01 for CamDMA */
 
@@ -1978,9 +1991,11 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         ch->endian_lock[0] =(value >> 20) & 1;
         ch->endian[1] =(value >> 19) & 1;
         ch->endian_lock[1] =(value >> 18) & 1;
-        if (ch->endian[0] != ch->endian[1])
-            fprintf(stderr, "%s: DMA endianness conversion enable attempt\n",
-                            __func__);
+        if (ch->endian[0] != ch->endian[1]) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: DMA endianness conversion enable attempt\n",
+                          __func__);
+        }
         ch->write_mode = (value >> 16) & 3;
         ch->burst[1] = (value & 0xc000) >> 14;
         ch->pack[1] = (value & 0x2000) >> 13;
@@ -1988,12 +2003,15 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         ch->burst[0] = (value & 0x0180) >> 7;
         ch->pack[0] = (value & 0x0040) >> 6;
         ch->translate[0] = (value & 0x003c) >> 2;
-        if (ch->translate[0] | ch->translate[1])
-            fprintf(stderr, "%s: bad MReqAddressTranslate sideband signal\n",
-                            __func__);
+        if (ch->translate[0] | ch->translate[1]) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: bad MReqAddressTranslate sideband signal\n",
+                          __func__);
+        }
         ch->data_type = 1 << (value & 3);
         if ((value & 3) == 3) {
-            printf("%s: bad data_type for DMA channel\n", __func__);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: bad data_type for DMA channel\n", __func__);
             ch->data_type >>= 1;
         }
         break;
-- 
2.18.0.rc2

