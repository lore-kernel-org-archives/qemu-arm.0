Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3039919njn;
        Wed, 15 Jan 2025 04:50:47 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCW4Gvy9h6nfd5qvBrzsMg2xMNmHkIX0DdAkxem9q/ma6DJVuESnQkr/SIQw2+qKQ08EYFxpsqjwi7JRcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGqKa5Hw+UJdQ6uz8Ia/ahpIv7m0913AN4XFd3KQ4X9yyTXKYsLWIjcN7e18JalMXrdoWXD
X-Received: by 2002:a17:902:f549:b0:211:7156:4283 with SMTP id d9443c01a7336-21a83fc3f4bmr475134995ad.43.1736945446968;
        Wed, 15 Jan 2025 04:50:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945446; cv=pass;
        d=google.com; s=arc-20240605;
        b=bu1VdxwAXlGAkUlCKV3zz/dyZPpCFfdJmZRgjUxcSaWpTZXHt0TdJ1R81pe8Es4s58
         u1xPVdYAcJQ3/nxaOx9+GkIUlHoYSIUOMbcImQAb/As4pKHPy7oesEYlYXSldRBM3WyD
         hO9ETZNuSCL2givuS4FWExYUaogS/B5gN47cqsL2Z2RnFpwtTxWY9NtSrINjZNDjiM0n
         sJq2hNGNHhQVoWnkyHngZsdyDbcoGfTuxW4eG+Lo0gWtwuQ45CQjQqMx3RQ0aVn+H3hO
         J2rjLZNOUjvvS/OvdNWo3hRJ+J0ZH2F2rqVS/opsOLiH9/Km7BbrDBxTqvCa84wHCXxl
         2Taw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=OOtnBIoUDmjpwgfKNqvpdk/tx5rWWSWn7eKDMEMPZjs=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=JO+GuZKiFGcIt8S13saWxh/xYgW1IBPRbgAm2JIO9NiLK07LN/nlEhUaWIUMXa4qWX
         wH56eGsaxM7NmWFrKnFj7IsTfeSbpWJ0+lTZ8AweUcI7KvoXxU7gMXt7B8iQ1ajF9q0A
         c3PTRM6pVHvn6FBYdGrvJ1wj+I7nDNxm1ttBSk8/cE1/2p4fqJEx5YE7REFsHLC8RXee
         qOCaP9yHY4AGcR9Cuwcnq18GGFLltvjfH/Y/z+OU3CclAFh5BpM+UoMMkm+iDYJGQe2n
         lDoWrKRpQ4HMYfZdOziSsrN8sWvDZNanAJHdE450hDltlqq9dU2flomrsdUyWlJUkVSh
         rp4g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=NVOU8H7O;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477901-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477901-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-477901-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-21a919d29afsi151448905ad.327.2025.01.15.04.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:50:46 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477901-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=NVOU8H7O;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477901-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477901-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62C143A7803
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C6D241686;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVOU8H7O"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769678634C
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=o+wMykecaB2hYAAm1CjS/eYlMQpKqDJMyfhlDOR1XAr7V4os9ztZBhAysEiQGogVrc7xov58J4GvvHuyiIE6qkccjjchEhswmpbJB6t98l7IlMXvYcHWr0sdAQy4djK7k3teH0RHJ96nr2ydVyh9zzLl8Mv08WCF9SDDZy49LsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=mtr3SAhcJul8SH7gyq7dWJqCajR+YSKyCDlfSYBqOeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwnWxpD37C1RTCAT9ipLBDDyIa2JYnPXf+niirMvcS6wlgAyFrSKsm/A9mAn72hIsFV0o+hHqhnOnmsSo5cPnqGyRh3Yqj3Rjfd//6F1XnA7F7r80GEq+OfyVQfdqCoX/9qfKWZ6F6g3+2j2JKST9WjkGAUkedOMnibPZEAwb44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVOU8H7O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E78C4CEDF;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=mtr3SAhcJul8SH7gyq7dWJqCajR+YSKyCDlfSYBqOeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NVOU8H7OnppvA+3vtrSJKTIzVwhAEV3rt7EZn4j48Kw43A4CxGt1a9u3pOlqV81FL
	 DucXJ72DsYAfG44hhztiiTvjO1GCzkVToCCtTlVswuZEDSE420QNMbM4U6UzgTVsLQ
	 e/fiOmDCHZpyYF1aQuVL9N4QxIww46/hYiLQ4yJKSM2usN4ZOPs0jpaE8f1yILoq09
	 XW+60ICQfmdLAgzv7v7xgDllYuRnKPEDebRdMG4Ei0jIspadZSvcs3FKalgIA970/k
	 JukVDiPYzaVImSDy446NWEsyG294iuiwJmJgrURg2gkoGKowv3vp4EbKEqqKQX1tXp
	 qcWJqhm6kGTxQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yFm-0kAn;
	Wed, 15 Jan 2025 13:50:39 +0100
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
Subject: [PATCH v7 06/16] acpi/ghes: Remove a duplicated out of bounds check
Date: Wed, 15 Jan 2025 13:50:22 +0100
Message-ID: <df33b004d85b7b9aa388fb2ac530dcdea94b7edc.1736945236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736945236.git.mchehab+huawei@kernel.org>
References: <cover.1736945236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: pmVNuvYT84ad

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

