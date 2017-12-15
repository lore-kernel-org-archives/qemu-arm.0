Received: by 10.223.159.74 with SMTP id f10csp7097603wrg;
        Thu, 14 Dec 2017 19:26:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBotgugOc8an5zM65p+bUIeVyVK0UTiwOGkTwTYm5S6CXHvFG4dLdErzUKpPr0AwXxlXBJTVe
X-Received: by 10.129.16.134 with SMTP id 128mr6093184ywq.111.1513308418168;
        Thu, 14 Dec 2017 19:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308418; cv=none;
        d=google.com; s=arc-20160816;
        b=pByK25m7sxyI+uQc0nQ6z+/Buua3nY4i/tvL4e9nazZEnEhgIthkV6ltLILVKlnOB+
         +qalEZfD+KusCPtYv0jYgW2bkGeed46EPolBeFKUnywGc4kWOuFtrarK+82NLN9kEY5z
         x7LeMqOOnnlYcoAdRCHx7lbOTuf61c/fsLmWrYt3C6g31I43XxKofpkDJASfeAM9AvhD
         n3VV81V970oO8OPT7B9GxteqRS9gSqGOb97EE2QUdIH7WP11T4H1rWZ2WfBSihFHde6Y
         ITK2HuaKFwNYrOeVcU1BfWDJUwNR+RohkyazvS3cwA+eQQlMALhu2bMz7P++slDDV86p
         LkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ODhuAZcZ7T8cAUToHWt+/xxs9BPhqRdYTNiMThBf9A0=;
        b=s0RojzvsfrY5eReEt5HdYlOjj/oRlY/SjN89/kKZKDPotMZEKKk9GG+qGtT6JC3HEJ
         p5Mik3MYLcL5RYmP9ogEHkQO/yZCseV39N2U9hgOiuDOk62605jOTF6+ai3aCPz/u8nf
         YWEaMVnqyNunPe+fjyksxxB/o/KEgX+2nE/rEiyBtivXEwp5M10bFe9LJCLp3Od3cGXy
         aUN7fVOrhmzFyar21KeTNFV4HwhKY3yYm+9EMOOAKXorDPdBfhIW9izX+CVl0qEnFekE
         2/Ky5M3yptU0kgIe3RWjzLGaCSKIItCWQidGgpvbiBy0SW5Vbmd0bW/ct+ipgqi+DQJV
         zg+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FFVtFKzQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si1053431ybm.625.2017.12.14.19.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:26:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FFVtFKzQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgeH-0006CB-F8
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:26:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWD-0007d0-07
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:18:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgW9-0002ca-QT
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:18:36 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35247)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgW9-0002cH-MR; Thu, 14 Dec 2017 22:18:33 -0500
Received: by mail-qk0-x244.google.com with SMTP id c13so8843933qke.2;
	Thu, 14 Dec 2017 19:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ODhuAZcZ7T8cAUToHWt+/xxs9BPhqRdYTNiMThBf9A0=;
	b=FFVtFKzQpfo/SdLcOmzEjpo7ThBLdDTFMtDBu2bVZBGCmhKXgQcIIKx4W2F2vGvIUD
	zOEf135PJ/dVwCAEEiwq504f+dgzkCXAONVug7Zb94bZ0MidbqihwGc4BvgmcBXmW1bf
	WGnbIWomuaGzhK1PV1XqTGVat4ph3uoFA5uUdsyXyLc6fPjt2s86+v/NXL2Bf73XjPjz
	gvirNbj5+9GTiEYID6/txW/2ONJEzcytrLqMJSV99c1K7xO8rhNiqBd9d1/Bx6Iypbn9
	4rjLEG97Pck5EWMyv/rKp5I2HuULFVyKYSQMhePQVffQ34WjztNzFNqUwrQItbg80pl5
	z5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ODhuAZcZ7T8cAUToHWt+/xxs9BPhqRdYTNiMThBf9A0=;
	b=mPAGuHt/gTVhhfLW9mLHFh7mLvnbxQbU4nl5q4VJv3kkNCAu5WxHl3oUthj/TLs9cf
	qLCGiROomrMNJiqng9QKv64cRG/S3zaUb3itru0TWTxuYyclck/WTp1maSmU8BxhDTnv
	y5OoJxFx1P0YfrxXhYoAT4AZByJtsQzbZIS1TwPLLw+CbYiJ/M+Sor2TrddIocvkX8NF
	Wamz11Z/wAPeNY3SiQ1Ccxc+7gg87zBbkunKIApoiiRZErkmEPX2iUTEC/nSOOUR31ky
	uMzQmIBgVQz7Px6W9X+OFiCtB/VCbbINZPM5aO+cdA9vxVEzUky1TQoN7LKp/2RwJuEi
	yJsw==
