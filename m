Received: by 10.223.159.74 with SMTP id f10csp6406836wrg;
        Thu, 14 Dec 2017 06:53:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBovIiZelzLjir1Xc3Z2daROBCmggMwxcPVTK3V04N/DhSKlwVJqGPS4OH27etj5H8aKT+fe2
X-Received: by 10.37.133.135 with SMTP id x7mr4363095ybk.476.1513263237866;
        Thu, 14 Dec 2017 06:53:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263237; cv=none;
        d=google.com; s=arc-20160816;
        b=szzBn56vB2CVOCYNI4muR0qFj7BxQKYtKXhGWShKpYdDi5GpP6qMLVYVv6voAJO6NA
         h6B0+lpg+N7Ke50AJkX+H50C0+Ni9qPjBovcZL6AoDwHDp7wYXcHkD+uBGF5EOdDH1n5
         FWQeIqwdmE+aDflzU4F4l2fJ5Qx7mewilbrzH+GIhK41jvjGtVLDgTSvam5F2ZvdR+6M
         luceD/rSfAK7mzwSR8eM09XJ04NzBw/cX35ql36Kwn/90j3mjq3yP78aE2yh/jKIifJJ
         AD1aU/c/22whRiqEfsKdwbzK/azqoR6QXBr2lFelDsaEyRIsOpAu63Q2moZnGitL4l0F
         Upwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=o0B8caNespqWoZFU8fH9V1pRE4+ngVW5SMovMv0JMfk=;
        b=mvfLh0fSrQVFVN1SvlXiKx/PbECcRXdQgJ2RoG22rvNMvFm/jj/SgaZ/vjkw5q3XmR
         AAAikcjps4b1OrFGCcfJMWC9MslWwafm7+AQJ47y4C2u51dsRUHEKjq/eqzGzE8ksvor
         hc+7Vf7ZPsIxixmCIQhJFfvHws1xyrwbDeN+TFXZguaGisXF8bpBNYDvNyaBBOBudBP/
         Z01OG0Uq+AnHIuPdMV/zB18dQ/QY9ftDodrSyrNsKOjDDmpIHmgZDTbA+8cyhw/oQUJV
         Hrzyt1RtjBv8VC5efnfMfcjYFEUQVes+b2ZGcFGNnMi1Kx/ImTtry6iZtWZY11YHwJ/Y
         bAaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i4M+ywCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j189si808493ywc.471.2017.12.14.06.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:53:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i4M+ywCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUtZ-0001eG-7R
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:53:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt4-0001N5-K7
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt3-0000L8-Hy
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:26 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:45309)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUt3-0000Ji-CM; Thu, 14 Dec 2017 09:53:25 -0500
Received: by mail-pf0-x241.google.com with SMTP id u19so3752620pfa.12;
	Thu, 14 Dec 2017 06:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=o0B8caNespqWoZFU8fH9V1pRE4+ngVW5SMovMv0JMfk=;
	b=i4M+ywCqIZllH8KbXZJ9cKu6eqQhWd1Uks/sJDlaqr0CjqJtYRMlrnqTTT/vWJDfz9
	pyg8cIfNR2Y/CS2dpTpalss1TwtDgG/WJVt1wal5DTEvuC+uzMuZwqua7C5mv5miHGG2
	YdFOzr0MW7eKCC2kR7tbd/lfSxXUDussUIwGkhfYCjW8Dc2NX+RUXSj0uZA+RCmKXjBS
	qyiB5/xjzu99myernsw5/ItSs3lGJXNCVQMeDrp6BinI6kLGJjMX5Qd5+quISWwWzJWb
	9x3VceJ9D934Y2sq7dYtlX8MRynYbo1e617tYQd0rtnkNvbzUd3KOyn5L8xOXf937a0e
	6RqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=o0B8caNespqWoZFU8fH9V1pRE4+ngVW5SMovMv0JMfk=;
	b=NQFH9G7RspdUXy+LYTOrov3Wdze5i1s3QDwToizatbGu2ubP6n4c9OtJB9sY8q/Huu
	teVnJcfE/ej0iW/6l5zfkDDC5gRjrrGT9UMZ5QAuL8bzRBG2DQqKrFXgF9vcXnDBcN94
	ZXYh4J/AMc6lohSRPj/HDWq15gU8rz4Ds+Ka+OIZ7i1RAxdqWKB52Q++HyqQW4Fmzfru
	o+MKDCMjbZHEDB5IKwPh9iBjl7PNAYs5qEcK7Ur/fWazj4wLDv9ch7bdBj1SKXl1Fwsx
	wKhQntsNINpnDMrNNpW3IwjA7Ue/M/zcD/mAGO7D3/LU4mnPedqm01ZsrmdXoQGux9BL
	q8VQ==
