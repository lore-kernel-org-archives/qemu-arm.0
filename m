Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp930903njm;
        Wed, 5 Mar 2025 08:42:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUe1q21oS3lNDxuIjSXaP3f9etfgzxuDphP0NB2uZTkV1wzuho0WX3Zvmg2uwGkuze67z59Phk7cd0ttQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHCMrIp6323iWS6L4A3RoyXI/3XauXRkGoNdEABkcaICIRrEtzNTDgsQwImctboWd9U6BWh
X-Received: by 2002:a05:620a:800c:b0:7c0:c332:1cdb with SMTP id af79cd13be357-7c3d8ee4ademr503692985a.38.1741192957143;
        Wed, 05 Mar 2025 08:42:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741192957; cv=none;
        d=google.com; s=arc-20240605;
        b=fb2dui6XNHOo4f+pVr6JCMWbTN2T/+94GQCfglRWUpihWFUnwLjV6XPUEuSPYL1Tiq
         eTdLokwgzcXdmoe2AMS4GyPR31iVBf8RmofKviB+6ohsq8IhtWRpHaFhPqqKNL0RnZhv
         xAR1ik2Ka9ujkSx25vf9ZH1KQj7norXI8QCgDmCAx/mpus1Nq8ov2CDoWynNuQxXdWhR
         wzr9ypf9ePCk350HylmETAVxtoUjKFWWMfIm+aKefVie0NYCsKJAPoTgVbTLMCQzaO7I
         jvKwo/n9IXD4Nyw7dK8Y5mAMcMhe4LY4Q45KIX/9+9Cvf7yoh2QifiXwX+zE88g4rEwQ
         kKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RnclmN74HTl3Tg3O8yHBiRcH3fZb18iLB6RZpAFmyvI=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=eXFSH1jG0qdfBBJk6RvdA5YgMe/lqRcFaOxCD++jWGLhlT9uWnwwa/+/IlIgfHv+7C
         TSOr+ieaIyap/jI1aJ9G1+X1VZP+yTjCN6djVFNq3y3VHgU2p/BOKrw0DyW6wllMdGnm
         addEIxADo7aLW+diffJjNQMU2UO0s+zD93zcXD4xZgBU5e5Z61NCqPLgg4UN85mrjDb3
         J1KNUJXWzXgvF4L03t9oiKblZCRrT49RElsKoSynQjFj+C5ypnomDXCYicdDV3OxDEoO
         gy6KVlnsdLgTVX+ye6VbeQE2+0kIeq5RzFP2gy9V8aSNHR3NJFQmQIfGnZeunab//X52
         ZvsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OGBjbAS2;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e330f15esi12954485a.167.2025.03.05.08.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:42:37 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OGBjbAS2;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741192956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RnclmN74HTl3Tg3O8yHBiRcH3fZb18iLB6RZpAFmyvI=;
	b=OGBjbAS2htGy7lE+CSXTyGrFOFhG8u2l3o0wIt5BJpOyByxGTzhDboFpu+1LFcBUaKbla+
	5e3LTCY28ol5sZj2T3Ay6nVivJl2glR4Gt4HerjYJR6+fr+CgKaVaRkeCLXCvHUPRZvAsM
	cXDQZ8zoQjAeI4KcccDa9Z6tep7AXUo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-GmwD5RQxNv2yt9VQwdL2Mw-1; Wed,
 05 Mar 2025 11:42:33 -0500
X-MC-Unique: GmwD5RQxNv2yt9VQwdL2Mw-1
X-Mimecast-MFC-AGG-ID: GmwD5RQxNv2yt9VQwdL2Mw_1741192951
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9F88F1828A80;
	Wed,  5 Mar 2025 16:42:31 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.9])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D91C31956095;
	Wed,  5 Mar 2025 16:42:15 +0000 (UTC)
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
Subject: [PATCH v2 14/14] arm/cpu: Add generated files
Date: Wed,  5 Mar 2025 17:38:19 +0100
Message-ID: <20250305163819.2477553-15-cohuck@redhat.com>
In-Reply-To: <20250305163819.2477553-1-cohuck@redhat.com>
References: <20250305163819.2477553-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: qLy1wlOtBQ6O

