Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2421339njc;
        Thu, 12 Jun 2025 08:18:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+40QMsZbXIwMg9VCIrBfMT8uCVXZKHZquxWyiZ7EY5YULXkgj2uQN/MDBzLbEwg59OkTmNSpPUxuvbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGxiHZ/ZF2KnHT6W+lg35e4zDAgeiHPKas4z7CxwfPHco2GbbbWzlxhV4NON2/26+bdcGHQ
X-Received: by 2002:a05:622a:4a15:b0:4a7:d7a:9fc0 with SMTP id d75a77b69052e-4a713bbf3f2mr123272211cf.17.1749741532713;
        Thu, 12 Jun 2025 08:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749741532; cv=none;
        d=google.com; s=arc-20240605;
        b=S8q4+EUQIpG44fAygbp6Y0cq+GhpDyElBRU6xLCpjIA2eDhbBQTG9UslqHk9NHZw8l
         Vw9dfM9N7j5U3o+LWvGxkMtD9VxHCJvkkUgjhBEtGHCXyr9p7X6adXWM8aqVntxXS141
         6UEg4JZumpHLy11r8e7+/sm09OPcLAqaQEcOi3AopFL649yBpVolSemQFRzuB1fWolUi
         5oNinrFi+e1buEqy5BeVWv0q/qMSb5YGRES8MHSjck0V6nuKhyiQ3FSE4xLmPrACWnis
         9H2yCk9n/B12vUmY52h1HWTRG1s6KOIItyOcn2qZhWT3MwxFlP/3HiIzdD0ObXOzM4eU
         LjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Rbh10PchbnjIG3PCjdm2c2c1W4+lNYejeA+t1v4cqow=;
        fh=hTLU5mNQKwnri22ef6rNORXQEnayYeGogGHi7V9gOk8=;
        b=G8i9h3aojMbVJo7vwuf7zizRMQDHqtAPi9NJKGmNgtJbXhyuP5GKmLX5NzUl5JTv1S
         cw/HHflT/npJkP8YCsI77voiEUD2+leMjkz4tmBwOF5TuHe91V4B3fmSRb042X7jfjBJ
         48tb37Qjp4mW9AClaSiABSxATbkVsSvLgp3O3joSbnkW2gtsi8MA3iTeesAijzrBkjHG
         vPUQ6ZRA1J6T2KpUK4dIUEki1WS3rj2EiY1iNXW0TB0gXJEnjRQifaMah6rACHtcK4Lh
         vMmwnHpLMdbS2DdUW9MbE1SaGg193kzZZhwpipCJz2wAmSgvNxkSFkhDOkJxW3UHAnNL
         BErg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="BMm5ZGn/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2bd670si8956431cf.106.2025.06.12.08.18.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 08:18:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="BMm5ZGn/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPjgq-00034z-Jg; Thu, 12 Jun 2025 11:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgi-0002no-UR; Thu, 12 Jun 2025 11:17:57 -0400
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjge-0006d4-JY; Thu, 12 Jun 2025 11:17:56 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 114B9A51D8F;
 Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DB8C4AF0B;
 Thu, 12 Jun 2025 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749741468;
 bh=qT0ATk/szMufp7pLg3EjSMU6UchGJC4t7yLc86gnlkI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BMm5ZGn/AmZQBiV1AtepxMTZ+psNJkv/PIYHRK2NhVn+nruCRVyJUkG4X1iTGUz6s
 ZVBCuaCY1NPB9kX/z98uWcBl/q2pEUEQRTizAlwMpKdFS+FFrpj9fjDRIKxJc2A3ZL
 6qQgGNd8dhbdMJuLbPmhjxMBeo7G+ws191ROkOUy25ZP3T1KmHU32dACYs10PLRv26
 e1GTzOQQBVnCx25rb6nW7yxKpkpF/la8mZAMA27G6j/gjR12qMs7FcSFfUDtdYCWhW
 +WmuYvzkPtcHb7MOWwBppA92i6DbyZcD4Nwp4YWz9/TfF+qkVwTMP8VT+UqnMWJfDM
 NpM7QPgavwzPA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgY-00000005EvO-3ZDo; Thu, 12 Jun 2025 17:17:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Ani Sinha" <anisinha@redhat.com>, "Dongjiu Geng" <gengdongjiu1@gmail.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Shannon Zhao" <shannon.zhaosl@gmail.com>,
 "Yanan Wang" <wangyanan55@huawei.com>, "Zhao Liu" <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 (RESEND) 04/20] Revert "hw/acpi/ghes: Make
 ghes_record_cper_errors() static"
Date: Thu, 12 Jun 2025 17:17:28 +0200
Message-ID: <e473bbd6ddf17e8b7d6868657a4c815af435bd25.1749741085.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749741085.git.mchehab+huawei@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Gr+VEolXJnpu

The ghes_record_cper_errors() function was introduced to be used
by other types of errors, as part of the error injection
patch series. That's why it is not static.

Make it non-static again to allow its usage outside ghes.c

This reverts commit 611f3bdb20f7828b0813aa90d47d1275ef18329b.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 6 ++++--
 include/hw/acpi/ghes.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index b85bb48195a0..b709c177cdea 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -390,8 +390,8 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
     *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
-static void ghes_record_cper_errors(const void *cper, size_t len,
-                                    uint16_t source_id, Error **errp)
+void ghes_record_cper_errors(const void *cper, size_t len,
+                             uint16_t source_id, Error **errp)
 {
     uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
     AcpiGedState *acpi_ged_state;
@@ -440,6 +440,8 @@ static void ghes_record_cper_errors(const void *cper, size_t len,
 
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
+
+    return;
 }
 
 int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 578a582203ce..39619a2457cb 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -75,6 +75,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
 int acpi_ghes_memory_errors(uint16_t source_id, uint64_t error_physical_addr);
+void ghes_record_cper_errors(const void *cper, size_t len,
+                             uint16_t source_id, Error **errp);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
-- 
2.49.0

