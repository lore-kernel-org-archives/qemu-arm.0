Received: by 10.28.173.206 with SMTP id w197csp2630533wme;
        Mon, 8 Jan 2018 08:03:06 -0800 (PST)
X-Google-Smtp-Source: ACJfBou9PrAvxMjHlbBxoirVE8MrETOo9jG91gF4sXf6zPKyTBOGXvw+lyPuxCKV4edQV84EEKWq
X-Received: by 10.129.73.86 with SMTP id w83mr7095701ywa.391.1515427386418;
        Mon, 08 Jan 2018 08:03:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427386; cv=none;
        d=google.com; s=arc-20160816;
        b=T1pj4U9KM5JxErcrNNmSs1C7GkI3F7wCAYnlkd4RS6gnquV3K6RNAFJGOt0Jp8A9oh
         ETscXtJ+RjBdeUFH1AwxQV5dqErIHX0P93wvjvTWWPGq8/9sEzittloL7bmOha+EBiOu
         HOo+ooF/rmgCvjY0C26cayzQsa4f690moJWHngEwtQggfzqEGCnyk6wq8tMvvDnTyXl2
         YH+g4q1P2h9Nz3EWTJKfDrSuao6ksgGdUAlwZjB+Ha94YaMEOxpakJR6rRJNYoHoUD9z
         rUvh++yafaY0DbO91FzpQb9VMANXtY9OQM5KLL0ijvVJWmFX3O53YloU6RAhwLTYEhti
         moNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=k6sbl/indurMO60PqiU27VM0Ou/IYENUxu4LHz1GzBM=;
        b=0fm8JRzkayIKqTKeJOm+kkGu6/pesPtH52eNJXB1hMGR9bRlCTvW8CPMG8t4G7GYgO
         HLdm1ddzmRvE4cH6rvJr/b5UCuIyXALE0tisAOaivBrd7h+V3tyKe6j/U9qs68vXQFVd
         z1VrRGwuRDnsqeCj8kLWY/K3Pjr5POiVEpRR3QZD23IknmUgQqVfMzL7q3oTKZQVEwVn
         vfhlOcgy651hgtuR/KYKo4XnoaZeflCL+M5qlvx5XOCf5EDuyItyvzv0uTpMFmiA9Ion
         8KHtz/WGIJlb1AvrvKyLfoNIAcxiuhIANT1uR8Sf1owCIApd7UrU+0NYpjqS4Af9uG31
         sN6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ErSlRbJO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v130si2498288ywa.182.2018.01.08.08.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 08:03:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ErSlRbJO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZtB-0001Eh-P2
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 11:03:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcM-0003AW-6z
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcL-0000IN-4X
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:42 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35055)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcK-0000I0-Vu; Mon, 08 Jan 2018 10:45:41 -0500
Received: by mail-qk0-x241.google.com with SMTP id w184so6458037qka.2;
	Mon, 08 Jan 2018 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=k6sbl/indurMO60PqiU27VM0Ou/IYENUxu4LHz1GzBM=;
	b=ErSlRbJO0keNNhng1WnsLIWv22K7iKDzFa23V5kwjCi0bmcO/fdZq14FdcQ8CqLYbp
	hBAZ14QH1Gmaxuw2NH/pfuk2GGO4aGzkrLqt2vY/8011CujZKKLhvuqvAdsBbkagaNB1
	jhS5YH3F40SN/TJA1+BYrEddvQ+YKGmwOP3YXibIZSuOLRtc2A8IzgT6wXkK5eVdSCFu
	P0AIJCIHgYOchO3dwrLd/1wKKfp8DAKzA7b6aUuKBzvH+lKrJl1X2fzsZwnm2WdQbGtW
	F1kJ2K7yZhuddQVMfm+3U7Du2PFUqdbp7ok2qikujGeBF6U9T2HcDGYbWzzlbJOccc0J
	c1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=k6sbl/indurMO60PqiU27VM0Ou/IYENUxu4LHz1GzBM=;
	b=Hj13CjYnr598zuN/3CFgO80BBRfuYjBxakcufi/DLc38IkwFofkTA7wgltIsad5H07
	fgsLXuUly5KKm/OakLFszvdAnDvrQYTrUMNL9v76O+cQCwnHi/ET5dZxSijo9CnqPOKB
	6x829mx9Ca9gaT2zjRrxgsx0Lu4CzXuk+iNdiFKB7Sl2ePQ1hq7bPM80sptUP/NMbgEN
	LjFx9qE0gdOQ5AE9vG3j5ySqrGeXC2aUUloO8YJU3q01qnd2GQVT9thOHuGn+67RIJ4w
	vPqNprd6J0Iik5g7eX2ycqjxYcKBSMNgYr5KUuUIjgf9B9fBCiIzdIabQW1jzmsfVB3B
	zKCw==
X-Gm-Message-State: AKGB3mJBxUSF8MrMQt/y+dmKvHPn9jUFle51CO6gNWpYlnGcXkFdljSv
	iX9K4J/LGeafT69YHCvLAhE=
X-Received: by 10.55.106.195 with SMTP id f186mr15587965qkc.53.1515426340460; 
	Mon, 08 Jan 2018 07:45:40 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.45.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:45:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:59 -0300
Message-Id: <20180108154303.6522-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v5 27/31] sdhci: add check_capab_readonly()
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
X-TUID: 2wvmGyG6kcb7

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/sdhci-test.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index f7487808af..0443a23e45 100644
--- a/tests/sdhci-test.c
+++ b/tests/sdhci-test.c
@@ -60,6 +60,13 @@ static uint64_t sdhci_readq(uintptr_t base, uint32_t reg_addr)
     return qtest_readq(qtest, base + reg_addr);
 }
 
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
@@ -78,6 +85,20 @@ static void check_capab_capareg(uintptr_t addr, uint64_t expected_capab)
     g_assert_cmphex(capab, ==, expected_capab);
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
@@ -86,6 +107,7 @@ static void test_machine(const void *data)
 
     check_capab_capareg(test->sdhci.addr, test->sdhci.capab.reg);
     check_specs_version(test->sdhci.addr, test->sdhci.version);
+    check_capab_readonly(test->sdhci.addr);
 
     qtest_quit(global_qtest);
 }
-- 
2.15.1

