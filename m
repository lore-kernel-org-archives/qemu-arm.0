Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4620192njc;
        Mon, 26 May 2025 23:27:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcbNyE2so+MulgsJ9WbuhXU1MaaMENX9DTBrCRDi5PA059NZ7t9l+0CE3JCR3Uljq1oXxo/LdRbOsnwQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHgOl1jgvff0jBxDgsSRNiX8GtqQmq9l7MsxuVeP1chSyiVsVsfB6tDB5Oi4OaN/BG3p3OE
X-Received: by 2002:a05:622a:544a:b0:476:6215:eafc with SMTP id d75a77b69052e-49f4693dc55mr159456921cf.22.1748327260857;
        Mon, 26 May 2025 23:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748327260; cv=none;
        d=google.com; s=arc-20240605;
        b=IPJVKiDhjWif/On83pP7XfF3H+RbueCRk4g6OErwEd7zN6NyZ4yKAMPd9mYcRvb/gx
         1UCogW9NtItU3Cl61j1AWR19ce5Yl/7B66AXobrCg/2YnB555KS+JOS3+Cvp4s4kYj0z
         Dx28+aBUlwJrRmCnLgSV8Zo/Eaqma3JkOxMnU0CttitXFLn2iUL24N1qpf+QLw6+1y0V
         A9c4c2Ok+HuInsUgE3WNzpTv5eIIJduB72A+GUCrb7xvn6mrhQ4qYZC1OfdtJkvDELgL
         C8Hax7wYRfsOuaKc6l3HcB4nwwPwr1FVcr989pKeR7p7oC3pIqSjponObLlCSVCTrzZi
         I+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l7odZfcJRbrClmU8UnhYNgX801QgcIoNtHu4z5sT5BI=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=DOnr/WkOLbRMNe56Y8raikXfb/JYnuo432akAIyz+VSdnKCQGs4/3Ua1FC8FT7taKy
         qzLLQ7ZsT5IMXCr75SL+SrSJDcDNF3waFRPUZQfr4ldiDDayHPorMpdj+VnkAcL/ANSC
         417r+H8WenP3p80lTqIGrRVFjFP7W8TtpEqSSAk6mKm47xwlB/5/YXq1ovXD5pu/uENy
         CJp0HTEzN6vPD7wLMT3mTWLZkGmecyviVSrmr4NqJyR9nDPFnbRP/uN8Yk6ijb4L0/RX
         mX/Ha2QETQpXiHRMagDwVTQqUB8DDUm57Tj0VdcEzroNO2gxEiNHSk2eitM3qGHBH6R7
         RGlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UQvCcmYy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae593d40si257468281cf.577.2025.05.26.23.27.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 23:27:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UQvCcmYy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJnlM-0000Fv-JU; Tue, 27 May 2025 02:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJnlI-0000B2-CZ
 for qemu-arm@nongnu.org; Tue, 27 May 2025 02:26:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJnlG-0005o7-KO
 for qemu-arm@nongnu.org; Tue, 27 May 2025 02:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748327165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7odZfcJRbrClmU8UnhYNgX801QgcIoNtHu4z5sT5BI=;
 b=UQvCcmYyhWWmpmkcb4ENoXgoI+l7E9G3p63I2SD/eIGy75vXXO32h6S44+n5j27Yo9oWB2
 dgv7VHuZXc7ar35XuagIhuqeJ+EOtP5r2mvwv6y9AQpYvF5gN/JB9U+ISTPE3zC59MHx3N
 YP/SLYYkd5mkfpqkRrgrKMbhr4Tv1uM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-117-4MpfBqwjObOI9nrsoiTP7g-1; Tue,
 27 May 2025 02:25:59 -0400
X-MC-Unique: 4MpfBqwjObOI9nrsoiTP7g-1
X-Mimecast-MFC-AGG-ID: 4MpfBqwjObOI9nrsoiTP7g_1748327158
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5186B195608C; Tue, 27 May 2025 06:25:58 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C4558195608D; Tue, 27 May 2025 06:25:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [PATCH v5 4/5] target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is
 supported
Date: Tue, 27 May 2025 08:24:36 +0200
Message-ID: <20250527062534.1186004-5-eric.auger@redhat.com>
In-Reply-To: <20250527062534.1186004-1-eric.auger@redhat.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: D+L7nvuHraat

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
index ad6c80dd49..495c8246c2 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -227,6 +227,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     int fdarray[3];
     bool sve_supported;
+    bool el2_supported;
     bool pmu_supported = false;
     uint64_t features = 0;
     int err;
@@ -246,6 +247,14 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
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
@@ -429,6 +438,10 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     features |= 1ULL << ARM_FEATURE_AARCH64;
     features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
 
+    if (el2_supported) {
+        features |= 1ULL << ARM_FEATURE_EL2;
+    }
+
     ahcf->features = features;
 
     return true;
@@ -1889,6 +1902,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
         cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
                                       1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
     }
+    if (cpu->has_el2 && kvm_arm_el2_supported()) {
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cpu);
-- 
2.49.0

