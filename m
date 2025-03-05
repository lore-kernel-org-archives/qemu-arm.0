Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp929039njm;
        Wed, 5 Mar 2025 08:39:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUS8H0R1yTrdMQu0JRwsy7yE7+Sju3hiwvY6Q2cYDz3elSrtv/4wm56HX7reOycbTYB+alV5hk/qb5ppw==@linaro.org
X-Google-Smtp-Source: AGHT+IEyrpIcHBHz7OtUVotE6z6gFfYcIHqO1SvTNxQbfvySC2eNl1VyXqyArvAheqzehUoqXQW6
X-Received: by 2002:ac8:5dce:0:b0:474:f446:138 with SMTP id d75a77b69052e-4750b458137mr55315891cf.27.1741192763603;
        Wed, 05 Mar 2025 08:39:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741192763; cv=none;
        d=google.com; s=arc-20240605;
        b=L9GeskbxjS0IXkhQ01XcUCfOnAbGnbicUS4PmIy7PWaNDeHVZNTb+VG1mt7s1srAjM
         uAhzznuAVH4/vnGYRfax7Ehi2l6wz2Wr/exhv+pZCFVamC1qzw7twRA+GTEZ+ZBZ1M3S
         VHDpE7ctXi+RezrTthIxHXVrxO0uyHwNhRJp8VPrAdq1DtKIdQr0fLFgwQYXNtSnOxT8
         fyo/nzl/XCSBhECP3Xnmk9fvFe6IMHNrn4NSGc2QzR0KMcCDHYxrkt7b6GbaCdhhF3aY
         nnImwWncpCXgpcqatAxgM9L3yFG0wBXgQMSqulBWkCcL6BQLruD48uYsgDjqZ5oJN1d9
         4brw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wKrKWVfaY7mTGlaz0J6916fxeJzslrBJ/6kjw8FTtDA=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=ExIG3q5HjbsozMQ3ZpNcbb35XoubTT6wBuJSudFt6rs+ijqNxxsLJeMA+c3xMipwSw
         UGrArGEqcVg2+lmE4B2s91my3AqdA1vf+sdMSsXMNYerZtIKNtO1HhCAALE3VBWB1LVD
         B2Clhr6BKPKq9lr6/uab5CDNUGMc6c6DuQsQT9K0HQF+aFrMjZy3LP2P4DNqOcgzZwRK
         gTiwt1/P8o8YLMpyvZ2Tw1MOcTE/DHWyUR0KVJc0sxIn/v+ASggnRPqbEpAAVph2q3FV
         D+ZUDMsCbfE9hSvjLzva9zu5De9sifMWQZVJ17YjQDOAoEZW2gEJLnPmdcEmX4dv7udB
         PFug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QTIHbMP3;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4750c3c5997si18759811cf.316.2025.03.05.08.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:39:23 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QTIHbMP3;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741192763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKrKWVfaY7mTGlaz0J6916fxeJzslrBJ/6kjw8FTtDA=;
	b=QTIHbMP3MZ9XxBnup2O7wmWayo0Q6cVy6IVSSxeMNzIkFbOZ1Oo21MRxyM6e01354wFEJQ
	KvXeYi+rb4uG2+dlv0crR/Sdrxn+qYF02cvkQ82y7Eh6LYHm3Tjw15aYKqTxqxZPkDJ52k
	PdqlzRpclZmmhR38vBEA4ACb3xGcyX4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-t-Y3nSZwNTSOUF1lVM-p6Q-1; Wed,
 05 Mar 2025 11:39:19 -0500
X-MC-Unique: t-Y3nSZwNTSOUF1lVM-p6Q-1
X-Mimecast-MFC-AGG-ID: t-Y3nSZwNTSOUF1lVM-p6Q_1741192757
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A00A61956059;
	Wed,  5 Mar 2025 16:39:16 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.9])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 146F81956095;
	Wed,  5 Mar 2025 16:38:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com,
	agraf@csgraf.de
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 02/14] arm/kvm: add accessors for storing host features into idregs
Date: Wed,  5 Mar 2025 17:38:07 +0100
Message-ID: <20250305163819.2477553-3-cohuck@redhat.com>
In-Reply-To: <20250305163819.2477553-1-cohuck@redhat.com>
References: <20250305163819.2477553-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: l67I2qYuODNQ

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-sysregs.h |  3 +++
 target/arm/cpu64.c       | 25 +++++++++++++++++++++++++
 target/arm/kvm.c         | 12 ++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
index de09ebae91a5..54a4fadbf0c1 100644
--- a/target/arm/cpu-sysregs.h
+++ b/target/arm/cpu-sysregs.h
@@ -128,4 +128,7 @@ static const uint32_t id_register_sysreg[NUM_ID_IDX] = {
     [CTR_EL0_IDX] = SYS_CTR_EL0,
 };
 
+int get_sysreg_idx(ARMSysRegs sysreg);
+uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg);
+
 #endif /* ARM_CPU_SYSREGS_H */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 8188ede5cc8a..9ae78253cb34 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -736,6 +736,31 @@ static void aarch64_a53_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
+#ifdef CONFIG_KVM
+
+int get_sysreg_idx(ARMSysRegs sysreg)
+{
+    int i;
+
+    for (i = 0; i < NUM_ID_IDX; i++) {
+        if (id_register_sysreg[i] == sysreg) {
+            return i;
+        }
+    }
+    return -1;
+}
+
+uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg)
+{
+    return ARM64_SYS_REG((sysreg & CP_REG_ARM64_SYSREG_OP0_MASK) >> CP_REG_ARM64_SYSREG_OP0_SHIFT,
+                         (sysreg & CP_REG_ARM64_SYSREG_OP1_MASK) >> CP_REG_ARM64_SYSREG_OP1_SHIFT,
+                         (sysreg & CP_REG_ARM64_SYSREG_CRN_MASK) >> CP_REG_ARM64_SYSREG_CRN_SHIFT,
+                         (sysreg & CP_REG_ARM64_SYSREG_CRM_MASK) >> CP_REG_ARM64_SYSREG_CRM_SHIFT,
+                         (sysreg & CP_REG_ARM64_SYSREG_OP2_MASK) >> CP_REG_ARM64_SYSREG_OP2_SHIFT);
+}
+
+#endif
+
 static void aarch64_host_initfn(Object *obj)
 {
 #if defined(CONFIG_KVM)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index da30bdbb2349..2381c87e4ba1 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -246,6 +246,18 @@ static bool kvm_arm_pauth_supported(void)
             kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
 }
 
+/* read a sysreg value and store it in the idregs */
+static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf, ARMIDRegisterIdx index)
+{
+    uint64_t *reg;
+    int ret;
+
+    reg = &ahcf->isar.idregs[index];
+    ret = read_sys_reg64(fd, reg,
+                         idregs_sysreg_to_kvm_reg(id_register_sysreg[index]));
+    return ret;
+}
+
 static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     /* Identify the feature bits corresponding to the host CPU, and
-- 
2.48.1
