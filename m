Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1338078lfg;
        Fri, 25 Jun 2021 02:37:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz95o2+iDiWxv8h7tzQtitGpHfqVS/wxW0Ol6gMIQHLGUrH104Be7+PhOZeG0eenmqbOs8E
X-Received: by 2002:ac8:6c6:: with SMTP id j6mr8549320qth.242.1624613837465;
        Fri, 25 Jun 2021 02:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624613837; cv=none;
        d=google.com; s=arc-20160816;
        b=FY1CcC8dIUo1dVhELfBGsPOkbyaty17Aqo7Iga/f6IKOih1iEBT+GkbcGPdhjBi7Nb
         pI/wOzJR03e+tqa4xS5g01oQODMAXMMt2cEjGthladxV0/vQbjD2iTxQF+jgdNq0HVNW
         KzLHcsOlIpzNEU7RSqNP9xJRsFIIt2TEKbXwzUXlo0C9NneVxXFHFt0xQYEk3wcvEWJm
         HLfEoswOX2umFdonjc1cXPQSk5Pd4BXrHgMNtLcY6axIxWKSnuQDLMHWAMAaEvdMDKSQ
         CHqONhVQFH34KIwW3zews2eW/1XBoKSO89D+e3DOTQO8mG/wzmZsrrj/GBc+GhHegtch
         UMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pKnSD+rWAD5M3ws7kmsxQAjLpDeIBrvcFGenep6TCio=;
        b=y2K19cElxZar/y43PK8eJEm1bbA4LFJQMJSV3d60eCyuWL1FjvXrpcN2CKD6D5eiYN
         ikKKBFoUNPPieiip2cRIMuXABOuK4GTQ1fJJO0TkTFRxOPi4BZ8lGgq1RivpM0FZGaIL
         1FNz/Nd55NOFyf2TfK1b0YPpVwe/d1BPKBx4VKDmaV7ZQV4g+gh9KkUyd4HKnGVUbLRx
         +ZXrseh4z638bvXWYVrTomiayzttxoWa7YSEi44ZzAMVZ8SCohkuBUIx6yoO2PAFcZ9k
         0+TtH3pRWRRJWgXtbKWS4LAY1sPLwC4PnRCZdCwj0u/5uxHUwL+52yqIdgxn4p7zMG4F
         dIkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CEwXvLms;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 59si4264112qtc.323.2021.06.25.02.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 02:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CEwXvLms;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwiGy-0000FA-SH
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 05:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhza-00030G-HN
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzY-0006vY-MG
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKnSD+rWAD5M3ws7kmsxQAjLpDeIBrvcFGenep6TCio=;
 b=CEwXvLmsT5d+l0RNEkdfn2gJLVTBNkhXiN82y70ThDcuiBl4fSofznoGSKWwCUjIOuT9kw
 vGtB73x7Hd1dd/3fZxXJYa9QW5px7BiKHp9+uXNIQsD360kJ0METOaLXXR62Rd9CfTFEcb
 RHEFCZ+V3Mocmd2KB4Xc5AMi/2rR7xA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-PBxu6FLBPRWi0fKLpxaf2Q-1; Fri, 25 Jun 2021 05:19:14 -0400
X-MC-Unique: PBxu6FLBPRWi0fKLpxaf2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 949C710199A0;
 Fri, 25 Jun 2021 09:19:13 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C58960C05;
 Fri, 25 Jun 2021 09:19:12 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/53] acpi: acpi_build_hest: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Fri, 25 Jun 2021 05:17:50 -0400
Message-Id: <20210625091818.1047980-27-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: gengdongjiu1@gmail.com, drjones@redhat.com, qemu-arm@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jh66GkOhukmT

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
CC: gengdongjiu1@gmail.com
---
 hw/acpi/ghes.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a4dac6bf15..ae577c08e4 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -362,18 +362,16 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
 void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
                      const char *oem_id, const char *oem_table_id)
 {
-    uint64_t hest_start = table_data->len;
+    AcpiTable table = { .sig = "HEST", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    /* Hardware Error Source Table header*/
-    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    acpi_init_table(&table, table_data);
 
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
-
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
 
-    build_header(linker, table_data, (void *)(table_data->data + hest_start),
-                 "HEST", table_data->len - hest_start, 1, oem_id, oem_table_id);
+    acpi_table_composed(linker, &table);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
-- 
2.27.0

