Received: by 10.28.173.206 with SMTP id w197csp2626696wme;
        Mon, 8 Jan 2018 08:00:19 -0800 (PST)
X-Google-Smtp-Source: ACJfBosND0WgvJJaV8dvRxA+XBsLlKFbAbxTaFWeHoi2Aau+e04TTfV92objJl3wsrf4UDe6nOUK
X-Received: by 10.129.131.209 with SMTP id t200mr5959756ywf.403.1515427219893;
        Mon, 08 Jan 2018 08:00:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427219; cv=none;
        d=google.com; s=arc-20160816;
        b=x7d3SvmDCzTvBItkorVGx6ZwGvRRvpZkTKNIqL0kChVxsZtMoJJA/9MlyCC+NnCymK
         n2ERSgm98RDUVCPWarDdmXayU/MMk38UNC3M0VWdubRgTcj9g3Vapyu1rXYgWCI1czF3
         94P/OWfT5mrdSCKG4j7MF1YfoCb4sSrdaQLEARwabBgj0lzk5hMOWblEScdbk/CgdUT4
         CU2SafLh97L+11gHsNbDcprqddVM2T+oAciJP2Mtu5v7I6DtFQNm3OAWJDWNYxVyLtdG
         dHaeGLapYWbJMoTC3JJDP+l8qNCBTH/kyt56Bav+fW3uBJpyUqrqLJw/l64QYKcyKDY8
         ymOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Q/21oj98KwgOw1mt9bBDqn3YjCkzmwZFbIMbXSvA+Ic=;
        b=jZChTOnNdKC2fdzC3XsgrAZlRjj4pyUPDNaQAuSgJ4LeLLVWFHNUXjbWaC2gbddCP5
         s7ePzXHCRNDtih6guVVeo6dvetP7Nxg/4GN0JNRd9+5Tkv9vnuyKjMr0Px/n5Sa5mQiu
         sFYWBdyU9hlSRJrXBTM6ueRgSWIvDW9IR4yfpvUpL70e/p8uLQLKS7wv1sAWsck0QBda
         OoiKfYkxYmz7F5I1znmxb8lGOitvKWKToWF7DQAbPnnlkA5axFdj7e7te4MxOFomzpmX
         +lh7zOkyZOfCKtpbD951SFZIE8e4KxnGT/JmK2FrpsUIFBSNWPGdE1tbNuAo6b0JRIzG
         LBSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kt++xkU/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c17si836483ybe.829.2018.01.08.08.00.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 08:00:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kt++xkU/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZqV-0007w7-87
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 11:00:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcF-00034x-Sr
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:45:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcF-0000CX-2b
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:45:35 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:37228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcA-00005p-Fg; Mon, 08 Jan 2018 10:45:30 -0500
Received: by mail-qk0-x243.google.com with SMTP id p13so14639704qke.4;
	Mon, 08 Jan 2018 07:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Q/21oj98KwgOw1mt9bBDqn3YjCkzmwZFbIMbXSvA+Ic=;
	b=kt++xkU/rOX5OKByBjtLb+oNRPnAZmBd7K+Dm8/HbkKO7PigpVuFrmKxaxFTcIYBXI
	hvxaNhj0C1JqHuUClNOxbD6gplcDwP12w0+nbW3NkHu7v/VJrIIkWCE5dTt5IM79pNm7
	UmjQfmrEwNhGEwkQBIlHqGyar28D3vbkXktmBn+4I/gMDGZl/FXuwK9UPQeb29VoJbUB
	um667rhJHeqVGmvXmvlfghS1Ed3xSFdhE2+m/yaJ5LMhOiLOuMFn15LQZVax7nl8skWo
	ELdiOJ40mKrpV/++3lcq0BjkXL4xrstlOYI6Dq43BqUhGCMGlg1g3QdNcMJmJz7tY/Rd
	7MvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Q/21oj98KwgOw1mt9bBDqn3YjCkzmwZFbIMbXSvA+Ic=;
	b=BQywfwGWL/VcoVCuDkEmPEsUOj2wdPXxvBad8DQNwuZdOJt4GicAf/YmsscSUs4tRj
	qyz/YIi0rnbV+/Ku1xAELY/TxFb6DeaN3xqsGbuuYr/N+uFkOSadzHQ0W6/gnPqXDgqy
	5v/7Hmi2pj+AzivE+lOQiBdsr4Z9LHrBN15aRarXwU7g8Kc+RHmmMek2ql1WV/RMRq/P
	SaPXAP1ge9bM+J+McTHhy11xcetLGaDnE7l7UEvkzLNEc5T8sJDlFMhW1LmIiqgJ52Il
	5wWzQ1n1xtojf+0V47+Tgx7i4CFLWBVC+pWDz/G+ZfQZvdnKpVlwrB9kRkoOUG36hALk
	0F/A==
X-Gm-Message-State: AKwxytfrA4qmnEJcNf46sBsKzMNQjtEHLtuJNhOMJ3+vNPKU15pgwwoy
	3Z8gwjdGrd0UwlS2gBNaHak=
X-Received: by 10.55.25.146 with SMTP id 18mr15891025qkz.214.1515426329774;
	Mon, 08 Jan 2018 07:45:29 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.45.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:45:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:57 -0300
Message-Id: <20180108154303.6522-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-arm] [PATCH v5 25/31] sdhci: check Spec v3 capabilities qtest
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
X-TUID: z6v7PAnfCHK3

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/sdhci-test.c     | 12 ++++++++++++
 tests/Makefile.include |  1 +
 2 files changed, 13 insertions(+)

diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index 200d7bcee2..f7487808af 100644
--- a/tests/sdhci-test.c
+++ b/tests/sdhci-test.c
@@ -29,9 +29,21 @@ static const struct sdhci_t {
     { "arm",    "smdkc210",
         {0x12510000, 2, 0, {1, 0x5e80080} } },
 
+    /* i.MX 6 */
+    { "arm",    "sabrelite",
+        {0x02190000, 3, 0, {1, 0x057834b4} } },
+
+    /* BCM2835 */
+    { "arm",    "raspi2",
+        {0x3f300000, 3, 52, {0, 0x52034b4} } },
+
     /* Zynq-7000 */
     { "arm",    "xilinx-zynq-a9",
         {0xe0100000, 2, 0, {1, 0x01790080} } },
+
+    /* ZynqMP */
+    { "aarch64", "xlnx-zcu102",
+        {0xff160000, 3, 0, {1, 0x7715e80080} } },
 };
 
 static uint32_t sdhci_readl(uintptr_t base, uint32_t reg_addr)
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 2d7058ca4c..0cf327425e 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -360,6 +360,7 @@ gcov-files-arm-y += hw/timer/arm_mptimer.c
 check-qtest-arm-y += tests/sdhci-test$(EXESUF)
 
 check-qtest-aarch64-y = tests/numa-test$(EXESUF)
+check-qtest-aarch64-y += tests/sdhci-test$(EXESUF)
 
 check-qtest-microblazeel-y = $(check-qtest-microblaze-y)
 
-- 
2.15.1

