Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp663307lfb;
        Mon, 4 May 2020 10:26:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypKi5M5kn6zWNDGGhSaIKzMlQJ0PJ0XQmf+DLKe72+o3aTH6ZQT9QD4EqlWvcrO+IXCEL3QQ
X-Received: by 2002:ac8:4e2c:: with SMTP id d12mr180578qtw.204.1588613173126;
        Mon, 04 May 2020 10:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588613173; cv=none;
        d=google.com; s=arc-20160816;
        b=MNKhY5ImnYbqiFIioGYACVfegu5p+ZEaq88F2WwUwDxl6/KH4XqA8UZzsC4fAsIxbz
         nyxlyM2IIPtlzjuvOPuCvgxVzu4Ys4vVm2Woig/vESHS5wHoB8VG6cBu3Fs33nl/hj4i
         UzYhe6YoQDBfoG5u2I3zpd4GFRXifciJQLdaJNz5g+ZjCrFjx7Gbusdk3FJJcWsT5CJv
         iNBZNLrKaMLD7rxT32gbKG/UHfPJgy1DXN2LVOPcHv6MJ0H34liyTq1TheYExT3uZqSg
         h/KcdXSjwDH4F97P5R/JNaBTxe7C0Hy7X0x0cgk7xmPWm0BUJwW08kJLNspfaawJVMrO
         T9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=J2j0wqUPebHWLfyYz6iL8kkjnw7WfmxM1B0D7mnsKjQ=;
        b=vLZykCqLKMgvMqcrnX7VRHo9sKdZ135OXQ3A9XHx+VZOwhMuhlPH5vf6M7xl/vvJJH
         h1muq9pBkjvlApADmNdJfoyAF/fW9tjPBDg2DxvDfDJ+qlbvzKVQlZtybv/Pm9z9Z14/
         RLdQ/4FXRJUqpJN5h8NPBwqDxXAY1/jUsOCp0CxZLYzTHtYxKenjl3tNKARiwBIq7k79
         OWp1FxLIGkXN/z2RR2KIUkUT9RLnYQTl+y6GbvNnkupGaB7wFJPCPggcauBfE3uKnjF6
         N+FJW+ylBsCiNCNFgkgOwW10GU7JN2Cv3102Rmj5rSEIGIjeBCE6OsWHyTK/saS0VScl
         5Fjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CdWAZfq1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id o97si6799447qvo.34.2020.05.04.10.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 10:26:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CdWAZfq1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVer6-0003qc-Hg
	for alex.bennee@linaro.org; Mon, 04 May 2020 13:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVepx-0001wz-EM
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:25:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33231
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVepv-0005GZ-Es
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588613097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J2j0wqUPebHWLfyYz6iL8kkjnw7WfmxM1B0D7mnsKjQ=;
 b=CdWAZfq1pBFUS4ixho/mIB7JZhhtoHofmuLY0llf/ZfOAICbP2SoKBaRDy9fupIbTFl+KL
 +AI2XMddpujl1LWPxEhKspco0Z0lzVHSCE6QQdUioEFVgzGc3KdmD+gcElXqzn9MbGOdBS
 OZL2T7ISWmhLjQh5A7qIvD7821NlM2k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-AyVsHg58M9qIok4kHbj1kA-1; Mon, 04 May 2020 13:24:55 -0400
X-MC-Unique: AyVsHg58M9qIok4kHbj1kA-1
Received: by mail-wm1-f69.google.com with SMTP id 71so291561wmb.8
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 10:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AbBkM/gfj45zJYp9htQMJfg8nUymcXwOX7nX9TXzWm8=;
 b=YyRdxPyOvwKFrBlT2ZBTsRDuwSkGZx5UB5udts/eP+VJ4Vdx9RhOCuXLk3h28ARBOn
 L+72+9Y/inNRX24UNznf4l00ufIdWm9Aq1kzA8pTaOTr4+F+/fncqrAU59rWrGOCLVYb
 FYIqH36jSuFDaWFFTRaWVVyvJYqqSRAzstvW3cyBei5cEbkHM8J8nIw+YRCeyBT/dWDK
 jZ6+pdag5pkPOEZt2uHQYIo/ss+Mb3i08Vs3+cxmqJDS+HfYheMV6nTFJTPAqsT5qfRa
 TIAMS3THVS84ikf1tbLjbMDnBxDo0Ox5OS7xQYAgow/WaeqJezJVUMvdP6f/5MISH54U
 Fw0Q==
