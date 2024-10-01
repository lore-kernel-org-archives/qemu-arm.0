Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp65194dlb;
        Tue, 1 Oct 2024 00:05:41 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCULGNVPOVloUSMW6L/KLcOzIhkgREodh0tnQm3WV4QWluIYXSkWN2paaWNIfVJc3bhum7fduGJxbiM9MQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFbvBWckNa4ba6H9ORLFMQk1Vl/jxxyEnzTydXRiMeKUYo0L28PtdYG67Rn6ArLL1znFtQs
X-Received: by 2002:ac2:4c53:0:b0:52c:d645:eda7 with SMTP id 2adb3069b0e04-5389fc3c7admr7087750e87.18.1727766340901;
        Tue, 01 Oct 2024 00:05:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766340; cv=pass;
        d=google.com; s=arc-20240605;
        b=FtR4cyW6ZyZAkZ77gBCZx6GrXHXGtIRrS1ZRlNR/NP7CHES1CcMEi8QMvyirQbWAzd
         VlnL/5i8MCZMOnBl/Q3Eup/ezCfwnEj1+BtZf0/n++JLZJlla896/D37DUYNOQ16qY4w
         IBXOUOD5YZWi4cbiin6yIRIGg6OkwiX2rU5yUFHm1nWmVx0GAng/chWmQnYEKIEL29OR
         QJ2pXwScRmFfKyVlRHhsWRIhhmOV8yYhz42kj9fPAnzB5ZnYouek95+YMrhr0vFt3ARy
         IaZQoxQO6vYRUP3W272BJFaI9hC3apogWfhFYSDbhKEDFP9++5QOU/TjiYckMswHXjwu
         IRwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=i4eK1tJ5spf6NBjh5G/nGJSUJHM2qqwWtxQ6fY8zm84=;
        fh=rzGDMRJFBBrjbOaW7dLpUOdm+9c++WP8RCbD+hTQXmk=;
        b=g6aMEBQ78Lhoqj091DqlhSxZH+IvAsbjhDWEmX5YBr2QbvuqwpsiKWCg0VUUG+YRGt
         1AAJefqvX2cguxIj4FQyhVEoa/g1vAvYvwTse1XNihYXCHw3OoZH9fuqJur/27w98jBn
         jFTWL3/eqNpbQ31WGl+JklliNXmnjnyLMSZg473pAr6OCbb4x+sgd3EFzhuPtsM6Zwt/
         Vmub0rO9YX1i23jQX7n1XyosDnmZuer+wcaxXecu5JNJTHdLYtsM6SnwbKUYSWDbXJNr
         KjIpo7gLocBYrPPtYdw7TIbr3VSasPvAqVTSgVF6CkfpwgmRGaH5DD3yVk4IumCpoDtN
         dPYg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=HgmzsIvm;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345359-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345359-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345359-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5c8824a8fcfsi6999631a12.616.2024.10.01.00.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345359-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=HgmzsIvm;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345359-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345359-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7139A1F218AF
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C231BE843;
	Tue,  1 Oct 2024 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgmzsIvm"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F71BD50B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766252; cv=none; b=FZD/sTuwisd6gob8zu/5ksIucHW/2Plz2V84NWL8TZonYDhhmTxl4IrB4VSgjoZFhaRF5r/FwPAMQrJwid7bvoBDYw6P0si5jYiuHI2+9khPSC4SuVa6shF0smUhIzUzBWCrdnDaQics8fYyB0MolodGMzZci4AgnrhpXa9Xogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766252; c=relaxed/simple;
	bh=+WtTbHUT4iomth9t7xJ9WDT5mR2fPZd0bO/qGgVR9tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i641pcZB7ieIyicmjhnBWxtkC6TeNsgYEgjfpUn39TpHS7n5y6IRIKfhhB8q4d37ppnh1ybFAvUNNg3Jl9F3BiV0YL/F8mJqkGhJ/lq9OJCP8pA7JEFnq10h1B6YtQW8T/Phtg0lrWx7yfTihY7Z1VH+awn60sbOxu3B9qiXgKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgmzsIvm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1BFC4CEDA;
	Tue,  1 Oct 2024 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766252;
	bh=+WtTbHUT4iomth9t7xJ9WDT5mR2fPZd0bO/qGgVR9tM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HgmzsIvm5QyXVzHLRaeBRKGpkQJrMe/MLnxCciIFIsBApB3e3K7ZHsbmocw3fuanZ
	 etV4wAB0vARrPBdx+eMRIDhivDKJmw76U0c1+qZ3dkpIhqhKZ0yvNW6/UENFUBszb5
	 NeNobPOuTFA9uQMoCMJEIz2EvuO2g2CzlbHScQ6mqT4uwBMchJxP+DzdZ8HX4VDtkY
	 f/lXr10EJJRtuWg1GXhE45SAgRJ7QSRCvvIt6B4MTQ5f3KoTZU9SnH8nY7kYJ2GqXK
	 Ftuo09HWmVwcy4ryIIIgyXBFIya3rl4BQI2LeCqUS6fOP3G/5kkp+ur3LoynoJ3gzh
	 rJeKufAR9GLVQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V10-2ucP;
	Tue, 01 Oct 2024 09:04:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 10/15] acpi/ghes: move offset calculus to a separate function
Date: Tue,  1 Oct 2024 09:03:47 +0200
Message-ID: <84226f5976fd29e23ce47d3a5cd311821c8111f8.1727766088.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: AeE3eyZVM1i0

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
 hw/acpi/ghes.c | 50 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 628fa9b22f4b..900f1571bc97 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -378,11 +378,36 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
+static void get_ghes_offsets(uint64_t ghes_addr,
+                             uint64_t *cper_addr,
+                             uint64_t *read_ack_register_addr)
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
+    *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
+}
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
-    uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
-    uint64_t start_addr;
+    uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
@@ -396,27 +421,14 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     g_assert(acpi_ged_state);
     ags = &acpi_ged_state->ghes_state;
 
-    /*
-     * Current version supports only one source, as assured during table build,
-     * so no need to change the start offset based on the source ID.
-     */
-    start_addr = le64_to_cpu(ags->ghes_addr_le);
+    get_ghes_offsets(le64_to_cpu(ags->ghes_addr_le),
+                     &cper_addr, &read_ack_register_addr);
 
-    cpu_physical_memory_read(start_addr, &error_block_addr,
-                             sizeof(error_block_addr));
-
-    error_block_addr = le64_to_cpu(error_block_addr);
-    if (!error_block_addr) {
+    if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
         return;
     }
 
-    /*
-     * As the current version supports only one source, the ack offset is
-     * just sizeof(uint64_t).
-     */
-    read_ack_register_addr = start_addr + sizeof(uint64_t);
-
     cpu_physical_memory_read(read_ack_register_addr,
                              &read_ack_register, sizeof(read_ack_register));
 
@@ -437,7 +449,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
         &read_ack_register, sizeof(uint64_t));
 
     /* Write the generic error data entry into guest memory */
-    cpu_physical_memory_write(error_block_addr, cper, len);
+    cpu_physical_memory_write(cper_addr, cper, len);
 
     return;
 }
-- 
2.46.0

