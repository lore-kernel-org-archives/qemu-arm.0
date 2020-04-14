Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5546880lfm;
        Tue, 14 Apr 2020 16:16:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypLwUJzsVWUpILZNQyqAShzfbsjFlvnFIsc4amMqpJLJMoq9fYOzUHowXwJiU/FfE16dSn3q
X-Received: by 2002:ac8:2a76:: with SMTP id l51mr17962514qtl.81.1586906218275;
        Tue, 14 Apr 2020 16:16:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586906218; cv=pass;
        d=google.com; s=arc-20160816;
        b=SBNES1WWNcnWnD2Xs+KuuuMPJeEd0Wbv/S1H59lDwusT/oNnz0bbzcgFP/q41LPlb3
         +STPNu+SaA7TcoWIqeO6hu7JLZplq1qv3QNewIxCX96wLUu7EcBOnnIueZAXBkLMHJm1
         9HcCTveaBClzixtNCK0FyTKdu+HWeMXzuVFl9EXFf7oVQMoOEjLhpKPuS7lbUR1q/3HH
         ysyH4FtBbgWd+fqkpCpXwpfWT4g/EY7lf7AhMUNiNQSIMxceJNtSWpvvdrB1d20GxUjW
         d+wl23Nyh4BX1RnvtPVcGo42gX5nUFMHmAtPxkvBYIAJ5ejc3Zw0txacltio2BUmQ7RR
         oOVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature:dkim-signature;
        bh=CpxH6l9JQaJE/mMsulXPKm1uHKkx91IXbEQ7HC/2jDc=;
        b=1Kc9FU9+YC7dvjNAv+paWczXj3G9P6YlJl3MQv6ynW2ckhbOLIM/n1h1bjwaC1BJND
         6U2k/NvuTtd2CM+nRu3dOo95PI3/xmqYz68TANmMJ2ElTgkrMqQPq4a8LvzV6sXmiRwX
         vrKP+23DBGt3QlLmal73i73DUYmfdWP1Q6BL9tRPruKSXtrD8AGpBaXk/CS7jou0Uz+c
         nCx6I2C3SS7+G/id7S+s8x2iKIeIADtO1Hn7dqSWrHcxvlMCd1fU2q+fPhmnlvNdI21Q
         gMO78yupVk5TgxcjPoTesrZacrw1RIYogDC3CvEcEjuZaUQXF9SXTalfqj9uTGCFPnPs
         FETQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=YeKjtJiD;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b=lb3BpkA8;
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 93si4538029qtg.220.2020.04.14.16.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 16:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=YeKjtJiD;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b=lb3BpkA8;
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:40202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOUnX-0005EE-UV
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 19:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45383)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steplong@quicinc.com>) id 1jOUnB-0005CT-Ua
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 19:16:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <steplong@quicinc.com>) id 1jOUn9-0008AV-8H
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 19:16:32 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:15207)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <steplong@quicinc.com>)
 id 1jOUn8-00089o-Ry; Tue, 14 Apr 2020 19:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1586906190; x=1618442190;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=c+cvB6KQoxXwY55s9UvgZq0i+DQyMQVJNjY6CAAWGUE=;
 b=YeKjtJiD0puWPRJLk5vfRCJZZPJ50Zt0Gzzx2NFJIOEnedprxy3uyEFX
 RzBomvoAodQqASIuwS4JYTZwcxQPqAiPf+viJfBb0NHnJ5CX31z8VVe8g
 a0vG85dmFy7itt3YPm6/r3Zvo25ghx1lURj2+8oqSQCLW9O0bWLZ1SVv+ w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Apr 2020 16:16:29 -0700
