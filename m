Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp117606njl;
        Tue, 1 Oct 2024 04:43:26 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUUZS4ORpS5jXsDyaSXk1OK8O04iU90kPb+jaMU+SVoTNOZ+MLltsGFYyN6JRKH7VN39oAt3AGl9Bm5UA==@linaro.org
X-Google-Smtp-Source: AGHT+IGJmdm9XvUWdDuvPqeO2tvRnUtQMWP8p6c2eG0XkjOnxazDpfKshXRySOrO2o33AdnxNd4M
X-Received: by 2002:a05:6a21:3418:b0:1d2:e945:83b5 with SMTP id adf61e73a8af0-1d4fa694cddmr22268941637.12.1727783005891;
        Tue, 01 Oct 2024 04:43:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727783005; cv=pass;
        d=google.com; s=arc-20240605;
        b=gBkhItNsWxw5b/Z9XC2qT+EzBMHnSEpomdnJghcDaxEyugJN+nZN0EK7JQRraypUNa
         wMvrH06KwMiWfzGLew4Et9xpg/EVVY/MTGm2fqio6d9ZazbXa1YflpRCkpmE3XGPDbwU
         kUC1DkTIk1Ugrdfsyc4sWww8IgAlBdWQPYu8A/jinYaskS5pfT3BiYEeSMGeii0kLLLo
         PBfScx/lfI2tJ6dwNJls8kLnXzRtYDItDgaTs/qC65CJCvzzzoxvHOP52ZNN7FL8mmDp
         8KLD0hsM10Emgk3pTypJOJ8sSlRi12VFooa9nVYWlMHVV/Awq983cNnZO4G5EHtKDttl
         lvXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=mnPpbtce9iJLSsv0tuFZyH0Y3KXxKG0qmobe3yxdbrw=;
        fh=W6Z+7AYTv8c3Bqq94pBgNoE6fEhWN8S9HYXsy1B8x8s=;
        b=RBLNnfStbCnPzfI1A1iVg9NWcDDd8T7WC+SB/0nhsXWXmy0kp9zgPZHwHNWD31UUfk
         dSUKrYGSHLaO+bhWP/Wz+vervDQwvckavuaFhSL8YOS9KOYLayb4RHEBI/JOiCbMHg3O
         MD32J5l0EnFK4iV1I24qLYgz0oBqo0FPaycNgmXEpg5LI/t8roOgfPnQocHd1BmDez8j
         ecaJhWEM1JaFh+ZIIwJH/eMRsIoSkZ44gHyZ+XPDdlAS7XoII2q4h5tHIbWqryerTTky
         /mlDQjJBB3SWfrFc7LCUJ7Z5jbD8oOssumG8ejo6hc5gQ/nlFrO4AFEjOjBAYfvVFKMs
         82ww==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MqkLMWwq;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345810-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345810-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345810-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7e6db6f872dsi10617598a12.823.2024.10.01.04.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345810-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MqkLMWwq;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345810-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345810-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAC5BB215BE
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 11:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325A71BFE12;
	Tue,  1 Oct 2024 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqkLMWwq"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A071A00EE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782997; cv=none; b=KjjVozLbBPIQXm0onJvZc5Q3I35nqTjpXv4fDnOi3vR3C83s+Wv96xBQG6v5XfCpJ8uY40NZq3EIvaGubN6Tw9/rEDcxyeYqddZDRmfS4Wb2Ex8OrLoIrIdbaC6bzyUFXXSguYb3HB5d9SqTOzM381LNNOvNNItme2bn+xtKzgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782997; c=relaxed/simple;
	bh=IyUOOIPt26ymtGpZVs8Q3SZ/F5X7AIWjPA1DhypfsoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAkJI+tCHrxJAKgPsBfqaB5MFaZZ+nESoZd1cr+9bAM2WPKCkO+74aBTMnnlxeQ26eB3S5inp3rBbuHqjB/5GHSwxt6SiqtV9+UcoybOAHAJWSghOA3nLGm+dSd4Ejh+4BGmkov1FSkYeCh0jlZ/Y9+gwz/KCP3ntXFQcmDc880=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqkLMWwq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CB5C4CED1;
	Tue,  1 Oct 2024 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782996;
	bh=IyUOOIPt26ymtGpZVs8Q3SZ/F5X7AIWjPA1DhypfsoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MqkLMWwqY4LgSRssHKEOUG8SdbQoskVNezXq0ZLvCnHxw5RAMZoXBUg92txi1lzu8
	 FCGzX+oDVbXdDsnSLKhsTC1b/hWGmqURIg+x+dmMSjXkedwzZD2yWIIvFpREEHORT/
	 NN99RYPUfzk779N7GUDTtJDMK4i2qAGpeaBUoUiuYW5lhtb+yCsFwkDlh2lGDQl+SY
	 I998W4eVY6yuiEw0+HORF0Ipz8fkqWlLCRwGNJ8D8SR3oHYrcKWAfP4or5rrn3U7ig
	 GjDQl24qfdpxIbSYre5o7mYDsEZMFDdip8aSWENiYyX4GwJvzlZnjrHyvT+gNrZ3IE
	 z26nyMabNTPEg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1svbHd-0000000Add8-3d7C;
	Tue, 01 Oct 2024 13:43:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH RFC 5/5] arm/virt-acpi-build: Properly handle virt-9.1
Date: Tue,  1 Oct 2024 13:42:50 +0200
Message-ID: <2b5b4e57eb5332c83789d4bd0f01214861cc7f0a.1727782588.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727782588.git.mchehab+huawei@kernel.org>
References: <cover.1727782588.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: IImhI2tHT3cM

A virt-9.1 machine can have only one source ID.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/arm/virt-acpi-build.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 476c365851c4..8036eb5953d0 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -894,6 +894,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
     {ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA},
 };
 
+static const AcpiNotificationSourceId hest_ghes_notify_9_1[] = {
+    {ACPI_HEST_SRC_ID_QMP, ACPI_GHES_NOTIFY_GPIO},
+};
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -947,10 +951,28 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_dbg2(tables_blob, tables->linker, vms);
 
     if (vms->ras) {
-        acpi_add_table(table_offsets, tables_blob);
-        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
-                        hest_ghes_notify, ARRAY_SIZE(hest_ghes_notify),
-                        vms->oem_id, vms->oem_table_id);
+        AcpiGhesState *ags;
+        AcpiGedState *acpi_ged_state;
+
+        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+        if (acpi_ged_state) {
+            ags = &acpi_ged_state->ghes_state;
+
+            acpi_add_table(table_offsets, tables_blob);
+
+            if (!ags->hest_lookup) {
+                acpi_build_hest(tables_blob, tables->hardware_errors,
+                                tables->linker, hest_ghes_notify_9_1,
+                                ARRAY_SIZE(hest_ghes_notify_9_1),
+                                vms->oem_id, vms->oem_table_id);
+            } else {
+                acpi_build_hest(tables_blob, tables->hardware_errors,
+                                tables->linker, hest_ghes_notify,
+                                ARRAY_SIZE(hest_ghes_notify),
+                                vms->oem_id, vms->oem_table_id);
+            }
+        }
     }
 
     if (ms->numa_state->num_nodes > 0) {
-- 
2.46.1

