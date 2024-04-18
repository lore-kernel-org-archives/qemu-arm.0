Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952128ejd;
        Thu, 18 Apr 2024 12:25:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQ7YAw3q99HbZdHjWu/4VyWO5PKh0UskK209cz2OhKZuZNmVK63/UkxUOHRVc9/XvT4L3nlk5CQnzAMl2MWHoQ80und2Br
X-Received: by 2002:a05:6512:143:b0:516:afeb:e27e with SMTP id m3-20020a056512014300b00516afebe27emr1416lfo.29.1713468335454;
        Thu, 18 Apr 2024 12:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468335; cv=none;
        d=google.com; s=arc-20160816;
        b=IH5YS58COAm92X1ASfk/h8wgUjE8C/mk8OihW7jl3dD+LMEjpOLLoLggvRDxPa0lru
         rDF+PxSB74iu5O3VAwN4QRqPD7clalnIZzk0hIpYAMvKewh5YFO05bAsdbODcJ/QNLjx
         QDE1Y2m0EJ5cIqGv2e5zOkpLwQRmgwK+0hoIMheRk1XNa1nEW6WLUcbB/MyMlMElqJuC
         MmvuK5h+OO+aQraOLyzEhbpYrzNHPlotByQRF3RZBE+odRQRoY8/6UuKPs8qu4ARvMUC
         yeT+N8sBFybzvgE88WsKNMscoDEHq34Sz9Y2hZpq46pD7CBn4DwX7LrvnVacf5a5BLR0
         xjHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=a05kQu+3IE9JJfcYC8SvHu7OLyLA4nojU3zTAPx26K0=;
        fh=IDGypcbZ2AyrsKlLtVqhRT2zpGeBOTW177rM4N9vTFU=;
        b=N8NS1JbZeyOu6d/dezAawdgb9Ecyc2Ft4Bf1XHjoKy9Tr9yj0mIBxpGySG2H+PmW78
         8h3FeJYoGvVp4Kc7P6qbFLy/E0EJdUD0xWIltY46pHCWq+OLHM8QIuQMBX0fHCZOmu/K
         i56L8yuIPitxSPSivg/NU4XPvaJtYe4qvXFVomGJnYWAe7FRz0tLsu//R1dfCHUj/O+h
         K52MDbQp05UXPELY0cY1/04Vx2Guc2kU9W8KdF3lac5wLNOr3dFZxuInBf/xg49MHU/Z
         qzagquSMHmFQIRaq7NBdAH2QGv7Em18KjFT21mh20gpBu28g/eH/b/t6D2PfFhZiR5YB
         3E9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bZwIBxFN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a4-20020a19ca04000000b00516c0906ec3sor566375lfg.26.2024.04.18.12.25.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:25:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bZwIBxFN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468335; x=1714073135; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a05kQu+3IE9JJfcYC8SvHu7OLyLA4nojU3zTAPx26K0=;
        b=bZwIBxFNxXwEk5bknPvt+UfK/o2deO5ymc6Hd+IbyjAJ0y3KzGcNgOuMuB6DoFb7Ep
         mLerCjxb7KqyeRyl9NbwLUMwKCAT6GyO7RZosw8hwM2H60xoBqoTkeGhfHJk53XTgFiE
         eFtF3P6/CAdxKjfghkQcE4inpGZdiHtknjh0RoeJR9P4PEliJhBSopXJ2VQim8AdmHvd
         dyYWn5XheG+3cFqAmcDHWmj7YfA4P1eohEaJ5JedmhW6sEk9l3SFh4Nux/7Ekd7MLUSM
         jy5xXGSROj/E2u6IJxhP1H/zB5pA5RnMXt9z28LFhnHz6hFgRBee48agk7K+5zsXeGmJ
         GoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468335; x=1714073135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a05kQu+3IE9JJfcYC8SvHu7OLyLA4nojU3zTAPx26K0=;
        b=DyA+xG4LsPPSH0C8S7s0youIUJRPH3MS8r42gJrvsyVyWgYvP05TJfSC5btWWr2+vv
         QmRK4FFneAzVAzoXwUq8A+qxokTKJXAJOjFG4BjYiqnfcgKdZc7lMvnO1Qts0FSq92gk
         LmojHaxWDhldQR9+9I+VGf/kaoGXJqZFTDEfRY6lc6kUw4l6C3XSudPKctFVemazg+js
         C7u0kv4FqZyCApKybLX15ZqcMOkJ7/dywcqDZXEvqfFcDPk8OKHyr97KRTIzx/r6RAtR
         EjfoJbJWgT1/HwbFn3GEiAgKX55ky761gEIpgIJpQLqhasrIX8RCkcX11QmS/eqg/NI8
         iqIA==
