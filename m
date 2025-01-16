Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3569166dlj;
        Thu, 16 Jan 2025 00:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCa7HrvFt4Y+wR662MulmrOsVf6cPU+HYPf2Kw8N3IzOVaeYayCoMoB4ReNjz+XKYTKnFnXi6P5gpDmw==@linaro.org
X-Google-Smtp-Source: AGHT+IFE37HqZqXu/Lfbn9xXcIY4O5vZZgr1QtQDYtpKiL+ZAoXI66CNU2jJrKagste7nM0EjtIm
X-Received: by 2002:a05:620a:4149:b0:7b6:de8e:da3e with SMTP id af79cd13be357-7bcd9715a20mr4366912085a.29.1737016558739;
        Thu, 16 Jan 2025 00:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737016558; cv=none;
        d=google.com; s=arc-20240605;
        b=eXKRpkWK3viu5T1rb0hsJ+wH4h/pDk62Lgk2gzxfDCtkuDzQdtQN5X7R4XoSM0Vcow
         i8DhgrWUQImuynvhQNWdlSG89ODWnuRkyXYBr16w8nJr3U5O+vf1+zuAkSIAhcUKWuvN
         V7Vm8xEibk36TC4O4CQMt7QMnYqSEnh4xRsNgR0OlV/cPz85f0euKwP2d3XxuGCocV7k
         C+oHQ+G7VaZin4zyymhVqnKNIkqxRmCczokj1+X1HXaAqVlQyPRdK7WyhyitXS8A4I9G
         Qf11E9+QI+TbuLuimjGvtXShUZqImq65Q4SGdICwLePyRcwaI5u8PVwqzr/vSkaVQum/
         QZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bQI9yKVxWku1ZRu/VTAI0cqtwe5o+lSPdTj7dhFj0W4=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=JX0DmdModVdZJOJTkwTCyD3VFEu1hA3UEaQSW0lALSCI+qUwrPaiUotkRCdShXSmQK
         eXmNNvY/qhZxHEKcDGyMnA5P9PkFoEELxng3h/UcvM8+ScBzvO+oYJJnIir30TBu658A
         sELVhlZRBr5lKAkcy63f4k5Y7XyLnaYGbrUyDqLRoFO+1FN6srMpkTBVrbsBUuFOOGrL
         Vz3NelX+wa6twBir1+sIiwnp3CW8je4Uzj3B+woruNPSkNwDJ6LPoyEC9x2XncvqMeoo
         wY3QugMGFCleKpcUYPCKXDPOGQmxHuOTd2JZmoVHwR1Ue5DScszjpCjmgmZAxgfaDqBL
         vP6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z5LL0Ppy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce322a2e5si1734915785a.107.2025.01.16.00.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 00:35:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z5LL0Ppy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYLKV-0007UN-KS; Thu, 16 Jan 2025 03:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tYLKS-0007Tv-SX
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 03:34:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tYLKR-0005Wh-6w
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 03:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737016454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQI9yKVxWku1ZRu/VTAI0cqtwe5o+lSPdTj7dhFj0W4=;
 b=Z5LL0Ppyi0iL/2btFa0M/c5/GoH8c9uqPW6kGSYsEdIQoQSpOJnYRc4j2L/HKtTD0SDMxv
 NPXT/i1C6swwPkSestujv/AH/1bFfhb5s1qJANhF1XSC1ZzBYVesnAsr926b4//BT24ebr
 zV1Zr9vtar9PCl+cm59PQeYJ+VIkaiU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-523-sGn6A7bfOgOgoyfrIkOKJQ-1; Thu,
 16 Jan 2025 03:34:10 -0500
X-MC-Unique: sGn6A7bfOgOgoyfrIkOKJQ-1
X-Mimecast-MFC-AGG-ID: sGn6A7bfOgOgoyfrIkOKJQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5D7591955DDF; Thu, 16 Jan 2025 08:34:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.32])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F3FCF30001BE; Thu, 16 Jan 2025 08:34:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [RFC v4 4/5] target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is
 supported
Date: Thu, 16 Jan 2025 09:32:17 +0100
Message-ID: <20250116083339.674344-5-eric.auger@redhat.com>
In-Reply-To: <20250116083339.674344-1-eric.auger@redhat.com>
References: <20250116083339.674344-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jBbGhBCgR6hC

From: Haibo Xu <haibo.xu@linaro.org>

KVM_CAP_ARM_EL2 must be supported by the cpu to enable ARM_FEATURE_EL2.
In case the host does support NV, expose the feature.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v2 -> v3:
- check pmu->has_el2 on kvm_arch_init_vcpu() when setting
  KVM_ARM_VCPU_HAS_EL2 feature (Peter)

v1 -> v2:
- remove isar_feature_aa64_aa32_el2 modif in target/arm/cpu.h
  [Richard] and use el2_supported in kvm_arch_init_vcpu
---
 target/arm/kvm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 43362164eb..bfaf48824c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -255,6 +255,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     int fdarray[3];
     bool sve_supported;
+    bool el2_supported;
     bool pmu_supported = false;
     uint64_t features = 0;
     int err;
@@ -285,6 +286,14 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
     }
 
+    /*
+     * Ask for EL2 if supported.
+     */
+    el2_supported = kvm_arm_el2_supported();
+    if (el2_supported) {
+        init.features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
+    }
+
     /*
      * Ask for Pointer Authentication if supported, so that we get
      * the unsanitized field values for AA64ISAR1_EL1.
@@ -468,6 +477,10 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     features |= 1ULL << ARM_FEATURE_AARCH64;
     features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
 
+    if (el2_supported) {
+        features |= 1ULL << ARM_FEATURE_EL2;
+    }
+
     ahcf->features = features;
 
     return true;
@@ -1918,6 +1931,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
         cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
                                       1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
     }
+    if (cpu->has_el2 && kvm_arm_el2_supported()) {
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cpu);
-- 
2.47.1

