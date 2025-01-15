Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3039921njn;
        Wed, 15 Jan 2025 04:50:47 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWu9cMBFnGepjGj/tA98j0xjyMIqYXFsfdwf0fFyMFsY5Eze6Ue0QzlJT00/dUZccn7DAKGxo6ee5jfRg==@linaro.org
X-Google-Smtp-Source: AGHT+IEEm6jjfdMRAlTElM2Hu1/SBbC2uYBp9Mz21u11dScqmn8JDoQQcQuj5Ol8Cz9cm77pLCpA
X-Received: by 2002:a05:6830:470b:b0:71f:bbbd:ab49 with SMTP id 46e09a7af769-721e2e2e64fmr19474508a34.9.1736945447211;
        Wed, 15 Jan 2025 04:50:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945447; cv=pass;
        d=google.com; s=arc-20240605;
        b=ENJ+kvrTyiuctTAzYv8vfGEMnQHzJNpZnOUcdPw1erM/8FdxipPk8Nx1p1YtM8hhW8
         JKeXB8X8oPETgALnd59bUyk9pB/wFrqJPuiD13mfcfM2GY2pyyPV1Anp+J/fJu8agz0p
         +u0q+JG8G88mu9KZqU8IkN8mv+wintVltt2pnQdCwoTOnm0yK6JzIc8j0d70FMfngocj
         gNMfLvDh7VuDDni6bWJEt8Vi3TffAf380gNCyukBQ4wvffYSK04rcU1URCMu47ZL3ZWI
         fhzt7fthcuVtzTVH4m4AZPMq0hgB4oxhTISbXF8QCsmryopf1RnX++sCKIgFcdCuu4uw
         ezXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=lR3fVOY3g4ehb77yW3uS7yXNPGV/+fMXvzpHnEiTBAI=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=RzSkB5fICM/EFxYmro4gxLuHwQ7licxNjHYduaWZMQfSLn5GPClN6FZcPtZjHsgBMu
         wgqTdfFtwZELMB4PlbpZVoWwGE90scLPAI6IO1/UvfLu+yfYXhTM+Kbn7WHa9HIXNCDv
         h8/ka2EytUz/6o23dWB3A57OgIJpkuKtoBxj5NZ/u0nTqOMLVa4jkD9ghSPbP/zRMTdj
         NoylaMV030SATHtT6WVCWdlWTo0ycQtMEsfiNF0ro56nCksWQw5T+YNLTcpRHDadqCcX
         lwpcYFZOOCDf+ek14mSzurJxL9KHxbCjaKHowmYZvfNXIX/xU5d4G/f0JIl/V1zJZFgr
         slJg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Rc3MLYn7;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477902-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477902-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-477902-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 46e09a7af769-7231865d061si11002654a34.212.2025.01.15.04.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:50:47 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477902-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Rc3MLYn7;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477902-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477902-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDD403A4C7B
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EBA24168D;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rc3MLYn7"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768EA2475D6
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=bkfIhfdI6YfAsSyuXBV0HcIv66bqOsHcqe1uBsNwVCDn9gR4tAH6njrwzPFCOi7ipDxAoInOLqUNKXhWUk6LuRgDzzeW+EAYyXye0+58CdS+NfJT4U02AkPKxQFITItPYEDvWV1OWCC8vXoLMwPMdRu4UIQ+tSosnS7B2qj74QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=XnsenWzyXY6TfpyfSZrWfMTz6cEF8BKuThN2HBT4U7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyKUxTEp6G9XUYHl11LnyOK36Pi2ov0zvJQzIX6n19TQNeDcghQlo7AOd7bnxR62cq1sCzGL8GR2PrNPlgF+lL9vGJ8vnNRDTNAQVstQgeCFXZA+yfzpxUcy2Wk1OvG+QZOaJItpw0BaYfZYh8T9YoDwv9QSlOxe6L6ePVP2Bcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rc3MLYn7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16535C4AF0B;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=XnsenWzyXY6TfpyfSZrWfMTz6cEF8BKuThN2HBT4U7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rc3MLYn7bWabo8awSEWLAPflf7nisnpJTnjC10QI6d2VvJiu3yLsmqQ3ZzIT2uqqR
	 lXXUYFUdoro4NThFOD9pdrCGlexDP7tVkOh4xzIk64Qz8xw027kDCL2x0mXsC/MFCu
	 Aue8TtWOBIH8/+z3/NGE6hDiQIJ/7LvFXgJlbd9qfQyafolDAuLCP9ZEWUFWMPPWpc
	 gb4SAfmtBMvRXkoIsHG9ucEpWlyOF/HV/MmTiyqWgofYypvSoXHINxAmVfDq5+mM7J
	 Wzeq57I4ULhx17+1L3S4/11+DsaTEoetqCAjoSVhOEnaZP8sZzN9hzHQA3em0oxpwI
	 0kI7zh+Rxn/lA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yFP-0BOq;
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/16] acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
Date: Wed, 15 Jan 2025 13:50:17 +0100
Message-ID: <9012bf4c9630adf15a22af3c88fda8270916887b.1736945236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736945236.git.mchehab+huawei@kernel.org>
References: <cover.1736945236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: BZbYX4GEEZ7R

This is just duplicating ACPI_GHES_ERROR_SOURCE_COUNT, which
has a better name. So, drop the duplication.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 7 ++-----
 include/hw/acpi/ghes.h | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e9511d9b8f71..dc217694deb9 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -34,9 +34,6 @@
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
 
-/* Now only support ARMv8 SEA notification type error source */
-#define ACPI_GHES_ERROR_SOURCE_COUNT        1
-
 /* Generic Hardware Error Source version 2 */
 #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
 
@@ -396,7 +393,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
-    assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
+    assert(source_id < ACPI_GHES_ERROR_SOURCE_COUNT);
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
@@ -407,7 +404,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 
     if (physical_address) {
 
-        if (source_id < ACPI_HEST_SRC_ID_RESERVED) {
+        if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
             start_addr += source_id * sizeof(uint64_t);
         }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e905..59e3b8fb24b9 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -59,7 +59,8 @@ enum AcpiGhesNotifyType {
 enum {
     ACPI_HEST_SRC_ID_SEA = 0,
     /* future ids go here */
-    ACPI_HEST_SRC_ID_RESERVED,
+
+    ACPI_GHES_ERROR_SOURCE_COUNT
 };
 
 typedef struct AcpiGhesState {
-- 
2.47.1

