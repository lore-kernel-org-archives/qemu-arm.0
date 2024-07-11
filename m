Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp57339nji;
        Thu, 11 Jul 2024 02:52:28 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU8hR6jGUCRCP3wPgNzDbiZc3M1cpBROm+KtZIXxRDqAaW75tef/6LinTqT9joJOGfr+Uxnbb7Ck6CXnQszxEKD3lUDK4p1
X-Google-Smtp-Source: AGHT+IHxHF5kTcbd5y+eohQLJ2ybBWudSuPmko3OYyl2d2sq4l3ZT9yeQGJruTEDBBdqt+4mkAJ6
X-Received: by 2002:a05:6a00:1394:b0:70b:1c97:bbf3 with SMTP id d2e1a72fcca58-70b43678777mr9030776b3a.28.1720691548380;
        Thu, 11 Jul 2024 02:52:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1720691548; cv=pass;
        d=google.com; s=arc-20160816;
        b=FYCl8PhX8juIJdO1pRWjpqYEvNQWVqHl4qscHRfZBqpnOb6K17UqUNPiQMB56TWqNh
         nDTC9OF6WXCZ65Q0OUWoMZElV+Ls7JrimkLSXjgg9JsdaIRiTRrpfA4+5Ljbaz/zSqUF
         5dYhgCNxBEB1+tgsb3TthZLXM18wnHuG7BQ9KowjUx67yxQbRxFpTR3tj1buIdHbD55m
         MY17T1wI84dTSzjrjHF6VcrJizeosAiPfgesMZGOR4cpIxV59N0PlmvLBbYKG9r2MSti
         YfWAj7erZHgwwRnK2Mcmqz8QWBag72qO50Vg6wWSrDQC1L4o0VlVOJw8SVIJSjgtfjqL
         m3zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=EXdBCe7c8V0CrYCClPCKd1y+q18dV6ey5HXLmkFk214=;
        fh=hWvJbhU/WXu8LKSfVm0g9n4DcepuFFs7ATO8hiWPlH0=;
        b=kzyL+Luq1FoKsrvZDlvZtgD7EWUZHH9H0e4ByaM3QMGbXkK6QhOS3dGJyo1+xT/rC8
         hU0nkB8sRH77to0xDmUFl4RrQOs427bIQCZVaWE+tALbTWQQAeTwtd7RZ+IenW3vZm5H
         RUR+naCnI6cLDY1hxn9dwfvpGhUOZ9Sc2yZWMNMY6sxNmnZ5hOyEY0t3ouKkedcl0dbQ
         devCjnLo6RFKfOTE5/4RjX4+5TsxGioLCqvE+6wgQyWGsemDlW0EQpWsn4+jGJCmln6N
         qphO/zY5wRS5MLrVRl6RHHD2hT9bz3PbM3w4AampmDOay6t1bjs4g4Nq+6eOcy2U0Vex
         jtHg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=VIk+8Q3V;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-248915-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-248915-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-248915-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id d2e1a72fcca58-70b437c1510si5708830b3a.38.2024.07.11.02.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-248915-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=VIk+8Q3V;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-248915-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-248915-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 393F3B22546
	for <alex.bennee@linaro.org>; Thu, 11 Jul 2024 09:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214DF15748F;
	Thu, 11 Jul 2024 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIk+8Q3V"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D553F156641
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jul 2024 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720691540; cv=none; b=ZCBRoZJ+EjVlq2R3SghJozy0FBw3dWczIRuczcdii51VM4KuLfSCjHg6afK4rnaDcql6zB86rqDOVPbwyf0JYMte3pbMTjOXD3uBF/K+4nMNAtfT3CHAN/uNxLuSBpB7ULH2zAqaXWlt5Whfi5881xATw+rysjlQChnMUHYrm38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720691540; c=relaxed/simple;
	bh=3+tNSaQ8a39Ggzkv/WVrggnD0uGXWcuNnDojR+LSc44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1byduwdSPmGGYagFZmDWgOLUrcPFKbcQH2Ia5r0hA1zFZaq+SNtPBpXhk484MzwTtfAQiNpcs3VNtXp/W/ovK9NZktt5G0HSf98fSrnEndwyWYwCqq4ODtEmPtmdpSVXXGyJzXme6c8oPOdC4kQuZzDyJAy1khXlp72kG62SkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIk+8Q3V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803F6C116B1;
	Thu, 11 Jul 2024 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720691540;
	bh=3+tNSaQ8a39Ggzkv/WVrggnD0uGXWcuNnDojR+LSc44=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=VIk+8Q3Vgaa7WC4h1rWszKNeWjJebWyRZ5FSwK6v4zG4HJkoovt6uEjZkPRE/Rafh
	 80cbbe51PIFuCIPSL3h8zM3XcjTW1NomyGnufC/Q7k89lUUnrUwDJ6/bueWu8YXqFA
	 G8L42iM80+wO/twy86CDYAoNBEQzqKKBIfR3LTOqtJQkwB+neaZCaGOgGFYReA1Ca2
	 XRaGmoW9Tn49w4jkII0pzVb+O8QlY2Pg89Piqfl0c1gsa9rZVgg04A24k8L+ueHKbI
	 EAkT8HXGzuOfLMrOiIuLcf4oSyDXnk4txenoMfugsGqLmO1Sfgl5kM8jasM1aiNnYa
	 BXNUa42SrTiHw==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab@kernel.org>)
	id 1sRqTK-00000002jZg-2YEG;
	Thu, 11 Jul 2024 11:52:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-edac@kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 2/6] acpi/ghes: Support GPIO error source.
Date: Thu, 11 Jul 2024 11:52:04 +0200
Message-ID: <101bc837292c02badd2831ee1070065ff0794842.1720690278.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720690278.git.mchehab+huawei@kernel.org>
References: <cover.1720690278.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: aLY5oNzsF/dB

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

