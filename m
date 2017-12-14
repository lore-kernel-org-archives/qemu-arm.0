Received: by 10.223.159.74 with SMTP id f10csp5780189wrg;
        Wed, 13 Dec 2017 18:03:04 -0800 (PST)
X-Google-Smtp-Source: ACJfBos7FmD7eno+O9/tt9CdvdFdmAB04MkERrdCrjXdi62desDb6W1h1VwVKmkYiBfTN/trt8dp
X-Received: by 10.13.243.195 with SMTP id c186mr3137109ywf.170.1513216984472;
        Wed, 13 Dec 2017 18:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513216984; cv=none;
        d=google.com; s=arc-20160816;
        b=hynwfbB05tha5ujzYz3S6uihg01a27OeILMqBaz6Tk9gO7TK8e2nJ0/3C20ECLRRxJ
         IjauYy08+x85o+LdZ7BiSBwHOnwAq2IydmyXEpGn4S0236vXzsyj+JkxuaRJfCkybCJw
         lm/52uwY6xaQxAKEz1Ii28iH3vme8ZV+wJkfIV8C0+QFLglWueUx32ho1mKbGK1iEsIb
         MHH6YwepXKfZahr3ufHatmqHuQ69znAQCDeecONjqdVcG1hMl8Wtryx7HycNI43+IUzY
         kVOsTMfgqL8jSKW13VXsulGpHyY+QabpVHl1Gu2qe0Egq8jos3Ouybm2WoYbzgRKkm9a
         /eSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Vev8MhLMciIvWBluuQcZCdjTg1BNBXmf5vZh6F0wBo4=;
        b=tJ5W/2ZWTwUXPmnRvRBn077Qv2/2gXV8VHaQPSy35P3WMfVRCaD7dHiuyYwzrqRHxP
         GKk/MQsr83msgj6iSzTzZzSVvyEPL7yvdP0bwNqoH15krrzh3x/erJDYHvje+6K4+rOu
         N/Sr/ZrnyeV/r8MkSRDeb2Z6hdSb0vfyEqd8cb3EM69yRhO9C3DYzL6OeUDuSKv0jpQH
         n5nqMUlMUTX76kJkHA2Fb+D/Uy8aW1xen/2ELAe6WGYHuqMIpspB7D5MSSQl+mUFBHS2
         JfTqxpqIwkqZwmi73RL2Jwp3ZPxi7fMd/P5f7vdK+tan1oPUCZV1GDtNCAj9GMXvzrnF
         nPJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tbkeDuQj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z124si612627ybc.204.2017.12.13.18.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 18:03:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tbkeDuQj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePIrX-00077w-Sh
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 21:03:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpR-0005q1-Sw
	for qemu-devel@nongnu.org; Wed, 13 Dec 2017 21:00:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpR-0003XZ-0U
	for qemu-devel@nongnu.org; Wed, 13 Dec 2017 21:00:53 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:45436)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpQ-0003XC-SP; Wed, 13 Dec 2017 21:00:52 -0500
Received: by mail-qt0-x243.google.com with SMTP id g10so6173321qtj.12;
	Wed, 13 Dec 2017 18:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Vev8MhLMciIvWBluuQcZCdjTg1BNBXmf5vZh6F0wBo4=;
	b=tbkeDuQjIZvtfBrOQqJ8CEIi3jUeuJ1Bs2KCxCkGF2OUrZ6CCDhmGNMRN8iepCPf1f
	pRZ98zHmG/25ic6v1wXouHwTLNYInMoRwKbxqA/ZlVV+WGsT4nHadcDqCQhDnCRUHSHm
	g/ZF3pNNGp2uQj2sJLF9jXerpDAPQSqgFYxk4zVDr+mxrt9mMMS4k6rPNezD6KCjjvXd
	2jQXEhNr/nzOFc5G0HxGI27Rm//Q6VSIjaKLnMhRibaw7LyGjTbPJsv3LnK88lxcF5YM
	1RsU+2+b7d0WYMUg6waGQ/DQ98YoQBGxk7M3rb5kAZVGZQwyZteFV5P2g98+s/AIw81f
	zEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Vev8MhLMciIvWBluuQcZCdjTg1BNBXmf5vZh6F0wBo4=;
	b=PBlZw0HAZ00lS3FOTJ8QndELMzFRDrKjBD1LxeXo5lZl/+/Z07F24qtIq4jgSMTQzT
	8a3N9AJE5a8uRDEfhANYfSwhgBhhD5j9CeKTtw913/0T/TmhrYT10zJS2HxYt0dY4k0J
	zRZ8xWxaKDMLenSgTytsYfBHLfnrIeWBjoFuy1Aw2M0NNgbmBxb+VBkkEDcITbgVqagv
	hBwrS8TiLtwykLpTLtlHpwHLTv94+feH+e5oLkPS49ZxMGLn3nPnLBWg6Eg7pGdCNzVF
	meUQmBpt6cJPNT2ao6DsEGgG0lB1/A6Bp5mGSHHMiHDoXc4NlaXQcXJG2+uSACYUbhTH
	yFUA==
X-Gm-Message-State: AKGB3mIy7e85F/szrmpd0RD2MQvBUaWKrZHLgU4+bmzj2jn7wOpxbJaJ
	ByOXB0/Wezn/jhXOcEzE/mw=
X-Received: by 10.200.3.158 with SMTP id t30mr13971004qtg.149.1513216852290;
	Wed, 13 Dec 2017 18:00:52 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	n39sm1938120qtn.95.2017.12.13.18.00.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 18:00:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 13 Dec 2017 23:00:20 -0300
Message-Id: <20171214020025.4004-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171214020025.4004-1-f4bug@amsat.org>
References: <20171214020025.4004-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH 3/8] sdhci: add qtest to check the SD Spec
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
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zDRf2T9kcvNu

read the HCVER register with check_specs_version()

Machines tested:
- Specs v2:
  smdkc210
- Specs v3:
  sabrelite
  raspi2
  xilinx-zynq-a9

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/sdhci-test.c     | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/Makefile.include |  1 +
 2 files changed, 75 insertions(+)
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
index 4a1afcb499..c6c0a91827 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -355,6 +355,7 @@ check-qtest-arm-y += tests/virtio-blk-test$(EXESUF)
 gcov-files-arm-y += arm-softmmu/hw/block/virtio-blk.c
 check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
 gcov-files-arm-y += hw/timer/arm_mptimer.c
+check-qtest-arm-y += tests/sdhci-test$(EXESUF)
 check-qtest-arm-y += tests/sdcard_tests.py
 
 check-qtest-aarch64-y = tests/numa-test$(EXESUF)
-- 
2.15.1