And switch to using the generated definitions.

Generated against Linux 6.14-rc1.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-sysregs.h     | 116 +-----------------------
 target/arm/cpu-sysregs.h.inc | 167 +++++++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+), 114 deletions(-)
 create mode 100644 target/arm/cpu-sysregs.h.inc

diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
index 54a4fadbf0c1..6074516c6d2c 100644
--- a/target/arm/cpu-sysregs.h
+++ b/target/arm/cpu-sysregs.h
@@ -13,120 +13,8 @@
      ((crm) << CP_REG_ARM64_SYSREG_CRM_SHIFT) |         \
      ((op2) << CP_REG_ARM64_SYSREG_OP2_SHIFT))
 
-typedef enum ARMIDRegisterIdx {
-    ID_AA64PFR0_EL1_IDX,
-    ID_AA64PFR1_EL1_IDX,
-    ID_AA64SMFR0_EL1_IDX,
-    ID_AA64DFR0_EL1_IDX,
-    ID_AA64DFR1_EL1_IDX,
-    ID_AA64ISAR0_EL1_IDX,
-    ID_AA64ISAR1_EL1_IDX,
-    ID_AA64ISAR2_EL1_IDX,
-    ID_AA64MMFR0_EL1_IDX,
-    ID_AA64MMFR1_EL1_IDX,
-    ID_AA64MMFR2_EL1_IDX,
-    ID_AA64MMFR3_EL1_IDX,
-    ID_PFR0_EL1_IDX,
-    ID_PFR1_EL1_IDX,
-    ID_DFR0_EL1_IDX,
-    ID_MMFR0_EL1_IDX,
-    ID_MMFR1_EL1_IDX,
-    ID_MMFR2_EL1_IDX,
-    ID_MMFR3_EL1_IDX,
-    ID_ISAR0_EL1_IDX,
-    ID_ISAR1_EL1_IDX,
-    ID_ISAR2_EL1_IDX,
-    ID_ISAR3_EL1_IDX,
-    ID_ISAR4_EL1_IDX,
-    ID_ISAR5_EL1_IDX,
-    ID_MMFR4_EL1_IDX,
-    ID_ISAR6_EL1_IDX,
-    MVFR0_EL1_IDX,
-    MVFR1_EL1_IDX,
-    MVFR2_EL1_IDX,
-    ID_PFR2_EL1_IDX,
-    ID_DFR1_EL1_IDX,
-    ID_MMFR5_EL1_IDX,
-    ID_AA64ZFR0_EL1_IDX,
-    CTR_EL0_IDX,
-    NUM_ID_IDX,
-} ARMIDRegisterIdx;
-
-typedef enum ARMSysRegs {
-    SYS_ID_AA64PFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 0),
-    SYS_ID_AA64PFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 1),
-    SYS_ID_AA64SMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 5),
-    SYS_ID_AA64DFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 5, 0),
-    SYS_ID_AA64DFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 5, 1),
-    SYS_ID_AA64ISAR0_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 0),
-    SYS_ID_AA64ISAR1_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 1),
-    SYS_ID_AA64ISAR2_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 2),
-    SYS_ID_AA64MMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 0),
-    SYS_ID_AA64MMFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 1),
-    SYS_ID_AA64MMFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 2),
-    SYS_ID_AA64MMFR3_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 3),
-    SYS_ID_PFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 0),
-    SYS_ID_PFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 1),
-    SYS_ID_DFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 2),
-    SYS_ID_MMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 4),
-    SYS_ID_MMFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 5),
-    SYS_ID_MMFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 6),
-    SYS_ID_MMFR3_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 7),
-    SYS_ID_ISAR0_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 0),
-    SYS_ID_ISAR1_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 1),
-    SYS_ID_ISAR2_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 2),
-    SYS_ID_ISAR3_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 3),
-    SYS_ID_ISAR4_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 4),
-    SYS_ID_ISAR5_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 5),
-    SYS_ID_MMFR4_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 6),
-    SYS_ID_ISAR6_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 7),
-    SYS_MVFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 0),
-    SYS_MVFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 1),
-    SYS_MVFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 2),
-    SYS_ID_PFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 4),
-    SYS_ID_DFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 5),
-    SYS_ID_MMFR5_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 6),
-    SYS_ID_AA64ZFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 4),
-    SYS_CTR_EL0 = ENCODE_ID_REG(3, 3, 0, 0, 1),
-} ARMSysRegs;
-
-static const uint32_t id_register_sysreg[NUM_ID_IDX] = {
-    [ID_AA64PFR0_EL1_IDX] = SYS_ID_AA64PFR0_EL1,
-    [ID_AA64PFR1_EL1_IDX] = SYS_ID_AA64PFR1_EL1,
-    [ID_AA64SMFR0_EL1_IDX] = SYS_ID_AA64SMFR0_EL1,
-    [ID_AA64DFR0_EL1_IDX] = SYS_ID_AA64DFR0_EL1,
-    [ID_AA64DFR1_EL1_IDX] = SYS_ID_AA64DFR1_EL1,
-    [ID_AA64ISAR0_EL1_IDX] = SYS_ID_AA64ISAR0_EL1,
-    [ID_AA64ISAR1_EL1_IDX] = SYS_ID_AA64ISAR1_EL1,
-    [ID_AA64ISAR2_EL1_IDX] = SYS_ID_AA64ISAR2_EL1,
-    [ID_AA64MMFR0_EL1_IDX] = SYS_ID_AA64MMFR0_EL1,
-    [ID_AA64MMFR1_EL1_IDX] = SYS_ID_AA64MMFR1_EL1,
-    [ID_AA64MMFR2_EL1_IDX] = SYS_ID_AA64MMFR2_EL1,
-    [ID_AA64MMFR3_EL1_IDX] = SYS_ID_AA64MMFR3_EL1,
-    [ID_PFR0_EL1_IDX] = SYS_ID_PFR0_EL1,
-    [ID_PFR1_EL1_IDX] = SYS_ID_PFR1_EL1,
-    [ID_DFR0_EL1_IDX] = SYS_ID_DFR0_EL1,
-    [ID_MMFR0_EL1_IDX] = SYS_ID_MMFR0_EL1,
-    [ID_MMFR1_EL1_IDX] = SYS_ID_MMFR1_EL1,
-    [ID_MMFR2_EL1_IDX] = SYS_ID_MMFR2_EL1,
-    [ID_MMFR3_EL1_IDX] = SYS_ID_MMFR3_EL1,
-    [ID_ISAR0_EL1_IDX] = SYS_ID_ISAR0_EL1,
-    [ID_ISAR1_EL1_IDX] = SYS_ID_ISAR1_EL1,
-    [ID_ISAR2_EL1_IDX] = SYS_ID_ISAR2_EL1,
-    [ID_ISAR3_EL1_IDX] = SYS_ID_ISAR3_EL1,
-    [ID_ISAR4_EL1_IDX] = SYS_ID_ISAR4_EL1,
-    [ID_ISAR5_EL1_IDX] = SYS_ID_ISAR5_EL1,
-    [ID_MMFR4_EL1_IDX] = SYS_ID_MMFR4_EL1,
-    [ID_ISAR6_EL1_IDX] = SYS_ID_ISAR6_EL1,
-    [MVFR0_EL1_IDX] = SYS_MVFR0_EL1,
-    [MVFR1_EL1_IDX] = SYS_MVFR1_EL1,
-    [MVFR2_EL1_IDX] = SYS_MVFR2_EL1,
-    [ID_PFR2_EL1_IDX] = SYS_ID_PFR2_EL1,
-    [ID_DFR1_EL1_IDX] = SYS_ID_DFR1_EL1,
-    [ID_MMFR5_EL1_IDX] = SYS_ID_MMFR5_EL1,
-    [ID_AA64ZFR0_EL1_IDX] = SYS_ID_AA64ZFR0_EL1,
-    [CTR_EL0_IDX] = SYS_CTR_EL0,
-};
+/* include generated definitions */
+#include "cpu-sysregs.h.inc"
 
 int get_sysreg_idx(ARMSysRegs sysreg);
 uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg);
diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
new file mode 100644
index 000000000000..9236c36696df
--- /dev/null
+++ b/target/arm/cpu-sysregs.h.inc
@@ -0,0 +1,167 @@
+/* GENERATED FILE -- DO NOT EDIT */
+#ifndef ARCH_ARM_CPU_SYSREGS_H_INC
+#define ARCH_ARM_CPU_SYSREGS_H_INC
+
+typedef enum ARMIDRegisterIdx {
+    ID_PFR0_EL1_IDX,
+    ID_PFR1_EL1_IDX,
+    ID_DFR0_EL1_IDX,
+    ID_AFR0_EL1_IDX,
+    ID_MMFR0_EL1_IDX,
+    ID_MMFR1_EL1_IDX,
+    ID_MMFR2_EL1_IDX,
+    ID_MMFR3_EL1_IDX,
+    ID_ISAR0_EL1_IDX,
+    ID_ISAR1_EL1_IDX,
+    ID_ISAR2_EL1_IDX,
+    ID_ISAR3_EL1_IDX,
+    ID_ISAR4_EL1_IDX,
+    ID_ISAR5_EL1_IDX,
+    ID_ISAR6_EL1_IDX,
+    ID_MMFR4_EL1_IDX,
+    MVFR0_EL1_IDX,
+    MVFR1_EL1_IDX,
+    MVFR2_EL1_IDX,
+    ID_PFR2_EL1_IDX,
+    ID_DFR1_EL1_IDX,
+    ID_MMFR5_EL1_IDX,
+    ID_AA64PFR0_EL1_IDX,
+    ID_AA64PFR1_EL1_IDX,
+    ID_AA64PFR2_EL1_IDX,
+    ID_AA64ZFR0_EL1_IDX,
+    ID_AA64SMFR0_EL1_IDX,
+    ID_AA64FPFR0_EL1_IDX,
+    ID_AA64DFR0_EL1_IDX,
+    ID_AA64DFR1_EL1_IDX,
+    ID_AA64DFR2_EL1_IDX,
+    ID_AA64AFR0_EL1_IDX,
+    ID_AA64AFR1_EL1_IDX,
+    ID_AA64ISAR0_EL1_IDX,
+    ID_AA64ISAR1_EL1_IDX,
+    ID_AA64ISAR2_EL1_IDX,
+    ID_AA64ISAR3_EL1_IDX,
+    ID_AA64MMFR0_EL1_IDX,
+    ID_AA64MMFR1_EL1_IDX,
+    ID_AA64MMFR2_EL1_IDX,
+    ID_AA64MMFR3_EL1_IDX,
+    ID_AA64MMFR4_EL1_IDX,
+    CCSIDR_EL1_IDX,
+    CLIDR_EL1_IDX,
+    CCSIDR2_EL1_IDX,
+    GMID_EL1_IDX,
+    SMIDR_EL1_IDX,
+    CSSELR_EL1_IDX,
+    CTR_EL0_IDX,
+    DCZID_EL0_IDX,
+    NUM_ID_IDX,
+} ARMIDRegisterIdx;
+
+
+typedef enum ARMSysRegs {
+    SYS_ID_PFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 0),
+    SYS_ID_PFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 1),
+    SYS_ID_DFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 2),
+    SYS_ID_AFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 3),
+    SYS_ID_MMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 4),
+    SYS_ID_MMFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 5),
+    SYS_ID_MMFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 6),
+    SYS_ID_MMFR3_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 7),
+    SYS_ID_ISAR0_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 0),
+    SYS_ID_ISAR1_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 1),
+    SYS_ID_ISAR2_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 2),
+    SYS_ID_ISAR3_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 3),
+    SYS_ID_ISAR4_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 4),
+    SYS_ID_ISAR5_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 5),
+    SYS_ID_ISAR6_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 7),
+    SYS_ID_MMFR4_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 6),
+    SYS_MVFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 0),
+    SYS_MVFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 1),
+    SYS_MVFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 2),
+    SYS_ID_PFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 4),
+    SYS_ID_DFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 5),
+    SYS_ID_MMFR5_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 6),
+    SYS_ID_AA64PFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 0),
+    SYS_ID_AA64PFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 1),
+    SYS_ID_AA64PFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 2),
+    SYS_ID_AA64ZFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 4),
+    SYS_ID_AA64SMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 5),
+    SYS_ID_AA64FPFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 7),
+    SYS_ID_AA64DFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 5, 0),
+    SYS_ID_AA64DFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 5, 1),
+    SYS_ID_AA64DFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 5, 2),
+    SYS_ID_AA64AFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 5, 4),
+    SYS_ID_AA64AFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 5, 5),
+    SYS_ID_AA64ISAR0_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 0),
+    SYS_ID_AA64ISAR1_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 1),
+    SYS_ID_AA64ISAR2_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 2),
+    SYS_ID_AA64ISAR3_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 3),
+    SYS_ID_AA64MMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 0),
+    SYS_ID_AA64MMFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 1),
+    SYS_ID_AA64MMFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 2),
+    SYS_ID_AA64MMFR3_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 3),
+    SYS_ID_AA64MMFR4_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 4),
+    SYS_CCSIDR_EL1 = ENCODE_ID_REG(3, 1, 0, 0, 0),
+    SYS_CLIDR_EL1 = ENCODE_ID_REG(3, 1, 0, 0, 1),
+    SYS_CCSIDR2_EL1 = ENCODE_ID_REG(3, 1, 0, 0, 2),
+    SYS_GMID_EL1 = ENCODE_ID_REG(3, 1, 0, 0, 4),
+    SYS_SMIDR_EL1 = ENCODE_ID_REG(3, 1, 0, 0, 6),
+    SYS_CSSELR_EL1 = ENCODE_ID_REG(3, 2, 0, 0, 0),
+    SYS_CTR_EL0 = ENCODE_ID_REG(3, 3, 0, 0, 1),
+    SYS_DCZID_EL0 = ENCODE_ID_REG(3, 3, 0, 0, 7),
+} ARMSysRegs;
+
+
+static const uint32_t id_register_sysreg[NUM_ID_IDX] = {
+    [ID_PFR0_EL1_IDX] = SYS_ID_PFR0_EL1,
+    [ID_PFR1_EL1_IDX] = SYS_ID_PFR1_EL1,
+    [ID_DFR0_EL1_IDX] = SYS_ID_DFR0_EL1,
+    [ID_AFR0_EL1_IDX] = SYS_ID_AFR0_EL1,
+    [ID_MMFR0_EL1_IDX] = SYS_ID_MMFR0_EL1,
+    [ID_MMFR1_EL1_IDX] = SYS_ID_MMFR1_EL1,
+    [ID_MMFR2_EL1_IDX] = SYS_ID_MMFR2_EL1,
+    [ID_MMFR3_EL1_IDX] = SYS_ID_MMFR3_EL1,
+    [ID_ISAR0_EL1_IDX] = SYS_ID_ISAR0_EL1,
+    [ID_ISAR1_EL1_IDX] = SYS_ID_ISAR1_EL1,
+    [ID_ISAR2_EL1_IDX] = SYS_ID_ISAR2_EL1,
+    [ID_ISAR3_EL1_IDX] = SYS_ID_ISAR3_EL1,
+    [ID_ISAR4_EL1_IDX] = SYS_ID_ISAR4_EL1,
+    [ID_ISAR5_EL1_IDX] = SYS_ID_ISAR5_EL1,
+    [ID_ISAR6_EL1_IDX] = SYS_ID_ISAR6_EL1,
+    [ID_MMFR4_EL1_IDX] = SYS_ID_MMFR4_EL1,
+    [MVFR0_EL1_IDX] = SYS_MVFR0_EL1,
+    [MVFR1_EL1_IDX] = SYS_MVFR1_EL1,
+    [MVFR2_EL1_IDX] = SYS_MVFR2_EL1,
+    [ID_PFR2_EL1_IDX] = SYS_ID_PFR2_EL1,
+    [ID_DFR1_EL1_IDX] = SYS_ID_DFR1_EL1,
+    [ID_MMFR5_EL1_IDX] = SYS_ID_MMFR5_EL1,
+    [ID_AA64PFR0_EL1_IDX] = SYS_ID_AA64PFR0_EL1,
+    [ID_AA64PFR1_EL1_IDX] = SYS_ID_AA64PFR1_EL1,
+    [ID_AA64PFR2_EL1_IDX] = SYS_ID_AA64PFR2_EL1,
+    [ID_AA64ZFR0_EL1_IDX] = SYS_ID_AA64ZFR0_EL1,
+    [ID_AA64SMFR0_EL1_IDX] = SYS_ID_AA64SMFR0_EL1,
+    [ID_AA64FPFR0_EL1_IDX] = SYS_ID_AA64FPFR0_EL1,
+    [ID_AA64DFR0_EL1_IDX] = SYS_ID_AA64DFR0_EL1,
+    [ID_AA64DFR1_EL1_IDX] = SYS_ID_AA64DFR1_EL1,
+    [ID_AA64DFR2_EL1_IDX] = SYS_ID_AA64DFR2_EL1,
+    [ID_AA64AFR0_EL1_IDX] = SYS_ID_AA64AFR0_EL1,
+    [ID_AA64AFR1_EL1_IDX] = SYS_ID_AA64AFR1_EL1,
+    [ID_AA64ISAR0_EL1_IDX] = SYS_ID_AA64ISAR0_EL1,
+    [ID_AA64ISAR1_EL1_IDX] = SYS_ID_AA64ISAR1_EL1,
+    [ID_AA64ISAR2_EL1_IDX] = SYS_ID_AA64ISAR2_EL1,
+    [ID_AA64ISAR3_EL1_IDX] = SYS_ID_AA64ISAR3_EL1,
+    [ID_AA64MMFR0_EL1_IDX] = SYS_ID_AA64MMFR0_EL1,
+    [ID_AA64MMFR1_EL1_IDX] = SYS_ID_AA64MMFR1_EL1,
+    [ID_AA64MMFR2_EL1_IDX] = SYS_ID_AA64MMFR2_EL1,
+    [ID_AA64MMFR3_EL1_IDX] = SYS_ID_AA64MMFR3_EL1,
+    [ID_AA64MMFR4_EL1_IDX] = SYS_ID_AA64MMFR4_EL1,
+    [CCSIDR_EL1_IDX] = SYS_CCSIDR_EL1,
+    [CLIDR_EL1_IDX] = SYS_CLIDR_EL1,
+    [CCSIDR2_EL1_IDX] = SYS_CCSIDR2_EL1,
+    [GMID_EL1_IDX] = SYS_GMID_EL1,
+    [SMIDR_EL1_IDX] = SYS_SMIDR_EL1,
+    [CSSELR_EL1_IDX] = SYS_CSSELR_EL1,
+    [CTR_EL0_IDX] = SYS_CTR_EL0,
+    [DCZID_EL0_IDX] = SYS_DCZID_EL0,
+};
+
+#endif /* ARCH_ARM_CPU_SYSREGS_H_INC */
-- 
2.48.1
