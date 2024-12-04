Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp24372njb;
        Tue, 3 Dec 2024 23:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCURmYCMCglYUSygu2gSdfKLxAl6ZWDOGHO63E0dSxKjhxmenySQYweFjcI3UMM2s6BZzD+t+nMW01hDjw==@linaro.org
X-Google-Smtp-Source: AGHT+IFFuqRCouFk1IYQbYhywASE8lD4Lb6ZfQaz0oWQ7wuX/HUbujYAVu9Y/VECk0TyQvMr0naa
X-Received: by 2002:a05:6a20:e605:b0:1e0:cd2a:d80a with SMTP id adf61e73a8af0-1e1653a05cemr7940274637.7.1733298231648;
        Tue, 03 Dec 2024 23:43:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733298231; cv=pass;
        d=google.com; s=arc-20240605;
        b=Sz96AAg9KLE1O33rMx8IzQSM4Qmrz55aooWZz1l+m1haiIqlJ4UdNmIZQQJE+O2gk7
         g+C1hk5VmZpO/hzQsK67XA1FqCo3+c39plJzNaLcO4blNkeIHW0F6x05HPIbzBwUm+Hh
         MvjmgIKzKbzKdsd28cF5LAYW7K2pW/oOt/2kFmIRWeG1YyUIA4EeBXxKrG8mJii6EP4W
         oNa0A1RkLzIRrfdJv/L4WdVgyKWaNkeh38rZ0zgaVXj+5Lcodv3+fbB+DuUjVbMLQQmw
         2PE0i/eUanGeNa45/1tcus6VIOKSrKqA4stBJslcXm5uR8vfm0Czytqad0G466xCX3Ki
         DCUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=OOtnBIoUDmjpwgfKNqvpdk/tx5rWWSWn7eKDMEMPZjs=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=ArqgRpp9lFKeiSDYwT2ukdRGqAGkyriXXgwYysyVM4CHdJcO1MOtM/o2qTi5UBkp9E
         vbJYQaIBpR21B2RZ+WAuEMjdQqlRbolmQyqJ3DrQP0872DiCdVBQpXkxdpfNuTSf4qIg
         q3aCo6V/fHA3MBpimbwG7tdohyKsgPWSeNIYjXlG9bltC4w5mzxvBhHFyrB8VH76YN4I
         DSoomMnRmXRIGRnJzMS0+bJAkkfZshyAxedIDAYHB8N9JKhaYnElMzd21p1jyI0rbn6+
         QSfpLNn6RE082CSfIOQWGpbh/o3rThly/u8kqL8pKrS4fPcyjppaDucsvYWVUa0zRjYQ
         Ijzw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nnKzYgWl;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430672-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430672-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-430672-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2ef27042385si1195238a91.76.2024.12.03.23.43.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 23:43:51 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-430672-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nnKzYgWl;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430672-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430672-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F4C285BF5
	for <alex.bennee@linaro.org>; Wed,  4 Dec 2024 07:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AF5193086;
	Wed,  4 Dec 2024 07:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnKzYgWl"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80518EFCC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298153; cv=none; b=plteDuICP65ombwJHZYKMOZIV70LDZRLZhEJPLuRdplksS3A8Lxvlgw2z1kfHO7WFPni8vjffV7GgT+hSzxT11rLCffWiXGs+ZsVhhKtALCTXgfMeEwYMntbo4SYFW5GmdXoa1+8kz9b4AZ4qaGxP7gEH1nhn/XBjkwFT3LiY5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298153; c=relaxed/simple;
	bh=mtr3SAhcJul8SH7gyq7dWJqCajR+YSKyCDlfSYBqOeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcDq4L6iUoFG+z2M9HGh3iu0NBCe0OOa9yLPtLE/wA30npnUYHT7/E2Qe+pObqiDH2uVv964XHaEyO0t/NSPvLdbMgGWmG86bOhJLYrOU/PRiKADrRa6Vp2cUKWEcYipDwDuGhaDLrrB0cv1Wmq/WRavYK4SLYDa7V4e4qSTZuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnKzYgWl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA57C4CEE9;
	Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298153;
	bh=mtr3SAhcJul8SH7gyq7dWJqCajR+YSKyCDlfSYBqOeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nnKzYgWlEY4eCl1TbECjPQe0NywyeGcVa9klsW3z8dEdH4tGq0SU+wN3KN+sQFAKG
	 RqsR5lQRfRvZarKiSAFNVOU/4fh76kkVfg1pr4aT7SDKR130zefC5ToE7P7m7QL6e4
	 oVDnw4mGbjFPc8B3P6k4WYLRKQD9dCKJEq1X8gl9Hnheyq8syWF5BsR/lTP91GPavk
	 RaaA7+R4wezzRiZgzK1NB3e3jj86Ar/RfWn6SCoHaHfLk9/X5sRnvTZGHY99gw3oRP
	 UCXTS41cBm/omSd/VsEUxNImh1Rud8k5V+kWJ+c5Px1+RtWwnF20Py8qpXYhsFgANf
	 wOasEZJpZpBAQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIk1n-00000004Kj2-0N2r;
	Wed, 04 Dec 2024 08:42:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 06/16] acpi/ghes: Remove a duplicated out of bounds check
Date: Wed,  4 Dec 2024 08:41:14 +0100
Message-ID: <3447853c8f174a8f2a1a0e8c029c73c403a85ba0.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: Vj0jf7AsRySP

acpi_ghes_record_errors() has an assert() at the beginning
to ensure that source_id will be lower than
ACPI_GHES_ERROR_SOURCE_COUNT. Remove a duplicated check.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 29cd7e4d8171..5f67322bf0f2 100644
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
2.47.1

