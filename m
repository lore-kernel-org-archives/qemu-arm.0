Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1438889lfc;
        Tue, 3 Dec 2019 04:31:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqzKBV3JqlbwU7HvsjsIqUgOfK5FMMtD/IyXcTXiWA3iZ3QdjYXY9xXxFbf69WsXzdmZYs5u
X-Received: by 2002:aed:2904:: with SMTP id s4mr4594023qtd.316.1575376309511;
        Tue, 03 Dec 2019 04:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575376309; cv=none;
        d=google.com; s=arc-20160816;
        b=UY4UkaAoukaSw+iVN9kOxji9d7Ecmo7ZewWvTRcoIWdjW92Sa6bnGmzo6Y1r/0YG28
         L8NNEuZHgmyovG5Dm/md/bUzNgCgieLm7ArJj//0iHwcseg/6ePhq7/FZ8Q8/63K+RM8
         rOy4c8HvQ+5SW+kQPK/A03J4PqPXhEK2n3CQLeFGGYdnZ2eKm9iBfIppsMoEE7wGWxtD
         baUoguh0dIAjY2T2xDG+9+CUYjtQamEMPm391pRAa0PzaWY0CXSkoSy9C9RkiGC2hglK
         jSkvtcIjUNkjvS0Bx9JMn8Ilf/TfVV3AldpFImpjLCMnll6Nob6CihLI9lAXThxjocoq
         n90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=hTXHjeTzu49xEiDu7fw+Yh3kZ3jL/j3ovOaknGaOApo=;
        b=rwrcwhtrvZ4Sni+cSJxAcg6yW9kropb6WNmwwPPmmD/rsk9XgoQ26JuSiJLSUg1Njo
         BOy9zjYEXQRVEw1jlSaBkscEzUttNfGxRvw+MBOU0uROv8M3TvqkOwF9S6sKIypzXwhc
         wIE2kFh7TUQC0aOr6fy3d/ZZJUPzl6jYXclGkYFCz0TqOxl96tsrlsj6JHM+N2OYE5fi
         9qCuHGQ/kMlZVsM/tL8ZXPmHB8/4WzKcIgBQ2yBCErRyq4fSWZ39buOfyswEM0q5ROzA
         u8+EcHUTtISeSFu6KKoqrHNy1q7Nd9OVlpdKSej+Otyy46fjhMV8KTrafRUWQ1MVVuda
         sLrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a144si1882676qkg.216.2019.12.03.04.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 04:31:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic7LI-0000Ix-88
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 07:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JH-00082s-Ni
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JE-0003Yy-A2
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:42 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:40896 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1ic7JD-0003QC-Rb; Tue, 03 Dec 2019 07:29:40 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6F224D2CDBA246A38D2B;
 Tue,  3 Dec 2019 20:29:31 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Dec 2019 20:29:24 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
To: <peter.maydell@linaro.org>, <thuth@redhat.com>, <lvivier@redhat.com>
Subject: [PATCH 3/5] tests: fw_cfg: Use virt as default machine in
 fw_cfg-test.c
Date: Tue, 3 Dec 2019 20:27:51 +0800
Message-ID: <20191203122753.19792-4-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191203122753.19792-1-zhengxiang9@huawei.com>
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kraxel@redhat.com, wanghaibin.wang@huawei.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B3basPUsCEi6

The default machine type on aarch64 is not set which causes error in
qtest_init(). Here we use the "virt" machine as the default machine
type on aarch64.

Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 tests/fw_cfg-test.c | 65 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 51 insertions(+), 14 deletions(-)

diff --git a/tests/fw_cfg-test.c b/tests/fw_cfg-test.c
index 5a5342fa9d..a3a67d1099 100644
--- a/tests/fw_cfg-test.c
+++ b/tests/fw_cfg-test.c
@@ -23,13 +23,28 @@ static uint16_t max_cpus = 1;
 static uint64_t nb_nodes = 0;
 static uint16_t boot_menu = 0;
 
+static char *make_extra_args(const char *args)
+{
+    const char *arch = qtest_get_arch();
+    const char *machine_arg = NULL;
+
+    if (strcmp(arch, "aarch64") == 0) {
+        machine_arg = "-machine virt";
+    } else {
+        machine_arg = "";
+    }
+
+    return g_strdup_printf("%s %s", machine_arg, args);
+}
+
 static void test_fw_cfg_signature(void)
 {
     QFWCFG *fw_cfg;
     QTestState *s;
     char buf[5];
+    char *cli = make_extra_args("");
 
-    s = qtest_init("");
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     qfw_cfg_get(fw_cfg, FW_CFG_SIGNATURE, buf, 4);
@@ -38,6 +53,7 @@ static void test_fw_cfg_signature(void)
     g_assert_cmpstr(buf, ==, "QEMU");
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
+    g_free(cli);
 }
 
 static void test_fw_cfg_id(void)
@@ -45,8 +61,9 @@ static void test_fw_cfg_id(void)
     QFWCFG *fw_cfg;
     QTestState *s;
     uint32_t id;
+    char *cli = make_extra_args("");
 
