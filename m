Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5378622njc;
        Fri, 22 Nov 2024 05:14:31 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVQnSemO1ucGFZYh2kgwk/0+iBz+DlKqywVI0e+XBhYf/fT0ihZnL/6zTBMeKQv1kiOU6Qh8Gc5hfRW6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGQsueLeh+nVfi/i7Sw2/h4eHh2P7zDVtbCr9QM/hngRndfG38r9kjCB4DTB0mUZZBkrpMs
X-Received: by 2002:a9d:6e81:0:b0:718:162e:7712 with SMTP id 46e09a7af769-71c04ba43f8mr2894208a34.14.1732281271113;
        Fri, 22 Nov 2024 05:14:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732281271; cv=pass;
        d=google.com; s=arc-20240605;
        b=VpEW6KezWKtwz0C8W47+oUubZ9Fpd6JqRoRP6AKSPVw8KO8tkZtPdIvGGIht+K3Xqz
         P6NMNAXCJkUw/q95C56+519PT1UFoOucf2FaJgr/SCbA+t8zZmHP8aX+k2aFNunzqrT/
         /UqjL9IrjGekE6A3M62Xw0SWAEMpO9kYSj626R9hBJnIqSmW7pRpL0y78jfshgEDrN04
         YHkp0FwLnZTKb9PL6JK+pejBTBiSMvn8FgFBZccBgCEme0+i6Sjw4kqL0G4dNb4N6/zP
         sLkkj7KyiT/DIEJhehzqWs4hUSSIL4TB+UqbH3ylySxrFexZvoVvXztAM+YPV7v6qcOS
         7Wbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=4JSXOe+y1Vdri6tNtwbhm/K7KU5BPkcoUlAIf0du5ug=;
        fh=/A1Jk9ewZ81/NwMlhJJbmsFJMBNnZp0hdN4unxYVqf0=;
        b=SjOAMVWkt38iBS2lRJG1qcTk1lxBX6ckyEe4DRn2o8d223GefRzdc2dzMuJqWEvAdD
         dEptk1Q4oBF1ZWu48J9Ym+Ry0AAseRhRPzkPuNixHuWYxX1+fjnsfpU5/ACuCeP/j/Qo
         MIM2+MUEYsO5rgxWY84AU/v6/Zcu44CigU4783whuM/jr6yrtXwKP/WQfKDdnJ03OhQ/
         G0AgKv69/eJcPZn5y8pk+PgzHSw+Md5zQhXRuAv3th2aNF1eOSS9lRip+GWZvlPumh1p
         s3NjlJvDVNMrR6Er4QGLNQwwTqUoddcGGp/mBjLfK8iFQqkMwZUq2NfN5RHJhLFGFuvl
         59+g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FzIRhSZ2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-418265-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-418265-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-418265-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 46e09a7af769-71c0385c171si998629a34.324.2024.11.22.05.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:14:31 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-418265-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FzIRhSZ2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-418265-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-418265-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AEDE282599
	for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 13:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9BA1DF257;
	Fri, 22 Nov 2024 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzIRhSZ2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9E21DEFC8
	for <linux-kernel@vger.kernel.org>; Fri, 22 Nov 2024 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732281264; cv=none; b=HMTBoBYtztNbZWZLP9Ln19nH670dCOQmolqECEsn7YjYmzyftUCcGx/XqXoCRFi7CkGzpv2ToWpBoNA3TgsmVWn4M/FPu018QsrXG4Y0eHwwbtGk2U1o6M++vpXSGiuI1tQCm+KOBzsX2dPZtvyQOw8NFAUjetRANVHHuusOaPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732281264; c=relaxed/simple;
	bh=doZIE/N48jfI+gtG9UrfyFhDLPR7ZyHz+PuyPm64C0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rH43tQ2iVXCuZsfYbzPqLNQTGgvF36Ont1p9dIL6XZKW14DM6KA2o7JUaGMiHkaR/v/3g/Ew3qAumV0xHxiw9wGGvJM52nRe1aeSWmGFZzAid9rS6aqD5Xr8gNUgLU0G7J4Zhn3dZPeqQHeDVfLRvjw6rKZ19mm49IOTeL37et8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzIRhSZ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131DEC4CECE;
	Fri, 22 Nov 2024 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732281264;
	bh=doZIE/N48jfI+gtG9UrfyFhDLPR7ZyHz+PuyPm64C0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FzIRhSZ2GD29EOUyT1QbOegmc4UjN5oXmh+UOOL+z3qjMRkPyVwydl5ukf5c4LqtM
	 jCwH7Y9NvUVrtMoSw9IafY+9lQYc2/xYwHAyuCOJxSFuGrmJojM7mLMvFKSob3xvZR
	 K6PuN2rZodulcNDJHmmX+zKX84RC6HXjM4fCSC7UtSzzHkibkXkXdlNnm5ZV2FQpNM
	 rhs7oLi3WC4bnuBxAySAA+t86ZPs7yWEzBA1dzAsw9J0dKyyWvzcZVRnCB2nW/uHW/
	 f67vKpq53Gy5zqt4AInthKSyZ7EaYbhi42wZfclUL4jbwpzz90De3yMVKjml9UXhoa
	 lplbUKrIIYANg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tETUM-00000006v9l-0Dol;
	Fri, 22 Nov 2024 14:14:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] acpi/ghes: add a firmware file with HEST address
Date: Fri, 22 Nov 2024 14:14:12 +0100
Message-ID: <c230d36bc1de146c6891035893f035912d7ddc62.1732281080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732281080.git.mchehab+huawei@kernel.org>
References: <cover.1732281080.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: U4/6Hf7fonRK

Store HEST table address at GPA, placing its content at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---

Change from v8:
- hest_addr_lr is now pointing to the error source size and data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 17 ++++++++++++++++-
 include/hw/acpi/ghes.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 8c7d0d5cdb0c..680cada0e487 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -30,6 +30,7 @@
 
 #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
 #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
+#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -261,7 +262,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
     }
 
     /*
-     * tell firmware to write hardware_errors GPA into
+     * Tell firmware to write hardware_errors GPA into
      * hardware_errors_addr fw_cfg, once the former has been initialized.
      */
     bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
@@ -355,6 +356,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 
     acpi_table_begin(&table, table_data);
 
+    int hest_offset = table_data->len;
+
     /* Error Source Count */
     build_append_int_noprefix(table_data, num_sources, 4);
     for (i = 0; i < num_sources; i++) {
@@ -362,6 +365,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
     }
 
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
@@ -375,6 +387,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
+    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+
     ags->present = true;
 }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 9f0120d0d596..237721fec0a2 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -58,6 +58,7 @@ enum AcpiGhesNotifyType {
 };
 
 typedef struct AcpiGhesState {
+    uint64_t hest_addr_le;
     uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
-- 
2.47.0

