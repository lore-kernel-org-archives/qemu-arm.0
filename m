Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4801912lfb;
        Tue, 7 Sep 2021 07:54:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgFmJXwEGN2YA82RjAr8+gkYDoj4WCoJv8KvAuWUbu+etJoyWdpkVMYtmR1dKlRMZGZr8k
X-Received: by 2002:a9f:3210:: with SMTP id x16mr8741488uad.135.1631026462226;
        Tue, 07 Sep 2021 07:54:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631026462; cv=none;
        d=google.com; s=arc-20160816;
        b=UQZjuBoEDXl6I5rm48b9e3Pda0xSBz6JnrslZl1I9IisUuNN7wXRsLtJDuCbXhAdts
         a07OZeNVlswyspyo4xytqMkz+5vqFqw9cPR0f72hXV9FiUmwlA2ymIb7fock2Ez+p6zQ
         AHG5Gu2zwI0BYzH1uGn4xu0NuSCq0t7vsYOA6r8wmYpOS6OSf1nsfdIiIQZtHs3ONAcy
         4DCBw8oEVrTTCrtZMqGtoe2LThBQtmDDWN5FWobLpimkBx0a+bRiGXpMWYKPbyjiq2Z+
         fkHV1L8RBurCuXEOnokjodU5Rjv7HRehO7jkmgf3M8y0B93qKunJuAemm2DR1+jWskR6
         o1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OLGp7hopxMxjiL+WVPqIcL/ZByxVrHa7OPuiADcU42w=;
        b=kjgMVz+hKNt2xY6dHpu1n9tXy1yi4r6TRmNn+k8dLbAf3LKCFk5ZqD6ODriYFYvJ5E
         txlD3pYwdC80bVGnuER0eniWGB13orsDr6gf6WmxG10jyUVAVBT5OTPctV3jjAEyxcU6
         IUTZDVvlDNJ3TxwTYGwjrb9CuJow5k1fbLDDgg20sHn0mrjc0pLY2qpDrNGCe14NHCIw
         FI94UN4+ap9EDk+9786xLLJ/zbeQmYlMZatcJ3IKWLMO4kKlEAawQvb8zqEk/Gnu0LvN
         BSdUgwZ/e/PH4q4zxsZomXYU52tehrLJhiYZm2jr5kaddNYC3ppL1KHsu8+X2FKs65Ge
         cl7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ERuazbZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19si3302997uab.95.2021.09.07.07.54.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 07:54:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ERuazbZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNcUP-0002GO-HK
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 10:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcOu-00068U-5L
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 10:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcOs-0008E6-Hy
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 10:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLGp7hopxMxjiL+WVPqIcL/ZByxVrHa7OPuiADcU42w=;
 b=ERuazbZULPeqrdl+NCBCddD6e27GYSbbOWAwawArMM/ElSVz2wyvZPGd7izAMxiiSMO3A6
 zfDz1hSylkfPsPoSuvyx/oxg3dcn2bHtf25xcX9fcS8JSd9gsiMuVHYAhD/DOrMbvMxS3B
 zkTwjB+LCcm7af2Q1KS0pO9wClAvK+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-fvQgAKT0Or6ahsrNr2LWeQ-1; Tue, 07 Sep 2021 10:48:36 -0400
X-MC-Unique: fvQgAKT0Or6ahsrNr2LWeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1E08107ACC7;
 Tue,  7 Sep 2021 14:48:35 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D99C75D9CA;
 Tue,  7 Sep 2021 14:48:31 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/35] acpi: acpi_build_hest: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Tue,  7 Sep 2021 10:47:46 -0400
Message-Id: <20210907144814.741785-8-imammedo@redhat.com>
In-Reply-To: <20210907144814.741785-1-imammedo@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 eauger@redhat.com, qemu-arm@nongnu.org, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8dGMOKEwI4ep

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>
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

