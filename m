Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp373736ejc;
        Tue, 5 Mar 2024 07:58:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5SWgQjRGZCwZ/CTe59HnKNvEZ5lD/prkgCHUeYcHRCFX3mUu5YvByVdaGYonRdkRincLbShkVHUNYzJCvq+pCsJzifzwT
X-Google-Smtp-Source: AGHT+IFH8S9cI1WSmdksFOGf2Pj2Nr2tTJgR8oe27d5d/KC0+CyhnuvyOcEJ2RVcGrLd22BBt8u2
X-Received: by 2002:ae9:e648:0:b0:788:2f92:7041 with SMTP id x8-20020ae9e648000000b007882f927041mr2285736qkl.41.1709654293541;
        Tue, 05 Mar 2024 07:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709654293; cv=none;
        d=google.com; s=arc-20160816;
        b=vyjl4iW6JHnovFfCtm3ufKRybDS/DlVOknGC5kCHkfJ703vgRrnJGCmmlzyYqgFYgS
         Bh05pfe5Hxux8OX3fE0RwIFPIcGMscUeJj8WQrvuhFg2R1sG5S5H237cGg4+ubj1lyOZ
         2CGfmmSjJ6dgWCo9yxr80ceG5Q30ZXE4EZUVR4tcxXKXSs8Pr+rTcr9XiM3gFKlHrEYy
         5OEBsRp24gnDeqRqy+VYmbG7FPJLlgkkQiRHAu6LBu+jhDwm0JbrFGvOTg69KElp4dM/
         KUiB2UJVEqaGzWNsnvIieRu6BJWNgwrwVeThHpxgwZwkIRWlqSnvLMvgJs2IsWzw2yy2
         qKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zrOfTp4lXNJjHFK37vxizV4ejdSxQomjIbB/lBZGO04=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=c6lKVMLOvseiNvrRhdomw/L0sEQPCYZxq7ygJa27b4C8fnEeKgkONSmy68YL7uhhIE
         glu/HagWrW+KGx5ZAZ43MqOctpDE/Jn7Zppzn5BaDB8m5AGqFP8VvtFHqAhRCkB0Byc4
         I51JEjsP4HyqvvGpbFyDyw1dY0Yr4BdbHG47/Xm+iVV4nWDb+YJx8Xhaagc2d4xyMYG/
         RJ899nHHvGXAhsaETVoHapZdMg9vzmu99rhGCck/XFX4canihoTMDuTyS69RsfLxjsQJ
         w/UeyAwXWza/SheZe2o0jBICV46TeDel4zb9hF3zpwf0x47Qzf69K+FbODP5cKrh51HH
         EU6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GwZ4l99D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020a37ef02000000b00787889ded5asi12657473qkk.297.2024.03.05.07.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 07:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GwZ4l99D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhXAq-0005Qm-Ag; Tue, 05 Mar 2024 10:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXAj-0005Oz-Id
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 10:57:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXAh-0000R6-P0
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 10:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709654259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrOfTp4lXNJjHFK37vxizV4ejdSxQomjIbB/lBZGO04=;
 b=GwZ4l99Ds9OWnDSuf2/BgLE4OqL28X3Sow6C1GQhxer6QmDmPH228pmB+cSb9cBwJAmYYT
 Cp1Dmxm7ImElxfaiCPcGcLGwQJquDmrCjKWNYV95UrsGyU/DOj0irmBuTFwIfhARbjK+l+
 J8pDtXnMMsIvP1m8sfgBY4206x+C+qc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-60-oQGKRgvbPo-YZFrmbqjgCA-1; Tue,
 05 Mar 2024 10:57:35 -0500
X-MC-Unique: oQGKRgvbPo-YZFrmbqjgCA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CAE12800C33;
 Tue,  5 Mar 2024 15:57:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDE0E17A96;
 Tue,  5 Mar 2024 15:57:31 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH v2 01/20] tests: smbios: make it possible to write SMBIOS only
 test
Date: Tue,  5 Mar 2024 16:57:05 +0100
Message-Id: <20240305155724.2047069-2-imammedo@redhat.com>
In-Reply-To: <20240305155724.2047069-1-imammedo@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: oOyqvo8YHOYU

Cureently it not possible to run SMBIOS test without ACPI one,
which gets into the way when testing ACPI-less configs.

Extract SMBIOS testing into separate routines that could also
be run without ACPI dependency and use that for testing SMBIOS.

As the 1st user add "acpi/piix4/smbios-options" test case.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Tested-by: Fiona Ebner <f.ebner@proxmox.com>
---
 tests/qtest/bios-tables-test.c | 47 +++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 21811a1ab5..b2992bafa8 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -858,16 +858,8 @@ static void test_vm_prepare(const char *params, test_data *data)
     g_free(args);
 }
 
-static void process_acpi_tables_noexit(test_data *data)
+static void process_smbios_tables_noexit(test_data *data)
 {
-    test_acpi_load_tables(data);
-
-    if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
-        dump_aml_files(data, true);
-    } else {
-        test_acpi_asl(data);
-    }
-
     /*
      * TODO: make SMBIOS tests work with UEFI firmware,
      * Bug on uefi-test-tools to provide entry point:
@@ -879,6 +871,27 @@ static void process_acpi_tables_noexit(test_data *data)
     }
 }
 
+static void test_smbios(const char *params, test_data *data)
+{
+    test_vm_prepare(params, data);
+    boot_sector_test(data->qts);
+    process_smbios_tables_noexit(data);
+    qtest_quit(data->qts);
+}
+
+static void process_acpi_tables_noexit(test_data *data)
+{
+    test_acpi_load_tables(data);
+
+    if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
+        dump_aml_files(data, true);
+    } else {
+        test_acpi_asl(data);
+    }
+
+    process_smbios_tables_noexit(data);
+}
+
 static void process_acpi_tables(test_data *data)
 {
     process_acpi_tables_noexit(data);
@@ -2064,6 +2077,20 @@ static void test_acpi_q35_pvpanic_isa(void)
     free_test_data(&data);
 }
 
+static void test_acpi_pc_smbios_options(void)
+{
+    uint8_t req_type11[] = { 11 };
+    test_data data = {
+        .machine = MACHINE_PC,
+        .variant = ".pc_smbios_options",
+        .required_struct_types = req_type11,
+        .required_struct_types_len = ARRAY_SIZE(req_type11),
+    };
+
+    test_smbios("-smbios type=11,value=TEST", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -2215,6 +2242,8 @@ int main(int argc, char *argv[])
 #ifdef CONFIG_POSIX
             qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
 #endif
+            qtest_add_func("acpi/piix4/smbios-options",
+                           test_acpi_pc_smbios_options);
         }
         if (qtest_has_machine(MACHINE_Q35)) {
             qtest_add_func("acpi/q35", test_acpi_q35_tcg);
-- 
2.39.3

