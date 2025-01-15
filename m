Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3039996njn;
        Wed, 15 Jan 2025 04:50:55 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWxrgu+ooPfukvDSGUaZsnlYqvFrBbpPmNPehLCN/5d5kqz3YtV4DPQQ1u0nqshlwTKTqlCQ+tQFNvY3g==@linaro.org
X-Google-Smtp-Source: AGHT+IGwCHbD2wwtpNMgB6V3qz6VZVUEt+vYFX8AGCOKhGUVN9SKa4Xna0deFEHxuxvAqEXBq+XN
X-Received: by 2002:a17:907:3e8c:b0:aae:83c7:6ce3 with SMTP id a640c23a62f3a-ab2abca7867mr3038239566b.43.1736945455080;
        Wed, 15 Jan 2025 04:50:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945455; cv=pass;
        d=google.com; s=arc-20240605;
        b=e6TiRbbxO0/vqRLl5b/qCGIwhUYvVsk1ZJ0WNvGy793gTS1UMsYA0GaCcfvvYkXwc7
         BVzpltuuqg2ht2BbHWftqorPeudNRdfFN+4EUv9K6y8I/2uW83ug5Clx1Dxi7U214VEN
         4X2HXPdVGb41INaeEfcmOLNOZlVFvQuQcAec8lTqNNriyxg95n2nZAUUJe6tngtlytEd
         L5FLiQSjXxa4eAZE2jMYkaJ5DigNg3up+fLNPMEx681FNqvLjMGNu5xsNPtWY49V2OkH
         r2Spub9T5sROOuVWdOPiICmu/sWEixmUNjg9P+/ElEcTvdYo5A3rggw8PVukpuDNShDi
         QKfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=c+uWiOYfrVHPAafnubW0jhBdnbMAhOED69Y55YaZtsY=;
        fh=XWh5htqT3WH2YEMjtF7Wb+aAuEeefwVLf9/4lGSFZ0A=;
        b=dp8QXBE2PXDDVsTiFnVdx/IRe2d68d4mmtjFwIERBGJmMetwQVhojJWLFCpyLJk6go
         DC4XD4vCtWYMZ2j+EBkleugyxuJKxgn6f891vEesGrGcFhRp4VDx5GpUOZ1SJnPJeyWF
         m/cE6IhYR5JEKcrdAK8VTFyepb1somyN0Hq0UVb8XiwVu02mwQF/+A3eRjAoLjP4KF/N
         6csEF0g2tW9TUtHUOPow10y/0YLhPPgMbd7hL0HTudZDgGGbgIZ5tCZwT6fqGkdn5x0M
         /C1GgGRugO8YF7YsrN7kNKJ5ErDOG6ZRXmnIat/noxedP6yhWl43v7wXKAlOUEDJqCks
         m4qw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mBQvI+xI;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-35538-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-35538-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-35538-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d99efd9d35si8369246a12.229.2025.01.15.04.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:50:55 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-35538-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mBQvI+xI;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-35538-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-35538-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54421188B231
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CB22419E4;
	Wed, 15 Jan 2025 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBQvI+xI"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AB9241695;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=cQVVzh5gV7iqFk9HITCNPvkyzX2/1nN4Y3e05XNiKEtNPxRxZTMp4kkglnKzr40gunBBy5OFqO8lO4f3BQVOu5smL1sCu7brILZpUxGrE34oSkSEGeCv8a27EbRdwVAVYnbTvJf6InXxgGeDf67PEmUfzoMsroYeCHFTvhRJF4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=C2mXxM1hfVaEkYu3ugfE5aqpQfBVVNOvxF5g2WH4gn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBrTqWHWK2IQmwgvKYdwb6I5058rOfvyQggsJfGgwaPWNuXhQYaqg6iq0qvlimNJYWYQZYW75IrPJpxv7T3HRNdojYRnJ8ZHikSTHKKE6nDsLlQ8d+XFzkLht3J8T24UsskD2tKRCr8kBa4Kxh8HLhkSUyx8KDy5/1TMsBO+GNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBQvI+xI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B003C4CEEB;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=C2mXxM1hfVaEkYu3ugfE5aqpQfBVVNOvxF5g2WH4gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mBQvI+xInCbMm+72IfLG8Rqly+cLgd+C5hMom/9J3G69fr00xiaZWb7xqjk56jMRv
	 jbpiYBJoBzbjCVTr3Pxjb+b1zPr7/j/XpH5VH/nTp26b2RrHYQtknBVxQWj0izEA6M
	 3YhOV3G0rqgvUG9N64ztgb31oSwQurMWO1lngOgKKJ7taWrI6DPRwPG+1yPU/OG2FK
	 Scg49oHmBrjJIqVamK0+rWlpAVbWUvdzQYZXaWK2HSQK4mAxeSWfRXU/ivoJEI8Hb6
	 Ii8XQcpCBv8abyeStQwCHrTjRxEbBxj7/YNzRhx4388AM94yfs2sQxOPp0mMX28XFT
	 yqxj+InBPjFrg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yG2-1CGN;
	Wed, 15 Jan 2025 13:50:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 10/16] acpi/ghes: better name GHES memory error function
Date: Wed, 15 Jan 2025 13:50:26 +0100
Message-ID: <35b59121129d5e99cb5062cc3d775594bbb0905b.1736945236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736945236.git.mchehab+huawei@kernel.org>
References: <cover.1736945236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: orBaF0xJs8Kq

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
index 6f40cd35a94f..66bd98337ac7 100644
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
index a9444a2c7a86..da30bdbb2349 100644
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

