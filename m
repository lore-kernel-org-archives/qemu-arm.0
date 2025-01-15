Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3040495njn;
        Wed, 15 Jan 2025 04:51:56 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVwhZcgFmxHOpZcg3ZqhjmKrSyfalNHTEKzyzSvP/V6QIWQlJzrmcK/aMsc4gKrvZndxP2/gY9inFf6jA==@linaro.org
X-Google-Smtp-Source: AGHT+IGjmCzbR9PL9ey/YG3aIp/OWpLYk5MpsyW8s6aUOAAYK/8j46cb9uu8DbO8G6QUxJ1cp8SF
X-Received: by 2002:a05:620a:bc9:b0:7b6:cb3c:cb81 with SMTP id af79cd13be357-7be5243e7e1mr456683485a.18.1736945516017;
        Wed, 15 Jan 2025 04:51:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945516; cv=pass;
        d=google.com; s=arc-20240605;
        b=kbIIu32vwXT0TGPWZaYE7O6hcCTHY4C0zVFrNVkyi3/q0DNPXytE4iRdH7eDubE4KZ
         va0YofeK7o4I2DXJb4kt8ljWJppdZtrM35HwA5tjg0wx2yCW8GeEy/IsSmi6pEZcTCF/
         xcWPfig+SEeU65SD22fSaiVj4l8dQAQARErq0WAZqqlwr2G61kxX0NIYO6TyJwhNvw50
         XZQJD+muBKrGuoMxFItYnCi8DLcSnBNNT82rlgNVilNOl+tFzzquBOm1IHtUpT0HYAd0
         jUPua14Ve4g3IlLgwmWcsPhNzFqiYNgHO9aj4ECgfbLjFeUAoikCk3L8pshbJ1M1bUfW
         f5UQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=m8NY06NGLwZw5JZ9rWtJJaT/KeWA93ehQSs9/gN8xXg=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=MSiXY01cG3/d5otxdCFD0t34wP15YReVKuzQhXCTN1cY830mW2BLNeHpOTw0WbypEs
         39l7k4bmEVVoDeRKKvLzfME8FHdobOlq8BZQqYUiFGmgcaMwDY3eU6j1oiIpfZfW8zeq
         sIwUbIpr6VebKST8sO6oa4CAZogfwQS1ZqU1QEg+pmiTCtTaoIk9gNA9HLYiDLnlgf4D
         x0vAUQb3Rb3YyM0Mh/dH9Ibr1Oxc9dGZZ0ws9/9feI0+lZQIGmnSYeZapdY5vMpJ96/B
         0qbgksIFe9jlQkbTL/zAQhF59+fV4+ICMEsQ/NA/nvgLFnVsFCd+SzhI+2eVegq+hAAy
         mQdA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YEM7BM7X;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477913-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477913-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-477913-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7bce34fc860si1578901785a.354.2025.01.15.04.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:51:55 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477913-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YEM7BM7X;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477913-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477913-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACD49168E63
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2612A243870;
	Wed, 15 Jan 2025 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEM7BM7X"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90A22416AE
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=lr6asRVDUXx+GqcIJK2qNroXwFu6G/+3NTlAcp/RDDOTEm2VR5dHA8PGJ9IYGGl/vRVEP4W732YJTlJG3KE1GbLig83Uqqd10sGvrrtrB8yInGBQ8Df7a3JcAq83k6JlgBR1IB7IMxxRkSyMbj/kvVm4u7m9zB2FcY0Jh40WqhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=oVp3XpOKbd948VgOdJ8Xfp7/WBRW0R3mJMUfyy5sZvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppSFbwA8HBfof6AFckHY6Dol1Kf33H5diWJuwdCsq2qshRfaVQVQT3hS/+4exIsdrQkak0291rR76BkUsgVAb4rWouBNFOgqleuo3Jnk/ZNgtuZXb2VbnxXRdioV/DFCgCoJxtgMcswlN/cajh0X2r2Iaf06uQvqou2esn0sdq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEM7BM7X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33423C4CEEC;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=oVp3XpOKbd948VgOdJ8Xfp7/WBRW0R3mJMUfyy5sZvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YEM7BM7XQOaDxHGzhXU4bDsEc9YIdw4a0qqJSmbzm7kM/iR0dvkCTt+CMnEPJhdyc
	 RSo/8T5i1dMXVPeJnjOukS1PFn06s1zsRNCVogPQSeLmU7qB6JerbtI7rBSU91K3Ey
	 aCUmamVxOoMpawKrz/dRs3S/zTmlnL5HE48Pjb3qFm8uhy3oMuWRW5s9a4u6KZiTdr
	 n4F1J1PDo9GgbvjNRnkpwuBIhh3gE6BgrD1+WhxvCGnaezkVODZEQneZ2uiu+mfyzQ
	 Y6RE1FuJ08JPSZmfvmMxBcixxfwMdlosfoNbtfAKYwfBol0GYmTAN2YrsBlmoHHuec
	 nGDmpXWKQUbJA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yGI-1eD5;
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
Subject: [PATCH v7 14/16] acpi/ghes: move offset calculus to a separate function
Date: Wed, 15 Jan 2025 13:50:30 +0100
Message-ID: <60fdd1bf379ba1db3099710868802aa49a27febb.1736945236.git.mchehab+huawei@kernel.org>
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
X-TUID: isQGM4Jnn4O6

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
index 983e28505a08..8f59d327d3e5 100644
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

