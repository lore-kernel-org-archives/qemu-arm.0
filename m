Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp34630lft;
        Wed, 29 Jun 2022 21:57:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3NI77tRLZj581VIOwr6e1HGiRHtSYbnOG3BTlp/H+jC73HQn7ECstQNS+oMJXDLFfd4/J
X-Received: by 2002:a05:622a:1a19:b0:319:9c4e:1ba9 with SMTP id f25-20020a05622a1a1900b003199c4e1ba9mr6018237qtb.622.1656565029137;
        Wed, 29 Jun 2022 21:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656565029; cv=none;
        d=google.com; s=arc-20160816;
        b=ROmFUU+k/D0esloz7fHJBudUcv4jj+eFrKjQZzrX2yLMuLv9f6gVBwCEzZYKWkbhGX
         vAGyraJ7Jt0624gETMUaD4t0e7l4cYvfg49KoL6SWUnd1736L6Jm89UmMFd1OXlSaZ5A
         AtBr95sWRaHDjpRxD1U90SrJNKffKJk1EmFSIS0ySuiBugJ+qoVf6ktUxjtctiGGePV6
         Yq2++6QqUsgddlndv5jomCoaX9PDRGc0HsfDOHVYvbODxEBfZwb/VRlRntudcYA1z+ul
         0qoolG2gLlXQ6SG4zw/o8vqh/y0pR3rsw+ys2K58WU9dAfSz3m8aAaAo90rAB9jhtO9C
         wY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=A/Wf6r7zbHLpZS0FFcI7CmFfuoGucjTjc2UuF1IBdNQ=;
        b=n5oHohH97PhE2jjnx4i4vT3u29O5cQIWn6sKkUP+JLDtGlYj47cLgUCrWvByQdxsCl
         VnTXKi253L+yYsOwdduZWwr54QmOj2nCqfeuGl4yzPEMOR6i04KrXFzMMTpO8w9IUW2H
         zpiYztkrfAr1iQOFcuGy8vxemLUXH7Vv2HBkNd4+33LYj4xvO/a1bNEr1i6eJbgKgNCC
         GgirHazHZmt/8C1IR1UjRook4LmCW7q6Q1KpBVmgkfhBUxLEMJXZq5P03NR5OhGsZIWc
         fjH3IgiPRo9Y5QIJWzfZdRYvormJw5tHam0VQPlsdivRvnBxl3WDbDVXrzXUDMR6y69i
         NsdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=f3sTplNp;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=Ufe3xdsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h184-20020a379ec1000000b006a461f1745esi9449678qke.162.2022.06.29.21.57.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 21:57:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=f3sTplNp;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=Ufe3xdsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6mEm-00032U-0s
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 00:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9u-000376-B4; Thu, 30 Jun 2022 00:52:06 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:33559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9p-00070q-Fv; Thu, 30 Jun 2022 00:52:06 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 20BCE2B058FA;
 Thu, 30 Jun 2022 00:51:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 30 Jun 2022 00:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564718; x=1656568318; bh=A/
 Wf6r7zbHLpZS0FFcI7CmFfuoGucjTjc2UuF1IBdNQ=; b=f3sTplNpgyViit2Wms
 Fr4PGXxV8/b3x6MCD9t7+LPq6f/KIo9fBo4/yU8OXrYVdfCjsf2z6/LKj/vnCYPZ
 kL36xD91HRs4DdHXrZLazKb5jhdLPRZlNgUshGCXAtSYfxWj+mnTz8l2my0i2rw1
 Wt8+08ePnHwgf6fEh8s6qfxtDXzwJsNczD4CgzPRR+4/K4NVpq8rD+PBfQ5u8vp5
 SSFWWgF29y7PxAS1tSu6c1J4Hn8/tU6uIp+9wB5OXi7ID+9y2Cb/XjMBgiG8sxw9
 wt31YPqAaVD43LCN7vRMG1tWwnwisxy6Xwws7NCliDZyOH+rCSnd1rtbvxHQ9DbB
 5uNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564718; x=1656568318; bh=A/W
 f6r7zbHLpZS0FFcI7CmFfuoGucjTjc2UuF1IBdNQ=; b=Ufe3xdsKcoUfbhjUKQg
 +TUVZrGASyKj9ZKd+eCmGuyZYjVHdfDESPD/GZA+D5xPfBdEZORFFvlZMp9aSNe4
 totbIphd9L+UfR4rUt3bhidji5i8DYeIOKtAG5oEg6EmqyQ+/CmyFsIDimJTa8hx
 F+zhuh3Lw2lFb3OO+wOHp+rmpZniYU01OqBhl6ild8O7ukBeRWrobPDxwMqlsenu
 /qE/GZ7iwdFwgyqUwF8PHGG4GaCXDWqkIsuO1llffFSOtmBwyjeJD+0MO7oB7twz
 CPMoM7RcAlqh2ZFowUTKsanqeQQGrZIynhpfBwm/Wmm0HWNRWRKGRsdMSwOQnL1M
 PWw==
