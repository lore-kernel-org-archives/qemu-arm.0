Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp654437lfm;
        Sun, 16 May 2021 13:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMsGEzzGIc7s3qm8dTD79NCWSx+OdNhEEEHQubgwAudWUBGhdL/siT3XcZrgKbB1rbAAn0
X-Received: by 2002:a05:6638:32a8:: with SMTP id f40mr53121073jav.84.1621195532180;
        Sun, 16 May 2021 13:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621195532; cv=none;
        d=google.com; s=arc-20160816;
        b=0hTAZkF26Qak3+gLBp/YX1gHgqa0wc2FTAoDBSuwSWvO+r1JsPCmouc9Du7hamNDVs
         zuel/mHt4M7fadloX5tQ2XJzjYxD7QIQxTkfKL+itLTdYVHypR5xDCcH689Z/cYQ7tY3
         vwUZsCaDhvEr8lo4mm6onjmmUD6uqLRBLdJ5NkmTe9eY48MHCM7qBCk+e0IQqh2HzEzC
         XVxXYGIKEUirRMPQhUsv/sjW7LNCebz0WjBmS07GEOg7eW0rHXccwL42qcgJRaxMTYXy
         BUPaz359QYdNng4gyQQL3K58hvTztCysKy51zRCy0X3wmn8XNd9IRQNoajCFKFVSCzvz
         eHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=/9jjT2FZ+8MwB51M74z8XNLij/tr3VPqOr6qA0wKvbU=;
        b=SYGvLOOX3rvYACPR42VmAzZ1Wi4KNswCSq23EdhCQiR7HrlNxhprt1Pbkvh3V/ip7B
         8U0YzoFc2f5F9IPlUT+6Cu4lRZfwJg7kJUyUO/oi6qKB6kxjXDP2QzQs3HBAt+ULWz9g
         A7GCTVh8OMfknLNKQhrG7oL3YLT55Xl9MG6CSpIOtz7q32tbUySBiNbAh+SYxBFhO1HG
         0mRD1NPPMGU8WY74D8cuKRy0sxZWGB7EZD1bR9t00R+OsdYNVkmDZ3dwwFzOb49yehhK
         EB1vRY3o7k28qdIEEsPE0931L9Kwkk3E7zLI979AEDXaUY9b/b5BQebZMpWvK9X1upi7
         LvpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si14185789ilh.46.2021.05.16.13.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 13:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liN11-0007gZ-Gk
	for alex.bennee@linaro.org; Sun, 16 May 2021 16:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMv9-0003U7-AV; Sun, 16 May 2021 15:59:27 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45422 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMv7-0008Gx-21; Sun, 16 May 2021 15:59:26 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id C1DCB6080516;
 Sun, 16 May 2021 21:59:02 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 10/19] hvf: Remove hvf-accel-ops.h
Date: Sun, 16 May 2021 21:58:46 +0200
Message-Id: <20210516195855.28869-11-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
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
X-TUID: x7udKdlM1EAu

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

