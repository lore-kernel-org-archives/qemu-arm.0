Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F437CCF9F8
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Oct 2025 17:00:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEVzt-0002Lq-KC; Thu, 30 Oct 2025 12:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vEVzo-0002LS-RZ
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:59:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vEVzf-0005HY-RY
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761843557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4ko4KBU7aEgwSx+DTL8x/7Jpcfxyw8R2e/RIc9ttX4=;
 b=Y/SSF/QsmQoIsJweo3JDlZjJGmBwC9M/9UEKZCrRev2przDXUV9ESw171Tg59Oq+3QfW5s
 Nw8nBgdEX7Qj+vg7IkMs6rLJBroh+ejEpFKjSopmqqEsHKrVENKWHjH0uLuiQ6ykL2SKCT
 U0+7W6ilNz6u3nLxVaKLyrIkrT7iSyg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-_YOcnZOpNgi-E8JyIRf8BA-1; Thu, 30 Oct 2025 12:59:14 -0400
X-MC-Unique: _YOcnZOpNgi-E8JyIRf8BA-1
X-Mimecast-MFC-AGG-ID: _YOcnZOpNgi-E8JyIRf8BA_1761843553
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-429af6b48a8so1536995f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 Oct 2025 09:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761843553; x=1762448353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4ko4KBU7aEgwSx+DTL8x/7Jpcfxyw8R2e/RIc9ttX4=;
 b=Di/JWSgNbfeKcA4SyhrkFCsABbxEFb1D/8CCQE2v1y4CkLDRWl+6RwFyVBFJg626Aq
 L05FBaxQWAblyieoQWTekHCnFpNnUxU44XT1+zM1xbJji2JwLgaIXoxxjNdIFVJhta2H
 TP63CtUbOQIqQ9D3GGM5iOV5AKSLLz1uW2juHzrHszDTZhnEhEqYG2WmSY8gz/ItVHC+
 NuqEplekzPI60qJL2Jn3FkZV30eYSsUHim7O7wYRXG0uhv7z1mwS3FgVmrMQjf/dpYfE
 p3DcORRnDCzV89t4MZOvMSJKmf+yyAj2InFHeuRYWuIUdd9ACQM/BY6psTZeTCJ3EtuK
 gklA==
X-Gm-Message-State: AOJu0YwCKYw5Bd2RZ70mroQyUesrfNM0Njm/2XEQysnkic/lbKtFfxbF
 Jkq349B4byncO3r+InmvuDdS++PY03hfjn6eZdUklcNteA7TckGwq1Rj3NXT+JWWRwXq97TI1Vh
 gTw3ACTQ8+ZP3El19tkw/Pz5X/ybANGdVVjJK6dbyRcFMMvYSFQodTg==
X-Gm-Gg: ASbGncs2vwILVJFR7nq90caTLWRulKlVj+gkyEk5Zi9glouWeJ6o7MPbHlpuHcZQjW5
 /t/mug/AdwdXGH3m5NsM8Caal7bLAkZhj/2M2I+DmPYRCEUa2Kn4+OlyuzAWhs6cp/QFFNAObB0
 MxDmFeg4YclEpRAbqSClFE5oSEyZRJZmBfgmEVPQqRJULnsspyVQ4qUtvoag0yCf91A1okvSgMs
 nt7g6UwWzSvu9HJdIOEPmxY3+zmcyUmDubBN3oA/pC7dxIX0YdYGmVCWInZ4ABoWurtG9AxoDTB
 HpHGPFd9Tcyk8xcUQdRmuJ+3dXom40S85Sl7mx7cuQPRMQTV0FUHA3wRJmJToUv7f+PU/4hIHTq
 S/D5IybatfoS4rzLez2hIHMF5QaQeozAMAyFwcASCWvWw24q55uen4sSVrv9bQA8=
X-Received: by 2002:a05:600c:871a:b0:476:a25f:6a4d with SMTP id
 5b1f17b1804b1-477305a6daamr3525425e9.1.1761843552949; 
 Thu, 30 Oct 2025 09:59:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtxStmlfeeaS5Y8HP2+7UT81SENobqh4RvvVYY+Oiqs7Zmi4aE+qYv9gWYq8tm8LCZq3ZUGA==
X-Received: by 2002:a05:600c:871a:b0:476:a25f:6a4d with SMTP id
 5b1f17b1804b1-477305a6daamr3525165e9.1.1761843552439; 
 Thu, 30 Oct 2025 09:59:12 -0700 (PDT)
Received: from rh.redhat.com
 (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289e7cf5sm51104085e9.14.2025.10.30.09.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:59:12 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v2 2/2] target/arm/kvm: add kvm-psci-version vcpu property
Date: Thu, 30 Oct 2025 17:59:05 +0100
Message-ID: <20251030165905.73295-3-sebott@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251030165905.73295-1-sebott@redhat.com>
References: <20251030165905.73295-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vssO_S4P1N0otUdrsDL0hDfKfXLGnBG7wx02MxBZwdo_1761843553
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 target/arm/cpu.h                 |  6 ++++
 target/arm/kvm.c                 | 60 +++++++++++++++++++++++++++++++-
 3 files changed, 70 insertions(+), 1 deletion(-)

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
index 39f2b2e54d..c2032070b7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -981,6 +981,12 @@ struct ArchCPU {
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
index 0d57081e69..c53b307b76 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -484,6 +484,49 @@ static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
     ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
 }
 
+struct psci_version {
+    uint32_t number;
+    const char *str;
+};
+
+static const struct psci_version psci_versions[] = {
+    { QEMU_PSCI_VERSION_0_1, "0.1" },
+    { QEMU_PSCI_VERSION_0_2, "0.2" },
+    { QEMU_PSCI_VERSION_1_0, "1.0" },
+    { QEMU_PSCI_VERSION_1_1, "1.1" },
+    { QEMU_PSCI_VERSION_1_2, "1.2" },
+    { QEMU_PSCI_VERSION_1_3, "1.3" },
+    { -1, NULL },
+};
+
+static char *kvm_get_psci_version(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    const struct psci_version *ver;
+
+    for (ver = psci_versions; ver->number != -1; ver++) {
+        if (ver->number == cpu->prop_psci_version)
+            return g_strdup(ver->str);
+    }
+
+    g_assert_not_reached();
+}
+
+static void kvm_set_psci_version(Object *obj, const char *value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    const struct psci_version *ver;
+
+    for (ver = psci_versions; ver->number != -1; ver++) {
+        if (!strcmp(value, ver->str)) {
+            cpu->prop_psci_version = ver->number;
+            return;
+        }
+    }
+
+    error_setg(errp, "Invalid PSCI-version value");
+}
+
 /* KVM VCPU properties should be prefixed with "kvm-". */
 void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
 {
@@ -505,6 +548,12 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
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
@@ -1959,7 +2008,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (cs->start_powered_off) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
     }
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
+    if (cpu->prop_psci_version != QEMU_PSCI_VERSION_0_1 &&
+        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
         cpu->psci_version = QEMU_PSCI_VERSION_0_2;
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
     }
@@ -1998,6 +2048,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
+    if (cpu->prop_psci_version) {
+        psciver = cpu->prop_psci_version;
+        ret = kvm_set_one_reg(cs, KVM_REG_ARM_PSCI_VERSION, &psciver);
+        if (ret) {
+            error_report("PSCI version %"PRIx64" is not supported by KVM", psciver);
+            return ret;
+        }
+    }
     /*
      * KVM reports the exact PSCI version it is implementing via a
      * special sysreg. If it is present, use its contents to determine
-- 
2.42.0


