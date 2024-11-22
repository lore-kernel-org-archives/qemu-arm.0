Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5248705njc;
        Fri, 22 Nov 2024 01:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCBo6LO64Te3vEmu8ZEc3xZo/8u+1qe/SR3OzQVwR1xB2wFzWrDCeBWwQKcsbfAc5XM7ppP38TF5AHbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHj9j/Uuc96bR5aePjyCp/Exd9QR0iGMXrPAwrnrFx3TNbk8ZzWjkkYAwOTFGdxtOi/7flw
X-Received: by 2002:a05:620a:4053:b0:7b1:4605:29c6 with SMTP id af79cd13be357-7b514617eecmr282817185a.62.1732266756346;
        Fri, 22 Nov 2024 01:12:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732266756; cv=none;
        d=google.com; s=arc-20240605;
        b=lWsOUnSfkp14sUWFfpSw1CGGqdGK2yu3AvSJ/1vL8F2Wiy7WA2L9iBDhPZnX55fctq
         rCPT7kLqiJxNjd+4MaZKMEm70EWcTGFp6rckUfpwwimlnEfxyc6W29YraGzFEGIgbc61
         Me2kAr5itIvQgv/KH5qNfe5LgyGcXio5D6qAKXj8nTMrnKluAZJzi3wC8aksTouWK6rw
         hDwgeaLFQp253ULwce73Hvvtv6C/cw+Ko1gOx/8Vpa0lIwyy0m+GEubcEWZ1I3IJHYG4
         17aTi0pfepPgJZQ4Q9uvHryv1JuM+S9iGBAZlRYFzEHUsdMMbp+Umhla1z6zdZL8z8p9
         Kn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K64PQ1ylL9qAD825pvhASNhbR4UUpQjXVd/mwPAYuBE=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=CaltCZtPYP/ySYGIvG2OtZ7mQ70N6G8mrx/SvI2h6Phde+juMmt+M6kwYuEpapUsSH
         dX4DZEI2pS9iAuG8l/0zc8sKSRLklt48AQx+sz7IKKrfN0kXeLxL4gcI1GIqWWO3AAEx
         Rm8+8crLMaqFVBqJQoa7/p7jcQF4v/G3BTy+f2i7Ux+A3aEC21DgYlVg4uA5SJs1yCOa
         /jTawKKCI/tpUxBt5r2NqzFbCTnPU7jxEYqdBe0ll88JY0BLxE/Pp2R/oAv7zyAmZ3mm
         P9b5MXEMHzvWm/HWvEpvsCDY1ZWY0WYnakGuuzKgnrGiY1G+lE5fg8mUOuGsUPMnrENc
         o4KA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Lb332XM2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b51419e8aesi170097685a.560.2024.11.22.01.12.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2024 01:12:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Lb332XM2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tEPho-0002Bq-4f; Fri, 22 Nov 2024 04:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tEPhj-0002AE-4R; Fri, 22 Nov 2024 04:11:55 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tEPhg-0000tb-LK; Fri, 22 Nov 2024 04:11:54 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 569385C59C4;
 Fri, 22 Nov 2024 09:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CD1C4CED6;
 Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732266708;
 bh=6YF6O7FV32gcRBG0RLhIa4885AgC80LqdL+tPakkMdk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lb332XM2ifwY0ztPjDw1L6LAkgS8ZYPt6aqAG3aWH5Wms8IaEHcY5OjyJNFKkZldO
 XjR138ysD02CL39unykzwDkGB3qNcD4OSrzDAeCd0AgOZvsPOykvVg4IJppUEvypIN
 WvGci1Yn/KaLCoTNSo+sF61ajOghAzaD08xj5yUAteMj/+eNPZtFEgfmVZqA1aasHf
 UAEcSFC0UO/FiZQq7mN4PXbqE5uCmuGyRTuDp+W8j/T7opfFhlN7O+j8stTtok36ZK
 OUS0wsj73jnaeDBM3R4MHpV1xvra1oW0UVasTMMhwWNBaNavVJMVtyLCdHTJufuDep
 wTaYqhn2Ynehw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tEPhX-00000006l3n-0Q2F; Fri, 22 Nov 2024 10:11:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 06/15] acpi/ghes: Remove a duplicated out of bounds check
Date: Fri, 22 Nov 2024 10:11:23 +0100
Message-ID: <1aae261ad685e3d50fa8fbe530b9e3c677ec28e4.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xxUJZAg5Y48v

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

