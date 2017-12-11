Received: by 10.223.159.74 with SMTP id f10csp3052961wrg;
        Mon, 11 Dec 2017 13:31:34 -0800 (PST)
X-Google-Smtp-Source: ACJfBot0RiduujJu5R+Xp+s28POmETZrS/n1Tee1igZdE0sVhCvInUAgDKNfiRqM9oFu4O3Fg4+8
X-Received: by 10.37.233.1 with SMTP id n1mr1392399ybd.274.1513027894085;
        Mon, 11 Dec 2017 13:31:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513027894; cv=none;
        d=google.com; s=arc-20160816;
        b=UsYPgIckiM+4YcuqBQ/jLmAB6zUgkLZBJtQiYIkH/Y07VrCz3lRZErRsibDQYvfOoP
         I9tRvevzAXlxTBneTvBeWthCktezW97t6M1WRjPLjdeEXyFz4SCfTEYn9hbmcJHdLjh3
         51FAXtEWpjZVQOg0pVyOIhL4z9ambURMP5lY0MrY8odIdm8eLTP42P7Pz1Lz/xnheMMQ
         ELJmKILyimnHGiIjC43eYCRqC13Rs2ab/9mXm8LHSEVgE9dk+sXpPMhgsvyAmYFdFFJb
         77CdDXykNXr7hBdHuglMhQwMvmoRD56NgAVciVbspA9LAFp7AWVtyTKIGwCrfhl+WBTh
         jqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=VGiWYx+mHGVhkBJM8+hx1Bft6rHr3zpvjmjA9JTFYl4=;
        b=Qq/BRGO82ofB7ZtWZ1igbW7tJq+taol9JJi8XLN7lmhMoWSc4C9y0GSN95VsFwV82V
         JmjsZzWYKbjj6W1qvvh0A9lk5pGb5DXTexJcObhuVO3RYO7AeEBfbr0blrWTCmx8kr2E
         O/S6Zmm1DVwn/nYuG9tMGIGTFHbKOCfRzz8y4U0L5E5NFoq32FEjCNRnNAN2uQaC9G+c
         8a3dTF6MvBG8QruTndIoC+O+kCcy8dlRdG2G6j3+saguvr1rlXhBpdg0ERthmJdeCd+2
         HosMXQMZPD+3iUTNubY6K+QwR8zNqdeGTz9rmB60GZS3cysMuoY8/fflY29Kxi6LH92w
         D4JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vfP5A1Cb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e8si2971256ybn.149.2017.12.11.13.31.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:31:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vfP5A1Cb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVfh-0000ze-DJ
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:31:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf4-0000iN-TM
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf3-00041u-6I
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:54 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:44899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVf3-000400-11
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:53 -0500
Received: by mail-pf0-x244.google.com with SMTP id m26so12524336pfj.11
	for <qemu-arm@nongnu.org>; Mon, 11 Dec 2017 13:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VGiWYx+mHGVhkBJM8+hx1Bft6rHr3zpvjmjA9JTFYl4=;
	b=vfP5A1Cbv4yGjIQalqU974B7a6CADsvk37SuSEUoFI7l6jw1KKnfcpXvmThSfGqTQO
	O4lXB7BZ/kb0mws/32G6qNC/TjUZaZunp100i0p9ZipeRga1IPWq1eiB51Z3d7/DmALN
	xKVj4rcuTvyhnXh5k3mNE0ECfKjZ7yu2fftkF7D2N7w4wdSYL65c7WZUBovH1TZBduLw
	Emf9bbAxSiFWrrAmv0UnW1nqj0KAvyOp1XhF1+v4kKlveZ+S6sZdTFpHW/Xl8cdaovFc
	3zADdOimXCmiQfrUUG6PLmxMWs5du9tc0uE7nPsHeiyAAlcBOnKXpNcCExZ1qJ7olzu8
	rN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VGiWYx+mHGVhkBJM8+hx1Bft6rHr3zpvjmjA9JTFYl4=;
	b=IbvQR7LgLoYYNrQfHhZQ4OnpiHuG8OumUi2VCN8kk5sZekMMlfjT8d0Jfa25/GvIxf
	6RtpOggHvTc7XVI9QFnVJE7CZG9S59MZA391bQ8l8Yph92LeBrjYy/ljQUVMu8a99ZR8
	sbzvZpyEaeAVbY6AG56914eNl+LfZuwLfOW15gCk6wYhK4yCoPJFsLF+7v4wtzCg/CKO
	VnWKsXU6iavfsSm1SZzvPj5awaVzx++ib5Kkb0FM1pmCJ3UyEJ+TcCSfQVsis4jCzMz+
	4cWfDzFjcX1W8HaWz+VMM0lV/F1okqX1udngRS/0Nl/XHn7PKh5i5QH8ddTdm6s9oKSw
	z8RA==
X-Gm-Message-State: AKGB3mInz+Cmm78yjJbnqmttPC+3pQDohAFut+Bo0ZSOXcNIsvvMYiUj
	suKkZMJXXutj8b2jOwqxTPV1c43A
X-Received: by 10.84.210.137 with SMTP id a9mr1646837pli.17.1513027851742;
	Mon, 11 Dec 2017 13:30:51 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.30.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:30:50 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:29:58 -0800
Message-Id: <20171211213007.7353-5-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH 04/13] imx_fec: Move Tx frame buffer away from
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yiUYOVMyUDFI

Make Tx frame assembly buffer to be a paort of IMXFECState structure
to avoid a concern about having large data buffer on the stack.

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

