Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp1686359dlj;
        Mon, 13 Jan 2025 05:09:05 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCU0Ho1B6kapLiKIi4sxjBssGr/JTZjuDGN9YJUBLIlHmSNHYuS9l4pw3XJ7rF8WALQDYAC+e0kI4kWt3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHQ/CQtsMiGUrq5UqbK3BAAutCjOyJcq1MNMusT9NRyP3XGpoeaS5DVioUi4juNqgEFLuAW
X-Received: by 2002:a17:907:2cc5:b0:aaf:c326:f2d8 with SMTP id a640c23a62f3a-ab2abdc0257mr2152782366b.57.1736773745024;
        Mon, 13 Jan 2025 05:09:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736773745; cv=pass;
        d=google.com; s=arc-20240605;
        b=bdYyvyRHz98/oHDrGsQpE38Ln+g/m7GOdm2uIKv15LOF5YfzZgW90xNoG/72GpS3KO
         A11nQYKGTq7/Kyv+X0LVAq6MJ7PGJtfsGu1v5kyroUCpaCnSN4wPtZo/MQaT3vaKXXHX
         LXcyCSbbQtXrW8/uwRxmFVN+6eyAbH3vrbKKH9joFU9Nq+z4roWBSRPBrTKFpP9Xm3hr
         w4m8GlyfJlZYOzcQ4L3gfHXvtcWbmmuSZke9FIA5wavdBwTqdjPAz49P+vAnk98Ef9qi
         XO57/xCaZv/2i7cbTmU5NASGKEQXar+7fQ55DE2si0+Mn0Lvzpl0WxNVmwo6crJfsy2A
         Qb5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=U7kU+tNqtJR7D/73BiXkUHyXCE1UFS/EBV7RoVPbz24=;
        fh=8WKMlvHBit1egi9o2cK+ScoX/Z5fO36J0VVxubWVY0Q=;
        b=NIckvxdZM3Ym0QghAF+nYiflq4Sfar0Ewh0iDylk4Jx8e5Hv/P1l38464WBXlK92WN
         iE1HCfk8/bNFfYSvaKoGKGPvBCQyTbKh+jwbc8jaWej1sGmxPu/FQ3mdPJWDc2ktfGt1
         KdTo2qdcEV3dB+OqHC0sT+J8l/BlZjplWrrjaspE8yxabcikw6kESlfR7zSGzGO/Oy8K
         a5MHNwhAArgxiY2QHrGxddlGzu58H5j69QOtaejf8cM3D6XHhMEF/IApWL0dN/uCAwPA
         A3c3Vbx9Y8uOE5jM343uIXVbNAjN6qHv2AFlc1bBeJNyGxG1sp2xc/I2m2AY5jZXbpF4
         oKpg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=h3GjqS7W;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474008-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474008-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-474008-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab2cfbebba1si585656166b.422.2025.01.13.05.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:09:05 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-474008-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=h3GjqS7W;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474008-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474008-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF4051886388
	for <alex.bennee@linaro.org>; Mon, 13 Jan 2025 13:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646EA233D92;
	Mon, 13 Jan 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3GjqS7W"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F74D22A4D2
	for <linux-kernel@vger.kernel.org>; Mon, 13 Jan 2025 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736773739; cv=none; b=b2HTg2GJ662BqI8ZcrRUKsrMah0uTgjZv0Jdim6bVnv4xIF34ygVghy0Na1drB/848JRK1d0f6ftw7KNVXcr6vNszMPPa4SThiLpdewCXURi0EHVa4Zh+kiwMuJ5ZFEUQp7Oxy5kufVBDMyYio7dY4Cz5d2d2dbGETgc5i4GiuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736773739; c=relaxed/simple;
	bh=GgETsGrAdEp9quugVeJqfW0eXtpodBaT9e9TG7kSTvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3vXxU6S5j5w20XFv2SXeEIC8mtqnx7ONoCuSrUcrfUx/sTKU6+aW74Jcav752SOW05qBlgc8Q3dthQ84yivUwDUNp1wPKR/4GauZrWWoGC7EO4+RS76q7tTPkg0CNsEzu4vIVI/dm3GAfBInCNp+nWWtNOjqeGrdKyShdNpzeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3GjqS7W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA734C4AF0B;
	Mon, 13 Jan 2025 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736773738;
	bh=GgETsGrAdEp9quugVeJqfW0eXtpodBaT9e9TG7kSTvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h3GjqS7WRMnpAt1UlZ8kDGv4p1RWvhn7OmyruPcf4E5Df8/1vBoXUyZmXXdkuDjk0
	 IBGr4nkDn8bw+gokvFAr8rbM2bhjGL75T61SaEQAhx/18rnhT70lvX3V8/G/I4EqPS
	 wuiUgkcUmuTS2M4hcSHu6CGLJ78oD0QGiZPCF9qtRzfWpDaYy0lIB1wq4nGkSSmr8y
	 TFPTF7ngh7NoCWUjj9/Xeg3bPZiHLEyOb/lrvsF9Ha4pEeKspR1YhgjG+eEQJYUuKW
	 zwiUFijLdqqR2DafDfFMrcEofwd2NolV+pVCGDp399m32EkNHFfUpbHkQzD2SQGpwy
	 dfpmFKK95FoCQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tXKBc-00000003Yn5-3dM1;
	Mon, 13 Jan 2025 14:08:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 4/5] acpi/generic_event_device: Update GHES migration to cover hest addr
Date: Mon, 13 Jan 2025 14:08:50 +0100
Message-ID: <20250113130854.848688-5-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113130854.848688-1-mchehab+huawei@kernel.org>
References: <20250113130854.848688-1-mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: paTGyKbtyy5R

The GHES migration logic at GED should now support HEST table
location too.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
2.47.1