X-ME-Sender: <xms:7iu9YsbEcLQgCMTwib5horNrLOynB4rCf_Zu2sLx4TLwg3sIFiq2tw>
 <xme:7iu9YnbIS4evmgzRvUzfTb58PWcNaA5yrgbZ1mUkEPmqWt2uR3tPNzmenSZWa8S9W
 rYCm0mn15ocFkDWNSA>
X-ME-Received: <xmr:7iu9Ym-2hsnJ5q3zX4Pw2tfHo_meSYSTbRZarccGgzGZtYXIliH0dZdunvdSuwh9ONwQ8LBaL89r6mzmS4eJ0DtzgOrJDbti>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeektefhieevgfduvdeiueetteegtdeuueevieelffevueevveehhedukeejtdek
 teenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
 esphhjugdruggvvh
X-ME-Proxy: <xmx:7iu9YmrTeoswE7BjzJUJhNK25pBBOBUNdL7k8iiizq7tsZOUW5h5QQ>
 <xmx:7iu9YnoEOcutm2wxiYR4Bo9KfcChD7JlXBj98Fw617v562b82EfRzQ>
 <xmx:7iu9YkQgqy6XTQhamXzUM_yeuGkWjBgRM5ziUv5f_hlVvRdXzU497g>
 <xmx:7iu9YrcYnLpU0wzchm7WcdzRMUCeM7nSBGJEJejkVoOapLUWkNu-BKJz-qs>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:51:57 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 07/14] hw/i2c/aspeed: Add new-registers DMA slave mode RX
 support
Date: Wed, 29 Jun 2022 21:51:26 -0700
Message-Id: <20220630045133.32251-8-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9uT5iMOF1yd1

From: Peter Delevoryas <pdel@fb.com>

This commit adds support for DMA RX in slave mode while using the new
register set in the AST2600 and AST1030. This patch also pretty much
assumes packet mode is enabled, I'm not sure if this will work in DMA
step mode.

This is particularly useful for testing IPMB exchanges between Zephyr
and external devices, which requires multi-master I2C support and DMA in
the new register mode, because the Zephyr drivers from Aspeed use DMA in
the new mode by default. The Zephyr drivers are also using packet mode.

The typical sequence of events for receiving data in DMA slave + packet
mode is that the Zephyr firmware will configure the slave address
register with an address to receive on and configure the bus's function
control register to enable master mode and slave mode simultaneously at
startup, before any transfers are initiated.

RX DMA is enabled in the slave mode command register, and the slave RX
DMA buffer address and slave RX DMA buffer length are set. TX DMA is not
covered in this patch.

When the Aspeed I2C controller receives data from some other I2C master,
it will reset the I2CS_DMA_LEN RX_LEN value to zero, then buffer
incoming data in the RX DMA buffer while incrementing the I2CC_DMA_ADDR
address counter and decrementing the I2CC_DMA_LEN counter. It will also
update the I2CS_DMA_LEN RX_LEN value along the way.

Once all the data has been received, the bus controller will raise an
interrupt indicating a packet command was completed, the slave address
matched, a normal stop condition was seen, and the transfer was an RX
operation.

If the master sent a NACK instead of a normal stop condition, or the
transfer timed out, then a slightly different set of interrupt status
values would be set. Those conditions are not handled in this commit.

The Zephyr firmware then collects data from the RX DMA buffer and clears
the status register by writing the PKT_MODE_EN bit to the status
register. In packet mode, clearing the packet mode interrupt enable bit
also clears most of the other interrupt bits automatically (except for a
few bits above it).

Note: if the master transmit or receive functions were in use
simultaneously with the slave mode receive functionality, then the
master mode functions may have raised the interrupt line for the bus
before the DMA slave transfer is complete. It's important to have the
slave's interrupt status register clear throughout the receive
operation, and if the slave attempts to raise the interrupt before the
master interrupt status is cleared, then it needs to re-raise the
interrupt once the master interrupt status is cleared. (And vice-versa).
That's why in this commit, when the master interrupt status is cleared
and the interrupt line is lowered, we call the slave interrupt _raise_
function, to see if the interrupt was pending. (And again, vice-versa).

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c         | 133 ++++++++++++++++++++++++++++++++----
 include/hw/i2c/aspeed_i2c.h |   3 +
 2 files changed, 124 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 8a8514586f..fc8b6b62cf 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -78,6 +78,18 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
     }
 }
 
