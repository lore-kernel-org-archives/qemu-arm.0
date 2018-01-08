Received: by 10.28.173.206 with SMTP id w197csp2636038wme;
        Mon, 8 Jan 2018 08:07:27 -0800 (PST)
X-Google-Smtp-Source: ACJfBov25gy7ZPdJTF7wIOqxuDMu91Lsx6zGB4AyQ2qqubrlBCC0WNx0PgeoG9DM3mwW83UMg37r
X-Received: by 10.37.115.213 with SMTP id o204mr11828482ybc.244.1515427647820;
        Mon, 08 Jan 2018 08:07:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427647; cv=none;
        d=google.com; s=arc-20160816;
        b=k5KEFhBqVtdDzyaU3clO4OoVkbjhM4Y0I3mPVjs4bfYLOrBSXx2axVOs4AurQ/V/Zq
         ocfWVqLSqsFLrQG/fOHf+6Cs58YJkvPv5gZ8JRTqS/c3XBWZPUit7J9lsz4OtXeGOcaD
         Vj3Z7HqwhnYkSAsHr81bls0sHO4pT2KZ7DvMWEsUhkRluA7YpG72PhtoSY7aHP2FtYYl
         w7H9lw4u7eTLqVtyfugXI8y9ga4DiSk6Rt64PtMLO6TlYWJifZ9C5FEsyj5bxL4T4bWX
         Ez9wwRCAPOKzsWCCcUcObvQOLUc20relzeeZ5eI/u9InQZIFkp8YTrFJ7WRBcE5Vr7E3
         iAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Zi5btWNAivsb8igglLB2UASurWb1iE36wSNjba799BU=;
        b=wwgRffWLaxyr3/bse2i3omHY30Rc5n5LntZirtvsRZ4XSD8VkI5JQx+8J1lN2bJZbH
         EypnaXE5IdfurmzDdL7LtkJNLyb1I+dcF3/JYbi8Pdfd78e0lI92xG/Kn+BOdEF8HjGc
         hk09Cs4ln5BwDTAFDlgja/TMxDWwxKbbO/HUegnFK31uZKGGsfXd6byMVXHh9/5dvePj
         +yMXrIo8qUrDkX9ijivfmcgNQzK028Mz/EHfWVmOEgItRxw7INX4pYYSetiIYU3iM1H6
         x2s4zR+O1Y/4OthcFiyu6xTjYQjMpFVlo2vT7ectu7EF6yoI0Lbf8uXp9eXY8RwHLAfA
         beQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GczFHeFH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k8si1159349ybg.350.2018.01.08.08.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 08:07:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GczFHeFH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZxP-0005B7-4m
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 11:07:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcW-0003JC-6O
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcV-0000UM-FU
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:52 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:32781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcV-0000Tw-B2; Mon, 08 Jan 2018 10:45:51 -0500
Received: by mail-qk0-x241.google.com with SMTP id i17so10257586qke.0;
	Mon, 08 Jan 2018 07:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Zi5btWNAivsb8igglLB2UASurWb1iE36wSNjba799BU=;
	b=GczFHeFH+sgm44kWNtL/9mYGrdFBrZHZvowqjSO6jH74U3VeNNoBMqEglNCWFRKf1X
	hxn6hrc3CSGQ9jj6Ztu4v2lh9BaWFSNIsw0dFtgs8YCYIrH/zAxkiEK9tU8t6op4uL3u
	LI6pye6T/Tqnzbza1eGHDyAYvQ1Sg03l6XyPjtdizQyZJ37uqoYpSA5GFN6GDzkOUIas
	SRKgVu477tugsvM3dJJNPEp7amWgimdGxkAJaLgqS48n9+g5HZlMM9qKxrDtHd11fr7D
	e5lRkqXm2RmppVxat3AtvPaIg3xU6nBtk0HAVUA1RKcE9LIJMw8fthFtwQbjEiKIojQj
	XZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Zi5btWNAivsb8igglLB2UASurWb1iE36wSNjba799BU=;
	b=foR718qgTAnyRvtnhjsjryvPfrBmNse0lWnlu2kK4PR+Ah8esyW0IKj4UUZEzgJd2H
	FsIUZRyaLln+IobCl0PsT8fpFpi9igqB3Meti7cAN8cRbbAGURTWHhFIJoUUg9xUh9xs
	I93qaYuU0vYNVk71VUGeT920ZJ9AWQH7US3Vzlwdm2xjtoZaDKWY85RrY1CP8+KqNbq9
	q41mfcESqDhBf7gXYUKUDX0BADTOnoHb7kMpDc7uiCJzHfIk3Uha0yRW0Q4qxFroKiwj
	+vsFF4EPsF7ROHNGOm6IF7x0PMCPiDlv96YE7XYSmR16RR7+ukFGqdMiGlV+K0eIYd/Z
	9XHA==
X-Gm-Message-State: AKwxyteTapFRxWdLLnSvadeWwmAnFEiUDB6zpMvk1NIqeySwb/M37jlS
	jOIE2LdfI7WYAdf0wAkDQdQ=
X-Received: by 10.55.78.143 with SMTP id c137mr17549934qkb.122.1515426350787; 
	Mon, 08 Jan 2018 07:45:50 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.45.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:45:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:43:01 -0300
Message-Id: <20180108154303.6522-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v5 29/31] sdhci: add a check_capab_sdma() qtest
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
X-TUID: F6BQ18XDWkhB

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/sdhci-test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index 2aa3fa0d3b..91b1b29d75 100644
--- a/tests/sdhci-test.c
+++ b/tests/sdhci-test.c
@@ -12,6 +12,7 @@
 
 #define SDHC_CAPAB                      0x40
 FIELD(SDHC_CAPAB, BASECLKFREQ,               8, 8); /* since v2 */
+FIELD(SDHC_CAPAB, SDMA,                     22, 1);
 #define SDHC_HCVER                      0xFE
 
 static const struct sdhci_t {
@@ -113,6 +114,15 @@ static void check_capab_baseclock(uintptr_t addr, uint8_t expected_freq)
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
@@ -122,6 +132,7 @@ static void test_machine(const void *data)
     check_capab_capareg(test->sdhci.addr, test->sdhci.capab.reg);
     check_specs_version(test->sdhci.addr, test->sdhci.version);
     check_capab_readonly(test->sdhci.addr);
+    check_capab_sdma(test->sdhci.addr, test->sdhci.capab.sdma);
     check_capab_baseclock(test->sdhci.addr, test->sdhci.baseclock);
 
     qtest_quit(global_qtest);
-- 
2.15.1

