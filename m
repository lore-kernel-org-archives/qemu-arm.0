Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2043401ejy;
        Tue, 20 Sep 2022 14:22:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5DGwsqPLt3brxyglk8ty/pLrhESpeSrLcjogJxAyTjciIRmYbhtfK/rlczxBDo/OWWE7dE
X-Received: by 2002:a05:622a:4c:b0:35c:bd5f:d795 with SMTP id y12-20020a05622a004c00b0035cbd5fd795mr21056434qtw.28.1663708962770;
        Tue, 20 Sep 2022 14:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663708962; cv=none;
        d=google.com; s=arc-20160816;
        b=a71MlRm7sFsl+arclC+tTQ7lqcotloCTaCVAMb/gWGYOAFYkWwrf0Y7ZVcUZSTzHB1
         Xah8us/0p5CP9Vp+pnIKglmvbABzJwMojKo5yhVPVfSN82lFCuqDamJlD6u7m21pVYhH
         pzEZRxGfKmgCpU7l0daoa/Bvhm/O5Ue/TrQ5K45hZ8++Cehv0k3MoZ0uMkGamq+CUMt/
         hXoicgaP5Rhk1bDZNRwSQQCguHA9ik1l/sYObSj408TqxS8PyObbO/xNBeW0Jiko1/oT
         fXHLjyXJSkOvNuANahGmWNWCK9CVJeJ0qFNynDzBreWOgbQZ2oIj1EZyVpY1wG0A0z3v
         6Byw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gFffptcsaDbJLHDxCBEzqDXvV1QF/9DzMLIVs2pCA34=;
        b=mTMdgcIXNFxh94pinOA1tPWZ8bp/L6dm9EHEka3Dl/r7xCeuyWSDTvlQtUfZBqQoiH
         RCWukpU8GWpj4NV/YTFAiu40R7C/I2l0YSQbT34EnPhEfdw5ia2TB6X6wdDJB961cFWn
         3AmlqEx83sJLCq3MbgA1S0exkIvHElYxEoAYjGOdrI0dJ0BkK0DGadXZI9AGbmQ0q805
         Etk61ymtl+SRgsTNp3Qpsrec6Lw6lWeFYII8lfoFTfMHpHODBnIFTsKirrYs0qkivRqa
         Z69sBKulUcQzcmKhhh2ujUUrqNM0G1r7gMJebPjHB1/ct4Ioe4z2APHS4cwAxOW6cZi+
         ekmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=mWTJXjZa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv7-20020a05620a1b8700b006cbbda1a0fbsi534341qkb.225.2022.09.20.14.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 14:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=mWTJXjZa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:37706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oakhW-00047R-39
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 17:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oag1s-0004kX-ER; Tue, 20 Sep 2022 12:23:36 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oag1q-0000M5-Hu; Tue, 20 Sep 2022 12:23:24 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KGJ7DC027466;
 Tue, 20 Sep 2022 16:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=gFffptcsaDbJLHDxCBEzqDXvV1QF/9DzMLIVs2pCA34=;
 b=mWTJXjZagPbMMQiEdQMSkiptKySAcWwXsmmo/Yg/JdPASvPnq70w7pegTYOse43V1nJ7
 XD+wNhkWKPXSu/4rYBfuyUzHsPXZrZnWsGjztKXDclek91rrhaVnX0CuHt6gklM/+MME
 lcMSBhQDqUbGjQFLJY3rx4f7bsjrrFz/+hr8ToqpbzmtXaEBNEfthXulJsnZ64Z5Wjt7
 D50vBhzxVH8lXT8CauhG4kUTbVTVpZu27GhR49dkTlWZSHCm9f4HmvY/q0AtjQKS+tDM
 UoVK9OZa89S9S3kG1qARWwVw8oBiP902pAcx84bXp+8TqI51M7ZqpbBRrvjFoCEuenQo wQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn6f0far8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 16:23:17 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28KG0JDF027827; Tue, 20 Sep 2022 16:23:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp3cng832-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 16:23:15 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KGMqV1016251;
 Tue, 20 Sep 2022 16:23:15 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-195-182.vpn.oracle.com
 [10.175.195.182])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3jp3cng7mf-4; Tue, 20 Sep 2022 16:23:15 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org,
 Miguel Luis <miguel.luis@oracle.com>
Subject: [PATCH 3/3] tests/acpi: virt: update ACPI GTDT binaries
Date: Tue, 20 Sep 2022 16:21:37 +0000
Message-Id: <20220920162137.75239-4-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220920162137.75239-1-miguel.luis@oracle.com>
References: <20220920162137.75239-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_06,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200097
X-Proofpoint-GUID: I6QmEKOZX3KkgagPjskFGbfy32XXRukK
X-Proofpoint-ORIG-GUID: I6QmEKOZX3KkgagPjskFGbfy32XXRukK
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: miguel.luis@oracle.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q2Y74MJnQlLu