+static inline void aspeed_i2c_bus_raise_slave_interrupt(AspeedI2CBus *bus)
+{
+    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
+
+    if (!bus->regs[R_I2CS_INTR_STS]) {
+        return;
+    }
+
+    bus->controller->intr_status |= 1 << bus->id;
+    qemu_irq_raise(aic->bus_get_irq(bus));
+}
+
 static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset,
                                         unsigned size)
 {
@@ -140,8 +152,17 @@ static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CM_DMA_LEN_STS:
     case A_I2CC_DMA_ADDR:
     case A_I2CC_DMA_LEN:
+
+    case A_I2CS_DEV_ADDR:
+    case A_I2CS_DMA_RX_ADDR:
+    case A_I2CS_DMA_LEN:
+    case A_I2CS_CMD:
+    case A_I2CS_INTR_CTRL:
+    case A_I2CS_DMA_LEN_STS:
         /* Value is already set, don't do anything. */
         break;
+    case A_I2CS_INTR_STS:
+        break;
     case A_I2CM_CMD:
         value = SHARED_FIELD_DP32(value, BUS_BUSY_STS, i2c_bus_busy(bus->bus));
         break;
@@ -547,12 +568,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
 
     switch (offset) {
     case A_I2CC_FUN_CTRL:
-        if (SHARED_FIELD_EX32(value, SLAVE_EN)) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                          __func__);
-            break;
-        }
-        bus->regs[R_I2CC_FUN_CTRL] = value & 0x007dc3ff;
+        bus->regs[R_I2CC_FUN_CTRL] = value;
         break;
     case A_I2CC_AC_TIMING:
         bus->regs[R_I2CC_AC_TIMING] = value & 0x1ffff0ff;
@@ -580,6 +596,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
                 bus->controller->intr_status &= ~(1 << bus->id);
                 qemu_irq_lower(aic->bus_get_irq(bus));
             }
+            aspeed_i2c_bus_raise_slave_interrupt(bus);
             break;
         }
         bus->regs[R_I2CM_INTR_STS] &= ~(value & 0xf007f07f);
@@ -668,15 +685,53 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CC_DMA_LEN:
         /* RO */
         break;
-    case A_I2CS_DMA_LEN_STS:
-    case A_I2CS_DMA_TX_ADDR:
-    case A_I2CS_DMA_RX_ADDR:
     case A_I2CS_DEV_ADDR:
+        bus->regs[R_I2CS_DEV_ADDR] = value;
+        break;
+    case A_I2CS_DMA_RX_ADDR:
+        bus->regs[R_I2CS_DMA_RX_ADDR] = value;
+        break;
+    case A_I2CS_DMA_LEN:
+        assert(FIELD_EX32(value, I2CS_DMA_LEN, TX_BUF_LEN) == 0);
+        if (FIELD_EX32(value, I2CS_DMA_LEN, RX_BUF_LEN_W1T)) {
+            ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN, RX_BUF_LEN,
+                             FIELD_EX32(value, I2CS_DMA_LEN, RX_BUF_LEN));
+        } else {
+            bus->regs[R_I2CS_DMA_LEN] = value;
+        }
+        break;
+    case A_I2CS_CMD:
+        if (FIELD_EX32(value, I2CS_CMD, W1_CTRL)) {
+            bus->regs[R_I2CS_CMD] |= value;
+        } else {
+            bus->regs[R_I2CS_CMD] = value;
+        }
+        i2c_slave_set_address(bus->slave, bus->regs[R_I2CS_DEV_ADDR]);
+        break;
     case A_I2CS_INTR_CTRL:
+        bus->regs[R_I2CS_INTR_CTRL] = value;
+        break;
+
     case A_I2CS_INTR_STS:
-    case A_I2CS_CMD:
-    case A_I2CS_DMA_LEN:
-        qemu_log_mask(LOG_UNIMP, "%s: Slave mode is not implemented\n",
+        if (ARRAY_FIELD_EX32(bus->regs, I2CS_INTR_CTRL, PKT_CMD_DONE)) {
+            if (ARRAY_FIELD_EX32(bus->regs, I2CS_INTR_STS, PKT_CMD_DONE) &&
+                FIELD_EX32(value, I2CS_INTR_STS, PKT_CMD_DONE)) {
+                bus->regs[R_I2CS_INTR_STS] &= 0xfffc0000;
+            }
+        } else {
+            bus->regs[R_I2CS_INTR_STS] &= ~value;
+        }
+        if (!bus->regs[R_I2CS_INTR_STS]) {
+            bus->controller->intr_status &= ~(1 << bus->id);
+            qemu_irq_lower(aic->bus_get_irq(bus));
+        }
+        aspeed_i2c_bus_raise_interrupt(bus);
+        break;
+    case A_I2CS_DMA_LEN_STS:
+        bus->regs[R_I2CS_DMA_LEN_STS] = 0;
+        break;
+    case A_I2CS_DMA_TX_ADDR:
+        qemu_log_mask(LOG_UNIMP, "%s: Slave mode DMA TX is not implemented\n",
                       __func__);
         break;
     default:
@@ -1037,6 +1092,39 @@ static const TypeInfo aspeed_i2c_info = {
     .abstract   = true,
 };
 
+static int aspeed_i2c_bus_new_slave_event(AspeedI2CBus *bus,
+                                          enum i2c_event event)
+{
+    switch (event) {
+    case I2C_START_SEND_ASYNC:
+        if (!SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CS_CMD, RX_DMA_EN)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Slave mode RX DMA is not enabled\n", __func__);
+            return -1;
+        }
+        ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN, 0);
+        bus->regs[R_I2CC_DMA_ADDR] =
+            ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_RX_ADDR, ADDR);
+        bus->regs[R_I2CC_DMA_LEN] =
+            ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_LEN, RX_BUF_LEN) + 1;
+        i2c_ack(bus->bus);
+        break;
+    case I2C_FINISH:
+        ARRAY_FIELD_DP32(bus->regs, I2CS_INTR_STS, PKT_CMD_DONE, 1);
+        ARRAY_FIELD_DP32(bus->regs, I2CS_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CS_INTR_STS, NORMAL_STOP, 1);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CS_INTR_STS, RX_DONE, 1);
+        aspeed_i2c_bus_raise_slave_interrupt(bus);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: i2c event %d unimplemented\n",
+                      __func__, event);
+        return -1;
+    }
+
+    return 0;
+}
+
 static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(slave));
@@ -1045,6 +1133,10 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
     uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
     uint32_t value;
 
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return aspeed_i2c_bus_new_slave_event(bus, event);
+    }
+
     switch (event) {
     case I2C_START_SEND_ASYNC:
         value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
@@ -1073,6 +1165,19 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
     return 0;
 }
 
+static void aspeed_i2c_bus_new_slave_send_async(AspeedI2CBus *bus, uint8_t data)
+{
+    assert(address_space_write(&bus->controller->dram_as,
+                               bus->regs[R_I2CC_DMA_ADDR],
+                               MEMTXATTRS_UNSPECIFIED, &data, 1) == MEMTX_OK);
+
+    bus->regs[R_I2CC_DMA_ADDR]++;
+    bus->regs[R_I2CC_DMA_LEN]--;
+    ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN,
+                     ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN) + 1);
+    i2c_ack(bus->bus);
+}
+
 static void aspeed_i2c_bus_slave_send_async(I2CSlave *slave, uint8_t data)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(slave));
@@ -1080,6 +1185,10 @@ static void aspeed_i2c_bus_slave_send_async(I2CSlave *slave, uint8_t data)
     uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
 
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return aspeed_i2c_bus_new_slave_send_async(bus, data);
+    }
+
     SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, data);
     SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
 
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index ba148b2f6d..300a89b343 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -174,6 +174,8 @@ REG32(I2CM_DMA_LEN, 0x1c)
     FIELD(I2CM_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
     FIELD(I2CM_DMA_LEN, TX_BUF_LEN, 0, 11)
 REG32(I2CS_INTR_CTRL, 0x20)
+    FIELD(I2CS_INTR_CTRL, PKT_CMD_FAIL, 17, 1)
+    FIELD(I2CS_INTR_CTRL, PKT_CMD_DONE, 16, 1)
 REG32(I2CS_INTR_STS, 0x24)
     /* 31:29 shared with I2CD_INTR_STS[31:29] */
     FIELD(I2CS_INTR_STS, SLAVE_PARKING_STS, 24, 2)
@@ -184,6 +186,7 @@ REG32(I2CS_INTR_STS, 0x24)
     FIELD(I2CS_INTR_STS, PKT_CMD_FAIL, 17, 1)
     FIELD(I2CS_INTR_STS, PKT_CMD_DONE, 16, 1)
     /* 14:0 shared with I2CD_INTR_STS[14:0] */
+    FIELD(I2CS_INTR_STS, SLAVE_ADDR_RX_MATCH, 7, 1)
 REG32(I2CS_CMD, 0x28)
     FIELD(I2CS_CMD, W1_CTRL, 31, 1)
     FIELD(I2CS_CMD, PKT_MODE_ACTIVE_ADDR, 17, 2)
-- 
2.37.0