X-Gm-Message-State: AKGB3mKpCTO8gxp/0LudxNAnwWYBZpVs9Bq2dAyGBG/Ke5husHEJuCSE
	LLxdJgyUiDTjDPtyS9vtmbTHPwD2
X-Received: by 10.84.173.1 with SMTP id o1mr9993434plb.135.1513263204084;
	Thu, 14 Dec 2017 06:53:24 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:23 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:44 -0800
Message-Id: <20171214145255.31545-5-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 04/15] imx_fec: Move Tx frame buffer away from
 the stack
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w3Thtkhd0Ajq

Make Tx frame assembly buffer to be a paort of IMXFECState structure
to avoid a concern about having large data buffer on the stack.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 22 +++++++++++-----------
 include/hw/net/imx_fec.h |  3 +++
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index eb034ffd0c..56cb72273c 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -405,8 +405,7 @@ static void imx_eth_update(IMXFECState *s)
 static void imx_fec_do_tx(IMXFECState *s)
 {
     int frame_size = 0, descnt = 0;
-    uint8_t frame[ENET_MAX_FRAME_SIZE];
-    uint8_t *ptr = frame;
+    uint8_t *ptr = s->frame;
     uint32_t addr = s->tx_descriptor;
 
     while (descnt++ < IMX_MAX_DESC) {
@@ -431,8 +430,8 @@ static void imx_fec_do_tx(IMXFECState *s)
         frame_size += len;
         if (bd.flags & ENET_BD_L) {
             /* Last buffer in frame.  */
-            qemu_send_packet(qemu_get_queue(s->nic), frame, frame_size);
-            ptr = frame;
+            qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
+            ptr = s->frame;
             frame_size = 0;
             s->regs[ENET_EIR] |= ENET_INT_TXF;
         }
@@ -456,8 +455,7 @@ static void imx_fec_do_tx(IMXFECState *s)
 static void imx_enet_do_tx(IMXFECState *s)
 {
     int frame_size = 0, descnt = 0;
-    uint8_t frame[ENET_MAX_FRAME_SIZE];
-    uint8_t *ptr = frame;
+    uint8_t *ptr = s->frame;
     uint32_t addr = s->tx_descriptor;
 
     while (descnt++ < IMX_MAX_DESC) {
@@ -482,13 +480,13 @@ static void imx_enet_do_tx(IMXFECState *s)
         frame_size += len;
         if (bd.flags & ENET_BD_L) {
             if (bd.option & ENET_BD_PINS) {
-                struct ip_header *ip_hd = PKT_GET_IP_HDR(frame);
+                struct ip_header *ip_hd = PKT_GET_IP_HDR(s->frame);
                 if (IP_HEADER_VERSION(ip_hd) == 4) {
-                    net_checksum_calculate(frame, frame_size);
+                    net_checksum_calculate(s->frame, frame_size);
                 }
             }
             if (bd.option & ENET_BD_IINS) {
-                struct ip_header *ip_hd = PKT_GET_IP_HDR(frame);
+                struct ip_header *ip_hd = PKT_GET_IP_HDR(s->frame);
                 /* We compute checksum only for IPv4 frames */
                 if (IP_HEADER_VERSION(ip_hd) == 4) {
                     uint16_t csum;
@@ -498,8 +496,10 @@ static void imx_enet_do_tx(IMXFECState *s)
                 }
             }
             /* Last buffer in frame.  */
-            qemu_send_packet(qemu_get_queue(s->nic), frame, len);
-            ptr = frame;
+
+            qemu_send_packet(qemu_get_queue(s->nic), s->frame, len);
+            ptr = s->frame;
+
             frame_size = 0;
             if (bd.option & ENET_BD_TX_INT) {
                 s->regs[ENET_EIR] |= ENET_INT_TXF;
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 62ad473b05..67993870a2 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -252,6 +252,9 @@ typedef struct IMXFECState {
     uint32_t phy_int_mask;
 
     bool is_fec;
+
+    /* Buffer used to assemble a Tx frame */
+    uint8_t frame[ENET_MAX_FRAME_SIZE];
 } IMXFECState;
 
 #endif
-- 
2.14.3

