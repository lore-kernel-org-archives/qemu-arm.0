Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3261793njn;
        Wed, 15 Jan 2025 10:15:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKgOtJ9pNt7cBv+/kStdt4AicLyH++qCuhMPoDrnbhbDPSRQt+Hqb0Q2zcVX4/BpIFWyd25Q1rlEJy4A==@linaro.org
X-Google-Smtp-Source: AGHT+IGsEUIfowPYUTKl5wBLkyVpFXdoB0HAqB0sCv5iMZZj9nW5SUjNSLzpUoHjAJ+eRZBBPfqx
X-Received: by 2002:a05:620a:9155:b0:7bd:bafc:32a0 with SMTP id af79cd13be357-7bdbafc3532mr2046783685a.23.1736964938651;
        Wed, 15 Jan 2025 10:15:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736964938; cv=none;
        d=google.com; s=arc-20240605;
        b=STjqAMpIYK+uaYc5Q6+ocXA0L/n/Spaa7lCpRRnHq2IaieoSMwxiSB7QJproIooOyv
         5R0vJpG4D0B0y3R04qjBeUtrNpzAvhGHc5LCNYq4K3nnfQcz6XMg6vlmq3AR3IDwNnNg
         5e6aqgi0uekH1B0puMpaob61DqSpMkCHWtI/61/L9nwR9g1OgGA23tCOcX3edm73fyNb
         aKhOR6IYTagHd6YVXb/Vnxjj+A9Kse2Bipga+DMIEcDNhXlHgMEPzqm4wEOHc5BkliCn
         rgipsQ+8scK2R08qYrIsR+YtmkizhGcu1cAZyfsBUdPQ4SB5JyGu7E1JvBo4E+qsTsCs
         rEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=yBogc88mZ2zmIgkbCaN8F6OobF+5g446az5uTIFHM24=;
        fh=cNxVKXWeMwPhB3hlFbv8w+8q2q2el6geR+qp6jv/0e4=;
        b=e+avesm/KqZwguPHkujXDmIPtXITLrewo4vKYm264fMtVHrJekP/pnMyxmPi6c+hLB
         oK2jV2YEYu6UfJ5lzf10yLNPIVokKswpuXNs35BWiMH8qfZIE2ECd16mKYY4ZHdxQUC1
         C+CHYHB6pPLf8zCWix1OUDTD9QIKdGvEDe4+ps7fVr+yNaybmlOLoey/5ueQig7rrPCi
         C41e5iT2samWSEuOCxIi+4qviRiNtGfr1oAqo8gTGNzYmcmCdUKKZJh/dyI4wu6A7KWU
         vJRtNCOInp4v85dxFqPzAAvKFBCkgGE1+nh2JxjWn7RFPPGHOPLzIUrMu3f8eA08VX5d
         QQdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PS6FmKQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce33077fbsi1762908485a.300.2025.01.15.10.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 10:15:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PS6FmKQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY7rp-0004Ci-Ld; Wed, 15 Jan 2025 13:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qV-0007l1-Er
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qO-0006yU-RI
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736964618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yBogc88mZ2zmIgkbCaN8F6OobF+5g446az5uTIFHM24=;
 b=PS6FmKQO/U4R3oqVVSFVO0nwsTlQgU/Y1p9KvcpG/XqHXgKRDqwz1x0/+Rs3Ol+xbevs2I
 7Yl48zIZWOnF7haH/sOlbCcuuk1XULjw+jxm+Rtwoqdn/dG5Be8TtmDpKIsukd52Nqhl8C
 M/Ewz7rlxDyFpshfbCWs3BDe+fcv9/s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-KClFiQEXM5Ow4qKTEUHQog-1; Wed, 15 Jan 2025 13:10:16 -0500
