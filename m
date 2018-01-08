Received: by 10.28.173.206 with SMTP id w197csp2632392wme;
        Mon, 8 Jan 2018 08:04:30 -0800 (PST)
X-Google-Smtp-Source: ACJfBosZZ+6ucn1Z7O/KRTCWA9FM2DPVNhmrRT+rUwYwqScSj7vLXqqAfajz+L1nYZX0qC268QWG
X-Received: by 10.37.190.145 with SMTP id i17mr11489961ybk.78.1515427470169;
        Mon, 08 Jan 2018 08:04:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427470; cv=none;
        d=google.com; s=arc-20160816;
        b=bpKDlCQD/76O7PAVg6z/iPQW3AN0YyATbERsst2WJK9E+VwWV6XoGTDeD8EfUPm6FQ
         rSYAww4HrSWFgBMxRR5rflbL92HkY/6zTacrgMjwI4qczz7+IHy+UMfYq7R2w4xEOJGl
         Td0NBmEfML1rMQC0ebXA6RsN9seIYhdcH0A5Vf1bw5SSQpMS7xPDjOebNdArgb/HmfMd
         7xzjz0i9gbNzE9VHX8WIs0MXUYOvjhwvle0OVbkzPdtGYB68PGGXsFkuw/KwZr0QC9Yw
         KYip4RrZpkcCFWuUvYwTBsfL0vQ9JAGrSiDm9ry6uEKc82+ZgyY6JCRR1psckFP9mCYW
         cVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=LB2vR+xX5B7po0OaUd258WDwiRr1Lql0ZJ7HTew9kDU=;
        b=ZkJp8r2tVMQwy0+UgquyltW/khoQlkHwyetgu5eqdA4My1uSqpDywQ+5xAnGsdcbvV
         AQivPorN1FRLxBqwVfg6QBnKlXceA+T9qGyGo3Or8Z+7YDs1r9njkq0C9BZ4h6VUZW9W
         mc8QDnl6LrLgwLiOlK5iySxHTTx1olqrULfAjPXyil7vpYrqblCJoMpuZJpFgrprBAN5
         tDfngXAhiu2fmcMFtIpOxqXss997fl3BMsLtZZsIJVQseBgkM3CL8/v2gogIq2FlDB8O
         +uWV/KgPJFErtvS51cXtbGqvDEbxgP6vYfval1cxkoxCQE7JUxpBTGDU6//tJW/gfHix
         CudQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fbtanog/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a20si2564426ybj.340.2018.01.08.08.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 08:04:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fbtanog/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZuX-0002TL-IO
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 11:04:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcQ-0003Ef-VE
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcQ-0000Os-4P
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:47 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:43548)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcQ-0000OO-0M; Mon, 08 Jan 2018 10:45:46 -0500
Received: by mail-qt0-x243.google.com with SMTP id w10so14076779qtb.10;
	Mon, 08 Jan 2018 07:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LB2vR+xX5B7po0OaUd258WDwiRr1Lql0ZJ7HTew9kDU=;
	b=fbtanog/HFIiOleYf2efbN0DYKXVhO39loMNgvOD17b+scNKBySiaw1xmb3hy45JxX
	s7Z3lo/1bmIQB6GObctIWTJIinoAurLuE0SRm5sdtFVwAJAzNqCL+XExgniIUeEhx8Qu
	YBQIdQsIWxSs8gyC7A7MErIlpgI8J/sSgg44VSWHeWjrrnm4X9rH2HtweczjDI2/zLGd
	qTuli1umYR5AIb6SL53iQAE7/OBbFexWK1TrJqqnEZ4E02Xs8KNsH6czknXe/1SS+1YH
	AOHl+tH8HSHC/fvEFYlNTTHpDcVz55JEyvSVxfbRtrqw1OeTLic2A0sFrtWQtl8jKyhB
	UY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=LB2vR+xX5B7po0OaUd258WDwiRr1Lql0ZJ7HTew9kDU=;
	b=YdgSFmFPCs58e8WF5mLFRNQNMS4Cn+BfP5eUtL0cbLK4tdCrkrLWZerKx+DjH61rep
	b336yiU6MCzPjG25cvveIUY99piQHoXaP7ea7t0qJc0ITQcBqYq0S5xLO4qwOV+idvLV
	z6YsEV9wXRUvLv5G3Xv8MAolGohkkNGAYZxsap8Zka1ddHUFDGj2IgcK9Zu/H5yp3w1V
	2v+9JshvLiO0BZ9kfrKqPk9EF+Q22Oj3L7wp8p83M1THkfA+Z/NyEnLpAkT7bD0PjnGA
	FxGxEqofDGf6poCw7gs8RnM6JczvvqonVFMhB1V0rEVql6qhdPbDaeJtqeCTNXr1A/TL
	/ceg==
X-Gm-Message-State: AKwxytf0M7XBLKfPG6fOmqxbw4bQqJ9TaoM5UTDuf7FogY0QLMkFFJ8l
	ULqVyCvUW2SR4moJZ2E+izU=
X-Received: by 10.200.45.148 with SMTP id p20mr16634813qta.249.1515426345501; 
	Mon, 08 Jan 2018 07:45:45 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.45.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:45:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:43:00 -0300
Message-Id: <20180108154303.6522-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v5 28/31] sdhci: add a check_capab_baseclock()
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
X-TUID: 5lOXwNUJwLfi

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/sdhci-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index 0443a23e45..2aa3fa0d3b 100644
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
@@ -99,6 +101,18 @@ static void check_capab_readonly(uintptr_t addr)
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
@@ -108,6 +122,7 @@ static void test_machine(const void *data)
     check_capab_capareg(test->sdhci.addr, test->sdhci.capab.reg);
     check_specs_version(test->sdhci.addr, test->sdhci.version);
     check_capab_readonly(test->sdhci.addr);
+    check_capab_baseclock(test->sdhci.addr, test->sdhci.baseclock);
 
     qtest_quit(global_qtest);
 }
-- 
2.15.1

