Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA82CAC58E
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 14:50:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwicK-0001Cv-1W; Thu, 11 Sep 2025 10:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uwicE-0001Ak-CG
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 10:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uwicC-0004IL-D6
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 10:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757602175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qhARN+mNZ8/BVngVsPUupvVPf6ZiX6bQWjwA8ImXvMA=;
 b=F9+Dp/zez59AEqDBj8MT0Dwcfx6NtKb0XkO/mxSv3IRB1qXfIj1GLUrV68oqTkkiIu4eew
 vP/PDcNXeOC4C816ZGfPEOwZmADBjPPGcCPV+RAz2NWFPD9gyUIVbotPpTOXyNyuvpc6aM
 J6FZuwIlsh90hXXqyqgPhXHf90YPSto=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-6bVqJqsnPoCvhU79-nDdYA-1; Thu, 11 Sep 2025 10:49:33 -0400
X-MC-Unique: 6bVqJqsnPoCvhU79-nDdYA-1
X-Mimecast-MFC-AGG-ID: 6bVqJqsnPoCvhU79-nDdYA_1757602173
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45dcfc6558cso6075565e9.1
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 07:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602172; x=1758206972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhARN+mNZ8/BVngVsPUupvVPf6ZiX6bQWjwA8ImXvMA=;
 b=saI1Ssmvt0+0ZNTJWLlkHijkhGtvwwamKnPagrZpLPDGY8vVTYB2n8e5JL3Kipid8C
 z78M46jtMFAQe+9JCPw5itr5GZpDvZApIY/6UJj4sbrguxs5KG4tg5WdoA3rfxKGUwjN
 rwnGackk/5+AuTC05QvMhEnMBjtm4CSSiRYduGm5JSqNYMm4iylIVlXNgbQmwusyB6Y0
 9SBzjakRMgst6ghp5IJtCyDwkxkoUrIQ+eqC5MOebpCZjIcIvnfzRAeoGyaX3049EjK1
 HJ2aZsGRdO8GBAHwjkaqYE5mbhQkqRy//CuZLRvtcT3DpXq6dWMTHTFZTdyhwdEDvEC4
 svrA==
X-Gm-Message-State: AOJu0Ywf+oHiOhugA3Xp2/Im/uLkvgM9COHHQ8N2jIG6kp1UqyUUJqq2
 xk58tRXbdjv59PVOeV5edwTPWBkW60Lyhhagzw8cJ9d9CUEZnbZvDQkkoF/Hr7pEGngIofBTq70
 PApiLlSqBLQaKWltJXQSzjLqetbBT9gKDwhmIvQJ32Eyvvrh5i+pvTQ==
X-Gm-Gg: ASbGncsJYkh3wjKqwimBSvaWrgyw29tSSoXoZJdM+ZU3QP7/lwsReF39hVTBknGdUvA
 GyjRxvYfUKHRFIjWKxSsm99P5XLTiobcPGIC9VDgFUgcBbDlsNaNtmtz7QBmGWmE+Jwyh7PJI35
 vh9ae7VYtI0Np6IR/p5fhBKn2xxepOxepqi7uoU2iHWEaZ0m118K+VlUD/OboJfTZGCaSdbGBi3
 qYMPkc4wfncfpHw4vub1p/mR9/ffwwn+tIMsgNwz9V+PI/M+n+DQj1wgvqfWIKcOSjY9bGhyDor
 cBlWfLeXA2Wqx4MBzl92lih0TmG8zBFHghRNzqDadbN56LOcEirFsvsJEO/nnhT9WESdCPg2UHB
 ZEKZAiUavwGFsiSAdAFQzL1lRZMtz
X-Received: by 2002:a05:600c:458d:b0:45d:d50d:c0db with SMTP id
 5b1f17b1804b1-45dddea5102mr187737195e9.15.1757602172209; 
 Thu, 11 Sep 2025 07:49:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+kA6YZTRhZd5X5QimgLs1ZYj0Z47mJrQEG6Ss0yU0cL2ujYrc0KdLoKgcnkha3tXuafRtVg==
X-Received: by 2002:a05:600c:458d:b0:45d:d50d:c0db with SMTP id
 5b1f17b1804b1-45dddea5102mr187736895e9.15.1757602171717; 
 Thu, 11 Sep 2025 07:49:31 -0700 (PDT)
Received: from rh.redhat.com
 (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e0159c27csm14941575e9.8.2025.09.11.07.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:49:31 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH 2/2] target/arm/kvm: add kvm-psci-version vcpu property