X-Gm-Message-State: AKGB3mL+AgKlNsIamawLiyv7Ku2PSKhkP4evzXOrDmmabfI31/j1kp3P
	s0OTRvesXA2SAg240HJScOI=
X-Received: by 10.55.195.142 with SMTP id r14mr19978307qkl.146.1513307913200; 
	Thu, 14 Dec 2017 19:18:33 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.17.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:18:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:43 -0300
Message-Id: <20171215031547.31006-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v2 16/20] sdhci: add qtest to check the SD Spec
 version
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K8LIortM6yJA

with check_specs_version()

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/sdhci-test.c     | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/Makefile.include |  2 ++
 2 files changed, 76 insertions(+)
 create mode 100644 tests/sdhci-test.c

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
new file mode 100644
index 0000000000..4ebe1e349b
--- /dev/null
+++ b/tests/sdhci-test.c
@@ -0,0 +1,74 @@
+/*
+ * QTest testcase for SDHCI controllers
+ *
+ * Written by Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+#define SDHC_HCVER                      0xFE
+
+static const struct sdhci_t {
+    const char *arch;
+    const char *machine;
+    struct {
+        uintptr_t addr;
+        uint8_t version;
+    } sdhci;
+} models[] = {
+    { "arm",    "smdkc210",
+        {0x12510000, 2} },
+    { "arm",    "sabrelite",
+        {0x02190000, 3} },
+    { "arm",    "raspi2",           /* bcm2835 */
+        {0x3f300000, 3} },
+    { "arm",    "xilinx-zynq-a9",   /* exynos4210 */
+        {0xe0100000, 3} },
+};
+
+static uint32_t sdhci_readl(uintptr_t base, uint32_t reg_addr)
+{
+    QTestState *qtest = global_qtest;
+
+    return qtest_readl(qtest, base + reg_addr);
+}
+
+static void check_specs_version(uintptr_t addr, uint8_t version)
+{
+    uint32_t v;
+
+    v = sdhci_readl(addr, SDHC_HCVER);
+    v &= 0xff;
+    v += 1;
+    g_assert_cmpuint(v, ==, version);
+}
+
+static void test_machine(const void *data)
+{
+    const struct sdhci_t *test = data;
+
+    global_qtest = qtest_startf("-machine %s -d unimp", test->machine);
+
+    check_specs_version(test->sdhci.addr, test->sdhci.version);
+
+    qtest_quit(global_qtest);
+}
+
+int main(int argc, char *argv[])
+{
+    char *name;
+    int i;
+
+    g_test_init(&argc, &argv, NULL);
+
+    for (i = 0; i < ARRAY_SIZE(models); i++) {
+        name = g_strdup_printf("sdhci/%s", models[i].machine);
+        qtest_add_data_func(name, &models[i], test_machine);
+        g_free(name);
+    }
+
+    return g_test_run();
+}
diff --git a/tests/Makefile.include b/tests/Makefile.include
index c002352134..af7f324e07 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -355,6 +355,7 @@ check-qtest-arm-y += tests/virtio-blk-test$(EXESUF)
 gcov-files-arm-y += arm-softmmu/hw/block/virtio-blk.c
 check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
 gcov-files-arm-y += hw/timer/arm_mptimer.c
+check-qtest-arm-y += tests/sdhci-test$(EXESUF)
 
 check-qtest-aarch64-y = tests/numa-test$(EXESUF)
 
@@ -609,6 +610,7 @@ tests/test-qht-par$(EXESUF): tests/test-qht-par.o tests/qht-bench$(EXESUF) $(tes
 tests/qht-bench$(EXESUF): tests/qht-bench.o $(test-util-obj-y)
 tests/test-bufferiszero$(EXESUF): tests/test-bufferiszero.o $(test-util-obj-y)
 tests/atomic_add-bench$(EXESUF): tests/atomic_add-bench.o $(test-util-obj-y)
+tests/sdhci-test$(EXESUF): tests/sdhci-test.o
 
 tests/test-qdev-global-props$(EXESUF): tests/test-qdev-global-props.o \
 	hw/core/qdev.o hw/core/qdev-properties.o hw/core/hotplug.o\
-- 
2.15.1

