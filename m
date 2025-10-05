Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502FECAC5BB
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Oct 2025 19:26:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5UED-0007j1-6V; Sun, 05 Oct 2025 15:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UE4-0007gc-Ke
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:16:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UE3-0006RB-3s
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759691813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wxyrzlql11ovDqHJOPESJRe20F5QdV3aNELPdKJF3K8=;
 b=Iq9QDwEN0081Zjp2hmzpsoXmCs15bGOHghMD9X4L1mCDGeLrjjZkp7ZH32h/wnnapmCa/m
 cywbFTU7GMfN0wCeVjxqQbgVP+mrhnm96D/cS/Rb8zRoZveY9JKP9u166oxw05i5qU3DLZ
 vohKohY7REeF17iL3HFACLomYuRAR6g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-v9sT-nwuMoq5fYT2-fyW2g-1; Sun, 05 Oct 2025 15:16:52 -0400
X-MC-Unique: v9sT-nwuMoq5fYT2-fyW2g-1
X-Mimecast-MFC-AGG-ID: v9sT-nwuMoq5fYT2-fyW2g_1759691811
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-40cfb98eddbso2120928f8f.0
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 12:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759691811; x=1760296611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wxyrzlql11ovDqHJOPESJRe20F5QdV3aNELPdKJF3K8=;
 b=hyIhKZ6NKziZmGyPlIh2AFF1qpLJ2pf4A0PAsiB/mJRbQuc5CUYdS2BV6d0YFVn+Ft
 owDW2s8bcdwgcYXMQ7CQW1HbDzfy0AQyfbvxvpedOBC05IHF1rZL/ZepeCBisF6sbv8u
 NJJ6PJE77cRhjljLBC+Bj4JTFTTJE05qTdD6X29wqtXhRIsiLg6gBxxVZTv7udOCvgfl
 jmvwOpesqcs5Xv1aE4aKExfAUBq13DeN6TqFtfua+kiVM9xHScNYIKtsSqcKtg7Olv/K
 Dx4DwMONZk/mmUo3GB2mmzNfS0GeHp5v4EUh5LiP/OiDColVjDNVil54VGrGZlxyUgKH
 mhlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9KgKR2mPeXonYkF6bztfn7myNzds4+0EHuWEYSs0Uthu31PPXr8NPg3FbM9dmsYYobtu8WxO71Q==@nongnu.org
X-Gm-Message-State: AOJu0YzTHcAlXfrZthpb5jn31kwCkIFX89NO5hzJaOBbxKDET3t+7j3K
 5srdsAVKeP0kIjsSYvScdbfVIC/Z5KxeZYJguSn0CD/zWM4zfxBwdJOHJ0yLJH57qpv/CYH+dF4
 M17oMOtjsY2lo/4muc4ZSGPzeLtayNw6842MWOrKMhwpQBekLy4zXxA==
X-Gm-Gg: ASbGncvy9XAQyWcc4FDxFjiZ/vFzc3kQur73ogPBIUeEcpHZxpiGDUF/s/fb+uWUObZ
 VwsP7vGNDK4tp0O1/Yn6tZTQJi0ECCoL/DQQDIKSciNFACTF+Cvrzv0tPV30SgL9EeETT2t3dei
 sQnY/6Rn2FuV7nzd4Lcaa4/OMPNXqE41dmkqx3FIRZGe6IkbGxDLw777HWrgimeuv+RlFRADS4f
 aKD6vjfzDnHqTJh84U12tZtJ6uGzH+tQHy99N3fAoXrdIomQRL/Eu9sjpogjCxUbcKwOmOqXNDe
 hQL1xzgdozYGyLM/kzcUSopPMPP9ylUD0GGXMP8=
X-Received: by 2002:a05:6000:2681:b0:407:d776:4434 with SMTP id
 ffacd0b85a97d-4255d2d2212mr10039357f8f.30.1759691810976; 
 Sun, 05 Oct 2025 12:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIHvQFTEUNq8I64/Tv83iJGs0Xg0f5n4V/HJfGx/NZltIXQrQLLbWxy26p+lnaZrn0NgdfGg==
X-Received: by 2002:a05:6000:2681:b0:407:d776:4434 with SMTP id
 ffacd0b85a97d-4255d2d2212mr10039334f8f.30.1759691810475; 
 Sun, 05 Oct 2025 12:16:50 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1518:6900:b69a:73e1:9698:9cd3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6daasm17721522f8f.7.2025.10.05.12.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 12:16:50 -0700 (PDT)
Date: Sun, 5 Oct 2025 15:16:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 21/75] acpi/ghes: add a notifier to notify when error data is
 ready
Message-ID: <7a857a8933e073d6e0c5ae2c09ff6c45751be3d7.1759691708.git.mst@redhat.com>
References: <cover.1759691708.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1759691708.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: njKdV4SJULnWvHslnR3NoZPQ8iczd9xlI2BM-4YrrT4_1759691811
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.43,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <edf9c6e5b80dc57e3443893bf9e1eb25cb9d266b.1758610789.git.mchehab+huawei@kernel.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ghes.h | 3 +++
 hw/acpi/ghes.c         | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 8c4b084337..390943e46d 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -24,6 +24,9 @@
 
 #include "hw/acpi/bios-linker-loader.h"
 #include "qapi/error.h"
+#include "qemu/notify.h"
+
+extern NotifierList acpi_generic_error_notifiers;
 
 /*
  * Values for Hardware Error Notification Type field
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index f49d0d628f..d666f1b10b 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -510,6 +510,9 @@ static void get_ghes_source_offsets(uint16_t source_id,
     *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(acpi_generic_error_notifiers);
+
 void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -550,7 +553,7 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
 
-    return;
+    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
 }
 
 int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
-- 
MST


