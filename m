Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp24095njb;
        Tue, 3 Dec 2024 23:42:55 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCX8nXH3MaXsdAUgsjAuBR8TEebfLRq9VBkvW8pgqVy+oOTAKiJ4zo7tiFoi2UuCizoJ80rkUvJ5gZLzvg==@linaro.org
X-Google-Smtp-Source: AGHT+IHKaRdvH/L7t/OLKfHs9NzjN9JA2VubpJyKyFWxK7F3FQJzx/GqFJAjklbUUK3s1wJ5bSuC
X-Received: by 2002:a17:902:f70a:b0:215:8112:2fb with SMTP id d9443c01a7336-215811204admr209766095ad.13.1733298175294;
        Tue, 03 Dec 2024 23:42:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733298175; cv=pass;
        d=google.com; s=arc-20240605;
        b=QTyxXyD7mPQL/EwDTGAQQ9JDnty4Fp3otyGA85yv/2CdfD9ukWYrdKqD8584CB8HWc
         pZq+uxW1GL3udkxvWiwmkR1rVAH9dvwyHgbohRQUh/9LKyNbIxJuzXwbhOvaDuqhEGPI
         RM9U6gUqbQdV2W4CrKWKqeOkGWF2EBs1cLr/L84EepVdx7HAKae5QNt0Q0gQV51HGutd
         lut2J00Pyk64uBp0PGVbnQQYua/FcqKmWTT8e8qQgVqYE2MUN/vB9KKVbpnOz9gr4bie
         vIqaaTKjw5kOGGH7Rp/R6XkaDn6oDa+5nkC7XZ0jyK9zj25/MkH8t9eadzt5r5ixqFtb
         I1Kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=UsQqcALGqPcoOf712O8VaDUQBrKu1b04S53Ye8vKxG0=;
        fh=DW0A4WOZj1/bbFrnZPZKwN3fWV5GJFGB29vW04wqTM8=;
        b=g8aNynycXIFDIq5bsV9dN/4uKM1Od59eJdbbXS720ouYX87o/v53pvHEObLxu6jG8r
         Uc13MJ4PHQCD+9vS5fK/2AAWzetXwhT+udCdai2AXTIsM/nDIbzkcgQZh9sFC41tznmx
         gKExM756Z/nA/pqNiiZ950sp0+SKVwLJC//I1KcFHR3ScgZ03vEblIMSdQIDDS7q/rJE
         e5Qw5qFcIFP+0vdSXk06RuucZLJ5Qt06+3Rqio0cQFiF+YKc8SMMkvM54ErPZ3fuYy+1
         ddRpgYkZDjNl0yB4qnbkhmzxTWkTYXYvEc/FQwIRzNaIxtEc3J9S5DToIWETGKuzN4O9
         Ro1A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=V6jCI8CP;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-32989-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-32989-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-32989-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id d9443c01a7336-2156996d309si96316145ad.401.2024.12.03.23.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 23:42:55 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-32989-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=V6jCI8CP;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-32989-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-32989-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43E7BB27C08
	for <alex.bennee@linaro.org>; Wed,  4 Dec 2024 07:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B2518FDA5;
	Wed,  4 Dec 2024 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6jCI8CP"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542318F2DF;
	Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298153; cv=none; b=lsCVTpr0fqf5ynacSI8HFt/7i5JI2uYwfjQejzaMlqRyVKkJOFLpEm+dMUvCjEE0ZIOfDFfS8uKn0/TixVzdkXcZLGyPieiIiJP+dP4IW0Y0l7/+btpkfe8r5/jVOyx4/EGD4EzSpxnkBtnwzCzuUEXx7Lgtc1vtuXttSiyyzFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298153; c=relaxed/simple;
	bh=OYpJ08rHteRT8bwU9HTyEKQSVLVCzWu7IgUkypsnOm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlGqVKtCNVWZ6kTHyV50zr7l7YlzIXgdxhxjL9YxwTIRaCZWSL2leX3f0ARjxuB8yquyVb06kim7KACrtujj/pNV4r3vTJy9N6E8ngI7cafgjZ/6ZVkoM5q5LUtCQ1aen//UgMZCFudR/rHVF8cclj/ewh7vYV0zdii9lIY6LUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6jCI8CP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F4EC4AF0D;
	Wed,  4 Dec 2024 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298153;
	bh=OYpJ08rHteRT8bwU9HTyEKQSVLVCzWu7IgUkypsnOm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V6jCI8CPd97kDF65ZwDijMtNZe/FcTfh+P9IZGUAWE9sSXStBFo/Jwk/RIQB3ilys
	 hYan0p/tLdw4DTdz3hhoLo1rxpagktZN3sCoUbyEC50dqqtVGcI97g8wSUiUEX5mzk
	 5J4m81pcKd5zCgOOeYcKdxHLF6IVjGSvhTgZfoU3TERyuVnYwDRFfYgju6PQz4LWl0
	 Z5GyQKGRAXWnSUBthvWRZdQwcLTB6++jk1zFGqfTkD7n2M/dLJV0hZsTObFfcYk58x
	 4RFG8RxT2qyoUUlxRfO7i5CArJwbcOUJmuniPydHCUde4/yfU6eNOXsTNVqWco5cUY
	 l9hxh7Szirc5A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIk1n-00000004KjI-0oiS;
	Wed, 04 Dec 2024 08:42:31 +0100
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
Subject: [PATCH v5 10/16] acpi/ghes: better name GHES memory error function
Date: Wed,  4 Dec 2024 08:41:18 +0100
Message-ID: <1f16080ef9848dacb207ffdbb2716b1c928d8fad.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: i9XerXnHhEEL

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

