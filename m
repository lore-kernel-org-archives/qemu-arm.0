Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp24536njb;
        Tue, 3 Dec 2024 23:44:18 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVqgwZBAqHxbaOYqkjYJLR4hwlebjH/i08m+1Q9E4eTCXJtc/XFJlJf0uvVXtZktxoe2tIckPlvCcrVhw==@linaro.org
X-Google-Smtp-Source: AGHT+IEh1KySf0Y1WyKj0Lx0OGhDfetGrn2DMUOHAJYaAbwrIDSkheRUHSCTFVCgaRRwLowW6jtK
X-Received: by 2002:a05:6808:238a:b0:3e7:5af7:fa21 with SMTP id 5614622812f47-3eae4f3a5dbmr6200214b6e.13.1733298257904;
        Tue, 03 Dec 2024 23:44:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733298257; cv=pass;
        d=google.com; s=arc-20240605;
        b=VasIbxLxLUe37/OrBKeDLKOAgVPd0npLW6maG1RXWL5/RDlsi8Il/iTlXwMEhXb2zw
         NeVsMFcsblGMz1jvukvh5xTcRPsAMaaXP4yhjbplsQwOK132RQ9de4dB6FRpfCc0YsRY
         SKyjki5A8fzV4mEII2N2fVNF3+cSbyLN4kXyAoVAkyzYHBPgkNE3oK5bDLYRgKPh8rUb
         WDynMv0ZNVpMq1WEnN/c0ZxBLZ9AeiY3oanC2lkF7whpiFNKJGGr7NqxOvls+XkAzii+
         WbQT0GBXjtBjAmSTUz9wqdPrgxGiX5i+bXC4LL2bjCkc/IBw64oS6QURRlVn4ibptZFe
         pncA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=evr6yWiBymxMETTRBq1aYu3ly4E/afbPZA2PowZdUQE=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=JDQJzgk3LDF4TtVnjK8Wbx1gXitS7rUqbgeLJclHDQVJtLuLWbOuxWkqjuevbdtxMC
         UOJI5ggS6Dhv+WBudSNJHlpy1bjFk7CBJSGRfI52DoRaTqzW0OCmkPmpqnitz4W5G4Aw
         3uvSBFUAZGQR5+OgK/L/CbsRjtB2qz5te0v2Fkivt52WlVeSoM3sxmMqQP6u6UGMyMsm
         51Qg23KL/pHUSwg7IzpeZZv2jiZm5wbxykFtHElKPhLmyIaxofIMIoEx6Bee/lchGk6g
         clVF4Z6wn9ELe+m9kROUDs3Ok4TX7yb6wA8lO5YkmsvvVDyR3UN932aQ6pPwUmq+BSl0
         fI+g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="LLdcgh/K";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430677-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430677-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-430677-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7fc9c334228si15634098a12.406.2024.12.03.23.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 23:44:17 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-430677-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="LLdcgh/K";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430677-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430677-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66FA6285B70
	for <alex.bennee@linaro.org>; Wed,  4 Dec 2024 07:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B9B196DB1;
	Wed,  4 Dec 2024 07:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLdcgh/K"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D629C18FC7B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298153; cv=none; b=Dft4c5nyIpoudstQvU2c3GTyjNQKb/ryl3l90xBPHEo0r0PF2B6HGgWZ1P6RwDQ3lQ0+MZ6RzeN0LsBBr1bfoZsypD1egatIXtuzwnOrM8F8sJJZlVXGpCsuUhs/+Xn66k4RcJd2apAkMEUhMsNH0IzngX4MvM1/zc7pskWRG9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298153; c=relaxed/simple;
	bh=Be8M4xyPgWUerVPdOaSTwjg+X2UoRgPgIB1JDMFCf+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z6xASmXlXpXBLmuIq8GT9NlD58/uu1XuGENXNWt3HNOddS4t/iMDtfLfhQ0muHAo5KbbISEh880GZGPN5eEiXGtfF7G6p9Sx0kZP36Hr1gwB2oMY7jY+BvlN3iRAHQ21nxNuficQo4Rm/SY9wCOfnThOEl/4AEpr2a/7blNlW2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLdcgh/K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5B2C4CEF0;
	Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298153;
	bh=Be8M4xyPgWUerVPdOaSTwjg+X2UoRgPgIB1JDMFCf+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LLdcgh/Ke1lMyhnUymgjlFrQQrlz4Ho9hj4jptnHfn7dAuxGBiOFT11FGw1nbO8o4
	 Ia4BY7ttYv+UxHvLR7VqAyHL3LtXwkhXrXftf+SwYZMUd4VjV75YDJzeK+OeGkWRL5
	 gH0ZLtYwHkrpCSo7exVg53c3LxtRgNyn7EFmYyMGuAl8vGXAtxmOA3nW8+dlJ3Niqk
	 NBemNEdHxLW0xC9+A8SshtZWhEMfS2Qhs1gzmnwQ5TvniiDrIS5lGOV/mdnO5q4NcK
	 YzA9+dcRB19VBWaNt1lA6InwbbwkzMLRIHdueR66tPJ87qD/afW/Y8P4SbPEusq9IR
	 rT/twqpsM3yMQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIk1n-00000004KjY-1Gf5;
	Wed, 04 Dec 2024 08:42:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 14/16] acpi/ghes: move offset calculus to a separate function
