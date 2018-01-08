Received: by 10.28.173.206 with SMTP id w197csp2625459wme;
        Mon, 8 Jan 2018 07:59:03 -0800 (PST)
X-Google-Smtp-Source: ACJfBot328EWHOOl8YpqdWMpAC2BEgN7P1ikKXSaCfOPTl5sfGlk9t6tdzA9bFIoZTcBj8TshrG7
X-Received: by 10.129.75.196 with SMTP id y187mr11437462ywa.511.1515427143041;
        Mon, 08 Jan 2018 07:59:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427143; cv=none;
        d=google.com; s=arc-20160816;
        b=NRKsTOWxWR6s0yoay1ZOuy8id7TRzlRC5fqZvB1/YQ0LVz6Pa0rAGQvRY2q/omWjWh
         NvaehQb6QNuqI3byZkwGSWqfsmRBmDRwaPkV5u7D9QbyLiAf3el27lCCifdygHqjj5VA
         AEO00QzuNhheY5h/snTk/8+e9g3aE18zwIZdvp2tscaakyjBPJNUcY/jG/Z+C7WCGXOB
         DZWTpeOHQAUlE46haODU4motQpfWh52iJn2Mb2c4fvvAGcf36lD0PWsyCfKUX6eYy4Ku
         mCtK7/W/07b/MfhpneqCGjvWu2Lwl9j/ZjXo/XUeeqmfLIoUdGFkwt8gP0PnE6XQXkM6
         yA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=9tBdjDJXOGzE0/3bDjUOVnPkWjcLqrGqZm6bRedvMmU=;
        b=uUyJVP1zJmrEsER3kHLbT+YKpPSU/vWIHZh5T631VM6rkAYwLEvnBG9rRzyzu7rYfA
         kcPPzm06YuwHOp6B7MTDXhiHEaDtrkBzFGrcaABLm4hl0YTqv8kzb+4gQzw17uzOVlTm
         ivcWG9eUvYCzJmfDMZfGWuvWqVhMfasymuDs83nGIpywq3P8DzQ/9EU8sgacSb9xiwAb
         yUOqY+ySXj68QmXGeIefDYv8FVUWuVEJYm8eAMMVYRXxr0uwG5GS0etAmTinXfWCwbRA
         niZIfrZSC4qvg2KxmmdXE/oN2JlmlUz5EhKM+dCxXd/WFtODzJ8syhoCjlFw89/iSj4r
         QiGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gtY9/kYS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9si2550225ywm.429.2018.01.08.07.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:59:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gtY9/kYS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZpG-000627-EQ
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:59:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbM-00029i-L1
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbL-0007k1-OP
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:40 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:41159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbL-0007jo-KH; Mon, 08 Jan 2018 10:44:39 -0500
Received: by mail-qt0-x242.google.com with SMTP id i40so14077033qti.8;
	Mon, 08 Jan 2018 07:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9tBdjDJXOGzE0/3bDjUOVnPkWjcLqrGqZm6bRedvMmU=;
	b=gtY9/kYSv2atG0vryYD+kfcSis3anzecH2oBblLQXPj1x1UBk83u8JnQ4DCnZkh/qy
	uofWIsO+NGGZjrNyJDtIxLfQYne58AM5R4eXs2s4izbrZRW0Y26pze48+JzA5ZGXTcBv
	zqmAHG3xAfNixlPIu44PJaQ9IohLjWm+7LOTp2VlYBYxdztKDg9OXupiM7ntFT58qIcJ
	AFuO9L9oedOlN/SgCkntstv/H5QuGqaqCoyD6irr5qtdy9P/ezVy6nyK3qPV9v6H22fe
	nfgDlMJ+kPCYyMyETn2s8HMZplTqGTbw2m7Z3I2LIhvBR69pIXXXSE6FeRtIFJ8GEii6
	psfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=9tBdjDJXOGzE0/3bDjUOVnPkWjcLqrGqZm6bRedvMmU=;
	b=q3DqLaFjI/bxgNOJq9ppGVbUgiApBvCj0viupiesum/36zeE32zooy8kqUcb36tGeI
	nuqdC5un5lP/UtkeHKhwE9EQyxBjwIjXajlp36yX/yYmy+U5wqc647CHmf6mzMntJCtU
	ywJs/1h05L+TCf6PG4ee9/n401Y9frUgLluzpMpHOntScp9/If4SxFMBRVTS1P47JRSG
	uBrwE8QVW9yO9+PMr2HJH8IuudS3vsc/FMdRnUofd718XHQzx8S40T8iZ28TG7hSjcBV
	Zx1/1SCLJoMORGDJnAdw+zg8S6UELe3XBd7fNBF5Epd6RsDfll8gmKDSOyKkiHPgYjxY
	8Ttg==
X-Gm-Message-State: AKwxytcqDsCTbtbOIUDUObIIY4m5d2egwIz2q/QWVorTtFuStwa2Uqry
	6fBAfSMQi9lNtAHJE8LDUrE=
X-Received: by 10.200.34.19 with SMTP id o19mr17779106qto.52.1515426279135;
	Mon, 08 Jan 2018 07:44:39 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:47 -0300
Message-Id: <20180108154303.6522-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v5 15/31] sdhci: check Spec v2 capabilities
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
X-TUID: LGpSaA9HUZOL

with check_capab_capareg()

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/sdhci-test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index 492b332588..200d7bcee2 100644
--- a/tests/sdhci-test.c
+++ b/tests/sdhci-test.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "libqtest.h"
 
+#define SDHC_CAPAB                      0x40
 #define SDHC_HCVER                      0xFE
 
 static const struct sdhci_t {
@@ -40,6 +41,13 @@ static uint32_t sdhci_readl(uintptr_t base, uint32_t reg_addr)
     return qtest_readl(qtest, base + reg_addr);
 }
 
+static uint64_t sdhci_readq(uintptr_t base, uint32_t reg_addr)
+{
+    QTestState *qtest = global_qtest;
+
+    return qtest_readq(qtest, base + reg_addr);
+}
+
 static void check_specs_version(uintptr_t addr, uint8_t version)
 {
     uint32_t v;
@@ -50,12 +58,21 @@ static void check_specs_version(uintptr_t addr, uint8_t version)
     g_assert_cmpuint(v, ==, version);
 }
 
+static void check_capab_capareg(uintptr_t addr, uint64_t expected_capab)
+{
+    uint64_t capab;
+
+    capab = sdhci_readq(addr, SDHC_CAPAB);
+    g_assert_cmphex(capab, ==, expected_capab);
+}
+
 static void test_machine(const void *data)
 {
     const struct sdhci_t *test = data;
 
     global_qtest = qtest_startf("-machine %s -d unimp", test->machine);
 
+    check_capab_capareg(test->sdhci.addr, test->sdhci.capab.reg);
     check_specs_version(test->sdhci.addr, test->sdhci.version);
 
     qtest_quit(global_qtest);
-- 
2.15.1

