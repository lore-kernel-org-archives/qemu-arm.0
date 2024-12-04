Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp24154njb;
        Tue, 3 Dec 2024 23:43:06 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXWh+BhLOrJR/fkKCejiDjQlBI+zDHbLrlog6HAHwd2kagkhaoTzfBAKPq1anTcaRlxXGLeOQDSzfXy6w==@linaro.org
X-Google-Smtp-Source: AGHT+IH+QVHAvn267m6PvJ8tmSj+Ve2sGDcOjDFkm2mvEcoeONMhcuP/q54P09xnjEsOq5WvmvTV
X-Received: by 2002:a05:6830:3893:b0:710:fef4:3c92 with SMTP id 46e09a7af769-71dad6cc4damr6839402a34.21.1733298186642;
        Tue, 03 Dec 2024 23:43:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733298186; cv=pass;
        d=google.com; s=arc-20240605;
        b=PO8PvHIGCAtBK2R15MbVaBXPy4+SKrNJmrWRQCw+1kDebhN1gZEUm0Ksd3YuACA+5K
         TdStwI1+CTKmdBH5FR5Nw9QDkyexKpVPwRH7fRzPCd/9/PkojFNXXJ29sYTXBNxpE8Ua
         M0nsJEdEX3F7aajJudkrteku1jVoBnRVvitjS7MXrsM3j24oSsQfDkRM0SOg9uw6jbiO
         MLyOm9dOezklEm/yYXLXwJfRYqwQmtQVBkipp1ITn8W7IrmkMNGeFDguvDNmuxDxdsS1
         9JJcTK8TFZwlhk4Eg0XJR8Q+LeBYZwDlknlimHlRyEaBN3qsBIECtFNnZ1tJVOH+DnBg
         oMyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=lR3fVOY3g4ehb77yW3uS7yXNPGV/+fMXvzpHnEiTBAI=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=W6I4isjHnRmAuqOm4Y1tuHdUjqiv+OLEnVSOHwI4Mo5BCOmMc+iGTedz6Xp8bHm7z2
         XVFGjyHaD4e1rRuVU65W+kcC/8xfiAXa6o4R5TYrnH/gy8+/DVxd5dGEtFxOE8iK8zKZ
         K0BHj3/huuEpFE4J0/qO8Qy5pgPPil+MHk6Hr5IpuKSphri4ieCFQMh1ImAEGeNYQnw1
         a5WYpX+6qUvdH9pBbTto2LZOtW5O2KVeYLuugx0HCogNv+7fjQ03nRwMO9hiqazBZ+T6
         N+msU6d/2SLZJm21ar0AKT+Cm/sI3TXivGxDIc401iP7lKaCh9KEj2qjUqx2Itz2pli1
         I0rQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fbponakC;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430668-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430668-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-430668-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7fc9c36046fsi15693759a12.578.2024.12.03.23.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 23:43:06 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-430668-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fbponakC;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430668-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430668-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D404B287E4
	for <alex.bennee@linaro.org>; Wed,  4 Dec 2024 07:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A44219007F;
	Wed,  4 Dec 2024 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbponakC"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2018E743
	for <linux-kernel@vger.kernel.org>; Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298153; cv=none; b=Lrnwd45mP54aLjrYRfC6998hth1RW8P4Efjvj7wwaaYd4sd6WsjYoJIffZTvz7WLZK3wUiwu/J8VctPCaZ2MyU4URH0Wj13IcZrF1BIkYTyUaOBxO+fZvBB1EF8M2JNSfSgPZEJ6e6nvBAof2bH1NfW1rk+pdbB1JK4JGYvN6rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298153; c=relaxed/simple;
	bh=XnsenWzyXY6TfpyfSZrWfMTz6cEF8BKuThN2HBT4U7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7fvZkX6gs0ZlIP3wFdyATY/XnMmuGuCe2Un8LI5DaxDty22WeThxM7HMCeBmK+5WtLokW1XLsz+Mp9nJXHEPFXdstj+fZBrDKrhmgKl9K6w8zTb5CgrE4omESBTr6fxEArV2xKHyHHWte1ZoKWkQKRMjZacnK1ZGTVWKMC3PXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbponakC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CB6C4CEE1;
	Wed,  4 Dec 2024 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298153;
	bh=XnsenWzyXY6TfpyfSZrWfMTz6cEF8BKuThN2HBT4U7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fbponakCBVFyAC3ys2tT9X+vSjKWU3lRx65Bqo04Q/Yg5hHgF3pfoTTUXduqlG2KK
	 8Zh9/IdLlSGIUxVneyu0JVd8woI60mTcC7mb9kzc8tcGUbLX7jYbNYCXnWxfB/wwLk
	 M801AxREsZQ7YkDZYEMmdfdVEgJHUVFyIdhhL33VA8/NGcDwLSRvLZqsogK6C2yRcj
	 N7wNU759O4zs9PQahG0jguKxwTtGrA7/9iqQF3Kev+YzO97H1GO2Tx3DMAbM5MUy4Y
	 CFZrGd5exX3VCgQ1T4jIGVFghgCm0WZquwsxjC2DoiGvy+amY5m212lnLJ5HqYkF8S
	 bWc7stJga3EkQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIk1m-00000004Kii-40jz;
	Wed, 04 Dec 2024 08:42:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 01/16] acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
Date: Wed,  4 Dec 2024 08:41:09 +0100
Message-ID: <4818bdd98597822033a10c15fcca6d736db93bf2.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 19VH+dzj0Blb

This is just duplicating ACPI_GHES_ERROR_SOURCE_COUNT, which
has a better name. So, drop the duplication.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 7 ++-----
 include/hw/acpi/ghes.h | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e9511d9b8f71..dc217694deb9 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -34,9 +34,6 @@
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
 
-/* Now only support ARMv8 SEA notification type error source */
-#define ACPI_GHES_ERROR_SOURCE_COUNT        1
-
 /* Generic Hardware Error Source version 2 */
 #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
 
@@ -396,7 +393,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
-    assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
+    assert(source_id < ACPI_GHES_ERROR_SOURCE_COUNT);
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
@@ -407,7 +404,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 
     if (physical_address) {
 
-        if (source_id < ACPI_HEST_SRC_ID_RESERVED) {
+        if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
             start_addr += source_id * sizeof(uint64_t);
         }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e905..59e3b8fb24b9 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -59,7 +59,8 @@ enum AcpiGhesNotifyType {
 enum {
     ACPI_HEST_SRC_ID_SEA = 0,
     /* future ids go here */
-    ACPI_HEST_SRC_ID_RESERVED,
+
+    ACPI_GHES_ERROR_SOURCE_COUNT
 };
 
 typedef struct AcpiGhesState {
-- 
2.47.1