Received: from nasanexm03b.na.qualcomm.com ([10.85.0.98])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Apr 2020 16:16:29 -0700
Received: from NASANEXM01H.na.qualcomm.com (10.85.0.34) by
 nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 16:16:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (199.106.107.6)
 by NASANEXM01H.na.qualcomm.com (10.85.0.34) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 14 Apr 2020 16:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFgPWT3jICUe9is5NM9/VuULoEBipxnSe2WzRGdmXpNTteYdJT6RdDrK9g3IJPKRBW6lDtK3lrk6wtfXxpOKgZR0SSO09aoatxnsNc64uvrT53hINHN2gqk8GGRlYIAWI2tHcVI54lVdlBCaTtLvlmJHOYZ9RY3eJ1sqMUyxIJ1FRE3ynQHv++AoDV46jBYr0SvRh/Gdo36AE+gaBaM1ebYFcWrVTp/aitVsHIihZImNteuQe7KtQEB9Lkn8sIy8FXmlJPNE5W57N2MhkBDlbJZMjalUjx6QmpCyQMzGneB86xzGqPng+tVcpIpW4bMZlolVlXSGGWe4VrdWfQEAhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpxH6l9JQaJE/mMsulXPKm1uHKkx91IXbEQ7HC/2jDc=;
 b=mhMtKRptdH9BifTqQCXw0b2Y55GbOgIs4sGB1XNXgnU0JkOzCWmFYakyR66p2w8FODAoDmuAprdaYhuk+FfLktmhq/nFsxVfU7g4OYMvY+l4FbemTJoH1bzdOV5/fkcHDWEelnL5fvo6gkdj8/Xwmle2WKiKvJEgSkr764fLItkT9xdmZeY8XEDmKpkGpH9N8ZAjunhfWcf69gYuWWVQSllIgQYnHunILTieo3GBmZ1s8DdvFZHm5oCKYr9QU+QCVhRxeGvOdC9SDPGNguRsf4MPwTKWih/fGgev9tmstJztjNRPlOJ+ND5rWUfbAn41u6A7Ac+VNMFryU9P0k+iUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpxH6l9JQaJE/mMsulXPKm1uHKkx91IXbEQ7HC/2jDc=;
 b=lb3BpkA8JTFt4asH83lCjMsLRUBtKYvyOvCp+M2XuSNWOhQpPBV1O3j4a5vbQrT2Y4vNbB52+75SzQG00FgzARirmc2cd0B7K9RGRQ82QDIl3Of/OVxZRsPcFO4/xunwH0WoGnEeEb+lEnNRElrIugyM7InkQNyIGJjRsaOh/l8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=steplong@quicinc.com; 
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MWHPR0201MB3465.namprd02.prod.outlook.com
 (2603:10b6:301:76::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Tue, 14 Apr
 2020 23:16:26 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37%3]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 23:16:26 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH RFC v2] target/arm: Implement SVE2 MATCH, NMATCH
