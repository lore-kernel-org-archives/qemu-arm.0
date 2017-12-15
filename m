Received: by 10.223.159.74 with SMTP id f10csp7098220wrg;
        Thu, 14 Dec 2017 19:27:50 -0800 (PST)
X-Google-Smtp-Source: ACJfBoublqlIyl3V14YOQYNai0xIZnPlj6W7ZAwMYOwQB+TFQPAyfdUFeQIPcGgvMF3x2UrU7D6U
X-Received: by 10.13.211.193 with SMTP id v184mr5904015ywd.192.1513308470873;
        Thu, 14 Dec 2017 19:27:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308470; cv=none;
        d=google.com; s=arc-20160816;
        b=abwvtJOrDHCiCK4ufG0l4Dmsu6WT05q0h+H4kVarjAaoNZRyWIEH+MVYgPTLU86S9V
         FDAC6620vRWJpqD4DUEsFISx8PaX3b68obL+8RvOdfKLc/Qi3GKdxF6IW3sc+/It0UPx
         fSreEVbekGIQTsFawo3tX3u08GBvBin9Ra8OQSs55hwBXukEKXs6+M6bCu7m0CQu4CJL
         aVllIXgv1oDF/GhUjeAmjdORJdqK2tQqND/bwvBf60k9r1ZP1N7POpOoHiq/1HGJKQEW
         O6TJa3C3OL+BRcpXPuyGcAT3RNN2hgCj4LgywwbIqujyxwOx7BSq1N52qF+Ip2epUSIP
         bVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KcV7cBnkBAIbkLrJIeyMQMCXY7pj1UAnDWJGxDs/r9c=;
        b=PoOP2ArFgHEW0W8PSo/aWZuRcXFVEG+N6RYqRTegbd5yX4Vl862eAf38O54Da9bLWz
         a/KzNywjpNstNf0145GCYxLzjVFPjn9PHCzFJ3/ONssHtRYk90ZpH6djkbDXMubR99X4
         57+7jCPceAQS+71lfHQxAIs5J/JVUFX9iibKf9iQNK2plQIy72CVDwHEErRwaARM/rI6
         Wmtq6u0b88jsUr9dw5z1+6m1uBlc9yJtrh8PSkfZuEjtMPJY3goWMiATWodYwweGYdQm
         vmn2LXZ5TUh1M7a33BIG6mX/MzjrX3rrHRiTRC3MWvgCLcarNauFhsUaPIRnlZV9r6gT
         8e0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HjtaLFm2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j188si1097942ywf.215.2017.12.14.19.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:27:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HjtaLFm2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgf8-0007OO-6y
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:27:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWR-0007nm-7k
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:18:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWQ-0002pk-8l
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:18:51 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:39164)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWN-0002nm-Vm; Thu, 14 Dec 2017 22:18:48 -0500
Received: by mail-qt0-x242.google.com with SMTP id k19so10562607qtj.6;
	Thu, 14 Dec 2017 19:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KcV7cBnkBAIbkLrJIeyMQMCXY7pj1UAnDWJGxDs/r9c=;
	b=HjtaLFm2QZZLaWaTE/SC82th5lNXCoqFqrIoGSkxjCAs0jDdhJ8TYlyrp328q3bkww
	VhdnvSxWWPb10WeN/xjFKXVq0WgXvaxOqP/mu7Aykv3+gz3sr/sgWmYmKQPfYTz8aTgR
	8aCBzWhTX9OWqlo3zvPJb8I8iJHCya1nt38DvjMw9yj1KPYQc7lhjTYkOhZ2YM43QQxl
	J4Lt0se6TZqJ9Ag//reT2tzzMh5hPV66z1Lyaz15dYA/OhBhqvqWLG1T7zSIfJbikiYH
	4a5JcU31i9d4ilPHu3vti1dmJi+8d4xF69keIhcbNm2epfOw36+/BFr4KS0S2HkcJSDP
	wBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KcV7cBnkBAIbkLrJIeyMQMCXY7pj1UAnDWJGxDs/r9c=;
	b=bGxCyqWVTs5fnp8wm6/VHCThalCLV0kfmQsgcT2Y4Yf1tkJULQVchqUlgdObWaL5CJ
	EV5HThNhcvpf80wHj0KOflIuss4Vt3g5I6bK2EgiEob8D7OrpFOXZOWkDo1t+oAi6NYm
	LxrNWYXdaIop7aXzV4j1N1HTSWNAfjgnnEzPtwYezhEvgC7TVWkP2jgy9UU//5oBLviC
	5u0vJFsz5GfyUXNCIOxlv7/pM+TEKtUVyYq+yl2Iej0x4/CdQJ+vvvayFlgZgiVlkrBX
	OenqFGSqfcEZeQz1cnYfNG4FrS8Acmrs3KqiABsRa9dTHeh1dW4BVXFJvm3MzzVM6nZL
	3mrg==
