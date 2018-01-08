Received: by 10.28.173.206 with SMTP id w197csp2620986wme;
        Mon, 8 Jan 2018 07:54:15 -0800 (PST)
X-Google-Smtp-Source: ACJfBovHH/1G2d53iGP9tetO2GgFr4HCXn9OirhnGYjkfAsIpb+LyTTP+feXDiIEhfugxxxeiE+/
X-Received: by 10.129.41.81 with SMTP id p78mr826478ywp.368.1515426855799;
        Mon, 08 Jan 2018 07:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426855; cv=none;
        d=google.com; s=arc-20160816;
        b=eNfh+9hVTgm7zAu+1JgSDCDJvy4/WVg0s42nk9TNjpUC2gtC57wg5ZerXf7lSUGlxG
         IwLwNfOk8Sn4/1gYYE/Zs+fE7h81VKtxBN3hx5FXrgAkyj4yzxAt6OSlBCnfBfZ08FxA
         EsMAc+VPte9IpzKGgcIZ64RFPXnjw/6ikd4A3D9+hJMJyTWkk1XaRVuy+KeI/G3d6VxT
         V9nqeem1aTE9dlWntfMIkMwVZIga1VtWQ1t0R62lmOFP9PvfEzmNjODZbrsMHwTPs/BG
         LxFNsJPpJH6bbtJNE79VqtT1rgk4ZljgRd/4d/6AcAvHn/1x1RUE3AdksBpOyOyG6QTK
         n+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Af11vnDqjykM6n6xovmwBZCshQjPkL26d6L6QGpJWq8=;
        b=eUOZfIJBFq5SNUNzGniUl1tPfhpMUqOLICGVhAecRdIJknf39awZn7pFlKVv9fixqj
         KlgQuOP/kSBVFApzsh5RVqPFm3AIxXmmErJ9ObXetfE/xrqbFfRIwUAPUUAroi0ZrTOb
         ouyzwlOsDRFQg44efEEYmRUyMZJLG/jU4w82O8i76w4tUdd+U3UnABQX783OUcX6s7RM
         kIaqABBGzBR+zOiKXaFWN2h1iPHjuyW+FLAN9/xNvqCZ0UnVLtdh41XrCg3DFpgyC6LQ
         /Jqg1IYYMyuhhJ1587ezArGShLKmnopH+rEHY8/pAN2ZkN/+eZbSP+Gm4aIImnGlM3YV
         AacQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dh2hIE18;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o65si2573486ybb.114.2018.01.08.07.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:54:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dh2hIE18;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZkd-0001vR-6a
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:54:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbK-00027S-4B
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbG-0007h1-VS
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:38 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:46514)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbG-0007go-QX; Mon, 08 Jan 2018 10:44:34 -0500
Received: by mail-qt0-x243.google.com with SMTP id r39so14070369qtr.13;
	Mon, 08 Jan 2018 07:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Af11vnDqjykM6n6xovmwBZCshQjPkL26d6L6QGpJWq8=;
	b=dh2hIE18xvnutMSkddNXO2oNkDkMSjGvKFVmNQexhuR97czXZstWJHZTKE/k4gFZZ2
	p0sIMTG0egqqrTBBp83UQY8vpiMkKbUtydv0DrEkS83EwGU1P+o9E+q3PwGy0m+wBb1K
	x6eIzaEAgO52lUtmlSifkQF809+paYJbSjx2yVAytQsp7oqSY5q/g6Omy8kSx/9JErpt
	DypX6h80KVqVBt+HITyHiFYxJ0hqnRYhX1HUMIM0pMgb4+K0PYhq9ILZa44jZZHPCqWm
	1F/bHKMfYwuV4c+4FGledhMGYtP4iQVxXiKPuz0NxD83F64hELtp8adbWpSkBh8Re3hm
	0yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Af11vnDqjykM6n6xovmwBZCshQjPkL26d6L6QGpJWq8=;
	b=iwnpWtQp1CjqkN5KvT4fa3nnkUswzBYpiO8QL9CUjl8i3EdowEusn+2UYLKtgTFkJr
	zZ6o2iOt7CYlhZdbL6gndBZMR1Z1Qzl6AxEt3vHgak76Ll1LHdPghRxFJIZF5R9NxgaS
	gu67SOtGXncs4lYgFSYlkyzEN/IeZMkQG4h2NtNCgCcSqkc9b+SZ2IF3dMS8XhIt42DB
	90e1tnXqI+qgS7JeTJOGABD2uaFEDHqnKRbg3RTnMxMQsPE5dZI4x0iJZE1lMSnGUQeV
	WKoiCu1fcKQlNC2tvLAY+Mxc8vE5NCJdKhs4LmamcEKxTsrIx0FYESoQodbm1N7TOwPU
	CTYA==
