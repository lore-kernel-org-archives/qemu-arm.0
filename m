Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp374221ejc;
        Tue, 5 Mar 2024 07:59:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/FqnEkb5cl1QQ4f4yV0Om6UPkG1vPp0zOF3i7hZ1dFpHTb+U7uZPEHCsZfisw1dAGruJLIK08gwIqLwbK8RSQl1V0JpC1
X-Google-Smtp-Source: AGHT+IE5A2a2SAkvPcn5P4EQNSfQDJD3GTrm2dHiUyIUXK4Eu8RgwbAdnNsVTK6u4clp6Lw3jbCb
X-Received: by 2002:ac8:5c88:0:b0:42e:f580:39fa with SMTP id r8-20020ac85c88000000b0042ef58039famr2527012qta.56.1709654345620;
        Tue, 05 Mar 2024 07:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709654345; cv=none;
        d=google.com; s=arc-20160816;
        b=YuECBLwtXqFl+BDy5TtVYxjq6+2fDpl/bh5n9ELF1Uvp4eiY6qHum7VPW5N/im2NWO
         UdxYLGCce+AMpFlCppgf0EH24ZvECnCgy3qhIZUR5XbgeZv/HAO184bOAT605u9SWg4x
         4zoJ1p/c9wE8uAOJe3OHePAH/lTSAxKOdWSltRviNwU753FZh0sZGEkSik+E/eUfhlu3
         boEhTFIaGoY+lEiLjzLQp7O5upUlIaPjthURBtP2c+L4W1OyihLylgvRwLqyHyvPrLyQ
         YwDFw8d7yZmVwFXsCFwfLg9qAE9R3032UsqKEaVoMe04vSsad7byF1HGWWC++50Q6Q0K
         Tzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mEysAxw1rtqLbi7QK6dBGnD+kHUMmHQF+OEuJnW7U90=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=qv5r9nHRVSwPusby1X5YGgVZxKhgSoliDU/tD/K6vZ7IRHXrlsnP6R0mYZ5BNgF7Wp
         idu7msiitKNsKXZNd3yeecK/jr6meRuPFIRlvEL306G88TyzugYIoV0DoBU00ls2mITh
         4JbblKlsMJlCu5gegqgrhTQDCG7SOrgzt9rkmmMRwg8boZho88Cp5RnyXbltNLgdpZ+e
         cnKWh6jTYhvVChatUkULOYrKhlToCPVZ5LYVCC3XFpi/rc4ta2XjBSrX80sJSovMEbzV
         41/iunYX4sfxk5814eiBPxZyU9wCRQC7idXhILiGQODJNurF6t0T77cWcYmRhTj02WaF
         oK9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KVcqkBwu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020ac85890000000b0042ef6173d39si3959405qta.350.2024.03.05.07.59.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 07:59:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KVcqkBwu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhXAs-0005TY-Px; Tue, 05 Mar 2024 10:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXAq-0005R3-BU
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 10:57:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXAo-0000U0-EY
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 10:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709654265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEysAxw1rtqLbi7QK6dBGnD+kHUMmHQF+OEuJnW7U90=;
 b=KVcqkBwu1O1bHTc91pZom7ICdQHOoxXQD9GnOFeiCAsXbacYlYo/gbRvYsaFBOXuF62tVx
 RLUZceaodNaSPb+bSvbPqjeXxQECDJfnsmFr0ymSjx8yJuDe5+eQ1jRLA6jOEDBjAOssQv
 XOhDPMXOudMzNMrJi2Z9/evJB+2swx8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-507-SoXpxkEONje_yq0ctHe9HQ-1; Tue,
 05 Mar 2024 10:57:40 -0500
X-MC-Unique: SoXpxkEONje_yq0ctHe9HQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF36E1C01E8C;
 Tue,  5 Mar 2024 15:57:39 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BD8717A8E;
 Tue,  5 Mar 2024 15:57:37 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH v2 03/20] tests: smbios: add test for legacy mode CLI options
Date: Tue,  5 Mar 2024 16:57:07 +0100
Message-Id: <20240305155724.2047069-4-imammedo@redhat.com>
In-Reply-To: <20240305155724.2047069-1-imammedo@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: a61UDzgb4WVn

Unfortunately having 2.0 machine type deprecated is not enough
to get rid of legacy SMBIOS handling since 'isapc' also uses
that and it's staying around.

Hence add test for CLI options handling to be sure that it
ain't broken during SMBIOS code refactoring.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Tested-by: Fiona Ebner <f.ebner@proxmox.com>
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

