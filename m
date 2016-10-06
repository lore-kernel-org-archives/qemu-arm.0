Received: by 10.80.163.71 with SMTP id 65csp3363094edn;
        Thu, 6 Oct 2016 11:18:57 -0700 (PDT)
X-Received: by 10.55.25.211 with SMTP id 80mr16018752qkz.230.1475777937081;
        Thu, 06 Oct 2016 11:18:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a40si8356707qka.237.2016.10.06.11.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 11:18:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsDFv-0005fK-PV
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 14:18:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1bsDE5-0004kM-QD
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 14:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1bsDE0-0006J9-Nl
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 14:17:01 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:34437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>)
	id 1bsDE0-0006IZ-Ei; Thu, 06 Oct 2016 14:16:56 -0400
Received: by mail-pf0-x244.google.com with SMTP id 190so1496961pfv.1;
	Thu, 06 Oct 2016 11:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=b0v25GEGx8mdlBshfPSj0axEtyRTCx9zkX8DrN/aHgI=;
	b=lrM8h35DI/DPsJEzL2He9CJiqq4msurCgbd9t8Klx2BeA2kFV8BSMV8IBoEc+nqEno
	eCRKgmdpKvR7ZdpMVKXacoF1VgHj22AZMKrQkVMQf/qRQKMdqOk9pvFQ+KLHC+87Q8iC
	4zqkoPGq8WLBIph0cQc/5Krl1H9jgWkVq8qpI3Yd5ptb4vorElgher6g31bzcrpLYRcT
	/8iqDNYyuRn7LmXOYmQ3QpJMU0xQ/TJkmolgb2h1fMUpWkL6rqnw9st3qAAL/7UGIDsO
	tVKU39I4gL1/+gEcBWoOsywjtDdP59ZQdE+kcz85evE0h4g21pE9+sZIgOoTJMZrekzV
	Y2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b0v25GEGx8mdlBshfPSj0axEtyRTCx9zkX8DrN/aHgI=;
	b=YJK/jacr9BfXC0uB7trGytEX0HyarG/tv3+NeG8PlN5/ABYuaRbshRbWlanhs6nk00
	FqnyT25Ukb24sJYBDMfVIjajXlpGNsim7/chc4dGX3emfDo6dG7ndSeE37Y4k4aj99Tl
	RHLGIc8RQyJ1KXg2YqDR0pF7pdBc+6fYDRARoHps06DIGCLEXsl/qTNwZz/VcS6mpenH
	gyRCqNHJxqu0Tm+Zmb56RXEPKVRhmq7eENhuq7KiUaS/dCqnFnr2N8guaP0umaubSECr
	1UsIpPRta/gtWGQeJi8psjWZneisuKoIHowR0shFpMK35MEspL3RG/a9AEBXHaoJCkGa
	EKPA==
X-Gm-Message-State: AA6/9RkkD2NyoGDz1/1PcrWjhf+WeyHY2BSc2Y6HRDIHDAJVRKTnn0f++C+LJzQ7YbAx8w==
X-Received: by 10.98.56.147 with SMTP id f141mr19382395pfa.83.1475777814860;
	Thu, 06 Oct 2016 11:16:54 -0700 (PDT)
Received: from rutuja-HP-ProBook-4430s.pune.wibhu.com ([49.35.217.235])
	by smtp.gmail.com with ESMTPSA id
	s1sm24468938paz.47.2016.10.06.11.16.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Oct 2016 11:16:53 -0700 (PDT)
From: rutu.shah.26@gmail.com
To: qemu-devel@nongnu.org
Date: Thu,  6 Oct 2016 23:46:34 +0530
Message-Id: <1475777794-4376-1-git-send-email-rutu.shah.26@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-devel] [PATCHv3] Reducing stack frame size in
 stream_process_mem2s()
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
Cc: stefanha@gmail.com, edgar.iglesias@gmail.com, qemu-arm@nongnu.org,
	Rutuja Shah <rutu.shah.26@gmail.com>, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W4XAKx2EYTsZ

From: Rutuja Shah <rutu.shah.26@gmail.com>

This patch allocates memory for txbuf in struct Stream rather than the stack.
As a result, the stack frame size is reduced of stream_process_mem2s().

Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
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

