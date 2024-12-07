Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378330njb;
        Sat, 7 Dec 2024 00:57:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUuS3FizyK2ryRXVF64v7snJUy+WXIYaQdJedgJ0gEN4GxmtnMKSFbrnrdj7q41a5AZOikbE59lh5Q4jw==@linaro.org
X-Google-Smtp-Source: AGHT+IE4vFlmgsgk31f+luaJxPVrbxWvzrKfkp0edYaUQUf7bcIBUn2ivo5kLLaEg+E45OOmpqxJ
X-Received: by 2002:a05:622a:82:b0:466:b2c9:fafb with SMTP id d75a77b69052e-46734ca404cmr124653421cf.7.1733561838803;
        Sat, 07 Dec 2024 00:57:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733561838; cv=none;
        d=google.com; s=arc-20240605;
        b=NQOzF85V23ZzSOcPcpXoQzXj1rRe+tsOns5WGrJVdQFZFs26huDPLfd5huVG8O8wj6
         2ZAqJ4JVrL4hy8ifhqyiSAo++OECL8aC/S/GPININZgLp5uxRwC0kfyTCzj/UUsdwsXM
         6K2whO5Gq4JYmNz2KiHxgOF9qQvrX3AjoBc/C294JgaBFKlV9Bc7xqgMKuX5Xmrw3Q3o
         I4bQK2dsv1pyUzVBWdzEplxGDu0B3HkTkSLpFDb+PPSDErLeuIqetpqiXIsQKVIV+uFy
         w7k7n+367inLmOuUAPuvkJq/QCKNhDALvS72FffLx7GBUR/UeUVzZkvI0XR1otqAjk2I
         23UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=evr6yWiBymxMETTRBq1aYu3ly4E/afbPZA2PowZdUQE=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=VIIGjl7eWNqo8K5IcfZCW2OlSJBsqpKGYIohWzlP3+5m5Lhwck0pLg3ff9YNKf7kSS
         AFFO9hPYTZyC2kQIJudVxRQGgzn+GojuwZe7T0wjjQDAEnota1WotXrvw1pLahrKxC1q
         sAHpcNaF/M8wRwm7PVG8EfaXLHX7Xl7QZ/+7usIhZpKpzqQ4c9PDcviliBandZtJut4s
         t2CRXFxVEtiHLt7ngFjNM7tePfV7g35L3/eAo/d5EdPrM7zBuiBebGYbfUuhab0yD1vV
         igvbgcsrcTuSwgN02BBc47vOFPiYnKfdiKeHzyTOct0XmCw0bNZPKIwmlQsThvHRcatD
         kmdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=gg4c0K+P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4674a0e2e2asi12229041cf.341.2024.12.07.00.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Dec 2024 00:57:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=gg4c0K+P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJqcO-0007Vt-EI; Sat, 07 Dec 2024 03:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcL-0007Ux-D6; Sat, 07 Dec 2024 03:56:49 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcJ-0002Sq-Gy; Sat, 07 Dec 2024 03:56:48 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 31F8FA4047B;
 Sat,  7 Dec 2024 08:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19DE6C4AF0D;
 Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733561805;
 bh=Be8M4xyPgWUerVPdOaSTwjg+X2UoRgPgIB1JDMFCf+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gg4c0K+PZiAcOCBrHUOAPIMWjFw32hkLX7kyB0HbMxGy9DphC7HBP6mnQEvnPFhHl
 VprYEMOO0PzIAdymysnfXiMDML09fN8IdO1t6J6i5oPfU+NB9LTtpNQTowNhT5NqyK
 +Clk00+uK3QsizP+4lxArej/Y5BVFK/0T0zhPWDP1pd6xnpTRo7FY6unoWe4V96wHH
 NikBeE3GX4EhomBBcz9sLkMHn0hUBLhqh9fLnUyqosRFUofdkWPloYlZmsDZxe8Qhk
 9aZz7iQhM+OVXZkfeMdhezB5Nh7+BNv2oT7/8PE5hOMXBn4jkpAFxToAGqhRcjced/
 XJmXb0B/v8GBg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcF-00000005j5O-1C1u; Sat, 07 Dec 2024 09:56:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 14/16] acpi/ghes: move offset calculus to a separate
 function
Date: Sat,  7 Dec 2024 09:54:20 +0100
Message-ID: <5a2bda4722e2d45839a75f3a193f6b8f4841c773.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F3uWbKAo/hnk

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

