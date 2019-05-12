Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1641271wrg;
        Sun, 12 May 2019 01:37:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPxfnJln+lcmbtQqQFkL652PyvKDJSnzyEXchLiHGTiz7dbMxYxcBdM96vh72DkkufqSWp
X-Received: by 2002:ae9:d844:: with SMTP id u65mr16160495qkf.310.1557650237257;
        Sun, 12 May 2019 01:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650237; cv=none;
        d=google.com; s=arc-20160816;
        b=AMuxc3UnriaSAtsP3w2ttS5e0NmXQuKgj/sfGDfptz21ey5m8r6SfL8MS0OhfFaU7q
         VGICJU94KXY1PzbStBbavRutnJoH0PWQU31jwhWPY0vOEz4wIt9dHIsCrvfdRG+X9C2n
         JseSXCv3P48Zm9OZVpHhcz//1ecM7HWgD9rv7DO0MIqZxiJ5NUGLdx2gsHvKR6e+Htc+
         MKaYH2ycc0v/v9wJbf0KB9Phn6drBzPmf7Yn9Ax5rZtARJufMrSYcPayZ4wVUbRXhcRa
         dg4U0yGc0h+AgsZYVgSP6sia6ckjGMbIucjVA77VNnr4uKNYJ5Wh0UT8OwGrL2npnq0m
         P9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=HURtxjRzFfrodtNEQRf5DhQD1PbZVoeQOc9k7LGo/Nk=;
        b=K6iMOvkCURz1/KGPO3ku2hSl6iQ1h3sifd154WiUWWNzWz6mpLv8qwAuPOtL4XChUq
         YwFPZPYMOw7kLppxtzQvbb3UQcy1ogkA+mZSZyupafDkFhAk9uhr1teLXPRw/KBNmG2c
         4ceJVrpo9MGSeXFaOsqkwHcNroXLAVbdF2FTdvVf7UCwvuxlop4PznEqnTOMAqm6v42k
         zqzCHNV/wRGpJhY/1C8ht64C1WzgS69esmCNS7AKJVJ7P7fPPCM5ZrO8rQTils/sF5NJ
         VquBsDQ52geAEpJZvBP0rmDD3PYX6cPvyvGv3qfude6itQQ/U9xyl2+2eAqL5ndTBlNs
         uQhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z188si2695218qkc.261.2019.05.12.01.37.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F69E811DC;
	Sun, 12 May 2019 08:37:16 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72C0E5D706;
	Sun, 12 May 2019 08:37:10 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	abologna@redhat.com
Subject: [PATCH 09/13] target/arm/kvm: Export kvm_arm_get_sve_vls
Date: Sun, 12 May 2019 10:36:20 +0200
Message-Id: <20190512083624.8916-10-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Sun, 12 May 2019 08:37:16 +0000 (UTC)
X-TUID: w5CTCMn4cXG+

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm64.c   |  7 +++++--
 target/arm/kvm_arm.h | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 0c666e405357..11c6334a7c08 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -446,7 +446,8 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
     }
 }
 
-static int kvm_arm_get_sve_vls(CPUState *cs, uint64_t sve_vls[])
+int kvm_arm_get_sve_vls(CPUState *cs,
+                        uint64_t sve_vls[KVM_ARM64_SVE_VLS_WORDS])
 {
     struct kvm_one_reg reg = {
         .id = KVM_REG_ARM64_SVE_VLS,
@@ -470,7 +471,9 @@ static int kvm_arm_get_sve_vls(CPUState *cs, uint64_t sve_vls[])
     return ret;
 }
 
-static int kvm_arm_set_sve_vls(CPUState *cs, uint64_t sve_vls[], int max_vq)
+static int kvm_arm_set_sve_vls(CPUState *cs,
+                               uint64_t sve_vls[KVM_ARM64_SVE_VLS_WORDS],
+                               int max_vq)
 {
     struct kvm_one_reg reg = {
         .id = KVM_REG_ARM64_SVE_VLS,
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index c488ec3ab410..748ed8d54985 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -248,6 +248,26 @@ int kvm_arm_vgic_probe(void);
 void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
 void kvm_arm_pmu_init(CPUState *cs);
 
+/**
+ * kvm_arm_get_sve_vls
+ * @cs: CPUState
+ * @sve_vls: valid vector length bitmap
+ *
+ * Get the valid vector length bitmap. If a bit 'bit' is set
+ * then the host supports a vector length of (bit * 16) bytes.
+ *
+ * For example, if
+ *
+ *   sve_vls[0] = 0xb and
+ *   sve_vls[1 ... KVM_ARM64_SVE_VLS_WORDS-1] = 0,
+ *
+ * then the host supports 16, 32, and 64 byte vector lengths.
+ *
+ * Returns: the highest set bit if successful else < 0 error code
+ */
+int kvm_arm_get_sve_vls(CPUState *cs,
+                        uint64_t sve_vls[KVM_ARM64_SVE_VLS_WORDS]);
+
 #else
 
 static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
-- 
2.20.1
