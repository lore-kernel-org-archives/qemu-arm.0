Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9098610lfc;
        Fri, 19 Feb 2021 07:14:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNSt2WiPfZXMSQut3nAXaHIGtNE5cucXW6Ho1UC7fgdoRAjo/8miUBEPtef478EA4fqbBm
X-Received: by 2002:a05:6902:1d2:: with SMTP id u18mr14310105ybh.103.1613747674237;
        Fri, 19 Feb 2021 07:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747674; cv=none;
        d=google.com; s=arc-20160816;
        b=CdYKKZWPP55r4bO4ZloMnNQyNHtZHRreletSJIWx2TWT2B7DS3VJ0Rlc8dXHmtvJHK
         kbQn0h6qT0tgPM2YcrSlIGNSO+anQBRGXvYU/qfVlC7HF4lX6d3wE9r1UeBOnhGVfAWQ
         zmAYv92ur6y6eF9tQSyflS98P9eAkUYX1gpy5RuHAb8zrfJir9qrWoYEOcSXm8OIVv34
         qRLRB4dxgqSFy0BBmkFn0x0vULQ2gzMKnal7EeoFVzC5ph0XeF4nCTOCa7w364+6N2n6
         hWmb67zigQbEjqQhP+3Unp5XO84iOYZQBnyqiALSYDgRvykymPSnSTUa+aINEBWHLM7F
         IWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AbLWZDU49J088c2eS3fP9W433ZG0VZOrayl8b6TQOBc=;
        b=qzcUdSVGxgrExtrVX1TCwbt7UWrwmfAhp/intdOeXD4WWzeNvPLOsLv/CMTyiPrX2Y
         VbmkK1UZtJqCqS5u16iSv9auHZJI5s7eEDafcA6jt5P1ahTsI/rIjnQkrFuCfsAz3puq
         RSJRtbESXVlSAq0sX90SqPz+540z4xPJ2pr35BxuEIyIloWQeOdkfQDFqnz7QAgu6q0x
         ayIWo/ljVZjUNJhiREmS2uXgOWKd1vIbjfxBRR7E7IjN1aONyV+qolsRe6p3My6G9Hcb
         VNmmphVqPuVc7/nTCj1EezvJ9l65gxPuqpP9eOObU5OwdPuvFhh77aP6exTdcSd6mEuz
         Hwxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eCQtSIqU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si9141128ybk.270.2021.02.19.07.14.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:14:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eCQtSIqU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7UH-0004XO-Gi
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73q-0002iU-V1
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:14 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73O-0003cs-QZ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:14 -0500
Received: by mail-wr1-x42a.google.com with SMTP id n4so8912846wrx.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AbLWZDU49J088c2eS3fP9W433ZG0VZOrayl8b6TQOBc=;
 b=eCQtSIqUDnby2MRJA5kkN6VuIZciSAnwASc/yII6cvWkrMLqaF7q3n/4ScF8JweKej
 i6iItJ84KqMxa0tTzJnzxTEQ3oj9rhH0Tm/GSsEk+wc0Y9vsTBx46ZJxWzaoLXDeHTSS
 EG5wqKEOwG2q/6Z4gONbquLfaDQYDkDBK8tLEwJXX89iI2hIMbwTaYV2O9aY7X+AcEKp
 VbC7zeUZQq+sX4uz9NGzPwLemgL46kuyd09hM7tifBQCq05UdSuDwkGqAKKBhW32hmrL
 A3NVUqWQgjqJf+/3htDxYt2NA5wEIeoPvYs0hxQTtHAcATmr7h72ZzDmb4KIE0M5HZFC
 jqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AbLWZDU49J088c2eS3fP9W433ZG0VZOrayl8b6TQOBc=;
 b=VBrbMUQrEQ3HJxEpbhVgwvYxCOTl2OkILxds3mniUlSHSKFKRvHK/5uhyfd4Aq3lDo
 9lGi+/mYx4FQ8pDDhfMgQTgJP//8GqD0inuzBdGydifRO2Mk5V4zabZsbJK6GvsZoGKH
 vZDZjweWHJaa+vTtzI1U+XMZOXnjCG6lSG9qtytFiTf6n8eXrNeBs7y13oln588TNMBz
 fczwJhCrA4HNE62aSIYytd+rzHXadO3FQGiYYgBk6VsLn35+Z++kVnrrd6I7FIMUxBeq
 XLqKTf0R5YqLgqqOGfCn0FE429FJdDlqKT6eJFwnyCvNLCPfbqanYHoDmpdeU47U0Wrp
 1ETA==
