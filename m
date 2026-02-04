Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34D4EA7942
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Feb 2026 19:10:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vniAX-0008RJ-5b; Wed, 04 Feb 2026 14:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vniAO-0007fE-Cf
 for qemu-arm@nongnu.org; Wed, 04 Feb 2026 14:03:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vniAM-0007vo-T7
 for qemu-arm@nongnu.org; Wed, 04 Feb 2026 14:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770231833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ArWa7ZxMRfjmS5u5tmE8e+KIpDRrIw2EFlofFVZVFnE=;
 b=UvqW/pPoRN67U7NRKPhWaEDD7yE/T/bFEH6PXYM+qae+x/JcW3V6O/QqvNhCVb4hGkffO+
 gWei+wDT0JO2VWXuk7dpPK6cjpyjf4O1dOGJyyhZXudJdghrLYeeNUb6x1kbvSLQ5+Z8Oa
 /N3WHxM1KY/Biuv3sHQvP+cGbPo36I8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-yQIM3HrsObm3rt6q-mG4aw-1; Wed, 04 Feb 2026 14:03:52 -0500
X-MC-Unique: yQIM3HrsObm3rt6q-mG4aw-1
X-Mimecast-MFC-AGG-ID: yQIM3HrsObm3rt6q-mG4aw_1770231831
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4358f90fe8dso118425f8f.0
 for <qemu-arm@nongnu.org>; Wed, 04 Feb 2026 11:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770231831; x=1770836631;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ArWa7ZxMRfjmS5u5tmE8e+KIpDRrIw2EFlofFVZVFnE=;
 b=lj4tlyC1n7aE1UZsrR5Je1QY5qve6uYBNk4UXfIEMQg2UivE7tHMosSvzAJfHCirqo
 xG+mIG0jraRDrPktd1Aaec8bkTfsIEcDrOQ4V2dBgxpeg4Wwr6W8RTmhLpwBWDVhP8WP
 gZScuqEHsT8Rtjp5FeTkzOMlFLyABQ+GLrMapgicuIm2u675U7M8sTDOTb5u5bgPvdes
 Z8cME+Isaj3MyB2pPtk/5MsmSDRRNFFurNsOyPfXAa1LFX3N98AnYiIzsCwZX4LGFeH5
 /rBkJ62KHXMqP8lAdkYOPjjPOZVR4wmgksNTS2sfOt0a5BPz1TZBm9sEbXfq9VF1Ny1h
 lCSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWacOQ7LYbReZIaF0Ye41ptYnP7demShrunRou/6sJ/za2OHhWgNjapskdCdkUHcx926dfmJTNm+A==@nongnu.org
X-Gm-Message-State: AOJu0YxkKksvk1RCGbXKBV+2fFiteFdxIla2rIBhnxUM6Xc3irPu4xeB
 chS6O6HdoiMAzOtYnsSzwUcqF3mn0jjTx9AtOXSIU4YIXeArpasCAPNUiyE5ktqibCT0EOG6VA2
 nDe39YTDM2nj5uYWshKBj7RiEwkeh0zEwLymqkpJnN8HX0P0X422M8A==
X-Gm-Gg: AZuq6aKLjSU96dzfklwb1mUpcbbftMxX4fjMx2WtWb3k7GecUGBaC+x3eGxIZJvSIgq
 5ZTBsBQwv04hj2r3frH2LYw4d9mkdzIU1JGM3sh1j4WAVHXiGKif9TR2HlSkpPSVhk6j4G9+dIw
 66xVCddiLo+It/VXLde422vn11ofoBGgVDObmOn5RY/eXOYGiSBeJkPz4x82hp2hDv+dwy+Raqe
 TrKxMKHi6fw0JDEESPHRKYafX8iedFAGFbWO2xd+n2dVm2eFAWGt8sVskmIk1fjSilwCnNdQlkL
 QUGUJ9L0g6YxKf0h4BBfMzmGLM/FSv0+rdtPLl0DZUYMW5bFf+yYcx1uPeh6NZD7rm1vLx8dN8t
 CUuly1iecdhwJfjrt/rsfxvPf7Vf5fdfmrg==
X-Received: by 2002:a05:6000:616:b0:435:92c6:d556 with SMTP id
 ffacd0b85a97d-436213dfc30mr529195f8f.16.1770231830798; 
 Wed, 04 Feb 2026 11:03:50 -0800 (PST)
X-Received: by 2002:a05:6000:616:b0:435:92c6:d556 with SMTP id
 ffacd0b85a97d-436213dfc30mr529137f8f.16.1770231830333; 
 Wed, 04 Feb 2026 11:03:50 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805faddsm8351974f8f.33.2026.02.04.11.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 11:03:49 -0800 (PST)
Date: Wed, 4 Feb 2026 14:03:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 26/51] acpi/ghes: Automate data block cleanup in
 acpi_ghes_memory_errors()
Message-ID: <41c79ba3ab0dc84f9601f0d48f47e0502334fa2f.1770231744.git.mst@redhat.com>
References: <cover.1770231744.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1770231744.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: trxandRJID6OA1pMgOME6G9Xmpv13kzg34wLaVSHB0I_1770231831
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Gavin Shan <gshan@redhat.com>

Use g_auto_ptr() to automate data block cleanup in the function so
that it won't be a burden to us.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20251201141803.2386129-2-gshan@redhat.com>
---
 hw/acpi/ghes.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 5445dc11bd..4e6903a8d3 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -566,9 +566,7 @@ int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
                   0xED, 0x7C, 0x83, 0xB1);
     Error *err = NULL;
     int data_length;
-    GArray *block;
-
-    block = g_array_new(false, true /* clear */, 1);
+    g_autoptr(GArray) block = g_array_new(false, true /* clear */, 1);
 
     data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
     /*
@@ -586,8 +584,6 @@ int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
     /* Report the error */
     ghes_record_cper_errors(ags, block->data, block->len, source_id, &err);
 
-    g_array_free(block, true);
-
     if (err) {
         error_report_err(err);
         return -1;
-- 
MST


