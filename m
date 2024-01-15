Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp78477ejf;
        Mon, 15 Jan 2024 00:02:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrdlB/7PzraROhxexKzVy3WmCT+T4zWtLqZ0RIFsXDtODTDS2YmKE1jF61s2Uh97/e4kqq
X-Received: by 2002:a05:6358:2810:b0:175:86cb:4d62 with SMTP id k16-20020a056358281000b0017586cb4d62mr6430006rwb.39.1705305719761;
        Mon, 15 Jan 2024 00:01:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705305719; cv=none;
        d=google.com; s=arc-20160816;
        b=b4+G8R8mcynQK/6v3ynRQzrRBvDID1dTiqshHn6A4uRLffNzShuM1+L5OwfqquJKVc
         Q5FLhYA43uoN79N9oLbdJSb7ik9F5c0p5Qvu4NHMRdCXLY57I4nXQQdXNLU5a2XedC4d
         LSpM+QbWDDErmLL1ZHIZcKAZCQk7Q2uCbLlHr1B538/GkgTqUAcxTtjtEGsJPhG8YXRc
         jwnvJQE6RMoQZYocc1joBBtlycSJkVn66w46hw6I/zrXF9wRHJ1ziiH+HVT9mOqI7saZ
         lvl4sObTpFruMma3R6V1Z0hSMyCSlNpDmccusQPkyQgO9dep5ckCFunFfaASHHVLHOAJ
         JKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ImySdM6rVLcpykjYKF0CY09VSeZgLPq5jeZ421owvpE=;
        fh=2CmYTdCa5ca7Hmy2n2o5rVc8RblFPDg+Dk2/rDKaxhY=;
        b=FUa9LoForM+9AWJBuL0QKyLbxNFxfirYDtWw6WDFxhk1XrB0TzKsWASucrWeydQSuq
         FU91EaOKm7DnwTzaCVbItIgkGHdHcJbuR4yEFIQzxTXGvTnaguL3OMMyNOc18YrBHIsa
         900xSFMdUh3oZw/V4DFSTIkkCIW50anAcLRYt7M1srrCAJLwXHgzgwpoMOKAxEUNHZtK
         oDog/doEfPnDWgvDJ9wmlrkf2gVQ3Tl+XOQQ1Tk3+pi+ozMJwF9Toseqv37DyiBeVrOJ
         28vAzANU/cJmVVINjRH0fuSO4zLmwyK3FnKz/YaZsPR6spYmkz6l1Xn3fPoE/7BbRHwC
         rhOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YdXAgisB;
       spf=pass (google.com: domain of kvm+bounces-6204-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-6204-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-6204-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id x38-20020a634a26000000b005c688ef7549si8461719pga.98.2024.01.15.00.01.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 00:01:59 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6204-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YdXAgisB;
       spf=pass (google.com: domain of kvm+bounces-6204-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-6204-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EE85281A0E
	for <alex.bennee@linaro.org>; Mon, 15 Jan 2024 08:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6236FA6;
	Mon, 15 Jan 2024 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YdXAgisB"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944566FA4
	for <kvm@vger.kernel.org>; Mon, 15 Jan 2024 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705305712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ImySdM6rVLcpykjYKF0CY09VSeZgLPq5jeZ421owvpE=;
	b=YdXAgisB1SwC9SqMXoFk+aR8oEGxJSOOHFyxeLE1YM/OUJ/8hOu+xpsSn/Emnwox9XczrW
	Ml7+Cfv9UXPOH+vEyEDS0pSsLSM0fi6tEnSVOmQILAf8xWwmAURjiNLifusIgionJkQ6eb
	GP5PX9mYADsLAeCON2qfQC2R2ek2xho=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-W9tPWVHqOrGi1YlGmT-Fng-1; Mon, 15 Jan 2024 03:01:48 -0500
X-MC-Unique: W9tPWVHqOrGi1YlGmT-Fng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9422388CDCD;
	Mon, 15 Jan 2024 08:01:46 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 876AF1121306;
	Mon, 15 Jan 2024 08:01:46 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-arm@nongnu.org
Cc: Eric Auger <eauger@redhat.com>,
	Gavin Shan <gshan@redhat.com>,
	Shaoqin Huang <shahuang@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v5] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Date: Mon, 15 Jan 2024 03:01:44 -0500
Message-Id: <20240115080144.44944-1-shahuang@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: +kdEknmr5duq

The KVM_ARM_VCPU_PMU_V3_FILTER provides the ability to let the VMM decide
which PMU events are provided to the guest. Add a new option
`kvm-pmu-filter` as -cpu sub-option to set the PMU Event Filtering.
Without the filter, all PMU events are exposed from host to guest by
default. The usage of the new sub-option can be found from the updated
document (docs/system/arm/cpu-features.rst).

Here is an example shows how to use the PMU Event Filtering, when
we launch a guest by use kvm, add such command line:

  # qemu-system-aarch64 \
        -accel kvm \
        -cpu host,kvm-pmu-filter="D:0x11-0x11"

Since the first action is deny, we have a global allow policy. This
disables the filtering of the cycle counter (event 0x11 being CPU_CYCLES).

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
v4->v5:
  - Change the kvm-pmu-filter as a -cpu sub-option.     [Eric]
  - Comment tweak.                                      [Gavin]
  - Rebase to the latest branch.

v3->v4:
  - Fix the wrong check for pmu_filter_init.            [Sebastian]
  - Fix multiple alignment issue.                       [Gavin]
  - Report error by warn_report() instead of error_report(), and don't use
  abort() since the PMU Event Filter is an add-on and best-effort feature.
                                                        [Gavin]
  - Add several missing {  } for single line of code.   [Gavin]
  - Use the g_strsplit() to replace strtok().           [Gavin]

v2->v3:
  - Improve commits message, use kernel doc wording, add more explaination on
    filter example, fix some typo error.                [Eric]
  - Add g_free() in kvm_arch_set_pmu_filter() to prevent memory leak. [Eric]
  - Add more precise error message report.              [Eric]
  - In options doc, add pmu-filter rely on KVM_ARM_VCPU_PMU_V3_FILTER support in
    KVM.                                                [Eric]

v1->v2:
  - Add more description for allow and deny meaning in 
    commit message.                                     [Sebastian]
  - Small improvement.                                  [Sebastian]

 docs/system/arm/cpu-features.rst | 23 ++++++++++
 include/sysemu/kvm_int.h         |  1 +
 target/arm/cpu.h                 |  3 ++
 target/arm/kvm.c                 | 78 ++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index a5fb929243..44a797c50e 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -204,6 +204,29 @@ the list of KVM VCPU features and their descriptions.
   the guest scheduler behavior and/or be exposed to the guest
   userspace.
 
+``kvm-pmu-filter``
+  By default kvm-pmu-filter is disabled. This means that by default all pmu
+  events will be exposed to guest.
+
+  KVM implements PMU Event Filtering to prevent a guest from being able to
+  sample certain events. It depends on the KVM_ARM_VCPU_PMU_V3_FILTER
+  attribute supported in KVM. It has the following format:
+
+  kvm-pmu-filter="{A,D}:start-end[;{A,D}:start-end...]"
+
+  The A means "allow" and D means "deny", start is the first event of the
+  range and the end is the last one. The first registered range defines
+  the global policy(global ALLOW if the first @action is DENY, global DENY
+  if the first @action is ALLOW). The start and end only support hexadecimal
+  format now. For example:
+
+  kvm-pmu-filter="A:0x11-0x11;A:0x23-0x3a;D:0x30-0x30"
+
+  Since the first action is allow, we have a global deny policy. It
+  will allow event 0x11 (The cycle counter), events 0x23 to 0x3a is
+  also allowed except the event 0x30 is denied, and all the other events
+  are disallowed.
+
 TCG VCPU Features
 =================
 
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
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8c3ca2e231..1be7dca4aa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -971,6 +971,9 @@ struct ArchCPU {
 
     /* KVM steal time */
     OnOffAuto kvm_steal_time;
+
+    /* KVM PMU Filter */
+    char *kvm_pmu_filter;
 #endif /* CONFIG_KVM */
 
     /* Uniprocessor system with MP extensions */
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index c5a3183843..413ee2720e 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -495,6 +495,22 @@ static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
     ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
 }
 
+static char *kvm_pmu_filter_get(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    return g_strdup(cpu->kvm_pmu_filter);
+}
+
+static void kvm_pmu_filter_set(Object *obj, const char *pmu_filter,
+                               Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    g_free(cpu->kvm_pmu_filter);
+    cpu->kvm_pmu_filter = g_strdup(pmu_filter);
+}
+
 /* KVM VCPU properties should be prefixed with "kvm-". */
 void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
 {
@@ -516,6 +532,12 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
                              kvm_steal_time_set);
     object_property_set_description(obj, "kvm-steal-time",
                                     "Set off to disable KVM steal time.");
+
+    object_property_add_str(obj, "kvm-pmu-filter", kvm_pmu_filter_get,
+                            kvm_pmu_filter_set);
+    object_property_set_description(obj, "kvm-pmu-filter",
+                                    "PMU Event Filtering description for "
+                                    "guest PMU. (default: NULL, disabled)");
 }
 
 bool kvm_arm_pmu_supported(void)
