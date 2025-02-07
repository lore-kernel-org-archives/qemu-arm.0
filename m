Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp114711njb;
        Fri, 7 Feb 2025 03:03:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWzZO4TYR8xfGEfDIwG5ZHNi3mQaHQibDEmtqpdh6L9S1GAsik/UyXURRU5tpfUP0EH+96Ws/Y/cIDWYg==@linaro.org
X-Google-Smtp-Source: AGHT+IF+JDJQpzJ7WKdhhGlkn03wVBuaI+St7JV0109dwgQxAu0kgpuit9xCK32pxuG+cVEpXS9x
X-Received: by 2002:a05:622a:81:b0:46c:72bf:622a with SMTP id d75a77b69052e-47167bc5b5cmr39812561cf.36.1738926227986;
        Fri, 07 Feb 2025 03:03:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738926227; cv=none;
        d=google.com; s=arc-20240605;
        b=aY2jGA5W+6qiYgB0F1q9q5/BLXDV4XRP6wAsAfCMwBajGp08g2N+HpgQ0BFo2s+sYk
         IAlsO7RtGobgmSbYn1tr+2zWZahkgM0FI5sXsaaQ3RUtcWLrOQOISpzqGEy+ucJ+H+h+
         sWrq9adaQtiHfMJZrM4gVG0ouCu9RXu81kl4Pgk0hbXgkG8HrB0Za2iQg9l+i60Vx3KO
         RbaKwtOYd1abfLa217yjnTISlupoWkPfwpsrwVdyQNArhDpmg1hY8WEHk5WPhWkadyKn
         JGw2aD6AyZZ+FncdR7sy3oHhtX3qzi7zQ6c6i+afllaBg03YGQozUuMHTtzIWrHGvp2a
         6xWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QhM6ratgTKBjpRGe2Psw2shNLbuzwim/PSIe0653KDs=;
        fh=ou9WwAWkFbBDtrYluijzdFLlSJKncehGww8dMC2w/x0=;
        b=T4VwwNtJwObJaTAHDF1sbuYjwSFw5awneDQGgYAjaXJaJ+XSFirWByeV47FDJmW4rw
         zj++Xxa8lcbI3hLPn5Nw3Gxy/ltMnj+N39dN8n8dTOhEtDlcU6hnbrRaE4nj1OKoQBjz
         h9bayU7UKaSOzaHkLqfbiZSsiF/ggTmiDGMnPYTQ+o2ceQFw5opCB05BraRh1vqwkHVb
         T/CxVl94eyDxKyd83OaD/ftdrqj+VYE/q7Cp6qZwFsMhu4v2SPKzVYdhD5iJRvGNOyJi
         ZyTJEApL4KMJSLOSQfWGJzuikcnycRikP9ACHDhMYUgg29sczkqdm9gkWmUGKiox03hv
         QivA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xud5brfr;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bad463si28877901cf.458.2025.02.07.03.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 03:03:47 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xud5brfr;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738926227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QhM6ratgTKBjpRGe2Psw2shNLbuzwim/PSIe0653KDs=;
	b=Xud5brfrs4aMtykp4PmoLtatnaEFIfPW5jD7oOc3Llvcsfhrg906h+q7Xtkd6otRNXaBT6
	6ekWC0k1AaCDq2zRAA+x2kK3mybeXBwd1GAaoftXclsVnvNlX+wdURBWK68vhW7LrIij5W
	bOK7bPi5+s67rVJkDfS9JMAREOunr4U=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-rV1ys2iaMPmhcbAahxLC7A-1; Fri,
 07 Feb 2025 06:03:44 -0500
X-MC-Unique: rV1ys2iaMPmhcbAahxLC7A-1
X-Mimecast-MFC-AGG-ID: rV1ys2iaMPmhcbAahxLC7A
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A75C61955DB8;
	Fri,  7 Feb 2025 11:03:42 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.130])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 68A8219560AF;
	Fri,  7 Feb 2025 11:03:27 +0000 (UTC)
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
	jdenemar@redhat.com
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 02/15] arm/kvm: add accessors for storing host features into idregs
Date: Fri,  7 Feb 2025 12:02:35 +0100
Message-ID: <20250207110248.1580465-3-cohuck@redhat.com>
In-Reply-To: <20250207110248.1580465-1-cohuck@redhat.com>
References: <20250207110248.1580465-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: yP0wQMzqKi1z

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-sysregs.h |  3 +++
 target/arm/cpu64.c       | 25 +++++++++++++++++++++++++
 target/arm/kvm.c         | 30 ++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

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
index da30bdbb2349..3b8bb5661f2b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -246,6 +246,36 @@ static bool kvm_arm_pauth_supported(void)
             kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
 }
 
+/* read a 32b sysreg value and store it in the idregs */
+static int get_host_cpu_reg32(int fd, ARMHostCPUFeatures *ahcf, ARMSysRegs sysreg)
+{
+    int index = get_sysreg_idx(sysreg);
+    uint64_t *reg;
+    int ret;
+
+    if (index < 0) {
+        return -ERANGE;
+    }
+    reg = &ahcf->isar.idregs[index];
+    ret = read_sys_reg32(fd, (uint32_t *)reg, idregs_sysreg_to_kvm_reg(sysreg));
+    return ret;
+}
+
+/* read a 64b sysreg value and store it in the idregs */
+static int get_host_cpu_reg64(int fd, ARMHostCPUFeatures *ahcf, ARMSysRegs sysreg)
+{
+    int index = get_sysreg_idx(sysreg);
+    uint64_t *reg;
+    int ret;
+
+    if (index < 0) {
+        return -ERANGE;
+    }
+    reg = &ahcf->isar.idregs[index];
+    ret = read_sys_reg64(fd, reg, idregs_sysreg_to_kvm_reg(sysreg));
+    return ret;
+}
+
 static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     /* Identify the feature bits corresponding to the host CPU, and
-- 
2.48.1