Date: Wed,  4 Dec 2024 08:41:22 +0100
Message-ID: <5a2bda4722e2d45839a75f3a193f6b8f4841c773.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 4yDA89ekzQCf

Currently, CPER address location is calculated as an offset of
the hardware_errors table. It is also badly named, as the
offset actually used is the address where the CPER data starts,
and not the beginning of the error source.

Move the logic which calculates such offset to a separate
function, in preparation for a patch that will be changing the
logic to calculate it from the HEST table.

While here, properly name the variable which stores the cper
address.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 90d76b9c2d8c..a4453ee357bc 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -364,10 +364,37 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
+static void get_hw_error_offsets(uint64_t ghes_addr,
+                                 uint64_t *cper_addr,
+                                 uint64_t *read_ack_register_addr)
+{
+    if (!ghes_addr) {
+        return;
+    }
+
+    /*
+     * non-HEST version supports only one source, so no need to change
+     * the start offset based on the source ID. Also, we can't validate
+     * the source ID, as it is stored inside the HEST table.
+     */
+
+    cpu_physical_memory_read(ghes_addr, cper_addr,
+                             sizeof(*cper_addr));
+
+    *cper_addr = le64_to_cpu(*cper_addr);
+
+    /*
+     * As the current version supports only one source, the ack offset is
+     * just sizeof(uint64_t).
+     */
+    *read_ack_register_addr = ghes_addr +
+			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
+}
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
-    uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
+    uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
     uint64_t start_addr;
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
@@ -389,18 +416,13 @@ void ghes_record_cper_errors(const void *cper, size_t len,
 
     start_addr += source_id * sizeof(uint64_t);
 
-    cpu_physical_memory_read(start_addr, &error_block_addr,
-                             sizeof(error_block_addr));
+    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
 
-    error_block_addr = le64_to_cpu(error_block_addr);
-    if (!error_block_addr) {
+    if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
         return;
     }
 
-    read_ack_register_addr = start_addr +
-                             ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
-
     cpu_physical_memory_read(read_ack_register_addr,
                              &read_ack_register, sizeof(read_ack_register));
 
@@ -421,7 +443,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
         &read_ack_register, sizeof(uint64_t));
 
     /* Write the generic error data entry into guest memory */
-    cpu_physical_memory_write(error_block_addr, cper, len);
+    cpu_physical_memory_write(cper_addr, cper, len);
 
     return;
 }
-- 
2.47.1

