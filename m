Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3814223ejc;
        Wed, 11 Jan 2023 00:42:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtUZv88uQ3toxDaes4+bMyvb2tBeCTJ96yL2LKzalAyMUWXkYcycdIQ93W0p6rSenSneVFE
X-Received: by 2002:a05:622a:1e85:b0:3a6:8b3a:6450 with SMTP id bz5-20020a05622a1e8500b003a68b3a6450mr122533364qtb.54.1673426540271;
        Wed, 11 Jan 2023 00:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673426540; cv=none;
        d=google.com; s=arc-20160816;
        b=ae02QBozbluRDcjVP/HrpioVoAvm9I+9sYMdVVvs1aihtfrwzWJPX+27Xly1hWoyCM
         uzTwXy90CVG4sdoz75I8kV090GbhklASlEybz9n/LLrVc7/DfkW8T7iOqFxyVRmrKDwE
         z79YsM+H+gQ6UZbEJCFxQNgfI7IEPxex9WxIMsUc/UEcKfOu4Prvd6hWTdOG13beUCx0
         36Xv6LsKgr3JfU9J0DBkYgp5TjPL41dkestrAbSOqnWrIfjoAdRKmqCG68XZJ8K7elwR
         CJvA3wKX/fTXlVUGfbK7HKb9yDeNKUd8BwtbAlRJ0OiRrWjlE1NyOoYEMd4/TYZcZSvc
         Uaqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rKS/GHlEaZ2OtVrGcoOQVFe05GPfIcUSWzwlFDllFlA=;
        b=JZ8EHdRXVMZ8S3QzWrn/6Fj8hx11XRFvMluwkpHfX4zqzMX+HpLtYLyaSX+lO87ZDk
         R/39mQ/gDN3b/3JFDWkSo4OZFPDU9f9K38bhG8j+Tz0GXmwSiQBye8UX241cTh9Sivqq
         2c7QGbafqKfzuouH1DWjjM/g+0AOB/12L+GXi993/8oCMUcducJppBv5e3LkkLBplq6r
         L9X0pzXBlVbtRdEA9a3bvpJ6hWtYBvB3lohvka0qB25UVaF4XijtB0L6oU3trWwKcft5
         7et2YwM1fmzvM/feDE5ER11xLmF5pvrqKW3Yags3SFCZvXpLi4Xsn3/zgqVC1iB19LYv
         D21g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jzq9CvL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16-20020a05620a125000b006fed662f7cbsi7181631qkl.371.2023.01.11.00.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 00:42:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jzq9CvL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFWdr-0004fy-57; Wed, 11 Jan 2023 03:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWdm-0004bc-FT
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 03:39:25 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWdi-0005PD-1h
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 03:39:20 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so13786897wms.0
 for <qemu-arm@nongnu.org>; Wed, 11 Jan 2023 00:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKS/GHlEaZ2OtVrGcoOQVFe05GPfIcUSWzwlFDllFlA=;
 b=Jzq9CvL1hNw4kGR/D4Ij13V/FJJYjErVrNPxR+7bLEiD6Tqoz8OVFuhQDSOrGQb08g
 txVBLcQmd1Hv0HxsCVM+TAdOHBkjIRf2FhyAvRk9u8fo3qoDk7CevA7nKO+SKMY4D2zo
 3I/CBktD68uWYM7CnegAWNAj7y04jvpBZVII+GQtRinG4RIaQcN4TeXFy3Z6i1fxiqaG
 O+dFue9x2RkW4EBGHwHMEzTFYxyTiVW8AmD31+lfuGLhe4R4Uq5LOBYz+B1daJ//3P+T
 uL0CyW+QUqgpXd/SYNdrtSum4OMBNbOKSCv6BI4Wjb7ejSwxgDTGNHU3TVO+xdGWbf1Q
 42qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rKS/GHlEaZ2OtVrGcoOQVFe05GPfIcUSWzwlFDllFlA=;
 b=kpmHMRTDL74xRAlalK527QV9Xba9m6dJyCrjKX+udBa7PVFPnu7GlbX9il/uWMmAI8
 H55dUvBfqJb/iKalfdvzHVaqUIJ25kLe2NbeAY0hA21FJsY8cC5f0RDZ7rSz25gdGBG0
 kYdUqvS2Wg00DRAqn6AknnkeOotUgq8nBNWGKUFzmjTFBxhEcb7vf+Q0QEFZ4MZyGJoB
 oA6+4cwXk9mZ4SD8sblKcCoNqJXblpVVtt/V34zPar2t7BYoN/tNNNFcYwKSUoP4EPSp
 TN2gZ7j7dc97EthuwUlw6z0jIkLddqBXRDYw85kcaQgVu7jkiixprMKCjVFkztbyX3Z/
 BgLg==
