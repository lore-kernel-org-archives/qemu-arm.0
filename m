Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3259176njn;
        Wed, 15 Jan 2025 10:11:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVA3JZF1pglx+U9oCxD175beHNw1iWh7kAgJAevTDvvuNQkSL7XnutHzZf/qyV8QNJpe+Pnla5frnHW9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHtVPXc8jPVmj9jX/Y0tK1q7XmvgU9+BBblNP9qCB5R5vDneFVjdElUcBzo+nKcOTGA8uh+
X-Received: by 2002:ac8:5fd1:0:b0:467:8651:40a2 with SMTP id d75a77b69052e-46c7108ee68mr538607101cf.13.1736964714258;
        Wed, 15 Jan 2025 10:11:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736964714; cv=none;
        d=google.com; s=arc-20240605;
        b=ay4myYzYKyj7l4/R2buLMFeElaEHi6lLkC4R5jWcq7PaOXQkvksUyz8POSxq+b665I
         bCDgdbRP+lgh86JBKYBoE0YtsiqitSbVM0jxFw1NemlWm2jaeuhYeXmAPyrCwr563kzZ
         1dinETS7Vq/BBqgJjQh4hwLOIUWLYg7zrsPjk571RUeGMXw8tIi4wNX3bK2Sld8H250y
         hewKhqxvksZ2YvEnCsxC37pO4FO7PnVZWqw8xf60olfX2eSRVqPUTO9/seZi1FvSSGs2
         Zhqo9DR5TSkj1VEGNDptupja/OaVWPZMxXtM0KFkd4bERAiTSmQzmXhiUyhKMAobNnjF
         DZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=8oi9KOXhifPD6YPugI1W0xaqab0w+uWNDdH+YVyo2Gs=;
        fh=8WTxrmC80btTbbL/dEgfsgYnL3C/t/C01lPpZbUqUOo=;
        b=DZj+Hshf3YK+xmXx3rxt/c4oU1jqgzHt/QjGW4yuRf21+eupQL3/F75qLatosGz6ES
         eehX+3yHxHxaGjHOOsV2U+iFHhLRdJoheTHUEMS89XqYxx5ld36DhfvSv01yj3t0XaDd
         hwsK3eLn75/9ZaYnra2tlQAH3QFO9sq2dKsdcHP8iNzZSHCgffRsgjNAt4OB1t3pK/24
         2YJhzZFWiMpLNnq+DyGPABY+2hPI8GeT9I44eWvLyIMV79n5S0Tn8++So79uf6Q8hcXX
         ywug3vaXjbkt9RIkMPh6s70lBoHtKyIIhR7a8PowfhMkSdfzxslO58RPhxvRnoGBqJ55
         XO2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XNOhKOS6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c873e78c5si140821601cf.334.2025.01.15.10.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 10:11:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XNOhKOS6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY7rG-0001ke-RZ; Wed, 15 Jan 2025 13:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qM-0007Xw-Py
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qG-0006wy-Dr
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736964611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8oi9KOXhifPD6YPugI1W0xaqab0w+uWNDdH+YVyo2Gs=;
 b=XNOhKOS6d4tUEd4ZeY704kL3kQ9lc+DTAVlcyunwIOLSEIechGePAMXACWF5Ma6cDbveNz
 jVxsxD1UhIjiw9KN04yncOYMeZDchhc2pVpWpNn5l3BnLce9pOh+8kpmMHfs05p2nGVcSE
 U0Ebpk3q/Csuz/SjbA/kVYK5F8mqE1E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-piYV6dhfNuiFOjL1W16xrg-1; Wed, 15 Jan 2025 13:10:10 -0500
X-MC-Unique: piYV6dhfNuiFOjL1W16xrg-1
X-Mimecast-MFC-AGG-ID: piYV6dhfNuiFOjL1W16xrg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38a891d2aa5so53397f8f.0
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 10:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736964609; x=1737569409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8oi9KOXhifPD6YPugI1W0xaqab0w+uWNDdH+YVyo2Gs=;
 b=f1z16gYjIwRhOBTNQXU1FkiQNLkhmFix7nIroGoW3SKbY9RaH3Y9j1Hej009y56Zwm
 YwRhieCrBwW+BXd3sV+I5yIQBBqhbBxqOKg3eUdd+uvGmb1KP/3a3sbaPIhXyvYkIE3A
 GWd57g/Q2kjItF+B0+p1d4tLkCEVISKi9v97bAyR8ZrvgtK0l4KJpBMdL6UsDWLoDvhS
 rwpoH9n1Wwbz3h2kPAxc2FrwwfZXXpknzgAA37q8ekA5OSCO7v9rOsN9Q3M2O/tWzt+V
 KFGb9/PuwWEkRQcJmAoydzi+3bFXnvBFk5G22/7olcxiW/r0xRVu3ylzeM6K5T0sR+qw
 ywjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcyVFvPKfNav5gwP7k3SIkqCqQZkpiTsgISjMP+HbGWvFlO0DPtKKHMfzX/pwGQT5SqLMQw1Xdhg==@nongnu.org
X-Gm-Message-State: AOJu0Yw2vvvvbUwzFUKKqoFGVW91DDgZzyhi6G0rM7I6ejpDF+RPGSMW
 DSt4niTbtWDIULcY8o1/FpPERaOAHgVu7uAYy+G4IKMqLVX3VmoengL1Nq9ARG//Mn1TJFM33Tc
 Cyq+T6tXd11RAy8vDjhh16WiJHom2RIaaSSd/sv+nMs7S4NTEAA==
X-Gm-Gg: ASbGncuwz1I+79rcB6hSYlr4ZbjzHkJ3mvaSw61IwcpUUaibonfd7X/DUT70vo4fkYu
 Bfw0VGO9XrmeKwmL2p1fptplAziEH8yJZPy6QtJqE1m/6e5L2mETL4SkrcERQgb5XMkPqYFtj1F
 /KorvE3BOUji5J1YvWwJEKhJbGCeIXqWZneJ5sqie8wuaKgUZbuXL5JdMeH2U4SrpcfD1D5pqWR
 W9EI6OUfsvRy5Xayh+ceXf566HWI0baYDDhqxQY/v2HTkV+dtyt
X-Received: by 2002:adf:b64f:0:b0:38a:a117:3db0 with SMTP id
 ffacd0b85a97d-38aa11740b8mr10363944f8f.3.1736964609378; 
 Wed, 15 Jan 2025 10:10:09 -0800 (PST)
X-Received: by 2002:adf:b64f:0:b0:38a:a117:3db0 with SMTP id
 ffacd0b85a97d-38aa11740b8mr10363924f8f.3.1736964609006; 
 Wed, 15 Jan 2025 10:10:09 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:342:db8c:4ec4:322b:a6a8:f411])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c75298adsm31808245e9.30.2025.01.15.10.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:10:08 -0800 (PST)
Date: Wed, 15 Jan 2025 13:10:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 31/48] acpi/ghes: Fix acpi_ghes_record_errors() argument
Message-ID: <5eb07a4ff067053b4d6bf55d2d614b65b00a476b.1736964488.git.mst@redhat.com>
References: <cover.1736964487.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1736964487.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qwr_btQJ2yfYAEMjOtcNyyobolcLKgLYk-Y6Pe5V0Hg_1736964609
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
X-TUID: WQdbTMzpRhIC

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Align the header file with the actual implementation of
this function, as the first argument is source ID and not
notification type.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Message-Id: <d55f2a6ede5a168e42a20a228b2c066cb4c60939.1736945236.git.mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ghes.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 20016c226d..50e3a25ea3 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -73,7 +73,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
+int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
-- 
MST

