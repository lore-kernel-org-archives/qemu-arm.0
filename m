Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1013249njb;
        Fri, 6 Dec 2024 09:21:35 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWGpkq6DCN+b+6vslTG9tBEl4JjrXc0AgvtBpAVI3tncz/c5IrZbFzow/I7mnGj6Ev41B9aRAvPjVz39g==@linaro.org
X-Google-Smtp-Source: AGHT+IEOVI2cgzbSo7WG6mAJMPhoytbpfrLQ2FJRIU7A8Xt3YDMN0zrKVWhAHAOE41t9OnHb3YlI
X-Received: by 2002:a17:90b:1b50:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-2ef6955a58cmr6218743a91.3.1733505695296;
        Fri, 06 Dec 2024 09:21:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505695; cv=pass;
        d=google.com; s=arc-20240605;
        b=D0xGjCgJAXLh3EazBUMlOV41cdzWxAiSAxvubyn/GoZ4+189hJs2+KfQ3X1bxBoLmw
         hM6zXCfUYPiE0rLioTuE+v09ky4jA60uHKsDPwm0maFw1tl56ZXeqRiqV/DVQs2qH9y4
         lK0p1TO5KqMCOvlg0bEQ1DFithsCfBPvAIorQgF1sP+VSfp8s+XeQbuPwKCkrir6v3GY
         AzUWzVxyI1iKhxyMAzKyLkZFMQcm5Fhwy2nitL0kqpTi/jfn2smBySRpUMdUF8vqgRwE
         o36DvaaNTM1WjPPnYwx37Qmh6p4Ztol+Zq9nYGUHiDJyHZ501BS+4vtt59KSKbr5uMKi
         q9+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=lR3fVOY3g4ehb77yW3uS7yXNPGV/+fMXvzpHnEiTBAI=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=VfRT6QKzfzt3GxBGbSwt/DdtH5sOTPstwBSBJbo3AHwUZ0QEyBKQDc2yOa6PylrVAK
         fomi7P5up5Y1IFjnjUIjAOIQI5EfzIEBPXmOyuXQZH4GIzLnAKnhbbHgGM4kj8Tjh9I2
         iPahBqEOxK/5+7nMJL18sHMCNayRExEF/2xF6qbWBr48kM6k360FvXiw0EE4evvgljTl
         jp32shAFPRGuHo5+30kKN4uRyjtJpjsL/V8BSlus4+0IuM70H6JVNjMeLWy1eEDTBtw3
         bvACYbOzqkYuQ9W2ux5oUhDFGpOFQuPKVgBQ7pMWADew1QRVhO9it7jmsn8KWhs2p84r
         DGUQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RMqQc44Y;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435381-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435381-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435381-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2ef27085f4csi3147111a91.98.2024.12.06.09.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:21:35 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435381-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RMqQc44Y;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435381-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435381-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D10F5287791
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A2F1FFC6D;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMqQc44Y"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709D1FFC62
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505687; cv=none; b=YhvXU6GbqMQxlS/SywsS79b9zKYsDJ62q0yh35pj6UcwWRKEqTzRtDAo0JmMDb4wMqghINBcDFeDGxfatRYMGkgROPYOpHd7K+8t0VscE5iOQwB1P8HHdh9nmIqekqT0JFRZ/zD5XfZEv4BQYMYFfx9YKg1oEOUKaxWXs/7K2tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505687; c=relaxed/simple;
	bh=XnsenWzyXY6TfpyfSZrWfMTz6cEF8BKuThN2HBT4U7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7c0fjFmGyVg//L7q0qkroxIyv208G5j+oaSUQe+r1SigPpQOCHU1ScC5ABtibWqaFgUaAywpHuJuiv18WmdY4rkcEQAjv3L2A8+Ku/f1ulK2nFHcMGJ1BEc8lWC2rnJg45QEXz/Ag4N4d5uVeWNPk1eRRqbcz4ULNw/9cPpbyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMqQc44Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B55BC4CEE1;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505687;
	bh=XnsenWzyXY6TfpyfSZrWfMTz6cEF8BKuThN2HBT4U7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RMqQc44YKiH+aQYVzB2FrQhfmiy1XYDenIHcjdekhPUoHvMCzGifSE3UVeU3g3eYf
	 D3K00r1on+HmxkoDZ7acYPUg8qTFXnYFWm3FUHYkK826Nx/eylr4uyLmxq9LBx3kdF
	 4wIfB8BWwmIL7myZfvhn4SMwQPn6HkG6pPRlrIbm9uTcT4X2AnDLZMMdHtGBCbB4lp
	 yFGFNMGBS+GLNbf97vryK8JEyK8an1K5GhqCgkSZ81BQIOaHx7hYpIa++oZGGo+rDE
	 e+hiJlWXP8YMT32N1zfq3UyFfrSxm4F298zfK7xun30dVIRp1yi40knvl48bdH+AoX
	 GmwKbXC6Dyvig==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc17-00000005RJb-1w6V;
	Fri, 06 Dec 2024 18:21:25 +0100
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
Subject: [PATCH 01/31] acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
Date: Fri,  6 Dec 2024 18:12:23 +0100
Message-ID: <99675da21d8d7a57ed1cf51ac3dbddcad5c2f4e6.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: SliF1Bc68nP/

This is just duplicating ACPI_GHES_ERROR_SOURCE_COUNT, which
has a better name. So, drop the duplication.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 7 ++-----
 include/hw/acpi/ghes.h | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e9511d9b8f71..dc217694deb9 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -34,9 +34,6 @@
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
 
-/* Now only support ARMv8 SEA notification type error source */
-#define ACPI_GHES_ERROR_SOURCE_COUNT        1
-
 /* Generic Hardware Error Source version 2 */
 #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
 
@@ -396,7 +393,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
-    assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
+    assert(source_id < ACPI_GHES_ERROR_SOURCE_COUNT);
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
@@ -407,7 +404,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 
     if (physical_address) {
 
-        if (source_id < ACPI_HEST_SRC_ID_RESERVED) {
+        if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
             start_addr += source_id * sizeof(uint64_t);
         }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e905..59e3b8fb24b9 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -59,7 +59,8 @@ enum AcpiGhesNotifyType {
 enum {
     ACPI_HEST_SRC_ID_SEA = 0,
     /* future ids go here */
-    ACPI_HEST_SRC_ID_RESERVED,
+
+    ACPI_GHES_ERROR_SOURCE_COUNT
 };
 
 typedef struct AcpiGhesState {
-- 
2.47.1

