Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5248408njc;
        Fri, 22 Nov 2024 01:12:03 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUo7nv3IdhEdLKGGQ2PwW5Q6eg11ZDNfVZJZN0T+LhQe0l9ahjm1Ns33y9ExqJFmsDDUkbAopBU5Q71Xw==@linaro.org
X-Google-Smtp-Source: AGHT+IFDLzXFBfmVLcoXjOhne875jusk3Q+1PCugMc0edIlv5GPUzS/fV+v+i6OgTpgAV+8URgng
X-Received: by 2002:a05:6a00:10c8:b0:71e:6728:72d5 with SMTP id d2e1a72fcca58-724df64d2e2mr2692447b3a.15.1732266723363;
        Fri, 22 Nov 2024 01:12:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732266723; cv=pass;
        d=google.com; s=arc-20240605;
        b=JvGwZ4DbmjW3wwNmGwiJ66LLzNsP4OB4QhQTbSWtXFFGQ2y5OxehcBrwbpenBvJv8E
         2WrK33k0xtyGkXtBufZCSciOB79ExJ23zj6aIM8o7wkrkpWbZwIJXkMJn+K6m6eGgMfK
         4eRE4mvwKLUG9CzkeEiW3uXJzt//+zIFc4iS0cbSTMpeNChgnXg7/8fk8PQRTKSxO2in
         cIfM6LU9SQvu66DdwaHmJT6dpJCmva9xZ+Q3pXS+keAww1nlvykIQ2wNZ+J3QG/48A5i
         lDCpb2L+SOlv7u+wHibR8I3xxZaM2WzYI8qXosrfobVTOFwoFn2bzKiz9c7x6kEnTbOq
         SoAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=39BiLB9ko6ZeQWpX2s4c1nNz3t+FQYbgwjXGjPgUuYQ=;
        fh=DW0A4WOZj1/bbFrnZPZKwN3fWV5GJFGB29vW04wqTM8=;
        b=JP4ASHJVzL5jg1RHXof0jGI5oN/mFW/FwGkZbGBRKuy3fxa0kTrUwrp+d5K6WYHRs4
         1N8dpY7I4HbO9HuwZDy61P087n/E9T3nIpJmldMitx+A3f1Q4VeFotvk00ttN1K0bd5O
         33+PfjtyPWdFPBBr/WE5kUZBOW7aovSdJluSc+5/rnzuF9oclGeSVw3iXboktBx/Rc4q
         uEd1wwsgpFhyJQqskxnyueKTSW4qysOKXk4PrGNDSsd6BEHei8O0ggrW1u4GMhlw1jJi
         tnkZ5A3hhW2YZGWYRpZoNm1uN/4VXwF1O61xba3E2yA3iQXAJ9oJoAg582UfEXi2BcAj
         YxSg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YEA3vhEA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-32345-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-32345-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-32345-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-724de4dbd29si1727505b3a.40.2024.11.22.01.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:12:03 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-32345-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YEA3vhEA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-32345-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-32345-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E17C6282733
	for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 09:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6231D5AB5;
	Fri, 22 Nov 2024 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEA3vhEA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EA718B473;
	Fri, 22 Nov 2024 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266709; cv=none; b=Jfq0YHmYywESOwzRFAzdSta3YRHzRTgx9nufgqiDJn6RVnvz+2ga/8jyzmkWrE+i6XszMG5fDV/BRAeoLD/zggy79zySLO7PjuIwdKAEVXs6vNVvWHeQ03hN2Tdjw0XthdcohOIh7nrnXPgDkZ993kRL7M2TfG7ADLOMFcQrW0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266709; c=relaxed/simple;
	bh=YzIb4ozSuFNohYnKeFqJQnA1QpxzdVirBPJofbxJBPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DUg2Og0Qm0REI0ul9kqRonap9wv4CUdPD7htiOaw1CV3CpH3RuaRrOUrUT12kHa95mleJZjNK1NjuFYYJh22Y/ToM35w945KICKDiivDKmlzLNmVPNhqmd3y/NN9bR6p/PlygEm2jYyRlvrrLq66AEvcQ+3kKJpEnb8zn0r3nSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEA3vhEA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8061FC4CED9;
	Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732266708;
	bh=YzIb4ozSuFNohYnKeFqJQnA1QpxzdVirBPJofbxJBPA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YEA3vhEAFqa2niH2eyMKUIKbJBypKF9Qv9pK7hC777v0Y1pe+175Y7EUALpEJa7Fy
	 /FSJa/Cxe4j43RkcyQQEMYPgRR5nEO5F+N55DimDkvNdGqGjhUSHr+IXh2B9mdPJWk
	 +mJnPCWJwk6TKVToXoMr5M5WgwyAI/7l51bAhEWta7gBcQKL0d+gIpKyrflW3yq6rM
	 DkYKUgnXqt92p60aRWI+q7n1QW9/H14AJAO6neVmR4h4SLmGqx8jme5SLCwBPZ99Ss
	 +ziUetiOakNBOH3ZNaLKrpiDbHqM0C1fFzTS90bHLKtGBSzLs3GvZQ+wGtgljMfnNT
	 gPiEfRFCoTefw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tEPhX-00000006l3w-0kjr;
	Fri, 22 Nov 2024 10:11:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 09/15] acpi/ghes: better name GHES memory error function
Date: Fri, 22 Nov 2024 10:11:26 +0100
Message-ID: <a19b4321f1f52df5b582b2476f4396c131c3a81d.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: wbyisl+jx07s

The current function used to generate GHES data is specific for
memory errors. Give a better name for it, as we now have a generic
function as well.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
index a96856d5110b..ad7d895def2a 100644
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
2.47.0

