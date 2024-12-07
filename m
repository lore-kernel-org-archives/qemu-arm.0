Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378507njb;
        Sat, 7 Dec 2024 00:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWaj3idDtD6bsaWiD+RxSEOWSyt4vRKMXaYahGGwpMBsR1brYB4vXR6AtTf6q6vQGhVrNl/EEFXaTDuhA==@linaro.org
X-Google-Smtp-Source: AGHT+IES925Ga+Jb+Y5OJPDMIhoUPLD8A58MF+8jvSN7zBjTZI0epQPwlROn3icYI53YmW64tPA6
X-Received: by 2002:a17:90b:5205:b0:2ee:c9b6:c26a with SMTP id 98e67ed59e1d1-2ef69949a6amr9253100a91.11.1733561876750;
        Sat, 07 Dec 2024 00:57:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733561876; cv=pass;
        d=google.com; s=arc-20240605;
        b=Fa0yGsY43B8YoaEFK5A1QGdRquMDw+FyZ7sPHQtkup8P9hOrS7jx/sKIHxcsL04hqV
         A0ZswHpBMzxJV20R1wyPa3JAdaTVuZIyHA64QYk7gkQ9wJCYVMTSuOpIGS4krdKd89ba
         T0+/3y7QkkjwmsvYe91NXiwyZlfENEcK/gRPxAgf66iQChlrjMEr4AkegjYLZtv49mbk
         bgxY5qft2uknSxLBO70HeKw4RODgAx4Y6yvPJK+zhxVmrSMRfiktTnRLuAnugNRcDzuk
         X75ZTi8Q1qMR8R4JULREeWbLVjrkWS2V1mmoAg5/sKFFT8qFwRcSg45AmRisDtzilcZ4
         LpPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=YJW3m8MZG6NLKnjZ2FPzQ6inP289OW1WJ58I5qiqvu8=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=XZjm2+Poeds5DpMJ0h7bw+BBbARw0q2LKsBZlUHeVUrUeknjO4AugVZmI0RatZzLKY
         4TMW7MhnVu3lj9HygETGrFnuFPGskAKdnaXKkAZQzsGjlgr4LznHVuVh+CrPHYKf/OKd
         SSHOEuH1NT9ODXGilWLj50znlnvYhdMaQZF+sHkN6RogDP7Gu8tPhHLLp1q9F6Sq+jvq
         TEEyMwd3EyGmPGaNkgfUcpB6+OXWRKsLICQ/klemzVBOTfpuMvL82kXKoPit6+BmCShr
         uqWmAn8OGPYgdW2qXZwrJsCMSCPxllWRip4HfSy3a3hOMMmbvy7CYWA6hbLa4ydQQaFt
         3Mvw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IMh9DxJz;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435966-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435966-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435966-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2ef45f9ffe2si6210733a91.39.2024.12.07.00.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 00:57:56 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435966-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IMh9DxJz;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435966-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435966-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 547BB282F33
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 08:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1410C14EC73;
	Sat,  7 Dec 2024 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMh9DxJz"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BE213DBBE
	for <linux-kernel@vger.kernel.org>; Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733561805; cv=none; b=SqM4aD0Gi+6NM9IVCph6b1dG0zFWtP46XUqxrQeGAi8E3aikHibUNvCwg0KhSSKkejtfuclVzU+G5CjzdM1zE0u8CsMo9P32ZywrZMAeQO9nJ5wBoybsOy+83pDMbt+QjtvYbyvvLZemZG3LVzi4gMZtTpH73tYMd4Mnz05c+0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733561805; c=relaxed/simple;
	bh=pgakqgvEh0nG6+NLZ9+IaRjALlaeiQhSzDCOXxqHdyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okE1Y2ppk88FamoKXOuuKqbmtNFYBz24PMenEFEBipwbK6Nv7FRZiq3OQxoBApH6n7mW7yoEZO5c+wEajlJcozRysqB+IIwkkZIl4DrkJz9QIpb/flX7BT13QhojWZbTVDdPi4q0uIin1hWPCb7fZszM7bkE3kSWONXXci7ccc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMh9DxJz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AE4C4CEEA;
	Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733561805;
	bh=pgakqgvEh0nG6+NLZ9+IaRjALlaeiQhSzDCOXxqHdyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IMh9DxJzdWA/AcMvDukZWxsyKZgm8GnQFY4r5kHTALUpL/hhob++GLnintJGSguI7
	 402jdQ4hbLb+q6okpVBEAzjuMSQY1XjkaazAsThSWAGlShlu/JESb3+scUeh+Pa0Vn
	 CXzkeLEWusIQQjuKtibsTy52ZNAqQ1Faz3wZ74RmPZM8IzZreoV7IG729XPcjQtjjy
	 WPa4pJG+ytLsUrDZC1k7qJQ6Qn4ZdCbHUgEAl/55qQvR4eW5+67/xglFLqdCVRXrLS
	 /qI342lxqC2RKCmNdwI5R/rp0YtA7jhkZgbM0BxjwSXeAJu+My3+BArPJZzP12v2ZW
	 WO+HjO7w8rlag==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJqcF-00000005j5K-15Pl;
	Sat, 07 Dec 2024 09:56:43 +0100
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
Subject: [PATCH v6 13/16] acpi/ghes: better name the offset of the hardware error firmware
Date: Sat,  7 Dec 2024 09:54:19 +0100
Message-ID: <20b003136d8c008fd54e8d40c806f13867336e13.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: tuxrt3ccH6sC

The hardware error firmware is where HEST error structures are
stored. Those can be GHESv2, but they can also be other types.

Better name the location of the hardware error.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 4 ++--
 hw/acpi/ghes.c                 | 4 ++--
 include/hw/acpi/ghes.h         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 663d9cb09380..17baf36132a8 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -364,7 +364,7 @@ static const VMStateDescription vmstate_ghes = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
+        VMSTATE_UINT64(hw_error_le, AcpiGhesState),
         VMSTATE_END_OF_LIST()
     },
 };
@@ -372,7 +372,7 @@ static const VMStateDescription vmstate_ghes = {
 static bool ghes_needed(void *opaque)
 {
     AcpiGedState *s = opaque;
-    return s->ghes_state.ghes_addr_le;
+    return s->ghes_state.hw_error_le;
 }
 
 static const VMStateDescription vmstate_ghes_state = {
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 52c2b69d3664..90d76b9c2d8c 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -359,7 +359,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
 
     /* Create a read-write fw_cfg file for Address */
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
+        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
     ags->present = true;
 }
@@ -385,7 +385,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    start_addr = le64_to_cpu(ags->ghes_addr_le);
+    start_addr = le64_to_cpu(ags->hw_error_le);
 
     start_addr += source_id * sizeof(uint64_t);
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 21666a4bcc8b..39619a2457cb 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -65,7 +65,7 @@ enum {
 };
 
 typedef struct AcpiGhesState {
-    uint64_t ghes_addr_le;
+    uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
 
-- 
2.47.1

