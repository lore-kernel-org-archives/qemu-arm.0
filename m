Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3259901njn;
        Wed, 15 Jan 2025 10:12:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXPQzDh+rhc9K0GqsIAunYrZxgKb4VBF7QzNNqqMN8y2OI5Ifm+MffMxirqVqyonx8pvNFP0OEgTXPqFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG/P+fcQmDiy19YfAaYSAAsdm9eU64N3hC2gCK8ISz7e6eb8+W+UytyOVt/SdVfiN/rY+RS
X-Received: by 2002:a05:622a:1920:b0:468:f858:6662 with SMTP id d75a77b69052e-46df56776e0mr68713761cf.10.1736964775440;
        Wed, 15 Jan 2025 10:12:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736964775; cv=none;
        d=google.com; s=arc-20240605;
        b=R1NIKfltFPZN8NuLZgJX6J3P511ZBr2EUMy2LZUfnOh54ylAWyqchhW2TEwCzXniH/
         BtZecORPc2oS0hp8lArzHU/QPZ3f6lCdeoK6wM/m/RtDbIC/2qDzak2RibeBU/dDkp7i
         deYhOCLALCEbifBWENwhRVZURWKp+H1r8im0Ce2EcyASIlIVe+9lM0nvJiKjn8qMRuwG
         3hQwOXWnPfAKXHmKHvS4Cl48+SGZehXC9N6zbmmABB7ORaBhzDxvgNcbi1/TTf9MVi3l
         SJIRePL1JgNP1QSeVvUmzY6qX2nekQ6cYmyWbrsQr5/Ri2v5Qrx6PIIZHnh9Z6HeyD2T
         3gjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=nNCQTJMj4OnBLKxpitjAPWJHtAleMdi6j3FINftfiXk=;
        fh=coY3GzU32RpG6IoK0sGO7qdalMvJgisv/kR6jkk3q/s=;
        b=dCwCDfCXDrfPW01ZmaeFNB/WG70jmO93NBOaUgziUgqPs3iQK7pAmtbElshBkKgpVW
         m+xLan1iA91hQivgl4Ay1Rrvea90oCjLG4pDujviqdoZYhyoYr/AbpyMzDLbSAOouKzJ
         jRsuheTRxYAo9ZmhxdtrhlCjWL6xEQ//JLe9QNoIsvdfLSzQecdG4Kt8S4KuokMekbmX
         uzhy8mZim54widF4Kt2l9RFZtN7AjISvvrIfECDqTbHwCRTEylCp61tXnTKHhFhIQpNP
         U/FBbEsURhMffeDWdFx4koEXpWfCNdsbe0FFWGAv+UO2jJXM2vAPUTPhstWkahRLfOFz
         NGig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JfZsvbN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfad9aab9bsi156968626d6.80.2025.01.15.10.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 10:12:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JfZsvbN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY7rL-0002RN-CV; Wed, 15 Jan 2025 13:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qR-0007jX-CL
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qM-0006xr-U3
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736964615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nNCQTJMj4OnBLKxpitjAPWJHtAleMdi6j3FINftfiXk=;
 b=JfZsvbN1Hl3vCfsn2Qr9TicU2cjrp1ACMbtVMIFnWrCc8NMfNb/QbsadwSEvqVkpl+gddd
 m9W5sxJUkTHC9WOuvrJtddq24b9FEozS40LzLHA/+ya/2m6fBPBIlcBmaui+CAxVXEdz1/
 OMil6XB1SBL3k/GWAhFscHdUYOnRXPY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-eRV0FKb4PHaFAuNQIg3ZeA-1; Wed, 15 Jan 2025 13:10:13 -0500
