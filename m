Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1015536njb;
        Fri, 6 Dec 2024 09:25:06 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVyMbStHwH1ebSc/Aw1xk/cvPagiASgvisBq/4nz7NpS0uaGAgRAk//1shka8VWHIhyGbXun1C9YHDdjw==@linaro.org
X-Google-Smtp-Source: AGHT+IHhs1vIktQV6VxHl/p7JdT6LLp9ZVENRtlzXTgJwVK5r/prTiU9PsdVEYVAMJbdY9xYrxbz
X-Received: by 2002:a17:902:ce06:b0:215:b9a7:526c with SMTP id d9443c01a7336-21614d5d6bbmr55688715ad.25.1733505906047;
        Fri, 06 Dec 2024 09:25:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505906; cv=pass;
        d=google.com; s=arc-20240605;
        b=hmKPP4dtIpXOCAns74zWHLsAqpW5TrBBplbs9fJcNyKKnN11deBIspTj27wmRkNn1O
         YhCqYQoBsrdy7FKmfhz/eNik/Rkac8KNKkJZqMXyGzNVveMXdHn70d7Abn4rKdwHSWTp
         68yY5MvLa3DgXCIUBeq/cPSTOEgLBqeErJEp+bagLALmUsOYTD6S30YikPIcK035pD8M
         ctQ3IvgjsaRctnGWpLAcTri2NCQ/6jxDmXNDN0ODQeyAvotcmL5sIN+J2gjXZyolMvKb
         xGpI8uWeTrj5txlY7kHhrbxtKOu6Z0EBGVyPbydQ8oxEQcXl03QtDdNzqGiK1GhwNyaP
         efmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=Q7uPzf0BUdN+ZE225ZgRUiWvjDZ47bqCpMOb11qn8Ks=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=BEDSasJfpEHHKTg5geXeGeun+czBADPXXJGSisyQqrxrm8P3UWcNYAQ7DoyjLDvwnu
         1UEVH1TSYPDMZVTK927fq0sm68rQlPLt/mIUjvaJt6cLV4g2w7Oj+SsfOQL2CAZdvdhd
         f6o4b9J5DIiF0x+A8tgioxvcgyGlesPnLLZRecY1UxqPSqN8KGXD/Daw0GFC+u+6M+8L
         aaq0A0VGz5rov52HIz5sHx+WI+IHK0ShbuLyAwmi+UJTjGpIqBiGIR837Z422E3efweu
         fDpnaIuJSZPWlMTi+hVu7tZ/B/SrjNtEMGn4wlOOEdmYFyuq34akB7aOcQG8w5U+ymZQ
         VvtA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="qo6Qvl/A";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435409-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435409-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435409-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-216225dd5f4si10096595ad.494.2024.12.06.09.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:25:06 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435409-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="qo6Qvl/A";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435409-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435409-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FAA8287997
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F65E21AA3F;
	Fri,  6 Dec 2024 17:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qo6Qvl/A"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC7220459A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505688; cv=none; b=Xlsac9vjlJuSEg00dz/FTTUUaUTT26go4L4/b39nbjB7dCSnr7u4Hc59oOw0tEsiNoeSNT7mbuzlFSwdP5mSLzaN48esgG0EFjc1abNllytO86be5aExHz8bFf058ORfU8PqKdwXsA7u8HSu0wJMdnQO67i7+lnW0wIbmXbKGSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505688; c=relaxed/simple;
	bh=W9YAnoSIBP0h6QQnoV6iGZCBdgmPfaExfAOZs9Xc2y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhXmOxTdaAFEGFflEBNheyvTfidN1Fc4G5eoJ0ce5TmIcT3cpTVkTW5b8JzLbrp0/xUzbcjLSgHwsTRBIY623+NVMcNtkdEQlF4Qqt0zhn5pA1D3Nnm7+QRRIi8C0Y/QLUuwsKxvWgJKmesMtFHYNNGAAys3Ez1gdi6n4UTgguE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qo6Qvl/A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F973C4CEE0;
	Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505688;
	bh=W9YAnoSIBP0h6QQnoV6iGZCBdgmPfaExfAOZs9Xc2y8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qo6Qvl/AlnhWF5v8CxOyjJ2xt+dHAFRzTKQJRKmuAk6A6DbJU455anBXw/yEL6Zi8
	 LSwEGEPWthIrWYIlKBsD626h2EnuywXyAuRDpBaV+8184vS7t4kdFoFDQrUm3aTyMN
	 bm69gPmBuaaIKG67LcbNgzOv9nskajkrTv7dPBVqUnM8jkKezDIk6IDScruoA3SFsu
	 /DcAuxRjVeyUIPNHb4UmT5+G+2n8ztihJlV+iqYUmVhIkuqYCcHvCeZdh70QXleEZD
	 OndxeMhW4xy5b+0iOxybYu/dB33lAlZuVvSON3qBoYhhwiHWpb6KaupDzPAnjU7NQv
	 dhgFLewey1ykg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc18-00000005RLX-1MdH;
	Fri, 06 Dec 2024 18:21:26 +0100
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
Subject: [PATCH 31/31] FIXME: acpi/ghes: properly set data record size
Date: Fri,  6 Dec 2024 18:12:53 +0100
Message-ID: <104add143d349685cea1b47298b8f5d367a3a15e.1733504943.git.mchehab+huawei@kernel.org>
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
X-TUID: t6aMTZDzzjqo

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 1fe4c536611a..856551df2103 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -211,6 +211,12 @@ ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
      */
     QemuUUID fru_id = {};
 
+    /*
+     * Calculate the size with this block. No need to check for
+     * too big CPER, as CPER size is checked at ghes_record_cper_errors()
+     */
+    data_length += ACPI_GHES_GESB_SIZE;
+
     /* Build the new generic error status block header */
     acpi_ghes_generic_error_status(block, ACPI_GEBS_UNCORRECTABLE,
         0, 0, data_length, ACPI_CPER_SEV_RECOVERABLE);
@@ -580,21 +586,12 @@ int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
           UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
                   0xED, 0x7C, 0x83, 0xB1);
     Error *errp = NULL;
-    int data_length;
     GArray *block;
 
     block = g_array_new(false, true /* clear */, 1);
 
-    data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
-    /*
-     * It should not run out of the preallocated memory if adding a new generic
-     * error data entry
-     */
-    assert((data_length + ACPI_GHES_GESB_SIZE) <=
-            ACPI_GHES_MAX_RAW_DATA_LENGTH);
-
     ghes_gen_err_data_uncorrectable_recoverable(block, guid,
-                                                data_length);
+                                                ACPI_GHES_MAX_RAW_DATA_LENGTH);
 
     /* Build the memory section CPER for above new generic error data entry */
     acpi_ghes_build_append_mem_cper(block, physical_address);
-- 
2.47.1

