Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1332127lfg;
        Fri, 25 Jun 2021 02:28:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyW7VivptmUv7B4J17lfTp+0JRn7nssmjHFKUpIhmhZdTYdobunPKYLZnxx2vGGI4fGEa4
X-Received: by 2002:a05:6214:5088:: with SMTP id kk8mr10096512qvb.44.1624613299323;
        Fri, 25 Jun 2021 02:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624613299; cv=none;
        d=google.com; s=arc-20160816;
        b=ENYmW/MX9U0N6oohwWrujzMra2dbD4Z98yAmKtfg/Rvxq/RqmUcIQTjEhqYHuvAwp4
         ZQ9aHGLSLJzTk5qZmG9ME903lNanEPM5fDpHhLYvwXvU5A3OmQZX3MrnaobF+HjPH6qW
         JXwDtxFcLwJ6hKvUn+hdyZSTdsJSsylQGUakSnamFTNNfxvpxPTV3ywQUedJpDzA3Ze7
         egWKf5YgDzoRv4Cr0UHRgQVNMXZLfvKx4/iWBzqyYWp7N5p2loNIB8M7YXpzByv+AyYL
         cPbbTlCUlDNyTpioLWjxuyMbtVNzAB5mJDKUH5kdxQrtgwiCHFJj22xfCoK0GBNC7l0g
         eyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=05jlEzkWbbXZ5+MpowXguATHrb3hbuUhdsBfWDmCpU0=;
        b=Txi1SzMaJFtE9LoVjm2pWU1JqEdxVQ4zkY2fG9RORnvD0oDng9FrJjmL9PkyFt9+2+
         jb4GRxW16MfkDxPsi88cT7SL6HM1HpDnsfUTq9W2Fc9ZnUr0cEmdsAKacfpYEIwoXp40
         hwJ/zv8a53yGh1tNI6lS1s21IcHsWqiursEoA1cpOny6jEAkAB+gVUQMSEefEQoT2sQE
         rWV44zRmbmd8a1n5YLhOczt9rUKdIE+iQXFB/3I0wOxScWS3x1a4qzNL9sLeYWgvATWj
         VOj27JTDztlHWVSrWWXwMoe4plO/D2DsRFdPVUtXHMYfYo0HdDP6QbPdE5PQVd0Dajj4
         8P0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JlWnh29C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si2619314qvf.160.2021.06.25.02.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 02:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JlWnh29C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwi8I-0006at-LE
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 05:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzM-0002DG-C2
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 05:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzE-0006hw-Ay
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 05:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05jlEzkWbbXZ5+MpowXguATHrb3hbuUhdsBfWDmCpU0=;
 b=JlWnh29C3CcQViPoBF5IAkUUMLmuOwraMQGvdZU6eOlyhciu2iCUbbx3rBNbDn6ZVLWU94
 /V4FsUJ/WGnEbTvlx4Cl41kmgicdvuNTFEIXD7JEOd05N3C7B1Oc7+m0bEPgfgQ9o5P9dY
 mi6DdsSHN1sVEJ0oEt4b36wARYcGyDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-KODAw4oKPPqCsV839mTNzQ-1; Fri, 25 Jun 2021 05:18:52 -0400
X-MC-Unique: KODAw4oKPPqCsV839mTNzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3CFE81C6D9;
 Fri, 25 Jun 2021 09:18:51 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6578260C05;
 Fri, 25 Jun 2021 09:18:50 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/53] tests: acpi: arm/virt: use kvm to test IORT table
Date: Fri, 25 Jun 2021 05:17:39 -0400
Message-Id: <20210625091818.1047980-16-imammedo@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-arm@nongnu.org,
 drjones@redhat.com, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uudtwY4/8h1Q

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 - v2: switch to qtest_has_accel() API

CC: thuth@redhat.com
CC: lvivier@redhat.com
CC: drjones@redhat.com
CC: qemu-arm@nongnu.org
---
 tests/qtest/bios-tables-test.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 7084f0f795..ebe8ec0850 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1423,6 +1423,22 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_virt_iort(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    data.variant = ".iort";
+    test_acpi_one("-cpu host", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1595,6 +1611,9 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
         qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
         qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        if (has_kvm) {
+            qtest_add_func("acpi/virt/iort", test_acpi_virt_iort);
+        }
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.27.0

