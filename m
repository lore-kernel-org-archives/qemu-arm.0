Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp865145njc;
        Wed, 22 Jan 2025 07:46:45 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVa49yJslhkyAsN3DVThkdwS9yJJVCAt3usoTg36b8yMXgaYgIQI7WEjKq7JNPyXlJf+BqwbmxyKzCeKA==@linaro.org
X-Google-Smtp-Source: AGHT+IFVPBhKGuURWvvXNghJUwk38jKo3xJkjjPu9NqKFehXWla/DxMdrTWaTOz7qcsVrx08A9zv
X-Received: by 2002:a05:6808:3196:b0:3e7:644e:3cab with SMTP id 5614622812f47-3f19fc4e6a9mr17110090b6e.7.1737560805682;
        Wed, 22 Jan 2025 07:46:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737560805; cv=pass;
        d=google.com; s=arc-20240605;
        b=Ct6uhKGYalgL4hhDy1bnjOjjbBwCmqTMuFEIwMXVkcnBfLgbNp3bgQevdLpD5PshF3
         gotxohNQ+MyLhCpbDJq2UXhxpMfOqvsFGNJFjojjii2LqY6NprSGijPdO++tazKEsyl5
         wH2Kn1h322g9/z29bMc+mz3LP7ZKpWU8BbjDX4dlRvwgJcPL17nv6NzBmukVaJ2C/N1K
         NRDhI+r8D/3uMjPdzN3B2DLIH33tyw09A0aruU4F2jR+hl8bSSLiU0Vh8jYkcYuGKaIU
         CyF42qz3BWJBaBA7RxaFzmO5krk0OX1SBf/AruAu08dbTQW8eoUCW5o4Df1ZMqgR6+Tj
         QiMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=1Xhu/tujborqG1x1xZ8Cpi4LUX0rv/79B+8vw6jViSU=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=i2HDMPPLXCJqnUSLJiiB1Hb8NNYscswdZ9+TggdCeF3mpK18TBwfHkajvB+gY6myaz
         flNFt7PBZE444ZiOG5iJf/814aOgT0F7jS2ZXhDOO4EkT8DH7mYpr3nzjNRQnoxgIIkF
         4uXSpSgQX/2GRr5VakOm34RlXwFqdgo26Ne8nUPoIjB1G1q/wTmFtlq1WQmrjuV0ul8J
         QTQkkjFQNFLzsPzswiQx49xcNU76miMQcufFSNfZ3gO3OukAjExrFtMUVGKWkLb87a1a
         vfDLAbfb7UVFaB9STn3fpBuQEcjqM/9u/Tqv70CwHlbqd37oV3nxBp/qUzh9jqQbYSJn
         EmXQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eDvuiCnz;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485593-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485593-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-485593-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 5614622812f47-3f19dbb2a33si10403570b6e.182.2025.01.22.07.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:46:45 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-485593-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eDvuiCnz;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485593-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485593-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C79FA3AA3BD
	for <alex.bennee@linaro.org>; Wed, 22 Jan 2025 15:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1D3214801;
	Wed, 22 Jan 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDvuiCnz"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5922139C8
	for <linux-kernel@vger.kernel.org>; Wed, 22 Jan 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560800; cv=none; b=SUGb9R2f4lmNPYwUvrbcBWaUnsuRzJNTA4OCmPx9mMvYAx6QDelek4/GOWMXr9nEkSyWb6Mpo5R6CzTYorwFrBtVEpEAE/1rKWNzzqXM/9AA0Iz53mA9Ibyr4CGgf7DQLrjRnVMINxfUhPBe9Nb1h72e3dhtrUil9CcStU7BuH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560800; c=relaxed/simple;
	bh=g0gfo/yes3890ErorV/wcsHaHmbCCk1aBKfBKpAltNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrU9z3qh8rVqlKvyeNlalMrd9atCasAK55W0+LXZo5sA5TJG6hbv4P0VqZCcrMCcSPw1jwzWt8xUbu1wfuUnPixeoy8rPTNIG+C2hgeSJS46cNXH9JiSr0TvKKSlKKWRNLUR0exz7UEf4I1dAcS03n77kKJe70aQvfWjMQ+/aIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDvuiCnz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3C4C4CED6;
	Wed, 22 Jan 2025 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737560799;
	bh=g0gfo/yes3890ErorV/wcsHaHmbCCk1aBKfBKpAltNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eDvuiCnzALqUN3kUrQ0678xn9PlAkJ117ctXm+03QFQO3Op6yUrozOrDDMnlbDikZ
	 jGdE4F2yEvs8PU1QIEz/bjo6XYB3zu2Q4mHu47EP3mSbj9gT5riPfMxxq07+GlkIZn
	 h4SDct7EZSmFpTOIqyVtDEpRn/pwncwZWUD4X2X9nJGOajvVCMAv1bJxdXUI6nIlq+
	 5+tMdimtM1Kb7Ft0gGxEj3+ApTs4Ond9/KfvdbFalGfx0/tAYRRUfFXQ6WVIL39Wu9
	 6CGHE4sCihONomqlV/DMtcGw+BmS5H0cvsCUppe3Qww2w1FEo+c/XM/63JP9WrhT3P
	 JLHtfNG2KrShQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tacw9-00000008ogU-3cZ3;
	Wed, 22 Jan 2025 16:46:37 +0100
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
Subject: [PATCH 04/11] acpi/generic_event_device: Update GHES migration to cover hest addr
Date: Wed, 22 Jan 2025 16:46:21 +0100
Message-ID: <6b79da0dbd8d735e93c15c4673bf2af61e8c34a2.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: urFHKIAiObvN

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
2.48.1