Date: Thu, 11 Sep 2025 16:49:23 +0200
Message-ID: <20250911144923.24259-3-sebott@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911144923.24259-1-sebott@redhat.com>
References: <20250911144923.24259-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lRVi3OuYGWvQucYGr4yoPXNKNitDKh6MvPazxcOeWLg_1757602173
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Provide a kvm specific vcpu property to override the default
(as of kernel v6.13 that would be PSCI v1.3) PSCI version emulated
by kvm. Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 docs/system/arm/cpu-features.rst |  5 +++
 target/arm/cpu.h                 |  6 +++
 target/arm/kvm.c                 | 70 +++++++++++++++++++++++++++++++-
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 37d5dfd15b..1d32ce0fee 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -204,6 +204,11 @@ the list of KVM VCPU features and their descriptions.
   the guest scheduler behavior and/or be exposed to the guest
   userspace.
 
+``kvm-psci-version``
+  Override the default (as of kernel v6.13 that would be PSCI v1.3)
+  PSCI version emulated by the kernel. Current valid values are:
+  0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
+
 TCG VCPU Features
 =================
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c15d79a106..44292aab32 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -974,6 +974,12 @@ struct ArchCPU {
      */
     uint32_t psci_version;
 
+    /*
+     * Intermediate value used during property parsing.
+     * Once finalized, the value should be read from psci_version.
+     */
+    uint32_t prop_psci_version;
+
     /* Current power state, access guarded by BQL */
     ARMPSCIState power_state;
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 6672344855..bc6073f395 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -483,6 +483,59 @@ static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
     ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
 }
 
+static char *kvm_get_psci_version(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    const char *val;
+
+    switch (cpu->prop_psci_version) {
+    case QEMU_PSCI_VERSION_0_1:
+        val = "0.1";
+        break;
+    case QEMU_PSCI_VERSION_0_2:
+        val = "0.2";
+        break;
+    case QEMU_PSCI_VERSION_1_0:
+        val = "1.0";
+        break;
+    case QEMU_PSCI_VERSION_1_1:
+        val = "1.1";
+        break;
+    case QEMU_PSCI_VERSION_1_2:
+        val = "1.2";
+        break;
+    case QEMU_PSCI_VERSION_1_3:
+        val = "1.3";
+        break;
+    default:
+        val = "0.2";
+        break;
+    }
+    return g_strdup(val);
+}
+
+static void kvm_set_psci_version(Object *obj, const char *value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    if (!strcmp(value, "0.1")) {
+        cpu->prop_psci_version = QEMU_PSCI_VERSION_0_1;
+    } else if (!strcmp(value, "0.2")) {
+        cpu->prop_psci_version = QEMU_PSCI_VERSION_0_2;
+    } else if (!strcmp(value, "1.0")) {
+        cpu->prop_psci_version = QEMU_PSCI_VERSION_1_0;
+    } else if (!strcmp(value, "1.1")) {
+        cpu->prop_psci_version = QEMU_PSCI_VERSION_1_1;
+    } else if (!strcmp(value, "1.2")) {
+        cpu->prop_psci_version = QEMU_PSCI_VERSION_1_2;
+    } else if (!strcmp(value, "1.3")) {
+        cpu->prop_psci_version = QEMU_PSCI_VERSION_1_3;
+    } else {
+        error_setg(errp, "Invalid PSCI-version value");
+        error_append_hint(errp, "Valid values are 0.1, 0.2, 1.0, 1.1, 1.2, 1.3\n");
+    }
+}
+
 /* KVM VCPU properties should be prefixed with "kvm-". */
 void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
 {
@@ -504,6 +557,12 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
                              kvm_steal_time_set);
     object_property_set_description(obj, "kvm-steal-time",
                                     "Set off to disable KVM steal time.");
+
+    object_property_add_str(obj, "kvm-psci-version", kvm_get_psci_version,
+                            kvm_set_psci_version);
+    object_property_set_description(obj, "kvm-psci-version",
+                                    "Set PSCI version. "
+                                    "Valid values are 0.1, 0.2, 1.0, 1.1, 1.2, 1.3");
 }
 
 bool kvm_arm_pmu_supported(void)
@@ -1883,7 +1942,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (cs->start_powered_off) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
     }
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
+    if (cpu->prop_psci_version != QEMU_PSCI_VERSION_0_1 &&
+        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
         cpu->psci_version = QEMU_PSCI_VERSION_0_2;
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
     }
@@ -1922,6 +1982,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
+    if (cpu->prop_psci_version) {
+        psciver = cpu->prop_psci_version;
+        ret = kvm_set_one_reg(cs, KVM_REG_ARM_PSCI_VERSION, &psciver);
+        if (ret) {
+            error_report("PSCI version %lx is not supported by KVM", psciver);
+            return ret;
+        }
+    }
     /*
      * KVM reports the exact PSCI version it is implementing via a
      * special sysreg. If it is present, use its contents to determine
-- 
2.42.0


