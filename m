Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5938066lfy;
        Mon, 3 Aug 2020 03:58:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVDIReD/D9EcfkVdRvdi3UYe5krFWs6VEjEa9NVFLmgd9u70vmq+VF39DjGo0RxA00+apI
X-Received: by 2002:a25:d44e:: with SMTP id m75mr24351390ybf.157.1596452319452;
        Mon, 03 Aug 2020 03:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596452319; cv=none;
        d=google.com; s=arc-20160816;
        b=Nssa+B4sFq0HBkb5/fmpGjjcahlvgEw7tsghflI2b85RE+jQ0DvE+mwT20ULRu421Z
         bZ1LBNlhbkAQ6AZxBcWcIASSLQuN4MvLTgToGbgjAfegG5j53YSlaIPyzd7Oz6UHf0kP
         JEZ9EKVF9LP9In/hG3V9fs6uAfxGtyEXwoiDJLpJPi/azpGRZUT1S/T5VOC/iHQZ7W1V
         xf5+6EdBHW6KRmAXyLYx+jp/vfvar7p5DpcYTRWf5dzzDrdzO8nDLdKCNerENR7ozaJa
         aO5oJhLbFlWsy0wFj2wG+0No8CUIkotxvmqDUbmkvb2QJdP60yHMZr/lLzGpZghNFIwN
         ePWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=g3DyF6kevoJjleeMCTdWs3EQHtJ+0mrixjxdzUsE41I=;
        b=i5lL/MHqmI7gFC9sMpsiUyEJMG/X4DfiS1nJCOo5o0IPdDi6lXGYwb3SlNJiVcc6TL
         T7dwG/A1zOM88nK5Rj+LRqdGkrrGQpVsP1yIoGyYjjdkcHVtd83+Zb4+vWDzVrFDJp3n
         aKw0JdeXkUjvpqNnxuHu0HdKtz627llCaHtfPsS68TSoBFkloYbwfB4QQ9hSzjE88Za5
         cVPe2av7cEpe1ISqiFtBkwNIC8jlfBdDf7/zIRk1evaH++jFnAR4vgs3SOuLmtaye0vW
         TvJSATMNeYlKVpMF2hdhn3rNgZDhmIBVB16mge5gklGADhTg4UmO7tctiaGmm/0Bp/+X
         nhoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="V/N5clIh";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z19si5101376ybi.349.2020.08.03.03.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 03:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="V/N5clIh";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2YAw-0004a7-O0
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 06:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2Y9I-0002Vf-OJ; Mon, 03 Aug 2020 06:56:56 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2Y9H-000271-3f; Mon, 03 Aug 2020 06:56:56 -0400
Received: by mail-wr1-x441.google.com with SMTP id r2so28687911wrs.8;
 Mon, 03 Aug 2020 03:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g3DyF6kevoJjleeMCTdWs3EQHtJ+0mrixjxdzUsE41I=;
 b=V/N5clIh/9GQ2oVuu4ZfmxUKRHvWV5zfqJmnHJW0O4cQqR2Az4CkEbgxAqSZIXQ9CJ
 oPojMbd7Nx7wdjLZxI0hauMwQz2TbbYOR3DTIsNqDbWFx1QmBktVymFOQGhojZDOPoSV
 nLT3njdKyqDWkKNopRDP9HZ4HlvemtOg8Q3NJClHEcwNuCd23CHlLPiQiFKkM15BRyUA
 oz0LXWDd2T0mCmKsOMqfkkEGTv728Z4zrUWLRKPJqq71WoMYm3DXxdlPxzx/WYZMq6Ty
 iFQ0OvycigAW2F5o8deg+IdB2VZPqh79ge201xforVpJ8zuPaYAI+5XBomeqqxRYeNT5
 vlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g3DyF6kevoJjleeMCTdWs3EQHtJ+0mrixjxdzUsE41I=;
 b=q/AupQFdNAP3ZV5V2TZ00jZHh/e/x9HH6a6l+nmkz+MqkSqLQPLBsHol/Cv6qLZPNK
 qy2jzs+d1LTUQ0CnI5d3/MQkrK/IbiFRkBd7iM1SYiqf8dAytgSUYL6L5YnqFx3QjDYW
 qp7anx3CgyLnXJPFB9EUseArzysUYI/LaM0F23wDA0dw1hC6p9HqeqKQwH45vaK64MA+
 f6TejjdmkIiE91dednUpZN9FwK/uztkNiRcKw02CqzRrDZHgU2wFWFwKesDQob5MMW0S
 V2Qw6vshd+hiXHPWwOBQ53U6p6fia0VHE5eIrxPQDmaSQd9i+tUU8A2RJIdBNvEXEpeG
 GTrQ==
