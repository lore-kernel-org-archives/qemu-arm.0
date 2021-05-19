Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1827692lfm;
        Wed, 19 May 2021 13:23:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysqqEv75rfbsaFQivaYR7rXWtjxYnCLNshnh590Xd7qLelz+r0liUC3RQlYxyt5QBKviH2
X-Received: by 2002:a05:6e02:1393:: with SMTP id d19mr965237ilo.90.1621455823049;
        Wed, 19 May 2021 13:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621455823; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPB2eQ5AsuUYAljQn2NV0aCs828pyEjAS2X/lJbiR6Zmw/pHAkMr/hz5H93Wx5Y9PB
         iaPTjj1AoSldyBKKQN3vGx+cCVCOPOEMfe41P/WRVneEOqydvbOkiVTuj+4tZN8uOA7F
         6futkbltvNQlL2VBwHBPGXytX3nQDsQTFRbT6LT8/hv6jYA5YFlmskoOonoLvqRqSn9D
         B/qC4aOYPyYpDj4b7zUZG6sOmwFes5AdkKw1zdRYbV86Pq22owra7aQRrDXDnWStg+PG
         wF9rjnpZqV/z+3rOQO3YAHOkti3+D2+FFIE3FOm/W0IHBjsik48k8QPJ8oTqzMvgbkiO
         4R4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=kLRRf8pbk2WS1iN68OHl1uIZxg8L8jilTmy9FmFopOE=;
        b=tNgMABphmvV/73YHJ1P2e/nE1F6ktiVXDxoEhyWGws0nsmYlp3WD0GCW9T/gwer3e8
         EuE+SiKxcnxyq/7KNN8KA+B+whc5EjsVSM/uNVRFbT/CB+IQ/hNcRNwF24V0aGPLXF5I
         Vf1AbIDU6dBK5sRg8leAnyyuagwdpNr4rBKOPNYsPsKaqzoJV/LtaG75A287JfFJvQ4z
         dvYfXgmh2BZXdROoLssUdJ4xClqT0nb3OFuEfhBuWGtZbYQN7oUDCfWGrJo/ZaZS4ZW9
         rkQ+OBV/TpfQ8PB5VdWoKOWiNahM+RR6UN4bOGrat839+o8EJB7bGFhM3mQ6KrhPZ+dS
         BqVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si617307iln.71.2021.05.19.13.23.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljSjG-0004MQ-AD
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSij-00042r-Au; Wed, 19 May 2021 16:23:10 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48142 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSic-0003Dz-PN; Wed, 19 May 2021 16:23:08 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id 9BC3C6080619;
 Wed, 19 May 2021 22:22:57 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 04/19] hvf: Move hvf internal definitions into common header
Date: Wed, 19 May 2021 22:22:38 +0200
Message-Id: <20210519202253.76782-5-agraf@csgraf.de>
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
X-TUID: tZaddBafwlfe

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

