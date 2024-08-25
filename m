Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp664277njb;
        Sat, 24 Aug 2024 20:47:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpAVa8dQIwryFSPwoK9oGc6zyHMfddaH61wdAu+xTUAUPaahlcjF67xGM3/1V7T89ntxXQYXD/SeSKNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH50Ganj51zLxtkG4Hen11UBsFvqoCysyea8D3DA2WXbHDJVvY8+5h2jrf9aunw1KtbnYIW
X-Received: by 2002:a05:622a:5c86:b0:451:d6d8:7da with SMTP id d75a77b69052e-455095e41a6mr87619671cf.2.1724557651465;
        Sat, 24 Aug 2024 20:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724557651; cv=none;
        d=google.com; s=arc-20160816;
        b=S7kOOgHraiiu1kLqpgsaLZNk2Bi7Okvt/nmhkKHNDaL/RIDdnvS70/JC5Hcv+P5EUL
         QDiUVryZmJISHNdeIQO5eHHFfXjQ1SgAN77gTsloox3xprQjhmtB56tLpmGs28jrRPNJ
         WS2tVsRZ4SBGgmJUTj7/+HrE3RiUWN6GbMq2cNpFxR1r9D/EoxdOoawDyrljGsiRH7I+
         M1i7YTC2Ugthp2MVcuam54pq9123mGGf+/rGbDri2QF+sRoP0bpwxCtnMIOWlwFxOY7A
         4qJwIWe9cv5OkMqw/d/ToCLWOQl4ArK74G9pzbkyAEDTNRuVZQu/QhA2g9XuK39KLrq7
         C2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KXkxlOnXQzOVYz63GT4mulG09K5HKEAcKYp74NCGqvk=;
        fh=ZYXDMGsPCeoYBpXjLOhd99rrzH2TFA3IUwvQduyTi64=;
        b=Y1OZr8tNpOfHkXh6iG08u0L1ZdotRuyxZuqpCxiHMgmgrxFKZWyGV2AL7rBHrgIQ/C
         KZJgaLD6CNap3+JAx4bb4AUanTxm2Er9gpNmQMaoO8DWDUGwm+uc0WATpYIpuhlBMZHc
         KugINJEyorblTd0/QtGQoO5azGHD+qRuFR96DhAkm+GSS5TSTNmKP0eVMK1+fQH767Au
         OTAysSg6WtMv4aSETrY0bc+qQuwCCoG46cIs2we9aDIBCaBd/icnBrkVZAHUW26BqKCJ
         fFT/WJBUUT7VSNGG3ispxtVBGOvAdBjQHYF5GqaCpLG45ZFci3JaOflLkG5mZX8gB8BT
         kcng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=gW03rqfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe1ad140si80531251cf.284.2024.08.24.20.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Aug 2024 20:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=gW03rqfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1si4Dl-0004wz-SJ; Sat, 24 Aug 2024 23:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab@kernel.org>)
 id 1si4Dk-0004qi-95; Sat, 24 Aug 2024 23:47:16 -0400
Received: from sin.source.kernel.org ([145.40.73.55])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab@kernel.org>)
 id 1si4Di-0004Uo-95; Sat, 24 Aug 2024 23:47:16 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2B8DFCE0A22;
 Sun, 25 Aug 2024 03:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D04AC32782;
 Sun, 25 Aug 2024 03:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724557630;
 bh=F0qnJx/PoKaPj30Cp4+WRbszXY9gXdj1bVnXeMrR5KA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gW03rqfEML2Znj0w0hqW61rYVmjAMZWBYQdMK0ilLgk/jN2slK0sXM59S+IzxRBhc
 mG48iDsun0/dUolEu42NSeihKRXbCsJKrFCWuelbhmS7KjY5mhOJbd02ZIKCUcHgD5
 JdPKOLE5kcZehyXWTcqAJV6XfXGwOQ4VOTyyLYl8YwY/C/IGSFIVXtd0JNiG/sWJrA
 yco3u3N3s9+uTTYRGX1WUySIjHaDLXIzKtGgX+XPknq60Pg4e5vBR3j0RjHhX13bUC
 E7mjcgQUvhkKlbkOzIKY2zW9dDpeBQkbuTePIsIH5k6Q5/zG0nTiK5JiwnaqkOX5YT
 MX5HxwVRu9fjg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab@kernel.org>) id 1si4Ch-00000001RMX-2AV0;
 Sun, 25 Aug 2024 05:46:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v9 01/12] acpi/ghes: add a firmware file with HEST address
Date: Sun, 25 Aug 2024 05:45:56 +0200
Message-ID: <34dd38395f29f57a19aef299bafdff9442830ed3.1724556967.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1724556967.git.mchehab+huawei@kernel.org>
References: <cover.1724556967.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.73.55; envelope-from=mchehab@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3aI50TSQWRni

Store HEST table address at GPA, placing its content at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---

Change from v8:
- hest_addr_lr is now pointing to the error source size and data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 15 +++++++++++++++
 include/hw/acpi/ghes.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e9511d9b8f71..529c14e3289f 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -30,6 +30,7 @@
 
 #define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
 #define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
+#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -367,11 +368,22 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
 
     acpi_table_begin(&table, table_data);
 
+    int hest_offset = table_data->len;
+
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
 
     acpi_table_end(linker, &table);
+
+    /*
+     * tell firmware to write into GPA the address of HEST via fw_cfg,
+     * once initialized.
+     */
+    bios_linker_loader_write_pointer(linker,
+                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                     sizeof(uint64_t),
+                                     ACPI_BUILD_TABLE_FILE, hest_offset);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -385,6 +397,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
 
+    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+
     ags->present = true;
 }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e905..28b956acb19a 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -63,6 +63,7 @@ enum {
 };
 
 typedef struct AcpiGhesState {
+    uint64_t hest_addr_le;
     uint64_t ghes_addr_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
-- 
2.46.0

