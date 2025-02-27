Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp141371njb;
        Thu, 27 Feb 2025 03:05:37 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWYnL1VVg1yCBLMw3pVaavTtxvVre4rAtsdSzfpxm8P5eU4V2D6L4iMvk8P3po28PmzY2Ey5yyeGNTR3g==@linaro.org
X-Google-Smtp-Source: AGHT+IE5om4sVtFgGe1RM/7XBO16vVT3ldV9p8rirQcaZRY2mXacD26bHC6ZQ8GVQTjHWqY/GIh1
X-Received: by 2002:ad4:5f8b:0:b0:6e6:64e8:28e7 with SMTP id 6a1803df08f44-6e6ae7f7d4cmr318326216d6.15.1740654336839;
        Thu, 27 Feb 2025 03:05:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740654336; cv=pass;
        d=google.com; s=arc-20240605;
        b=hWbeesTV4/Al3PgWQdT1gAcfUhnZLgT90lufup7xi62Uv0RuzSu8jqQZA5T/GX/rGm
         LymvXaAvoxyXKQ+VKYT4epDjN9MxEoHe14MYqrBZucYfNLKjfJLLJ1YTAGKgAFWaNbii
         stSpzWveeRzNYUm3TvgtD0mGHq5Yxm3L4OjixpddEk6kz3fYjBHOoqjkLyDDhbXTfvkj
         55oX/KoLmS9hHugFYcZk8F0sdhBmcg1C78sDtzgHp1rHvhIfR8EqpRpXffrX8P7gSKbb
         wWj6dzXZGxazWOk0Lhg66x6OFMmjgrLbUqDLZXfkrer8xrYYUxFjiMu3Eljxron+71hH
         1dig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=RzVSI2zYGc/kLmEChKmkRfNU4eqUMC2px+cZ0oFtEEs=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=AdxjJgjNu+b7r3vCSTMANgeRUQos2ZobR8aq1I48IFt02AHs8exDVR+rYKC3UNH3q+
         pTeEA2Pam22lrYF9J8rnxXFau5qmqsJ1+aMNZyj3vfApM2BhQn4Wk14Oq2oP6ZmZjuKG
         gsJPjvUwb5LTyGp2Wa2Wm/HCe3EvJa1WZhbqVoyT3U1XNlYCMzXwAZp+iSaBaTcPDwE4
         SYRiUS1E8uOr/GxyAnn1j9tj6cHA7KsU7C6qCagCUkZWWRLxPJSdjooYCgEfwqWeKook
         tvYWJZqYwjMXS75A6JjaQUa1yRnht1fenx1BBvKVoEpwcdhJM7N5A1ue8Y4bYh5tS3BZ
         HG3Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YCqKMLor;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536072-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536072-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-536072-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976d0b27si10807676d6.363.2025.02.27.03.05.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:05:36 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-536072-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YCqKMLor;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536072-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536072-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD4E816B1B1
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 11:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D1E22DF89;
	Thu, 27 Feb 2025 11:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCqKMLor"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAB722B588
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654238; cv=none; b=Km00/QrSCTJ/fgOqWlAcsz9VbbfxYaJAYcyQEHnZeZQ6jHA/e3ByZfrAoBvu7bIPGN7BI6Mc+RhhPj0zyvX98FuXhvDtwEpniEeVVGDSpW+ja5PB96ef6hUzbzxo+eEg1SK6fdYze8EhVUdl5A/gTPJ7djjwAUWpldyR6x2wpvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654238; c=relaxed/simple;
	bh=nzYRD9xeun1YSCOk3Qpncr9BpB+PmBiGuH09Z28VaDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2Eb6UtvRsfK+TcOmjscjYAGkSVVcQaBXmHUPAJMbqRLUNysi7eKC6a/C6g5uLiEWs9bVtOe0XsLDnU6vgolOrekfZP8sr6N0scBl009jiLz2MFKNg3aU8rWKlvUck1dpZbJ+Cw7Y77INNJ1cCXtxK/edDoPWmbpcJDx8frYFPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCqKMLor; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338E6C4CEF5;
	Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740654238;
	bh=nzYRD9xeun1YSCOk3Qpncr9BpB+PmBiGuH09Z28VaDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YCqKMLor7uluviJlS6UrCnayL8aEDW/j1Vt+P/qing7XY91/Qyju/I3IHNmLqvaHu
	 vBGgPOPB5oHWVMV0Tah/tP0MEYMPM4hVGIlhycfuHPlXYICRxgANhooSDhI+3Kj7zd
	 wmjxWXCXOoCQDAwKRrkNQR+VBvdzA0hdIpNL1wvEtyft0uVEZVRr7PBu/Ea7UqOTvt
	 ai6iodrOiMDN4nSVdD4zfciwTGvh8uyc3Fj7bx3ijT31kBakWcCMU5ZqzXakHDIgJg
	 9PgDS+N6+W2YHOVnl3EVv7WTf4sivgTLwJdbCicZd6Au/mImgo0c/9kDOJMtrbbp+v
	 DpBPcWONCPoQQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tnbgK-00000001mR6-116I;
	Thu, 27 Feb 2025 12:03:56 +0100
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
Subject: [PATCH v5 09/21] acpi/ghes: add a notifier to notify when error data is ready
Date: Thu, 27 Feb 2025 12:03:39 +0100
Message-ID: <d37709f96acee4122055ee4ae44943756b087eef.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: yIMhPX7nH5Jx

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 5 ++++-
 include/hw/acpi/ghes.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index d1da16b3da2b..c3a64adfe5ed 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -510,6 +510,9 @@ static void get_ghes_source_offsets(uint16_t source_id,
     *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
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
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 2f0c3288a860..bf9f3de27122 100644
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
-- 
2.48.1