X-Gm-Message-State: AKwxytcL2Hv897lDIazHudn2XM2tfBGiwwu08GCtIma+fmsTpc+XaxRn
	WTSi7hWGBdJmu6Pwodj8+zo=
X-Received: by 10.200.43.105 with SMTP id 38mr17554412qtv.265.1515426274291;
	Mon, 08 Jan 2018 07:44:34 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:46 -0300
Message-Id: <20180108154303.6522-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v5 14/31] sdhci: add qtest to check the SD Spec
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0yqSmTKdAbym

with check_specs_version()

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/sdhci-test.c     | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/Makefile.include |  2 ++
 2 files changed, 84 insertions(+)
 create mode 100644 tests/sdhci-test.c

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
new file mode 100644
index 0000000000..492b332588
--- /dev/null
+++ b/tests/sdhci-test.c
@@ -0,0 +1,82 @@
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
+        uint8_t baseclock;
+        struct {
+            bool sdma;
+            uint64_t reg;
+        } capab;
+    } sdhci;
+} models[] = {
+    /* Exynos4210 */
+    { "arm",    "smdkc210",
+        {0x12510000, 2, 0, {1, 0x5e80080} } },
+
+    /* Zynq-7000 */
+    { "arm",    "xilinx-zynq-a9",
+        {0xe0100000, 2, 0, {1, 0x01790080} } },
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
+    const char *arch = qtest_get_arch();
+    char *name;
+    int i;
+
+    g_test_init(&argc, &argv, NULL);
+
+    for (i = 0; i < ARRAY_SIZE(models); i++) {
+        if (strcmp(arch, models[i].arch)) {
+            continue;
+        }
+        name = g_strdup_printf("sdhci/%s", models[i].machine);
+        qtest_add_data_func(name, &models[i], test_machine);
+        g_free(name);
+    }
+
+    return g_test_run();
+}
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 77f8183117..2d7058ca4c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -357,6 +357,7 @@ check-qtest-arm-y += tests/virtio-blk-test$(EXESUF)
 gcov-files-arm-y += arm-softmmu/hw/block/virtio-blk.c
 check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
 gcov-files-arm-y += hw/timer/arm_mptimer.c
+check-qtest-arm-y += tests/sdhci-test$(EXESUF)
 
 check-qtest-aarch64-y = tests/numa-test$(EXESUF)
 
@@ -612,6 +613,7 @@ tests/test-qht-par$(EXESUF): tests/test-qht-par.o tests/qht-bench$(EXESUF) $(tes
 tests/qht-bench$(EXESUF): tests/qht-bench.o $(test-util-obj-y)
 tests/test-bufferiszero$(EXESUF): tests/test-bufferiszero.o $(test-util-obj-y)
 tests/atomic_add-bench$(EXESUF): tests/atomic_add-bench.o $(test-util-obj-y)
+tests/sdhci-test$(EXESUF): tests/sdhci-test.o
 
 tests/test-qdev-global-props$(EXESUF): tests/test-qdev-global-props.o \
 	hw/core/qdev.o hw/core/qdev-properties.o hw/core/hotplug.o\
-- 
2.15.1

