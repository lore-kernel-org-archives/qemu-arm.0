Received: by 2002:a05:7022:4195:b0:8a:132c:44a7 with SMTP id i21csp213595dli;
        Fri, 13 Sep 2024 23:14:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4CTe56gwidvG62LHTjNVprPmvQVmbI24UjaIN/xfNJT1QbBR+LviB1FYbHnIxXFLPGIg+lCdCjobFZw==@linaro.org
X-Google-Smtp-Source: AGHT+IFrgWlXJGcdcSf//YsmFk0iE9S1xFwWjx0Fj79AqEQvJwJetiQ4CTwW3JOp4yQGatnd5iu0
X-Received: by 2002:a05:620a:450c:b0:7a9:c298:60d1 with SMTP id af79cd13be357-7a9e5f1a8b3mr1304403985a.38.1726294475196;
        Fri, 13 Sep 2024 23:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726294475; cv=none;
        d=google.com; s=arc-20240605;
        b=I1fikbEObMJn1s/tqgag60kA5XuWTx7Bla/wUNskMN5LHL0UxKyypflFxisgkPJNg+
         /iWhgp1c3qBNB/57F6ODAT3uW4Wi1EgNZ/33qWCB+BOHK9zyGRrfiTw6DqMKBZMqOS/P
         rzkabeja9ZQJwr02WK7hB1S4AlfEzYfXuwznV3jvEYlMpJbXn6X2IIrFXnNbMzc7LBT0
         uL3bwu61bIZHlnXQUtYcV78FmE42oU2RSPBiVvdnZub6FGKlMujYekhYrkeZilaxkr1z
         AGugKDDg30dXCP8CKTP95FcIHSRuqRmNUxPtR681gly4aytFm2vHWOHz5C6egoXbnDVV
         eXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cRL4Ve61e9gL+jjKm402W9aFH65VlOQQ6fp/51vDDtQ=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=XQfkxVa4AWJW0FOccXd1EnjF7UiFrYTYrgruUCghK3SkLd6oPGJynoUM21ph4QCe1F
         upjTAgAOyBMVEOTK7bCo9/jBpf3Omt9dvb76ai740a1lDGYYpYcUW3x9kJfSLmgNYufL
         gmKq6U6EPEIjyx1Xaez4HGid1S1k6ftovL/m+YnKM8Yb0bkt/xS2E9SD85cx2PmuHvWf
         6vym1HUkh74ElVJIRo+L4wXPVCpzD2xByE8vs5zi2brAWfB9IH1Nhc08a7gssEE42Shw
         Wi6sKTQwQeryDNliCYfiRw2oOcq3LEU9B3+NiLyKKtXuD+xmKrkdNQl0SXPwLZjYJfIk
         bgwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BMTUIHJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ab3eb6812asi89160985a.527.2024.09.13.23.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 23:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BMTUIHJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1spM2k-0008GB-4P; Sat, 14 Sep 2024 02:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1spM2g-00082m-OR; Sat, 14 Sep 2024 02:13:58 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1spM2e-0000uy-13; Sat, 14 Sep 2024 02:13:58 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D73615C0ECF;
 Sat, 14 Sep 2024 06:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA61C4CECF;
 Sat, 14 Sep 2024 06:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726294434;
 bh=QUwnR0qt9mhnTqM0ejoB3gKN2VsxQtNNBhVCOZbpRyk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BMTUIHJYVk6LKHIaKvXPX7oPahpdUSP4VfzRki/XjZl65IyeWCnnBDnapSP1NKOYX
 5whML3qjF9LC2T4EjCEDwlTCSNlsKi8cDcSAfTRALOcITHwTVOEm47dQ0owHeip2Qo
 xQHCHZEXVE4Vs887VShijExbmUZDm7IoLkQDnmGgzWoHpBQWh05PuKLPXnQDAnVTFH
 /Xeq2BY+DL98A6eyJfVJG74PmKMxFIpMoVj3oTgpCUvymdUZsiy2QQqbYHuMttH7kl
 GWR5FnHzcEN3Rz4eYGU85eWbUW/kEqZ5UF5s/r3PYhoxWIBeF8VTkSDIBPpUT4kH/r
 6oXn82vq/c6bQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1spM2a-00000003V5Z-03pL; Sat, 14 Sep 2024 08:13:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v10 03/21] acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
Date: Sat, 14 Sep 2024 08:13:24 +0200
Message-ID: <eb07ac97c57f4fbab413eba8a47150037b5a7684.1726293808.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726293808.git.mchehab+huawei@kernel.org>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.147,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7ghWYNHAcHt1

This is just duplicating ACPI_GHES_ERROR_SOURCE_COUNT, which
has a better name. So, drop the duplication.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 7 ++-----
 include/hw/acpi/ghes.h | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 529c14e3289f..35f793401d06 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -35,9 +35,6 @@
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
 
-/* Now only support ARMv8 SEA notification type error source */
-#define ACPI_GHES_ERROR_SOURCE_COUNT        1
-
 /* Generic Hardware Error Source version 2 */
 #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
 
@@ -411,7 +408,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
-    assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
+    assert(source_id < ACPI_GHES_ERROR_SOURCE_COUNT);
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
@@ -422,7 +419,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 
     if (physical_address) {
 
-        if (source_id < ACPI_HEST_SRC_ID_RESERVED) {
+        if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
             start_addr += source_id * sizeof(uint64_t);
         }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 28b956acb19a..5421ffcbb7fa 100644
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
2.46.0

