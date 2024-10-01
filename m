Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp64686dlb;
        Tue, 1 Oct 2024 00:04:25 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU1K3eP5jS2Z6fS12tBC2OfveV9Lk8zZO3r7P67BqnJUbbGJG1OIFOiKNQzUQfU261Oh4OUQc/7DSNGeg==@linaro.org
X-Google-Smtp-Source: AGHT+IGqRByoDG0wVtpIwzqSigto0jmr5c0mevfDO3DwLdqBS8lsViFZxCdLKn4OtRKwTWl1DCJf
X-Received: by 2002:a17:903:40d1:b0:20b:3f70:2e05 with SMTP id d9443c01a7336-20b3f702f68mr206724185ad.41.1727766265142;
        Tue, 01 Oct 2024 00:04:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766265; cv=pass;
        d=google.com; s=arc-20240605;
        b=AHR46Q0z8cheXUm2q4EmF6UODztnZEybZYmigVOPmmSRTAa4TUUlmt9e8PzTnB+KTI
         ak3/Nc2gdWEk9L5M0NIIk9n+79omBXQRe35amfCzms0c0Q25ctPybXvRihCn+qh4kA6w
         vgnIs4tqUf/5q88a1nC4Ax8hly+y+Jp1369SPoBCmOJdcQGL0bLg9OE3iXkERQgUgrmu
         8E6v3XiMKCg3/g3xw5J9egZMToBh4VByN9xuu5/fiBtlfG8ZcViKzf2cJY1wGqIoOFeP
         XFWQIubcCBOHk85yNs/TCRPkFawQwMARHr/2vDJs+WkDWAJByhRfpLrRpiJphqeWOO46
         JwmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=5nu7oRzEDuJ4v2en89MSPnuWJxVwOywjfAoycNAtOHg=;
        fh=rzGDMRJFBBrjbOaW7dLpUOdm+9c++WP8RCbD+hTQXmk=;
        b=NnxxmZ65tq9b+deIGzBQn5ML3vQw34ru/w61Kii1U2yEfAQObvnZDSa2eJSYENVFdh
         jvxJbZVkBQqqqmRIInLBMNduUVPn0nps8tI85b/3D3pU20TqeuveiWKfWRASJYrX7Clt
         XpVDXnkvlDxk82H+Fvllu+M9MHY8quiSZKiyE3uZ77tBg1xJu7uBM706tTz6Z6Yexk53
         F9ymkA+9zm4zk9HgEkvwWyNIfZ/ss32lZ4op4y/mimCXtzv0tGoU0vsfQytivh17H5/y
         1R7C7t8PNvPICreCglV0b4JW5i3jqVrVS3fkEM+EZei646mzJO6zU8FSjcaxk4Y03h4I
         g1Cg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=f0L68hy2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345353-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345353-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345353-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d9443c01a7336-20b37e36ebbsi102250145ad.280.2024.10.01.00.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:04:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345353-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=f0L68hy2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345353-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345353-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F45BB22753
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A5D1BD01F;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0L68hy2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1EC1BCA01
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766251; cv=none; b=FE2iqr41JdeYVe1cOnz+vTk1OWulYL9G+KUoa3/BV5ZzB9WNvFPpu0kkTA7ujLRc7uVGLQ0kWPDKarpN2/qSn296GYFNY8RzC9dJ5igE2wvQ/Rthi4h/U1gZywUxBT4LRHBnQGmP0QiRgtxQ77RP76Vf473laefTIIQF84Ev6zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766251; c=relaxed/simple;
	bh=tntLg1XIn+hncV2BAYR/kFc1yc1kwy56uncyjqcuPqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7cabEo5dbtZS/jv6WWbczlvt2qQzpv+t8UQzNySuCpw4XHJ1asVx/Q6/N/8ABvRzYQFC5BYy4Agijn3OEnWMmj5tkBePfXTagU9d5fXth1i3dkgDJ24JqZ8fjaEtoesPg3IRSXNy4j4v5yUlXlH3FlVX65lPccrmgGC2KV00FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0L68hy2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236E8C4AF0C;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766251;
	bh=tntLg1XIn+hncV2BAYR/kFc1yc1kwy56uncyjqcuPqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f0L68hy2f4IJG9ZxBgOYwS5Eu0HUkQm+enfod24NznAIqIabWQBFUOVCD3wA5T2X3
	 nILFDBfEtqcVMUp1nlNNUHz2ZktzL896lMnMeEPELhdpalD/Rd4Wlw11AIDVWOsxgD
	 mYEr9ALBlbxBulbx+VLZwJ8Bam9fcYdEGDBshOWHc/YWZVPI5PyEhNm2z+XqAlItLo
	 bfi3/pQtJUArwmmHDzuBO8ozhfvNjZdxgX5Tp7URfJGQEmtWyzxsJQnfI2mb5FHd5t
	 NFLt4Bc6UDECvMOY3e5XGFRexNBS2EGms48oiRFMiUlFvIOAXUojagKLZGvWaJxtlx
	 OhJEPKzB5tXVw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V0X-1qOy;
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
Subject: [PATCH v2 04/15] acpi/ghes: better handle source_id and notification
Date: Tue,  1 Oct 2024 09:03:41 +0200
Message-ID: <1b6ddd0bdfc9ac32a35fa7d85692e635bb76da11.1727766088.git.mchehab+huawei@kernel.org>
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
X-TUID: wM0km3AECnJa

GHES has two fields that are stored on HEST error source
blocks:

- notification type, which is a number defined at the ACPI spec
  containing several arch-specific synchronous and assynchronous
  types;
- source id, which is a HW/FW defined number, used to distinguish
  between different implemented hardware report mechanisms.

Cleanup the logic to fill those, as they should be handled
independently.

This is a preparation for a future patch that will shift
those fields to the HEST init function call.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---

Chenges from v10:

- Some changes got moved to the previous patch.

Changes from v8:
- Non-rename/cleanup changes merged altogether;
- source ID is now more generic, defined per guest target.
  That should make easier to add support for 86.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 4a6c45bcb4be..29cd7e4d8171 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -284,9 +284,13 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
 }
 
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
-static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
+static void build_ghes_v2(GArray *table_data,
+                          BIOSLinker *linker,
+                          enum AcpiGhesNotifyType notify,
+                          uint16_t source_id)
 {
     uint64_t address_offset;
+
     /*
      * Type:
      * Generic Hardware Error Source version 2(GHESv2 - Type 10)
@@ -316,18 +320,8 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
         address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
         ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
 
-    switch (source_id) {
-    case ACPI_HEST_SRC_ID_SEA:
-        /*
-         * Notification Structure
-         * Now only enable ARMv8 SEA notification type
-         */
-        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_SEA);
-        break;
-    default:
-        error_report("Not support this error source");
-        abort();
-    }
+    /* Notification Structure */
+    build_ghes_hw_error_notification(table_data, notify);
 
     /* Error Status Block Length */
     build_append_int_noprefix(table_data, ACPI_GHES_MAX_RAW_DATA_LENGTH, 4);
@@ -369,7 +363,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
-    build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
+    build_ghes_v2(table_data, linker,
+                  ACPI_GHES_NOTIFY_SEA, ACPI_HEST_SRC_ID_SEA);
 
     acpi_table_end(linker, &table);
 }
-- 
2.46.0

