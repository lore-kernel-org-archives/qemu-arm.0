Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378465njb;
        Sat, 7 Dec 2024 00:57:48 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCU5kmvLDy5+HBWdUaGGYPeMht2vTixgBl+5cx6W32jRjKh6UeAt436+hpLrWPz/HOqKqJaaPzwZjs0Zbw==@linaro.org
X-Google-Smtp-Source: AGHT+IGvVpPAXcHiEMAjIi1Q+3mruSo4EjUQP9rRPOLN/C0XRIre3v0jcriVNriNEkQ/ZxH4oTt/
X-Received: by 2002:a05:6a00:4fcc:b0:725:936d:4181 with SMTP id d2e1a72fcca58-725b8184359mr8802131b3a.19.1733561868440;
        Sat, 07 Dec 2024 00:57:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733561868; cv=pass;
        d=google.com; s=arc-20240605;
        b=Eb1MQQ5vzptvu5QKMSGCroto2AfZbCuVPt9RXH/sY5KVHsFGJSw+IGi5bOpZ905zz6
         Lh8AsPVofEV7K6d0DP+McVjrryD/JpaP0YcS1uwTckvXKZ+J5k2naMpsTmBbb7fRYbzC
         EDR1uL52wWeae0UaQDqNlw1fb//lsiqlmHyfbaLKawH0O6dsy479vC3kceNn9ZWnkdmq
         jlW7dyIvgZZWMKe1onAvSiHxwo/h3kDkDxClHcsp119JtZnGDFZzczA7f6ZKg5kC7TWp
         W0xXjYhMr2uLfRxwYSSwz9oUiP4VwmA5aunKlxnycLcRPMPrInnFMDEPSGjVr04rh0rA
         lB2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=9NPImbi+qmHfm0peItbw1IVDMU/YiIq1D0ieA6XltRw=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=VdNiGMQrJA6QpYN7DpRM9eH8wyzmtDzHVq7tOWuYOEefW1qZE3lFFuK9e/7zHkamIp
         Dmg0bjLmOfH9QQ+ruN2B/TFUabz+caysu6KOwo/i6JMbPuWE8/Laf3CJP7/7on7zMVR2
         sY9c/yG/IVgXkYeNmS6cL/Y7HT97Nj5ax9tPEG1XkvkfQ3wA0g68HH0oDOU/xRg9KiaW
         Azn+mZ6uYk2e9CRD0qNxFX/Zdbu+aFDWaM/Im3W9V2NkfXhhGrbW0NHoJFoYP+Y3gsLf
         jeV7cGCel2Rs8llpK3UltH1Z0KUabPOClP54yHx7ZO6q+vuDhWtyyBVlFa53GWp34Xlx
         p4gA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iw+LZ8h0;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435962-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435962-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435962-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d2e1a72fcca58-725a2cfe864si6198300b3a.319.2024.12.07.00.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 00:57:48 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435962-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iw+LZ8h0;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435962-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435962-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02FF4283096
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 08:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFDC14C5BF;
	Sat,  7 Dec 2024 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iw+LZ8h0"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877CB13D244
	for <linux-kernel@vger.kernel.org>; Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733561805; cv=none; b=bET1uOYCTigkUXjRffN26lohUI+D1R2sL3MDSsgwpP62iU/yeVBAFHwzrVKX+f5pzYLydmfgnn7oFXnJTzHsI7D8v4d7QyE+x3bwmwrdVjBo3XjTUaiKeBiSK7IV3x8YFp7TD9uyXVMa3ujxiOl/vNwanVR1GGUMmnAYQEdVsXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733561805; c=relaxed/simple;
	bh=PPyhW6VsW+yo+jj9o/izTT956e12rFUm5rYlBvONhoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0e16IMeZI6CmMtYuvuRKHll6drEWgDZuMiNngMjLRoJFaKlBzJSmbasjspkYEJDRmMzz0iC2/UAo2azr74KC3Eq2kRoIB6diWTh4zS8dpOA93n4M27q8L/AJYlMrb+v0nMNx3YJe57QCinfA67wjRQZOVH1gFLY17ymx71X6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iw+LZ8h0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A82C4AF0B;
	Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733561805;
	bh=PPyhW6VsW+yo+jj9o/izTT956e12rFUm5rYlBvONhoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iw+LZ8h0/17m4TSXr7lf1cAsNoKDDRiiUarmQeobZbxITDLUx+qRcmg4DFPHgzFhq
	 UcJibwstj/b+U15xvGefp18Ta0K808fvEckhmYauRrguTful+4vl+35nX+CfwszU5j
	 dqq2I2KNuPESsBXrSycIxru1VhB/2QU+iNy2G2rZWdRdM+PS9MN9oy/XECFahEMK2F
	 mFj/QyQOzWCAN4nLzumk3rDhhq5usfFSTRc+iDIxY34TiWlX77mMSF7A+hHXbVmkhQ
	 TIozMCAk94jOjAJ7Kyh/sD23AfHqe3AMS5xpUnXDRzTE34a4A+ILiHhlR7WLToEI/L
	 KXwaXcNjcDPVQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJqcF-00000005j4w-0Phi;
	Sat, 07 Dec 2024 09:56:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 07/16] acpi/ghes: Change the type for source_id
Date: Sat,  7 Dec 2024 09:54:13 +0100
Message-ID: <905c6c7329c39bde6f67f6f6636245de8baeca14.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: n/eXCEcNlSQk

As described at: ACPI 6.5 spec at:
	18.3.2. ACPI Error Source

In particular at GHES/GHESv2 table:
	Table 18.10 Generic Hardware Error Source Structure

HEST source ID is actually a 16-bit value.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes-stub.c    | 2 +-
 hw/acpi/ghes.c         | 2 +-
 include/hw/acpi/ghes.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index c315de1802d6..2b64cbd2819a 100644
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
index 5f67322bf0f2..edc74c38bf8a 100644
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
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 50e3a25ea384..9295e46be25e 100644
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
-- 
2.47.1

