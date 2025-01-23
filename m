Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485713njk;
        Thu, 23 Jan 2025 15:46:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAeTcRS7q6vsrcoRf4N0d8u1FPerYoFgOsXbJDM8Wm9j2X6G34ebED8kNiIlzXunnh+0iv0xY3CgY//A==@linaro.org
X-Received: by 2002:a5d:6347:0:b0:386:36e7:f44f with SMTP id ffacd0b85a97d-38bf56627e4mr18252978f8f.18.1737675971407;
        Thu, 23 Jan 2025 15:46:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675971; cv=none;
        d=google.com; s=arc-20240605;
        b=bchYwOQbBLY4OeOEgAS81Wm7U7YbGMAlkcjXq83MdfK79Wzqek2Gzjhvzf9e24BI+g
         KpS4cZEvoZqGj+Do+frhqgVQ0ecIs9+KC9q+Jx8f/yrBmqyMMWWx9HNhjOmIpXdr7Td2
         SksI5dcOejkFrkT+RfBDql7Bw2MOk2R6xkCWrPD2ySr0YgdqYAxBUCoU+K+GDkTFji1n
         RLH0Cr4eBFgAfc+7+HduJIWaXgrdYAvuu7Oo1cJ8qjEnpUlBlzzzpR+UWf0TCaOYAmQZ
         yHSfwTkiOCFHRRg/i+XMuhj+/Edu6pspUBeBIoNxqGqfGeMYezxfTrGUp6wrv1GexEtZ
         UVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xSu/7xOdAlhOhpGqndt0dd/xIMB7MzmL+xgNpZ/1JvM=;
        fh=hUF7Sjgh3pxWrdrI7fYUFHBDG6cafeFclsbKJFBbS1I=;
        b=KIepb3p1wAtmdzEn6/4CGkSitYjCqOjChtL52j7UEvvcnE3y+eNg6v0d041bIH8o2h
         DGjGrPlvIteKecCjiQjHlV8d3UnNj5sJc4VWJdgqHHHLg86iV9ov73uOFecpMjFyT2hq
         Cfkp6DLxDjUuFbo0K3ykhk+a4ZdMDOiD6LGbh1hdkAqvAFW9O0FldQ24dHcUrdCELLwN
         n0mwPUe/vo55/ho9xgalmrYdCoipceHO5ZYCgusa8fR4yhJ8ZTiVY21rjAyA5462FdP1
         eC4KgFTLZ8XdWCC2+qRzNWeMnfCiQ79s3tLOWcs3x7jAOua3ayTcNyMeqPbbM39tdHLk
         OlGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gMgHUbka;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c2a1c7872sor290924f8f.9.2025.01.23.15.46.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:46:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gMgHUbka;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675971; x=1738280771; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSu/7xOdAlhOhpGqndt0dd/xIMB7MzmL+xgNpZ/1JvM=;
        b=gMgHUbkaH7WRbRyqlKhF38A9W54EVZtdS4r3tyJw4KYEx0B4zx9ZNr26klO7+SGVsC
         vTI4N80WFGDhtA5CShFB/8JLqtsXUFpkWz6pHlPgWznbNWZL85nqstJPv3ywmfjxkbrP
         bLdgqD6ZievIZngOwh6f8U11eNirmDxyjWvF2FrTZhSVdDFe7amgmUcFblN4rcHdGZsh
         naJPwXhOcAtGLtA/H6QfhiQQk2TKeqtCuweJq2jxExa8shQmuKKzojgw1OMDvzntzCw2
         2WRm4abvnQcmxpmN23L+Ej2YBtDh6zsStQg0oUhMTAKMNc3XFCkOLa46jDAmpBkebzd5
         38DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675971; x=1738280771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSu/7xOdAlhOhpGqndt0dd/xIMB7MzmL+xgNpZ/1JvM=;
        b=DYMkm3r2SJZp+3RdnRGBexto0W0qcj7ysYItuE3UwAeAmfh4jc1usxTVK9zglFIuJS
         siP7RPoMVAcKYA+RRu3rK1d2Y2gsGZrqi3G+0LTSQJjVi8IJ+URy3+fngo3d6CjiXRSv
         Hg3BVaL/ou9Y0KII+CLSwhTDmavDvxecmUhy96m8RSIecZ9QTVQqO82Dp4TJVub6A7h0
         D3brrSuTKbJqpa/J7FKDUC02TeM5/yZvxxY5p2/WUfscqXWHSve9zX6j/+0ybu3DEYrE
         qN/tAshrSTzFBjstwyLPj27YXYwtRJnF7aZRnnQQJKK+e/oozo5twQN/YicbD+ZzmYKo
         29Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVJNwGYduFPUy8l7PxBuLjASD93yntfbBJrpxIgQD0eB6AavlmDT0m1AAdMiRSzVhk70YYNBTXTtbrKRA==@linaro.org
