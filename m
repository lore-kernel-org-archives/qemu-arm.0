Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1013350njb;
        Fri, 6 Dec 2024 09:21:46 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXWfCM6F37tas3QZyOvNbNsCTV1ExPriuYsfsnQLc9xjMwhlpALs6KM7WMxGO7wDUAQGbpbWF9dvsS/vw==@linaro.org
X-Google-Smtp-Source: AGHT+IGSGXrNarsM9xwWVASx8p7LXTGJUO5uZ0RB2zbCzLC3rRGvH7LL44s/4TlLbjDyKlt9tW1l
X-Received: by 2002:a17:906:30cb:b0:aa5:3782:53af with SMTP id a640c23a62f3a-aa63a07edfcmr284601766b.27.1733505705956;
        Fri, 06 Dec 2024 09:21:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505705; cv=pass;
        d=google.com; s=arc-20240605;
        b=K1powMoPyvZioG/tcpWL3HCDleqMrLu6E1BiOpbacvPvrrrwm1XBofJbtGLpCgSye9
         qJ+cV69cgYYB2lVEo6HEoasnC3DGpcNA3JedD4pkRHISv/v7uojL88u5tfQ8C9hB1nu5
         q5/8+IHQZ0+7y7/1gmIQ3CjthVEfu33yZLlYsHVX4JMA8h8Zp6TKHp/QbgWqIZjtxoWy
         dlqPs/EH/MDkjjjOW2gL2RtSji3OinFXs1N/F+IWbe34vgAiF9Llnl+8YHMTrFzm7ILK
         QEZk+PFWKV3C28QLoNhE6q2kUs6khACTZ1hmsozdx1xdBrGaSfZH3hw0gQnWSREDlOr4
         FWDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=7eEHElr70W9+GVUzzJylkRRl5TyQ5Ta0/hKVeepC9Os=;
        fh=uh1Ni9d5TRQtBxazKWN2ZVKa+Q0o9SI+yVoXHA2sYF4=;
        b=gon3zxWyqnZzRHdRScvIvXBLWiQz57rdoxH4gGm89XaEL3Ezzv+cljj6tG+RrU2rKH
         HYoqWbROvsQedv+5FC93yJ5cFG//iwKxY9t3khjeF4Ej95p8dYi30FK8C4838xpRtFJi
         xFHEE+AqWqoseRSksklh36JvfaNc/97r/do1w0b7su+bIYQOQ6SsTGlpVOVnzbwP4IsT
         stuErYfLUejLAVHasu6t7Ei9sd7YcHOD5DOyo7halgVZKVFlZoniSeMVdCqn1cvh+mM0
         DoRTneJbHfA+f0peJlwGzAZVJBGSx84Ps1VYfAZkOeIQEM4MDr4qBQpB0+gMhqpS/ipO
         YJ0Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mIXFdOi4;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-33224-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-33224-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-33224-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-aa6261bd8adsi274878766b.702.2024.12.06.09.21.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:21:45 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-33224-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mIXFdOi4;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-33224-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-33224-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB2E11882930
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D0720456E;
	Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIXFdOi4"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B6F1FFC7E;
	Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505688; cv=none; b=M9jRNY8x3eyJp24YK4GZ9fyqjA4FLd5nF78qqa6LWiDS2znTWMMNebK8XDtc5ycsto1f4oze7eeYVMSmy2jVm+o9Z6hkqMzJO4Du21QXxp8XgfHkA1lg3i4bUAQsMDjOPPEPdBZko9sJcOOlKWOmmawO+wvezjimZhdSkbZ0Ka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505688; c=relaxed/simple;
	bh=JT8b/ioHveURTHXfhjgSPVQ+q+WwuqGM5jeY5r5+xrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jKJZOkVkID2vEDqXUnZSxVwJMGa7wI1qfqLzP9bv925pQGFSfhAyxsJ0q7ZIB18fPRhJLftwR02FoEBlVFz4l4NJebFc/hmBaLDtZQbULRnqc5jp1m9JhieCkMtwD0NYq6+3eiY8N+YuwLc/Vz0Rg4W5tS3lnSocsFxdMilmpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIXFdOi4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835FAC4CEE6;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505687;
	bh=JT8b/ioHveURTHXfhjgSPVQ+q+WwuqGM5jeY5r5+xrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mIXFdOi4NVe3rIe61EsHqn+VIsX5frVk4Dk8dMFCx/JzQLPc9f0mbaPrXeA/UPWHf
	 ISfENxG/PEbr83YgG/RWRJ42JWEut4cUVrDqdTFvasXCOTa2bFg/e+m/Lmv/9B6ke2
	 /VZNxz+2nhKIRij/Fx9l9EcrmhYe7uZyv/QziVbgKEC7IKqqj4jVDHdJwYJSa1RZwt
	 Q/IVfGmef3Obk+YH079+XDtXYo9nX8WugT6+7xfRZmigo4k9ohE5YIR26ukuxMj+gu
	 lSuy2rwdXqvw+7srXZOcM3llQONlO+RnrBEVITH5Ur24N8zjOfUvczlX3ijUHQ9ruw
	 MJbqJ1rTk7iMA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc17-00000005RKA-35og;
	Fri, 06 Dec 2024 18:21:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/31] acpi/ghes: better name GHES memory error function
Date: Fri,  6 Dec 2024 18:12:32 +0100
Message-ID: <4eda9374d37a60cf74de8b3f9d8ded8e068639c0.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: B3V58KwU4TmY

The current function used to generate GHES data is specific for
memory errors. Give a better name for it, as we now have a generic
function as well.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes-stub.c    | 2 +-
 hw/acpi/ghes.c         | 2 +-
 include/hw/acpi/ghes.h | 4 ++--
 target/arm/kvm.c       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index 2b64cbd2819a..7cec1812dad9 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ghes.h"
 
-int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
+int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
 {
     return -1;
 }
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 4b5332f8c667..414a4a1ee00e 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -415,7 +415,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     return;
 }
 
-int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
+int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
 {
     /* Memory Error Section Type */
     const uint8_t guid[] =
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 8859346af51a..21666a4bcc8b 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -74,15 +74,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
+int acpi_ghes_memory_errors(uint16_t source_id, uint64_t error_physical_addr);
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp);
-int acpi_ghes_record_errors(uint16_t source_id, uint64_t error_physical_addr);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
  *
  * Returns: true if the system has an ACPI GHES table and it is
- * safe to call acpi_ghes_record_errors() to record a memory error.
+ * safe to call acpi_ghes_memory_errors() to record a memory error.
  */
 bool acpi_ghes_present(void);
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7b6812c0de2e..b4260467f8b9 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2387,7 +2387,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
+                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
                     kvm_inject_arm_sea(c);
                 } else {
                     error_report("failed to record the error");
-- 
2.47.1

