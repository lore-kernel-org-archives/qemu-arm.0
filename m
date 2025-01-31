Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp587229njb;
        Fri, 31 Jan 2025 09:44:37 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXi8PefOXfWcCcRSsNuIsxgm9bhA1PT+SAv5sxn+cniW31FnVfG8xQcVvjABfh79JXWve28a8MW9rJy8w==@linaro.org
X-Google-Smtp-Source: AGHT+IELAl0VGWd6WNj9hN4DRS+MYIZ2mPiLoWVMYeRA/5QmhyvfkKrmxVjpzXwQAvkDia+cHIxV
X-Received: by 2002:a05:6a21:108a:b0:1e1:e2d9:7f0a with SMTP id adf61e73a8af0-1ed7a5da35amr20677995637.34.1738345476878;
        Fri, 31 Jan 2025 09:44:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738345476; cv=pass;
        d=google.com; s=arc-20240605;
        b=XHAkjOjsSJSfXg/53XT4WMHMUSKmLx3f6a9AD45gGoxZipz7kKNBA60tNrmVIVZqUu
         rk2lRkP/NE0nkqsifebh7oNOeMMKZ3RM1k1/dmKtZQQGOktaG16TgQiSn8oHSyWha6hp
         +YkgGKTKl+UlYB+btwOFtg3b/jYrxDfzMqSoiKToJnmdzGDAevry0HQIu/lAK+RskYA2
         xldRMmZdW7c88TsZIXvbUCZ96c9UKvK9HOaH9ixojhgj685QdAf5cLhkQWMwgsVgOeDx
         lWr8V3As9HvDaBaBc1keQb3gsKz6q8A4WMyj4MQV1lW/ySdm5/SGYBq/RC+kWCqYzIFv
         XCRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=suKDqr8iP2bfgTwKgM43SphGAz8Hd6m/7/O6Vx6n7PU=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=XldQj+CFqdzNkxQn4Fgq12hoLytS+1jr1pB/YL94oL5w1aKo9JJM7q8gbiwBy3dELS
         hJbOdchVeTSAAmImM8qa321IH9n+wdO7gmx61ZigbpYRk5kFJCppiuYwkoNuZwqjvG9+
         m3HpXX92+ZHXW4/cVSV3DsA/w8YK9rHYWu8Z5pNNg0KnPsd2kZ5I1oeHfzCoY4CretzD
         CihTx+QYzyqaj2NrYzraLLBlmlVlgUePhnQ42ZKlijPxX508cMi98k8mnNtBIr3yGoZk
         tOcJc7zeof+4m9za5enc4HaSPKq6blHalIQlhvofmo/jy0m5XsSshoUYhcaemJE8dOSE
         8z4A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Spx69XqQ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-494843-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-494843-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-494843-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-acebdfa9bb4si4817059a12.79.2025.01.31.09.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-494843-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Spx69XqQ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-494843-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-494843-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 899087A1AE7
	for <alex.bennee@linaro.org>; Fri, 31 Jan 2025 17:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDA11F37DA;
	Fri, 31 Jan 2025 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Spx69XqQ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B2A1F0E47
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345390; cv=none; b=LG7FuXi7es7PT2C/63XactDC8VMW1p7VQUQJMRHZ5iWT+tsxSifiRIk5w92X6vXD7psvuiAXO03fPSGS6UPb0Jzc12xG2UtO3ogw1veNhc0SkZEB7p8MotmTcpQhuAEX5CT5Uzn1c41zSo9dvFxp0hxzufPUYUp4ZevmyhqOI/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345390; c=relaxed/simple;
	bh=WNgUSU0OrqFnvTXh8PzzTv6ghTQeysRMH1deXYrrJ9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3RqMe8N0A0wgzO1GM2MYsLj6vHu0b3CtRpGvgsGl+HGUL05wWoptWu83parqfjMviOIZ1bzLGg9vNHe1GEcIy971WB1/bW3pvrD65Ns7LxK0s6jL22J6tBucuCsQbN7TgoLrV1DsIA2BlAajuQngflSXZFaXNFY9TKxMQ54I/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Spx69XqQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE596C4CEE8;
	Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738345389;
	bh=WNgUSU0OrqFnvTXh8PzzTv6ghTQeysRMH1deXYrrJ9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Spx69XqQizVLVmwApF1eSxyG63bboUW1ztPnoS4M4nMXxmiNVUqZlQQLYNrPU6u//
	 I7/0rp0NsWGx/6CKbVlr4VJH8Z1jgg5iGuXYjIZudHGorpfQj6Zmvjgzai/Zxm7usI
	 aqW9Y6xf1XC0gfD8Pg2ptyZ+4MSZsuqRpTyLpqpwujiV5b8nsvCuUm7Y+kN0koxK1y
	 81lqCiaf391o8u8325I7EmWdU6l0nIYmTwon9k1OaF2g1abSnIdQ3lIorkGWdyDUz1
	 NG2mSKDDd6KVXLrtwPoCtlto3zQ/cdoR49hcyB+8sJBGbLu0Uw4cF3XH3U46w/+Vx8
	 4hmGCrJ/zmMgQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdv2p-00000006ggu-0QKV;
	Fri, 31 Jan 2025 18:43:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/14] acpi/generic_event_device: Update GHES migration to cover hest addr
Date: Fri, 31 Jan 2025 18:42:45 +0100
Message-ID: <eb8225c95f83778c2150774e5d97bd3e12ee858c.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: Pq1vGOJXBhpf

The GHES migration logic should now support HEST table location too.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index c85d97ca3776..5346cae573b7 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -386,6 +386,34 @@ static const VMStateDescription vmstate_ghes_state = {
     }
 };
 
+static const VMStateDescription vmstate_hest = {
+    .name = "acpi-hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT64(hest_addr_le, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static bool hest_needed(void *opaque)
+{
+    AcpiGedState *s = opaque;
+    return s->ghes_state.hest_addr_le;
+}
+
+static const VMStateDescription vmstate_hest_state = {
+    .name = "acpi-ged/hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = hest_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
+                       vmstate_hest, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_acpi_ged = {
     .name = "acpi-ged",
     .version_id = 1,
@@ -398,6 +426,7 @@ static const VMStateDescription vmstate_acpi_ged = {
         &vmstate_memhp_state,
         &vmstate_cpuhp_state,
         &vmstate_ghes_state,
+        &vmstate_hest_state,
         NULL
     }
 };
-- 
2.48.1

