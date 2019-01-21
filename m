Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6404822wrt;
        Mon, 21 Jan 2019 11:25:00 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5BQDbz5WxY/fuX0lcFMXhyq3ZyQLTgY7ZdUQA66tU3t8UBbo/4zeTfwhcaPFvFFJvdkRNm
X-Received: by 2002:a1c:99ce:: with SMTP id b197mr652591wme.75.1548098700903;
        Mon, 21 Jan 2019 11:25:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548098700; cv=none;
        d=google.com; s=arc-20160816;
        b=yh0FYijxSl6odrQCO3L34vXfqdq5GxE3gXp8zujkKFY2fFtF7REld8QPHHtwPQa4Mq
         JXC6DlvqV8BXRgt/HyN5rqaeD2V2trq1tgXS71G1FIhrhsLRcF5uuh0VwfzYUiZ3Zr3y
         TbMyKY14Z9Cgr3X62SB5WYJSWXtqdoSYECXw03emN3xGm7zT2Hao+DN453rsugitibRl
         qJiATtX6WIHj+RwJZCsc4Af3VbSfGaOVonUSW3/6t2kCx22BdtAYbunzy7Mx/eWWBgt3
         DQbJO0YNr8VXlITsamJdiBMiGUuQlT65Bd7d+QWnNQSSpxCeBFLSEYAGU2IIAp6s0W5S
         ZchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ZtglysStG0tXIkc7Lj+My+7b7XqiO1d9EdiWVYmU19M=;
        b=WbLBs5T6O0X9dfgm7sIT6dC1QuEg7Vt+A3nB3QXrJaeh5pp+l5DdNxvS1seJ6GNFV7
         RmiT2SIqxrdU+I9OzCAHQr5wsZgh3+44PbF673f4EeByIAF5YCd7REeU+MxW4JeKbca8
         cNJsUEuyUtp0DOXwCrFHXWBdWy/lhZAz41Veun5DnwdnjMJuyLk5DvKiDVYdxXWpZ/k5
         JWVZzg+7njxprauC0I2lssWrYjo6wRzNjyL53aZI39dY0/lzCUiVrlTbdN+qDny9qXd2
         jKd8TXQKEbT858KkjzgZIWlntGO6ESQ+mMXwhgD2hQDmSG1ayhGGc1WVDKvEtqywit0K
         cPCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZMdYJmqz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16si65201075wrm.377.2019.01.21.11.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:25:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZMdYJmqz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glfBs-0004GZ-0B
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:25:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevU-000854-Ey
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 14:08:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefa-0002qR-Mm
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:40 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:56109)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefY-0002eg-Uh
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:37 -0500
Received: by mail-wm1-x342.google.com with SMTP id y139so11755175wmc.5
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 10:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZtglysStG0tXIkc7Lj+My+7b7XqiO1d9EdiWVYmU19M=;
	b=ZMdYJmqzA5/BcWiQm8dp6Y66h5RsB/6WGQZ6Uk6pgVk1JEReUlPo7fupO4z0o2YNxA
	Ie7svBsqsr5CU2IvQ2/w8aV80Eymgqel6wyFcc2nyhwbklU79jDpfUXeuu6nrn+hRd21
	BOyNKJIjrV8gfpfmEJgJeGL4OuQPaPmti0yCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZtglysStG0tXIkc7Lj+My+7b7XqiO1d9EdiWVYmU19M=;
	b=Gc8wjQXdk7rjcVq0X4H7gu71hPoNvcYX3L+rTHxfgfXJoDqKlI/IU/EYUBcSx7k7UK
	ASalf+mSwUXy9t6K6L6AURXq3k5TMCJD9Hl0TC0LAgHeqAa/m0tun8A4pGI1KIfo+XOy
	tkGwW05MGz1r5fvQMQ7hrKny5+Z+V2wOqpItrBtu17/5Q7d+KAF3HU64Lq8ExCCO1lyJ
	eHKjm5q7dDTYNVzHfeYbp4lZGMsN7CLqcCKO3xZBVr3t9QvMWbIC7q9erdUQf8U3dPCa
	dLRfuv90FkW995ZVp1YDANMjSN2qUSz3BT7NVPDE2zbZ9mX00S5QQpjGY9qMPnMAmyva
	SghA==