X-Gm-Message-State: AFqh2koHqFzNUxPCjA5iVjuD4QwJcTFvv8WDBAvboLzgaUI6Qsq6QJHH
 y+lS71V/FaOw69xV9al9cgbLXA==
X-Received: by 2002:a05:600c:5405:b0:3da:632:a8d with SMTP id
 he5-20020a05600c540500b003da06320a8dmr1703139wmb.10.1673426356222; 
 Wed, 11 Jan 2023 00:39:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a05600c491c00b003d9bd56e9c1sm16525824wmp.11.2023.01.11.00.39.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:39:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/4] hw: Remove hardcoded tabs (code style)
Date: Wed, 11 Jan 2023 09:39:06 +0100
Message-Id: <20230111083909.42624-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111083909.42624-1-philmd@linaro.org>
References: <20230111083909.42624-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k4/WzPH4hhBt

We are going to modify this code, fix its style first to avoid
the following checkpatch.pl violations:

  ERROR: code indent should never use tabs
  ERROR: space prohibited between function name and open parenthesis '('

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/dma/etraxfs_dma.c | 196 +++++++++++++++++++++----------------------
 hw/misc/mst_fpga.c   | 162 ++++++++++++++++++-----------------
 2 files changed, 175 insertions(+), 183 deletions(-)

diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index c4334e87bf..88d303ba4a 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -269,34 +269,34 @@ static void channel_load_c(struct fs_dma_ctrl *ctrl, int c)
 
 static void channel_load_d(struct fs_dma_ctrl *ctrl, int c)
 {
-	hwaddr addr = channel_reg(ctrl, c, RW_SAVED_DATA);
+    hwaddr addr = channel_reg(ctrl, c, RW_SAVED_DATA);
 
-	/* Load and decode. FIXME: handle endianness.  */
-	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
+    /* Load and decode. FIXME: handle endianness.  */
+    D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
     cpu_physical_memory_read(addr, &ctrl->channels[c].current_d,
                              sizeof(ctrl->channels[c].current_d));
 
-	D(dump_d(c, &ctrl->channels[c].current_d));
-	ctrl->channels[c].regs[RW_DATA] = addr;
+    D(dump_d(c, &ctrl->channels[c].current_d));
+    ctrl->channels[c].regs[RW_DATA] = addr;
 }
 
 static void channel_store_c(struct fs_dma_ctrl *ctrl, int c)
 {
-	hwaddr addr = channel_reg(ctrl, c, RW_GROUP_DOWN);
+    hwaddr addr = channel_reg(ctrl, c, RW_GROUP_DOWN);
 
-	/* Encode and store. FIXME: handle endianness.  */
-	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
-	D(dump_d(c, &ctrl->channels[c].current_d));
+    /* Encode and store. FIXME: handle endianness.  */
+    D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
+    D(dump_d(c, &ctrl->channels[c].current_d));
     cpu_physical_memory_write(addr, &ctrl->channels[c].current_c,
                               sizeof(ctrl->channels[c].current_c));
 }
 
 static void channel_store_d(struct fs_dma_ctrl *ctrl, int c)
 {
-	hwaddr addr = channel_reg(ctrl, c, RW_SAVED_DATA);
+    hwaddr addr = channel_reg(ctrl, c, RW_SAVED_DATA);
 
-	/* Encode and store. FIXME: handle endianness.  */
-	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
+    /* Encode and store. FIXME: handle endianness.  */
+    D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
     cpu_physical_memory_write(addr, &ctrl->channels[c].current_d,
                               sizeof(ctrl->channels[c].current_d));
 }
