Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp650989lfm;
        Sun, 16 May 2021 12:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP3VWk226QA4Mh3U5T+os3SmJ/w6EjDR7br+8rQeDMGrIUo0zs9Ov+R0udqxHCy7YZMQI7
X-Received: by 2002:a05:6638:134c:: with SMTP id u12mr53649889jad.5.1621195157890;
        Sun, 16 May 2021 12:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621195157; cv=none;
        d=google.com; s=arc-20160816;
        b=CVk3jGlIYn8e25A9e2iHA55+gbK9jUKB4DYjM1mRlyF7HlWqNlE5AZuHW+jGidym9O
         2tqgKYdQsulGIuHDABXIvcKf7l8WNsjNepH100Zk9Y48CYCCnEJUFEJt/0etOrAFKzwM
         sCox8OERZHJUuTw/7Q3opQFgurTUQpKE9stxDXz/Gm7zDPnaezmWeERp4HHPJWVlaRFR
         62ZkVfLdGntJ6YScdLQrSINA/RGkBtVK5mp4DrDOcMW1nJtNfaT1UootlumjyecGUcaB
         JLdKHH3MjVkJ0TV4I6WTmTiqWWVQmc+PfWCgBfl9u8BoBfhY2X7uROdWIwEjDqw0yzqJ
         zhSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=kLRRf8pbk2WS1iN68OHl1uIZxg8L8jilTmy9FmFopOE=;
        b=CK1MLlIHBEvrLbPZq8xa2G6/Rdvl59NA9G4U0R7UqNf9f8ESY+mCQFCp/CaNlXLMep
         V6DN5uxBxcTzUBSs0qp2V+qc71Aa+PCA6ThdwrQ2IybmEaMHY4LcPfEApYNu63w9wGIl
         9uHn00d+K3U58kpn14BVz+AkjYmq+6krRxh/+CHuSEgQUKP9iYmK6oH8VEJD7EgpucAE
         CuaFjH/HQqOyYzaFY+BEZCbItna3DSJxigkXTD/Lfvz6TH10gHyrdzcC2QTWavM04GR7
         czkqN67JsZDwmezpDDqDBNSECtXi1pxmuocx94HHt+rQpL1LWYQ2lex2zR4KiaB6hGV9
         luMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si15259224jao.56.2021.05.16.12.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 12:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liMuz-00022i-5n
	for alex.bennee@linaro.org; Sun, 16 May 2021 15:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMum-0001t0-D0; Sun, 16 May 2021 15:59:04 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45350 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMui-0008Dx-Ji; Sun, 16 May 2021 15:59:04 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id 0BC41608069F;
 Sun, 16 May 2021 21:58:59 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 04/19] hvf: Move hvf internal definitions into common header
Date: Sun, 16 May 2021 21:58:40 +0200
Message-Id: <20210516195855.28869-5-agraf@csgraf.de>
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
X-TUID: KWMRpEyw0Whx

Until now, Hypervisor.framework has only been available on x86_64 systems.
With Apple Silicon shipping now, it extends its reach to aarch64. To
prepare for support for multiple architectures, let's start moving common
code out into its own accel directory.

This patch moves a few internal struct and constant defines over.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 include/sysemu/hvf_int.h   | 30 ++++++++++++++++++++++++++++++
 target/i386/hvf/hvf-i386.h | 31 +------------------------------
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 4c657b054c..ef84a24dd9 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -13,6 +13,36 @@
 
 #include <Hypervisor/hv.h>
 
+/* hvf_slot flags */
+#define HVF_SLOT_LOG (1 << 0)
+
+typedef struct hvf_slot {
+    uint64_t start;
+    uint64_t size;
+    uint8_t *mem;
+    int slot_id;
+    uint32_t flags;
+    MemoryRegion *region;
+} hvf_slot;
+
+typedef struct hvf_vcpu_caps {
+    uint64_t vmx_cap_pinbased;
+    uint64_t vmx_cap_procbased;
+    uint64_t vmx_cap_procbased2;
+    uint64_t vmx_cap_entry;
+    uint64_t vmx_cap_exit;
+    uint64_t vmx_cap_preemption_timer;
+} hvf_vcpu_caps;
+
+struct HVFState {
+    AccelState parent;
+    hvf_slot slots[32];
+    int num_slots;
+
+    hvf_vcpu_caps *hvf_caps;
+};
+extern HVFState *hvf_state;
+
 void hvf_set_phys_mem(MemoryRegionSection *, bool);
 void assert_hvf_ok(hv_return_t ret);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index 94e5c788c4..76e9235524 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -18,39 +18,10 @@
 
 #include "qemu/accel.h"
 #include "sysemu/hvf.h"
+#include "sysemu/hvf_int.h"
 #include "cpu.h"
 #include "x86.h"
 
-/* hvf_slot flags */
-#define HVF_SLOT_LOG (1 << 0)
-
-typedef struct hvf_slot {
-    uint64_t start;
-    uint64_t size;
-    uint8_t *mem;
-    int slot_id;
-    uint32_t flags;
-    MemoryRegion *region;
-} hvf_slot;
-
-typedef struct hvf_vcpu_caps {
-    uint64_t vmx_cap_pinbased;
-    uint64_t vmx_cap_procbased;
-    uint64_t vmx_cap_procbased2;
-    uint64_t vmx_cap_entry;
-    uint64_t vmx_cap_exit;
-    uint64_t vmx_cap_preemption_timer;
-} hvf_vcpu_caps;
-
-struct HVFState {
-    AccelState parent;
-    hvf_slot slots[32];
-    int num_slots;
-
-    hvf_vcpu_caps *hvf_caps;
-};
-extern HVFState *hvf_state;
-
 void hvf_handle_io(CPUArchState *, uint16_t, void *, int, int, int);
 
 #ifdef NEED_CPU_H
-- 
2.30.1 (Apple Git-130)

