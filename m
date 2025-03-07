Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2405391njm;
        Fri, 7 Mar 2025 11:15:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUSGq1iVtxQ2owaUX4F66bba85+XScWjeWSVehRhIiosn7qvc3z8mKl3BYivS934dSewkFzJm9HsOcEzg==@linaro.org
X-Google-Smtp-Source: AGHT+IHcyfroste3GN8wbo9rUliZYm7fGPt1lILMIc3q37ibmUhaKeaosFAQ0VZMdeTvDAi2Pt5z
X-Received: by 2002:a05:6122:1809:b0:520:60c2:3f1 with SMTP id 71dfb90a1353d-523e3fd2c81mr3649366e0c.0.1741374956706;
        Fri, 07 Mar 2025 11:15:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741374956; cv=none;
        d=google.com; s=arc-20240605;
        b=VbPorBq8WBHm0dTDwAoHacs38MRZPfExuKs0HRA/0EhZkYhuUA4oKVGdBUdLC8mJgY
         JnA14dTOYFVYX8gxK9mPIICSCMP0QvmhyJF4EpOvRzxGqf9OODjpXCoiE2TR83vaEH+l
         Mju3R966mjknR8NKN/8OIW4rnNTy30Onij2a1QXB66I+7olna3+qeywoGXpGlR2VjkCc
         FgrB0M4DszqBmCej1lAiubBxfI5LvTdjl6gYmZRwa3PC9mQIml3ZkNOK0/U3naWKIpHl
         GEHsFC+0vRS7WsfCq+qxcIhJs0HJmUX+/4FshXQyuQRm2pPq9BPm3Scn+Pfkxo1fAIsP
         OurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Zex/InjMrVAnBUbETJRbgy1Kg/J1EmMC/hRlRjwUdTw=;
        fh=G/iztjpJmuf62QnY8qQLa8MWWC5y4XWz0BPBBAr0A/k=;
        b=Gs7ew3QuTPA4RqOvXujtOo4tk7OnR8yskbl/F4HDWiv/uDx1wfEGwI1De5VNi19um4
         3PBg3/O4d4+v/TtoMPS8elOWRkmvMzEZ6GmS3uj19c3Puev6z8DqMhkr0UWdg394MC4G
         eoIw+IBfGatjSAifnS277PgkNHE1GlGniEVIIW+HL7dKeOHbaeziiVPkwQSCxLK37fhQ
         mBGpZHbY9BIUP3rg/f9RlLvtQPtUgqk3V6HP2druoZeUVq0ozK3T3DR4ekQdJTe/1rVk
         HR0VZHqvuMZ8Mz5ONwyJGRDl3cVRme0w/EvSzHSkyPSRLl1d91E/dIO89OKMM6hmCTos
         7pxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=J9PQo93w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-86d33cd61aesi948968241.165.2025.03.07.11.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 11:15:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=J9PQo93w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqdAg-0006WX-Qq; Fri, 07 Mar 2025 14:15:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqdA6-0004vF-AD; Fri, 07 Mar 2025 14:15:10 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqdA2-0007za-5p; Fri, 07 Mar 2025 14:15:09 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AE7D2A451A2;
 Fri,  7 Mar 2025 19:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9754C4CEF5;
 Fri,  7 Mar 2025 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741374897;
 bh=Czz8Tt4JQ7OG2qz83DhQ/rDSfMDYdFVFtyoa2IaQ3O0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J9PQo93wTWocCkyWmbXCH4q4V9LjblhpJSUkKYNLeljPsy/sEVhzmgAtEHKVsxg52
 TtwDuUzmdqrJ+reiFHBKLPA7nDz0iLBa4qmK1EEEeZy2ErjZaVNw+JwFg2nu6Qq3ca
 u2CkON2612i1l7rTM0+zrq3DdY2nKV1l5po43FUef6zA2kVc4SapGLRJSfZBgtT12H
 zUh2X1irMwffvPHXuElCxupB7cn+ORVcl5GI7AfY/ZwMr8iZPsztsrNgH/ATgyTNJU
 ZvxrAoLnn9y6jNGOm0FvFWPykfAPE+KcuLNxzBSHImhCqP/909fnWadDOxpjvULnSv
 0jOapOkgV4wVw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.1)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqd9s-0000000BQnO-0IbL; Fri, 07 Mar 2025 20:14:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Gavin Shan" <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v8 17/20] acpi/generic_event_device.c: enable use_hest_addr
 for QEMU 10.x
Date: Fri,  7 Mar 2025 20:14:46 +0100
Message-ID: <d7b493784b36bf4fd856a217ae596b59ed522dda.1741374594.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1741374594.git.mchehab+huawei@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pjRYoIKPchYA

Now that we have everything in place, enable using HEST GPA
instead of etc/hardware_errors GPA.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index f029753ab709..9fe70b74bd42 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -332,7 +332,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
     DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
-                     ghes_state.use_hest_addr, false),
+                     ghes_state.use_hest_addr, true),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
-- 
2.48.1

