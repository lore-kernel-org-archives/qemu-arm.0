Received: by 10.223.159.74 with SMTP id f10csp7101799wrg;
        Thu, 14 Dec 2017 19:32:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBosV8PROr0FLv/tqV7QbN7XH43TL8N9EeFa3EB785/u1G7XZ4DRePcr3AXyM9UsKdsPqm1MI
X-Received: by 10.37.185.144 with SMTP id r16mr5805594ybg.510.1513308760931;
        Thu, 14 Dec 2017 19:32:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308760; cv=none;
        d=google.com; s=arc-20160816;
        b=kneXT63Z+XAXs0y3HkLVJLGLzGMqUD44DsCdf88M6q5v3pTg2YaMbsrImuROEkaI2z
         JitaJuP2VuvvDQ19p5MfUKnDhXsSH660j1MrqAKk+LYK6LuqNByNPD7sDqbTwaRO1Bqs
         11bO1kYuD1JFXVK+IZ0WHqA5jj4Lz41K21M4Xj+C+0euuLHTti6VdlmYBK7s2NU/qbyc
         3Qjexy5pOEjl/SOR73Lm+PFYzzxKcSZuIgfDfa1+ln1btseKHGsvA7PjiqsXnQ6Kb4du
         BryCf3KG14mNsPqSI4T/I8wpOTeCVtQmOjnincfXxzdEEmWpw5a6BuA1tPgPoRXvtFZZ
         AQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=jiYjx6K4VMABkekyhu1PE1MLXOLVrqG7LnZPoDc4ZcE=;
        b=SNHP/AnAVwtsxZKSUkMmragzUTm3QmFHI68YQE9l/nuy57mhOfkLGiQ+65Dw2IGF+0
         1tLtUrMztVob/CfccQkdeOWZMAgAdjzXR1TaqL50bLAbuW/tP45rI2fA5kKv29PDLEYd
         sAalLdJegEUMLfjo2ecQ++Qu8MRF383Qkjdct2WB4oyK8NAWrY6W1ZcFEWvu8RAsfmyp
         ZoDa6V0Dty6wqmNHJgFhKMWgF3dTfgFU/4yDrU1L4+nF6kpQhEXCGvI/z16OPBr7s71o
         z26NzoTqEWwdjQDEfV7OD2tywfkrsZ48DkRFU8XRaA0SVgYieMwwJBdKuwQNcrbG0hZO
         aFng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XeQZyc/H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n74si1089701ywd.456.2017.12.14.19.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:32:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XeQZyc/H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgjo-0002k9-Bi
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:32:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWF-0007fC-OL
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:18:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWE-0002hC-U7
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:18:39 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWE-0002gd-PY; Thu, 14 Dec 2017 22:18:38 -0500
Received: by mail-qt0-x244.google.com with SMTP id a16so10594826qtj.3;
	Thu, 14 Dec 2017 19:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jiYjx6K4VMABkekyhu1PE1MLXOLVrqG7LnZPoDc4ZcE=;
	b=XeQZyc/HhhDOs5wDhlm3+lWBGkbmX1bIp8Uwm9E7uXsRF4EBUN7of/O3CVb9jRxhye
	QFuSd18rB4NW47xzoFFMzL9tSfyhpTcZ+FdZ/HuJFuptXJGyr5PNbtu4cWWZ0Q3WvbHz
	seGBzxo/jZqDxdLI/+I0MSq5QWpf5z2jlQMx5SJBYfNEWaQo0DbdjQNw8mBV8XDwVSV/
	nTSoW9DjdRZTH6Eu/FGMssKCd7zJZylJiJv5SdR6AT0gEfqMhtZCVjYNxxxdXpPAGicd
	GSMvnGTsMH4xfdXncRfHysdK2FXp5NvMK+EmxN5NU8Pxx78u16q3LxCxs+bp9KIBy16C
	2Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jiYjx6K4VMABkekyhu1PE1MLXOLVrqG7LnZPoDc4ZcE=;
	b=m4xTD190vVYBmJW9hOXacb4afCXvhM74Y+y9JdolSq4EB5CAyKZFgyLIVjnYwYzApA
	TjfSGh6c4d2BJWtlX0lxjMUzzoiE5K6E/pa1PqTgIJAXECES5mIbmmMYSxn3Px1XPJ97
	xtFoOUfMpplpuvUsJaSqdHeA5rtnhN2Tj4JS1pNyJ+9oh466FnRmpHgFMzg3tIkz7Ms6
	8jWwSAiHwwpFVmjwVlkOw30ltaQXLhnUsJqwaWZEOF0eELL5YQA52bJ/+/f5o+7p7Ch4
	o89SkuK/y0ySYS5iV6QVRoBzOcw4vPC+sLOml5YQLK1T+RXOGifnHu/oUpe0O6jvrMv8
	BOeA==
X-Gm-Message-State: AKGB3mKzik0k0RBIMT8ubEAvuHBvC0Fwe9AEVBJc98NwAxqwz8iO09P5
	RgbtqaUxmtE+ROQf1hgxy34=
X-Received: by 10.200.51.46 with SMTP id t43mr20378699qta.75.1513307918311;
	Thu, 14 Dec 2017 19:18:38 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.18.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:18:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:44 -0300
Message-Id: <20171215031547.31006-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v2 17/20] sdhci: add check_capab_readonly()
 qtest
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
X-TUID: hanulVQgl3gz

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/sdhci-test.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index 4ebe1e349b..01373a69df 100644
--- a/tests/sdhci-test.c
+++ b/tests/sdhci-test.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "libqtest.h"
 
+#define SDHC_CAPAB                      0x40
 #define SDHC_HCVER                      0xFE
 
 static const struct sdhci_t {
@@ -36,6 +37,20 @@ static uint32_t sdhci_readl(uintptr_t base, uint32_t reg_addr)
     return qtest_readl(qtest, base + reg_addr);
 }
 
+static uint64_t sdhci_readq(uintptr_t base, uint32_t reg_addr)
+{
+    QTestState *qtest = global_qtest;
+
+    return qtest_readq(qtest, base + reg_addr);
+}
+
+static void sdhci_writeq(uintptr_t base, uint32_t reg_addr, uint64_t value)
+{
+    QTestState *qtest = global_qtest;
+
+    qtest_writeq(qtest, base + reg_addr, value);
+}
+
 static void check_specs_version(uintptr_t addr, uint8_t version)
 {
     uint32_t v;
@@ -46,6 +61,20 @@ static void check_specs_version(uintptr_t addr, uint8_t version)
     g_assert_cmpuint(v, ==, version);
 }
 
+static void check_capab_readonly(uintptr_t addr)
+{
+    const uint64_t vrand = 0x123456789abcdef;
+    uint64_t capab0, capab1;
+
+    capab0 = sdhci_readq(addr, SDHC_CAPAB);
+    g_assert_cmpuint(capab0, !=, vrand);
+
+    sdhci_writeq(addr, SDHC_CAPAB, vrand);
+    capab1 = sdhci_readq(addr, SDHC_CAPAB);
+    g_assert_cmpuint(capab1, !=, vrand);
+    g_assert_cmpuint(capab1, ==, capab0);
+}
+
 static void test_machine(const void *data)
 {
     const struct sdhci_t *test = data;
@@ -53,6 +82,7 @@ static void test_machine(const void *data)
     global_qtest = qtest_startf("-machine %s -d unimp", test->machine);
 
     check_specs_version(test->sdhci.addr, test->sdhci.version);
+    check_capab_readonly(test->sdhci.addr);
 
     qtest_quit(global_qtest);
 }
-- 
2.15.1