X-MC-Unique: KClFiQEXM5Ow4qKTEUHQog-1
X-Mimecast-MFC-AGG-ID: KClFiQEXM5Ow4qKTEUHQog
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43651b1ba8aso47683335e9.1
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 10:10:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736964615; x=1737569415;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yBogc88mZ2zmIgkbCaN8F6OobF+5g446az5uTIFHM24=;
 b=FUD1qheyqou6fLdUl3azJJpGO7PceYEan0mh5WE9ad3TY/piKfOHV3D0ndt/9r2emy
 wL88PNlJZ9lmYUeREXEW1HEvzR+LDOrfJwY+D9ILFMlqeDZAitqVjH1069Z/kP4SDu6D
 D1Xytb+WlOebp+mzmcxMR7y+ryc3dO3BMFsZP5aNtsc9VxC68/xyu9v3zBBxDGW4iMwh
 EIEfjDTWBL8fRcasPJKUpQHB2cmNY96UzumT+0pxoYxtQlVCLJTvDjOb5BTyBBbvffPU
 Ea8PrYaq1xNO/AB1L/yM+mbdFLqLMVJAxQFX050HjHt36oZTvch1mVuQxfreAZiMW4Qn
 eQTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9qtaDghlMhTz8fe7tJjs38GX6A3HM143i+uUo/4PHm9lDpwpmb3+7ilgU1tKUB7V4TUA3DwtZZA==@nongnu.org
X-Gm-Message-State: AOJu0Yzsy+qxAxpeWOn2WxmNWViSRpZWURhXqMpXA1VTaJFW6AYUmuBv
 FcL+6aG5hr7MGXVZhvnQaVoldJk8Mc1pkKWyui9DY/Q857RHz/oZDCIafW/valXscMzyVPOSI6F
 p2s/CQj0F7zfYjxdeSyPJpPaTXLO08rduJZBnWHQHi+MfVdW8Ig==
X-Gm-Gg: ASbGncummnQPba1D7fG75a1rlfOkNXWG9fz2p2BIcO+PgxhRfx4psgkkK45yuoZ1zX3
 uqrykGplw7vKJUb1w0C8rd8Bg31vbXw6+Fgd+Lhtf4ME6LnbaJC9K61Jhy2KekJApt9Q6FurwmQ
 0ZM3va16byiV3EyPa5iHCyRNJjaq1itTn1kBUlL1sKC8fuQv1UvPerFEDSXVALxCbfIUJV3/O7P
 PdoGyoogO/F3O6NkjwJmo1T7C+dwsfdvSATkC/mP1kzAr2EeWAA
X-Received: by 2002:a05:600c:3152:b0:434:f9e1:5cf8 with SMTP id
 5b1f17b1804b1-436e271d3a2mr285758355e9.31.1736964615516; 
 Wed, 15 Jan 2025 10:10:15 -0800 (PST)
X-Received: by 2002:a05:600c:3152:b0:434:f9e1:5cf8 with SMTP id
 5b1f17b1804b1-436e271d3a2mr285758015e9.31.1736964615171; 
 Wed, 15 Jan 2025 10:10:15 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:342:db8c:4ec4:322b:a6a8:f411])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c753cc1fsm32024325e9.39.2025.01.15.10.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:10:14 -0800 (PST)
Date: Wed, 15 Jan 2025 13:10:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 33/48] acpi/ghes: Change the type for source_id
Message-ID: <26e0893e420b34677e6e904a06edf55331bd937c.1736964488.git.mst@redhat.com>
References: <cover.1736964487.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1736964487.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t4Sazrm-1hTw1RB-GijyXv1UULYFDllDEPhbzIHGNPM_1736964615
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.793,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: eZ0hzJwy/tAI

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As described at: ACPI 6.5 spec at:
	18.3.2. ACPI Error Source

In particular at GHES/GHESv2 table:
	Table 18.10 Generic Hardware Error Source Structure

HEST source ID is actually a 16-bit value.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <0e83ba548c1aedd1299fe387b94db78986590a34.1736945236.git.mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ghes.h | 2 +-
 hw/acpi/ghes-stub.c    | 2 +-
 hw/acpi/ghes.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 50e3a25ea3..9295e46be2 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -73,7 +73,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
+int acpi_ghes_record_errors(uint16_t source_id, uint64_t error_physical_addr);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index c315de1802..2b64cbd281 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ghes.h"
 
-int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
+int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
 {
     return -1;
 }
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 5f67322bf0..edc74c38bf 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -383,7 +383,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
-int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
+int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
 {
     uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
     uint64_t start_addr;
-- 
MST