X-Gm-Message-State: AOJu0YxzA35QYHjKJmYgdRuHYVU4w2GYqT6NtnteiS+u8U/OwSOEOx5X
	NwK57SWyMHFKBH9yY6/a2myKYKzQIpdb5D7IQXE/5HLDVaLZmxh2gnykHMlDyKJ7LA==
X-Gm-Gg: ASbGncveLAulw9V1vQpHzFOnithAFm8DB+sTtdv45U7jrvTFUXx/YZP86M3+1kMbpP0
	9Ra1RdpdM6GX3H3hzQbmTCxe+OWz/Rx6Rl3tCYJoljPp/9v7DQT0C2rgacqYn3tAW6jQRxOnNVy
	upp4zRfdZQVwAgLVJA2F7gGjhfjlVBJMRFYBSppJB6DbT0sEc0Vrjg4mB/db88Ujg18V53VQ/Tw
	n8C1kqjFQUNJrV9k4n0bsr9sRu+f4kDWnEjehy0woSXpd37z+8BvhX9DGtD2xYFJo9Nt6k3W6Dy
	jTzuOgwRdybokcXJ85QMXF94TS2G4BTZ82IJL4u4ckDk72HsG1I+GhQ=
X-Google-Smtp-Source: AGHT+IFycJysfhMaCpSR16Rzr8MUGZyLqdkkV1WoJ+3KdF//Z7stLVwsFpncYG19E6JH49Nuy1YUSA==
X-Received: by 2002:a05:6000:e4a:b0:385:ed16:c91 with SMTP id ffacd0b85a97d-38bf566f3bemr20406552f8f.24.1737675970851;
        Thu, 23 Jan 2025 15:46:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4d34e3sm6953255e9.39.2025.01.23.15.46.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:46:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 20/20] cpus: Build cpu_exec_[un]realizefn() methods once
Date: Fri, 24 Jan 2025 00:44:14 +0100
Message-ID: <20250123234415.59850-21-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BdBPy86Yi6gt

Now that cpu_exec_realizefn() and cpu_exec_unrealizefn()
methods don't use any target specific definition anymore,
we can move them to cpu-common.c to be able to build them
once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Eventually they'll be absorbed within cpu_common_[un]realizefn().
---
 cpu-target.c         | 30 ------------------------------
 hw/core/cpu-common.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index bfcd48f9ae2..8f4477be417 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -19,43 +19,13 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "exec/replay-core.h"
-#include "exec/cpu-common.h"
 #include "exec/log.h"
 #include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
-#include "qemu/accel.h"
-#include "hw/core/cpu.h"
-
-bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
-{
-    if (!accel_cpu_common_realize(cpu, errp)) {
-        return false;
-    }
-
-    /* Wait until cpu initialization complete before exposing cpu. */
-    cpu_list_add(cpu);
-
-    cpu_vmstate_register(cpu);
-
-    return true;
-}
-
-void cpu_exec_unrealizefn(CPUState *cpu)
-{
-    cpu_vmstate_unregister(cpu);
-
-    cpu_list_remove(cpu);
-    /*
-     * Now that the vCPU has been removed from the RCU list, we can call
-     * accel_cpu_common_unrealize, which may free fields using call_rcu.
-     */
-    accel_cpu_common_unrealize(cpu);
-}
 
 char *cpu_model_from_type(const char *typename)
 {
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 71425cb7422..c5382a350fc 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -193,6 +193,20 @@ static void cpu_common_parse_features(const char *typename, char *features,
     }
 }
 
+bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
+{
+    if (!accel_cpu_common_realize(cpu, errp)) {
+        return false;
+    }
+
+    /* Wait until cpu initialization complete before exposing cpu. */
+    cpu_list_add(cpu);
+
+    cpu_vmstate_register(cpu);
+
+    return true;
+}
+
 static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cpu = CPU(dev);
@@ -234,6 +248,18 @@ static void cpu_common_unrealizefn(DeviceState *dev)
     cpu_exec_unrealizefn(cpu);
 }
 
+void cpu_exec_unrealizefn(CPUState *cpu)
+{
+    cpu_vmstate_unregister(cpu);
+
+    cpu_list_remove(cpu);
+    /*
+     * Now that the vCPU has been removed from the RCU list, we can call
+     * accel_cpu_common_unrealize, which may free fields using call_rcu.
+     */
+    accel_cpu_common_unrealize(cpu);
+}
+
 static void cpu_common_initfn(Object *obj)
 {
     CPUState *cpu = CPU(obj);
-- 
2.47.1
