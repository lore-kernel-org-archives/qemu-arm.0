Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1183752ejc;
        Mon, 13 Nov 2023 00:18:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZ/2hfNYM8qZ2E9vCd3QuQ80dhwL8FTq2ZpZvYHRJ5YZq++MUSYC5Z2WT1pJl0nf+fJ8HT
X-Received: by 2002:a05:6a20:9148:b0:181:5ee9:ba93 with SMTP id x8-20020a056a20914800b001815ee9ba93mr4124183pzc.26.1699863485824;
        Mon, 13 Nov 2023 00:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699863485; cv=none;
        d=google.com; s=arc-20160816;
        b=AnghxWgpXRk5tSEOKDckhTF7ilm2WtCdnzr8NkVAJIv2yDqvgdX9rR5G0Pd4UFIjNn
         oKKtO0kTexixU+92pTP5qeABAvkPxythv1p2XySyXlT5fJlCs9L+QMxQ4WxcxYx8XKY4
         S4aLojtRph07eFoo0/LJ7HxVg6pfpmtbTTDtjAE8daZ874SuGGgfz6OlFp4QwsdXfmmq
         +bg8ChJULKYLae8ehiomVLBw4tTVWn082ZKCcbV2UW79gQf7zKXZs0NhtPjKDPwaBpgq
         L276nGJFSF+MDAbUou3JmwuTVEMW/XD5X5e7oAql5Yq2QM7qd0MQejJfC3a5f/5+bVTU
         K1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q42X0BrKYlxA1k6mvCtM7nD6PBtAE2gh+Zb8mj4NqmM=;
        fh=d6+BkVm0ifGLgnuS8wfve+0UfThL1WbA9n/WeHHIz+g=;
        b=ZT+P0ZEijs6tn6dp2vCl6vFHNAj+Kez2ObkwbIG0jpr3kqXkBnp0HoIRAwhY5RMTMD
         yxG/1sG3w9lvOW7p3GYrhG1nkoHOMw8knUxZ0F2hQCIBh8fSWHboa39IUrO9jv7KI/OW
         xmpu7SkZb6eQI4H16f7h8JpXCXHvJXoNV3u/vFGmnXvXsKT1NDckaz+h4DXer89VVJvC
         cHs7LDYjaMgw9XfBQSYbSj+V1My9qnyTLH+8EeC1yo8VBdPvmtxKy2671W0ZHgE94p9o
         MpcQLXIdf1jGDsRxNTThCmNDUBO8FinHvUzMCUGmwRb0ZqJXEK7ESiYU2octqKaZ23RM
         dUaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LpkxvFZL;
       spf=pass (google.com: domain of kvm+bounces-1581-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-1581-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-1581-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d7-20020a056a00244700b006c4d3cd9132si5414811pfj.0.2023.11.13.00.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 00:18:05 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-1581-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LpkxvFZL;
       spf=pass (google.com: domain of kvm+bounces-1581-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-1581-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7179280C52
	for <alex.bennee@linaro.org>; Mon, 13 Nov 2023 08:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEE915ADC;
	Mon, 13 Nov 2023 08:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LpkxvFZL"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F140915AD3
	for <kvm@vger.kernel.org>; Mon, 13 Nov 2023 08:17:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599D510F0
	for <kvm@vger.kernel.org>; Mon, 13 Nov 2023 00:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699863476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q42X0BrKYlxA1k6mvCtM7nD6PBtAE2gh+Zb8mj4NqmM=;
	b=LpkxvFZLpMu8cm535qFiR7QuR7/56kcHdXRyDzBAUTj14H5WOfkiXK/pGLWAohcBr2wBoC
	PvS6Hn29NygInexHFiaKn7CCdrExcEktDC7CXVxdz8kuKnDtRg/DVHuwY5TAw8ZgR3pTae
	vd2I6K8bnSCyes3K/1jB3ppzBPV/GSo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-255-tb-QDpZDOFuZcXOUGt6lPA-1; Mon,
 13 Nov 2023 03:17:51 -0500
X-MC-Unique: tb-QDpZDOFuZcXOUGt6lPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97A843813BC4;
	Mon, 13 Nov 2023 08:17:51 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 837A22026D4C;
	Mon, 13 Nov 2023 08:17:51 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-arm@nongnu.org
Cc: eric.auger@redhat.com,
	Shaoqin Huang <shahuang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	qemu-devel@nongnu.org
Subject: [PATCH v1] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Date: Mon, 13 Nov 2023 03:17:13 -0500
Message-Id: <20231113081713.153615-1-shahuang@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-TUID: 97MaM8kr4LuM

The KVM_ARM_VCPU_PMU_V3_FILTER provide the ability to let the VMM decide
which PMU events are provided to the guest. Add a new option
`pmu-filter` as -accel sub-option to set the PMU Event Filtering.

The `pmu-filter` has such format:

  pmu-filter="{A,D}:start-end[;{A,D}:start-end...]"

The A means "allow" and D means "deny", start if the first event of the
range and the end is the last one. For example:

  pmu-filter="A:0x11-0x11;A:0x23-0x3a,D:0x30-0x30"

This will allow event 0x11 (The cycle counter), events 0x23 to 0x3a is
also allowed except the event 0x30 is denied, and all the other events
are disallowed.

Here is an real example shows how to use the PMU Event Filtering, when
we launch a guest by use kvm, add such command line:

  # qemu-system-aarch64 \
	-accel kvm,pmu-filter="D:0x11-0x11"

And then in guest, use the perf to count the cycle:

  # perf stat sleep 1

   Performance counter stats for 'sleep 1':

              1.22 msec task-clock                       #    0.001 CPUs utilized
                 1      context-switches                 #  820.695 /sec
                 0      cpu-migrations                   #    0.000 /sec
                55      page-faults                      #   45.138 K/sec
   <not supported>      cycles
           1128954      instructions
            227031      branches                         #  186.323 M/sec
              8686      branch-misses                    #    3.83% of all branches

       1.002492480 seconds time elapsed

       0.001752000 seconds user
       0.000000000 seconds sys

As we can see, the cycle counter has been disabled in the guest, but
other pmu events are still work.

Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
---
 include/sysemu/kvm_int.h |  1 +
 qemu-options.hx          | 16 +++++++++++++
 target/arm/kvm.c         | 22 ++++++++++++++++++
 target/arm/kvm64.c       | 49 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)

diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index fd846394be..8f4601474f 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -120,6 +120,7 @@ struct KVMState
     uint32_t xen_caps;
     uint16_t xen_gnttab_max_frames;
     uint16_t xen_evtchn_max_pirq;
+    char *kvm_pmu_filter;
 };
 
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
diff --git a/qemu-options.hx b/qemu-options.hx
index 42fd09e4de..dd3518092c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -187,6 +187,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "                tb-size=n (TCG translation block cache size)\n"
     "                dirty-ring-size=n (KVM dirty ring GFN count, default 0)\n"
     "                eager-split-size=n (KVM Eager Page Split chunk size, default 0, disabled. ARM only)\n"