X-Gm-Message-State: AKGB3mKouZbCSVoUAFZjurzgOMHMho0/Sj5A6SjiwD+rlSRWBz3aiL9S
	fttSsFbWBmkYKFvXBRvUcCM=
X-Received: by 10.200.55.75 with SMTP id p11mr19722478qtb.298.1513307927540;
	Thu, 14 Dec 2017 19:18:47 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.18.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:18:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:46 -0300
Message-Id: <20171215031547.31006-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v2 19/20] sdhci: add a check_capab_sdma() qtest
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wL3mi19v4r1T

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/sdhci-test.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index 966bd00499..b7646bccc6 100644
--- a/tests/sdhci-test.c
+++ b/tests/sdhci-test.c
@@ -12,6 +12,7 @@
 
 #define SDHC_CAPAB                      0x40
 FIELD(SDHC_CAPAB, BASECLKFREQ,               8, 8); /* since v2 */
+FIELD(SDHC_CAPAB, SDMA,                     22, 1);
 #define SDHC_HCVER                      0xFE
 
 static const struct sdhci_t {
@@ -21,16 +22,19 @@ static const struct sdhci_t {
         uintptr_t addr;
         uint8_t version;
         uint8_t baseclock;
+        struct {
+            bool sdma;
+        } capab;
     } sdhci;
 } models[] = {
     { "arm",    "smdkc210",
-        {0x12510000, 2, 0} },
+        {0x12510000, 2, 0, {1} } },
     { "arm",    "sabrelite",
-        {0x02190000, 3, 0} },
+        {0x02190000, 3, 0, {1} } },
     { "arm",    "raspi2",           /* bcm2835 */
-        {0x3f300000, 3, 52} },
+        {0x3f300000, 3, 52, {0} } },
     { "arm",    "xilinx-zynq-a9",   /* exynos4210 */
-        {0xe0100000, 3, 0} },
+        {0xe0100000, 3, 0, {1} } },
 };
 
 static uint32_t sdhci_readl(uintptr_t base, uint32_t reg_addr)
@@ -90,6 +94,15 @@ static void check_capab_baseclock(uintptr_t addr, uint8_t expected_freq)
     g_assert_cmpuint(capab_freq, ==, expected_freq);
 }
 
+static void check_capab_sdma(uintptr_t addr, bool supported)
+{
+    uint64_t capab, capab_sdma;
+
+    capab = sdhci_readq(addr, SDHC_CAPAB);
+    capab_sdma = FIELD_EX64(capab, SDHC_CAPAB, SDMA);
+    g_assert_cmpuint(capab_sdma, ==, supported);
+}
+
 static void test_machine(const void *data)
 {
     const struct sdhci_t *test = data;
@@ -98,6 +111,7 @@ static void test_machine(const void *data)
 
     check_specs_version(test->sdhci.addr, test->sdhci.version);
     check_capab_readonly(test->sdhci.addr);
+    check_capab_sdma(test->sdhci.addr, test->sdhci.capab.sdma);
     check_capab_baseclock(test->sdhci.addr, test->sdhci.baseclock);
 
     qtest_quit(global_qtest);
-- 
2.15.1

