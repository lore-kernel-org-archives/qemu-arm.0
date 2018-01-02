Received: by 10.223.134.117 with SMTP id 50csp11156369wrw;
        Tue, 2 Jan 2018 11:36:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBouJBHQvcZktJuO8UOYuHeVV8caTun/iomnG3T5pbUywBj0detWSU0QhpNcIMdRFAYQeQ9ZN
X-Received: by 10.129.118.69 with SMTP id j5mr29935287ywk.357.1514921818881;
        Tue, 02 Jan 2018 11:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514921818; cv=none;
        d=google.com; s=arc-20160816;
        b=1ItkBxUsct6k6uzUHZ3FPgqqXt2UQtCknBjqNAC25hj2irIh0k61nz7dyEEcbUBV/D
         S+CCfn4Yb8ILKl03o6so1r+QyVDP1GieadCLAVr6z/wTDH0UyM5ihwWLPurxcWE/G1Ta
         F3DQ6izNdJ2UmA40Na2lFA2X/QiUEBQRZH1Tz71wvg0hHKwJg09CWnimriopdG9TzOQq
         DaXKc2yCJXKvSuyXCwul6coXd4gmJwLFThbxoRwkJ2elSAw6zH/8zjHFxBrvUXnqXdXy
         qEwtl0OqPWT9tBnBEgA9zL1FVJ3xFW/T/tt2cXL+bdInW002veDxogyF0SaugxFfZzaW
         GkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=o0B8caNespqWoZFU8fH9V1pRE4+ngVW5SMovMv0JMfk=;
        b=DC4fM1LYkVdaXmy/ggHhghY/uqheYyaFVF6Epihryra3qyWhuxv4DPHymcMOgVun7T
         I69GQoEFiScjTunjWMJdIk0qmLBddFnUrUKw0q0Z0tphk5Ef4h/0AkW+4tICQQaMzB7p
         9NCtfK8RleC8mFOPIBEQob3Iciun0rW05iXeMkueYCVrD9vj6ikCl9KNXX3pgvWD1BGu
         BKBjtvbIAF+vNZ88ZEJo+ptIH3kpLcufzZgE8yh+c/gtjmHEV8t8D8+WcuQqgCc5ZPDg
         KTEYqQ/Qk2ZxEfUBBBUzqtmypNFywEg6zhfuI4VJU8R3bQiBwgV5Srjb0U9KGI4SYLje
         eyLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=It4x0Ahs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z185si6932678ybf.684.2018.01.02.11.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:36:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=It4x0Ahs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSMs-0003FP-8i
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:36:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMa-0003E9-Kv
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMZ-0000Ii-HV
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:40 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:35751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMZ-0000Hf-9h; Tue, 02 Jan 2018 14:36:39 -0500
Received: by mail-pg0-x243.google.com with SMTP id b70so1331922pga.2;
	Tue, 02 Jan 2018 11:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=o0B8caNespqWoZFU8fH9V1pRE4+ngVW5SMovMv0JMfk=;
	b=It4x0Ahssp/XGd0/NGkh3MzTC/1Zj0ZOsLASSpzjVgYBb/8bN0MpWomQVzuczzuHIq
	kYx4l1aReWeGp6y78iAx3VPHwndum4w7LppMepfw7r0RF9Pzve1DZvFoO3ropSeazzO9
	IrFD4iR6kcBGWQn+297N7dy513yF6Bpe4NgqefI7Jyv9cjc5u7sw+WV6Gsh95sZz+YBP
	0C42wF3X38VCM1rnwdGGnIEFVdNOuRdD4EoeysamWdnUklVF7xMsuTEA8EhSDdHMWK1V
	W6eZo5j5oz1MkEV3LPfP4qV7k19KFOgipFvGfOfEoM62Ec3vQIvyXI/wn/H7xwNY+1Nn
	zBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=o0B8caNespqWoZFU8fH9V1pRE4+ngVW5SMovMv0JMfk=;
	b=WnjffdeXgkOtNkF21F9J/pph/ygkauXKAPsTLbKtjrWjssDNH5euJhGLyfSZ6erbYc
	uG6dFhWIqd+HpmxbgZTEQjwKZ1sOnu2A0pZ7vrV55md+wPpMcV3K/og38oOt9yqw5y+9
	Xoi3P3UAGQii3TFWygOVvgTHOdhy0SbKY46ljTqAVu5MrHFWdVd4Dd/Hy8dZzg1LqBTn
	ZVVC4UXdKlvtpe3cgM1K67VuHMT01iWf7v7QpIJSwv2ohnDGxItSHh89MAVSKxP9wXRf
	tkGN20V5fLigQr1K20CvlSpOaZnT1dJEIuqP2AVgrfF54cNm/5lNNboeY9/u2I4oKnoo
	awqQ==
X-Gm-Message-State: AKGB3mKwLTNMVnnXoKtrXhrDJk9aAx0rYm9NgrOq0Rod2T6EWT0g2k/b
	2xaGCkhLVCf/tfMFNq7LwlAXFxbMv0Y=
X-Received: by 10.98.223.4 with SMTP id u4mr45655274pfg.233.1514921798080;
	Tue, 02 Jan 2018 11:36:38 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:37 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:15 -0800
Message-Id: <20180102193622.27215-5-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v3 04/11] imx_fec: Move Tx frame buffer away from
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
X-TUID: +Ux7yD+LK07G

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

