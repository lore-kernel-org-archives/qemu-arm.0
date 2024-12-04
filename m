Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp24337njb;
        Tue, 3 Dec 2024 23:43:46 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVjjZGq389+qrbnTxcKlyNpY4GodbGwlV7TXW+czBCq24mTsNqK8y2pWp9CM5Kuzx9COXkKO/05rnmpVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF+izMnSsA7APMoCcRMXkHZ0lSxUzRMrRReDqBkc7OeqVRLw2wkoocmo+1WA+h/Mk+al/F2
X-Received: by 2002:a05:620a:4408:b0:7b1:3bf5:2da9 with SMTP id af79cd13be357-7b6a61a1738mr641363185a.31.1733298226370;
        Tue, 03 Dec 2024 23:43:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733298226; cv=pass;
        d=google.com; s=arc-20240605;
        b=Gz8OnTRdfMasguNtJlZMXMQD1X0mW3/lgtRsJ6zFBOScQ1tklZ+96m9/rVetrNNywW
         2r61gnCvc8Jqu1bWwikrl1lyahx/n5/FjtjsWd++IgPEFOIOWecXHP1Gd9GYaV71VyYI
         LWvoiOk1J6L6Ojj8XUNrUw5tvkCQrCA2wGdBIzPak7vFL3CJMjCsxMHZSomwk33tB7OV
         0k/Pu3elm6+cqSholuy2Xs1tA7OBZfrS8mSQv5DguabPjepEh9Gd1tQ/8xb5In35eZMK
         CNYLZQMixK8fO948wi+bZR4YCfFOSaWCDpAedCC6yFXHDlM1SfJARTEfhWTW8pdalUVV
         N1ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=vZzwLn0gMUL10FCpuIXjZKOq1Tpxem/DrrO2golTkHk=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=bDLOBm/lk3gPrpIIt4rf2sxlncZr5wa+StxO+Nf49ktfN/shJvhDJgFH4+xfMzXLMs
         MGu11Y08/N9+BrUhK5vQw/krvYbhIa2cJCmJ+728bdhk5ghjBbujHY5iXTywiD6evyiE
         uNe8bC6bWuXImHjqzirvqAgnTy0bvduw+sLG5LcsIJCiWixF5+26uLV1Com3agPx8mJh
         wWifourqMaG3eWO577F11OeNzpXMohPcqk/J5b5MEWMiAWWoVYoLAgSdjVAHBlNYStSj
         h+gD9LtewRpbo/NqG+4mMajI3bgRU4ljkeeLZpn0njLhY6hnAX4KkPfxUimCVlzFMbS9
         P5Ew==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="AqyeXqi/";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430670-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430670-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-430670-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849d7e4fsi1657232785a.510.2024.12.03.23.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 23:43:46 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-430670-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="AqyeXqi/";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430670-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430670-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B41141680DB
	for <alex.bennee@linaro.org>; Wed,  4 Dec 2024 07:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BB6192D70;
	Wed,  4 Dec 2024 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqyeXqi/"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB77218E764
	for <linux-kernel@vger.kernel.org>; Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298153; cv=none; b=CTJPBe7yBAMM65zfJP8VyageMXuIy2OiiTD6H0G4ZwC4Of74N8FE/dENdFmGQnmuvQ+87ZJxTKnPf4o8E3G1BCgMc+MOmM1xRF5zDpp1uIF0r3jzV6xC2Zi1+fxdwUywNfnFUV2cTLI+OSPVzla+KFMVjVQWVI6kGHGx2FgO1hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298153; c=relaxed/simple;
	bh=WUvT8Ughz2H3l7zFkf4yAqTlDCn4hpG5JQNObbE2feQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwdWss/eO+ifGQtyvCDW+2wOeEf1PBaGVV7vFtpYNO/wOGx2n4z8N3ZqFsVL2gsvfZ3kq/7+U0v8x9mqQICPLx4p31unDAA0Te5uim98XHwi08NhIwrz+5flsOA4qq188/xk92wNFlSA5rivvm4UNK3tRUtoA5w1MRedK0WZ0kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqyeXqi/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17385C4CEE6;
	Wed,  4 Dec 2024 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298153;
	bh=WUvT8Ughz2H3l7zFkf4yAqTlDCn4hpG5JQNObbE2feQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AqyeXqi/iQubsZ0LmfpUgncboOmdJjPWuOwc7JOFzUX9iI3/OsERiEL4eVk7aN9+w
	 IMVDBx5Fbc2xHIP97EwVbUzTSNEJFmCMd7nMM/KPNgkCkQEXNiz7Cs7ig6O3KUSvqO
	 /JmSyasiCqF4V7v0/L/bXbS/+IFm7M7o2aZYqnFJdtFgOeyhxbQnxiLHVqWjQQtFUG
	 CjOVkIk/i44ehwPfrum+m9K2iiWkWDcYjgrT7S7lPyRhv8Yh7mCJF+QHejqIC1QBF6
	 gkqhsrPN/BIQhkrsXEe3nSNbjO6eQkYzDJx2U4SkHZ5wdhgTZR7Xzv4wiztOh0vNDT
	 Mcg9n3WHq+G6A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIk1n-00000004Kiy-0GH3;
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
Subject: [PATCH v5 05/16] acpi/ghes: Fix acpi_ghes_record_errors() argument
Date: Wed,  4 Dec 2024 08:41:13 +0100
Message-ID: <d2c93ea407f127b404fabbc9c7e428abf600284d.1733297707.git.mchehab+huawei@kernel.org>
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
X-TUID: UrR23um2Nvyq

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
2.47.1

