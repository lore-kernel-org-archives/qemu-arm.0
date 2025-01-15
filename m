Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3261553njn;
        Wed, 15 Jan 2025 10:15:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVm8eHEGJEifkNk3vAROeGoQzRi0/L0Ym2yeTcOEsjOHKPMQqh/Omww5zEBHsOxvfJQOtSOMt1A4CAoJw==@linaro.org
X-Google-Smtp-Source: AGHT+IEL3agNnAQjszEJCrq7Txa1yOCYDozGhfI/1fmfkz+A9thLUH9g9AOxVLH1Gx/giJ1XH26z
X-Received: by 2002:a05:620a:4622:b0:7b6:e98e:ad15 with SMTP id af79cd13be357-7bcd9717e0amr4255410185a.34.1736964920876;
        Wed, 15 Jan 2025 10:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736964920; cv=none;
        d=google.com; s=arc-20240605;
        b=Powdl/664LokFL5rsW3B+z8CyqLsrZ/lrrkAudOxPKCmvZXSd0x91lTiy5Ro2OPdX/
         zQpMVLKMtlQdB5QakywQM/52AWK8Rwd1h/enyL8vhs7rHzznaaNewRUt7MKPeuWykgAq
         6ZBk1BmIz+YezCVhEld3E03bCNXJu5Dvjca2s+PqObqlazYTJQ0I0iOw1hvuUGVjEQjB
         5y+SI9aOv/eWabPFZc0h8RInZMd658X8AtVW9Lm1mVJtZqZWz+AC5yeYZEu9FEJ+6iio
         Oqx4gSkZbD3MDyP2gV+dA825Gh6ku7vyjk1eTbFhMKuHpFWpFk6b+KzOpxKfQSMEyiq4
         8F5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jKE9c5M8qcrF2rVuiv+K3wTMAWn1KWYDQBuYnN9ug8U=;
        fh=JputRKIIBCGtsA05++qsrC63SlgnYEfePyxUDaDB9T0=;
        b=MTKNX9ESFSpDbyTnAV6E1ksMAEwc6mGuRBKXJYFDla+SatFqcMyKdZwfYt1QFq9N+R
         I3Uq8xHIosc6EKkIEdq1xdi4385tXilKgyWUk6YpREIhd79q+9tEFGXmvHyTt7Aea2Ro
         DemeXU8FifZvOucxqqLZ01kmY71PGrn6EbIS/9NzLaWO0AZANg1HlpKfhD43XXtIX9S5
         8qAipcEpCXY/UgqxHBBA55CyOCclvNh+HAqN04FZsh8y+47ddhzc5gWfEqQqGccUypH7
         GyVJov4eyNVa6OCLwrpo5e/rmroF1cAb0YwXA81uPQOxMdX1ZanedCIo13BlLvsKsRMn
         X8cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y/rkOjJY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be557e533asi147995985a.582.2025.01.15.10.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 10:15:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y/rkOjJY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY7ry-00058j-1K; Wed, 15 Jan 2025 13:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qn-0008G4-Ak
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qi-000722-9w
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736964637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jKE9c5M8qcrF2rVuiv+K3wTMAWn1KWYDQBuYnN9ug8U=;
 b=Y/rkOjJYzkGaQwvmwAvFHnfF+Thw8s08NTKm+DBHGQqdUYSMZu+HbX00PCyjLykH6lsn2e
 VwVpZV7GgpQKCQ8U5ulaUA52C1uaE9R4q2cZi5CE0ulrjp9tRUl7wHi0FkP/l/ZG2IXafL
 O1nOEyLkLhNXj1DB4PV2e9Fgmano1Kk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-BzJFEwSWP1qb8c__pItt3Q-1; Wed, 15 Jan 2025 13:10:35 -0500
X-MC-Unique: BzJFEwSWP1qb8c__pItt3Q-1
X-Mimecast-MFC-AGG-ID: BzJFEwSWP1qb8c__pItt3Q
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361a8fc3bdso37121295e9.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 10:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736964635; x=1737569435;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jKE9c5M8qcrF2rVuiv+K3wTMAWn1KWYDQBuYnN9ug8U=;
 b=I6cG3C4wL1tsZ2gE2VJSQ1vT0JDebdaDdcw5wqH0GglMDSgBgXqJg35dqeAAf7+skL
 iP6LwIyRn8g7mbYLzGkQZ4qWciQ2/DQHqoY4/wG8Eii7IJPoeFu8uBAngUjIcUsEYEgT
 fzDe9kDnsC0DU3kKnodNoNU7ODR39ktIlCiOvlXq+kMMviEo9/fW/3xuRJz/h4XlXDTo
 fdoCP7EeJ8g+ViWNelpLN/gEd46jqY/jTvI1AnRaG0HucHupLt+L3GgdGZOUnqWiv8Ve
 eZ2pCsjGVOzlJ7fBF2nGI9eQEjsZmuOQvPQ3PTZNSDb4J3qJmwCsWhxEE0Uo1fE6Q5NH
 NB1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXKmQ1QH/86A+9XI29RMEP8kqJ7Z37ipKD5XVTt+WIyt+Vdbw8XeufZSg5SrjTkozUpDBld8Rf+Q==@nongnu.org
