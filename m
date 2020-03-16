Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp249663lfe;
        Mon, 16 Mar 2020 09:06:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuupmYjc+IzNiXDZ9CjMQ3Sp52fM0qrwE8NBtBVE3qX7KMnbafb3E6VmwMzaP+UEz7o9v/7
X-Received: by 2002:a25:5e87:: with SMTP id s129mr362354ybb.231.1584374809792;
        Mon, 16 Mar 2020 09:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374809; cv=none;
        d=google.com; s=arc-20160816;
        b=YGvDrBff7FX0hcz+9X5RYOizm7WE7Vpm1M07Q1SXf/OPmO8sOJ3AqW836ZmvLJi5Xs
         ia0r7VdLH2V3tPR7mfuJOdgbSZQM1eUVBUClUh5aBGDXw1CDHUlbe7g3m5cEhz4nvwOE
         eUb8nFd8HVj63b8PkaMg8VHTdLFarrrdNojY2RK2RahMa7me2dt1Yn1xzPyTyM2s1cAW
         19Dkn5XVhtdOSvsYtJpQKz2tlQjJ+lZlje1qTwph12yffJ6msqcbGNV81liPRwaruOT/
         3ehH0Gy2IZUO0go1llGZJIiuEDa104p4r88WGQ0YAyY7eY5JoupPs73yfVVwoLH9lJGf
         of4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=36JPzoDFwtpu9mZ2fPnU6GKIA7vaoxIQMhsyqosn0aE=;
        b=Xx22cxYypC9OEchE2KWSkwq9k8z5yqzk+whp9vkbx9jmF/QJETN9peuAJOchAra++V
         OUBz/KIgo5zqOmgj444Zp04T58N3MlVzcoSmcU337sKRYrn7LxmdCULOPYrN2fdXwHqp
         btLVPOJmFw4sEA8ITfDRN1fsJRDRAlDKBHa23RPQzVgaHmbXEl6vVsOnorqH20r8RNXT
         W/3chPTxC7Uztb2gTvxTOG0MJ/xkOhosltpy7K71nEA07+vinQKoYUkb+KhW6r5JjzJS
         L5XT73GQJYzp2mdk6l4L38GRFZTF2z5KKqIkR2l0kShxaqPPYAGWchR42o9Uqe9mTueW
         +odQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VcW/h06B";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id n2si128509ybp.263.2020.03.16.09.06.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:06:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VcW/h06B";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36JPzoDFwtpu9mZ2fPnU6GKIA7vaoxIQMhsyqosn0aE=;
	b=VcW/h06BSPVVLMgIzL8zPzkOb/3ETnGGzyF1FAs+2itAtnWfd6zRZ+jtL1Vi7g9964nJ5Z
	P+mlHVc3iASJ/c9/3MJz2xAMVPdaffIYN9g9N3yaA9bAU5CFJDXHoMA8UGNsVONEAoKtMN
	wyfIGE2VWwrCZ4BCb5wOjg5k7ELh0+o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-W4BHFo9GMaek5JJWdHqYBw-1; Mon, 16 Mar 2020 12:06:45 -0400
X-MC-Unique: W4BHFo9GMaek5JJWdHqYBw-1
Received: by mail-wr1-f72.google.com with SMTP id c6so1444926wro.7
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WUQmK3jX+ITRgjT53gJOYB77qbIWiqXEgYr8J8FbjTA=;
        b=AfgCPVWVP/kWExj0XVpaGD8weCJQaBAU8uB4hD8ex31Y1uVCXelaXhsI6R2CAWBvhM
         UoEEViTMp9F6HMlbLA1C232H0suXWXCjPJF7db+wQZ6CYyR1jYxaaCcdd4R3A2WU8Y3C
         VA/w8n0iIj/9hOCwpD5tQXffffAMvC5SU1dAmc/Kv2wLRW8oMtoC1mZ9wwOOhoEsQkxl
         9E7MXFTchywuVZPl73Vqxya5VBJkMxYGSESEyz5Y9cSAIqJFo+kvCx2Mz/oHpX2qgLG+
         Xye5f7kjp8QlJ/N3hj8isi4vXEvX6N13YTc+h3XX1cB5Hl+hoieMBtnSfykB0W0sht2f
         cBoQ==
