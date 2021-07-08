Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp481389lfg;
        Thu, 8 Jul 2021 09:26:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXD+dFweQ5P5Xvr09avXiVdfZVO8f130lZnFlSmKEeozctcejrRscTN58zm71qb6d67caC
X-Received: by 2002:a05:6402:3514:: with SMTP id b20mr20416924edd.187.1625761619451;
        Thu, 08 Jul 2021 09:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625761619; cv=none;
        d=google.com; s=arc-20160816;
        b=xIU12Kda/dhGTbokWsB3MS3z9PFiodwhkl35XYGXPyponbA2lWhsdxXvi1bHfVBHjb
         Jdr7RVZ0cEHmdpb6dxbuvqvVmb0PwhLUSIwxrkjEegEjNJCMCqzXtaHruBTqg9i7faOr
         BPICRfYhHgH51f0ZeQoqlIrwj64AZmyH9hY7HNUi0b1n0S6gMFxxKThF3kU89PEk5KTG
         pSfKb7as4k9aD0kjTM2R4mgeCHgAfEpt1jNxmMrY9BUmY7hiFN2L0D20mow3eQK714ci
         XZMspmz9SAWwaTVbdugAiBhjP2Tte1iLtT5CVM9SPYr7uRPUQTSoUu8FVYn2IF+Zxxf7
         4w3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cs4SQhoJiThzWTGE6SuhYKhtPcpHgrFksX3hz6OwFt4=;
        b=xiPFSA4UNCcA0cHnQzBOYTeWvGxjy0S3GgenuIlPPdyQUnYM2Iy/QcX+wVEpAayWxv
         mdSrnPiV7OVL0l9z2JHD/43a7xcfvsIwbMRUw2YcRR1PJf/0TRT8F8piU6sC6foK0NDL
         iF3N9ZZkTxWBjO8T5YurWt/JjFWpmFvKnyeHm+3W54GsxD+hB5ScfoOkxVdCb19bc5Or
         Lm2bQ6A3cvm6fg+uYkF7PK/Golnue+AOqfpl7U8kcTQMYo5Nq+NuCS1Np7XIk4DiQX/k
         ws0wuEcDPj4ll9RMm59gs7yijRTetBNReaOhKPnpHskUOwakc8LaE8bKSDA/5xcf0P8X
         E3Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K9TEPd2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dg25si3562656edb.28.2021.07.08.09.26.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 09:26:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K9TEPd2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1Wra-0002sg-Jh
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 12:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEd-0001dB-PN
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 11:46:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEa-0000NC-8w
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 11:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cs4SQhoJiThzWTGE6SuhYKhtPcpHgrFksX3hz6OwFt4=;
 b=K9TEPd2W9Snx0cu2v160aMAI2PYAtOmYN5PbSF6D9K9ony7M7udyNwcqAYsH1C9Mv0U+Q+
 UIo9QLKYtecKQ9UxCcvWaHJdl5C54eqt8YMWRYL4J89Jwn9c/7o9S4bipC7oiLTfJOC0Md
 Bc9R0KANjOjpVx6iX7u993+KWwImugE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-fIWp94v9MBKAccY-hhJqzg-1; Thu, 08 Jul 2021 11:46:36 -0400
X-MC-Unique: fIWp94v9MBKAccY-hhJqzg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E698362F8;
 Thu,  8 Jul 2021 15:46:35 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7227419C66;
 Thu,  8 Jul 2021 15:46:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/35] acpi: acpi_build_hest: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Thu,  8 Jul 2021 11:45:49 -0400
Message-Id: <20210708154617.1538485-8-imammedo@redhat.com>
In-Reply-To: <20210708154617.1538485-1-imammedo@redhat.com>
References: <20210708154617.1538485-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: drjones@redhat.com, Dongjiu Geng <gengdongjiu1@gmail.com>,
 qemu-arm@nongnu.org, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FdDTwkJ5+rOt

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
CC: gengdongjiu1@gmail.com
---
 hw/acpi/ghes.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a749b84d62..bf58600a80 100644
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