-    s = qtest_init("");
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     id = qfw_cfg_get_u32(fw_cfg, FW_CFG_ID);
@@ -54,6 +71,7 @@ static void test_fw_cfg_id(void)
              (id == 3));
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
+    g_free(cli);
 }
 
 static void test_fw_cfg_uuid(void)
@@ -66,8 +84,9 @@ static void test_fw_cfg_uuid(void)
         0x46, 0x00, 0xcb, 0x32, 0x38, 0xec, 0x4b, 0x2f,
         0x8a, 0xcb, 0x81, 0xc6, 0xea, 0x54, 0xf2, 0xd8,
     };
+    char *cli = make_extra_args("-uuid 4600cb32-38ec-4b2f-8acb-81c6ea54f2d8");
 
-    s = qtest_init("-uuid 4600cb32-38ec-4b2f-8acb-81c6ea54f2d8");
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     qfw_cfg_get(fw_cfg, FW_CFG_UUID, buf, 16);
@@ -75,62 +94,70 @@ static void test_fw_cfg_uuid(void)
 
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
-
+    g_free(cli);
 }
 
 static void test_fw_cfg_ram_size(void)
 {
     QFWCFG *fw_cfg;
     QTestState *s;
+    char *cli = make_extra_args("");
 
-    s = qtest_init("");
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u64(fw_cfg, FW_CFG_RAM_SIZE), ==, ram_size);
 
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
+    g_free(cli);
 }
 
 static void test_fw_cfg_nographic(void)
 {
     QFWCFG *fw_cfg;
     QTestState *s;
+    char *cli = make_extra_args("");
 
-    s = qtest_init("");
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_NOGRAPHIC), ==, 0);
 
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
+    g_free(cli);
 }
 
 static void test_fw_cfg_nb_cpus(void)
 {
     QFWCFG *fw_cfg;
     QTestState *s;
+    char *cli = make_extra_args("");
 
-    s = qtest_init("");
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_NB_CPUS), ==, nb_cpus);
 
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
+    g_free(cli);
 }
 
 static void test_fw_cfg_max_cpus(void)
 {
     QFWCFG *fw_cfg;
     QTestState *s;
+    char *cli = make_extra_args("");
 
-    s = qtest_init("");
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_MAX_CPUS), ==, max_cpus);
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
+    g_free(cli);
 }
 
 static void test_fw_cfg_numa(void)
@@ -139,8 +166,9 @@ static void test_fw_cfg_numa(void)
     QTestState *s;
     uint64_t *cpu_mask;
     uint64_t *node_mask;
+    char *cli = make_extra_args("");
 
-    s = qtest_init("");
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u64(fw_cfg, FW_CFG_NUMA), ==, nb_nodes);
@@ -160,19 +188,22 @@ static void test_fw_cfg_numa(void)
     g_free(cpu_mask);
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
+    g_free(cli);
 }
 
 static void test_fw_cfg_boot_menu(void)
 {
     QFWCFG *fw_cfg;
     QTestState *s;
+    char *cli = make_extra_args("");
 
-    s = qtest_init("");
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_BOOT_MENU), ==, boot_menu);
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
+    g_free(cli);
 }
 
 static void test_fw_cfg_reboot_timeout(void)
@@ -181,8 +212,9 @@ static void test_fw_cfg_reboot_timeout(void)
     QTestState *s;
     uint32_t reboot_timeout = 0;
     size_t filesize;
+    char *cli = make_extra_args("-boot reboot-timeout=15");
 
-    s = qtest_init("-boot reboot-timeout=15");
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     filesize = qfw_cfg_get_file(fw_cfg, "etc/boot-fail-wait",
@@ -192,6 +224,7 @@ static void test_fw_cfg_reboot_timeout(void)
     g_assert_cmpint(reboot_timeout, ==, 15);
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
+    g_free(cli);
 }
 
 static void test_fw_cfg_no_reboot_timeout(void)
@@ -200,9 +233,10 @@ static void test_fw_cfg_no_reboot_timeout(void)
     QTestState *s;
     uint32_t reboot_timeout = 0;
     size_t filesize;
-
     /* Special value -1 means "don't reboot" */
-    s = qtest_init("-boot reboot-timeout=-1");
+    char *cli = make_extra_args("-boot reboot-timeout=-1");
+
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     filesize = qfw_cfg_get_file(fw_cfg, "etc/boot-fail-wait",
@@ -212,6 +246,7 @@ static void test_fw_cfg_no_reboot_timeout(void)
     g_assert_cmpint(reboot_timeout, ==, UINT32_MAX);
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
+    g_free(cli);
 }
 
 static void test_fw_cfg_splash_time(void)
@@ -220,8 +255,9 @@ static void test_fw_cfg_splash_time(void)
     QTestState *s;
     uint16_t splash_time = 0;
     size_t filesize;
+    char *cli = make_extra_args("-boot splash-time=12");
 
-    s = qtest_init("-boot splash-time=12");
+    s = qtest_init(cli);
     fw_cfg = fw_cfg_init(s);
 
     filesize = qfw_cfg_get_file(fw_cfg, "etc/boot-menu-wait",
@@ -231,6 +267,7 @@ static void test_fw_cfg_splash_time(void)
     g_assert_cmpint(splash_time, ==, 12);
     fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
+    g_free(cli);
 }
 
 int main(int argc, char **argv)
-- 
2.19.1


