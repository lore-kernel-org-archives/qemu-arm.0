Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7224334njc;
        Tue, 12 Nov 2024 02:17:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7Hvurtk1N61+jsNmMRk+fAc2Q8Yjz1iorUUd41tMcrLdQZLkr8SuHKx6WU8GdrYiea6xolOHlRblxgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHUQjmyMnnWAhg3YVA501e9QT8IIxlsP9XsSeR1KWE31zszYzd7g0lLKSjgAZk7fDhB4WWy
X-Received: by 2002:ac8:5a10:0:b0:458:27f4:5e1f with SMTP id d75a77b69052e-4630932b289mr210089341cf.18.1731406620507;
        Tue, 12 Nov 2024 02:17:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731406620; cv=none;
        d=google.com; s=arc-20240605;
        b=UdB7ri34U0qaLnchSVjzERfrmv+GllWKvEo8tWYLwa0fW75/KV2yiFpi4IZ5y+Zbz6
         SK4mCdWK8DEqdDi1nN5bmlcSxzE+tRp5SeykdickQqBeaxwnABSfkT66ktzgAk8By/78
         AuRrD5IeJs3oE3NnQsRQix6dhQYrce7OKhP+dT22jafX89leRMHs7VyrpZxBJ/VbpSfW
         AleZUrv5kYpAoOxFTyzSBpgBOZ8Mv1lWNWEGj3dTedT5tgvFF4ju8q9sCww4U8FSuHCp
         BSnZPfrwW0lQ/zilSOhgi5k24cgEtCydK1dE9P5Sa22x0LPmH2xrP+/SkNhmoidtQGRl
         ETxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MkR0xtOrpqhy9Hby6YBG70EvYE5TfOIlpjLh5jfeujo=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=d8ernENKEJP7137KRELh6cYu79GVhq8o8F4kI/pCk36fVeWBmh8SCBi0LRVYom8LEO
         APLSLnUzp3YoR7aqNCg2nUVUuHHULnGuVvEPqHf7l4sv8wlPITHXkmhXvgn9F+0GsIG6
         Jrds7hTAdXBaQixxMG/J2gMh0Y/aSY0SRTmtBmgcnHELvcNSjM/9L1zLiJUPY/a5ziZr
         18sdLfsZk+m2kfs+LVG7OXNHZ5DPViDn8KCu0/1rAVRr5EFMRRuECIeu1/xRQHAQDoeK
         GD0Rc7xcSGuV9m1/XlXTZw6WQUI1HUhc7nvHlQgNGiM099Q0gD6B6omXsyrYsJmsanTm
         NM6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JIDRtVz7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff61b337si137223101cf.423.2024.11.12.02.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 02:17:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JIDRtVz7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAnvl-0004aV-7i; Tue, 12 Nov 2024 05:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvh-0004XR-7e; Tue, 12 Nov 2024 05:15:25 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvd-0008PI-5r; Tue, 12 Nov 2024 05:15:24 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D23025C557B;
 Tue, 12 Nov 2024 10:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA78EC4CED9;
 Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731406509;
 bh=Rm8/YOwpS5/VfvPDxD21i90x0Jl2eFjYHLxhwOR+Y1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JIDRtVz7GL7uskUODSyGPUBnhSJuSJ8nShHoJ7tzmNmBKInLczbwDRz3qGUCK7EXa
 +xK4BbfxD91B2PGH0oQA1svEWyBcU/FrSEnoAmc3oc09EkHfdzXYfPJ6HbQKaGGLLk
 wZa74+EAnwIeFhNcqlsyORILETAjYUWn6C5jBmRZBbqOGOLV0x3uLqh7InDDZTG30u
 xWOKprE9mSOzxRlMwYmetvjHlyVUu4/LMfSpuur78ptOpqoBEOVa/o//DlK7WwmYBx
 0XXwJQ751zXrDQsO1popKkW6fN7ECttOso79sfKtkXxHsg/gVNjzjygX5xz64WKiQR
 6+vAVH05p+3kw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvP-00000000JdC-1A8G; Tue, 12 Nov 2024 11:15:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 12/15] acpi/ghes: better name the offset of the hardware
 error firmware
Date: Tue, 12 Nov 2024 11:14:56 +0100
Message-ID: <3d141713af72f6717f5cd59bc238577aedb3d617.1731406254.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731406254.git.mchehab+huawei@kernel.org>
References: <cover.1731406254.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
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
X-TUID: w9tRNe1qpMOz

The hardware error firmware is where HEST error structures are
stored. Those can be GHESv2, but they can also be other types.

Better name the location of the hardware error.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 4 ++--
 hw/acpi/ghes.c                 | 4 ++--
 include/hw/acpi/ghes.h         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 663d9cb09380..17baf36132a8 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -364,7 +364,7 @@ static const VMStateDescription vmstate_ghes = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
+        VMSTATE_UINT64(hw_error_le, AcpiGhesState),
         VMSTATE_END_OF_LIST()
     },
 };
@@ -372,7 +372,7 @@ static const VMStateDescription vmstate_ghes = {
 static bool ghes_needed(void *opaque)
 {
     AcpiGedState *s = opaque;
-    return s->ghes_state.ghes_addr_le;
+    return s->ghes_state.hw_error_le;
 }
 
 static const VMStateDescription vmstate_ghes_state = {
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index f698951630e3..cfe2f061c3eb 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -365,7 +365,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
 
     /* Create a read-write fw_cfg file for Address */
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
+        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
     ags->present = true;
 }
@@ -391,7 +391,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    start_addr = le64_to_cpu(ags->ghes_addr_le);
+    start_addr = le64_to_cpu(ags->hw_error_le);
 
     start_addr += source_id * sizeof(uint64_t);
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index a35097d5207c..9a765edb27ef 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -65,7 +65,7 @@ enum {
 };
 
 typedef struct AcpiGhesState {
-    uint64_t ghes_addr_le;
+    uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
 
-- 
2.47.0

