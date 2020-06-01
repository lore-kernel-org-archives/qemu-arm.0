Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2965458lfc;
        Mon, 1 Jun 2020 03:22:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdH6W+HbIQv45TvIlPQB+nfYvFLhfO+TCtdWiCx9HBDveFPlWsuo/rW7Go/0ZR2kV8eDqB
X-Received: by 2002:a25:bcc5:: with SMTP id l5mr4527955ybm.480.1591006941863;
        Mon, 01 Jun 2020 03:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591006941; cv=none;
        d=google.com; s=arc-20160816;
        b=HFpzUKKSm+baidoHMch2wnzF50cRMpIBH5GTLPtrq69isWLrGaX8475W91m3E8nSU9
         sYQx9LZORR682sqgeGxu+jagR9XzwhB7AFqMPBkyvyRpNVxqIc18ZTd6131NEt7kR2Cw
         DU6B7s4Ub63BbJgV8O3q92XnQTrPuXUxd5HhJWLLiNsYCM5YFDbdCIqSOQ9h6Lgk6Vez
         6sLMDhLv+kAjtdBSv0TrfAXLWAS0ATVuPfmSW0L/DnufsqCWRt/Is+62//9AnxUdexax
         VEDeqt/XtBURGcQbDAmUbYvruUsSHKOIq5YA0Sytz41v324MSggmx0du+OMyJ6YQeSE1
         Nclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/NpTU5zlaOPP5faG9sGOrDhbPa5zzlwMZvrXG9/B+A8=;
        b=pLj2IGl72/tHJNxIozyzUDrxYdVv7lXviOehbJ7kknnzBBLIeQjQGR+7mjGCsJ/AlI
         hyVsVz5fw/nRpkwilczxIWmJOeaBE/9iqCEmua228gO5GY/0EWc0pV9qNPwVgwwQE4ag
         wFiTPDk9WShJOzRuUVdwZRzeJIG9ViBAB5r7kviW2//XQ6pAqS7fuIvGpSb7c5xRLisc
         FlLmJLhu8O9rdDMaOruAygj9Q/bb0oF65n/bh1j4V0iZ8fQRjt36aXgQJAPGx3g8OzAX
         W+tghy7RGYazya9JHBYz6yszOZ2L30pLlDZh3sc0VfpbGxtxjcmvHqkaLSjCAQzJTotJ
         z8VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I8EG5har;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si13266592ybg.318.2020.06.01.03.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 03:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I8EG5har;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfhaH-0000f6-1f
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 06:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhZu-0000cr-14
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 06:21:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50813
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhZt-00008g-3E
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 06:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591006916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NpTU5zlaOPP5faG9sGOrDhbPa5zzlwMZvrXG9/B+A8=;
 b=I8EG5haru+2CL7syV9TZCgNnsMNaOOSR7Q8ap3zUjDAYhl0geO9HgfJKVWn0W9MHlTFlMw
 iVAmCzxBQCVmSBpp40g0DFjQW7L66wOEekkboVLkpnasRt4ODpteMMw4VspfXPx8pTxx3a
 47h93HvIB5692QuNa0qxaQ1X+p7aDw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-vfBdJMV3OXWrEBSydX1zBA-1; Mon, 01 Jun 2020 06:21:55 -0400
X-MC-Unique: vfBdJMV3OXWrEBSydX1zBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE5F8A0BD7;
 Mon,  1 Jun 2020 10:21:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD742D01E3;
 Mon,  1 Jun 2020 10:21:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
Subject: [RFC 5/6] bios-tables-test: Add Q35/TPM-TIS test
Date: Mon,  1 Jun 2020 12:21:12 +0200
Message-Id: <20200601102113.1207-6-eric.auger@redhat.com>
In-Reply-To: <20200601102113.1207-1-eric.auger@redhat.com>
References: <20200601102113.1207-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 02:19:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +p+C/888y/4N

