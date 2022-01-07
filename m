Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1606460lfb;
        Fri, 7 Jan 2022 00:37:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwAwbMRsTqpAaxIgit7lh6DiF6GeikY13Ut4xcUrKMMuzR6AcD5a/YTaVL88+SCCy704ji
X-Received: by 2002:a05:6902:100a:: with SMTP id w10mr56472293ybt.156.1641544646137;
        Fri, 07 Jan 2022 00:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641544646; cv=none;
        d=google.com; s=arc-20160816;
        b=neo45lKxz5XK4CWn2YqbrYzfoiiLkFIlY+ILhhwfO0tjSzf86UCXjMscHAOOlxxkpd
         BAIXXV1Gq4CwMW5mli/ksh70uOqlVvJNcXAqXT3z7YuLHArM1pgXfLzJx+l4NOj6rFCZ
         Y8VP2ILG6S44Pza+saFLGYJdPYa4bHtARMyE1gzujIVRlReeIs/Mq7XX+dizUHQKl47O
         8aV8ouRKri1RBVa35AB+xi20Ld3+BobdkPRPaQ9PXBBRh/a4JL+HG8DSSOzMh14h+Fq6
         ab+gasJczz9O3Z6QBXghtp0R2l5oQKXi/mATiCksKODLzQ25tTGLsUrp+bByopWLM+ns
         ueZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=J7PMJu0YDAF4wfGA711Gp62DE1mcYlCrYRDwqAwVgdM=;
        b=zEnQaziX5GqrSH04wf+mb/SPpaRPdnVQUivQkHTkIjARp461+QCNCIYpGATqJ0iqVB
         de5TUaosO3rOTKVwSeswzcnICjQ4YXVnwDF+DB/Vk5kJrty6mkuwhh9JdIqCqkmSP3Kd
         xRT0seg7isoYOFcGCuAg1ynXGOXlB4qWO6Al6hKeV9gg4DNg7kF7CMYgBJf3iMt7LqOz
         dldza5H2dcFRMc3Bvztw3bdr81NsON984zR+a4hqfkMFfEvPjompRE9s8dNmO4hoPd6N
         1cvootgnYwBranUotMzsAeejifhT31ULPqA7uShjCFqVDTB3262fYnuUpovpTfI+x6Gu
         nTIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c188si218935ybb.347.2022.01.07.00.37.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 00:37:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:48568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5kkX-00079r-Fu
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 03:37:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg4-0000Pi-SI; Fri, 07 Jan 2022 03:32:48 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg2-0001fV-7V; Fri, 07 Jan 2022 03:32:48 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JVc060NvWzccKD;
 Fri,  7 Jan 2022 16:32:06 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:32:40 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v7 6/6] tests/acpi/bios-table-test: Update expected virt/PPTT
 file
Date: Fri, 7 Jan 2022 16:32:32 +0800
Message-ID: <20220107083232.16256-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220107083232.16256-1-wangyanan55@huawei.com>
References: <20220107083232.16256-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-arm@nongnu.org>
X-TUID: MFWVAcWyrxoZ

Run ./tests/data/acpi/rebuild-expected-aml.sh from build directory
to update PPTT binary. Also empty bios-tables-test-allowed-diff.h.

The disassembled differences between actual and expected PPTT:

 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20200528 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/PPTT, Tue Jan  4 12:51:11 2022
+ * Disassembly of /tmp/aml-2ZGOF1, Tue Jan  4 12:51:11 2022
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
                        Processor is a thread : 0
                               Node is a leaf : 0
                     Identical Implementation : 0
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
                        Processor is a thread : 0
-                              Node is a leaf : 1
+                              Node is a leaf : 0
                     Identical Implementation : 0
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
+                       Processor is a thread : 0
+                              Node is a leaf : 1
+                    Identical Implementation : 0
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
Reviewed-by: Ani Sinha <ani@anisinha.ca>
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
2.27.0

