Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3040583njn;
        Wed, 15 Jan 2025 04:52:06 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWLStOBIQ3mLeWQLd92Cpb1kf0QRn+2AOeM5MyeTVcBWHD05auxXAHMJNerN29cVL6czeHh0L6sda7L3A==@linaro.org
X-Google-Smtp-Source: AGHT+IHRcshQNVVL9Img6C+78OV/lG0SNRbpGAQ3hWojnU5/fmolz5JxBNILiTfBzDTaEHwaA3/h
X-Received: by 2002:a05:6a00:4386:b0:726:8366:40ca with SMTP id d2e1a72fcca58-72d21f1ab6amr40660492b3a.1.1736945525989;
        Wed, 15 Jan 2025 04:52:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945525; cv=pass;
        d=google.com; s=arc-20240605;
        b=Eo5LmPW81ZFn5YWk0vH5u/TriYCPfEwmBK5WOkxGIIzsEKEnBEdsHVEdfomWfeNhWY
         iLm1pGhi110EE1dkRgiiO/cGDq6wxS5pxCXKeSG7y/2727vvr7S9LlQSq5EqE8LGR4uK
         rEehji8VH5uYRi/L0r5yopNCcMS46tnkS/Ukl9YR32sS1GbC7I2ozN0UL+DtJaS8UfKs
         VMBFbZmHMDS/dPI3TQ2whWWfWNCQIxnmUpZ3kUXFWe8ienNoaX//qZQZtJ/yjzR9kRl/
         pEaoVqhGLHl31nnn0dT6ndu/C27n1Xb+BzsqudwGZKqvQjl0eJC9xddnHWNo0lLUHfSI
         EJFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=gyYDlTrCXnTmceOnqwlOgM7OUAAchD1Pahq1wQ6BNK4=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=aIhwI3gFzrVVxQ0REsF5YDQi0E0XXge7SiQ2+CVJgsmQ6bmsVpnc7ascu9Owvo0qKy
         A0x68xBuddSvyGg3ZFg/323TQWrZ1YUublPmMcT+4eBF40zGeXNiHKkRER6ZKr486R3E
         T3QOVccwJN+v6SAFmqjUIQYApNPlwIPAuKQlKkYdVyzDqzv5h+bUHqAMGA7SijY5SoCL
         W5cPm6PqhrpKNB5Rut9JASkLXCrDqgGUWMbbKQeeQNm5aA1r94NOlkr4hz72l4OqMAav
         R6ughjg8dMtXDa9tfqtWfD0io4iWbK8NL6S9MUSFNoH09VosFexbg1wUHj4t2sfZYtDU
         2YWA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=N22bqxUL;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477908-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477908-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-477908-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-72d406ad468si15806080b3a.181.2025.01.15.04.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:52:05 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477908-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=N22bqxUL;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477908-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477908-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B12C3A8D62
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9076243858;
	Wed, 15 Jan 2025 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N22bqxUL"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B5F241699
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=nJ1HP7jYmsrTK9XdqON8pM4qdqJ7NVp/GLQ7uJe2QKs/ymRrIEzdNpSc4hLkckrsvhf7qXIqtWH52oH5hKp35KdzIHPnMqYXjI9DCaMlpL7RYglUSrXtGHlTRBFkxTiUz3ljJnydAHWxIu3dOJf9RWVd3R1MHKRIZ+lt0bTOX3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=Zdz33+JrFuLWEYr3Q523j6TOZr8k9EjWwbpOCTAVnQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDOVhNuwCuv2W7Qv9A7BGmSZMY6GwJQhryGxxG4rpwDhl5I41zucR0rwP3TPqlHpQwJbZfQR3vMzdv2tLw++ELROuKdPZ6x+Tlq/YDfTETa4JNHVkS2DY83hwauOeiWOL2WCbXe//oJGJwezDthZnVeT3jDq9SFdP3cuEuS5twQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N22bqxUL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252EDC4CEE7;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=Zdz33+JrFuLWEYr3Q523j6TOZr8k9EjWwbpOCTAVnQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N22bqxULgEd/eyAcOUlNA3vtX5Cnz0pmi2Bt8ok3xvQ9ZMC2KZaDa8tR5JTl5lDSx
	 64kJAHqpWm2O15pqSU9uhYXMUD9gh8K7MGeVVwr7FgOTa7GbVQhmhmx4e0rPAulhHO
	 O3rgsfxfssDclSBZLrFXrv+Ri8RC3kpqFdfY9UpA1LAzwSf4BQyFSAx7nB0GpkAm+g
	 hwFK4rcBcwkky2noaPxbiHRBxXtjSwrazIOkHnzMlqqqPxNC6P2dSOF0LpXhB+hTse
	 KPUAo/6kwurRMHdnIz8ZZ+bUuRUqPXXCRQDsG+07M9F5HL8OhUWu8Aisf1xS3y4UyK
	 YHtEZq8+0JQJA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yFe-0WAd;
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
Subject: [PATCH v7 04/16] acpi/ghes: better handle source_id and notification
Date: Wed, 15 Jan 2025 13:50:20 +0100
Message-ID: <133ff72ea1041fed7dbcf97b7a2b0f4dfacde31a.1736945236.git.mchehab+huawei@kernel.org>
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
X-TUID: dQdTvjk/NUqN

GHES has two fields that are stored on HEST error source
blocks associated with notifications:

- notification type, which is a number defined at the ACPI spec
  containing several arch-specific synchronous and assynchronous
  types;
- source id, which is a HW/FW defined number, used to distinguish
  between different implemented sources.

There could be several sources with the same notification type,
which is dependent of the way each architecture maps notifications.

Right now, build_ghes_v2() hardcodes a 1:1 mapping between such
fields. Move it to two independent parameters, allowing the
caller function to fill both.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
2.47.1