+    "                pmu-filter={A,D}:start-end[;...] (KVM PMU Event Filter, default no filter. ARM only)\n"
     "                notify-vmexit=run|internal-error|disable,notify-window=n (enable notify VM exit and set notify window, x86 only)\n"
     "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 SRST
@@ -259,6 +260,21 @@ SRST
         impact on the memory. By default, this feature is disabled
         (eager-split-size=0).
 
+    ``pmu-filter={A,D}:start-end[;...]``
+        KVM implements pmu event filtering to prevent a guest from being able to
+	sample certain events. It has the following format:
+
+	pmu-filter="{A,D}:start-end[;{A,D}:start-end...]"
+
+	The A means "allow" and D means "deny", start if the first event of the
+	range and the end is the last one. For example:
+
+	pmu-filter="A:0x11-0x11;A:0x23-0x3a,D:0x30-0x30"
+
+	This will allow event 0x11 (The cycle counter), events 0x23 to 0x3a is
+	also allowed except the event 0x30 is denied, and all the other events
+	are disallowed.
+
     ``notify-vmexit=run|internal-error|disable,notify-window=n``
         Enables or disables notify VM exit support on x86 host and specify
         the corresponding notify window to trigger the VM exit if enabled.
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7903e2ddde..74796de055 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1108,6 +1108,21 @@ static void kvm_arch_set_eager_split_size(Object *obj, Visitor *v,
     s->kvm_eager_split_size = value;
 }
 
