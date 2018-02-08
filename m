Received: by 10.28.71.27 with SMTP id u27csp2322228wma;
        Thu, 8 Feb 2018 09:19:27 -0800 (PST)
X-Google-Smtp-Source: AH8x226aGhvnUPWfwzHx7vY0qrS39sae9wY42bI0dqADAjC9C2Tya0Ppl63yKV7hGGAs8gd+lLnu
X-Received: by 10.129.52.151 with SMTP id b145mr1087476ywa.487.1518110367529;
        Thu, 08 Feb 2018 09:19:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518110367; cv=none;
        d=google.com; s=arc-20160816;
        b=NwAJp1+ksL31mK/nUtDPS4dRbW+SsQKmQFzKrQDIIJ2qQBCnSwMcuRwgyverSFjclA
         pPdrMatcwR6a+poILKrZ8sbfgujWMKSSbVqSghuahBsEtvnqEs8sEtFzM96cPj0cwVzQ
         WtNoGrYCpsjHbJ/wcbZhMxA7VGwt0QfZkPX0ey7/UxExgSOdTGIhQvcdAXIoVT7+kusK
         dgRR3d4joppqvBbGHU9FyZ6kTvtSk9O7BS7U118W9LWcEUOjTgpB03YjwCqz7YRKcECY
         BYNTdHSvjQzPOvln4UUEqWPhmDG6CDCuXp0ynNd/1/RnLWGKL3H5uSk4QoWNFa56r1Qg
         04cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=5qaGRwDZfwX37p33tGyHNiBbUOeIBUssXi21Pjx552M=;
        b=Y4gdgOrbR1acmnJ4tmGYgiVLBBxQmnKQpLJYmSphqHtX8roCvqg+3luxUefpz+nHWj
         rJvc/4ALACC0FZ8+q+/44Xkwi0WBMD+Sso9LCP0SnpG5OnVSZABU6AMOxTl5G5kACOUu
         5mnoKD27xv6AdWapqm4nJdcp2giiQeZm1hO/2RY+cDr+y8NYiW7XfJgTEFk8E5vbPnYy
         BTDBZq/iFvY9ST5l0MYrTvIRWyYsa6hu+PYCrS6HeG3n90HBeVGLCCE8p7cDSYiGqqSL
         MP9J4Bn7p2FFs3hKCdAwRgj55JZC22MzHxNro5NjQkmjRImpz9F5k3H4Ydz3Ofz3jOCQ
         X7Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cQMdC/g1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 206si71154ywh.246.2018.02.08.09.19.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:19:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cQMdC/g1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejpr4-0007DC-Pz
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:19:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOQ-0000FI-Hg
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 11:49:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOO-0004Rd-CU
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 11:49:50 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:38120)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOO-0004RP-7b; Thu, 08 Feb 2018 11:49:48 -0500
Received: by mail-qt0-x244.google.com with SMTP id z10so6984355qti.5;
	Thu, 08 Feb 2018 08:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5qaGRwDZfwX37p33tGyHNiBbUOeIBUssXi21Pjx552M=;
	b=cQMdC/g1EwIolBPkRDh6FRlCElrJGrKV7aDBXxBhNPtm5X1CzLjFnItIxFDIawh+vC
	p7KOOzRw5ehkHWlKbEdscYHb90uirCV5v3PvqgPX2yUbnnJSs7n7txcsh0A27+tHvbCD
	xOKktsjVjqoggMQk09AY2QVs6gKdKD8yzlyEyoN9Lizm9/AMCVTmwrhBga+/mHdpEqqB
	Ylf/sB0fmTDtoN58AkzYY6XWE04e37chhHGnGf0OOJ1+sANemashnXyrDDJUCMCR2HlC
	XpGoftz4xrVBzcjnEWNyIR+t58XY1xuqSKy2hQvm2M1nb+/nNIeVFzXooUP1i+JNfdWk
	t/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5qaGRwDZfwX37p33tGyHNiBbUOeIBUssXi21Pjx552M=;
	b=LOxZT9JvImt/Ewr3POpteFhdSmvjKoxk3afoqkxdu8VoqPNjmxGrDTFiR5FpvrPqXl
	vO2duB+qRvzCr6rF98J8JetN88Er4FhYIw/uoqMUQSv3DB22TrGlsWM1/mrASTwx9aaJ
	bP47KxKM4eWrwb4m8ufLiQU0q8fa0Zc0WFJw6EeS+Uldfno006YrkyGfBJ+WYOR/RMmX
	vg+HSEZQ0ghbdEnhKBd9eeNijP+3EXziqy3pZp70Z4zGnUh8FL96hkyveA4IVfsIX1td
	lFT6pLJtiuc1ySnuN+Xtr0U3xfGXPlweVBxYlP2ICROCmOknqEC7UWruvuqjWGCZeJGQ
	2epg==
X-Gm-Message-State: APf1xPCQQh4PeL9niqa64P+Q6zSzmAo6PObS/OJ9cKGXLPdVt70InAIE
	GApAWlGcJV5vG8CTOTt1c0g=
X-Received: by 10.237.47.133 with SMTP id m5mr1940312qtd.142.1518108587695;
	Thu, 08 Feb 2018 08:49:47 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id z66sm240905qkc.9.2018.02.08.08.49.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 08:49:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  8 Feb 2018 13:48:14 -0300
Message-Id: <20180208164818.7961-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208164818.7961-1-f4bug@amsat.org>
References: <20180208164818.7961-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v11 26/30] hw/arm/xilinx_zynqmp: fix the
 capabilities/spec version to match the datasheet
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +m60N3cjRgRB

checking Xilinx datasheet "UG1085" (v1.7)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index ca398c4159..e39ad73bec 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -53,6 +53,8 @@
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
 
+#define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
+
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
     0xFF0B0000, 0xFF0C0000, 0xFF0D0000, 0xFF0E0000,
 };
@@ -387,22 +389,27 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, gic_spi[SATA_INTR]);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
-        char *bus_name;
-
-        object_property_set_bool(OBJECT(&s->sdhci[i]), true,
-                                 "realized", &err);
+        char *bus_name = g_strdup_printf("sd-bus%d", i);
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->sdhci[i]);
+        Object *sdhci = OBJECT(&s->sdhci[i]);
+
+        /* Compatible with:
+         * - SD Host Controller Specification Version 3.00
+         * - SDIO Specification Version 3.0
+         * - eMMC Specification Version 4.51
+         */
+        object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
+        object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &err);
+        object_property_set_bool(sdhci, true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
-                        sdhci_addr[i]);
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
-                           gic_spi[sdhci_intr[i]]);
+        sysbus_mmio_map(sbd, 0, sdhci_addr[i]);
+        sysbus_connect_irq(sbd, 0, gic_spi[sdhci_intr[i]]);
+
         /* Alias controller SD bus to the SoC itself */
-        bus_name = g_strdup_printf("sd-bus%d", i);
-        object_property_add_alias(OBJECT(s), bus_name,
-                                  OBJECT(&s->sdhci[i]), "sd-bus",
+        object_property_add_alias(OBJECT(s), bus_name, sdhci, "sd-bus",
                                   &error_abort);
         g_free(bus_name);
     }
-- 
2.16.1

