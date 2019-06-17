Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2791490wrg;
        Mon, 17 Jun 2019 10:59:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7MhBGTw/jOfwOAtPFXOp1/+NpadmFd67c/y6GWoMgKrIg9NuOWS/+F/JuYo7dD4CvplPQ
X-Received: by 2002:a17:906:2a94:: with SMTP id l20mr12278488eje.131.1560794340776;
        Mon, 17 Jun 2019 10:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560794340; cv=none;
        d=google.com; s=arc-20160816;
        b=HqNSs/AtWyT0hhMS+Qb+EcZL79k3eSGDHkPHsEIgreBjQi3EHkp50DiWd99KLe1WbP
         Xu8KIyO0JTyK1P0SiyHDjzXMRy0hRAeHrqVMTxR4BkdGpk7XV0q231FFzB1xUBRKSN72
         18/ULRENb+CV3zM5FDLxQ6Q61/2DOdD5sn88HSY612S3GMBOJOYvCOLyDNi88rMni2Kg
         RTKnSzYm4PRAX1LnuoIN6t/Kn1wrYivLg0W2K5GC1hswG3ECNmJ3yVLwSv8vzyvMFfe5
         TY8d+LVrfBBX+yhZsJW4d0MhkZLHk6amALyoqb914PD0v9UkMcv+u/+7gwHxLd20eCFz
         BicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=v8vwTZLuhwp+bmBixmmWp52i36uK/epxo9J3L5qAyYw=;
        b=YM9y/37WhzsPOevQarUN4kXm8eGhOY6INyrYuIn/EPrYIAGAoZfTRxsSUsxT+sN6fM
         5s3I45Z7MnfXFrdWdQQXIOlVKKqWPLhi413G+9hkbIe2QPIcUSKpDo0lrfcc10z0l97p
         EJ/a2+W0PqBE0Ly/6FBU50sjFGUC5YDiDuMSzgMgixX4Zbd5JbSnq02Yma840SEmnRsG
         ZMkOd9h4qhPcRck3LU7SK2Lw8eNY10a7xNbZn+VClLYsuZ9+XNwhOezgGYQZ58OeNQir
         7tahAgOVTaDtEU9KInSGLlulXbBXy2834P8tdwCGOJXImDRpTu1eS+bC/X9IOXeiHcmo
         DauA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qQnFthMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si7508112ejj.133.2019.06.17.10.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 10:59:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qQnFthMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcvuF-0006XJ-RY
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 13:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50784)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcvp1-0007iL-Np
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcvoz-0000g2-Qo
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:35 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37705)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcvox-0000dt-RE
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:32 -0400
Received: by mail-wr1-x442.google.com with SMTP id v14so10953960wrr.4
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v8vwTZLuhwp+bmBixmmWp52i36uK/epxo9J3L5qAyYw=;
 b=qQnFthMSJo8bfP4HEGAgZBvsS1BmZaBI2he8FBMFZln/yYefl8iffG5CDe/FQCaaoz
 /VbmNkeZ7Q5CljJMhl+5A4Wl7KgcnpOPA6fmvxdbbHorj4vdDcrkVlPuQWCOMJfKRfQI
 9CJMqwtN9y2sjTAyAf9/GH6LlNfn9pCifvGvQ15JSq2cOJj9ffzsI5T8EDAxvH905JS4
 tQcsojAIxQqGO+8Elf74KN/udytwcM2zTY+cGuqCH2hg8M3VWQbGL4SRRjYI4dciXZPj
 wj3NAPb+aQGLs78EdDOgXQw41rS6CAwVXBo1yx1fAnI5Zb+XOeJlXXzeAV081w48sKSC
 tZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8vwTZLuhwp+bmBixmmWp52i36uK/epxo9J3L5qAyYw=;
 b=SP5MQEceuEqaX6eo004Q8tZ0Mcv9C2pDvIo5ccxsOB+3+lwSXR8RQWi6yEgr0XnC7K
 aOLOsaxJ8ZnXTC+z0BdJ6KeDGW5cCHAbix/CwDnH7tGj9MN/GoiVu8kHVo1EvChjX4FP
 qVF2mEYeK24DRFCmV4dQkAUNm9CkQBLFmxQL/Tu7D+SyNkkmAczpD5nkagGSL5Pt8bao
 5evkALeJybHg/Y7QYy0n1cHgwyvnYnMQnmIjYzXEPmb/Ciy95Vc+IWy0UQAUQc3HR9QG
 XccfyDcHlGfMljNjjsmwFV9YfvwYYDpa4T+xxh/HAOEbcnBaBb5doyyrvUl+N5M7+Zjq
 Alxg==
X-Gm-Message-State: APjAAAWbdWmKTaz82BZr9mxLEn+Nf5GQ5gQLR+VIsiO7TjiZM/K7UW22
 X/RgpMjFt+WubdAYymOH5ck5r1eebdr3jg==
X-Received: by 2002:a5d:5302:: with SMTP id e2mr62712766wrv.347.1560794008245; 
 Mon, 17 Jun 2019 10:53:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t14sm8713619wrr.33.2019.06.17.10.53.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 10:53:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 18:53:16 +0100
Message-Id: <20190617175317.27557-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617175317.27557-1-peter.maydell@linaro.org>
References: <20190617175317.27557-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 5/6] hw/timer/armv7m_systick: Forbid
 non-privileged accesses
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d4C6yiawzvcg

Like most of the v7M memory mapped system registers, the systick
registers are accessible to privileged code only and user accesses
must generate a BusFault. We implement that for registers in
the NVIC proper already, but missed it for systick since we
implement it as a separate device. Correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/armv7m_systick.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index a17317ce2fe..94640743b5d 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -75,11 +75,17 @@ static void systick_timer_tick(void *opaque)
     }
 }
 
-static uint64_t systick_read(void *opaque, hwaddr addr, unsigned size)
+static MemTxResult systick_read(void *opaque, hwaddr addr, uint64_t *data,
+                                unsigned size, MemTxAttrs attrs)
 {
     SysTickState *s = opaque;
     uint32_t val;
 
+    if (attrs.user) {
+        /* Generate BusFault for unprivileged accesses */
+        return MEMTX_ERROR;
+    }
+
     switch (addr) {
     case 0x0: /* SysTick Control and Status.  */
         val = s->control;
@@ -121,14 +127,21 @@ static uint64_t systick_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     trace_systick_read(addr, val, size);
-    return val;
+    *data = val;
+    return MEMTX_OK;
 }
 
-static void systick_write(void *opaque, hwaddr addr,
-                          uint64_t value, unsigned size)
+static MemTxResult systick_write(void *opaque, hwaddr addr,
+                                 uint64_t value, unsigned size,
+                                 MemTxAttrs attrs)
 {
     SysTickState *s = opaque;
 
+    if (attrs.user) {
+        /* Generate BusFault for unprivileged accesses */
+        return MEMTX_ERROR;
+    }
+
     trace_systick_write(addr, value, size);
 
     switch (addr) {
@@ -172,11 +185,12 @@ static void systick_write(void *opaque, hwaddr addr,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "SysTick: Bad write offset 0x%" HWADDR_PRIx "\n", addr);
     }
+    return MEMTX_OK;
 }
 
 static const MemoryRegionOps systick_ops = {
-    .read = systick_read,
-    .write = systick_write,
+    .read_with_attrs = systick_read,
+    .write_with_attrs = systick_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid.min_access_size = 4,
     .valid.max_access_size = 4,
-- 
2.20.1

