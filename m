Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp789492nji;
        Fri, 12 Jul 2024 06:15:40 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXgCPiufA95HIBwbbfWBWc6CjmhQ1Dy21Ar0FKi7eQHcPYYD40pm0iqWsVG2MK9x1di3CnYs/lSCSRW0/LxSPQjjA1OQ8gk
X-Google-Smtp-Source: AGHT+IEbneDDk3meol7RilWTTokX5LNUmAcjY5pZiJwtY0QDmK44CFtECuXdOIutaDmZJNnd5x50
X-Received: by 2002:a05:620a:28c8:b0:79e:fca5:c312 with SMTP id af79cd13be357-79f19a78d1emr1482850785a.38.1720790140732;
        Fri, 12 Jul 2024 06:15:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1720790140; cv=pass;
        d=google.com; s=arc-20160816;
        b=vS6ExJD86p38fbQZcSxp0CPG192KqUddycZQbAfBy/bGvvK/k7mokSTUDTs65TCuLW
         /dnZXFZbGLqLmuA4pmweUFy4VRknlR2lE1DsWXdhwFRQGpvenfikagaKSrlZsk79NL6h
         NA0ncyiCovn3TR4JL4Z0oIVKpDCE0VT9GFsRSxEYLz3TkvYBr1mg3kS2r+N0efujaPRx
         yosCmNXJioWPLhp40z6xbUH42/H8+MdN/98iYGkfVknhgfRlxgTsKDiEo5glz6lqjZrS
         K9g6RNDVoCvUiqkMlCYsqQHT+kNAMZCdoPbhwZuTNyVWjn2s4FUtflTc1Y9PwoEba5/Q
         hoiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=EXdBCe7c8V0CrYCClPCKd1y+q18dV6ey5HXLmkFk214=;
        fh=PtNBbhfzd/iPYFZoBN0mGdHf/116yuZgRsU3pZBXxyY=;
        b=voempgdJ5ed9EoSnx/jA//nVaH14oq85ZeL8IaAbKforMPtHu1FjAyQQe/lJLc19qc
         gW1JjcelyAVaL5KsnxJz8yDdpFXmveEjbWVLYwtkZhYy/vyfl03aPDTEDzJQPj+NIQLZ
         KdbPI0FHnAWvuvBI7bAAiPqAVyOw6J2FxWxoHu7RLqnqCXM71sjX1kxoh+Ijbk2LkE0a
         WeOWMMeFOpVDzRVwAnkXS+yKgwpIuj4H4X58Cpr5l+dfCUSuKMdTVGee1v2YEcVYpUy9
         cl/Tmc+aGFte5FXo8/bUMGa8KPhTfnDYuIAYy0Znwf1sOjnCPMw7lSSQOZHHim51bfvh
         7Smw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="r9FDkA/V";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-250676-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-250676-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-250676-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-79f190b6b32si1079331685a.447.2024.07.12.06.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 06:15:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-250676-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="r9FDkA/V";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-250676-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-250676-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 580501C22356
	for <alex.bennee@linaro.org>; Fri, 12 Jul 2024 13:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF56017106B;
	Fri, 12 Jul 2024 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9FDkA/V"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC14170826;
	Fri, 12 Jul 2024 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720790122; cv=none; b=jx5yrJEviRWKIJ4fpDCnlme4NAJ8yXYHkhi3lyt1KDg6h2hOLVJpbNLp5p9RBXelGA8H0qDCQd0p1E/93bXWsHnkBUUOvnEogtZoKiYTSG5vKAj5zAU0ScEciBy/OdoSQXXVuNqQe6XOa1R3aFT6WpClWsvVMgmSdZGoFV/1i4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720790122; c=relaxed/simple;
	bh=3+tNSaQ8a39Ggzkv/WVrggnD0uGXWcuNnDojR+LSc44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0RV142nxPH30xZKEWish0InDithxFxzumcUUs1g9wLOediQIqoI/5JYItRkaeUI4CRN2IdRNscxitY6PSJYN+/uwpjF0rnT9w+F5kt0vec1N0VK7IbnDXU56EYF9VTaLNH+TGWg5R41/6U9HpnJmQ3up83YLbBPRg7zYQiwpUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9FDkA/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD06C32786;
	Fri, 12 Jul 2024 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720790122;
	bh=3+tNSaQ8a39Ggzkv/WVrggnD0uGXWcuNnDojR+LSc44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r9FDkA/VxWgd+FqGoKZiXw2m/ArYZ12lDH/lIUDB/KCWYuNLRY0kpWd3QOvCz6pUA
	 miCHeYbCTJR8UVK13P0GtbacHKqcayNGDWk/T2Pzkm5Wt8PkUSt+VpNPGwl78mz+C8
	 9B07lEUFKvoZRAAz9KiVmZ4nYxb9or+qJ5TelcZc19UCPQFvL8FLJOFr//JuBIdgnH
	 biqRjcHDmIWmZiNprlYZ030Io69ctXQkJ7f9agimzMInFPu78UxVTFfVR+UhnKsr7a
	 YfYcYB7Idf3Wz9jrQf89dmP280e1Quk4SJAdMHY+P6xulsHQF+QIN2uOYLDZnAyL8q
	 i5yZJB9EEpBRQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab@kernel.org>)
	id 1sSG7K-00000003iE3-1GoG;
	Fri, 12 Jul 2024 15:15:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Shiju Jose" <shiju.jose@huawei.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 3/7] acpi/ghes: Support GPIO error source.
Date: Fri, 12 Jul 2024 15:15:10 +0200
Message-ID: <90ee117d9950262a9efee1429ae2ecea5fd8a6a4.1720789922.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720789921.git.mchehab+huawei@kernel.org>
References: <cover.1720789921.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: /LR5ldre11hZ

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Add error notification to GHES v2 using the GPIO source.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 8 ++++++--
 include/hw/acpi/ghes.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e9511d9b8f71..5b8bc6eeb437 100644
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
@@ -327,6 +327,9 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
          */
         build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_SEA);
         break;
+    case ACPI_HEST_SRC_ID_GPIO:
+        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_GPIO);
+        break;
     default:
         error_report("Not support this error source");
         abort();
@@ -370,6 +373,7 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
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

