Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp140774njb;
        Thu, 27 Feb 2025 03:04:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVmanQTNeTMHP41fGZqpeQ41E4eNzQZyTQz4yOXux8kSbO6p15g8IhKeWkjhL/LpMlyr+20rUlNGBDfHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFdazgla7XrUnhT6MzcIxeojMjUqex/hYmr1xNp0E2hpm23cmoDI6IYpadf1MWmFxTMo2Uw
X-Received: by 2002:a05:622a:178e:b0:472:e9:59ff with SMTP id d75a77b69052e-4737721be8cmr160383451cf.19.1740654282691;
        Thu, 27 Feb 2025 03:04:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740654282; cv=none;
        d=google.com; s=arc-20240605;
        b=Tb1IAfLVaSllcteErN48XubDmlymdi6HLBRvrqM/LqoJvyCOOB32skq39CRbjt7XNz
         0tKNR2nEhkCroEYtdGANaf/otUxIcVE99Lw5rX64bJSbyx11zuLKN2VG/G3+ge4J0I+O
         CRP23PXLE/YBQwR5WRgOKPdoT0P2EKfSq8K1SUPxOPAvo3nAudXadgraNLs26KVOvU90
         P+wy+EoJ0sS/gsMobRo4knIbvDuGhko4/kTYGVpsUpM/8qRG7rhyAdNB3pQNa33UIr7y
         xxHqkNv2xoU71XXTaa4SY2RBKPc/oqpkwMUaOOQ9fuM3cWlb1eMMJ/ErCGXRC3s+wBXZ
         wDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=suKDqr8iP2bfgTwKgM43SphGAz8Hd6m/7/O6Vx6n7PU=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=VdQBD75ECdiBRRtUKmzgYtS7MmBmYmqqhwVyhUZAxqvdIPySBihCsuQ6n/oRpFnE2q
         /FwJir2y2UoTcyjIggpFpZyS5Y5onv9NtJizeWCwIdPKbqUxdfY2izDAYApcm1puSVQi
         faJqukNTnvGyVMEcUZPwbipPQ8ymtJulyt4Dn71yzof3hUcK9wnUYttZCZQvoyQJMMUT
         aCPikX9wd9U8mzbOQu7SCNtsbodwUyaJGcg0uWhYHNHstl/y10LBoL/Q49nnHUrNfX4U
         b9akTdliW1ggAU49WmaPOygIwAP/RC61X0rwaDdoUe+3raX/rnAybcyDw3opNK+gfl83
         /2Ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ceS2Ouo7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474723fdaacsi11314501cf.271.2025.02.27.03.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 03:04:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ceS2Ouo7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tnbgU-0004l7-1S; Thu, 27 Feb 2025 06:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgR-0004k7-J4; Thu, 27 Feb 2025 06:04:03 -0500
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgP-0007SH-Lu; Thu, 27 Feb 2025 06:04:03 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 374ED6158A;
 Thu, 27 Feb 2025 11:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3E8C4AF0E;
 Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740654238;
 bh=WNgUSU0OrqFnvTXh8PzzTv6ghTQeysRMH1deXYrrJ9Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ceS2Ouo7w7r7EK2hzfN0o273SzOemxtLhuz1YLh83NAH4zAI8qSohfhFBUH1+JgL5
 BU0UTEwqn8wHHwcvKlfm84H11GFSZxCFCl98ySElP1O7mH6NqsR3pqqSTsfsNe0PTN
 eWKZH94cyqi4J+w8/B6+uteOLjoQ9TqadLzBQT+KiFP0fwJe1ecvsm8p5KFDu/qcb4
 eOsH0ogozoESxmyfPFtR5jr8esgyFJBO+GbrDAZ1jU8GgWHltGksQlwO0Ktx2KbFgf
 VCzLva6CXkFnkFmL64BLjW2IKNfOFjUS1wMAtLwS7ymFgMgVsXGT9LqldXJJ5iQCIT
 fdo8dPJooCYpw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgK-00000001mRE-1Eo9; Thu, 27 Feb 2025 12:03:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/21] acpi/generic_event_device: Update GHES migration to
 cover hest addr
Date: Thu, 27 Feb 2025 12:03:41 +0100
Message-ID: <8fb7cb334faa6ce86630899565ef57d1ba366873.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c04::f03c:95ff:fe5e:7468;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ssaEKo1QU3VC

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

