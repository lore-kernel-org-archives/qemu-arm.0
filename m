Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3039937njn;
        Wed, 15 Jan 2025 04:50:48 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWT871a8Ej4kBlGd+Dfne7AC+Mla622yuaiLPIo8cpYusLq7M9CVmYZmS97CnColsKllEy47TChHqbIhg==@linaro.org
X-Google-Smtp-Source: AGHT+IHYAxRlctA58lsQYyxwvXKvMhWz8DGQyg0VZuSfzk/9tQeF60UCXgf2v8I0fbWXtIOL3FQP
X-Received: by 2002:a05:6808:4493:b0:3ea:4e71:1cfa with SMTP id 5614622812f47-3ef2ee37319mr19651619b6e.36.1736945448343;
        Wed, 15 Jan 2025 04:50:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945448; cv=pass;
        d=google.com; s=arc-20240605;
        b=PBpDl1sX62wCPw2ACt5nloteNUoF7Oxssa43igbh+q4fftA/U48s5u/PCKdJ2Wa5C3
         ovU78Qm5066wYVCdaLMTVvHwdkLaM5bTX4GFSMzz1eIroMgNuc4kNi97hQTo+XSWLNYB
         sqiDUwpv/V4G7Dt0EzLfAVjcNfYwOH0FUICUc4s44XNQQi01w8dKg60GwcLxRixBd5+f
         zYrqtibhw7J0Z+QquKk9UP+dsIHfWrDXgYE7ykzJjNwsFKUj7+5l6mCj3JeBPQOJKtwE
         YI1CLJxS1S7j+MT+kjurkfDKrlacFJMjzYPEcsMGrxu3Wcy2zATnPY6J5ADqDvTVLMwR
         WI0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=9NPImbi+qmHfm0peItbw1IVDMU/YiIq1D0ieA6XltRw=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=Ujv+O4XtoRFj+dmbR6vxZzRYS5EAEh9CcQww8ZiSImH5q2Z5C6bLB0eZ/tvY7wwx1p
         H6IpzUxH/1r31r4tevNw8bdXyuEoFR6a6FyK/b1CpCv/hgOW6v+1VBpDkbDAXz+LoXsH
         Mh7/E2ZJ5j9XL7tSd7bxME/eWeRGySeU4rMCuAl2tm/VD2XcmykFH8qQares35mEpfcn
         FfnJwj+LzbCioRzhHeL7BofwXHYFHxeHMb3iY7jGw8b9teyLEahkKej18tJXjx16s7Oj
         cNdVcZ/6cZGE7HTBJW1SZdUjD58MjYCAYSX61x62pngbOJqZyC2jd7LhxvVGyJQmN3A1
         /dFA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XYmrM4zS;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477903-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477903-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-477903-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 5614622812f47-3f0375ec282si11499604b6e.92.2025.01.15.04.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:50:48 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477903-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XYmrM4zS;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477903-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477903-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABBC83A76B6
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E8F241690;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYmrM4zS"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821F41E98FD
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=QA6M3YMLucnYCcnvpXasFbARDj6wJN35seiUj4wUzZY6SWxN+ExMX+aFoh/WtYRPslLoCJXzYtKv8IozwKyabZcEOB+KwwBvYQQTrais5hRqJ96XaUYiWYmgn1H1qJ/CcnftPAWlm7cLBNI64igpi7uhm33Lyams2LXJKl9/BWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=PPyhW6VsW+yo+jj9o/izTT956e12rFUm5rYlBvONhoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snNHCM42DZjYbtNVsRqZeTEJFO4Wt2BYejEFmKQDlvN3hL31u2d6XPCISwTIG5aiSaGtGqChSmMILAQBIX1EVw8LgJIs8rgd5cJCMlAuM+cNz5O/f1zG/beLKx+DSB0yagmCEdrHwMlveSpg1wjoH/U891wD3IKM20l/F8KQ1Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYmrM4zS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18860C4CEE4;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=PPyhW6VsW+yo+jj9o/izTT956e12rFUm5rYlBvONhoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XYmrM4zSFkukc8tM/a5ZnqoTwjHKq5G5BWAUQQMYOTq4BNcHeUDiSwRNgZm36MbZo
	 VDbxwYpnle7AeyPveigLVCx+fVe8T8oyEPDYxZg6SYvEle25S/fvERXzMtyJK9pM5p
	 Eubme+s8b23mZytTn9/ARDYI+I94QtcQUbgKOylOnuzJlSAko1R263e4GTbmdSE/lC
	 qpJeIQr+5hczwfQ6VCg9m03a7iQMaYpeuYYFuczcEUUMxvahAJyQaRzno7Sq66oBc9
	 qXYdhUtvZARGeHYEkkdBaOYgHCLThkRtQNMZh+XEJ6LnVKfMFvZxAotL33Ixdtdtyc
	 mfHNvfw2sNDzQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yFq-0r1j;
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
Subject: [PATCH v7 07/16] acpi/ghes: Change the type for source_id
Date: Wed, 15 Jan 2025 13:50:23 +0100
Message-ID: <0e83ba548c1aedd1299fe387b94db78986590a34.1736945236.git.mchehab+huawei@kernel.org>
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
X-TUID: O1/CEyRoa63L

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

