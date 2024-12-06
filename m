Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1013927njb;
        Fri, 6 Dec 2024 09:22:35 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVuG4U/n2UaaP46qubAbuh5+8tqQBIfcKYsn4SSAnoebx7ntlkwZ+vcfSp+2jMMpp5k32CKQYYfQq4rOg==@linaro.org
X-Google-Smtp-Source: AGHT+IG+8xE0CTwWMbW9RBfL8l8s8ulmDnrc0oUVVYW7VH6Kh3GvakB6lYfxC6K2ZwjERBjkDhlL
X-Received: by 2002:a17:903:2a8b:b0:215:a039:738 with SMTP id d9443c01a7336-21614d2ecb6mr58132705ad.5.1733505755487;
        Fri, 06 Dec 2024 09:22:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505755; cv=pass;
        d=google.com; s=arc-20240605;
        b=DNyhzSUmd0ZYWlUyZ5XAbJwfq5RBuZW/Qmw1RBhto7atEJQbEp7jPnL1L1HhpM4jNe
         ZQbjvI2h2d+cQWpj+cmbFFbgA6ZgS6VVnKtZOxAmswN4pX2D2oIaQYQ856Jx28KBJHe8
         FuaxR3hNbElYwX9X0adEUdK8AxvQVJGONNIZDsrYAhX3Zaz187+/nQpUwri/p7vRz268
         TRF/Q5SQssg80sO8WoPYVSE+9ojOhvU8yMYdc43gK+0nu6dfJ4b+fxn8EZYxI60b/kZ9
         JoRGaApZ3IrZIi3jn16vaa8nzMLMkr7kVpwI1rdBp4GS+Ik4lXQlyTF2mHTlLrZexwaR
         V5Ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=9NPImbi+qmHfm0peItbw1IVDMU/YiIq1D0ieA6XltRw=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=JgDHMbckxPz0XhF65qSqh0yFra70WRpsK3wFTxYY/mT0UmlcHDL7MYig2649aR69iJ
         tGOfBkgPP5YrWsdizr4nMTwahWfEArWnudC9Tz1QIE4oRM46N922R1GippsNjDxyqLam
         g3+NzCzwdhx8v2s+H7+bKxPaCukAhYKW37xBRBrUiZBEI8aIUGF9KZhd1MVS5aNVRFj5
         q9LTIAJim2dzRCT5fZ9jlcxQ7lfj8ab3iFmEMDAGl911gTBt8YjNel7nttEfZlhuLL7Y
         GTHzLk/78R+EaFyg/2RLVsuzl3REKZ1crdZ8wM0Ta20S3yjosCNeakihwaSGozijbQTi
         lWQQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ar9r2L1f;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435388-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435388-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435388-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-215f8e67f81si46725045ad.145.2024.12.06.09.22.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:22:35 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435388-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ar9r2L1f;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435388-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435388-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 079FB28783D
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FFA216E1D;
	Fri,  6 Dec 2024 17:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ar9r2L1f"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BE81FFC7F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505688; cv=none; b=PALg0bYlLt2WUKjst3Nv7QL9n7881hTk8i4VOD3FIANn3WKXIbp50F+T7/YUAK/gk+zomj5UTGcaCht3gUUs4FQYxb/BqKgy8tf6DMr+NKV4ipKfa+Azqnyf1nifN6wzB6pVvrzvi25Aq6KrrB4G7y6S3BZ5H6ZJU4YBth+3tks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505688; c=relaxed/simple;
	bh=PPyhW6VsW+yo+jj9o/izTT956e12rFUm5rYlBvONhoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdea+jUQpWWrGyQz4bLQX5XeXx2xbTMnySLqkEXX15RSbt/xkSWFfeZ2Mrqt4tVN1s2sfbYnTPfWQZSO0NkOM9A277+kb/tXRT0Qs5FYVy2nh7WKI5KbFEduFhmwcfLk5/3ykLz5woSzoO0vBCb3pTVoUgGNFHs1yCVb1Tc4wGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ar9r2L1f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B27C4AF0B;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505687;
	bh=PPyhW6VsW+yo+jj9o/izTT956e12rFUm5rYlBvONhoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ar9r2L1fNMUT5rZJCG98t5oB0Rr4XQbpPuqh9pl8bIg2kwsiR4JBGN0ekEZUPBvRK
	 rCECr7SNoOC0tSMn3LX5wPld9koAfCQixPt+8ndFxjhCLyUMbs0DwakR1fNmTDCV6c
	 tPoH4hlt8V9msJGRw0CGkEGxYfWhGLYgHqt5MUKvh4J3+bKxbAvX3XNso9KB8FKsk6
	 JPpDgwblP9PGibYDoL8ywYFjRlTUECp6UWYnD4Klr26rlKwuxLcyEVKD6OtxMUdsAN
	 6lwUSpYCViiLtav3bIfl5MDOQlrWq+HllOyr9jYwFDs+lrnbBhFOqp3SCboXMxSDhR
	 6s9EdglqJUVCw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc17-00000005RJy-2jHd;
	Fri, 06 Dec 2024 18:21:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/31] acpi/ghes: Change the type for source_id
Date: Fri,  6 Dec 2024 18:12:29 +0100
Message-ID: <eb088a3b619b3be83c44e9c09dd01321a5451e51.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: fcaQCQjU/am9

As described at: ACPI 6.5 spec at:
	18.3.2. ACPI Error Source

In particular at GHES/GHESv2 table:
	Table 18.10 Generic Hardware Error Source Structure

HEST source ID is actually a 16-bit value.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes-stub.c    | 2 +-
 hw/acpi/ghes.c         | 2 +-
 include/hw/acpi/ghes.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index c315de1802d6..2b64cbd2819a 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ghes.h"
 
-int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
+int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
 {
     return -1;
 }
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 5f67322bf0f2..edc74c38bf8a 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -383,7 +383,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
-int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
+int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
 {
     uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
     uint64_t start_addr;
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 50e3a25ea384..9295e46be25e 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -73,7 +73,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
+int acpi_ghes_record_errors(uint16_t source_id, uint64_t error_physical_addr);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
-- 
2.47.1

