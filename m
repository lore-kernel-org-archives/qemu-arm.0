Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2404848njm;
        Fri, 7 Mar 2025 11:15:09 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXIJqr/tRA0mtaC2TSXK0KiytPg4k6CFpnv8D3xlNAqClh1p7Y9CVkCzraiHwOIqT9kBREva/JrbBlB4w==@linaro.org
X-Google-Smtp-Source: AGHT+IGSVtpTCasQ58EYv9G4kiVFdoBj/iioJpYjIORpjFKDnKXmFDAAGH2glgScV8WuMKRLAWDD
X-Received: by 2002:a17:907:3f09:b0:abf:5aea:a584 with SMTP id a640c23a62f3a-ac252ba158amr566482966b.38.1741374908775;
        Fri, 07 Mar 2025 11:15:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1741374908; cv=pass;
        d=google.com; s=arc-20240605;
        b=Rrq5e0ViqSAcvAyS/3KG/POyryc4oS//NGDdVyYnCGirgxH6U9xYNmUoZzuqj4vNqB
         gfG6Y8HQfsTY9CK64CeIcv916VZZqCI983tc/Bwj+yylUJZioYlqhIxHHocYABX0wPBM
         G2/KvPxnQg9I1AEp4Dg1KFuvAEi1Q1qcWXR3b8991cuRIOHyBtsnlrnUyQuoNIhBq6uc
         V0QgE9DwIzwEH0cPwv+ubdZ30k61ol21P1famfD3cDHFJruTZJar2Ep6HXsqs8AvCoZP
         0ju5fPn2zIW4eA0zRXvDzDyiJHEDXDoHV4LfDgToCGj6qBr96j/93yGaOC7lk35OteM/
         05Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=iiAlQo8jSE4dH8zc3hOBJJNAvYRgsBFmZCcF2Euq7oY=;
        fh=+vpXYSEWrSgNP4dQgjYlDxda2LzEZLVGb5zrnFynz/M=;
        b=ZmASGlrCMZRwkpTZCPr/K9Sqq345/3N+sh3LdR6Zd9+M/8qZ8Mal/fp0w/7cAHDpqg
         4Jd7CEIXKXJ6O0zoHEt3vLe/WlgMRMtGSyjLJpqYcv9eU+zo5DB8eD0ndtO8o91AOiMy
         41GwY0QuDERKNSTBCUfn5xuyV60MbrdLKvXAcJTSoo+M7V1UazKjDjbTtcUidBAEqWwL
         pKmvRkG0mYjjuQ21gWJmDLYDp6Ym7NSx7EgydDCk9rPVy98E9vwa2pVNdtg9/WDRxBNT
         Syf3GNi/lQpaYC9nSx0uWJBYcDVVwKMMXKZ/xuRtBsovj11befmOQws43iF79EY/me8M
         RI6w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="cbt/xoxZ";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-551807-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-551807-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-551807-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-ac2396eef25si370734666b.417.2025.03.07.11.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 11:15:08 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-551807-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="cbt/xoxZ";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-551807-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-551807-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 335BE1894824
	for <alex.bennee@linaro.org>; Fri,  7 Mar 2025 19:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9DC2512C0;
	Fri,  7 Mar 2025 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbt/xoxZ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C9F2505C4
	for <linux-kernel@vger.kernel.org>; Fri,  7 Mar 2025 19:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741374898; cv=none; b=CXgqo+4Q+9BG4GH6NlfkCNO+/9ZFoQTV6pobseRlvv2o70nYl41o3B8ajep3M7B6u38lP8tDX8IloUjK6fDIc4lVEpOWBGmmA2UwWm+u9beI9o238AfUoY2XrERhuqIm5YgMrcZq9u4ZYDiS941U0kL77yvjN3uGlf2d2wQDGBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741374898; c=relaxed/simple;
	bh=LvlI96l+YbIl5MsIJDnbtQxU7YniO+B5OBQkHO2lJqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOslX2h2Nx5x53aNnPywdUA5rFSjqciAhoEdHPmvpaeq+MzDg3otVjUp126ynSHgr4bpnBtOh7oalqrbVRvpVEUHBq0VCR4+kjK809WhDPzagbBzfIncm4hh6u85mdZd589m1FHPtwYY+AixkMpefvYHQdPB8WWBdaCjKbg6r1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbt/xoxZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84B6C4CEEA;
	Fri,  7 Mar 2025 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741374897;
	bh=LvlI96l+YbIl5MsIJDnbtQxU7YniO+B5OBQkHO2lJqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cbt/xoxZQCzmWvuaKadzoWUZ6b+stlN+VllunKJ3ScaANDLd5HZLleyJbaRLUZ9X5
	 8f2zTWtjEAa5stb15RzSVU+88KHcGy4J4+Zoy+J15xLWnX9TO7/v7G4Nn0oqx6ANzB
	 g5CAvn14JzHSInSCXz/pusb34wVqTzDC+NTVJxmquCE8w4R5e31roNqjZUFEyPbyC6
	 +4epYM0QPNnG4FUVJsHUHOCgpkhsrV78t67nDWj7wJ4CpkFKkL1DmdS/t9wsRFsOnK
	 gCYIOzxQdp/JRcGz7mtJDbiisky1Z3ZiWjghdE1AC1ptwVYXu0QJTjgVwjz0Pvg2q4
	 n86V6m4fDC4vw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tqd9r-0000000BQmv-3kKe;
	Fri, 07 Mar 2025 20:14:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Gavin Shan" <gshan@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 10/20] acpi/ghes: add a notifier to notify when error data is ready
Date: Fri,  7 Mar 2025 20:14:39 +0100
Message-ID: <af2bb6dd484aca8fd8baf29200cf2a04e365befe.1741374594.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1741374594.git.mchehab+huawei@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 4yGx2wcJRFDz

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c         | 5 ++++-
 include/hw/acpi/ghes.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index f49d0d628fc4..0135ac844bcf 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -510,6 +510,9 @@ static void get_ghes_source_offsets(uint16_t source_id,
     *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
+
 void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -550,7 +553,7 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
 
-    return;
+    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
 }
 
 int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 8c4b08433760..390943e46d99 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -24,6 +24,9 @@
 
 #include "hw/acpi/bios-linker-loader.h"
 #include "qapi/error.h"
+#include "qemu/notify.h"
+
+extern NotifierList acpi_generic_error_notifiers;
 
 /*
  * Values for Hardware Error Notification Type field
-- 
2.48.1

