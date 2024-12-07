Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378376njb;
        Sat, 7 Dec 2024 00:57:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUSvVTUnRW8E1mYwnDeUYwdHkPVBR/qpBX+Q0PATYChcHv5YO2PxTAr6hM5lBIbW07zGH+Xp6Qs7Wr2Hg==@linaro.org
X-Google-Smtp-Source: AGHT+IFlUmL9ifVlwJwy5z7E18nIN2N2ZhfypZzl7odJQoLMPRgNexV0zGadkmLfiRtuyooL7Q6j
X-Received: by 2002:a05:6214:20c3:b0:6d8:6bd7:5710 with SMTP id 6a1803df08f44-6d8e7202e21mr115315986d6.41.1733561848901;
        Sat, 07 Dec 2024 00:57:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733561848; cv=none;
        d=google.com; s=arc-20240605;
        b=etYGcItwAyFansLgimSK9PD2Ssf28upjF8n9buQ7Mp6yMPKaDTHdUuqq2H44Qj4wXT
         364uz5/aDe+r0tCOvBlyAQHsbn+0PHeTUokWx0jV6nNGZh1GhVcs6Rj+bYuXAOtGyEyX
         8Ro9Uu9GXMPNZe8jeC45UhJa+JLzuQmqNIlwDaeUZeTr1VODSBzG3wx6UpgzXtUlbAxZ
         ITnEHeOntDN4k+WZp3ixr24MVGrb9HAnTmvxI0poDzJ5z4TaeIL/isJs1ikzSbYp0eWK
         0nF3Wp/Dqd2gpmRuQ8SIfjozGpSQ6hLWpNPMcTlNuSsn7CmrRaIIgUX3phrwFRzjssi/
         zT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OOtnBIoUDmjpwgfKNqvpdk/tx5rWWSWn7eKDMEMPZjs=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=M86fbe97am/G0QlyXCR0koaN+fwj9neYzMqsjaYICamrL7VQxDuaBOAGUebZta7rHu
         zOPaP3KtGmaQFSKICmuknn3KAw5l2v9JQgLWldwxJfyV8NSzq14viAyaJh/mLt0+ew8K
         460JJIk9qWLO4+4/oUUlN3b1e8/oq0nLn/lYm1Eo8P8ONrmaFPaHKozWKNYJ4BTLNOfM
         g9fq2VXVVLb/4qbFWIIPPkq6yoqa8AcqsKjBHDkaqTJiZV2fV/GLHNVP9zTKD0GWFRj1
         9nDkmWfojGls0qmynhWK2rFkW/ah4YaJqALtm7BdZiIdNaIyTnUSVv0xE0F4/WNIUmk6
         dT1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hkEbqYwQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dbab1f95si61903516d6.449.2024.12.07.00.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Dec 2024 00:57:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hkEbqYwQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJqcS-0007ZS-LA; Sat, 07 Dec 2024 03:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcR-0007YS-D0; Sat, 07 Dec 2024 03:56:55 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcO-0002Uo-Ti; Sat, 07 Dec 2024 03:56:54 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B3EC5C4B8E;
 Sat,  7 Dec 2024 08:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21287C4CEEC;
 Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733561805;
 bh=mtr3SAhcJul8SH7gyq7dWJqCajR+YSKyCDlfSYBqOeM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hkEbqYwQTY5uiu/lKTsURRYpI6v7GvZ6iFhzckZy7RZick0q/rDvJxR3bSigMr5cR
 RTD0U/pNBmoYoz8iPRayPb8t62jd9KI3dYcFsEhZN0jzPpDWr76LE0F7I2aWDrY8JU
 CZUqztGaZ3eKASBH5rXvmNgK2JjgBapdgCwm0ufZqvG1b+qYAKVq17GQH4YFtaG/iS
 46j7CqGzLXjIyGKJ+eaqHZ3+1hCZf/Ho2SFTGDTu+uBWYwYA1ApSp8HsxOgoNf0lR6
 arxajX6b7xz+ij71E9ba4KvvZnkNq7BIee+D6s4eatk8jcUlZ4mfNesDN9bOfgw5c9
 tpLCVZC7IubmA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcF-00000005j4s-0Ihi; Sat, 07 Dec 2024 09:56:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 06/16] acpi/ghes: Remove a duplicated out of bounds check
Date: Sat,  7 Dec 2024 09:54:12 +0100
Message-ID: <3447853c8f174a8f2a1a0e8c029c73c403a85ba0.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-TUID: r3S2gh8/srkb

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

