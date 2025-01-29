Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3616767njk;
        Wed, 29 Jan 2025 00:04:35 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVzmlQxEkSy+KLucD3gDD2BikQKzLzZo5i1Bv+hW47ihdVfnYCpG7oqTA+X6AYxEvre4KXk/TiW5/DG+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEuqk75ul/zGZZN0xjzUJL6dBSonR1VG49Rg3/cJz73P9zYedHC473/MByohqorE8mmBN7a
X-Received: by 2002:a05:6402:3511:b0:5db:69ee:9149 with SMTP id 4fb4d7f45d1cf-5dc5efbd255mr2145975a12.11.1738137875198;
        Wed, 29 Jan 2025 00:04:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738137875; cv=pass;
        d=google.com; s=arc-20240605;
        b=UhxVXnRvmtnuQkAGBd1/Zr2RxQML8KoYn+QJyzs8U4ndFRqmeOSKjRL+TeJp5KghLI
         iIKC1XA63Ob6wXJ/GdiKreasDgpuTRh8pGmdZRs0GsWAxgQEui2GeAHi2t+HidJ+zIN3
         dSL4wTDE6rAEAalh71HOrnZNcYJWEDuY9iYkxAjkAp2rnNCQk0kh3/w1EoQQFp12hw0o
         NL3+9ZCcEPiRMNeURtve7VHU2vHkx/M3yZro4DlNuSX/vYVj1tMqTQ4o3poijc85lRRC
         eHPyxLmXs+6ISBP275I6dQPwf+9Xf47a/rO51PvR/4Fw99fKmC+CAJNBkXBqqLfsnhJM
         VV3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=fFYF0ANTiEaHMFj1bLbJ6/Xrqvw10jp275wZ5vU8paY=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=EnGIezV5mlYoLIm4ASYW9Tgqp8Unwb9gzDVsVZX6M1ROg2IObjPXU8tn3OBK25AVy5
         EUxJ7rXh8ufgIWIgfi9DDn9ano7NrQtn2PiTbp3Sqa9QDw/qswR6wmKNQ4yZnRqy5+AE
         3y/AvCYIvfh5fSo7Gi2rL0M05RVJ4X1GTG/vIp145IFwKLE1N8Cxk8NH8chbDAg3xYqr
         wzgsRnIHN2B/KHqZtKlQmZJNbk1Td82tOFcjK31LwbVaLKbnv8e3KLN2Kzj4u7zegExP
         lDInkbilz8jvyBK33gYAAL/RyRyzZjfhDHhK7I8l8I7ouTXByU+WI5lxRkXliseRDGPw
         NkIg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Y4ErFJBr;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492174-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492174-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-492174-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5dc186df4f6si8666269a12.575.2025.01.29.00.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:04:35 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492174-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Y4ErFJBr;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492174-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492174-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AFC11888D34
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 08:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6C4199EA2;
	Wed, 29 Jan 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4ErFJBr"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38879194096
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137867; cv=none; b=pt74C6Dof91q2okNPRZvbmV2THAdu7hBA7Ate0JFiFkIdV0LPnS65dWeS+rAcZKLwB4QjXDNxqNkhvwiP61QPxHLJ32gF513C745eZ8TuNGwhZdiJpeG6jSGGaT7nNVwCcDu5AqDyhotT89kIWmEfpVTX5oNixFhgGeUogW4czs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137867; c=relaxed/simple;
	bh=NN2Bgw7l5lIuCBxYycBtlA5qPjOMNtZlQhvzHQooPlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gUxjX4bFaM44pnX28zs2rEuv1WOY1al3BBK5gCVrETj7SEtDV3UGGeczTT8g40syq836VhNuW9hPpD91JdaLA3+xzIaUOZc14caW9QbrBi8AqDIV5aNLHDFPATPc+5d+wqZKQcrroK14itZIcrD+DVswEJSEuy6TA2QNzsjkG+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4ErFJBr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C2DC4CEE8;
	Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738137866;
	bh=NN2Bgw7l5lIuCBxYycBtlA5qPjOMNtZlQhvzHQooPlg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y4ErFJBriF+fRVUbiWRTLQ7zCTehdmtC1K5CErFe9eR5wG6h0yy8WakkSalUB6kK4
	 SZjxJIJvl50MpxfOGoiIOTZQHoW7sPpJresVVyk44NuK4ZIl87WJ+8/WSGcul4rx4/
	 vguZTujz3P9F4+8qfw4mA4pxzC/+1UeDJGcPbZINO/z5bbBShtcsFkiSenyVhcrDxi
	 86i3AWxFVJDEeOfYHVfNBKH9xEwm7wEwkbshRPiRxw5OUu+I6ypJunwv4LCEN+6FQT
	 nSEWwhpGUGFf0OqYRkBNU7nEI8Theb+E6v5RW2lAlZJbXeq1fe5VVo6CS4ZFH2v5Yq
	 p+gjtr5k133QA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1td33g-00000004DPq-3Fvt;
	Wed, 29 Jan 2025 09:04:24 +0100
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
Subject: [PATCH v2 05/13] acpi/generic_event_device: Update GHES migration to cover hest addr
Date: Wed, 29 Jan 2025 09:04:11 +0100
Message-ID: <e0a95da158091e77642eaad9cdbbd7377d257980.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: /7ZjfEvozuSF

The GHES migration logic at GED should now support HEST table
location too.

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

