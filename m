Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378369njb;
        Sat, 7 Dec 2024 00:57:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVvi481dmmY7fVryQXz527k0GlRwggnIK86rLDd0imgR1l0DTwalEKCl9h10rwcDUZw2vCndSJTB6CaXA==@linaro.org
X-Google-Smtp-Source: AGHT+IHJrbBHpSj8nXgmWVu9FM4DTyoi4Mhe/oL8+AY4TPYVS8eFM4cMYeV7CrjHMAx9bc5NIBeR
X-Received: by 2002:a05:6214:d68:b0:6d8:a148:9ac1 with SMTP id 6a1803df08f44-6d8e7216f43mr97043156d6.47.1733561846333;
        Sat, 07 Dec 2024 00:57:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733561846; cv=none;
        d=google.com; s=arc-20240605;
        b=au0k7/YxvanWMZtYrFAiKpSZdPZvS2btF11I+N9DuEkyXW9T5K9+a0IqTJd/yS4Heb
         k/wMiuXuN6F8fry9h9SHg6vvKb49x3VPpvyrMlIb7Km0Tx60Mr/VgH1RV4z3J2V1Nz9G
         szNymkGUMB2WqOa/Woqofkgo4icj0TSYAno+76cAmo7j/W/O5cKY+xKxmQyq9/i1EMfW
         RRNHht2iKZ/gBibwPusBLlabXl0WYXY0l2WSp7a27GnEZrcqrqA3IADvwzs0o78hQ8br
         u/0pPo7DfCLQisFoib6hGOgNVauSAmDs+JBhTeTGjyY7pFd0GUWEPvRsDpfdoCX516QW
         nafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XEvUNAZwMl+serfch6Ko+6iEzS0pfm8mQp9pv7pqH1s=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=SThnwUzyiamFSwprfj1jSWyEn98MeEXxd4vB1mcPY1apVekEHqdmovpgs3a7J76FKP
         eVWi473DKaq9qPoqhe8XiRSpSaSzHicBGES45FkJVWvG2CN/zVlYSjipffNP2KQy+pOG
         /S0w4692zCeX3lKFEW+cu4z6PMv0V9Wg0QttSuIPV5LMcKXEZ8Da4BbMRctCMGVq/qnx
         8XMXKbI5PfGC1DH74Ty3qZ93/2OVsRP+wxHtYser3XLRiAy0qHq38nWWsjXSyJw5t/zq
         eFgzAfsCJXsk1Ac8GqONNB/k6VGMwhRG0plK4J7W9GSJ6yfrDz3T6HiQNzdslHGHPpmG
         SvGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="iVI+/1et";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac2c94fsi64442366d6.496.2024.12.07.00.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Dec 2024 00:57:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="iVI+/1et";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJqcW-0007c8-ON; Sat, 07 Dec 2024 03:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcR-0007YQ-4L; Sat, 07 Dec 2024 03:56:55 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcO-0002Uf-Il; Sat, 07 Dec 2024 03:56:54 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 59F855C4B70;
 Sat,  7 Dec 2024 08:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23907C4CEEB;
 Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733561805;
 bh=xKr5K1TW0pYorJXNz1Ksgf7p26nCCQVwbb66JoUnk8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iVI+/1etFqitLEhuGmplhAnFlNYz85ZNWwIpP+DYGKrnpt7xIsQSKT9LzSDDmZpXb
 py5oOw7Xru2mLfi+NKEr1MQbSglG1IFksJQiQqjPCkTL1I9AveRV1Da2gds1d8yrJX
 cUsP4jEFpin36wp9U9U2MUkMBc15MzycMtDNmXqEGIv1LALAQ729MjX5xUUlk73PtG
 juCHNtqKIg9CsGA9iBaomNgB538azbG05Ijcctpk+1qwj9oL15PycW8yqPHk5znpba
 Nz3p2rSPvnXPrZ1FH28l8vgCVOUxo3r3VS9k56oXouSju4proJZsmliZcsiKoRbf+G
 lv7Zb1zBoq9mg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcF-00000005j50-0WsY; Sat, 07 Dec 2024 09:56:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 08/16] acpi/ghes: don't check if physical_address is not
 zero
Date: Sat,  7 Dec 2024 09:54:14 +0100
Message-ID: <95c0fa3fc2969daf3b6bc1f007733f11b715a465.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: GGNEQeZXLOqn

The 'physical_address' value is a faulty page. As such, 0 is
as valid as any other value.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index edc74c38bf8a..a3dffd78b012 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -400,10 +400,6 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
 
     start_addr = le64_to_cpu(ags->ghes_addr_le);
 
-    if (!physical_address) {
-        return -1;
-    }
-
     start_addr += source_id * sizeof(uint64_t);
 
     cpu_physical_memory_read(start_addr, &error_block_addr,
-- 
2.47.1

