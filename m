Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1178649lfp;
        Fri, 24 Sep 2021 05:46:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo7PW2j6v1ovj063OWw09OvwgtXU2amp1+deIuwhZHPMVAsM06beB4OQ4Uq8UP5KtRCWod
X-Received: by 2002:a37:6841:: with SMTP id d62mr10169717qkc.107.1632487604138;
        Fri, 24 Sep 2021 05:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632487604; cv=none;
        d=google.com; s=arc-20160816;
        b=iAtgl6mn1vKZlyoZVmI2Jz0dsURs6OVj90j1vRmo4C9bv3T4HsmRHcgcBuvM16/Hn4
         zBr/OOBlg9eNUrQHisrSa/RPwaQp3076BugDOgoOoQBJ7yk0sURNhLqxyZXIEzaTqouL
         FHe/myMAtZhEnEAY6x4OtMuseKkp44q32VRGe/VcK5wbr7HysK1/CQQ5Cn5QXQKHUMdD
         hhQcHzBpbYr10LhkBlnUGuSg7tfhRCsVnUl0NTrW+xY3yhLdBUTbR3g5tYAVjNovVzwF
         DAiOVlNy/GQiSxaifegLpyq5bAw9OkvSEh19RrYclCrYthpYp4xpP0PEHAmszuMJUnTx
         AxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sqC8lVipO4KcUTb9GNFBCdcHaCNUXEYaJuFSwdOzT78=;
        b=qidbbdTe+R7iyf2nwuBk/9k25M1GzVJChWDwlqEhqFRIiGNCE9aXJuTZFpRAoWzQZJ
         k/nUbewCgFVqx1yDpqE95mmMz1fAe+8Pk+uaF2E4hpGl8kkol60S4m1X5xdwbySMH70x
         kJU5qMTk8t3pl1ex5YabII1VtbpOWSIIRtMZuIIZvzCZIPvH8HEIqRK9SMpz3eTFO6qH
         DtyLYl44CSThIsXXgFnsJtfMbyG79zMZqd4/p4RDYPr/ZXiIJ+MaMjren0b1K/ALDykO
         iRq00db5+oZoYtMs1mQUymiL1KEoGu/fn07pWw5gdOSS0NsuIRGjDSbXFyv2tn4/DuPV
         bOXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SZ0t85FV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19si4016020qkp.403.2021.09.24.05.46.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Sep 2021 05:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SZ0t85FV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTkbD-0000Uz-Gm
	for alex.bennee@linaro.org; Fri, 24 Sep 2021 08:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkJg-0004v7-Na
 for qemu-arm@nongnu.org; Fri, 24 Sep 2021 08:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkJe-0001BA-6b
 for qemu-arm@nongnu.org; Fri, 24 Sep 2021 08:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqC8lVipO4KcUTb9GNFBCdcHaCNUXEYaJuFSwdOzT78=;
 b=SZ0t85FVIqVqkl8pT4TY81XrwlDrNJ6E3157IKPcMaaQ6KD2Ndb2NjcK0taal09MS5+sCD
 iXJT79tIBKDneE7Rg1z6eccSFG6oQMzlLsvu7o3oPgqSj6Ooj+d/C2nG5KRY//RbTnzHJE
 kDW4mjR90z5wzlhsxe3o4RwORrUBZb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-DT1N9TCYNE2uLh3vwKNKAw-1; Fri, 24 Sep 2021 08:28:32 -0400
X-MC-Unique: DT1N9TCYNE2uLh3vwKNKAw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75F67101F001;
 Fri, 24 Sep 2021 12:28:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9F8E62465;
 Fri, 24 Sep 2021 12:28:29 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/35] acpi: acpi_build_hest: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Fri, 24 Sep 2021 08:27:34 -0400
Message-Id: <20210924122802.1455362-8-imammedo@redhat.com>
In-Reply-To: <20210924122802.1455362-1-imammedo@redhat.com>
References: <20210924122802.1455362-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, Dongjiu Geng <gengdongjiu1@gmail.com>, mst@redhat.com,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, eauger@redhat.com,
 ani@anisinha.ca
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y/u5G/b8B29V

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
CC: gengdongjiu1@gmail.com
CC: eauger@redhat.com
---
 hw/acpi/ghes.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a749b84d62..45d9a809cc 100644
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
+    acpi_table_begin(&table, table_data);
 
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
-
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
 
-    build_header(linker, table_data, (void *)(table_data->data + hest_start),
-                 "HEST", table_data->len - hest_start, 1, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
-- 
2.27.0