+static char *kvm_arch_get_pmu_filter(Object *obj, Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+
+    return g_strdup(s->kvm_pmu_filter);
+}
+
+static void kvm_arch_set_pmu_filter(Object *obj, const char *pmu_filter,
+                                    Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+
+    s->kvm_pmu_filter = g_strdup(pmu_filter);
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
     object_class_property_add(oc, "eager-split-size", "size",
@@ -1116,4 +1131,11 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
 
     object_class_property_set_description(oc, "eager-split-size",
         "Eager Page Split chunk size for hugepages. (default: 0, disabled)");
+
+    object_class_property_add_str(oc, "pmu-filter",
+                                  kvm_arch_get_pmu_filter,
+                                  kvm_arch_set_pmu_filter);
+
+    object_class_property_set_description(oc, "pmu-filter",
+        "PMU Event Filtering description for guest pmu. (default: NULL, disabled)");
 }
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 3c175c93a7..ce03b22312 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <asm-arm64/kvm.h>
 #include <sys/ioctl.h>
 #include <sys/ptrace.h>
 
@@ -131,16 +132,64 @@ static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
     return true;
 }
 
+static void kvm_arm_pmu_filter_init(CPUState *cs)
+{
+    struct kvm_pmu_event_filter filter;
+    struct kvm_device_attr attr = {
+        .group      = KVM_ARM_VCPU_PMU_V3_CTRL,
+        .attr       = KVM_ARM_VCPU_PMU_V3_FILTER,
+    };
+    KVMState *kvm_state = cs->kvm_state;
+    char *tmp;
+    char *str, act;
+
+    if (!kvm_state->kvm_pmu_filter)
+        return;
+
+    tmp = g_strdup(kvm_state->kvm_pmu_filter);
+
+    for (str = strtok(tmp, ";"); str != NULL; str = strtok(NULL, ";")) {
+        unsigned short start = 0, end = 0;
+
+        sscanf(str, "%c:%hx-%hx", &act, &start, &end);
+        if ((act != 'A' && act != 'D') || (!start && !end)) {
+            error_report("skipping invalid filter %s\n", str);
+            continue;
+        }
+
+        filter = (struct kvm_pmu_event_filter) {
+            .base_event     = start,
+            .nevents        = end - start + 1,
+            .action         = act == 'A' ? KVM_PMU_EVENT_ALLOW :
+                                           KVM_PMU_EVENT_DENY,
+        };
+
+        attr.addr = (uint64_t)&filter;
+        if (!kvm_arm_set_device_attr(cs, &attr, "PMU Event Filter")) {
+            error_report("Failed to init PMU Event Filter\n");
+            abort();
+        }
+    }
+
+    g_free(tmp);
+}
+
 void kvm_arm_pmu_init(CPUState *cs)
 {
     struct kvm_device_attr attr = {
         .group = KVM_ARM_VCPU_PMU_V3_CTRL,
         .attr = KVM_ARM_VCPU_PMU_V3_INIT,
     };
+    static bool pmu_filter_init = false;
 
     if (!ARM_CPU(cs)->has_pmu) {
         return;
     }
+    if (!pmu_filter_init) {
+        kvm_arm_pmu_filter_init(cs);
+        pmu_filter_init = true;
+    }
+
     if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
         error_report("failed to init PMU");
         abort();
-- 
2.40.1

