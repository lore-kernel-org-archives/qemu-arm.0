Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1805198lfp;
        Tue, 19 Jul 2022 02:56:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1soBPCJ8NSqw8rG9FM3/4dt17WjODFiy1AJSVugv/avXH8w4UMV3nNrrzb60b8YMm2uXoAo
X-Received: by 2002:a37:a57:0:b0:6b5:d65f:82ef with SMTP id 84-20020a370a57000000b006b5d65f82efmr10549971qkk.110.1658224571010;
        Tue, 19 Jul 2022 02:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658224571; cv=none;
        d=google.com; s=arc-20160816;
        b=Q96zYfxusK++7AbZrEHsR4IvaxZEelN4tFcA0MqqimTyzlcGI58aNKUKLgbCa9WGL1
         ctowEcmIuccfZimzG1cEWIyPz9rEmVapK0jsomRdYUCFSoKgLP3bagbEzV1NwFgDI5NG
         qyJP91VZPt5seBDj/A9kPI+a/b1QNrzmCkjZltRj1MZh78f1KMPNFs7BJ2KLVR5ZPjdD
         yoJUe27DPt9tV/nzvNB4jbjQe7bvQkK2y7cbwpWb4l/io7vB2oZl01c1jZx33E6wSXR9
         3j0ZbAx43Zz91D7Ammi0bKhmJmYqo7Gk4s4Ud8NOFBn+vlhTOXA+HISTQzpCRDDezGQJ
         AFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F9Z2uy4g8Ct2OgMS3JKQ4Rli/sEtDSG4EP2iBDjVkwc=;
        b=tX3SLay+0/9uNMcjagoveq+IHkQTO7G9IZMYQ2W+6JkKcH5IswVfabjXY8O6+tXFpF
         G33pK/j0TlOV0dJ/xzjv0H9SuWyjNulCSX7tJK/5QHYqEov1VNzR0XgmeCPh5mmjW2fO
         hKgl7+0Wn8fjeKffA9LNCi1WjLBxf2dEoUF4ytS1m3YLd1Tg5i8zkzqgABRwF+CbtFa3
         GUU1xIJcE193zmHz5/eNbx33VCSlZIscpOk165iM7VxjnGvMI9EW7xzdMN9aveU7wPj0
         N8zp9MdCz/8WOx3h3G3akhpr/pBhbpEMnn1U+Vbian8RmY5DfTzwyTWjngfPjCurIlEP
         ykMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=md2XJSVt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=cl.cam.ac.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020a05622a121300b0031ed3486e93si6883711qtx.377.2022.07.19.02.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jul 2022 02:56:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=md2XJSVt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=cl.cam.ac.uk
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDjxa-00051Y-Gs
	for alex.bennee@linaro.org; Tue, 19 Jul 2022 05:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjsg-0003px-3W; Tue, 19 Jul 2022 05:51:06 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:44871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjse-0003d8-Hw; Tue, 19 Jul 2022 05:51:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so8835300wmb.3; 
 Tue, 19 Jul 2022 02:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F9Z2uy4g8Ct2OgMS3JKQ4Rli/sEtDSG4EP2iBDjVkwc=;
 b=md2XJSVt98a1/sKSnuEIT+RJ9+avMttJW7OX8uqpp8pCy/+yPOz7AXmE22Ont/TUUm
 ZvuRETJv3st5RDIfVEZdhs3D66Ng2shUjDPwydDkyyBSK+N3sq+IL6G1dooK0kv3y760
 TOdIxjCChcZrRTlZRFlZRfW8GOLqgf7x6ssF134AoX3boL2S2laxSGI4ugQQGN1dGxWL
 XLBA4kX9P8v4xx/bm0xLK26B8yNaPMq8/WdL0hpI+UkELDjpf1VVww//yCmKiSfF1xNe
 ubYaIqjMF30aRqum1za12X4gImYB6Uu7rsG+dLpWd8CwI189rfhMCGSFNydQRf6qgYbI
 9MXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F9Z2uy4g8Ct2OgMS3JKQ4Rli/sEtDSG4EP2iBDjVkwc=;
 b=DXxOn4hfD0tbiyF3X/CrpOOXLwNbf33z0ZOA1R1oQg5paJoHtfKOb5TIi3r5VXh6sM
 bbLjTofGeXFCEps4BWVS8t4wQ6rqROiVnxGdM7R68cXUFa+1bnguZy92ZvgLk9aksucW
 ocOvlzyh/qNV9tkvUaCePJ4dmypLgTkCLY6MBtkAy80Lc7qvLBK0lNsdWkblV93sxXv2
 4+F0+d5T4xvL2MVugvbK4afr0Y2UA/AuSz9vt674irN6B2e/U8p+z7pHKMA4PbpbaE1B
 1VpB3oGyPjg3XymVofvK58TWdnFsTCzgB54gZYJLB2xYUOQ1qar9qdPMzAoo59CI6zXs
 G9bA==
X-Gm-Message-State: AJIora++CwfLs7kGcYxq8gL3vFRaFeNgoCebHdkQDfwJnnpz7VXBFfhS
 Os4af5jLt25kt0jgQqshuDI=
X-Received: by 2002:a05:600c:4f43:b0:3a2:ee79:2dd5 with SMTP id
 m3-20020a05600c4f4300b003a2ee792dd5mr29845584wmq.143.1658224262185; 
 Tue, 19 Jul 2022 02:51:02 -0700 (PDT)
Received: from localhost.localdomain ([86.188.218.117])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d4c44000000b0021b956da1dcsm12841263wrt.113.2022.07.19.02.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:51:01 -0700 (PDT)
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
X-Google-Original-From: Hesham Almatary <hesham.almatary@huawei.com>
To: jonathan.cameron@huawei.com,
	qemu-devel@nongnu.org
Cc: yangyicong@huawei.com, chenxiang66@hisilicon.com, linuxarm@huawei.com,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 wangyanan55@huawei.com, marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, mst@redhat.com, jingqi.liu@intel.com
Subject: [PATCH v2 2/8] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
Date: Tue, 19 Jul 2022 10:49:44 +0100
Message-Id: <20220719094950.1049516-3-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=heshamelmatary@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V/0ULU74NS9H

From: Brice Goglin <Brice.Goglin@inria.fr>

.. which will be used by follow up hmat-noinitiator test-case.

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | 0
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | 0
 tests/data/acpi/q35/HMAT.acpihmat-noinitiator | 0
 tests/data/acpi/q35/SRAT.acpihmat-noinitiator | 0
 tests/qtest/bios-tables-test-allowed-diff.h   | 4 ++++
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator

diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/acpi/q35/APIC.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/HMAT.acpihmat-noinitiator b/tests/data/acpi/q35/HMAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/SRAT.acpihmat-noinitiator b/tests/data/acpi/q35/SRAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..245fa66bcc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/APIC.acpihmat-noinitiator",
+"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/q35/HMAT.acpihmat-noinitiator",
+"tests/data/acpi/q35/SRAT.acpihmat-noinitiator",
-- 
2.25.1

