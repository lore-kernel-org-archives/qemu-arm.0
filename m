Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp777986wru;
        Fri, 27 Jul 2018 07:38:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdqs1ba44bbYWdHarCww89dv6vGgVl/besIuBoESr9GJGL+seg7I7aaGAncldwi6iUOfj2O
X-Received: by 2002:a37:5c81:: with SMTP id q123-v6mr5865972qkb.8.1532702310778;
        Fri, 27 Jul 2018 07:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532702310; cv=none;
        d=google.com; s=arc-20160816;
        b=zoTRmq4HDibPR6VGObgn1lQ81rzNiQmANY5+K6frc156JHvUAujISvNGjDcNTjB4Lt
         686HVDotd689Y553qDP1rYxfD7c6Vv+p9mKB08/qKZx4LysqYqGNOCljmIEGbADrsyoB
         BTww8iO8W+Kz8bBTPmSyrg7WmUZah1z3qYV6LS3ZmBE91yhJS/hfAhCVDvr8Vepmp8k6
         yl7Dq/BCqgnoESmMsEo0sLdy2Q/2XSmWYrHX9m2ryHvIQ2F5MGVTRnMwnmMQIDGbtCnl
         OScF5luaTQ+EPVGyCwh3nYqh/fFR4Gofgb/+7VlHgrRg1/yQcpcglInSIleI8Gp2knLs
         5E+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=eOadbNkutgPfgoLvWBSTdGwlCk1AoycLB0/4BN3rnJ8=;
        b=kHbXvn43MUnSetobEqN3EUuVOyaY1GptilqaoJxGot8XAhUqaDZ0v8caxNXKXrBEkz
         HfCHVSHtAvV3TAieyTtjQoHf7y1/+TjlQ92eTjhkkCIv6Djx8hMiLpHt3B2QB09AbhFN
         jbXlmD9kNJt6EDtFr4Ev6egbaYrLKSj6CJdMg39Zrmk2wjIz2lL1emuvq4K9CW/BBE/H
         5YNOBAYZPqaqUF+rby25KnoJU26Aaw+m89QoYablCs8DQTU+j3Sb8L3/YYwdiD8OW8fp
         fWdOtGqmNv2Ln7WQhoMMqFBZPQqlQYTZ8a5VQd49CFBqYSnWUfuoADQUT5xEyUBi9bnV
         Plnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=SlvREz96;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2ypbAFVA;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2ypbAFVA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v129-v6si2294386qkd.349.2018.07.27.07.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 07:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=SlvREz96;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2ypbAFVA;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2ypbAFVA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj3t0-0003IU-52
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 10:38:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sH-0003FD-R3
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 10:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sG-0008Ii-Mm
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 10:37:45 -0400
Received: from greensocs.com ([193.104.36.180]:50635)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1fj3sC-0008Ds-8z; Fri, 27 Jul 2018 10:37:40 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 89B63443552;
	Fri, 27 Jul 2018 16:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702252;
	bh=OCks8lWEHQrMx7BDLkkH3U8NABen5kUobqryDET58Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SlvREz96J3eGu0J53zSUVOmF6MG+kMruZOyp6QFAoQydwa+OG8RN/XrnVLVejrBmX
	kcjuxh5VJmD+KfEqKgzheDwYVt6vHjTIJW3/vbrEl6UVCA+6lH/01Jl0mdToXoT8Cs
	cUAWfNJoQSKR4Y1TeoN5Lja+5VxEyX5xO6eppEhg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=2ypbAFVA;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=2ypbAFVA
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t87wm-J9GX67; Fri, 27 Jul 2018 16:37:31 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id B6A784434A4; Fri, 27 Jul 2018 16:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702251;
	bh=OCks8lWEHQrMx7BDLkkH3U8NABen5kUobqryDET58Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2ypbAFVAMnIrBd/57IUj3OD7egi2rAslQnEnl0UFOPk/viD2CdxFj3lkK0snEJ1uH
	AR6dVGEd3UjvdSqW5hZVG7IlN8pQJdbqAPGGMmumGUYhXE/N1K26rCropihnCRny8w
	9Lnh0QqnPEy0VnL5+LPivKNBLU8gE0p1OJUiQxNE=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 470F6443548;
	Fri, 27 Jul 2018 16:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702251;
	bh=OCks8lWEHQrMx7BDLkkH3U8NABen5kUobqryDET58Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2ypbAFVAMnIrBd/57IUj3OD7egi2rAslQnEnl0UFOPk/viD2CdxFj3lkK0snEJ1uH
	AR6dVGEd3UjvdSqW5hZVG7IlN8pQJdbqAPGGMmumGUYhXE/N1K26rCropihnCRny8w
	9Lnh0QqnPEy0VnL5+LPivKNBLU8gE0p1OJUiQxNE=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 16:37:24 +0200
