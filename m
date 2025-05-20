Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp304462njc;
        Mon, 19 May 2025 23:43:20 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUipY2wYaDJa9Ht7SomObq5sO71PAUrFHlXBppKF3jJLbOjiDU/EGOTRD7zFXMlXFUnr2CBH5gSd/bS/A==@linaro.org
X-Google-Smtp-Source: AGHT+IFTz+f9gznPjvRM4Ojn+gP1nZphc5+V6NEnBWN89yoCwnwORBYdEBush0mcLAzv/T+pucYr
X-Received: by 2002:a17:90b:3505:b0:305:2d27:7c9f with SMTP id 98e67ed59e1d1-30e7d555aadmr27184101a91.16.1747723399952;
        Mon, 19 May 2025 23:43:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747723399; cv=pass;
        d=google.com; s=arc-20240605;
        b=CD1k+bEl1lJCOIi2rIfSC9V+5FSw5bkrwMzw2FH1Bg77/2NfH0RzghKNM8lfGRy/vv
         Axu8uJ7TBtOK6jPqAyLbhX0HZS8InFAH8QAVDp4OFF+HKoN/PAfoRwfMl1CYHlq9ld4N
         h1vyTbrxT55gufgS0shcCSYkc16szuYW+bRHSmxSRTl41WyMq2TgPXXzkkjRGySwZ1+5
         iZRIW11EO/g8IMVTSUL8/a/gmMvaaHZp3xisjb+vePQVp3afnjE+dvm6h7ue6PxDWCtL
         LrqqDUyweOG0qwkk1emg2bCuPsNtHRWoTgOY5mo7ttqxYGFrywcKtD74zex75vyWTrFv
         qIVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=kSHJH9rqlCOnikMkGUgh6b+gAEpajYtOHgKv4GNxe/g=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=GiJNmK7SrMzGmXkgOokS17EvjDHJXpTGM1zMVh6Ykh9NHbWP0fD3q/HLu5mDQB+fTT
         xMqCcvhUKGYgnP25yLb/ZfQ96vrCfzbbEhKsMCXjevnKUYIrG9YDUABEvHHUED4Jk3Cl
         oIrzdCL8k9ec5+JIjTZjzWt9nrR3GUkV0YhwoxHb2KgS4/BNHMGvce3Gh13aB+I6uyCz
         GLt7+0grUCbgwIP7SHx3nlx2b/qO3npRQKdDt+m0L/I160Z6oDVC9Pk7reE3wlp0yKfc
         s2dhdXuFw4HydV9aOgpraYNk2HzyAez32YWE3v/j3Fg51ua+vnwh8GrQbVq7rVEgk2AL
         4rMQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fNzIFK2k;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655017-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655017-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-655017-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b26eb0c36bcsi11290363a12.549.2025.05.19.23.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-655017-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fNzIFK2k;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655017-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655017-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 356963AF968
	for <alex.bennee@linaro.org>; Tue, 20 May 2025 06:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94A525EFB6;
	Tue, 20 May 2025 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNzIFK2k"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A039725D1FE
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=LTTvdrJH0M4KDxom3aN5D4o3VLg7ShVnrv8cEPxoFu5WTHhFab334Mnx8sU7ESx4VVJIrx2swgVfm8m9GvAccG1K0YJs6pvQEVSCOGS4h7Y1TzKGhtaNycwHdoZ3vcLsCwfX0wKD/1jNXkidQ8ZY0iIoBajhXyKLSub86dse1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=y+91L8zFi/kS/qXA1N6gYpa+EDi9svLMUkTanEYBrfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRxOZTvisplqnqEojFmzEyPW2KYP7Ig3IfCF19b7NtzN68vSmHMh7odJs0hFvGCvv1O1G2MXfdptCmTF7QaFltLXn1aWCAVQqF4RKaeGRst3Lf7gYOkfNn3OIfRjqWt+uY/XUHDtv2tGUuBL+qDiqIi5RwiLLtvDEcnfSTlQkkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNzIFK2k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25437C116D0;
	Tue, 20 May 2025 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723316;
	bh=y+91L8zFi/kS/qXA1N6gYpa+EDi9svLMUkTanEYBrfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fNzIFK2kb9yYWDgJP7CVnT7zvWW080F6W3ydIGeOsWK23dWvXYd5MrGDVYV9yp2z1
	 8aclv7Yk/B9Qw0/6hWcnqctQumvoVxK9u26g6Hsu3j+N9c4NdWYmyYUDKD7sUcT7Y8
	 /Rh5Yy2+BwCUnf56iorKYmsrBtKxlXo2+jfu3ga7RjUIjgQ/U24ZjEKaoJCwyfna4C
	 SVCsMj8aPbXJLecMoc8dun8ub0FWRg20GI+21qCyz0YX8i4LchbK3205FcXwDlXCiv
	 EtJ4tTCgMe046I2rkDaJ0tVhs1nRWfc8gHn4m/tRijjgKp/fISEd1I0iq7XQWQDg4A
	 CMCHALaxdhXvg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfh-00000005qtE-3AaD;
	Tue, 20 May 2025 08:41:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 04/20] Revert "hw/acpi/ghes: Make ghes_record_cper_errors() static"
Date: Tue, 20 May 2025 08:41:23 +0200
Message-ID: <1ee2df288540088176a1ac27c70cc2736d10ad16.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: q/a6aAVSVyAJ

The ghes_record_cper_errors() function was introduced to be used
by other types of errors, as part of the error injection
patch series. That's why it is not static.

Make it non-static again to allow its usage outside ghes.c

This reverts commit 611f3bdb20f7828b0813aa90d47d1275ef18329b.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 6 ++++--
 include/hw/acpi/ghes.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index b85bb48195a0..b709c177cdea 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -390,8 +390,8 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
     *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
-static void ghes_record_cper_errors(const void *cper, size_t len,
-                                    uint16_t source_id, Error **errp)
+void ghes_record_cper_errors(const void *cper, size_t len,
+                             uint16_t source_id, Error **errp)
 {
     uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
     AcpiGedState *acpi_ged_state;
@@ -440,6 +440,8 @@ static void ghes_record_cper_errors(const void *cper, size_t len,
 
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
+
+    return;
 }
 
 int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 578a582203ce..39619a2457cb 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -75,6 +75,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
 int acpi_ghes_memory_errors(uint16_t source_id, uint64_t error_physical_addr);
+void ghes_record_cper_errors(const void *cper, size_t len,
+                             uint16_t source_id, Error **errp);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
-- 
2.49.0