@@ -574,46 +574,43 @@ static inline int channel_in_run(struct fs_dma_ctrl *ctrl, int c)
 
 static uint32_t dma_rinvalid (void *opaque, hwaddr addr)
 {
-        hw_error("Unsupported short raccess. reg=" TARGET_FMT_plx "\n", addr);
-        return 0;
+    hw_error("Unsupported short raccess. reg=" TARGET_FMT_plx "\n", addr);
+    return 0;
 }
 
-static uint64_t
-dma_read(void *opaque, hwaddr addr, unsigned int size)
+static uint64_t dma_read(void *opaque, hwaddr addr, unsigned int size)
 {
-        struct fs_dma_ctrl *ctrl = opaque;
-	int c;
-	uint32_t r = 0;
+    struct fs_dma_ctrl *ctrl = opaque;
+    int c;
+    uint32_t r = 0;
 
-	if (size != 4) {
-		dma_rinvalid(opaque, addr);
-	}
+    if (size != 4) {
+        dma_rinvalid(opaque, addr);
+    }
 
-	/* Make addr relative to this channel and bounded to nr regs.  */
-	c = fs_channel(addr);
-	addr &= 0xff;
-	addr >>= 2;
-	switch (addr)
-	{
-		case RW_STAT:
-			r = ctrl->channels[c].state & 7;
-			r |= ctrl->channels[c].eol << 5;
-			r |= ctrl->channels[c].stream_cmd_src << 8;
-			break;
+    /* Make addr relative to this channel and bounded to nr regs.  */
+    c = fs_channel(addr);
+    addr &= 0xff;
+    addr >>= 2;
+    switch (addr) {
+    case RW_STAT:
+        r = ctrl->channels[c].state & 7;
+        r |= ctrl->channels[c].eol << 5;
+        r |= ctrl->channels[c].stream_cmd_src << 8;
+        break;
 
-		default:
-			r = ctrl->channels[c].regs[addr];
-			D(printf ("%s c=%d addr=" TARGET_FMT_plx "\n",
-				  __func__, c, addr));
-			break;
-	}
-	return r;
+    default:
+        r = ctrl->channels[c].regs[addr];
+        D(printf("%s c=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
+        break;
+    }
+    return r;
 }
 
 static void
 dma_winvalid (void *opaque, hwaddr addr, uint32_t value)
 {
-        hw_error("Unsupported short waccess. reg=" TARGET_FMT_plx "\n", addr);
+    hw_error("Unsupported short waccess. reg=" TARGET_FMT_plx "\n", addr);
 }
 
 static void
@@ -625,71 +622,68 @@ dma_update_state(struct fs_dma_ctrl *ctrl, int c)
 		ctrl->channels[c].state = RST;
 }
 
-static void
-dma_write(void *opaque, hwaddr addr,
-	  uint64_t val64, unsigned int size)
+static void dma_write(void *opaque, hwaddr addr, uint64_t val64,
+                      unsigned int size)
 {
-        struct fs_dma_ctrl *ctrl = opaque;
-	uint32_t value = val64;
-	int c;
+    struct fs_dma_ctrl *ctrl = opaque;
+    uint32_t value = val64;
+    int c;
 
-	if (size != 4) {
-		dma_winvalid(opaque, addr, value);
-	}
+    if (size != 4) {
+        dma_winvalid(opaque, addr, value);
+    }
 
-        /* Make addr relative to this channel and bounded to nr regs.  */
-	c = fs_channel(addr);
-        addr &= 0xff;
-        addr >>= 2;
-        switch (addr)
-	{
-		case RW_DATA:
-			ctrl->channels[c].regs[addr] = value;
-			break;
+    /* Make addr relative to this channel and bounded to nr regs.  */
+    c = fs_channel(addr);
+    addr &= 0xff;
+    addr >>= 2;
+    switch (addr) {
+    case RW_DATA:
+        ctrl->channels[c].regs[addr] = value;
+        break;
 
-		case RW_CFG:
-			ctrl->channels[c].regs[addr] = value;
-			dma_update_state(ctrl, c);
-			break;
-		case RW_CMD:
-			/* continue.  */
-			if (value & ~1)
-				printf("Invalid store to ch=%d RW_CMD %x\n",
-				       c, value);
-			ctrl->channels[c].regs[addr] = value;
-			channel_continue(ctrl, c);
-			break;
-
-		case RW_SAVED_DATA:
-		case RW_SAVED_DATA_BUF:
-		case RW_GROUP:
-		case RW_GROUP_DOWN:
-			ctrl->channels[c].regs[addr] = value;
-			break;
-
-		case RW_ACK_INTR:
-		case RW_INTR_MASK:
-			ctrl->channels[c].regs[addr] = value;
-			channel_update_irq(ctrl, c);
-			if (addr == RW_ACK_INTR)
-				ctrl->channels[c].regs[RW_ACK_INTR] = 0;
-			break;
-
-		case RW_STREAM_CMD:
-			if (value & ~1023)
-				printf("Invalid store to ch=%d "
-				       "RW_STREAMCMD %x\n",
-				       c, value);
-			ctrl->channels[c].regs[addr] = value;
-			D(printf("stream_cmd ch=%d\n", c));
-			channel_stream_cmd(ctrl, c, value);
-			break;
-
-	        default:
-			D(printf ("%s c=%d " TARGET_FMT_plx "\n",
-				__func__, c, addr));
-			break;
+    case RW_CFG:
+        ctrl->channels[c].regs[addr] = value;
+        dma_update_state(ctrl, c);
+        break;
+    case RW_CMD:
+        /* continue.  */
+        if (value & ~1) {
+            printf("Invalid store to ch=%d RW_CMD %x\n", c, value);
         }
+        ctrl->channels[c].regs[addr] = value;
+        channel_continue(ctrl, c);
+        break;
+
+    case RW_SAVED_DATA:
+    case RW_SAVED_DATA_BUF:
+    case RW_GROUP:
+    case RW_GROUP_DOWN:
+        ctrl->channels[c].regs[addr] = value;
+        break;
+
+    case RW_ACK_INTR:
+    case RW_INTR_MASK:
+        ctrl->channels[c].regs[addr] = value;
+        channel_update_irq(ctrl, c);
+        if (addr == RW_ACK_INTR) {
+            ctrl->channels[c].regs[RW_ACK_INTR] = 0;
+        }
+        break;
+
+    case RW_STREAM_CMD:
+        if (value & ~1023) {
+            printf("Invalid store to ch=%d RW_STREAMCMD %x\n", c, value);
+        }
+        ctrl->channels[c].regs[addr] = value;
+        D(printf("stream_cmd ch=%d\n", c));
+        channel_stream_cmd(ctrl, c, value);
+        break;
+
+    default:
+        D(printf("%s c=%d " TARGET_FMT_plx "\n", __func__, c, addr));
+        break;
+    }
 }
 
 static const MemoryRegionOps dma_ops = {
diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
index 2aaadfa966..87c09217a6 100644
--- a/hw/misc/mst_fpga.c
+++ b/hw/misc/mst_fpga.c
@@ -99,94 +99,92 @@ mst_fpga_set_irq(void *opaque, int irq, int level)
 }
 
 
-static uint64_t
-mst_fpga_readb(void *opaque, hwaddr addr, unsigned size)
+static uint64_t mst_fpga_readb(void *opaque, hwaddr addr, unsigned size)
 {
-	mst_irq_state *s = (mst_irq_state *) opaque;
+    mst_irq_state *s = (mst_irq_state *) opaque;
 
-	switch (addr) {
-	case MST_LEDDAT1:
-		return s->leddat1;
-	case MST_LEDDAT2:
-		return s->leddat2;
-	case MST_LEDCTRL:
-		return s->ledctrl;
-	case MST_GPSWR:
-		return s->gpswr;
-	case MST_MSCWR1:
-		return s->mscwr1;
-	case MST_MSCWR2:
-		return s->mscwr2;
-	case MST_MSCWR3:
-		return s->mscwr3;
-	case MST_MSCRD:
-		return s->mscrd;
-	case MST_INTMSKENA:
-		return s->intmskena;
-	case MST_INTSETCLR:
-		return s->intsetclr;
-	case MST_PCMCIA0:
-		return s->pcmcia0;
-	case MST_PCMCIA1:
-		return s->pcmcia1;
-	default:
-		printf("Mainstone - mst_fpga_readb: Bad register offset "
-			"0x" TARGET_FMT_plx "\n", addr);
-	}
-	return 0;
+    switch (addr) {
+    case MST_LEDDAT1:
+        return s->leddat1;
+    case MST_LEDDAT2:
+        return s->leddat2;
+    case MST_LEDCTRL:
+        return s->ledctrl;
+    case MST_GPSWR:
+        return s->gpswr;
+    case MST_MSCWR1:
+        return s->mscwr1;
+    case MST_MSCWR2:
+        return s->mscwr2;
+    case MST_MSCWR3:
+        return s->mscwr3;
+    case MST_MSCRD:
+        return s->mscrd;
+    case MST_INTMSKENA:
+        return s->intmskena;
+    case MST_INTSETCLR:
+        return s->intsetclr;
+    case MST_PCMCIA0:
+        return s->pcmcia0;
+    case MST_PCMCIA1:
+        return s->pcmcia1;
+    default:
+        printf("Mainstone - mst_fpga_readb: Bad register offset "
+            "0x" TARGET_FMT_plx "\n", addr);
+    }
+    return 0;
 }
 
-static void
-mst_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
-		unsigned size)
+static void mst_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
+                            unsigned size)
 {
-	mst_irq_state *s = (mst_irq_state *) opaque;
-	value &= 0xffffffff;
+    mst_irq_state *s = (mst_irq_state *) opaque;
+    value &= 0xffffffff;
 
-	switch (addr) {
-	case MST_LEDDAT1:
-		s->leddat1 = value;
-		break;
-	case MST_LEDDAT2:
-		s->leddat2 = value;
-		break;
-	case MST_LEDCTRL:
-		s->ledctrl = value;
-		break;
-	case MST_GPSWR:
-		s->gpswr = value;
-		break;
-	case MST_MSCWR1:
-		s->mscwr1 = value;
-		break;
-	case MST_MSCWR2:
-		s->mscwr2 = value;
-		break;
-	case MST_MSCWR3:
-		s->mscwr3 = value;
-		break;
-	case MST_MSCRD:
-		s->mscrd =  value;
-		break;
-	case MST_INTMSKENA:	/* Mask interrupt */
-		s->intmskena = (value & 0xFEEFF);
-		qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
-		break;
-	case MST_INTSETCLR:	/* clear or set interrupt */
-		s->intsetclr = (value & 0xFEEFF);
-		qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
-		break;
-		/* For PCMCIAx allow the to change only power and reset */
-	case MST_PCMCIA0:
-		s->pcmcia0 = (value & 0x1f) | (s->pcmcia0 & ~0x1f);
-		break;
-	case MST_PCMCIA1:
-		s->pcmcia1 = (value & 0x1f) | (s->pcmcia1 & ~0x1f);
-		break;
-	default:
-		printf("Mainstone - mst_fpga_writeb: Bad register offset "
-			"0x" TARGET_FMT_plx "\n", addr);
-	}
+    switch (addr) {
+    case MST_LEDDAT1:
+        s->leddat1 = value;
+        break;
+    case MST_LEDDAT2:
+        s->leddat2 = value;
+        break;
+    case MST_LEDCTRL:
+        s->ledctrl = value;
+        break;
+    case MST_GPSWR:
+        s->gpswr = value;
+        break;
+    case MST_MSCWR1:
+        s->mscwr1 = value;
+        break;
+    case MST_MSCWR2:
+        s->mscwr2 = value;
+        break;
+    case MST_MSCWR3:
+        s->mscwr3 = value;
+        break;
+    case MST_MSCRD:
+        s->mscrd =  value;
+        break;
+    case MST_INTMSKENA:    /* Mask interrupt */
+        s->intmskena = (value & 0xFEEFF);
+        qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
+        break;
+    case MST_INTSETCLR:    /* clear or set interrupt */
+        s->intsetclr = (value & 0xFEEFF);
+        qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
+        break;
+        /* For PCMCIAx allow the to change only power and reset */
+    case MST_PCMCIA0:
+        s->pcmcia0 = (value & 0x1f) | (s->pcmcia0 & ~0x1f);
+        break;
+    case MST_PCMCIA1:
+        s->pcmcia1 = (value & 0x1f) | (s->pcmcia1 & ~0x1f);
+        break;
+    default:
+        printf("Mainstone - mst_fpga_writeb: Bad register offset "
+               "0x" TARGET_FMT_plx "\n", addr);
+    }
 }
 
 static const MemoryRegionOps mst_fpga_ops = {
-- 
2.38.1