X-Forwarded-Encrypted: i=1; AJvYcCVrt1Pt2uVmYFj5MVk6nvNGzx1U6CyNRj+yQ4PLCbHMp7+M0lczumegDxlp0dLU4nMzO8PSBpGdfolMqHHSdhGIuPO+vhXs
X-Gm-Message-State: AOJu0YwSWEwaUkoyWa/saRKdMD/WftuKkuDuf/1A9rClub+CwHwiTonk
	0pRkhb7HdhxcppcI2KV95sCrf5eOw1n1a8nyT0qHPNFU8xIvh+0kPWIuN6y+4J2urw==
X-Google-Smtp-Source: AGHT+IHfNUYllVyhV+QY71Ro4Kj4dJNcZ5I4DM2/UYYkrguyOxfOHqu9Q/5fh3sLLZjgbH1NDAnw6A==
X-Received: by 2002:a19:2d42:0:b0:519:67f6:cd93 with SMTP id t2-20020a192d42000000b0051967f6cd93mr2279810lft.49.1713468334923;
        Thu, 18 Apr 2024 12:25:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id h17-20020a1709070b1100b00a558206b2c5sm77249ejl.99.2024.04.18.12.25.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:25:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 01/24] exec: Declare MMUAccessType type in 'mmu-access-type.h' header
Date: Thu, 18 Apr 2024 21:25:00 +0200
Message-ID: <20240418192525.97451-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 44XYE2UmZwl/

The MMUAccessType enum is declared in "hw/core/cpu.h".
"hw/core/cpu.h" contains declarations related to CPUState
and CPUClass. Some source files only require MMUAccessType
and don't need to pull in all CPU* declarations. In order
to simplify, create a new "exec/mmu-access-type.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h        |  1 +
 include/exec/exec-all.h        |  1 +
 include/exec/mmu-access-type.h | 18 ++++++++++++++++++
 include/hw/core/cpu.h          |  8 +-------
 4 files changed, 21 insertions(+), 7 deletions(-)
 create mode 100644 include/exec/mmu-access-type.h

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 64e0319996..5b99666702 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -64,6 +64,7 @@
 
 #include "exec/memopidx.h"
 #include "exec/abi_ptr.h"
+#include "exec/mmu-access-type.h"
 #include "qemu/int128.h"
 #include "cpu.h"
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e932d364b6..5cddfea01b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -25,6 +25,7 @@
 #include "exec/abi_ptr.h"
 #include "exec/cpu_ldst.h"
 #endif
+#include "exec/mmu-access-type.h"
 #include "exec/translation-block.h"
 #include "qemu/clang-tsa.h"
 
diff --git a/include/exec/mmu-access-type.h b/include/exec/mmu-access-type.h
new file mode 100644
index 0000000000..28bbb05b94
--- /dev/null
+++ b/include/exec/mmu-access-type.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU MMU Access type definitions
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef EXEC_MMU_ACCESS_TYPE_H
+#define EXEC_MMU_ACCESS_TYPE_H
+
+typedef enum MMUAccessType {
+    MMU_DATA_LOAD  = 0,
+    MMU_DATA_STORE = 1,
+    MMU_INST_FETCH = 2
+#define MMU_ACCESS_COUNT 3
+} MMUAccessType;
+
+#endif
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3a66d8581e..5f0422493b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -25,6 +25,7 @@
 #include "exec/hwaddr.h"
 #include "exec/vaddr.h"
 #include "exec/memattrs.h"
+#include "exec/mmu-access-type.h"
 #include "exec/tlb-common.h"
 #include "qapi/qapi-types-run-state.h"
 #include "qemu/bitmap.h"
@@ -80,13 +81,6 @@ DECLARE_CLASS_CHECKERS(CPUClass, CPU,
     typedef struct ArchCPU CpuInstanceType; \
     OBJECT_DECLARE_TYPE(ArchCPU, CpuClassType, CPU_MODULE_OBJ_NAME);
 
-typedef enum MMUAccessType {
-    MMU_DATA_LOAD  = 0,
-    MMU_DATA_STORE = 1,
-    MMU_INST_FETCH = 2
-#define MMU_ACCESS_COUNT 3
-} MMUAccessType;
-
 typedef struct CPUWatchpoint CPUWatchpoint;
 
 /* see accel-cpu.h */
-- 
2.41.0
