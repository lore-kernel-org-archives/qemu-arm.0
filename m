Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5347455lfk;
        Sun, 21 Nov 2021 04:30:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNwF9pp7O+7CaDouMMphVNDGHsgNkmnWVpYnTSY47x0ySUnIqP4/LhPLps3Sph+eXErp3U
X-Received: by 2002:a05:620a:17a9:: with SMTP id ay41mr34741042qkb.280.1637497840627;
        Sun, 21 Nov 2021 04:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637497840; cv=none;
        d=google.com; s=arc-20160816;
        b=eveNeA1rj+vPX7mGYrcwZlW1wLMMt3zWwdi1xMOcR7H5hlGv4LL+KDl88+TO2chbGV
         WvI0qGvPleccoaTh/d7sfKR+7fTPHtwbwpKZ9nNiHxYefG76c8ZaqqW4CSBu1G8QauO5
         NqMLJ34ZzX+YRiwA8YjarbswKFb5Jr7tR/O1FCMiTg5ugsN4R6OsghvK69tlKyDSG2Fk
         xYPgDvfvurhMbJSCdOBFuWY1lDo6CIEVlKwZMGDefMTNABdx/W5m7MxonpYgcJpfokuY
         5IIAZuI+CLYDkmHDbdkXq/dw2f4c4VibzHm5uH4xgY1PZCB+8FnasamJogO4mhoNWeyu
         RVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=BUfk/p8nHIEemgSv5Xr/OIDiNPCXPKe97h5PcdI06bg=;
        b=0WCOeLE2AUuNF4WNquk8mouulStsL8hijVlXwx26d5wU9nzYJGJ+CEWzbgTUO+zD0V
         d5YymNbX/Se6dkKusq5jfRvBdQ+iZQYEEHvgN375xltPhDUgia1pMj2RL1YfgY6GC6xe
         /QjI9M2B6vRhdugGtmLxiu9ZGFSawe0KgoqVQQZlKnjhRqvi+uE+hOr6+Ivhf38Qo+g2
         Zd3g67BKZy5gGvJaCHrWoj7rHDU6C/sQaR46JTne35EiBBPr2ERmtb3eNXR5VQEnye4Z
         Rj9u/R1QlSnFmWQiOnWbMC8g+rN+hqTCyDzm5S/FlERnbF+o1laXLohEILeqV72nwX4J
         B1aA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf4si12587393qvb.196.2021.11.21.04.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Nov 2021 04:30:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:35766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1molzU-0006JQ-0g
	for alex.bennee@linaro.org; Sun, 21 Nov 2021 07:30:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluO-0003s0-Ov; Sun, 21 Nov 2021 07:25:24 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluL-0005nA-Hm; Sun, 21 Nov 2021 07:25:24 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HxqH854l2zcb4K;
 Sun, 21 Nov 2021 20:20:20 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 20:25:18 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric
 Blake <eblake@redhat.com>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH v4 10/10] tests/acpi/bios-table-test: Update expected
 virt/PPTT file
Date: Sun, 21 Nov 2021 20:25:02 +0800
Message-ID: <20211121122502.9844-11-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211121122502.9844-1-wangyanan55@huawei.com>
References: <20211121122502.9844-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-devel@nongnu.org>
X-TUID: ciFWsu3hEKA2

Run ./tests/data/acpi/rebuild-expected-aml.sh from build directory
to update PPTT binary. Also empty bios-tables-test-allowed-diff.h.

The disassembled differences between actual and expected PPTT:

 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20180810 (64-bit version)
  * Copyright (c) 2000 - 2018 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/PPTT, Mon Oct 25 20:24:53 2021
+ * Disassembly of /tmp/aml-BPI5B1, Mon Oct 25 20:24:53 2021
  *
  * ACPI Data Table [PPTT]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

 [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
-[004h 0004   4]                 Table Length : 0000004C
+[004h 0004   4]                 Table Length : 00000060
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : A8
+[009h 0009   1]                     Checksum : 48
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
 [025h 0037   1]                       Length : 14
 [026h 0038   2]                     Reserved : 0000
 [028h 0040   4]        Flags (decoded below) : 00000001
                             Physical package : 1
                      ACPI Processor ID valid : 0
 [02Ch 0044   4]                       Parent : 00000000
 [030h 0048   4]            ACPI Processor ID : 00000000
 [034h 0052   4]      Private Resource Number : 00000000

 [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
 [039h 0057   1]                       Length : 14
 [03Ah 0058   2]                     Reserved : 0000
-[03Ch 0060   4]        Flags (decoded below) : 0000000A
+[03Ch 0060   4]        Flags (decoded below) : 00000000
                             Physical package : 0
-                     ACPI Processor ID valid : 1
+                     ACPI Processor ID valid : 0
 [040h 0064   4]                       Parent : 00000024
 [044h 0068   4]            ACPI Processor ID : 00000000
 [048h 0072   4]      Private Resource Number : 00000000

-Raw Table Data: Length 76 (0x4C)
+[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
+[04Dh 0077   1]                       Length : 14
+[04Eh 0078   2]                     Reserved : 0000
+[050h 0080   4]        Flags (decoded below) : 0000000A
+                            Physical package : 0
+                     ACPI Processor ID valid : 1
+[054h 0084   4]                       Parent : 00000038
+[058h 0088   4]            ACPI Processor ID : 00000000
+[05Ch 0092   4]      Private Resource Number : 00000000
+
+Raw Table Data: Length 96 (0x60)

-    0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
+    0000: 50 50 54 54 60 00 00 00 02 48 42 4F 43 48 53 20  // PPTT`....HBOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
-    0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
-    0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........
+    0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
+    0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
+    0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/data/acpi/virt/PPTT                   | Bin 76 -> 96 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
index 7a1258ecf123555b24462c98ccbb76b4ac1d0c2b..f56ea63b369a604877374ad696c396e796ab1c83 100644
GIT binary patch
delta 53
zcmV-50LuSNU<y!BR8(L90006=kqR;-00000Bme*a000000000002BZK3IG5AH~;_u
L0000000000uCW9Z

delta 32
qcmV+*0N?*$ObSp?R8&j=00080kqR=APy`Gl00000000000001OcLdh}

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index cb143a55a6..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/PPTT",
-- 
2.19.1