X-MC-Unique: eRV0FKb4PHaFAuNQIg3ZeA-1
X-Mimecast-MFC-AGG-ID: eRV0FKb4PHaFAuNQIg3ZeA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4362552ce62so37249485e9.0
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 10:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736964612; x=1737569412;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNCQTJMj4OnBLKxpitjAPWJHtAleMdi6j3FINftfiXk=;
 b=bik8zkjOrSQtWgjWRgb0qlMTJ0sNCCu53uq6/dNbEFBH/n8XgvAVFnMBdqR7JUzOYN
 DIcDA2kIjmsIrAfYs7lKeSlrXslu6L/1oHBFjSeYr40sQOMvOg4V7P3BTjWZ/OGpF8qT
 PzM79O9EVmpGGxQmDgEKQge6Q5TQQUk2Tfpt6f4l/n1lRcdkyi2/klpQ3e6sD2bFdMu6
 +nYKjTAdveKzVO+zrAzMIWjF+HBr7pxgaBXYRWYfhPFbkFR0IACrIYWNMPw7YGgp7Lcg
 JxZ1ObFI6Jfh15Ts3KLokZB/9kSLcPOvN20jZSaljXD90gk1mnrB7Ne8zVJuUlig1TWi
 KgZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLQPbctQsWHdG6Pd31XgN/a+B5mMut1VEXHRM54iYnz6JJlmvRp47Uc9W8ZfPGV20wN7euaXh9VA==@nongnu.org
X-Gm-Message-State: AOJu0Yz8jHPdh0rVBg8KM1466Lz12rbkeKaJlSY3ITGI3CvT2cs1lhP9
 RUX42Rs+odBOTB1L8OE0YjNnflAIiEodz0sjLo/b663ARbxKZCx+7/+EE0a+6XaoLIG6vQOCxHB
 +RvwgvSOPoxrx2aZs+JF0jWIkScR921x5FN7pUyIEOyAD1or8VQ==
X-Gm-Gg: ASbGncsXHJP6nW7aHv+idIT87kvHgESyw8iGeLf0Y8gYeUH7rR6a291hF1U6+weB6ML
 r3v7bSR06Fl+pBIwnnuBKmUBXXvVpWoxyWIYCN0uBtpzJpaZhnqkYHGXoned1OtGAjCTUbWxt6r
 7oACZgcNnfBLMoSoR8d6KpJi5QaQ2jDMs0kHlmXl0nzcRcf0D5KeKfw0/vywo2hvEaZufTrkqXf
 zuyJ8QcXVHMY++qN8lREBY+t8MUctov6iMaJ2WIyNZq30QgQPHd
X-Received: by 2002:a05:600c:5848:b0:436:f3f6:9582 with SMTP id
 5b1f17b1804b1-436f3f695dfmr167973615e9.8.1736964612441; 
 Wed, 15 Jan 2025 10:10:12 -0800 (PST)
X-Received: by 2002:a05:600c:5848:b0:436:f3f6:9582 with SMTP id
 5b1f17b1804b1-436f3f695dfmr167973375e9.8.1736964612070; 
 Wed, 15 Jan 2025 10:10:12 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:342:db8c:4ec4:322b:a6a8:f411])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c7540ae7sm31006215e9.33.2025.01.15.10.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:10:11 -0800 (PST)
Date: Wed, 15 Jan 2025 13:10:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 32/48] acpi/ghes: Remove a duplicated out of bounds check
Message-ID: <4ffedca347c458db17c464f9329222403fe54f22.1736964488.git.mst@redhat.com>
References: <cover.1736964487.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1736964487.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RsrSdpkZO6mfWqr8MZEz1CHRAMzZAwGmf5m3FYDdf3k_1736964612
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
X-TUID: XUTDcthscUVr

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

acpi_ghes_record_errors() has an assert() at the beginning
to ensure that source_id will be lower than
ACPI_GHES_ERROR_SOURCE_COUNT. Remove a duplicated check.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <df33b004d85b7b9aa388fb2ac530dcdea94b7edc.1736945236.git.mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/ghes.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 29cd7e4d81..5f67322bf0 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -404,9 +404,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
         return -1;
     }
 
-    if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
-        start_addr += source_id * sizeof(uint64_t);
-    }
+    start_addr += source_id * sizeof(uint64_t);
 
     cpu_physical_memory_read(start_addr, &error_block_addr,
                              sizeof(error_block_addr));
-- 
MST