X-Gm-Message-State: AGi0Pua6M7xruZiQZ3HBqQIIib2imi5fuv6iKueol9StJtYvH3DwEqwZ
 Xwefr/jLQ1zh9Wha+eEAbPhi8YmvuWT6Klt6FHo6y14o5Nds4lV1wAbGZ0nIxkwBQi8lzJAkFnW
 qKr19DLn6IS+R
X-Received: by 2002:adf:ee86:: with SMTP id b6mr98939wro.419.1588613094636;
 Mon, 04 May 2020 10:24:54 -0700 (PDT)
X-Received: by 2002:adf:ee86:: with SMTP id b6mr98924wro.419.1588613094449;
 Mon, 04 May 2020 10:24:54 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id k5sm3556196wrx.16.2020.05.04.10.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 10:24:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] target/arm/kvm: Inline set_feature() calls
Date: Mon,  4 May 2020 19:24:44 +0200
Message-Id: <20200504172448.9402-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504172448.9402-1-philmd@redhat.com>
References: <20200504172448.9402-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 05:09:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pmbEUYqfFJAM

We want to move the inlined declarations of set_feature()
from cpu*.c to cpu.h. To avoid clashing with the KVM
declarations, inline the few KVM calls.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/kvm32.c | 13 ++++---------
 target/arm/kvm64.c | 22 ++++++----------------
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index f271181ab8..7b3a19e9ae 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -22,11 +22,6 @@
 #include "internals.h"
 #include "qemu/log.h"
=20
-static inline void set_feature(uint64_t *features, int feature)
-{
-    *features |=3D 1ULL << feature;
-}
-
 static int read_sys_reg32(int fd, uint32_t *pret, uint64_t id)
 {
     struct kvm_one_reg idreg =3D { .id =3D id, .addr =3D (uintptr_t)pret }=
;
@@ -146,14 +141,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures=
 *ahcf)
      * timers; this in turn implies most of the other feature
      * bits, but a few must be tested.
      */
-    set_feature(&features, ARM_FEATURE_V7VE);
-    set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
+    features |=3D 1ULL << ARM_FEATURE_V7VE;
+    features |=3D 1ULL << ARM_FEATURE_GENERIC_TIMER;
=20
     if (extract32(id_pfr0, 12, 4) =3D=3D 1) {
-        set_feature(&features, ARM_FEATURE_THUMB2EE);
+        features |=3D 1ULL << ARM_FEATURE_THUMB2EE;
     }
     if (extract32(ahcf->isar.mvfr1, 12, 4) =3D=3D 1) {
-        set_feature(&features, ARM_FEATURE_NEON);
+        features |=3D 1ULL << ARM_FEATURE_NEON;
     }
=20
     ahcf->features =3D features;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index be5b31c2b0..cd8ab6b8ae 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -447,16 +447,6 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
     }
 }
=20
-static inline void set_feature(uint64_t *features, int feature)
-{
-    *features |=3D 1ULL << feature;
-}
-
-static inline void unset_feature(uint64_t *features, int feature)
-{
-    *features &=3D ~(1ULL << feature);
-}
-
 static int read_sys_reg32(int fd, uint32_t *pret, uint64_t id)
 {
     uint64_t ret;
@@ -648,11 +638,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures=
 *ahcf)
      * with VFPv4+Neon; this in turn implies most of the other
      * feature bits.
      */
-    set_feature(&features, ARM_FEATURE_V8);
-    set_feature(&features, ARM_FEATURE_NEON);
-    set_feature(&features, ARM_FEATURE_AARCH64);
-    set_feature(&features, ARM_FEATURE_PMU);
-    set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
+    features |=3D 1ULL << ARM_FEATURE_V8;
+    features |=3D 1ULL << ARM_FEATURE_NEON;
+    features |=3D 1ULL << ARM_FEATURE_AARCH64;
+    features |=3D 1ULL << ARM_FEATURE_PMU;
+    features |=3D 1ULL << ARM_FEATURE_GENERIC_TIMER;
=20
     ahcf->features =3D features;
=20
@@ -802,7 +792,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (cpu->has_pmu) {
         cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_PMU_V3;
     } else {
-        unset_feature(&env->features, ARM_FEATURE_PMU);
+        env->features &=3D ~(1ULL << ARM_FEATURE_PMU);
     }
     if (cpu_isar_feature(aa64_sve, cpu)) {
         assert(kvm_arm_sve_supported(cs));
--=20
2.21.3