Message-Id: <172aa4f0544c31a22603c783a836aef3c29d564e.1532701430.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1532701430.git.damien.hedde@greensocs.com>
References: <cover.1532701430.git.damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [RFC PATCH 5/6] zynq_slcr: add uart clock gating and
 soft reset support
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nvfV9KhIWz/V

Clock gating and reset of uart0 and uart1 is controlled by
UART_CLK_CTRL and UART_RST_CTRL.
Uart0 and uart1 links are kept in properties to allow taking action.

The CLKACT bit in UART_CLK_CTRL is used to driver the clock gating.

In order to implement the reset behavior, which can be hold: when
reset is asserted, device_reset is called on the uart and the clock
is also disabled until reset is deasserted.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/misc/zynq_slcr.c | 63 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index d6bdd027ef..55dd586066 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -168,6 +168,14 @@ enum {
 #define DDRIOB_LENGTH 14
 };
 
+enum {
+    UART_CLK_CTRL_CLKACT0 = 0x0001,
+    UART_CLK_CTRL_CLKACT1 = 0x0002,
+
+    UART_RST_CTRL_UART0_REF_RST = 0x04,
+    UART_RST_CTRL_UART1_REF_RST = 0x08,
+};
+
 #define ZYNQ_SLCR_MMIO_SIZE     0x1000
 #define ZYNQ_SLCR_NUM_REGS      (ZYNQ_SLCR_MMIO_SIZE / 4)
 
@@ -180,6 +188,9 @@ typedef struct ZynqSLCRState {
     MemoryRegion iomem;
 
     uint32_t regs[ZYNQ_SLCR_NUM_REGS];
+
+    DeviceState *uart0;
+    DeviceState *uart1;
 } ZynqSLCRState;
 
 static void zynq_slcr_reset(DeviceState *d)
@@ -355,6 +366,35 @@ static uint64_t zynq_slcr_read(void *opaque, hwaddr offset,
     return ret;
 }
 
+/*
+ * zynq_slcr_update_clock:
+ * Update a device clock state given its:
+ * + clock enable bit
+ * + reset asserted bit
+ * Since reset cannot be enabled and disabled, the clock is disabled when
+ * reset is asserted
+ */
+static void zynq_slcr_update_clock(DeviceState *dev, bool clken, bool rsten)
+{
+    if (dev) {
+        device_set_clock(dev, clken && !rsten);
+    }
+}
+
+/*
+ * zynq_slcr_update_reset:
+ * Update a device reset state given its:
+ * + reset asserted bit
+ * Also trigger a clock update
+ */
+static void zynq_slcr_update_reset(DeviceState *dev, bool clken, bool rsten)
+{
+    if (dev && rsten) {
+        device_reset(dev);
+    }
+    zynq_slcr_update_clock(dev, clken, rsten);
+}
+
 static void zynq_slcr_write(void *opaque, hwaddr offset,
                           uint64_t val, unsigned size)
 {
@@ -408,6 +448,22 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
         }
         break;
+    case UART_CLK_CTRL:
+        zynq_slcr_update_clock(s->uart0,
+                s->regs[UART_CLK_CTRL] & UART_CLK_CTRL_CLKACT0,
+                s->regs[UART_RST_CTRL] & UART_RST_CTRL_UART0_REF_RST);
+        zynq_slcr_update_clock(s->uart1,
+                s->regs[UART_CLK_CTRL] & UART_CLK_CTRL_CLKACT1,
+                s->regs[UART_RST_CTRL] & UART_RST_CTRL_UART1_REF_RST);
+        break;
+    case UART_RST_CTRL:
+        zynq_slcr_update_reset(s->uart0,
+                s->regs[UART_CLK_CTRL] & UART_CLK_CTRL_CLKACT0,
+                s->regs[UART_RST_CTRL] & UART_RST_CTRL_UART0_REF_RST);
+        zynq_slcr_update_reset(s->uart1,
+                s->regs[UART_CLK_CTRL] & UART_CLK_CTRL_CLKACT1,
+                s->regs[UART_RST_CTRL] & UART_RST_CTRL_UART1_REF_RST);
+        break;
     }
 }
 
@@ -436,12 +492,19 @@ static const VMStateDescription vmstate_zynq_slcr = {
     }
 };
 
+static Property zynq_slcr_properties[] = {
+    DEFINE_PROP_LINK("uart0", ZynqSLCRState, uart0, TYPE_DEVICE, DeviceState *),
+    DEFINE_PROP_LINK("uart1", ZynqSLCRState, uart1, TYPE_DEVICE, DeviceState *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void zynq_slcr_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &vmstate_zynq_slcr;
     dc->reset = zynq_slcr_reset;
+    dc->props = zynq_slcr_properties;
 }
 
 static const TypeInfo zynq_slcr_info = {
-- 
2.18.0