X-Gm-Message-State: AJcUukf8Dwn1mxw9vdoHWDb8fepZ5k/ddhZ+Y8/mPiW6ZB6fj/QAZVKA
	zCAJWvUZQnSmyQSjYv3tR9Ilkg==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr578253wmi.144.1548096691956; 
	Mon, 21 Jan 2019 10:51:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:05 +0000
Message-Id: <20190121185118.18550-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH 10/23] hw/arm/armsse: Make SRAM bank size
 configurable
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U+tuIdQACqHb

For the IoTKit the SRAM bank size is always 32K (15 bits); for the
SSE-200 this is a configurable parameter, which defaults to 32K but
can be changed when it is built into a particular SoC. For instance
the Musca-B1 board sets it to 128K (17 bits).

Make the bank size a QOM property. We follow the SSE-200 hardware in
naming the parameter SRAM_ADDR_WIDTH, which specifies the number of
address bits of a single SRAM bank.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  1 +
 hw/arm/armsse.c         | 18 ++++++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 99714aa63cd..e4a05013316 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -146,6 +146,7 @@ typedef struct ARMSSE {
     MemoryRegion *board_memory;
     uint32_t exp_numirq;
     uint32_t mainclk_frq;
+    uint32_t sram_addr_width;
 } ARMSSE;
 
 typedef struct ARMSSEInfo ARMSSEInfo;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index b639b54e0db..a2ae5d3c4b9 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -221,6 +221,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     DeviceState *dev_apb_ppc1;
     DeviceState *dev_secctl;
     DeviceState *dev_splitter;
+    uint32_t addr_width_max;
 
     if (!s->board_memory) {
         error_setg(errp, "memory property was not set");
@@ -232,6 +233,15 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* max SRAM_ADDR_WIDTH: 24 - log2(SRAM_NUM_BANK) */
+    assert(is_power_of_2(info->sram_banks));
+    addr_width_max = 24 - ctz32(info->sram_banks);
+    if (s->sram_addr_width < 1 || s->sram_addr_width > addr_width_max) {
+        error_setg(errp, "SRAM_ADDR_WIDTH must be between 1 and %d",
+                   addr_width_max);
+        return;
+    }
+
     /* Handling of which devices should be available only to secure
      * code is usually done differently for M profile than for A profile.
      * Instead of putting some devices only into the secure address space,
@@ -352,8 +362,10 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < info->sram_banks; i++) {
         char *ramname = g_strdup_printf("armsse.sram%d", i);
         SysBusDevice *sbd_mpc;
+        uint32_t sram_bank_size = 1 << s->sram_addr_width;
 
-        memory_region_init_ram(&s->sram[i], NULL, ramname, 0x00008000, &err);
+        memory_region_init_ram(&s->sram[i], NULL, ramname,
+                               sram_bank_size, &err);
         g_free(ramname);
         if (err) {
             error_propagate(errp, err);
@@ -372,7 +384,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         }
         /* Map the upstream end of the MPC into the right place... */
         sbd_mpc = SYS_BUS_DEVICE(&s->mpc[i]);
-        memory_region_add_subregion(&s->container, 0x20000000 + i * 0x8000,
+        memory_region_add_subregion(&s->container,
+                                    0x20000000 + i * sram_bank_size,
                                     sysbus_mmio_get_region(sbd_mpc, 1));
         /* ...and its register interface */
         memory_region_add_subregion(&s->container, 0x50083000 + i * 0x1000,
@@ -748,6 +761,7 @@ static Property armsse_properties[] = {
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
     DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
+    DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.20.1

