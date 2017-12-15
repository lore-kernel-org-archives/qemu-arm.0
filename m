Received: by 10.223.159.74 with SMTP id f10csp7098381wrg;
        Thu, 14 Dec 2017 19:28:06 -0800 (PST)
X-Google-Smtp-Source: ACJfBosmNPX6F4hMZhWnuhonCnobeaoUmdIr6399YiCieERGtiCAXBQcW1DsGBISmJ3Ebpv7xyDy
X-Received: by 10.37.32.139 with SMTP id g133mr6233836ybg.519.1513308486389;
        Thu, 14 Dec 2017 19:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308486; cv=none;
        d=google.com; s=arc-20160816;
        b=SGABjZdk27K7G+rXyRsWNrF5VmgyyM1EvXsHQtZ9WN+Wxv/fK9CeZ+YgjJvxtf6xIr
         IHZOXyDLIbzinOqjkT9jOBZuBIXRnao7VKZbhb4NPdJktsmQfGdrZPVi5II16aM0jSiX
         pZDokpcRAibpaJ5FqRaOEydWjJj3LrabRbi8YqeUeT6mAQUjLCZA7pzZbRHUSs9hf2Td
         u9y7dOuNoEqSjpxMXJcpJsfdGTzl8elhZW+6koHBuhrr5HHZvmXYXOgwyRinqYXYfSk1
         exqooDtnGQxYJadmYNWJjS7XfvFXAImcniuVhmb7Ga6vCw8jReZAhLcSfTwptCB0Mrhr
         pJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=X0bQn7z+PaZ5TjJcJ6dVLWpvAeJC2iznautj+bGfUrk=;
        b=DLvlRP+HK86XrSz8kKC4saKDPx1/H8Mb7d2ehMS+cVBFkmLwYrwai0sIKlNVkEFS1I
         P4stwa2Mr07sI/UlOoUK5cVT+o0hP2vUozJfvM0wq0mCEWnGj9lhhnONEsDF/BRFz6Ml
         6Np38VdULt6E0XgJhOE8uQU71loy/7K8fwZ1nw1OQy/M1tJs2YPHHvzLl2NcIVkm7MIe
         6+dAhtj9sK6bYhpEBEcHeLOF2uaMifBFYRl46K1QfdelldWxLT1+TujdM3kKSLp1Z+Ep
         rmCWuTmgL9pqilh7lLgFIb3AMi80OJcqtP6xHV0rbwqfITrk00QGp1QEurUnzG0tuJ3o
         fwaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RMo11nx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h16si1096448ybm.449.2017.12.14.19.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:28:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RMo11nx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgfN-0007df-Nl
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:28:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWW-0007su-8X
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:18:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWV-0002u0-DJ
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:18:56 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:44111)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgWS-0002rJ-Jy; Thu, 14 Dec 2017 22:18:52 -0500
Received: by mail-qt0-x243.google.com with SMTP id m59so10524738qte.11;
	Thu, 14 Dec 2017 19:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=X0bQn7z+PaZ5TjJcJ6dVLWpvAeJC2iznautj+bGfUrk=;
	b=RMo11nx7DB771QTXO8XwgCpGctTgL19TSDyNGXohuc7DKVomT6C8ScYSMmwCAiW2Ax
	Vi+86vLgf3pCMuHoMEYue9ZbxFxaF6wyuYv43fTUkPDIo87Q2Nexp46a/g/nyEHHxr/2
	R7Fzv+U6v/Iswab8h5LfxMCRrqxj4Cn0h6dq4K8uICZg2MxXnUyf8ClzdN1exyjbAkd3
	sk9jJxAZCayl7RO+8or1Tdf8ZVzLgQT6mjhh0GUpqq9TAlmgkKB3buAZZsIDPZIgOIwN
	AmJeND97VT9OKSiYO4XUppnguMw1gmNHrFRCIT3i3pXPE2jAGXU7fF52nc7YyP1rHMlr
	anXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=X0bQn7z+PaZ5TjJcJ6dVLWpvAeJC2iznautj+bGfUrk=;
	b=nDNHeZr+IxXdJtH76V+gzhqezL6T53mKgPN6FRzapuemrT8FLaapRpN4Ab24qyyZ+T
	ZPe0PqTVwn1r2Iz0/nxabaAsOse+tTWvVxF71oAtp1U3r5sJkOmAhnlo0eeOchpY8WoJ
	5FgqzlxwFnXYsQK6CfMEgAngI8v0zd2zzhplKAb/JnJrrTp0nBSPdI+J5bCvpMjwf5r7
	4AtE/reKcMUldR4PZdvjnJdDvHtFhaRP0YjhZMFKM688HiQJlrwaobH4lBT5bQ+phdMo
	4QYb+OwVNAnfERGfpF2VJ8mBc7drKNxrTA7xSSnLHSlKWbxeTEBMIMGJmnSiqbA/GnvQ
	1KoQ==
X-Gm-Message-State: AKGB3mJlRHZAY5gFcEo89608sefB8W0mrMW8MM8I4Tlg4QrsGnAnTtVo
	uu/zR3dltTaBGk0jhcwMk/Q=
X-Received: by 10.237.34.168 with SMTP id p37mr21463211qtc.136.1513307932152; 
	Thu, 14 Dec 2017 19:18:52 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.18.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:18:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:47 -0300
Message-Id: <20171215031547.31006-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v2 20/20] sdhci: add a check_capab_v3() qtest
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
X-TUID: ARMb+b6GOq1l

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/sdhci-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index b7646bccc6..60b28f27b3 100644
--- a/tests/sdhci-test.c
+++ b/tests/sdhci-test.c
@@ -13,6 +13,8 @@
 #define SDHC_CAPAB                      0x40
 FIELD(SDHC_CAPAB, BASECLKFREQ,               8, 8); /* since v2 */
 FIELD(SDHC_CAPAB, SDMA,                     22, 1);
+FIELD(SDHC_CAPAB, SDR,                      32, 3); /* since v3 */
+FIELD(SDHC_CAPAB, DRIVER,                   36, 3); /* since v3 */
 #define SDHC_HCVER                      0xFE
 
 static const struct sdhci_t {
@@ -103,6 +105,21 @@ static void check_capab_sdma(uintptr_t addr, bool supported)
     g_assert_cmpuint(capab_sdma, ==, supported);
 }
 
+static void check_capab_v3(uintptr_t addr, uint8_t version)
+{
+    uint64_t capab, capab_v3;
+
+    if (version >= 3) {
+        return;
+    }
+    /* before v3 those fields are RESERVED */
+    capab = sdhci_readq(addr, SDHC_CAPAB);
+    capab_v3 = FIELD_EX64(capab, SDHC_CAPAB, SDR);
+    g_assert_cmpuint(capab_v3, ==, 0);
+    capab_v3 = FIELD_EX64(capab, SDHC_CAPAB, DRIVER);
+    g_assert_cmpuint(capab_v3, ==, 0);
+}
+
 static void test_machine(const void *data)
 {
     const struct sdhci_t *test = data;
@@ -111,6 +128,7 @@ static void test_machine(const void *data)
 
     check_specs_version(test->sdhci.addr, test->sdhci.version);
     check_capab_readonly(test->sdhci.addr);
+    check_capab_v3(test->sdhci.addr, test->sdhci.version);
     check_capab_sdma(test->sdhci.addr, test->sdhci.capab.sdma);
     check_capab_baseclock(test->sdhci.addr, test->sdhci.baseclock);
 
-- 
2.15.1

