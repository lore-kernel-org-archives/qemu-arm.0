Received: by 10.80.163.71 with SMTP id 65csp2261727edn;
        Tue, 4 Oct 2016 11:13:34 -0700 (PDT)
X-Received: by 10.55.207.209 with SMTP id v78mr5364587qkl.318.1475604814429;
        Tue, 04 Oct 2016 11:13:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r32si14420084qtb.104.2016.10.04.11.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 11:13:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brUDd-0005rL-P6
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 14:13:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1brUCQ-0004s3-92
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 14:12:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1brUCJ-0000Ms-HR
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 14:12:17 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>)
	id 1brUC9-0000KO-Il; Tue, 04 Oct 2016 14:12:01 -0400
Received: by mail-pf0-x242.google.com with SMTP id t25so5204516pfg.2;
	Tue, 04 Oct 2016 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UYsKk5BOxVSZ10OS/i6oIOMQ4QnB3pt+u2+8VF1mMjs=;
	b=Ticlfbb8Tqj5n93rhdcYGX3R3q+ulCkkYv30yT53Ph56B619WtpFXgiupAPZoNzIwV
	xyX2hW1edw//y1Nj5vna+hxQ2PYxxez/4jydkcIAp+/avqJjLUApznC1s1AMMBoxq2RB
	4+S/XKYqcmT/xdryZ6yNdOboC612cFPBxL4CmSTtcVfoLTAcNNAl37a5eZffXRZzSlEx
	pFx91HX/CSuhSjL5dz/IzJvbifyk73kszOQ4wJ0WLEVml26dsn2qmB9Zg9IUydgXmrJU
	A3cefUnac7DESp4ZeavBif3o3wEiGTmeniW+lEP9u0MZNNtwbqStUqu5ULIWUtiYE0lC
	RyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UYsKk5BOxVSZ10OS/i6oIOMQ4QnB3pt+u2+8VF1mMjs=;
	b=NSYHk6ZjrNcPGCWpEp5yCvnwU9TQR7v7o3pAcb+8Sb1E5DTzSGyfRnZ9Ze/N3ZjfKx
	XbJ0TBar9wHwmoOzZDD5wZomZGKfhnfZUvIQcWMc0H7W+YqbNvs8iKQMbi1akz65xHRZ
	+dNmrVXLP5YPK3jjX/SYwkwc9Bs2GLCbfTmFTQpwYnlN6PueuW0LgjqExMB0SsGMKMSK
	WbbqlKB2SmMn0pkXFQp+LicF8tAPZQLbgNg2RgfPcGJ9lIMeNR7GIOj/G8aQ/SrD04IG
	dTQ+86FVplBetQiyrwuCFEdjmMserrIVnaNb+pl6j4C4vuvLJBDU3z2yRGm9h2kNbY2B
	aZrw==
X-Gm-Message-State: AA6/9Rl7xiJvDJa9cxR2Wypk7m98woJZnPP3UUXERb1P5WkcPuEyS3Q8AraeqW0nUcdpNg==
X-Received: by 10.98.220.67 with SMTP id t64mr388051pfg.124.1475604718575;
	Tue, 04 Oct 2016 11:11:58 -0700 (PDT)
Received: from rutuja-HP-ProBook-4430s.pune.wibhu.com ([117.215.17.173])
	by smtp.gmail.com with ESMTPSA id p5sm41159451pfp.7.2016.10.04.11.11.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Oct 2016 11:11:57 -0700 (PDT)
From: rutu.shah.26@gmail.com
To: qemu-devel@nongnu.org
Date: Tue,  4 Oct 2016 23:41:42 +0530
Message-Id: <1475604703-3381-1-git-send-email-rutu.shah.26@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCHv2] Reducing stack frame size in
 stream_process_mem2s()
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
Cc: stefanha@gmail.com, qemu-arm@nongnu.org,
	Rutuja Shah <rutu.shah.26@gmail.com>, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yYC9yksIChYG

From: Rutuja Shah <rutu.shah.26@gmail.com>

Hi,
This patch allocates memory for txbuf in struct Stream rather than the stack.
As a result, the stack frame size is reduced of stream_process_mem2s().
Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
---
 hw/dma/xilinx_axidma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index b135a5f..6065689 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -111,6 +111,7 @@ struct Stream {
     unsigned int complete_cnt;
     uint32_t regs[R_MAX];
     uint8_t app[20];
+    unsigned char txbuf[16 * 1024];
 };
 
 struct XilinxAXIDMAStreamSlave {
@@ -256,7 +257,6 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
                                  StreamSlave *tx_control_dev)
 {
     uint32_t prev_d;
-    unsigned char txbuf[16 * 1024];
     unsigned int txlen;
 
     if (!stream_running(s) || stream_idle(s)) {
@@ -277,17 +277,17 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
         }
 
         txlen = s->desc.control & SDESC_CTRL_LEN_MASK;
-        if ((txlen + s->pos) > sizeof txbuf) {
+        if ((txlen + s->pos) > sizeof s->txbuf) {
             hw_error("%s: too small internal txbuf! %d\n", __func__,
                      txlen + s->pos);
         }
 
         cpu_physical_memory_read(s->desc.buffer_address,
-                                 txbuf + s->pos, txlen);
+                                 s->txbuf + s->pos, txlen);
         s->pos += txlen;
 
         if (stream_desc_eof(&s->desc)) {
-            stream_push(tx_data_dev, txbuf, s->pos);
+            stream_push(tx_data_dev, s->txbuf, s->pos);
             s->pos = 0;
             stream_complete(s);
         }
-- 
1.9.1

