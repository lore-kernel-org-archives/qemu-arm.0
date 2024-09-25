Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp94209njb;
        Tue, 24 Sep 2024 21:05:02 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVTO9F58aYH5UCKI7DxBL+bUnj/icbS0O6RzphtKkSdF0Lb4xSZCQ/najfpbqBxje4jjkHcWqmpnwZ7MA==@linaro.org
X-Google-Smtp-Source: AGHT+IFT2UIfUDG60NSY1EevlFrbR0CQ19ZXKDXr6BbWOKvcrFvnOcfotR0HUpRYT/mrd3uH7Ni7
X-Received: by 2002:a05:6a00:1496:b0:714:17b5:c1d9 with SMTP id d2e1a72fcca58-71b0aaa2289mr1778985b3a.1.1727237101946;
        Tue, 24 Sep 2024 21:05:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727237101; cv=pass;
        d=google.com; s=arc-20240605;
        b=ama7RaJc+jf5laWObAB46MQvNPmX9KJGr20lsz/a0O1AqDJZcBWe4/Dx1pS4bzZi+g
         Hdrwohf4yqDn1ZjF4u9uoqiT4z3G376DEfDGqr5hv5AZjYUpFeziuGWkdogp22MHng2l
         GuOywzyTnDG3JJdTyHCyUP8OcrmHdbSSQzK6Rvx8UnVZxBttaeeYDY8FEimBXXsR6X6Q
         dKZP/3/72G1k0pFiPwDPi8Hdft5RT78nfuylmyE4YiK6BlK/wXpvFyPX4Kh0wE03BeoP
         3Fz55tKYevx17zTiztM9iAH7LH2FWh0XEtOnMOl3nRThEOM6ETH3aBCFdrMCQuiLUBa+
         v3Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=S4XoH8xn4bAaUp/Ki0ieR14Cc7IwW6exj91gHepQH1E=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=Sm2sTKvi9HlbY1YZZj3osP6ghy1/HyHtGApgNGCwmEFsMVHdxDMtRlTnE0aK1YDEum
         izuHAtEZq//+lSfMP3fZRvZAl3rbmRdj5rBHLUGrYD2BtIGcgeDYzSL3xBjDyFLLPrRO
         249px3CrLME8xRPvxOZRlQrcn4tL8GZxVBohKE9dXapn5wx4Ruo5h1deJJurO/pfPou/
         +xP0HaK0oEq8h+t5bjQ/MXqf3kf3dJi6lWd0VumKuXslBuDLrNClslPJwSm4IRAVZvGj
         aJWXZ+rSaVwlW4zxp194PnsKn+THuGd34ycky/9qWPyZlNu2lRrz2bt5bozmzpOMx6bt
         UYlw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uUxAnzOH;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337978-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337978-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-337978-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-71afc9c530csi2975005b3a.291.2024.09.24.21.05.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:05:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-337978-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uUxAnzOH;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337978-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337978-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F16F2846BC
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2024 04:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A0F14EC5D;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUxAnzOH"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8994214C5BE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727237088; cv=none; b=rDljM9myG5Qa8LOuP/28BrD0CXcJy/Dxpn1LmDtgjF/FEPywB9UZ8ZH8/tx7UhdFKzqXwss/7w4maEa6vLiDZ3glTbuU/8/0xGje38Z8jUT+guZ64QIAX55bxITtIMTU6XhTij7NRVCznyScOwkLWbuhLOy/T6bjzzht+kxYi50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727237088; c=relaxed/simple;
	bh=QmS5SCan71KvTfp2vhqpTHrvyu5BMSTHUv6oVhJLzV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0NpzVLx1Whtc7nRjkuMrSeBZR79Cyf+92xiD3g2lHht+aFYsv99qHwmyeapfOKBLXbyGPmMa5LE3EZEuCMkeRGNkLCHYnxk20Itk8Ziid4flpugH0EvBwpPpm8E94FkVnIyI+RYhz6twIvKI8lT1PSLPb0RxzJDg7IaMetTcG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUxAnzOH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC31C4AF0E;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727237088;
	bh=QmS5SCan71KvTfp2vhqpTHrvyu5BMSTHUv6oVhJLzV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uUxAnzOHABHSGnDX6tOPQMc0Hi0jOdgKacLuW5IrB/HfdmwejkLT3mf/+1mhemzpc
	 5PrI3ofM7saJ5jIIuVh8QXZi6fWyXCe2sXJyLZHboiXH+Pwomo1Ri5rLt4dOHNdmQa
	 PkUkjNDg3Z6YYiC1lFRHZybNX0dMxpHK6I+kmVuWKMiuXgjiehwUoaml1YghoyN/Lu
	 FuwLAtiFfCzr9kDPTUB/+bL4Gr5mFCaek1oRUZRdkklK1CNoZfJ1aj8zE79060O3P8
	 zyVVayZrbRoQtzqOemnlSsfADG0JiVbSg8YG+hD23DC/ZbHQm/Fm2R22S+lfOSOo7d
	 VbzxdRSnIENJQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1stJGg-0000000827t-0efp;
	Wed, 25 Sep 2024 06:04:46 +0200
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
Subject: [PATCH 04/15] acpi/ghes: better handle source_id and notification
Date: Wed, 25 Sep 2024 06:04:09 +0200
Message-ID: <a3b54a74158fdff44e600cf0949a430891c8cb22.1727236561.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: rhSifmOIltWe

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
index 7b42ed59cd15..7460cd1a8d56 100644
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
2.46.1

