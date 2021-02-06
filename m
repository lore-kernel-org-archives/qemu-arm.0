Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2909371lfo;
        Sat, 6 Feb 2021 06:38:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlegKotMjAoA7CMF0SpnzWPsYHCiq5IECj1N9GNYtj/HKKE53pijA1caaZ/UMelKJ0Ywoz
X-Received: by 2002:a25:a89:: with SMTP id 131mr12905131ybk.429.1612622339058;
        Sat, 06 Feb 2021 06:38:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612622339; cv=none;
        d=google.com; s=arc-20160816;
        b=QrIMIOgnE1POJAa/K4wrcCQyerSI9w37KsNXT0huukUFSADYsp44IwTJmcdDJnGGzq
         XFsauu40pDPHkNsIHWT6b4YN85SSXAQklQyK0BdU9mWmM84WfirYyYbNlMXCYhNhKuu3
         tN0iUiaaTFD9TdNMwkK4nk0+Tfqc2KxRW//xO+cKwHAYBtvAYKZmqSYuH8U1KIBKJQ42
         RGQNv3VmegVt9J90yXq0p/NbTDaIKVtp+ya/3oy0XJz08oJ+HW44Q2vk7P8mNsBKq1EC
         wDMrvTJhpW3c+4oWV0DzfvFRyLgmP2/el9UzLZawZE8R8/c4A76dBNKvSwedrEvfbqsx
         6qrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=ZX+WkuNBloAPjtuNJHXiLQ739gJDqw1UpF4RajkICVM=;
        b=EfztexFZB//tmfz+BTore0x4w59xs0PQw+G1fOovGLsfnaEGGmrlqvPBTgovv8m+6X
         O8Vfk8x6grx5dwLQggdpdDkNZBq9bpnEQoTMwD9QnkbU039++gNkHQ6ExO46a07iTHxv
         yqWBifhOD8GO4Fa2suC/CSxSOGKdc10MRZkwA3mw1noCfV4mRXh61BAuSk8nURXeyW72
         d+OX1o4WdiY+/wc00sYGFsFqZbJwkfsezFw5vvI/VTrRWxBNOzcgwB0ArIZTLBslZms+
         OANGnMZMnaNeHJQ0gqev0IiK4aRZnyXSQ2bt6uTNQeW8jco7A4r1j3npHms2QcC1aMIn
         Wlew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LbdFPZwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10si1967459ybk.7.2021.02.06.06.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Feb 2021 06:38:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LbdFPZwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8Oji-0003Zm-Ac
	for alex.bennee@linaro.org; Sat, 06 Feb 2021 09:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8OjV-0003XY-R8; Sat, 06 Feb 2021 09:38:45 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8OjT-0006cs-3T; Sat, 06 Feb 2021 09:38:45 -0500
Received: by mail-ej1-x62e.google.com with SMTP id hs11so17664574ejc.1;
 Sat, 06 Feb 2021 06:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZX+WkuNBloAPjtuNJHXiLQ739gJDqw1UpF4RajkICVM=;
 b=LbdFPZwtCIPbxwLjI2cFk3CPgftpKAskr9UD7e0RwWe0mdRHcWfuN3mcORTHQjx0sd
 W2gBfsfBWG7wTiRHWJZOuzuWiXHBLwwU1MnkpNzQvpZRe4J1CXpg06UJXxh2v7j7Ogv9
 tqsgejqYZDfU/O5YX7oYVnsC2z8sfpkqS+NbNeULb5oo2wz4KRSZMv8PRcGH4WOZPupl
 UTYF7aQCakSUbqVdA6vnDGrWnP/eb04KexguJvGCnpnWn00mcPWz763+RCdGp0bjaG3c
 2ucSgb36ss29CTRTi0ltAYYUi/zFFJILIjGcikaNCM5JsvKXOqzqk90YV63h8/FH4T+x
 jSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZX+WkuNBloAPjtuNJHXiLQ739gJDqw1UpF4RajkICVM=;
 b=q/h6Pjj7QmRs6XCv3mpIXYw90yKo4RlMAn4/WLNbJRJnVfBkCJr6PzpR8aA6YqFTgy
 G9LU72iMZhbXjv94ezBD9pjg2qJEpnPm9Wsovin+Enp5gQM282uWI0ak/9D225CKhG5k
 Di89znHhJe0Z9ef793aFgoyLxP6E8HruKdlwi0coAWdLgIt0IliGtl2iHlS3Pb75d0oG
 FFvYTzGbKN582D/5nTPqPPSyC3XtzDf+bb6+MCqjk41UK0+DykhF9v9n2ozpX7RJitvA
 IBs9gDMGGAwTJCKYMVAHf9pYtutqZDhUE8BjIfjoqwKQjkvvKRSU4j9rMbHcbQbmvUiq
 P5Kg==
X-Gm-Message-State: AOAM531554mS2o5TA16eqFvFex3MLEhggZV58vzWInBUuzHcfqhWawoS
 k7zafBRcyCA4PoKzpqNMf04aYI++i4o=
X-Received: by 2002:a17:906:5d0b:: with SMTP id
 g11mr9053040ejt.542.1612622321095; 
 Sat, 06 Feb 2021 06:38:41 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id g22sm5394513ejw.31.2021.02.06.06.38.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Feb 2021 06:38:40 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/ssi: xilinx_spips: Clean up coding convention issues
Date: Sat,  6 Feb 2021 22:38:13 +0800
Message-Id: <1612622294-37297-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
References: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PgDLRJmJroQy

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

There are some coding convention warnings in xilinx_spips.c,
as reported by:

  $ ./scripts/checkpatch.pl hw/ssi/xilinx_spips.c

Let's clean them up.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/ssi/xilinx_spips.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index a897034..8a0cc22 100644
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
2.7.4

