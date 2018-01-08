Received: by 10.28.173.206 with SMTP id w197csp2641671wme;
        Mon, 8 Jan 2018 08:12:13 -0800 (PST)
X-Google-Smtp-Source: ACJfBov8gPyxoKKqrC8gyZFdrdJS8vMxBTKbprZfGIPY5mp2cXhpcBkav9OWEhkYq/xDub4nDEXe
X-Received: by 10.37.222.74 with SMTP id v71mr11403922ybg.64.1515427933670;
        Mon, 08 Jan 2018 08:12:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427933; cv=none;
        d=google.com; s=arc-20160816;
        b=DdU/+T0jkhH+ORo7rRlY657he7TDQrexbp/S0uf/zXiSVj4+ja80Vr4hw8qXCQYprd
         vpAWbZC5b9uxfaLfHGGv8Vl+lARgkbd6fCs8Tjqx0tiRrqz+PWhReKNNapb7kb2kgcBd
         4y4PsC7uNakI78fgNWVN/YFDxm9TVNGPca4H2uFLuYm7yhv72N/l41PQPS42A+y3HDGU
         SHzj5uyRaFPhIhdwR6FZC9GjJuUMdtaSM8eY62W+3U+rpw/BgogVOqjsUPQoZp9fFGOd
         ORpUnSFfUAmAHIbFafvWH499+fEHfrHAEWDg3jVmWX4kFGC7WMDB8V3/Vj6u2v/N2jUI
         eM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6bwuV6OYuX9oSfhGslGZdroqy838Q0FU0pN9u0oOcvo=;
        b=vydonSPkqLLBYFMefHDnlCtVK+DfN9881plbu5ZIFl2szUx/pDBLgNcUlOC8gulKlV
         wKD98ga1WTGB5nF1XzsADIj+YOrWe3sSk+kkzSPffteYLdW+41rf3d2dN+RV2vCu5sJv
         bY3/1zxeFfHgmnjF2UWhITkUn21EsNXoZVH5mkW7kQFh35yMYMC2Y2c8nyq0w6b3h+xe
         nOmkiLGn6j8CNSbvRw6LsTTCVGMqZ+KdwwbhHzKXCu0QdoiaSRiIh0n8kThNASA6iAKL
         oJAXzgSZwZ/way+xFhbJiDkgT7X4O4KAj9oTzmi51252ocKSfI+j8bpXeWuBR0PdrYjC
         moiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cNMRdX4M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l37si2611970ywa.579.2018.01.08.08.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 08:12:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cNMRdX4M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYa20-0001a6-VQ
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 11:12:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcf-0003Sh-MR
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:46:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZce-0000cs-RE
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:46:01 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:45260)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZca-0000Yn-CL; Mon, 08 Jan 2018 10:45:56 -0500
Received: by mail-qk0-x241.google.com with SMTP id o126so14630261qke.12;
	Mon, 08 Jan 2018 07:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6bwuV6OYuX9oSfhGslGZdroqy838Q0FU0pN9u0oOcvo=;
	b=cNMRdX4MMIocDTDJtwwe1kTK4f8Psl8z2ugrv1AvIn74EGYgi6DPpRzXk2F4zZoyw9
	nNYACAi6STd0c7orOllMF78s99vuDMfVt2hUwmsdePO96GYkWj22Uu7yAVt/MpQAbqa7
	Ewe5scGVsycdmb2l+eJUdGrdQpbcmss6t+IeM2QdG07NfJye4m/dpMghkZ1crZofpA4p
	6IdjajGBV6J+IwgoadorSvASZF1MR8MJS7j/cMkK1twiWpMjMWLBtWr1Q+jEp1Y86LIK
	JmNQ5Rvvm5SdWe1Zs/hUZn5ra56aRuDwBrARE50Pw9RG+CckefppY51J7FppiDcjIWl2
	cf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6bwuV6OYuX9oSfhGslGZdroqy838Q0FU0pN9u0oOcvo=;
	b=XzuunuT7Wge1z0y/GsU3l/mwjhmlssHEwjdRVBoda9TnJJ9c1GKL3Mhd8P5pMqutJT
	t6NgN1jpacScumgTcGa9JpTjXHBTDUVrnbv288OvfZ0vPUcq6Iw6p3ILgeEHjrG2g1wa
	uFp7ipDOfE5QwiAKRRUyDPAbu/ZzTGposDi8H42kc65fOxmEjVcfVyTXc3H+3WeuBScJ
	hrOynWOwVL+4NQZxqS5uzunUKbVMhDvMqGp2DzxAznb5wpsT0tZ0b3MxrPmMqwPCq6M6
	k+sVQav5C4LXPrk1iTZ/G4L3YEC6PyHIzAH0tO0UYAbPLJfEsRhnG8KHsdaBnyemB3Wg
	O4kg==
X-Gm-Message-State: AKwxytcUq+DA4my7TitdWP3dm7DzcfOzCLlrf8PmhLfQ07TLRZpvawii
	CdLvd48AhVMKSNs4kRxcICE=
X-Received: by 10.55.43.222 with SMTP id r91mr17070064qkr.309.1515426355785;
	Mon, 08 Jan 2018 07:45:55 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.45.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:45:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:43:02 -0300
Message-Id: <20180108154303.6522-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-arm] [PATCH v5 30/31] sdhci: add a check_capab_v3() qtest
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wzRfdkJNwNnu

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/sdhci-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index 91b1b29d75..6ebe9f4d25 100644
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
@@ -123,6 +125,21 @@ static void check_capab_sdma(uintptr_t addr, bool supported)
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
@@ -132,6 +149,7 @@ static void test_machine(const void *data)
     check_capab_capareg(test->sdhci.addr, test->sdhci.capab.reg);
     check_specs_version(test->sdhci.addr, test->sdhci.version);
     check_capab_readonly(test->sdhci.addr);
+    check_capab_v3(test->sdhci.addr, test->sdhci.version);
     check_capab_sdma(test->sdhci.addr, test->sdhci.capab.sdma);
     check_capab_baseclock(test->sdhci.addr, test->sdhci.baseclock);
 
-- 
2.15.1