X-Gm-Message-State: AOJu0YwlVW0ACh2QVq/Fd9zu0iZX17SKYvne/u8umlZYlu0vyzs2EClM
 Yox8f52tfLAQRhCuziFhbCouMGAm+0cszQMzzQ49VsXtqEpA8vG5ayfZAbP0GqjFKZrk/KWlZjf
 SYX0vas3AAoFblnmlggDTjypca1sS/XMvincPIr3giDoPMDGAtw==
X-Gm-Gg: ASbGnctn3Ak9Rwl6yDa7+Zhf8r+Aj650bpca1c7UxR3N/gLP09HKXBedVuc3tCE/ubN
 0ZZLc+GITYEsVQimoi/uyX6g54W2iIRxglq0g8NfH5zUAqxEWV2bBDuNwkJTFxorBlZqbtOb+96
 i4C6zIKkEm/Te6KdfNTPwefcnrEIb90aqJ+56fasz0PshJ7wR5lWkYbw7eIeCY6cmW3p0smri1t
 URqKUTKsPH/APQ/br0FhDe+OJbYpqd4Kpzx6CpS0Bn5g7frPY9B
X-Received: by 2002:a05:6000:154f:b0:386:373f:47c4 with SMTP id
 ffacd0b85a97d-38a873579b3mr26019281f8f.49.1736964634713; 
 Wed, 15 Jan 2025 10:10:34 -0800 (PST)
X-Received: by 2002:a05:6000:154f:b0:386:373f:47c4 with SMTP id
 ffacd0b85a97d-38a873579b3mr26019261f8f.49.1736964634345; 
 Wed, 15 Jan 2025 10:10:34 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:342:db8c:4ec4:322b:a6a8:f411])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8214sm18165056f8f.78.2025.01.15.10.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:10:33 -0800 (PST)
Date: Wed, 15 Jan 2025 13:10:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 39/48] acpi/ghes: better name the offset of the hardware error
 firmware
Message-ID: <652f6d86cbb60e193edc2510c365b75229734ccf.1736964488.git.mst@redhat.com>
References: <cover.1736964487.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1736964487.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HNrnZmVk20Lw4eLU3iR3pblolZpSa8RfkSh7IPbxRok_1736964635
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: v5B8lsOpfFPB

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The hardware error firmware is where HEST error structures are
stored. Those can be GHESv2, but they can also be other types.

Better name the location of the hardware error.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <ddbb94294bafee998f12fede3ba0b05dae5ee45f.1736945236.git.mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ghes.h         | 2 +-
 hw/acpi/generic_event_device.c | 4 ++--
 hw/acpi/ghes.c                 | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 21666a4bcc..39619a2457 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -65,7 +65,7 @@ enum {
 };
 
 typedef struct AcpiGhesState {
-    uint64_t ghes_addr_le;
+    uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
 
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 58540c0aaf..c85d97ca37 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -363,7 +363,7 @@ static const VMStateDescription vmstate_ghes = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
+        VMSTATE_UINT64(hw_error_le, AcpiGhesState),
         VMSTATE_END_OF_LIST()
     },
 };
@@ -371,7 +371,7 @@ static const VMStateDescription vmstate_ghes = {
 static bool ghes_needed(void *opaque)
 {
     AcpiGedState *s = opaque;
-    return s->ghes_state.ghes_addr_le;
+    return s->ghes_state.hw_error_le;
 }
 
 static const VMStateDescription vmstate_ghes_state = {
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 3f94a5542b..983e28505a 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -359,7 +359,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
 
     /* Create a read-write fw_cfg file for Address */
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
+        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
     ags->present = true;
 }
@@ -385,7 +385,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    start_addr = le64_to_cpu(ags->ghes_addr_le);
+    start_addr = le64_to_cpu(ags->hw_error_le);
 
     start_addr += source_id * sizeof(uint64_t);
 
-- 
MST

