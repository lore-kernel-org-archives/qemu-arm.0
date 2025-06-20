Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878247njc;
        Fri, 20 Jun 2025 06:08:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWF6Al3x1NrjT48SSVnpO+9fny01RXbz8pVhi2F8dYN4WitMVOC2K0/gBP2oAp/9v+JsNCJ2gHAYYfNGQ==@linaro.org
X-Received: by 2002:a05:600c:630c:b0:450:d104:29eb with SMTP id 5b1f17b1804b1-453656c2163mr25083995e9.5.1750424911877;
        Fri, 20 Jun 2025 06:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424911; cv=none;
        d=google.com; s=arc-20240605;
        b=lSB41xW8+HArohDcYLGm5gK8epx72u+gd9l5BAmQjOjVdGXxCTa4H00KgkXhOcVySz
         eYafUHJ/ZoJp5COkbO1Mby9suNLWflLa64hqqmnm7ynST5bV5UgULpXq/ll6TQ2E89kG
         0R1yTBXRx3W0PWl+rxSPOCfD2An3TcU2Y0nC1q/1OAcEnAz0nJ/oAdc44jtV641S5Jpq
         RDiUekmfp7JuR/AIGC+IhAbVtfTRpZ2vCoaJ045ZBBXmyWaGPILA2yTE3LiFUu2m82Vz
         6RMwSGmYZpAd4YvBL6pmx0zzl7hpf+4upiEII/D38j7bHC9MLadibT6eck7fzl2GnH+L
         /bFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FOQFF5IHVggEpZxvhH4Dg2y5NDppFE2+idPk4kXeUTw=;
        fh=tC/hg+rWjk6oUfNlDOR1NDVjJf404bQ913PiLGGRohk=;
        b=j23LzuQHnWU2vOXTinzBJbyRYLUqBLmgZAZwhcti0mM6fWi+u5Qy5vE8MBHp2trjM7
         S9hJTpDadnUSiPBSsm8UoUnHIp338CNWRsgKyxaeOTK2ZOwpRVBVMbM31mK60qdTQh/P
         VdFK9QRq0ACjFw+MrKSIO7Z+TKTrDDJftfR6qXvfHd386HpT/qjFbkVmQWtqXeAcXGpj
         o7Af2Q/M1TW7Zu/ffJVyGxmbqSJdLtV4nwR8x93FhEt/qpCs4po3jPqgq9O8+59Ekl0e
         8AhNzygmjxjeAdw0IJ1AQcKvsDMZ6iYh85HRb+3RztT+EhOIZKBDieVJfdqJooMI1/e6
         0crg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uBlaYId4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646db3d6sor7068195e9.4.2025.06.20.06.08.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:08:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uBlaYId4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424911; x=1751029711; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOQFF5IHVggEpZxvhH4Dg2y5NDppFE2+idPk4kXeUTw=;
        b=uBlaYId4+t7JpF+34e/SD6PQV0u5AJboEhzhSu+w1BDVYU1x/DZSzsJdQ7FYjIr33K
         ItE6UA/jVcdtQ8NL8yjeimpIc5Pd+nnLseWqFyCEqxEaJZugZGgVRJ1eG5Dh0ndG5yOa
         lX1dlMmbR95WUt3TCE18M10s8jTAlUf5iydkc0DTXBTULC6YBsmWM7qTWmRIBNqrcE8J
         I+/HEkXCFYLusNtYiE1B5zzq106yiG8E3FMxw97hiYps4kURtVGN9GkX+WjzsUpsRLVE
         KmdxkEnFSY2ZdO4nMGzLs31PAmvISNRJatTJQx6XFzQEoSy6ejKJ4QiFtzsxmqRexKLc
         mV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424911; x=1751029711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOQFF5IHVggEpZxvhH4Dg2y5NDppFE2+idPk4kXeUTw=;
        b=MH9LZiDPV6O4Pow55AP09WlEbzEvea7t505OA8me52bMzqUYzcvqwzlKeJk4xT+GMU
         cF7wSoK8FE3bYIW6VqKZz8kFEdkVq7nMn6QqrqwKLP7FqyqkHRwQU8MTDohFuWiGGPfT
         Fu7/HJF0/DKJe1SdhWZNotDXBFZaafDLOS+ZmpySeDRYxad2VbXARP8yX8oZDbLD6csn
         rbq1ijMJ+Vrx2mqgsAtngXMhY858P3QJH9SIRgxt5bzfl61j/Vp/DuJPtc3byMceiHYI
         ELl/u/wpQaSAW2Iaee6ANbSjOnJBC0VRuIzYTWU3aKLZt8yDsk9nFP+deDM1svPkbOpn
         pDGg==