Test tables specific to the TPM-TIS instantiation.
The TPM2 is added in the framework. Also the DSDT
is updated with the TPM. The new function should be
be usable for CRB as well, later one.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test.c | 60 ++++++++++++++++++++++++++++++++++
 tests/qtest/Makefile.include   |  1 +
 2 files changed, 61 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index c9843829b3..bbba98342c 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -57,6 +57,9 @@
 #include "qemu/bitmap.h"
 #include "acpi-utils.h"
 #include "boot-sector.h"
+#include "tpm-emu.h"
+#include "hw/acpi/tpm.h"
+
 
 #define MACHINE_PC "pc"
 #define MACHINE_Q35 "q35"
@@ -874,6 +877,60 @@ static void test_acpi_piix4_tcg_numamem(void)
     free_test_data(&data);
 }
 
+uint64_t tpm_tis_base_addr;
+
+struct tpm_test_data {
+    const char *machine;
+    const char *tpm_if;
+};
+
+static void test_acpi_tcg_tpm(const void *context)
+{
+    struct tpm_test_data *c = (struct tpm_test_data *)context;
+    gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
+                                          c->machine, c->tpm_if);
+    char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
+    TestState test;
+    test_data data;
+    GThread *thread;
+    char *args, *variant = g_strdup_printf(".%s", c->tpm_if);
+
+    tpm_tis_base_addr = TPM_TIS_ADDR_BASE;
+
+    module_call_init(MODULE_INIT_QOM);
+
+    test.addr = g_new0(SocketAddress, 1);
+    test.addr->type = SOCKET_ADDRESS_TYPE_UNIX;
+    test.addr->u.q_unix.path = g_build_filename(tmp_path, "sock", NULL);
+    g_mutex_init(&test.data_mutex);
+    g_cond_init(&test.data_cond);
+    test.data_cond_signal = false;
+
+    thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
+    tpm_emu_test_wait_cond(&test);
+
+    memset(&data, 0, sizeof(data));
+    data.machine = c->machine;
+    data.variant = variant;
+
+    args = g_strdup_printf(
+        " -chardev socket,id=chr,path=%s"
+        " -tpmdev emulator,id=dev,chardev=chr"
+        " -device tpm-%s,tpmdev=dev",
+        test.addr->u.q_unix.path, c->tpm_if);
+
+    test_acpi_one(args, &data);
+
+    g_thread_join(thread);
+    g_unlink(test.addr->u.q_unix.path);
+    qapi_free_SocketAddress(test.addr);
+    g_rmdir(tmp_path);
+    g_free(variant);
+    g_free(tmp_path);
+    g_free(tmp_dir_name);
+    free_test_data(&data);
+}
+
 static void test_acpi_tcg_dimm_pxm(const char *machine)
 {
     test_data data;
@@ -1028,6 +1085,7 @@ int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
     int ret;
+    struct tpm_test_data tpm_q35_tis = {MACHINE_Q35, "tis"};
 
     g_test_init(&argc, &argv, NULL);
 
@@ -1037,6 +1095,8 @@ int main(int argc, char *argv[])
             return ret;
         }
 
+        qtest_add_data_func("acpi/q35/tpm-tis",
+                            &tpm_q35_tis, test_acpi_tcg_tpm);
         qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
         qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
         qtest_add_func("acpi/q35", test_acpi_q35_tcg);
diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index 9e5a51d033..5023fa413d 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -262,6 +262,7 @@ tests/qtest/hd-geo-test$(EXESUF): tests/qtest/hd-geo-test.o $(libqos-obj-y)
 tests/qtest/boot-order-test$(EXESUF): tests/qtest/boot-order-test.o $(libqos-obj-y)
 tests/qtest/boot-serial-test$(EXESUF): tests/qtest/boot-serial-test.o $(libqos-obj-y)
 tests/qtest/bios-tables-test$(EXESUF): tests/qtest/bios-tables-test.o \
+        tests/qtest/tpm-emu.o $(test-io-obj-y) \
 	tests/qtest/boot-sector.o tests/qtest/acpi-utils.o $(libqos-obj-y)
 tests/qtest/pxe-test$(EXESUF): tests/qtest/pxe-test.o tests/qtest/boot-sector.o $(libqos-obj-y)
 tests/qtest/microbit-test$(EXESUF): tests/qtest/microbit-test.o
-- 
2.20.1

