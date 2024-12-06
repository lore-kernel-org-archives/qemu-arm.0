Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1013970njb;
        Fri, 6 Dec 2024 09:22:39 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWUZK2bhJoS5uT0vQH8ZN/rcJD6p1biUBqFyQSRbYd3CQQGuCJZZjjaqA+rPkRWzvmla8TZLztyfKoURA==@linaro.org
X-Google-Smtp-Source: AGHT+IGXi/joPfkeoQSb8opwkxf6VyB3Ghcg/tUxMgltEDbp0F1RqoIspV95YDiCPqvIlTgcZjpD
X-Received: by 2002:aa7:c51a:0:b0:5d3:cfd0:8d46 with SMTP id 4fb4d7f45d1cf-5d3cfd091e8mr2498755a12.30.1733505759106;
        Fri, 06 Dec 2024 09:22:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505759; cv=pass;
        d=google.com; s=arc-20240605;
        b=AwDoH4o/RZT7DO/mIU2X0snLXFKSaE611ySdBHvVbhzUQIqbPM2DSoPtdZOtYefc7r
         7fg/Z2YNS++49tt6WWsGgv04jvXienrAUdUfMfVWRw1JehH57IqXEWvvgua/vMSFS1p0
         lXCqOv7abrgZL+69I/ybk42zJwI+fmqQCj5E1ngwHOlcTZ1PEBV4CODrpacdrot+XiBi
         N6FymlZOFSfr+2AmdE6P3pFxk/eglWU6GJMRZK9MZG4cF4NdzDAamLzEJIeQQewPK5Bn
         X+t+YXZK1IIRWyhK6sKOabEXkWJtSdoEjZIfPNFUmVCJs0yjm2+LCEJ8cqMwsJTUtZue
         7kgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=OOtnBIoUDmjpwgfKNqvpdk/tx5rWWSWn7eKDMEMPZjs=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=LvSvBbmnlaHCMV9RCIajXtARjgVd//PWfxPebRVJwytkUdcR6PqH4XR2UK/OoliFte
         F9gOKkrvx9muMKlXriV6Ll0OyeRMwcma85jKHRfJ25Fz5BVzIvD9/+yA+xU5Nn5CF/8a
         C83ZVUVm1ed6bolptDbVhdD99HX9s8mom7fTMPRtjTLWGSdDJWV3ZeNH8QkQtkz8tYWl
         E3QZiQ5q8uzS3jjGyKd4PuV5hLwBgCQOIWCuPld9+ocbB7FAkna2/ZytBDa4rubsKp2p
         LxZNzdHJQ8H9N62iNHccwhqbuFPScZe42HZAmwgS1hcRrN7ci5LhUVyrZp+wlZIRqtJs
         IX0w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=tLrv2fx6;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435387-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435387-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435387-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d3bffd64basi1382298a12.128.2024.12.06.09.22.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:22:39 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435387-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=tLrv2fx6;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435387-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435387-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB2B018834A7
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06608216E16;
	Fri,  6 Dec 2024 17:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLrv2fx6"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F423A1FFC7C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505688; cv=none; b=ZK+ikIRAnYyjEQtn9kVNvqxtaeQLYHOg1WuAAi6KQ7kQ5bRjWvAkRGAB84fu4iOJF19udCTlBiNthS4Ws9HG/no5FLRi25AlpmswejTPELT3tv1GR5IzjtAywzXxtHMNz5yIW/nMP/gp1IyCqAlhYFtvM6/3LDRmt7mnrN2XX6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505688; c=relaxed/simple;
	bh=mtr3SAhcJul8SH7gyq7dWJqCajR+YSKyCDlfSYBqOeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LB8NalpwW7wmZH5zF/FRa1lCSxkk+a8Nl+Zc/XRqYvC/1sjlIynevvZcGnNoqT4j5uwq2dkSa01hkAarIE8fL4kqOzHgwk0s6Kno2tHxaFS73EVxSHollrRZv08JAj6nlhK9MHWLr+t9WWbUf5xNzsJSj1eRqU9fq+rhg89N9/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLrv2fx6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770D6C4CEDF;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505687;
	bh=mtr3SAhcJul8SH7gyq7dWJqCajR+YSKyCDlfSYBqOeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tLrv2fx6MC5CiMFBLd/p0iq9ZUt5Q9H5mAQYkddE5INb8kfN35WucDfDlKaid3CMw
	 3h32xzaO389ClJtr/75/BvnBLEBC8nP/7Tp5TaSEIeGNGRLY240wU9Oqof3uqnZsaW
	 Q0fRKPX+rj0tdnrQ3AIlNl1hNmD4r2MS0xpUJYKeRQXMkJzl2H6T6T6PaUT7jdcNhD
	 gCNph/Ph90RRh1FpOXykvd2CmSfO0DhetZXuXIR2Y5L3tET7/8RPiESK80vY6nhbPX
	 MDBkAfkyHMnzkZUB6lWv2vAafVD09cPmO1fcxNjGJfvdFmFys8jLgR8v2M9yHDRhL3
	 Esgu1ZIMAjbCg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc17-00000005RJu-2bEV;
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
Subject: [PATCH 06/31] acpi/ghes: Remove a duplicated out of bounds check
Date: Fri,  6 Dec 2024 18:12:28 +0100
Message-ID: <9167a48674ab418596a87fda9d89db78aefec312.1733504943.git.mchehab+huawei@kernel.org>
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
X-TUID: au9J3oeg+jbZ

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

