Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3B0CCFA13
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 14:53:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vH1LX-0006Hk-B2; Thu, 06 Nov 2025 09:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vH1LV-0006Gq-Nt
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 09:52:17 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vH1LT-0006c9-PB
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 09:52:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47109187c32so5006085e9.2
 for <qemu-arm@nongnu.org>; Thu, 06 Nov 2025 06:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762440733; x=1763045533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IKfGG8WVNqNZfFZk1k6i3v3Lr9Uq/tsY8S+cA/a7uyA=;
 b=Uh1YqubzaMGNnQia3ygb9l5iIfyd4WvD04uxKkKotup147RAznumuiXpfZLOrYuNN0
 CbOgvkkk/ArSAiA3WTXCAodZAtvedD2bB+vfKW6Tad9tJuoMOKrTZ1Q2l0WF9Q0XQRZz
 3I0zCTkVsNbz5fa9ujD3BgQ3GpswDedgEwlRxys9FBRqvtLKS0v4/eLXxYt50ktRswzj
 hzD4Qg0ZeKqoIRZq6oB844nD9Si+zp5QmRr12GBmJ03zDW1WDUvLhofpVnZCPQGmR4SH
 b9E/Vbcnwn7elvSdvTvHUtE2xWj+yP5chlyfoOIdG4xyKdYhGyIaEPTb5hKo04Z7pzFT
 CkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762440733; x=1763045533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IKfGG8WVNqNZfFZk1k6i3v3Lr9Uq/tsY8S+cA/a7uyA=;
 b=pmfdt59fDNCvEjJPIrocB/gB4uHD6vA+tL7rPC3TtU8F761GW/m1ajBskV6y1nCNQH
 aIlfDxP8WyNO7+3uF0A5KULwhmuB61BLpp5OYI7TIGr0B2s/qeU+yD1MbewxHPALvAMd
 DF9zlTnSYlOaJ3e6yQZ88iBWWj6oc9WcIEnavhe3Dcuj7zK+mnQGxo1pYgZly6tO0RB7
 y6E98TYjbth/gbDPtg9P3N2CiHwKyECg+jkPG7i0+IWFYLp8CZcXs0usjeEeGWytTQ2L
 k6DyfLmJnPGaSUtJTro920tZqxf/rXPVxwaqEm1hlAZWwC4Fg6JkWzGmlMNkNcXl+V6k
 hzbw==
X-Gm-Message-State: AOJu0Yw9R6/NMl1JobSPQYFnFSKj+xtOcpm1AJV3uuwzbqoA8058/VR7
 +ew5qcpocoPZGlX5+/8xyULuR4e0JtrxsDRuMVinw0MPjisjI3N/FHmhekmcZFb6olUZ3EvATV1
 JdbxM
X-Gm-Gg: ASbGncsgj1TFh1ryE+Dm++xAmNjyfWF5M9+RLl2DQp5kQLoDh83vLcUHWI2huKiYFlQ
 7ZVEx3L71zwQ/n+nzMW7cVF6kM+U+MiEx0F5DCQGXHPM6mLTlXA1dDSoKmg1Ymztmd02r60MV/Y
 X4XK/JPmVGLQGsmaKY+MiLTuMIjWBS4Gusjnwk2842R8TwtFz80ygKxAYcvCKUCLed9EAQ0kFVE
 5leET89rNkC/8nnWPg7KpOfiPdw0wfZGVuxVsZqZ8Sgd44h4TQdpgQKZEMyxtnN1iWsvEd6FWI3
 YpeYpFOYLsbEKnKdwKpXlnMz78lmaXBVHLVUlr50DAxoEE4q1Qz3a/wVUy8JDMnj1qrQclMjJWa
 fGtivUjpEoOouFw3UtJDkMLdUu9Q/KP3AeL2tkh0rKWiz+4UwW6tmRjKaK+2Svc1e34rUPVKV/o
 gbIu1YVw==
