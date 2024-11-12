Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7224199njc;
        Tue, 12 Nov 2024 02:16:46 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVEGJwdHFuFCm0vUqFsfAnB7TA1HH7bAUFjfFpP6oG+DG8GpHUokvNBLYahwnPVaGoG+Zhbh/BLk20SJg==@linaro.org
X-Google-Smtp-Source: AGHT+IG2e56WvKSYGf/xxsnRCD0wTPULc9MzWlouUdfS0BHC3mAkYo8leIB8wVtztyx6NzpBbYb/
X-Received: by 2002:a05:6402:90c:b0:5c9:62c3:e7fd with SMTP id 4fb4d7f45d1cf-5cf0a32365bmr11975836a12.16.1731406606101;
        Tue, 12 Nov 2024 02:16:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731406606; cv=pass;
        d=google.com; s=arc-20240605;
        b=ZL56DzSXpf7OJM2wYxc8+VkmZrcD16qjG3Q3uQHw2MKi2ssJ7JedBIIGRmgyD+rUJr
         MTWFw2KZng9j9ecSw0sQNDvPzJd+0MS/5sRoWkeA0zZSSklekc+60AGEZH194XW3E2dj
         X0Ov0jTW7eXQAPc6/KwzQBv+4ucuPHis+4NOYLWadfAPL42OMUUQn/FPs0wlpJPqT1co
         5l7VI9YJf5h//wVj6YYY/9JRukMhszOhSDCl1gaGMI42SCbg4yaI5wKRAlh/K5mcJ/ol
         CBgr+yuU+EQWLie7NV1LY94JhDKcHPBFSS3xr6Sq+2HRYLNFsMI4iGRBDvL0GbZAOUzl
         Ranw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=n9x5aQzj+IvDsFYx1y1zEKyOO12WDlToovYdk4vtUIk=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=fSzG0G3Ie/uV40lmJFno0Cz+pDp2KHh/Vy6a0fBpav92FzxR7G+WRfMnU4i3C1eRdE
         FxXygGbGBmt9U9bC7NLTqIe3zKgaBVmmCMDyt2Yh58g1vXPSpSHWZF/JXrRAHpj1W9go
         T3ZKnOYrS+mvAHaqit+qroTX9BimHQO7J5T8WnnZFkt3j7ZzEmUrnt4FIxgclCgR1O61
         rLN++KOsQpdgavR8Ghw29tl0Obh92Y0r4KIgHaapFKRKGt93z5u9IDgznMUuX/sDKy+M
         w1hHT3gy36X8uK+8ax+7QDImrPN0OWnewTTbHDE/bxfGMuLuAAdD7UkzWHBjdIUzDd1M
         PfFA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WztjL6Ah;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-405566-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-405566-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-405566-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5cf03b7dcc6si8241219a12.46.2024.11.12.02.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:16:46 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-405566-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WztjL6Ah;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-405566-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-405566-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D5621F240E6
	for <alex.bennee@linaro.org>; Tue, 12 Nov 2024 10:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16FD2141AB;
	Tue, 12 Nov 2024 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WztjL6Ah"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA052123DB
	for <linux-kernel@vger.kernel.org>; Tue, 12 Nov 2024 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406510; cv=none; b=cRoy8IBUykKce0dbaGDt1e9KaSkpczZf039l8C2Tji1UNRQNMqVxUs7wUFG0kYRfs1cAdz63frLxBpSpKniY5bEx0leR3byHpGA/+yC1Va+yIapT3SEB14AkTM+I+8bE30Ung+/Wa7xe6b+uljiHWfSitOiM32JRzeGOmT4hksQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406510; c=relaxed/simple;
	bh=80tymdZsA4gV0nz/70yruPzz2rfWPx4O9L07JwfBNsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OsqMxeHyM1BuWKhoteIcXB9hNeL/XhsFv53buf81NPX27JbmrvWePv2yaV2Dbe6TmsLd8/YTEPxsTxuV3BG2H/6z1VTU4JIlncJONvCkjADQOvy3bpym6byMmn7LeLEVSLihBSQYjdj0je28SaM8ZuFochqoWT+Dtw6O9nSer8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WztjL6Ah; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4C4C4CED7;
	Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731406509;
	bh=80tymdZsA4gV0nz/70yruPzz2rfWPx4O9L07JwfBNsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WztjL6AhubudZTvxzLhNCseRAn9TvO56Zay6n022SOniJHBLgeSbzwpOBUe+Ib7yp
	 thoae8fDuBMtMAlitZWi8IZmt6otUsw0hHjWVegeplNG3YqlEmTbqKzwX8nLqL41J8
	 5KXUydgO+JDLwsYfdWbpxhGI1sBBa6kRL+vuluSyvU34qreEtEkHko284RU2WCSNlV
	 pSjXJIoU8utqVB6SBX6DYUaAMgSWrokDTbsNQBwJ3ZBZIUYNNFuaqftaDwTIMTL2Fr
	 IvS++8RiNSNvMyQSehQdEt8yp20s6kLBkQL4JQNCCisEiLqc0Di7PGD+4GLMz9O9cw
	 HsippVJCNAJrQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tAnvP-00000000Jcq-0NpS;
	Tue, 12 Nov 2024 11:15:07 +0100
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
Subject: [PATCH v3 05/15] acpi/ghes: Fix acpi_ghes_record_errors() argument
Date: Tue, 12 Nov 2024 11:14:49 +0100
Message-ID: <df6572aaa4667f255e18052631c816de059c504f.1731406254.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731406254.git.mchehab+huawei@kernel.org>
References: <cover.1731406254.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: bmPkHg7w+fph

Align the header file with the actual implementation of
this function, as the first argument is source ID and not
notification type.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---

Changes from v8:
- Non-rename/cleanup changes merged altogether;
- source ID is now more generic, defined per guest target.
  That should make easier to add support for 86.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/hw/acpi/ghes.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 20016c226d1f..50e3a25ea384 100644
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
2.47.0

