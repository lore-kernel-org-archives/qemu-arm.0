Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2755569ejf;
        Tue, 27 Feb 2024 07:49:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfZGYU43BmLfJD9QT0mJgSKKJHmGxMdu6NuP37NaHZMdD5PE7+rUOClnGOyYhuh3qsVdQhq3WSJYsEEC21nAXxp9aSuiko
X-Google-Smtp-Source: AGHT+IGzB3XZE7CzE+w/pl4lBvXwx0d2AOxVs9qIBfg11wSBCuZ+FtVS1YQelU2t2kfja0T1an5i
X-Received: by 2002:a05:620a:1787:b0:787:a18d:72b0 with SMTP id ay7-20020a05620a178700b00787a18d72b0mr2668078qkb.20.1709048940048;
        Tue, 27 Feb 2024 07:49:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709048940; cv=none;
        d=google.com; s=arc-20160816;
        b=PqgMQQZzEvx0LbMLCvv8q2hJR3DIzsYKOVnzVevgsAzLkfcjfUX/DpKbTr+IwXGk9v
         NQlWwpVC2Ruh1zXNBAvXF320pHAy6IIp6Yo8wjfoDDb4l5cPHzw4nj3/qAnY+Qg4azwF
         BImPVQf5jI/1kU0JG8yU7dvmzT/hCeM0dgspXIrH5XXZ4y1hxOM9y3DZPrbCScaDVWn4
         Cqxde2IIlAr8q1odjkNghCxeOHERSoH3TLe4dTi6Dj82YyEr2MRF1wTVm1yPQczdXSde
         fgMUorg5h8NScGh94yu7LzGKtKgjaxbH+6aCd9ngC+46gnrdPplpoFvZ3vU3PGfYrfup
         rJEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JFOJUVRdNtzkyhJWiVfb1nhavyg0/7pyWLIP6eA0jdk=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=oYASGyt2UgPmk9WSH60lKSqvzI+hKsaaTrfdL95qf+5HXhjSjh6XjjRiA4K6GxT7j1
         o9PmVCfw/RrEGs43y26yrdNKTrUtNoWtGRBML6wyXovezaF37tcPEp3tCzQWdouRTPK2
         BQpvnj0BY1z4Ikro41+3/qZPU8nBBa4FLz3MNd8/OBQMeskb6BbeUnOprvh8CO0DTwOH
         cy0TfQCka+0vZipxaPfZy7oQAnNAYuX22qIZOzbKUaCJqZ5CV4F47/Pmpy/rduF67TKr
         ml9p3NArYx7WzTUQMoC+UIuphB0Lw+f5GgyF6LIYSLrmR9Up6Yc7WV0WDEKxjj0/Wm/d
         h3fA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AAsbz2KB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a05620a450a00b00787df54066esi2689318qkp.112.2024.02.27.07.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 07:49:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AAsbz2KB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rezgm-0005Wr-G3; Tue, 27 Feb 2024 10:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezgj-0005VQ-W8
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezge-0008Nj-Qm
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709048888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JFOJUVRdNtzkyhJWiVfb1nhavyg0/7pyWLIP6eA0jdk=;
 b=AAsbz2KBPGwCaa0tO/dymh92lz5xWks/Z7RU+bMJkUCO3HwA0HN5ewpzrRJvh1zxQYOc0S
 H6+z1WLB2tSqSVCT2QlZSEnK8LwOmBIuTVsnsFsLhqGvy09Q01ukYLU9kQGBsYkZG7IjL9
 37EZZVYY9+Y5OadXIkD3iTFgXdDtOD4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-8BqCI_jZMIaqyArdz5SJEA-1; Tue,
 27 Feb 2024 10:48:04 -0500
X-MC-Unique: 8BqCI_jZMIaqyArdz5SJEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBFFE1C0BA42;
 Tue, 27 Feb 2024 15:48:03 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 386C42166B5E;
 Tue, 27 Feb 2024 15:48:01 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH 03/19] tests: smbios: add test for legacy mode CLI options
Date: Tue, 27 Feb 2024 16:47:33 +0100
Message-Id: <20240227154749.1818189-4-imammedo@redhat.com>
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: afVqzxRHHJaY

Unfortunately having 2.0 machine type deprecated is not enough
to get rid of legacy SMBIOS handling since 'isapc' also uses
that and it's staying around.

Hence add test for CLI options handling to be sure that it
ain't broken during SMBIOS code refactoring.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/smbios/type11_blob.legacy | Bin 0 -> 10 bytes
 tests/qtest/bios-tables-test.c       |  17 +++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 tests/data/smbios/type11_blob.legacy

diff --git a/tests/data/smbios/type11_blob.legacy b/tests/data/smbios/type11_blob.legacy
new file mode 100644
index 0000000000000000000000000000000000000000..aef463aab903405958b0a85f85c5980671c08bee
GIT binary patch
literal 10
Rcmd;PW!S(N;u;*n000Tp0s;U4

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a116f88e1d..d1ff4db7a2 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2106,6 +2106,21 @@ static void test_acpi_pc_smbios_blob(void)
     free_test_data(&data);
 }
 
+static void test_acpi_isapc_smbios_legacy(void)
+{
+    uint8_t req_type11[] = { 1, 11 };
+    test_data data = {
+        .machine = "isapc",
+        .variant = ".pc_smbios_legacy",
+        .required_struct_types = req_type11,
+        .required_struct_types_len = ARRAY_SIZE(req_type11),
+    };
+
+    test_smbios("-smbios file=tests/data/smbios/type11_blob.legacy "
+                "-smbios type=1,family=TEST", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -2261,6 +2276,8 @@ int main(int argc, char *argv[])
                            test_acpi_pc_smbios_options);
             qtest_add_func("acpi/piix4/smbios-blob",
                            test_acpi_pc_smbios_blob);
+            qtest_add_func("acpi/piix4/smbios-legacy",
+                           test_acpi_isapc_smbios_legacy);
         }
         if (qtest_has_machine(MACHINE_Q35)) {
             qtest_add_func("acpi/q35", test_acpi_q35_tcg);
-- 
2.39.3