X-Gm-Message-State: AOAM531ok+2aLZN1kQbE5qycbyVWtA7xNqYicsRzI0QF0mXtgn8hf/xj
 VB34zbriLn0gysdUz7Th6dj0REmV8MigWg==
X-Received: by 2002:a5d:698d:: with SMTP id g13mr9674942wru.30.1613746005401; 
 Fri, 19 Feb 2021 06:46:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 34/44] hw/arm/armsse: Support variants with ARMSSE_CPU_PWRCTRL
 block
Date: Fri, 19 Feb 2021 14:46:07 +0000
Message-Id: <20210219144617.4782-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bnP7kTcyw69W

Support SSE variants like the SSE-300 with an ARMSSE_CPU_PWRCTRL register
block. Because this block is per-CPU and does not clash with any of the
SSE-200 devices, we handle it with a has_cpu_pwrctrl flag like the
existing has_cachectrl, has_cpusectrl and has_cpuid, rather than
trying to add per-CPU-device support to the devinfo array handling code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  3 +++
 hw/arm/armsse.c         | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index f4e2b680479..21d239c381c 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -104,6 +104,7 @@
 #include "hw/misc/iotkit-sysinfo.h"
 #include "hw/misc/armsse-cpuid.h"
 #include "hw/misc/armsse-mhu.h"
+#include "hw/misc/armsse-cpu-pwrctrl.h"
 #include "hw/misc/unimp.h"
 #include "hw/or-irq.h"
 #include "hw/clock.h"
@@ -179,6 +180,8 @@ struct ARMSSE {
 
     ARMSSECPUID cpuid[SSE_MAX_CPUS];
 
+    ARMSSECPUPwrCtrl cpu_pwrctrl[SSE_MAX_CPUS];
+
     /*
      * 'container' holds all devices seen by all CPUs.
      * 'cpu_container[i]' is the view that CPU i has: this has the
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index ec9c30e0996..2366c49376d 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -66,6 +66,7 @@ struct ARMSSEInfo {
     bool has_cachectrl;
     bool has_cpusecctrl;
     bool has_cpuid;
+    bool has_cpu_pwrctrl;
     bool has_sse_counter;
     Property *props;
     const ARMSSEDeviceInfo *devinfo;
@@ -364,6 +365,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cachectrl = false,
         .has_cpusecctrl = false,
         .has_cpuid = false,
+        .has_cpu_pwrctrl = false,
         .has_sse_counter = false,
         .props = iotkit_properties,
         .devinfo = iotkit_devices,
@@ -381,6 +383,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cachectrl = true,
         .has_cpusecctrl = true,
         .has_cpuid = true,
+        .has_cpu_pwrctrl = false,
         .has_sse_counter = false,
         .props = armsse_properties,
         .devinfo = sse200_devices,
@@ -660,6 +663,15 @@ static void armsse_init(Object *obj)
             g_free(name);
         }
     }
+    if (info->has_cpu_pwrctrl) {
+        for (i = 0; i < info->num_cpus; i++) {
+            char *name = g_strdup_printf("cpu_pwrctrl%d", i);
+
+            object_initialize_child(obj, name, &s->cpu_pwrctrl[i],
+                                    TYPE_ARMSSE_CPU_PWRCTRL);
+            g_free(name);
+        }
+    }
     if (info->has_sse_counter) {
         object_initialize_child(obj, "sse-counter", &s->sse_counter,
                                 TYPE_SSE_COUNTER);
@@ -1255,6 +1267,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      *  0x50010000: L1 icache control registers
      *  0x50011000: CPUSECCTRL (CPU local security control registers)
      *  0x4001f000 and 0x5001f000: CPU_IDENTITY register block
+     * The SSE-300 has an extra:
+     *  0x40012000 and 0x50012000: CPU_PWRCTRL register block
      */
     if (info->has_cachectrl) {
         for (i = 0; i < info->num_cpus; i++) {
@@ -1301,6 +1315,18 @@ static void armsse_realize(DeviceState *dev, Error **errp)
             memory_region_add_subregion(&s->cpu_container[i], 0x4001F000, mr);
         }
     }
+    if (info->has_cpu_pwrctrl) {
+        for (i = 0; i < info->num_cpus; i++) {
+            MemoryRegion *mr;
+
+            if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpu_pwrctrl[i]), errp)) {
+                return;
+            }
+
+            mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cpu_pwrctrl[i]), 0);
+            memory_region_add_subregion(&s->cpu_container[i], 0x40012000, mr);
+        }
+    }
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc[1]), errp)) {
         return;
-- 
2.20.1

