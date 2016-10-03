Received: by 10.80.163.71 with SMTP id 65csp1662686edn;
        Mon, 3 Oct 2016 09:57:00 -0700 (PDT)
X-Received: by 10.55.220.193 with SMTP id v184mr20761787qki.303.1475513820500;
        Mon, 03 Oct 2016 09:57:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i66si21139012qke.14.2016.10.03.09.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Oct 2016 09:57:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1br6Xz-0002RY-V0
	for alex.bennee@linaro.org; Mon, 03 Oct 2016 12:57:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1br6Xs-0002O2-AU
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 12:56:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1br6Xo-0001ZX-6n
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 12:56:52 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:36664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>)
	id 1br6Xg-0001XX-TD; Mon, 03 Oct 2016 12:56:41 -0400
Received: by mail-pf0-x244.google.com with SMTP id n24so9050155pfb.3;
	Mon, 03 Oct 2016 09:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Wv6iCIupQGp0xuZXE2joT0vVjQRoNjxFASNevAXtkFE=;
	b=jSR2Ff8CH5NO8sk0hI8LCWLAMf4fOQyKuVzJK5K+TPTymzIdFCP9xlZW+EJQ4+sxZ6
	uuFM2hV6oW4OQSn0JSYPWtjkcZ2FtioUPnmJslg7m9D17lnm78xOLpseUDtbrMxqCMb9
	9CaDueGEwvM2KnjbHdY/0NvlS4GvNJPePv0lf3RVi1LRmIJkXQlK1CeGWP1rA/+zjwNv
	DMSjDk1saheemofPzBHMIjLM/j8tGz+z8FaSbsML2bwWuFmwEI4yJ8QS6M2WPGVBSYA1
	smwOyLYcAwd4qAxIqIkU96Ir2mg7sLr2Nk1Wd00hBkeodkbC0bapLTZIhadGqT7sU2yM
	5I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Wv6iCIupQGp0xuZXE2joT0vVjQRoNjxFASNevAXtkFE=;
	b=fb32X7+WB5GgSm6c7GR0t9SnwTo6mIOwFHB/IHYtjADwCifAIWl/kQ+b8eY6jddlJd
	ABaW+IstWjU+9/T5lPhRauFe91GKBuQtd6pn83lRHOkDXPUVSJCYaFxvjsbN5a1whoI2
	OF9flLr94nl6NdYaHs48bMQZ2vFvrS2tGtw6HxHmzZTe1j5pZPiWzAujV1rsoIlqJun1
	eGIebKJRXgaMh7STjABhdtsdy64iWsTOm7i2T0jRPeZ/k1OAAz9i7XIzp61yTMjWAiv5
	reOJrBZww+W86a3ZtlmLH//469+mn00478TcSVuVlWFWXgfNaJ03V8hewBkVoBR+gMtO
	IncQ==
X-Gm-Message-State: AA6/9RlRAGzhcXlmwbpT/OufKPxf5WuFzrCeh0J5CQp10iXKJXjVPcf8cnQjbSSJfet3dw==
X-Received: by 10.98.213.68 with SMTP id d65mr38678928pfg.112.1475513799515;
	Mon, 03 Oct 2016 09:56:39 -0700 (PDT)
Received: from rutuja-HP-ProBook-4430s.pune.wibhu.com ([59.95.42.29])
	by smtp.gmail.com with ESMTPSA id
	yg10sm48690870pab.8.2016.10.03.09.56.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Oct 2016 09:56:38 -0700 (PDT)
From: rutu.shah.26@gmail.com
To: qemu-devel@nongnu.org
Date: Mon,  3 Oct 2016 22:26:25 +0530
Message-Id: <1475513785-30275-1-git-send-email-rutu.shah.26@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH] Reducing stack frame size in
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
Cc: stefanh@gmail.com, qemu-arm@nongnu.org,
	Rutuja Shah <rutu.shah.26@gmail.com>, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SQSZenw2XISh

From: Rutuja Shah <rutu.shah.26@gmail.com>

This patch allocates memory for txbuf array on the heap rather than the stack.
As a result, the stack frame size is reduced.

Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
---
 hw/dma/xilinx_axidma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index b135a5f..6c63575 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -256,13 +256,14 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
                                  StreamSlave *tx_control_dev)
 {
     uint32_t prev_d;
-    unsigned char txbuf[16 * 1024];
+    unsigned char *txbuf;
     unsigned int txlen;
 
     if (!stream_running(s) || stream_idle(s)) {
         return;
     }
 
+    txbuf = g_malloc(16 * 1024);
     while (1) {
         stream_desc_load(s, s->regs[R_CURDESC]);
 
@@ -304,6 +305,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
             break;
         }
     }
+    g_free(txbuf);
 }
 
 static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
-- 
1.9.1