X-Google-Smtp-Source: AGHT+IHrUnXNTboMwEy6K8qkByy9T1L6SjfDoI8enMrKRBk+COkRTdXL0Trghf+prklqWM/Nb29Asw==
X-Received: by 2002:a05:600c:4e41:b0:46f:b42e:e392 with SMTP id
 5b1f17b1804b1-4775ce51fc6mr64683235e9.39.1762440733112; 
 Thu, 06 Nov 2025 06:52:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb47721bsm5694891f8f.25.2025.11.06.06.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 06:52:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 1/2] hw/display/xlnx_dp.c: Don't abort on AUX FIFO
 overrun/underrun
Date: Thu,  6 Nov 2025 14:52:08 +0000
Message-ID: <20251106145209.1083998-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106145209.1083998-1-peter.maydell@linaro.org>
References: <20251106145209.1083998-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The documentation of the Xilinx DisplayPort subsystem at
https://www.xilinx.com/support/documents/ip_documentation/v_dp_txss1/v3_1/pg299-v-dp-txss1.pdf
doesn't say what happens if a guest tries to issue an AUX write
command with a length greater than the amount of data in the AUX
write FIFO, or tries to write more data to the write FIFO than it can
hold, or issues multiple commands that put data into the AUX read
FIFO without reading it such that it overflows.

Currently QEMU will abort() in these guest-error situations, either
in xlnx_dp.c itself or in the fifo8 code.  Make these cases all be
logged as guest errors instead.  We choose to ignore the new data on
overflow, and return 0 on underflow. This is in line with how we handled
the "read from empty RX FIFO" case in commit a09ef5040477.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1418
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1419
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1424
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/xlnx_dp.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 96cbb1b3a7d..c2bf692e7b1 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -435,7 +435,18 @@ static void xlnx_dp_aux_clear_rx_fifo(XlnxDPState *s)
 
 static void xlnx_dp_aux_push_rx_fifo(XlnxDPState *s, uint8_t *buf, size_t len)
 {
+    size_t avail = fifo8_num_free(&s->rx_fifo);
     DPRINTF("Push %u data in rx_fifo\n", (unsigned)len);
+    if (len > avail) {
+        /*
+         * Data sheet doesn't specify behaviour here: we choose to ignore
+         * the excess data.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: ignoring %zu bytes pushed to full RX_FIFO\n",
+                      __func__, len - avail);
+        len = avail;
+    }
     fifo8_push_all(&s->rx_fifo, buf, len);
 }
 
@@ -466,7 +477,18 @@ static void xlnx_dp_aux_clear_tx_fifo(XlnxDPState *s)
 
 static void xlnx_dp_aux_push_tx_fifo(XlnxDPState *s, uint8_t *buf, size_t len)
 {
+    size_t avail = fifo8_num_free(&s->tx_fifo);
     DPRINTF("Push %u data in tx_fifo\n", (unsigned)len);
+    if (len > avail) {
+        /*
+         * Data sheet doesn't specify behaviour here: we choose to ignore
+         * the excess data.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: ignoring %zu bytes pushed to full TX_FIFO\n",
+                      __func__, len - avail);
+        len = avail;
+    }
     fifo8_push_all(&s->tx_fifo, buf, len);
 }
 
@@ -475,8 +497,10 @@ static uint8_t xlnx_dp_aux_pop_tx_fifo(XlnxDPState *s)
     uint8_t ret;
 
     if (fifo8_is_empty(&s->tx_fifo)) {
-        error_report("%s: TX_FIFO underflow", __func__);
-        abort();
+        /* Data sheet doesn't specify behaviour here: we choose to return 0 */
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: attempt to read empty TX_FIFO\n",
+                      __func__);
+        return 0;
     }
     ret = fifo8_pop(&s->tx_fifo);
     DPRINTF("pop 0x%2.2X from tx_fifo.\n", ret);
-- 
2.43.0