Step 6 & 7 of the bios-tables-test.c documented procedure.

Differences between disassembled ASL files for GTDT:

    @@ -13,14 +13,14 @@
     [000h 0000   4]                    Signature : "GTDT"    [Generic Timer Description Table]
     [004h 0004   4]                 Table Length : 00000060
     [008h 0008   1]                     Revision : 02
    -[009h 0009   1]                     Checksum : 8C
    +[009h 0009   1]                     Checksum : 9C
     [00Ah 0010   6]                       Oem ID : "BOCHS "
     [010h 0016   8]                 Oem Table ID : "BXPC    "
     [018h 0024   4]                 Oem Revision : 00000001
     [01Ch 0028   4]              Asl Compiler ID : "BXPC"
     [020h 0032   4]        Asl Compiler Revision : 00000001

    -[024h 0036   8]        Counter Block Address : 0000000000000000
    +[024h 0036   8]        Counter Block Address : FFFFFFFFFFFFFFFF
     [02Ch 0044   4]                     Reserved : 00000000

     [030h 0048   4]         Secure EL1 Interrupt : 0000001D
    @@ -46,16 +46,16 @@
                                     Trigger Mode : 0
                                         Polarity : 0
                                        Always On : 0
    -[050h 0080   8]   Counter Read Block Address : 0000000000000000
    +[050h 0080   8]   Counter Read Block Address : FFFFFFFFFFFFFFFF

     [058h 0088   4]         Platform Timer Count : 00000000
     [05Ch 0092   4]        Platform Timer Offset : 00000000

     Raw Table Data: Length 96 (0x60)

    -    0000: 47 54 44 54 60 00 00 00 02 8C 42 4F 43 48 53 20  // GTDT`.....BOCHS
    +    0000: 47 54 44 54 60 00 00 00 02 9C 42 4F 43 48 53 20  // GTDT`.....BOCHS
         0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    -    0020: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    +    0020: 01 00 00 00 FF FF FF FF FF FF FF FF 00 00 00 00  // ................
         0030: 1D 00 00 00 00 00 00 00 1E 00 00 00 04 00 00 00  // ................
         0040: 1B 00 00 00 00 00 00 00 1A 00 00 00 00 00 00 00  // ................
    -    0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    +    0050: FF FF FF FF FF FF FF FF 00 00 00 00 00 00 00 00  // ................

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 tests/data/acpi/virt/GTDT                   | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.memhp             | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.numamem           | Bin 96 -> 96 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 4 files changed, 3 deletions(-)

diff --git a/tests/data/acpi/virt/GTDT b/tests/data/acpi/virt/GTDT
index 9408b71b59c0e0f2991c0053562280155b47bc0b..6f8cb9b8f30b55f4c93fe515982621e3db50feb2 100644
GIT binary patch
delta 45
kcmYdD;BpUf2}xjJU|^avkxPo>KNL*VQ4xT#fs$YV0LH=;ng9R*

delta 45
jcmYdD;BpUf2}xjJU|{N*$R))AWPrg$9Tfo>8%6^Foy!E8

diff --git a/tests/data/acpi/virt/GTDT.memhp b/tests/data/acpi/virt/GTDT.memhp
index 9408b71b59c0e0f2991c0053562280155b47bc0b..6f8cb9b8f30b55f4c93fe515982621e3db50feb2 100644
GIT binary patch
delta 45
kcmYdD;BpUf2}xjJU|^avkxPo>KNL*VQ4xT#fs$YV0LH=;ng9R*

delta 45
jcmYdD;BpUf2}xjJU|{N*$R))AWPrg$9Tfo>8%6^Foy!E8

diff --git a/tests/data/acpi/virt/GTDT.numamem b/tests/data/acpi/virt/GTDT.numamem
index 9408b71b59c0e0f2991c0053562280155b47bc0b..6f8cb9b8f30b55f4c93fe515982621e3db50feb2 100644
GIT binary patch
delta 45
kcmYdD;BpUf2}xjJU|^avkxPo>KNL*VQ4xT#fs$YV0LH=;ng9R*

delta 45
jcmYdD;BpUf2}xjJU|{N*$R))AWPrg$9Tfo>8%6^Foy!E8

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 957bd1b4f6..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/GTDT",
-"tests/data/acpi/virt/GTDT.memhp",
-"tests/data/acpi/virt/GTDT.numamem",
-- 
2.36.0

