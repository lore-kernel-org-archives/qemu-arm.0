Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7224308njc;
        Tue, 12 Nov 2024 02:16:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6/JRUgP7APwqjbn0tQqxE1fikPxSLpUa4e3yDMMVrEc8jB4DQOFVjwx8UQDwImqZt8Tu/yVFrzYejDg==@linaro.org
X-Google-Smtp-Source: AGHT+IFk5LFdopqdbaR6JzCyuxJWEEBjJ/nQs9bIsY5Txfmz2xCEPyGGQ1kPfZBlL1I3oYfIm/8h
X-Received: by 2002:a05:622a:55:b0:461:16a2:1e2d with SMTP id d75a77b69052e-463402ebdedmr23739281cf.38.1731406618468;
        Tue, 12 Nov 2024 02:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731406618; cv=none;
        d=google.com; s=arc-20240605;
        b=XH7cOESbtdGGKB3I/vt6IE4kiooLx+gU66LCBxYU7vDq2VcPCFxOdH6yAWq43aMQMb
         1G2sNTokP4yXqD2TqobDVTHDIIUBOFMNB9xdBnSNSBJG5bjsmfIogIGzBA5rq/Ohotv3
         BO2k5RDgqpZcrjkeHnbchoMCN6cw+ox6bsgA1kLFWcxihjdNY44Aba7K5rO7NU66/Lof
         Sg1yS8QvB3ESqSQ9AdWYWdxxaUW+FRlM1HXCgLThbnTK/0+0NK2jaU5M9/lyRAMhPnQA
         ln4e/G4lBKDBX0TXMZCnbPgjmGRRCUv3SfdJR7Y9EYbTonLyw0WP4/InLNXWkoUwdiX3
         8eOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K64PQ1ylL9qAD825pvhASNhbR4UUpQjXVd/mwPAYuBE=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=A0FdwJ5UyOe+ieUSW/+ye+XNxVHO0tx7K04nTDr/z88V+PaoRvUfd++TBeY2tdTtGi
         huI7bT/7QooobhuFdFHQhj5aQMSfdaASP4fvj/gdTrYyGww6IQf1i42bEIuDP+6Z0kMu
         HKOkf4sSi4vQFn5jNalBh4AIAcT8BGhUcaPW+dG3C+RlYGcOeuO5rnzwDj95dY3zjqyi
         hMO8NMQL2p0MGkAC+VQh4kvvPjL11uTMr0qdLV1dDYLyooeQ5bjzHbvMtWBTByJMvKW1
         rEQC2I0k7+7Es1yZ/Hw8qYDRIde9V62hleABNpIOQFLERuMrU9Hxx9/jqMSZqBa0qoVO
         pMWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Ro0Bc80Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff40ebf7si143313481cf.128.2024.11.12.02.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 02:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Ro0Bc80Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAnvw-0004iy-Pf; Tue, 12 Nov 2024 05:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvi-0004ZL-TC; Tue, 12 Nov 2024 05:15:27 -0500
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvg-0008Rr-Si; Tue, 12 Nov 2024 05:15:26 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B313FA4188A;
 Tue, 12 Nov 2024 10:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15D0C4CEDE;
 Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731406510;
 bh=6YF6O7FV32gcRBG0RLhIa4885AgC80LqdL+tPakkMdk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ro0Bc80QnhDFIy3SqCL9P5xv0rSf/dJRGdazWiZFscjLVV+CCF1xn3LWKsvSGW5DZ
 040HYBBUGwfg48Y0GlZuMgu+LR9EOHHIki6OMcEnNst/RWCI5xre3T6m2r11qEFP5j
 2uJo11sewfqpX2hcmRkMGwtMvk7sn98uVI2+mOcveRRL8qA9dTfKRoTvnNBrfJ5XMl
 kj7/2O0Z6KYjmb2jMtcWIq4xuRRKrMAFFf9ravJ3fKOhRb538nUxcocuQ3ROgFYvLb
 CPA4kuJeE0q75lyT451I0y/5rxJxefur940hO9TdqcZeFmVz6yaw45Hfiup6uPMicy
 h9He8u83N3TbQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvP-00000000Jct-0UYk; Tue, 12 Nov 2024 11:15:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 06/15] acpi/ghes: Remove a duplicated out of bounds check
Date: Tue, 12 Nov 2024 11:14:50 +0100
Message-ID: <fe7628cdb38ff6fcfa3f4a2bcc51d64f481a3eae.1731406254.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731406254.git.mchehab+huawei@kernel.org>
References: <cover.1731406254.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: p2RELxbRXRDM

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
2.47.0

