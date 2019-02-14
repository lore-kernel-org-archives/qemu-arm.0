Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp955001wrp;
        Thu, 14 Feb 2019 05:06:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3IajZjJshAqzK3plmccd14EhDmOgkI9hxwAB/KnwBm96RLzT7RZCp14pI0SLrZiIBpB6Zf7T
X-Received: by 2002:a0d:eb94:: with SMTP id u142mr2905941ywe.356.1550149596968;
        Thu, 14 Feb 2019 05:06:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149596; cv=none;
        d=google.com; s=arc-20160816;
        b=kgoXK8VDakwoakoNszctr7KzkZiCSl5gnK94EQDmb5RBEmOzJGzL7XTbuyAooWWp9x
         SY5Jni2lR+2e3lkt3q4WvYxjICursSVCflhJrr1h1vJS28/J5+g+9cNjY429EXswTE0+
         +lwCwIt5f4jqnfpXxLTtinejMlUuFUO8GqJq8ppVTGy6bnFb5VslT2UkXdRKHIefQvtP
         Bs7tJzPiXh4S4NSOGaz4RDxlnHvwFHw0VAUE/N7VwUKc0+Q+Smajl9B2NFmWpIoniv4e
         NaDMKRYw9aDvYtklIvmWgS4jwS07dLwE05PEwgQCeKdpTeKVk8+Vhou8TY+/hjm9kem8
         RHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=i7iefvAvCVRA+KRHNYGYL+qeYUkXaEz5YcRL7tedKZY=;
        b=aYeLyX/gAhP1xy5zhZLnNUevDTwgBg03kxXN9cCTaFwbUtarRxbjtaqEZqhXx1HohF
         nekUd/oqxgItVf6eCuxix6VpTxgJNzRiv4AcYKnOjjEgMmMrAgB93TOkJZ79S4CWZJx0
         bpAWB9ZDZnQA3r4M9wg9s5FuQVSknGHtEPVOKXhok0yjVLogpuOZUc4XpnTCjm+nV1pu
         xFQ7tLACUKCdBYT+6mr34QTodSIFMNXdqTHSBjVzVv8vBcJo5p+4S35HXiQjiEkKs0GY
         aTbWLa68X0HN8rgYkD1dA4js4S4MXJ9coUpF8QbF3RsQaCbWR4CDtbYYQ/kBPtuo8fiW
         gWhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RJDEqj7j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si1323069ywa.231.2019.02.14.05.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:06:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RJDEqj7j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGiq-0005xX-8q
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:06:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeO-0002tT-LM
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 08:02:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGUe-00071u-GD
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:57 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54896)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGUe-0006bC-8C
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:56 -0500
Received: by mail-wm1-x342.google.com with SMTP id a62so6166418wmh.4
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 04:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=i7iefvAvCVRA+KRHNYGYL+qeYUkXaEz5YcRL7tedKZY=;
	b=RJDEqj7j8XWkG/cMdBPF8DDTmFYF71f6ppHBCIj8blVUT3Id1IvQ9u21UvtfDavnRg
	Gt8RKUIkzBjMxfRVL3K7MT9sdlzsytUnYN5mXm3fHFCIBCyNw4+B5TKgsuPQDu5qPeca
	nOukU8K7yVbm7GlLheLXUaS5fuJRlYBWvOGrasCGPOQHUqSq23v6svgWnLe8x0gjORMl
	tsMRyku9uF89kg4ZBgAfv5kcLJITnnZ1VNuvXiNL4Cf6ukzZOzrB0nHR4dNsrIpfPbwE
	oFoaCPgJypi3mGrCb2CDJ/0IjYo5ziaNHrhqdpHxFfWney7mkk7pLNB1wPbzwmLXtuHa
	+kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i7iefvAvCVRA+KRHNYGYL+qeYUkXaEz5YcRL7tedKZY=;
	b=Om86H/dkVN8uHAUZtpT/BzuO40OGF+GtsXHVaC3wzgCaHM9901C2llYRLDmPYNDoeP
	ZQGRjRa3zSfNIqqxk+ZEA8uE9uwdCEdaW8eBWG/RpGm4OMhhDCqQyCU1SdiQasG9ohSZ
	jgTjTbCEEWMQ2yBvBRkB/rGtMBg5Q4HDB5iCP7FWzZE4ct+YQ3liAGoIZvZRTtTjOEnh
	g/T3N+kDTn3PR9mRquKt7ga4EOsUGGzewRhoAdaL7rk+Kvv2rX9FwrVlcvi7mfULxxD2
	zzgy1xD1KcQPyS1dJaxcWHY5+cntDdupW3hniaixGIx7GsTUK3ANoVIzIpF0dGUeiMHi
	BqiA==
X-Gm-Message-State: AHQUAubrJt1dQPdxsm4ATsUJc7Z7YPcMRybhRws7z06McT8E9Syb+/b8
	IXUZ7pdTgdC34HHh5yha6APatw==
X-Received: by 2002:a1c:c40c:: with SMTP id u12mr2530542wmf.11.1550148679746; 
	Thu, 14 Feb 2019 04:51:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:51:02 +0000
Message-Id: <20190214125107.22178-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH 09/14] hw/arm/armsse: Allow boards to specify
 init-svtor
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
X-TUID: eLRYE/qyBXi4

The Musca boards have DAPLink firmware that sets the initial
secure VTOR value (the location of the vector table) differently
depending on the boot mode (from flash, from RAM, etc). Export
the init-svtor as a QOM property of the ARMSSE object so that
the board can change it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h | 3 +++
 hw/arm/armsse.c         | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 444605b44dc..84879f40dd8 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -48,6 +48,8 @@
  *    if necessary.)
  *  + QOM property "SRAM_ADDR_WIDTH" sets the number of bits used for the
  *    address of each SRAM bank (and thus the total amount of internal SRAM)
+ *  + QOM property "init-svtor" sets the initial value of the CPU SVTOR register
+ *    (where it expects to load the PC and SP from the vector table on reset)
  *  + Named GPIO inputs "EXP_IRQ" 0..n are the expansion interrupts for CPU 0,
  *    which are wired to its NVIC lines 32 .. n+32
  *  + Named GPIO inputs "EXP_CPU1_IRQ" 0..n are the expansion interrupts for
@@ -204,6 +206,7 @@ typedef struct ARMSSE {
     uint32_t exp_numirq;
     uint32_t mainclk_frq;
     uint32_t sram_addr_width;
+    uint32_t init_svtor;
 } ARMSSE;
 
 typedef struct ARMSSEInfo ARMSSEInfo;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 9a8c49547db..3040ea9324e 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -505,11 +505,10 @@ static void armsse_realize(DeviceState *dev, Error **errp)
          * the INITSVTOR* registers before powering up the CPUs in any case,
          * so the hardware's default value doesn't matter. QEMU doesn't emulate
          * the control processor, so instead we behave in the way that the
-         * firmware does. All boards currently known about have firmware that
-         * sets the INITSVTOR0 and INITSVTOR1 registers to 0x10000000, like the
-         * IoTKit default. We can make this more configurable if necessary.
+         * firmware does. The initial value is configurable by the board code
+         * to match whatever its firmware does.
          */
-        qdev_prop_set_uint32(cpudev, "init-svtor", 0x10000000);
+        qdev_prop_set_uint32(cpudev, "init-svtor", s->init_svtor);
         /*
          * Start all CPUs except CPU0 powered down. In real hardware it is
          * a configurable property of the SSE-200 which CPUs start powered up
@@ -1185,6 +1184,7 @@ static Property armsse_properties[] = {
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
     DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
+    DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.20.1

