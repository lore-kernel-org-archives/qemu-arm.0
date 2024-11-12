Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7224255njc;
        Tue, 12 Nov 2024 02:16:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVvTDu+c10Vnv5qFsKrTH9CGMYpkPnXWUvvtwqNYKqszsbKdbJLYypT3yXpJmOovDGIPFLinljTb3wfgw==@linaro.org
X-Google-Smtp-Source: AGHT+IEI57LBtZSKG18ZySUWrnIP9hYp0z7vET9v9xjqldUA5fNs0WjXAOXWncbGgHX0TlPg2p8z
X-Received: by 2002:a05:6122:7cb:b0:50d:6756:5464 with SMTP id 71dfb90a1353d-51401bc8ea0mr15750208e0c.4.1731406611136;
        Tue, 12 Nov 2024 02:16:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731406611; cv=none;
        d=google.com; s=arc-20240605;
        b=c/5ExjQHDry3WmvXHZ1k84f3k6uOaz1lyKTebEadL3HdaREkHwazYpFOqkq+xkGE0y
         VZyuAvJ0OfO8bWbKAshD3rDAZt1apiwbMJkyIlr6uJWhhocR82yX2YVrXyDnhCGUX2+I
         s6Fzg+C+VAC4teXjOYRmZqY4xSFRGGIvvufQQRFpzqF79m2vLtgmyxuVlGIx6nLvm7ky
         gC7JZwQ6suzp+SyH8FQdrImsiK7lpAEuNwaTXxZ/k4K9raTS2WOSEcW3JFvpQxeNXc4/
         iISqWSxVoGAxXGMLqNCAMA4tj2ka4eaC5NUxLK4bxWbCujsubePJ/Y4OYPBde9dRFt2i
         1qKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zlIJz65G6+4rCHmPidBJH/kvk9dpsDE5IhoW+svIEmo=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=j4v+cpDTVhMLskIMaI9PlW2opbrL4yhyX3jpy9VcUyBoNsMhQ3Tkrq+ArW1FddlM6N
         nTGQurmdagE1Sa58h2ykF6JVpZ2VtMylcDQjlEC6Ghst5lG+wlOaGuO5Nv2ySHCRrul3
         5OC4Yw++JucMAh9SDLLHfHvjT6H6LAoGQVLCDxp9B6v5HMnZqwZH1ghB/al/8vOrHjuM
         Au1EfhYCiYhtlv5eqi/UXOofYB3pb3q2sUFVYG+/XTQqj6J6x087eCQ15YFRmHoPsjXe
         fLqC+zQiGmprMipQGT/IGGMJc2GPEtmLh7QqE+2PgYmLfiPN5tLOPjXDoepycQt8xv4q
         04Bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nxU90Ih3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3a6825d50si94430476d6.443.2024.11.12.02.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 02:16:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nxU90Ih3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tAnvr-0004e0-R4; Tue, 12 Nov 2024 05:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvh-0004Y0-BY; Tue, 12 Nov 2024 05:15:25 -0500
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvf-0008R0-4P; Tue, 12 Nov 2024 05:15:25 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8BE6BA41877;
 Tue, 12 Nov 2024 10:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02185C4CEE0;
 Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731406510;
 bh=QErupS0eevbiyg2wy1zCDXnCTb2oIiNKZApansBSCXs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nxU90Ih33ni3vxhnLgsCJ8ulutsUQdWBFU5htlBmxp58hqtVNmg5v833SQpoSNdS6
 mhAQNXefnwa55SsLgGInk9tmLnsFIGLAUkrPgj/5Bn/xbFEwuFE1+VYES0c8ps9+Pj
 +KeHbKtJSSe5/S3xKG6PfjVcvl4O22gp2AmSpKqW3NPa4POiCX0/ObVY7MlKiTw7Gd
 Wi97wq68ylUZ5D+RhaJUQrjfxbM38yexnSw07IPm4MMHuVnC/Xk0dMtg9YwYi5uRoa
 2zlXEDKcphRBbhCj5wjnN/wWP9ahwD07icGunppaVoXEdpmxUaqkn5Uwru7n4qMxM7
 m3YJMdsOtIFKg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvP-00000000JdH-1Gpr; Tue, 12 Nov 2024 11:15:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 13/15] acpi/ghes: move offset calculus to a separate
 function
Date: Tue, 12 Nov 2024 11:14:57 +0100
Message-ID: <14ab5a5e0b26dfa07a8d4479a46889f0f86c14e2.1731406254.git.mchehab+huawei@kernel.org>
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
X-TUID: d/0d6IyXO4Wd

Currently, CPER address location is calculated as an offset of
the hardware_errors table. It is also badly named, as the
offset actually used is the address where the CPER data starts,
and not the beginning of the error source.

Move the logic which calculates such offset to a separate
function, in preparation for a patch that will be changing the
logic to calculate it from the HEST table.

While here, properly name the variable which stores the cper
address.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index cfe2f061c3eb..8df21bad1165 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -370,10 +370,37 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
+static void get_ghes_offsets(uint64_t ghes_addr,
+                             uint64_t *cper_addr,
+                             uint64_t *read_ack_register_addr)
+{
+    if (!ghes_addr) {
+        return;
+    }
+
+    /*
+     * non-HEST version supports only one source, so no need to change
+     * the start offset based on the source ID. Also, we can't validate
+     * the source ID, as it is stored inside the HEST table.
+     */
+
+    cpu_physical_memory_read(ghes_addr, cper_addr,
+                             sizeof(*cper_addr));
+
+    *cper_addr = le64_to_cpu(*cper_addr);
+
+    /*
+     * As the current version supports only one source, the ack offset is
+     * just sizeof(uint64_t).
+     */
+    *read_ack_register_addr = ghes_addr +
+			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
+}
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
-    uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
+    uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
     uint64_t start_addr;
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
@@ -395,18 +422,14 @@ void ghes_record_cper_errors(const void *cper, size_t len,
 
     start_addr += source_id * sizeof(uint64_t);
 
-    cpu_physical_memory_read(start_addr, &error_block_addr,
-                             sizeof(error_block_addr));
+    get_ghes_offsets(start_addr, &cper_addr, &read_ack_register_addr);
 
-    error_block_addr = le64_to_cpu(error_block_addr);
-    if (!error_block_addr) {
+    cper_addr = le64_to_cpu(cper_addr);
+    if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
         return;
     }
 
-    read_ack_register_addr = start_addr +
-                             ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
-
     cpu_physical_memory_read(read_ack_register_addr,
                              &read_ack_register, sizeof(read_ack_register));
 
@@ -427,7 +450,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
         &read_ack_register, sizeof(uint64_t));
 
     /* Write the generic error data entry into guest memory */
-    cpu_physical_memory_write(error_block_addr, cper, len);
+    cpu_physical_memory_write(cper_addr, cper, len);
 
     return;
 }
-- 
2.47.0