X-Gm-Message-State: AOAM532pLavVlEhZmPywQKkE6PhkZGMIYVP6027VccB2koB+qPmq6Xqv
 AegV3+WTmgwi2tZjTasJn58Z03hw
X-Received: by 2002:a5d:6910:: with SMTP id t16mr15577591wru.178.1596452212964; 
 Mon, 03 Aug 2020 03:56:52 -0700 (PDT)
Received: from localhost.localdomain (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id z11sm23103477wrw.93.2020.08.03.03.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 03:56:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1? 2/4] hw/arm/xilinx_zynq: Call qdev_connect_clock_in()
 before DeviceRealize
Date: Mon,  3 Aug 2020 12:56:45 +0200
Message-Id: <20200803105647.22223-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200803105647.22223-1-f4bug@amsat.org>
References: <20200803105647.22223-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GWfRWtUDQBSQ

Clock canonical name is set in device_set_realized (see the block
added to hw/core/qdev.c in commit 0e6934f264).
If we connect a clock after the device is realized, this code is
not executed. This is currently not a problem as this name is only
used for trace events, however this disrupt tracing.

Fix by calling qdev_connect_clock_in() before realizing.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xilinx_zynq.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index cf6d9757b5..969ef0727c 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -222,18 +222,18 @@ static void zynq_init(MachineState *machine)
                           1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2aa,
                           0);
 
-    /* Create slcr, keep a pointer to connect clocks */
-    slcr = qdev_new("xilinx,zynq_slcr");
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(slcr), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(slcr), 0, 0xF8000000);
-
     /* Create the main clock source, and feed slcr with it */
     zynq_machine->ps_clk = CLOCK(object_new(TYPE_CLOCK));
     object_property_add_child(OBJECT(zynq_machine), "ps_clk",
                               OBJECT(zynq_machine->ps_clk));
     object_unref(OBJECT(zynq_machine->ps_clk));
     clock_set_hz(zynq_machine->ps_clk, PS_CLK_FREQUENCY);
+
+    /* Create slcr, keep a pointer to connect clocks */
+    slcr = qdev_new("xilinx,zynq_slcr");
     qdev_connect_clock_in(slcr, "ps_clk", zynq_machine->ps_clk);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(slcr), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(slcr), 0, 0xF8000000);
 
     dev = qdev_new(TYPE_A9MPCORE_PRIV);
     qdev_prop_set_uint32(dev, "num-cpu", 1);
@@ -257,19 +257,19 @@ static void zynq_init(MachineState *machine)
     dev = qdev_new(TYPE_CADENCE_UART);
     busdev = SYS_BUS_DEVICE(dev);
     qdev_prop_set_chr(dev, "chardev", serial_hd(0));
+    qdev_connect_clock_in(dev, "refclk",
+                          qdev_get_clock_out(slcr, "uart0_ref_clk"));
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, 0xE0000000);
     sysbus_connect_irq(busdev, 0, pic[59 - IRQ_OFFSET]);
-    qdev_connect_clock_in(dev, "refclk",
-                          qdev_get_clock_out(slcr, "uart0_ref_clk"));
     dev = qdev_new(TYPE_CADENCE_UART);
     busdev = SYS_BUS_DEVICE(dev);
     qdev_prop_set_chr(dev, "chardev", serial_hd(1));
+    qdev_connect_clock_in(dev, "refclk",
+                          qdev_get_clock_out(slcr, "uart1_ref_clk"));
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, 0xE0001000);
     sysbus_connect_irq(busdev, 0, pic[82 - IRQ_OFFSET]);
-    qdev_connect_clock_in(dev, "refclk",
-                          qdev_get_clock_out(slcr, "uart1_ref_clk"));
 
     sysbus_create_varargs("cadence_ttc", 0xF8001000,
             pic[42-IRQ_OFFSET], pic[43-IRQ_OFFSET], pic[44-IRQ_OFFSET], NULL);
-- 
2.21.3

