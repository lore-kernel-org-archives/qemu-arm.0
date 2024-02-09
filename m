Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp864294ejb;
        Fri, 9 Feb 2024 08:02:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXh6KZuA5TJewl9e3zqP99ljfQ2OuPXwBlVeCtXTpnC5ZTBambnUiIaMjHhqVDa6MoFqix
X-Received: by 2002:ac8:7d0e:0:b0:42c:585c:fa5 with SMTP id g14-20020ac87d0e000000b0042c585c0fa5mr2205738qtb.7.1707494558552;
        Fri, 09 Feb 2024 08:02:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707494558; cv=none;
        d=google.com; s=arc-20160816;
        b=RBfnZ4aIlDdBTOiJpyDfRfi0QBypaw4aTBK6lQRTImwvCa5meJY9wdy29nw/9yev84
         aaVVT356yp+iuUotCUBX72+ShEfXvzglkQuIWzGr0+ZRgTFqVef2+dXs2ZB006LNGGY2
         mjxLwcsVnjpiByBnDuDLuGA1VHJiE/eBevZu75nkYNaTSUcw2fKgkIXlVQ+3WQN18fh9
         mn01aUkRZOZoHJwF4Y+8B9F++/QiYrC+hzOxc50RT4heNbnVr7GiOYTUaRrR6DQc/HQZ
         Mehi11JgaZ6m2XkKxZ5+HmtzoJZwuFZbhedXNs5rD/nnAtfxjSKqYrQiWtDG5hGEkJaN
         bRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3kjxrz9LaiJzI3z0kfZ3ZqqP0YF4vwjkJCjW49jLgJg=;
        fh=k9fCkTA86whse5U7Kr632I1Q1sdtF3cz/fm3bxNAvZk=;
        b=LA+dhgiOvMrL9nwEFD6+f4UwAPSk8DkuGpvg6g95H8EiXKGQFJyHCvXmriRQaifQ+r
         FzAWE4GXZtf4pLgdPpjH7LmHV13ZZBGiq2dQjGOa3r/o9s22GCclLHDZzrjYtyHmyspk
         92/fBV3M70fq2ojs/HT/VDcSEcKYs2kx2L5g01KX1c2WM+XWGjEPZZ4rJk375CUq/2SI
         D5nRom/qEalOv0wOha3CwECpV3KiHAFNdibvWNGVs0ZxyntGeRLDWcA3Hi5dS2sQgh6W
         WX8wTFrSr+jGXpc8OXi9COlqY4ZCGGR1snwPuz+s0mT/dGZHKZ6Y45s9k08A677zdVmL
         7+Wg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AVHFl/xr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCUxVEivpSxQ2SESJZYVzx4fe+7W2SB/zDz7ijYLUlC1lQFS3xc6pjmfupOmgEKOB9k9Q7MNlF/gmhdjSGXsIVZc4+d1V9Pq
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp33-20020a05622a1ba100b0042c2666f8e4si2068094qtb.687.2024.02.09.08.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Feb 2024 08:02:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AVHFl/xr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rYTJQ-00016d-SM; Fri, 09 Feb 2024 11:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rYTJL-000134-DL
 for qemu-devel@nongnu.org; Fri, 09 Feb 2024 11:01:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rYTJC-000654-3q
 for qemu-devel@nongnu.org; Fri, 09 Feb 2024 11:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707494457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kjxrz9LaiJzI3z0kfZ3ZqqP0YF4vwjkJCjW49jLgJg=;
 b=AVHFl/xrrIk0nRHl/XqKsE7rZEeEICvVlv63qW5D7cNyweKu7QtuHZnIy0XykeNROjqgJ+
 9mF5fr1vpoG2Ou6b55I4uTeomIABcWKn4jY9X8Dtsb9zzfu9a2ZtrHCPRJSf5lNjeDiHQa
 n3DUhNcDSZaibdPt+d3Q5kpnQRvMA0Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-wwBfNdwVM1WkJLbp7j0hdQ-1; Fri, 09 Feb 2024 11:00:53 -0500
X-MC-Unique: wwBfNdwVM1WkJLbp7j0hdQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81B298489A5;
 Fri,  9 Feb 2024 16:00:52 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5833492BC6;
 Fri,  9 Feb 2024 16:00:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, haibo.xu@linaro.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com
Subject: [RFC v2 4/5] target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is
 supported
Date: Fri,  9 Feb 2024 16:59:16 +0100
Message-ID: <20240209160039.677865-5-eric.auger@redhat.com>
In-Reply-To: <20240209160039.677865-1-eric.auger@redhat.com>
References: <20240209160039.677865-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.269,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 93uiU6usW37v

From: Haibo Xu <haibo.xu@linaro.org>

KVM_CAP_ARM_EL2 must be supported by the cpu to enable ARM_FEATURE_EL2.
In case the host does support NV, expose the feature.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- remove isar_feature_aa64_aa32_el2 modif in target/arm/cpu.h
  [Richard] and use el2_supported in kvm_arch_init_vcpu
---
 target/arm/kvm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 0996866afe..a08bc68a3f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -238,6 +238,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     int fdarray[3];
     bool sve_supported;
+    bool el2_supported;
     bool pmu_supported = false;
     uint64_t features = 0;
     int err;
@@ -268,6 +269,14 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
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
@@ -449,6 +458,10 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     features |= 1ULL << ARM_FEATURE_PMU;
     features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
 
+    if (el2_supported) {
+        features |= 1ULL << ARM_FEATURE_EL2;
+    }
+
     ahcf->features = features;
 
     return true;
@@ -1912,6 +1925,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
         cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
                                       1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
     }
+    if (kvm_arm_el2_supported()) {
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cpu);
-- 
2.41.0