Date: Tue, 14 Apr 2020 19:16:10 -0400
Message-ID: <20200414231610.8387-1-steplong@quicinc.com>
Content-Type: text/plain
X-ClientProxiedBy: CH2PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:610:53::20) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-L2LA14H.localdomain (108.176.222.2) by
 CH2PR17CA0010.namprd17.prod.outlook.com (2603:10b6:610:53::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Tue, 14 Apr 2020 23:16:25 +0000
X-Originating-IP: [108.176.222.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e0b1ca4-04b5-4111-ae1e-08d7e0c9daa4
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3465:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0201MB346566C489975217E6B8333AC7DA0@MWHPR0201MB3465.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:13;
X-Forefront-PRVS: 0373D94D15
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(376002)(346002)(396003)(136003)(39860400002)(2616005)(2906002)(6916009)(8936002)(5660300002)(6506007)(316002)(86362001)(6512007)(478600001)(107886003)(81156014)(4326008)(8676002)(6486002)(186003)(66946007)(6666004)(956004)(1076003)(16526019)(66476007)(66556008)(26005)(36756003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4qUVclR6GoxHtkOTyPHxaCOYVRcp3eTMlTla/Q0l7PEN+5pHqIP2C7D3AeF/gPosX4WfEgx5dXAFf6WLwwdKJB7yaSCMRZmXLPgzbJmBTF6BusU+SdcSsSauJZvM2Q5U/78rR+Q8Km3h2F6OKyV4T9BnbIdmTAI8Wpk5uKK71V0VqGNuTau2sY32j4XMITWmQc1kPsQYD5s3EUOpzmqeBNs+5jl8OFneicvJRKlSz40YnWK0pzOADNgGmj3qW8yIBHgBcqXxbkvHZ9QYisSe9vBolYo7rvteXAqPdpYwK8N/WlKsasf+wAj7yMh0ZDUq+8xYQfVQI7iUIvLgOi4RN8C4woJxXoMI4svivsRIS6B8riHGhJeVUJimS2eW0YGNgUza3Geo99Z7t7+ijV4jG1+azdOroPoty69GzNbDiEAs6TX1CoWjOkEk6y21W2HL
X-MS-Exchange-AntiSpam-MessageData: un6RG8eiKLGBvbsApI/2MZ9iaXmN/1P45adkGi4k/g4CJSv/16Jj+YeXWlYXLH2CI3UrnhSW6/Dv8ziGsYaIL2AVA5841ARvMezV7g3pITQH7vL1nLvVhFfGLJG1ZVwUOks0h1/ENfcCuX0emS3VvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0b1ca4-04b5-4111-ae1e-08d7e0c9daa4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2020 23:16:26.0066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNtSLSbPAH8lu5z/zl5fk3dB/DFaOSD6y5k7d32Es9Qmqf3EIihJU421dXP1J47wfNsPO0Mkt1jQtIu3mQO7nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3465
X-OriginatorOrg: quicinc.com
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 199.106.114.39
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, richard.henderson@linaro.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tBPLuOUmba2G

Signed-off-by: Stephen Long <steplong@quicinc.com>
---
 target/arm/helper-sve.h    | 10 ++++++++
 target/arm/sve.decode      |  5 ++++
 target/arm/sve_helper.c    | 51 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 22 ++++++++++++++++
 4 files changed, 88 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 5dd880cf6d..bc4a463bc7 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2516,6 +2516,16 @@ DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 374e47fb05..652668df02 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1305,6 +1305,11 @@ UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
+### SVE2 Character Match
+
+MATCH           01000101 .. 1 ..... 100 ... ..... 0 .... @pd_pg_rn_rm
+NMATCH          01000101 .. 1 ..... 100 ... ..... 1 .... @pd_pg_rn_rm
+
 ## SVE2 floating-point pairwise operations
 
 FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b68f62cd7f..78abd8b62a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6890,3 +6890,54 @@ DO_ST1_ZPZ_D(dd_be, zd, MO_64)
 
 #undef DO_ST1_ZPZ_S
 #undef DO_ST1_ZPZ_D
+
+#define DO_PPZZ_CHAR_MATCH(NAME, TYPE, OP, H, MASK, DEFAULT_VAL)              \
+static inline bool NAME##_inner_loop(TYPE nn, void *segmentbase)              \
+{                                                                             \
+    intptr_t i = 128;                                                         \
+    do {                                                                      \
+        do {                                                                  \
+            i -= sizeof(TYPE) * 8;                                            \
+            TYPE mm = *(TYPE *)(segmentbase + H1(i));                         \
+            if (nn OP mm) {                                                   \
+                return !DEFAULT_VAL;                                          \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i > 0);                                                          \
+    return DEFAULT_VAL;                                                       \
+}                                                                             \
+                                                                              \
+uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)  \
+{                                                                             \
+    intptr_t opr_sz = simd_oprsz(desc);                                       \
+    uint32_t flags = PREDTEST_INIT;                                           \
+    intptr_t i = opr_sz;                                                      \
+    do {                                                                      \
+        uint64_t out = 0;                                                     \
+        uint64_t pg;                                                          \
+        do {                                                                  \
+            i -= sizeof(TYPE), out <<= sizeof(TYPE);                          \
+            TYPE nn = *(TYPE *)(vn + H(i));                                   \
+            out = (out & ~1ull) | DEFAULT_VAL;                                \
+            out |= NAME##_inner_loop(nn, vm + (i & -16));                     \
+        } while (i & 63);                                                     \
+        pg = *(uint64_t *)(vg + (i >> 3)) & MASK;                             \
+        out &= pg;                                                            \
+        *(uint64_t *)(vd + (i >> 3)) = out;                                   \
+        flags = iter_predtest_bwd(out, pg, flags);                            \
+    } while (i > 0);                                                          \
+    return 0;                                                                 \
+}
+
+#define DO_PPZZ_CHAR_MATCH_B(NAME, TYPE, OP, DEFAULT_VAL) \
+    DO_PPZZ_CHAR_MATCH(NAME, TYPE, OP, H1, 0xffffffffffffffffull, DEFAULT_VAL)
+#define DO_PPZZ_CHAR_MATCH_H(NAME, TYPE, OP, DEFAULT_VAL) \
+    DO_PPZZ_CHAR_MATCH(NAME, TYPE, OP, H1_2, 0x5555555555555555ull, DEFAULT_VAL)
+
+DO_PPZZ_CHAR_MATCH_B(sve2_match_ppzz_b, uint8_t, ==, 0)
+DO_PPZZ_CHAR_MATCH_H(sve2_match_ppzz_h, uint16_t, ==, 0)
+
+DO_PPZZ_CHAR_MATCH_B(sve2_nmatch_ppzz_b, uint8_t, !=, 1)
+DO_PPZZ_CHAR_MATCH_H(sve2_nmatch_ppzz_h, uint16_t, !=, 1)
+
+#undef DO_PPZZ_CHAR_MATCH
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 07a2040208..29c799501d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7246,6 +7246,28 @@ static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
+                               gen_helper_gvec_flags_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_ppzz_flags(s, a, fn);
+}
+
+#define DO_SVE2_PPZZ_CHAR_MATCH(NAME, name)                                 \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
+{                                                                           \
+    static gen_helper_gvec_flags_4 * const fns[4] = {                       \
+        gen_helper_sve2_##name##_ppzz_b, gen_helper_sve2_##name##_ppzz_h,   \
+        NULL,                            NULL                               \
+    };                                                                      \
+    return do_sve2_ppzz_flags(s, a, fns[a->esz]);                           \
+}
+
+DO_SVE2_PPZZ_CHAR_MATCH(MATCH, match)
+DO_SVE2_PPZZ_CHAR_MATCH(NMATCH, nmatch)
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.17.1