@@ -1705,6 +1727,60 @@ static bool kvm_arm_set_device_attr(ARMCPU *cpu, struct kvm_device_attr *attr,
     return true;
 }
 
+static void kvm_arm_pmu_filter_init(ARMCPU *cpu)
+{
+    static bool pmu_filter_init;
+    struct kvm_pmu_event_filter filter;
+    struct kvm_device_attr attr = {
+        .group      = KVM_ARM_VCPU_PMU_V3_CTRL,
+        .attr       = KVM_ARM_VCPU_PMU_V3_FILTER,
+        .addr       = (uint64_t)&filter,
+    };
+    int i;
+    gchar **event_filters;
+
+    if (!cpu->kvm_pmu_filter) {
+        return;
+    }
+    if (kvm_vcpu_ioctl(CPU(cpu), KVM_HAS_DEVICE_ATTR, &attr)) {
+        warn_report("The KVM doesn't support the PMU Event Filter!");
+        return;
+    }
+
+    /*
+     * The filter only needs to be initialized through one vcpu ioctl and it
+     * will affect all other vcpu in the vm.
+     */
+    if (pmu_filter_init) {
+        return;
+    } else {
+        pmu_filter_init = true;
+    }
+
+    event_filters = g_strsplit(cpu->kvm_pmu_filter, ";", -1);
+    for (i = 0; event_filters[i]; i++) {
+        unsigned short start = 0, end = 0;
+        char act;
+
+        sscanf(event_filters[i], "%c:%hx-%hx", &act, &start, &end);
+        if ((act != 'A' && act != 'D') || (!start && !end)) {
+            warn_report("Skipping invalid PMU filter %s", event_filters[i]);
+            continue;
+        }
+
+        filter.base_event = start;
+        filter.nevents = end - start + 1;
+        filter.action = (act == 'A') ? KVM_PMU_EVENT_ALLOW :
+                                       KVM_PMU_EVENT_DENY;
+
+        if (!kvm_arm_set_device_attr(cpu, &attr, "PMU Event Filter")) {
+            break;
+        }
+    }
+
+    g_strfreev(event_filters);
+}
+
 void kvm_arm_pmu_init(ARMCPU *cpu)
 {
     struct kvm_device_attr attr = {
@@ -1715,6 +1791,8 @@ void kvm_arm_pmu_init(ARMCPU *cpu)
     if (!cpu->has_pmu) {
         return;
     }
+
+    kvm_arm_pmu_filter_init(cpu);
     if (!kvm_arm_set_device_attr(cpu, &attr, "PMU")) {
         error_report("failed to init PMU");
         abort();
-- 
2.40.1

