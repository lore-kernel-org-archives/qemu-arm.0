Received: by 10.223.159.74 with SMTP id f10csp7099555wrg;
        Thu, 14 Dec 2017 19:29:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBotJ83/w7bcDTLkzCiyr/+2o74FE3nxRPu5vu5og/fLL5zUhgyz3Gf11nsLFHTlLP+ugfK4c
X-Received: by 10.37.230.130 with SMTP id d124mr5885832ybh.349.1513308586892;
        Thu, 14 Dec 2017 19:29:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308586; cv=none;
        d=google.com; s=arc-20160816;
        b=lQP95kTdK/se/Jw3x6gTxOa6T7PFip18CFB7P0tQDVFxo2TTHJ80D8RYWiBgPkJxAW
         DSbroe5BtNZLCSbqnHFljQXDIsZn4y1jIqeQxD7friEEA/eI3hbYDLc9zpffvAr0rZNy
         9k57/0O2T9dcdmSCQ/HSXnL4zptYELJL37/rgJkyTt4+fSSIg3E0TVtkMzsorEq0lNyK
         eh1O71P5El9rM1nn8RLNPr2zYE+pOpvDT8+MQxYGm6GXaLdIAMSWt6ZvUA5XKMO/1qsb
         1vcltRa4oc5+G6LIigNiou6xZWDLt8++faPG6YUhIt8QR36bmnEn13oWcDiHwq5YJi7C
         6Iaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=nwg4RAxwg+fQhsHJvTISNbwKqPGxHP5057iM/3xBWyE=;
        b=bIOSYRQdd2o0mO5kiEh5z5RwMcKSBI+sdFiJNF0NPp/BRFNzS/CEhmMwp+Om/Y3UIN
         kkpytTthFL1BRwYaRI3V4r4bDyczYwIF3yLQngNI/og0gxXEsk7ljeCZuqbthb8E0XQ6
         /VybxjzvjLESAWwUuRmkQEMwXR9Mqawtj6NJdj89uupVnAfYAXuz5iaf5o5rWYWA8+rS
         +BxJba9YHAY+R9GRwFySfAdwjZKn3NyYbTjE9Kkm2JPwej4aeZG1tdBhdMWThcciWo6S
         6vaLL1Pj+yCAuIplaUotKuDDcR3TYMPL0fVZrCaztd+OSd09f+2KURHGz3GUuryED8eX
         iBrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GX8RVacL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h62si1108726yba.202.2017.12.14.19.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:29:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GX8RVacL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgh0-0000dl-B5
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:29:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWN-0007mD-62
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:18:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWM-0002mc-BO
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:18:47 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:40350)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWJ-0002kL-9p; Thu, 14 Dec 2017 22:18:43 -0500
Received: by mail-qt0-x244.google.com with SMTP id u42so10557606qte.7;
	Thu, 14 Dec 2017 19:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nwg4RAxwg+fQhsHJvTISNbwKqPGxHP5057iM/3xBWyE=;
	b=GX8RVacLn2MkaADAIx7Ux6NIk7DFOciYQgDQDa/T7C+QZFs9AnxdF7PJdMT72QAGCP
	ccer6H8SUz0RawbY47pDEmwteNOOE1BYnBcPRUpNJNFRDzgzw4ll0UPeH8rkLel4sytX
	xdUf0KGieburC+g1bOY9YP1qIFB3XkLOhFsv0U5J90pRS54IzgxbcgLTXU47cT78A5S4
	y2cvDWJHHqtcuoUx8JVkEmjEyQVXgpfYBFedgS+4stMwa+0hjgcXvOQRwU5QbhoKoQC2
	A5b1ybLenU00N9fJB8r08CU9gizicR7W0MuU94oPg50QOXgglIrhgsX/AGMdohh0j/NM
	XXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nwg4RAxwg+fQhsHJvTISNbwKqPGxHP5057iM/3xBWyE=;
	b=hmz8NoSQCifOcq/xAy3xYuI4rXGJq2+Sq9cjJqsbbgUx+v4i1FD+l9xmAJJuau7tgF
	anTfPWPwEJ4HnyF4h0lNEv3hOhvEHao8QmH37BM3Az6YrB7+8OcwGqUQ6jTdtE/kf44x
	vMXztuWahuJ24NoTHjXD8SCpj6x1lSyx+lK4/G5W4KIHX7A35QqgSBPAv17o3K2MAcPL
	p/Gq9Oc4x+YFoZm0v0YqHBs5padd5fhiHpCIB4nRFtIx43UcLsreIjZt7QFxZx0c+0yI
	kfH9VzUUSlfseHken7Zjj2kFTf74CdGJqBvlqI0jj8OgznoSM4JQa3lcJlPgvmId0a3r
	hbkQ==
