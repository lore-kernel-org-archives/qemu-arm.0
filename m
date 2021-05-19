Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1829494lfm;
        Wed, 19 May 2021 13:26:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP9B/xsr5aETuJaRtzXKLjG957rkhjdzWsDb2RGPbv1MBqRF01Ku/aoUixCKyxbMhwlzlo
X-Received: by 2002:a6b:ef04:: with SMTP id k4mr1539998ioh.182.1621455992870;
        Wed, 19 May 2021 13:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621455992; cv=none;
        d=google.com; s=arc-20160816;
        b=xoQujmKZ5iEL8PFqt2ltmDpQfjt2X/686oj4j7UtZLo/mlfUKiddz3U/C9e/MhZfq5
         4EnPT6hvjiigC7qBhPMB5QGb91n4WInJoUdKs+WD9NrIja0c52bhj9IiE0VSgCQFoUrF
         MDR4/M+uCyb4yViIuIKrB+N946WRY0w7FIYgleE8caomKKW1CNqiRkt1aQeks36cTlpi
         j+IYG5OSuAbSzHhVKDbfvAjP4av0ZN0t3f/teryNseup11Lr/98HBhWaRSJNCRCByZzn
         AN1EMqRZoEiNJV/O2RCS2WEqecWJtmioxZgk3DeqaoFkxU2/8MbX9iPtyNqpEN7dAuPJ
         NGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=/9jjT2FZ+8MwB51M74z8XNLij/tr3VPqOr6qA0wKvbU=;
        b=H1RhGX0vaIBo5XI/YU6aW8UbgtWFqUPTRUvIeymU4Ko95YbXl7aEGBWyNLKb7bN3yH
         79mF/k+38NnsaN3NrYwEveCfGduLo3KC5F8Vty5IlPE1zf/tbpHNsgvsZk73oqhavFFi
         x8sOfHNh9P4Wr5cEiULaKFsqeAUdXyDZ0Y7E215zr3CHXo0HrE19ewEYAvL7Wp8WPXeX
         cGQJIpoZsxgPamDBKhQXWdDko3CUYF9GKlwcof3bk448e7dDqoXkxscGZlIhb2UTVOR4
         wCo4sYqv2+fnS0B3+RTFGJfQ7a/F0NeziP50nT5Bun3kLrbLDIosNk5o727IpvFOUB+P
         GIkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si336811ioz.27.2021.05.19.13.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:26:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljSm0-0004NG-5p
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSj2-0004oZ-MV; Wed, 19 May 2021 16:23:30 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48276 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSim-0003JO-L6; Wed, 19 May 2021 16:23:28 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id 634D660806A6;
 Wed, 19 May 2021 22:23:01 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 10/19] hvf: Remove hvf-accel-ops.h
Date: Wed, 19 May 2021 22:22:44 +0200
Message-Id: <20210519202253.76782-11-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210519202253.76782-1-agraf@csgraf.de>
References: <20210519202253.76782-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2bnVYG/dI4ZE

We can move the definition of hvf_vcpu_exec() into our internal
hvf header, obsoleting the need for hvf-accel-ops.h.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c |  2 --
 accel/hvf/hvf-accel-ops.h | 17 -----------------
 include/sysemu/hvf_int.h  |  1 +
 target/i386/hvf/hvf.c     |  2 --
 4 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 100644 accel/hvf/hvf-accel-ops.h

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 69741ce708..14fc49791e 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -58,8 +58,6 @@
 #include "sysemu/runstate.h"
 #include "qemu/guest-random.h"
 
-#include "hvf-accel-ops.h"
-
 HVFState *hvf_state;
 
 /* Memory slots */
diff --git a/accel/hvf/hvf-accel-ops.h b/accel/hvf/hvf-accel-ops.h
deleted file mode 100644
index 018a4e22f6..0000000000
--- a/accel/hvf/hvf-accel-ops.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * Accelerator CPUS Interface
- *
- * Copyright 2020 SUSE LLC
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef HVF_CPUS_H
-#define HVF_CPUS_H
-
-#include "sysemu/cpus.h"
-
-int hvf_vcpu_exec(CPUState *);
-
-#endif /* HVF_CPUS_H */
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 80c1a8f946..fd1dcaf26e 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -46,6 +46,7 @@ extern HVFState *hvf_state;
 void assert_hvf_ok(hv_return_t ret);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
+int hvf_vcpu_exec(CPUState *);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index c7132ee370..02f7be6cfd 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -73,8 +73,6 @@
 #include "qemu/accel.h"
 #include "target/i386/cpu.h"
 
-#include "hvf-accel-ops.h"
-
 void vmx_update_tpr(CPUState *cpu)
 {
     /* TODO: need integrate APIC handling */
-- 
2.30.1 (Apple Git-130)