X-Gm-Message-State: ANhLgQ2W2gmA7cCMiuhnjP5C/mOvu1Zr4Jy8iy4hPDCimU+nxuHdYqO/
	AqvLeNzMpTz/Djs7wgt+qSF2y8V2T5wU+JeGsltJdqyPmiTurIjqEe7y3I/ZJbwLM9HKfcR6oqC
	lwjMMtYHbCTil9eZZ
X-Received: by 2002:a1c:ab04:: with SMTP id u4mr28378904wme.88.1584374803976;
        Mon, 16 Mar 2020 09:06:43 -0700 (PDT)
X-Received: by 2002:a1c:ab04:: with SMTP id u4mr28378818wme.88.1584374802766;
        Mon, 16 Mar 2020 09:06:42 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id a10sm480884wrv.89.2020.03.16.09.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:06:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 01/19] target/arm: Rename KVM set_feature() as kvm_set_feature()
Date: Mon, 16 Mar 2020 17:06:16 +0100
Message-Id: <20200316160634.3386-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: zQ9ndGZ9Fs2U

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/kvm32.c | 10 +++++-----
 target/arm/kvm64.c | 16 ++++++++--------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index f271181ab8..0ab28b473a 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -22,7 +22,7 @@
 #include "internals.h"
 #include "qemu/log.h"
=20
-static inline void set_feature(uint64_t *features, int feature)
+static inline void kvm_set_feature(uint64_t *features, int feature)
 {
     *features |=3D 1ULL << feature;
 }
@@ -146,14 +146,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures=
 *ahcf)
      * timers; this in turn implies most of the other feature
      * bits, but a few must be tested.
      */
-    set_feature(&features, ARM_FEATURE_V7VE);
-    set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
+    kvm_set_feature(&features, ARM_FEATURE_V7VE);
+    kvm_set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
=20
     if (extract32(id_pfr0, 12, 4) =3D=3D 1) {
-        set_feature(&features, ARM_FEATURE_THUMB2EE);
+        kvm_set_feature(&features, ARM_FEATURE_THUMB2EE);
     }
     if (extract32(ahcf->isar.mvfr1, 12, 4) =3D=3D 1) {
-        set_feature(&features, ARM_FEATURE_NEON);
+        kvm_set_feature(&features, ARM_FEATURE_NEON);
     }
=20
     ahcf->features =3D features;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index be5b31c2b0..ad33e048e4 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -447,12 +447,12 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
     }
 }
=20
-static inline void set_feature(uint64_t *features, int feature)
+static inline void kvm_set_feature(uint64_t *features, int feature)
 {
     *features |=3D 1ULL << feature;
 }
=20
-static inline void unset_feature(uint64_t *features, int feature)
+static inline void kvm_unset_feature(uint64_t *features, int feature)
 {
     *features &=3D ~(1ULL << feature);
 }
@@ -648,11 +648,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures=
 *ahcf)
      * with VFPv4+Neon; this in turn implies most of the other
      * feature bits.
      */
-    set_feature(&features, ARM_FEATURE_V8);
-    set_feature(&features, ARM_FEATURE_NEON);
-    set_feature(&features, ARM_FEATURE_AARCH64);
-    set_feature(&features, ARM_FEATURE_PMU);
-    set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
+    kvm_set_feature(&features, ARM_FEATURE_V8);
+    kvm_set_feature(&features, ARM_FEATURE_NEON);
+    kvm_set_feature(&features, ARM_FEATURE_AARCH64);
+    kvm_set_feature(&features, ARM_FEATURE_PMU);
+    kvm_set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
=20
     ahcf->features =3D features;
=20
@@ -802,7 +802,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (cpu->has_pmu) {
         cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_PMU_V3;
     } else {
-        unset_feature(&env->features, ARM_FEATURE_PMU);
+        kvm_unset_feature(&env->features, ARM_FEATURE_PMU);
     }
     if (cpu_isar_feature(aa64_sve, cpu)) {
         assert(kvm_arm_sve_supported(cs));
--=20
2.21.1
