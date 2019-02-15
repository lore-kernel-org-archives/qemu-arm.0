Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp24818wrx;
        Fri, 15 Feb 2019 10:05:57 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaFnGaoYcR2XNMiu9EHvkL049PcONL4uXIYVYLuxPkkfUmk1Bg7DvNuGHNgDzdNNbleHA4C
X-Received: by 2002:a0d:ea56:: with SMTP id t83mr9178971ywe.381.1550253957495;
        Fri, 15 Feb 2019 10:05:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550253957; cv=none;
        d=google.com; s=arc-20160816;
        b=YJD5pGP0mpwHA+Kn3ezpPJCwcs7LiK+DN6hbN3I4xj7KI6FSEqzT/3XXMrDbE/p+Uk
         Fzf/ZjOv04UtHAfjJylIPajVNA2kJ0anYDVgtbMzdua1EQ6QSxnSuVMcZSmgvR5rAoxj
         /LevJ0+PHao5qDZd0F6dr5OmaXEJeycbjjlhMmeYls5gw8nQSKwJzCuoab8APm3EVb3/
         or/OCB5blbHetnhYmMBnBL2en0wsS3eemkaAwyj6Wq+t58F+zEyYJAy6w9nc/WSIjzey
         Jvcll9nRm06lWc+JSGeE3VqEsPgXbHylhJzV/sBJTkWUc9807Yua64HBkM3nsEnHxEAK
         mR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=7jDC0BbGafD6lfyjfl1Pi9GQ9ZpZGO7Lekb8UiW3pSg=;
        b=nmaVJGUTpTOe+qn+jhQjaTKk2eHWrFtFr3Tx04EMiWC8NoUWKh8JjFT6eFkdZLnFrP
         S0GMdBbugh8BVxFNRzskHVbKHs0CpDQKMMmAyXdyCQZ3zwM97voaj6144X7cAMCNpBgh
         japSBqaJ15txotYBo84aj/PMWPhk98Emo0a7X4whH9c3lyA3ac7Td+U3HX26xIEaKtik
         fmp8yxsZW7kzMPTKLJUpkh/NzCybLskz3qQ+cbbadtWqYFcQVExV3rkys8q19Ve+4Maw
         HlG1K3+7HdbDT/I8sHSPzSJj3xhKuQBxnzsfa7niFY6KRxl28zcPrhpndY/7M+SRad80
         6/yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UTkofiRE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si3516678ywm.62.2019.02.15.10.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Feb 2019 10:05:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UTkofiRE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guhs4-00043p-Vh
	for alex.bennee@linaro.org; Fri, 15 Feb 2019 13:05:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guhrO-00043X-KE
	for qemu-devel@nongnu.org; Fri, 15 Feb 2019 13:05:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guhrN-0000VE-JQ
	for qemu-devel@nongnu.org; Fri, 15 Feb 2019 13:05:14 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45828)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guhrL-0000NM-HE
	for qemu-devel@nongnu.org; Fri, 15 Feb 2019 13:05:12 -0500
Received: by mail-wr1-x442.google.com with SMTP id w17so11238822wrn.12
	for <qemu-devel@nongnu.org>; Fri, 15 Feb 2019 10:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7jDC0BbGafD6lfyjfl1Pi9GQ9ZpZGO7Lekb8UiW3pSg=;
	b=UTkofiREe1jO4ezUSPyUoxRbS47OGuj9WRlYASTelRnEHKbUD4AiBCfTZiiEheNWjT
	Qi1WUg/Qq7wm4CgrBn4uDQq4/aEpCkxsWjWawTqgvYDmMshSYd2urdxwudUGZP6xP664
	qwQyAlJhYQcxWyh8dgyJ27BH6tLOmxqRT4FzZoQlpvb9o3t2p+io1o+mjsJZY2UREykr
	TMqMEkpmLRjkAv84be1GlI7/YDydlaAvOenjXB7yGx6wnlyJx0Jw5xwhRlUZmRsVuY/0
	Fh518T8Mexw8S3qqok8M5oT4FIf07l4AmyYDiBzhSAZ4NR68OTkNbnXmIqdJnjrPXRJX
	5IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7jDC0BbGafD6lfyjfl1Pi9GQ9ZpZGO7Lekb8UiW3pSg=;
	b=hH9WKcy1HUh4IpuZKVAWYg6M9CQ0XlqKrdXli58rRH4ejzlqYvuhhpJZRZt6wMjv/o
	zWsU+crBqyScdKdF5y+ZfO/l4hB5JCIoGpmPvrRT76BveZqHK6oz5TvbFMCBpMXzq5Z8
	I/Re0AzeXkKn2wVIA27T/lbvu/sbMVU8b8PxxCPBjnQyzR3OBWyNw3MzVFBF+blVrjH6
	Gdl4DJ1wEtEgLr0HOd9G2bxL4QZmNFaU+AcB8S/1qpsYIw+HLxHG+adUs4z/C2zx1kPq
	h1upWJiSzhobB7avQSvulG/7IegrboiPCMI1Q/rzPFpfQxz83nFLfrpVyOgY7xGOwg34
	TMGw==
