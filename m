Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3560668lfg;
        Mon, 1 Mar 2021 05:22:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuTiHveEhA19JxeC73mZ71T7s/vkAb2ALLLarNxmz3ReqrHk3zRqRGJW0sHB7JR01sBaQu
X-Received: by 2002:a05:6102:215a:: with SMTP id h26mr2849443vsg.19.1614604926352;
        Mon, 01 Mar 2021 05:22:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614604926; cv=none;
        d=google.com; s=arc-20160816;
        b=LxvchOb92PnZvr+B0c79XtEapUjfjwDUyRs9z0dHoghmBAO9LCju6ymL32qKhZ+MxB
         sUV4DVwWCWGJ/qj5/BkCOXv7/j1uoNdqw3RG/dxBZO1/hSAk/PboVmboEUiL4Hnr+m8Q
         kNW9m8QCO6nx7KD1TD0HagheK+F9wxDA9sr2JvTm+xWiW81TZ6T2d9Ay5OYdEukQfSw8
         HNL+u/2Ati+/f4ZqGMnJogIWMz3b4nEANVvyJyVhkneH+sN17khrBtudwTagV3iz+viz
         T8hCBJpgvIFNUjxmJfGPOO6vcf2DWGN7yBzzB1O8a81+gpHfHMiKzntOUGRf9hs5tJGL
         Si9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+UzSdyjSd904zCeIE0aTyBCjawmbJBRlBQ1EDG6ABek=;
        b=lEKTckuy7riKj52UlPpMp8dc2Fe+nv2/mQfVjJUVGziTHbxxWy9Tp4t034u1TdO93H
         +pmXgzDMbwbah/ozTkHTXQX6QGLdQrsCwrAVHhf6IbY7hXCbrHKTjP51H0lwqZGymyGt
         OdNR0933jGWdttYtcuwQgePotxcDYlKnDprYXHTbQ0ZSxhEqhhFKI+mEskpjaLAwnU/D
         cdN46M9ndifj3PaN4XV13rJ6UzjXL2D1rUIEVTg3Ev2A+LumvKos1HWLG7e2C0K66iru
         DLBnAwcvkvf7Wksa6Y8Or7NHfirdeTSLY+TZBEXScOWpMcrA5oF+XH6KzcdAYmJyL2Bo
         Gr5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SJilL8DS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m188si2628013vsd.67.2021.03.01.05.22.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 05:22:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SJilL8DS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGiUv-0004Jt-Ed
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 08:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGiTf-0003cp-FW; Mon, 01 Mar 2021 08:20:47 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGiTV-0003Kt-Vw; Mon, 01 Mar 2021 08:20:44 -0500
Received: by mail-pg1-x531.google.com with SMTP id a4so11521620pgc.11;
 Mon, 01 Mar 2021 05:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+UzSdyjSd904zCeIE0aTyBCjawmbJBRlBQ1EDG6ABek=;
 b=SJilL8DSvBPBRcJtsFo1tp+W3noVttfzxEtEQ3SdlCopA32YEp11jZxslciF9NP73n
 0rojOJVI/ibdZXROn+X7aiMrSi1T7Hp+MmlTNRQ7Fujq0E7jTKqxkB8AiONt/LMKFOsk
 qv9XonK/9lee0Z6rWQB/nPOnUtr+5S0QWGo54M2XJmAEUVqR0nS7JUvVCqTZuHUf7tJo
 OeHV+GJS4yziDjLR/3FhZqS3DDTBorqjEiZiBeQaDkJsr6ZXyrsz8fsRnkxnjk3/Kmr2
 FDdK9M3ZLFNZmVZVdgOi7gQAkmtn1yHYRINmU0lkc4KAfcM++Qjki2qSg6rVrmYNrah4
 i2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UzSdyjSd904zCeIE0aTyBCjawmbJBRlBQ1EDG6ABek=;
 b=ln3vivXhcllF4kWXoNMZvWlKGLUtyKUyxKTq2guK6OYhhOj+8W/cEzkRpr79zIuezE
 CaxEeyIvJmM/gP74IfQT7teNWCmc6HPKwFq4S1y/8xZ0sV/bb/CfJIEe/TuuLCeFLBFA
 nBRB3S9K4ON1kfvW+AF821WpPk10O0AvXPVTbv6ybyEpyMTXE3KoX0U1yIHLLYwb1szj
 5uCR9y9W9wXi57iH+HjPd9u7rqm6RDGPx1vUF68jDtdpExk3luM+ICsrCBM6xtj5Kg7w
 e2WGlgx/hJlVTqM8W/SVsGvdWEFEvetvBiDUq5da6R+yxtnEhP1K+a3KXYGZH3oHvKyA
 RpCA==
