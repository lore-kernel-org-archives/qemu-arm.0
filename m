Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378211njb;
        Sat, 7 Dec 2024 00:56:55 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWD8zqbCifVPhKfuYKP1t56QjpM/uX3G0aEOtwQ0v2FVUnZb43luLTnfEjSBPp92VWNd/NTz3fY+IGlkA==@linaro.org
X-Google-Smtp-Source: AGHT+IE7abzqZPp3OQX8eTv7y5mgrmTUPhitRqWPin8o1YXvKwYj6gCxH1mc2wcRecbbGAr4KEzE
X-Received: by 2002:a05:6402:40d4:b0:5d3:da65:ff26 with SMTP id 4fb4d7f45d1cf-5d3da6604cemr4905451a12.31.1733561814828;
        Sat, 07 Dec 2024 00:56:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733561814; cv=pass;
        d=google.com; s=arc-20240605;
        b=aUGPxlZNNVq1ADIbg6BLRF57iUUydqmut0fp5RqKV+wKyUge1VLDJ/2Fi15g5pKLWl
         Fs6X1HrelSq8cD+AlF3g9Jx3T0+LR36mBf3BnVBisFGrWDKfIdngv7DqfjUuEwDu3sgO
         Dg0MvfMZfrggmXEqGdGVh28lVsByAAoPbc/Vyd12z0Ek4WDC8Lsm4snAd2v2ZUYgLcB2
         /+7RRr7zvH7ll/6eYfsVN3HmlAiYsWqnVsMMlESnuYPkkFuf6GwMsjh2fdzOOLa2qGFt
         m2NQ16ttz5T+wWn1woMIwFGW6o9qnsz/55wyW71wbKAzKK95Pson1pG2Opna7apVJmgF
         40fQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=gyYDlTrCXnTmceOnqwlOgM7OUAAchD1Pahq1wQ6BNK4=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=AYxDclkDr3XfI/skb3F/CRvtO8ImTpjIu96AogEWu9hHdLR4e2z/vnQts0pgejQH2d
         IuN4wwjI/WhC2Z/CGZPfSPz0aggdtBvH9WUdyqu2dycpKgbHiE/sGdk9aGi4Q7VoiFml
         mlH0LZmeDomAaeoO1a2kV4lEwpx93TeA8D1V6SlXJwkcHMJYDBDAUeTLRA55XZ81KJP+
         Zzuoz1k312ZhR1JbtXNbQXcYSyrEDd1Ur/ngZspkjR7xtjSRa4g/+gh5SN2PxuPaRmve
         Yt3/Gm7cB3PdtTgzkpFBqkfINgqJtp8jPdqn2hxUUBVM40zCh1psjTC2a4wz4axYcF10
         AP7w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=rlksTPm+;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435958-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435958-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435958-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-aa6262234a9si381999866b.965.2024.12.07.00.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 00:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435958-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=rlksTPm+;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435958-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435958-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 918401883DDF
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 08:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E51413FD86;
	Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlksTPm+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0813777E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733561805; cv=none; b=nBVsTJUizTf0TT1oTQlu1KbY9BW1wJxdRqNIhZl33eiSyowzT2N0JbD/HYxlmnFN4TrQzx8sWnECyvKxAXt8dvK86BO/Eclf+sfnvs+0cI0pbblCogps1xLmmeGQGNGmSO+4nC5JVQJ5ktRtVzYYFloO3MgK+4X1ttYWkYJvx2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733561805; c=relaxed/simple;
	bh=Zdz33+JrFuLWEYr3Q523j6TOZr8k9EjWwbpOCTAVnQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwNZo/NT5NYQlMAxJvGIozYLGXCOPIBTUlK/zLwvJjDziekAkHPCLgOe3em/VFSK7M2PQ489P4002Dya9lsARoY8BYTM8dbnfY1JAY4MFHK1W5rKyr2ru2DTCifUwQIMf48AhTUz3nWWYDG9jfMJoa2Tgv6GKuonJzN326cXyZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlksTPm+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7502C4CEDE;
	Sat,  7 Dec 2024 08:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733561804;
	bh=Zdz33+JrFuLWEYr3Q523j6TOZr8k9EjWwbpOCTAVnQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rlksTPm+xt+UY915ajlsuMXswYsjpEHyA964YJWMikstZ4u8NxMqbPRDoFy9VkMIr
	 KLoOuTXjyDFfDZqbaQ5g3/RAOPLJitC2jjEuzfa5C+CZi4AgIh+1AzY3SgzuWxA1fW
	 4SZkDwpCpS8Y7BmDu3H2Dj1u9T34aTaYc7XhD4W8M1ggGfQ7a4YtftatCGlcHwRB82
	 EyrdVcNMC57+6kTUK0bTt0DQe8lJtjg2xHH5hRBhQSZqWC7LmLSB+lLJcQQglJ8IsW
	 RGDPbzCweoCjG6SgTQzXuhMY5d1rJSLAt5HjFeWeIE9+8JLC6fnAIY7fL2YRIlWNAk
	 jqj++gprlliXA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJqcF-00000005j4k-04hd;
	Sat, 07 Dec 2024 09:56:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 04/16] acpi/ghes: better handle source_id and notification
Date: Sat,  7 Dec 2024 09:54:10 +0100
Message-ID: <266784293ac084e27f2b13a3855bf234eb96a9ba.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: W5Ub4a6+sdtd

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