X-Forwarded-Encrypted: i=1; AJvYcCUMJGqtu7mdsPLSPpVtRNM9FFhiycTQL+h+J6Q/nAO+82Nuwx6SjEbn827MWb1X1YfXT79DL1XyXq1UHw==@linaro.org
X-Gm-Message-State: AOJu0YxttXEgm7mnWlxtjG+at4xKgEpy4vX0LpOkFmh/stJhJQcT8G45
	Ij03Uur+2rHKJ58gANdvdXtdb3wtvOKYrvBuhgkOkgjFcnhcoOQazvGZCdqE6WC5AgRWfg==
X-Gm-Gg: ASbGncv4mRH54XdTFqQxA9QsLBi7zx7jwzC7b2sxlRKyvpHlZ0SfGvcXG3pZrRpj37g
	kB5M4AMIAZ8g8x5ur0A9ATjlIMHHArt/ShRDDLWyuN89xW2cKEjJj16u0btK8L/LvbG5idrr3YE
	mfneAWGo+Zv18lhQQjciGf/jOgVBlhHrnbbxf8AkF8+jdPrCRhbcUDOxG0fBpWW9Jiqjm8Tfjby
	tu2nHiiasWK8bMKzruhp8jD5X7iz9UYqUAr5z8Uo+lxpoIOHJDx8flyaTThTdfTt+bDFwHnIorf
	kfWVOVqjPIfLq5F9mXu0aqlxNmGe7ogVAS27vAW2dlLSWtaGrxgUyvs34OOKRuIamUgmC23/+ru
	5vMQio+YaArAjgZVPsEHRYavjFT9ICJowYSVA
X-Google-Smtp-Source: AGHT+IG5VJ2wmm6aaoN33zTA0rvHD7SHc9CVgH1xuOcv58TCSdw7oIYTR3igTV8EZ3sVBVJ+FyYcCw==
X-Received: by 2002:a05:6000:98f:b0:3a5:24a9:a5d3 with SMTP id ffacd0b85a97d-3a6d12a41ebmr2293268f8f.17.1750424911290;
        Fri, 20 Jun 2025 06:08:31 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c0f1sm2083859f8f.53.2025.06.20.06.08.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:08:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 14/26] accel: Keep reference to AccelOpsClass in AccelClass
Date: Fri, 20 Jun 2025 15:06:57 +0200
Message-ID: <20250620130709.31073-15-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tuV0QRzDqex3

Allow dereferencing AccelOpsClass outside of accel/accel-system.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/accel.h       | 3 +++
 include/system/accel-ops.h | 3 ++-
 accel/accel-common.c       | 1 +
 accel/accel-system.c       | 3 ++-
 accel/tcg/tcg-accel-ops.c  | 4 +++-
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index fbd3d897fef..9dea3145429 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -37,6 +37,9 @@ typedef struct AccelClass {
     /*< public >*/
 
     const char *name;
+    /* Cached by accel_init_ops_interfaces() when created */
+    AccelOpsClass *ops;
+
     int (*init_machine)(MachineState *ms);
     bool (*cpu_common_realize)(CPUState *cpu, Error **errp);
     void (*cpu_common_unrealize)(CPUState *cpu);
diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index 4c99d25aeff..44b37592d02 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -10,6 +10,7 @@
 #ifndef ACCEL_OPS_H
 #define ACCEL_OPS_H
 
+#include "qemu/accel.h"
 #include "exec/vaddr.h"
 #include "qom/object.h"
 
@@ -31,7 +32,7 @@ struct AccelOpsClass {
     /*< public >*/
 
     /* initialization function called when accel is chosen */
-    void (*ops_init)(AccelOpsClass *ops);
+    void (*ops_init)(AccelClass *ac);
 
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 4894b98d64a..56d88940f92 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "qemu/accel.h"
 #include "qemu/target-info.h"
+#include "system/accel-ops.h"
 #include "accel/accel-cpu.h"
 #include "accel-internal.h"
 
diff --git a/accel/accel-system.c b/accel/accel-system.c
index a0f562ae9ff..64bc991b1ce 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -85,8 +85,9 @@ void accel_init_ops_interfaces(AccelClass *ac)
      * non-NULL create_vcpu_thread operation.
      */
     ops = ACCEL_OPS_CLASS(oc);
+    ac->ops = ops;
     if (ops->ops_init) {
-        ops->ops_init(ops);
+        ops->ops_init(ac);
     }
     cpus_register_accel(ops);
 }
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index b24d6a75625..da2e22a7dff 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -198,8 +198,10 @@ static inline void tcg_remove_all_breakpoints(CPUState *cpu)
     cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
 
-static void tcg_accel_ops_init(AccelOpsClass *ops)
+static void tcg_accel_ops_init(AccelClass *ac)
 {
+    AccelOpsClass *ops = ac->ops;
+
     if (qemu_tcg_mttcg_enabled()) {
         ops->create_vcpu_thread = mttcg_start_vcpu_thread;
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
-- 
2.49.0