X-Gm-Message-State: AOAM533ps1GspZUXcNKfWUcjLzsNyquoJVOuZpGDYFUFm91aY+4P6ODS
 G6lBuzXtCLmpc7BULBBVjRI=
X-Received: by 2002:aa7:8ad2:0:b029:1ee:16f0:7c70 with SMTP id
 b18-20020aa78ad20000b02901ee16f07c70mr15029775pfd.58.1614604836502; 
 Mon, 01 Mar 2021 05:20:36 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id q2sm17748793pfl.158.2021.03.01.05.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 05:20:36 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 4/5] hw/ssi: xilinx_spips: Clean up coding convention issues
Date: Mon,  1 Mar 2021 21:20:10 +0800
Message-Id: <20210301132011.8494-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301132011.8494-1-bmeng.cn@gmail.com>
References: <20210301132011.8494-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4GDsrZtJyQ64

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

There are some coding convention warnings in xilinx_spips.c,
as reported by:

  $ ./scripts/checkpatch.pl hw/ssi/xilinx_spips.c

Let's clean them up.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

(no changes since v1)

 hw/ssi/xilinx_spips.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index a897034601..8a0cc22d42 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -176,7 +176,8 @@
     FIELD(GQSPI_FIFO_CTRL, GENERIC_FIFO_RESET, 0, 1)
 #define R_GQSPI_GFIFO_THRESH    (0x150 / 4)
 #define R_GQSPI_DATA_STS (0x15c / 4)
-/* We use the snapshot register to hold the core state for the currently
+/*
+ * We use the snapshot register to hold the core state for the currently
  * or most recently executed command. So the generic fifo format is defined
  * for the snapshot register
  */
@@ -424,7 +425,8 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
     xlnx_zynqmp_qspips_update_ixr(s);
 }
 
-/* N way (num) in place bit striper. Lay out row wise bits (MSB to LSB)
+/*
+ * N way (num) in place bit striper. Lay out row wise bits (MSB to LSB)
  * column wise (from element 0 to N-1). num is the length of x, and dir
  * reverses the direction of the transform. Best illustrated by example:
  * Each digit in the below array is a single bit (num == 3):
@@ -637,8 +639,10 @@ static void xilinx_spips_flush_txfifo(XilinxSPIPS *s)
                 tx_rx[i] = tx;
             }
         } else {
-            /* Extract a dummy byte and generate dummy cycles according to the
-             * link state */
+            /*
+             * Extract a dummy byte and generate dummy cycles according to the
+             * link state
+             */
             tx = fifo8_pop(&s->tx_fifo);
             dummy_cycles = 8 / s->link_state;
         }
@@ -721,8 +725,9 @@ static void xilinx_spips_flush_txfifo(XilinxSPIPS *s)
             }
             break;
         case (SNOOP_ADDR):
-            /* Address has been transmitted, transmit dummy cycles now if
-             * needed */
+            /*
+             * Address has been transmitted, transmit dummy cycles now if needed
+             */
             if (s->cmd_dummies < 0) {
                 s->snoop_state = SNOOP_NONE;
             } else {
@@ -876,7 +881,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
 }
 
 static uint64_t xilinx_spips_read(void *opaque, hwaddr addr,
-                                                        unsigned size)
+                                  unsigned size)
 {
     XilinxSPIPS *s = opaque;
     uint32_t mask = ~0;
@@ -970,7 +975,7 @@ static uint64_t xlnx_zynqmp_qspips_read(void *opaque,
 }
 
 static void xilinx_spips_write(void *opaque, hwaddr addr,
-                                        uint64_t value, unsigned size)
+                               uint64_t value, unsigned size)
 {
     int mask = ~0;
     XilinxSPIPS *s = opaque;
@@ -1072,7 +1077,7 @@ static void xilinx_qspips_write(void *opaque, hwaddr addr,
 }
 
 static void xlnx_zynqmp_qspips_write(void *opaque, hwaddr addr,
-                                        uint64_t value, unsigned size)
+                                     uint64_t value, unsigned size)
 {
     XlnxZynqMPQSPIPS *s = XLNX_ZYNQMP_QSPIPS(opaque);
     uint32_t reg = addr / 4;
-- 
2.25.1