X-Gm-Message-State: AKGB3mJ5b9JvYQEnJPFA9A5PSVmKSU41MSaoPRra9KwlOAC/DaHVhDjU
	6dIkfJYE9EjLEDu6XAmUGB8=
X-Received: by 10.200.47.169 with SMTP id l38mr20334284qta.183.1513307922862; 
	Thu, 14 Dec 2017 19:18:42 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.18.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:18:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:45 -0300
Message-Id: <20171215031547.31006-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-arm] [PATCH v2 18/20] sdhci: add a check_capab_baseclock()
 qtest
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
X-TUID: 4UrnlLiTvqfm

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/sdhci-test.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index 01373a69df..966bd00499 100644
--- a/tests/sdhci-test.c
+++ b/tests/sdhci-test.c
@@ -7,9 +7,11 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
+#include "hw/registerfields.h"
 #include "libqtest.h"
 
 #define SDHC_CAPAB                      0x40
+FIELD(SDHC_CAPAB, BASECLKFREQ,               8, 8); /* since v2 */
 #define SDHC_HCVER                      0xFE
 
 static const struct sdhci_t {
@@ -18,16 +20,17 @@ static const struct sdhci_t {
     struct {
         uintptr_t addr;
         uint8_t version;
+        uint8_t baseclock;
     } sdhci;
 } models[] = {
     { "arm",    "smdkc210",
-        {0x12510000, 2} },
+        {0x12510000, 2, 0} },
     { "arm",    "sabrelite",
-        {0x02190000, 3} },
+        {0x02190000, 3, 0} },
     { "arm",    "raspi2",           /* bcm2835 */
-        {0x3f300000, 3} },
+        {0x3f300000, 3, 52} },
     { "arm",    "xilinx-zynq-a9",   /* exynos4210 */
-        {0xe0100000, 3} },
+        {0xe0100000, 3, 0} },
 };
 
 static uint32_t sdhci_readl(uintptr_t base, uint32_t reg_addr)
@@ -75,6 +78,18 @@ static void check_capab_readonly(uintptr_t addr)
     g_assert_cmpuint(capab1, ==, capab0);
 }
 
+static void check_capab_baseclock(uintptr_t addr, uint8_t expected_freq)
+{
+    uint64_t capab, capab_freq;
+
+    if (!expected_freq) {
+        return;
+    }
+    capab = sdhci_readq(addr, SDHC_CAPAB);
+    capab_freq = FIELD_EX64(capab, SDHC_CAPAB, BASECLKFREQ);
+    g_assert_cmpuint(capab_freq, ==, expected_freq);
+}
+
 static void test_machine(const void *data)
 {
     const struct sdhci_t *test = data;
@@ -83,6 +98,7 @@ static void test_machine(const void *data)
 
     check_specs_version(test->sdhci.addr, test->sdhci.version);
     check_capab_readonly(test->sdhci.addr);
+    check_capab_baseclock(test->sdhci.addr, test->sdhci.baseclock);
 
     qtest_quit(global_qtest);
 }
-- 
2.15.1