X-Gm-Message-State: AHQUAuZ3VVIqDpQKYMhd8JJtfRMYyhGur9hwiR1mAvU7dy5qwATDmMaP
	gVFoHyJPMZK/EjogoRXAV5GkFg==
X-Received: by 2002:a5d:6810:: with SMTP id w16mr7721000wru.62.1550253903150; 
	Fri, 15 Feb 2019 10:05:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id y5sm2503360wmg.31.2019.02.15.10.05.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 10:05:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 15 Feb 2019 18:05:00 +0000
Message-Id: <20190215180500.6906-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH] hw/arm/armsse: Make 0x5... alias region work
 for per-CPU devices
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
X-TUID: IhhW0rdk26dD

The region 0x40010000 .. 0x4001ffff and its secure-only alias
at 0x50010000... are for per-CPU devices. We implement this by
giving each CPU its own container memory region, where the
per-CPU devices live. Unfortunately, the alias region which
makes devices mapped at 0x4... addresses also appear at 0x5...
is only implemented in the overall "all CPUs" container. The
effect of this bug is that the CPU_IDENTITY register block appears
only at 0x4001f000, but not at the 0x5001f000 alias where it should
also appear. Guests (like very recent Arm Trusted Firmware-M)
which try to access it at 0x5001f000 will crash.

Fix this by moving the handling for this alias from the "all CPUs"
container to the per-CPU container. (We leave the aliases for
0x1... and 0x3... in the overall container, because there are
no per-CPU devices there.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  2 +-
 hw/arm/armsse.c         | 26 ++++++++++++++++----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index f800bafb14a..5a845b3478d 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -182,7 +182,7 @@ typedef struct ARMSSE {
     MemoryRegion cpu_container[SSE_MAX_CPUS];
     MemoryRegion alias1;
     MemoryRegion alias2;
-    MemoryRegion alias3;
+    MemoryRegion alias3[SSE_MAX_CPUS];
     MemoryRegion sram[MAX_SRAM_BANKS];
 
     qemu_irq *exp_irqs[SSE_MAX_CPUS];
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index d0207dbabc7..ee1357312f1 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -110,15 +110,16 @@ static bool irq_is_common[32] = {
     /* 30, 31: reserved */
 };
 
-/* Create an alias region of @size bytes starting at @base
+/*
+ * Create an alias region in @container of @size bytes starting at @base
  * which mirrors the memory starting at @orig.
  */
-static void make_alias(ARMSSE *s, MemoryRegion *mr, const char *name,
-                       hwaddr base, hwaddr size, hwaddr orig)
+static void make_alias(ARMSSE *s, MemoryRegion *mr, MemoryRegion *container,
+                       const char *name, hwaddr base, hwaddr size, hwaddr orig)
 {
-    memory_region_init_alias(mr, NULL, name, &s->container, orig, size);
+    memory_region_init_alias(mr, NULL, name, container, orig, size);
     /* The alias is even lower priority than unimplemented_device regions */
-    memory_region_add_subregion_overlap(&s->container, base, mr, -1500);
+    memory_region_add_subregion_overlap(container, base, mr, -1500);
 }
 
 static void irq_status_forwarder(void *opaque, int n, int level)
@@ -608,16 +609,21 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     }
 
     /* Set up the big aliases first */
-    make_alias(s, &s->alias1, "alias 1", 0x10000000, 0x10000000, 0x00000000);
-    make_alias(s, &s->alias2, "alias 2", 0x30000000, 0x10000000, 0x20000000);
+    make_alias(s, &s->alias1, &s->container, "alias 1",
+               0x10000000, 0x10000000, 0x00000000);
+    make_alias(s, &s->alias2, &s->container,
+               "alias 2", 0x30000000, 0x10000000, 0x20000000);
     /* The 0x50000000..0x5fffffff region is not a pure alias: it has
      * a few extra devices that only appear there (generally the
      * control interfaces for the protection controllers).
      * We implement this by mapping those devices over the top of this
-     * alias MR at a higher priority.
+     * alias MR at a higher priority. Some of the devices in this range
+     * are per-CPU, so we must put this alias in the per-cpu containers.
      */
-    make_alias(s, &s->alias3, "alias 3", 0x50000000, 0x10000000, 0x40000000);
-
+    for (i = 0; i < info->num_cpus; i++) {
+        make_alias(s, &s->alias3[i], &s->cpu_container[i],
+                   "alias 3", 0x50000000, 0x10000000, 0x40000000);
+    }
 
     /* Security controller */
     object_property_set_bool(OBJECT(&s->secctl), true, "realized", &err);
-- 
2.20.1

