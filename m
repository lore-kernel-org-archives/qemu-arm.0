Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1960284njb;
        Sun, 2 Mar 2025 00:22:24 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUkVVLLet9Ya00EflTwLhGcXcVq8SYSVo7I29vcs7+2PhHaQey2Kt2DP9HA3j/dnx8cdpKMKsaRmetp8A==@linaro.org
X-Google-Smtp-Source: AGHT+IFcMJNLRRychoMr9Qwn88pXWgRer/pZyd8Obd7u/t13pUbUWfuF9Rw7Lax2Af56UhbLxfx9
X-Received: by 2002:a17:90b:5750:b0:2ea:aa56:499 with SMTP id 98e67ed59e1d1-2febab2b8e7mr13284886a91.1.1740903744597;
        Sun, 02 Mar 2025 00:22:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740903744; cv=pass;
        d=google.com; s=arc-20240605;
        b=P/wUrYptUvG/EqhxL6TyOo2GQOPGheO1+vVcGj4Ab7nzS3quiPsBLcBil66OgYzeJs
         4GvsKJPu9vUJW2tmHawXhH6OxKHpXMcNd/zrjivgXL4Qw5s3RfSOxfq3vvtGetkRvwWK
         e4OnMAdFQV7jkj8VG9UVuG2dKcGAby3wCAVKY9Qm12tKf173w1CZDDvbDWwqF30mnILz
         0RWlU9OZmV3FAR9E30Buu5v4O5Kvz1H01c78tJBEp1WrbLwS3nMQkkIS0uZH6miAJuvM
         o/wz4iFCbgDAndbiZk0ARQSz+/lVpz3txYnlG0BH656rD40s51OO7N3bk2zgEmfBshHC
         rGaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=iiAlQo8jSE4dH8zc3hOBJJNAvYRgsBFmZCcF2Euq7oY=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=EGzg7NIuUzglDUSwg/WK+LJP3mI1ebug2qi3+JgNEVZGT/6lMX479E/bZDmr5Lj9Dj
         SBgsrb+fTsNvdsC2l3sXbpF6xCsVioP9ucraHjrFYf42zDGcVjjKLI+nUO8XihaHziK2
         meDSzUwzyCqY5ysylVF16k2hUNOn8AkSxdKxtsfd6QPPBxIYnWaUCTwhJ24Nm2uBLkXF
         Bu5VRplmrGZpw/kEk6Qou0LSgRQyh6xewiuJpsco1tLb+111oabyC3ksE+XEVusNZkao
         YbYcaAK3gREn6lt5r74KUtvTNz+NmUSJWMg3RTKZPkhjx4i+QJIgUZID3RMdSjDYW4GI
         GG2w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="p7C/SZ1u";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-540431-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-540431-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-540431-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2fe923c088asi12010927a91.105.2025.03.02.00.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 00:22:24 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-540431-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="p7C/SZ1u";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-540431-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-540431-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66A363B4C46
	for <alex.bennee@linaro.org>; Sun,  2 Mar 2025 08:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C690A1D7E57;
	Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7C/SZ1u"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DF2EEC8
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740903737; cv=none; b=fGOZWs39QSscVOITvMqCYWE/3FN8rcCbDM5d/X4RRUdHS+3ryeby4/8MbELz5H+Sak+SeYfiPa40P3p98R/cBttN94eEtYUA6vfwdYsffCShjTEm2Q9PMU+1DlypQs8v17RtkjecmEkmHJ/p6P5ApaUb/Ic4ryXzEWSPUUnQkTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740903737; c=relaxed/simple;
	bh=LvlI96l+YbIl5MsIJDnbtQxU7YniO+B5OBQkHO2lJqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVBjUrNKj0MXEogxuHFMHDJruG6qcJYJOIjdtF3dSqtuXNmRmQYEy9a0COhtLxeqZ0AhZGhWvCBWSM0WMGfv+IGVf4uzArCI30yQ2li5ln/n+MIGJSa3SJG9oAPYhy8lwVoOpZxmuLbgeHgviXQIIzybxF9fPGnYlkQUOe//FM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7C/SZ1u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFC0C4AF0B;
	Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740903737;
	bh=LvlI96l+YbIl5MsIJDnbtQxU7YniO+B5OBQkHO2lJqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p7C/SZ1uHSjQxjnVUw53vjjHVcqNcPp6caMOXp8UNn+LwKDFIxSnFaXgtD3G8D2KC
	 dDaRs34uFwu3dp8T247CnHJgnvsijRQGjJhuNv+ZsUU7N+ff0j8h3QCUwdbTceYgkZ
	 1qNReLuH/DGNJUYYRVf7dcqclWoG1AIQBdCvmGmJ+qe8k2Ixp6sbtRX6kVDFh5oLeg
	 E+G5xo9hYgJlMMMfQwwcSolt++8Zbl3jjnV1HwzYUsMRAaBiXBe1+1Dc6TjenhUCEn
	 943ml/YhxvFF7zUKgjLd7zzgdvUJUYXbAawM4sLLwKXBEwQB1KeNE3yeEInsz1dp1W
	 KX7+iiWGQj0Gg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1toeaU-000000043S4-2xlj;
	Sun, 02 Mar 2025 09:22:14 +0100
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
Subject: [PATCH v7 09/19] acpi/ghes: add a notifier to notify when error data is ready
Date: Sun,  2 Mar 2025 09:21:56 +0100
Message-ID: <50b5db8420a552e3502b4f9f654f48ee8546dcdf.1740903110.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740903110.git.mchehab+huawei@kernel.org>
References: <cover.1740903110.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: FHkH8JseAlxg

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c         | 5 ++++-
 include/hw/acpi/ghes.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index f49d0d628fc4..0135ac844bcf 100644
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
index 8c4b08433760..390943e46d99 100644
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

