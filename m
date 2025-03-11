Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1978142njc;
        Tue, 11 Mar 2025 09:29:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZeFOjwDn0cjQk4kmSZZtdcr/fGW1ENjznrQRIet3WEghAWI1uoVycktY4Bh29PXVYh/MiVOHT9WyrBw==@linaro.org
X-Google-Smtp-Source: AGHT+IEFrOG8GD43Xvd2dBK3buXiHOqlcynnIFBhHkg6SxNwJt9SfkTN4gv4pCY7A1Uk+7gkeI++
X-Received: by 2002:a05:6402:1ecf:b0:5e5:ba3e:aaf6 with SMTP id 4fb4d7f45d1cf-5e7628082d4mr5325198a12.1.1741710564092;
        Tue, 11 Mar 2025 09:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741710564; cv=none;
        d=google.com; s=arc-20240605;
        b=GvHssRUXx82JzYyKDOhIjjnVEACNws8UAOsJkRg4dedu8n25M/yPixDj44Ct1Lf+lM
         ZLOH5riy6ANVwoaTwmheesstQlaYROg90spsJZqAeurhZzAQ/FQSJsezTODwojsZu8Mj
         ZabIdRWSJ7V0PajkIjY0UHx7Rc/gCJeeWOiYSdPcQcggG438td8tscoTIRSubfOGuyqc
         phANzGoUdRPRTmpmSeb3H45avA/klh9xhbm16DC0s9XLJkHF6Rj+7A7INWbea6NIssQY
         VJ3kaTUDIs1kL/c5QhSz8KMsLoiKCs7tY2KOb4rktQl4zQZQCjo4+2E/gYaZTibnkfEV
         HKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LGStgYV+NoDUM0TFlnGX24zS6GH+FXY3wLNCNMI/HLk=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=cyiB0sWGJzrghPNXjbIGM5FzBRNBkeKRIOZO1Pbg6Yyhvcjo1n8fzA+uy4V7qVs5OL
         iAf0smUUtwifL/zANMKobgQizIZiKT2n0uFO0arnCwdMoUDwf6B7Hy52AP594tjnNg1R
         sDXJfj33Bp0WYQOgX1dHn+LVtLz0x8XT8QB3Nej+jtP8+WKds01EWX58P34k0OiJD9U/
         M4QuWBinNraqweoYUV416cGSxEg8VGYdey8sGuLXrjQYBVVvUKHBO47V6oIQJj9ybeu+
         /4loOUYdXBhcpu1IdgweihdzpEjESxPllI9NRs8P6Q+YiBaLI56ADBtgvhe+U2K/wYlF
         YTjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VSIdUaAB;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5e5c75f2014si11179553a12.238.2025.03.11.09.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VSIdUaAB;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741710562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGStgYV+NoDUM0TFlnGX24zS6GH+FXY3wLNCNMI/HLk=;
	b=VSIdUaABg6hIStygE4DQUCayOVBs8yBK5c7FGs/5c2uBteLa9nFeXVFeUEnM0aOx0w9cpn
	ElhHed31BQx+yZ1FtqLhQxjoFVQpvX/ufyOqHpnh1My4vjuNlrUFMiheO36QvmOMkQATPL
	xZjipq07wxUB6gguaj7lty0n/xm3AAE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-3wSJKhmTNJicwPWxYgBg6w-1; Tue,
 11 Mar 2025 12:29:21 -0400
X-MC-Unique: 3wSJKhmTNJicwPWxYgBg6w-1
X-Mimecast-MFC-AGG-ID: 3wSJKhmTNJicwPWxYgBg6w_1741710559
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 113011801A00;
	Tue, 11 Mar 2025 16:29:19 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.185])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EE87F180AF7C;
	Tue, 11 Mar 2025 16:29:03 +0000 (UTC)
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
Subject: [PATCH v3 02/14] arm/kvm: add accessors for storing host features into idregs
Date: Tue, 11 Mar 2025 17:28:12 +0100
Message-ID: <20250311162824.199721-3-cohuck@redhat.com>
In-Reply-To: <20250311162824.199721-1-cohuck@redhat.com>
References: <20250311162824.199721-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: GwhQxElFxtyh

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-sysregs.h |  4 ++++
 target/arm/kvm.c         | 22 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
index b95320b5b595..68a7de737185 100644
--- a/target/arm/cpu-sysregs.h
+++ b/target/arm/cpu-sysregs.h
@@ -34,4 +34,8 @@ extern const uint32_t id_register_sysreg[NUM_ID_IDX];
 
 int get_sysreg_idx(ARMSysRegs sysreg);
 
+#ifdef CONFIG_KVM
+uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg);
+#endif
+
 #endif /* ARM_CPU_SYSREGS_H */
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index da30bdbb2349..a0551f8a5a23 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -246,6 +246,28 @@ static bool kvm_arm_pauth_supported(void)
             kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
 }
 
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
