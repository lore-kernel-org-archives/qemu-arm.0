Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1784016njb;
        Mon, 29 Jul 2024 06:21:26 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXTFYlfEXNrL2rz3fAr6ubQbvS3tDh0fOZoMBwKKRVr0jGoXkbM2KpXUSfIOJhmNEASG2OWq2lcU5qha9W7HMUZXzup/Qb/
X-Google-Smtp-Source: AGHT+IFT8dZ3MYJ+NQxkRn7ufEo0+gz2xXN9m0e3wh9q9gpPScEnKlmMHGHT6rwauo7Uvog1/aAj
X-Received: by 2002:a17:903:110f:b0:1fc:3dad:25ed with SMTP id d9443c01a7336-1ff04805c40mr63835445ad.9.1722259285806;
        Mon, 29 Jul 2024 06:21:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722259285; cv=pass;
        d=google.com; s=arc-20160816;
        b=A1QJjpsFSDI5T3twrejBTD52wG+EvZTG3F1Jgv3CjPlU6wMafgZ3EYG6I5dSQTLtNE
         B0O26xP0nxKlEKG9Va6bNi0EQphKn7TC0A6VXieTm2piZuNapqly1MQnHoMyxhD0bwVI
         nycLSfgYMQVEUXioMqaSU+GYrS8ahnxEn1ywilvVInMA0CMq8QNxniQLmgxloKA1icJG
         osGDeymaRAEAmIz74eWqUWvREVJv7zCbixxwcvD6WS0OELxyb8MDkWxenPKitrfEboRv
         COor2f0Nuaj2umAHK5nAW24mfxzcYEU7RnznIwnyGNyo2jP+r1j6XASFAOsmkdwplbO7
         i8WA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=GsPOgB+ueyqVVnB/1zsn+SzG8j47j2ibaMvwsJfzUX8=;
        fh=5gvMMhD2S7UP3QzB201JMOyteTDVwhvTYOpwAATLSYI=;
        b=dXXE0jqbOQr8EpjoVPtAecrSch8comp8Qts/enpchMErrWYoaz5e+AfV3i39gilxx/
         5bjGlZEAgbjaUe8TaCYOVJM5Un5qYym56/eya+AvFwYUa3r254qeqvy+10Zro30ahOjA
         olx4pMXOVCt8FPE+lBNbEWfn8qjMkQoMgXHhFpQuPN0r+i8APqMiXlkS/5TEl8CM2U8N
         ToG8JYkp7XVcqu1JyVIzVKz3PNhIIMSRy10ZYCBWpKErtII8A9XIskQsH+pWqw2ZgplC
         nTFYN3eWgX2dOwdfmPycNiGdZuXhOdOygK4/gs2bkd0KSurtaP78EYNluYzEGMJwToOM
         VGQg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fZ2KSe4c;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265831-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265831-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-265831-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-1fed7ca66b9si98106495ad.89.2024.07.29.06.21.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:21:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-265831-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fZ2KSe4c;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265831-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265831-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 525662825E4
	for <alex.bennee@linaro.org>; Mon, 29 Jul 2024 13:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B36E149C4D;
	Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZ2KSe4c"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C45C3C24
	for <linux-kernel@vger.kernel.org>; Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722259281; cv=none; b=LgWRVwXg0jmBzL2zDc2EzY1QVTQB7lH0ntQsPalZVLbpL3oZDLn8OPitNjFPLf7C9N9/9rXPqiOqrVa7YCzgYkly6CB+u99oWcQDxLcMTfrz7vnkTuNf43EgX2V5fqapBc5479e+TmBin7mgTyK5yeU6uceOYyvDBe8DuoHByIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722259281; c=relaxed/simple;
	bh=gUVkPm3/Mv+8SKurFkEgfoAKMWPotqxokzq+MwLEJyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjgdsLpCY8INtbaLkn3N1kQ4g/DMDc8eirdzsIqC3GgByQ5m+VAsxsl+noEWNB2caFlI/EaY7ZWpiyy9LfqhXhD4QC7sabZrWbTPYgAq8PXyu5nSEGm5MdOfGeIWb2I5e+WQa+oFYbXt7Ep1PA5geUxd/Hf5FwTcQHQMh0OLFqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZ2KSe4c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CABC4AF10;
	Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722259281;
	bh=gUVkPm3/Mv+8SKurFkEgfoAKMWPotqxokzq+MwLEJyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZ2KSe4cruXVTBWOK1O0YOMHrzgQX03gECZal+t57opjKOKoZ7u5EsOCKOUeKM7BT
	 CkilIfmN1kstZnEKTDk9JG0JUbodID7iHOuaJdamvsGq9zwKhwzUsBn9UQp5ZF3sMU
	 UmS2mrphr8zBxpt7qFilogtXD+emVMCNHeu54bU0IRy/pAptfcqJHXa9EPN5RT6uap
	 wNFgDRx0ZcZOk1iRa0xnMUqb8K4bhAAPLubESkv/SPyLxL1FuLtW48pJ7eQvnDD6wy
	 QYbACth29A8kOc7vgkW5rINGdxGLKXWXgRdGUA8zbh6fk3UWM2FA3cKbucs/5N5KWA
	 lG0ZXtvDMMnhw==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sYQJT-000000030Vj-0ikj;
	Mon, 29 Jul 2024 15:21:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 5/6] acpi/ghes: Support GPIO error source.
Date: Mon, 29 Jul 2024 15:21:09 +0200
Message-ID: <9a7b1acde960ca699c85c88b3f93550e29d32c57.1722259246.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722259246.git.mchehab+huawei@kernel.org>
References: <cover.1722259246.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: uBLq+DbHttmv

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Add error notification to GHES v2 using the GPIO source.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 8 ++++++--
 include/hw/acpi/ghes.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 8816af8280be..9346f45c59a5 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -34,8 +34,8 @@
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
 
-/* Now only support ARMv8 SEA notification type error source */
-#define ACPI_GHES_ERROR_SOURCE_COUNT        1
+/* Support ARMv8 SEA notification type error source and GPIO interrupt. */
+#define ACPI_GHES_ERROR_SOURCE_COUNT        2
 
 /* Generic Hardware Error Source version 2 */
 #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
@@ -333,6 +333,9 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
          */
         build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_SEA);
         break;
+    case ACPI_HEST_SRC_ID_GPIO:
+        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_GPIO);
+        break;
     default:
         error_report("Not support this error source");
         abort();
@@ -378,6 +381,7 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
+    build_ghes_v2(table_data, ACPI_HEST_SRC_ID_GPIO, linker);
 
     acpi_table_end(linker, &table);
 }
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e905..4f1ab1a73a06 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -58,6 +58,7 @@ enum AcpiGhesNotifyType {
 
 enum {
     ACPI_HEST_SRC_ID_SEA = 0,
+    ACPI_HEST_SRC_ID_GPIO = 1,
     /* future ids go here */
     ACPI_HEST_SRC_ID_RESERVED,
 };
-- 
2.45.2

