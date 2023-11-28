Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2272013ejt;
        Tue, 28 Nov 2023 15:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWr8dcggW3H/xnFv5wRHjPFzOOp9SzOkWI8adlRH7AsQbVHfu5GNG2PBdOQEMWTaiNMdUc
X-Received: by 2002:a05:6358:7205:b0:16d:fd30:6d14 with SMTP id h5-20020a056358720500b0016dfd306d14mr15755864rwa.17.1701215913733;
        Tue, 28 Nov 2023 15:58:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701215913; cv=none;
        d=google.com; s=arc-20160816;
        b=bUOLPY5RR1+96gg+ZldVEHMpBGrSZ6KcPnuvRBKW4dMhZZTp2991g/8aLsvJIVyBw9
         2LiXD/xhihPQ95lt7LKI2dzgBhobYGfDngDpFQBBi8Rt8uFePuWurRTEynjZTOUhOS8S
         FgDliE5DNTD9r2/bYGaBCsFnaWiiHRGY8CHUC1CllLoJ+WoMzqj6X8J5AdLa3dPOre/b
         NxMfNbQIlCG+66dK9LjBfSdFYr70pPv2oJS93ASrgXjjzeHXnBDo4ce578E9dH1siFFV
         In7Bkht1nYBlgNZUXH8+zsnEIbAsrtFDuWfSs8vxc8VpUTKeoyZBVDDIDAzkKe+kZW6M
         59Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vM6VBvC9dlljZcFwCQFK0mCxo28kiLW172rY7fNviK4=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=eB0pdEM2HxHE1o9LtIns+5JSDkPP46zH7skOSzxb/JNglTm25TRpBSO50w3pvaxtt1
         SlQjZfHEeM2KFBZuOv9vOkMH/WS/MsZhsrIDma6bLxzZUwOdlPPmOOVFytczCsu+dA+6
         ijgsIXg8f95UC1I4EvNx1vprE8sCTw233sYTjtk7xzvfFaJYY9wHUOmDr9mZS0KmH0OJ
         afD0rAaykZbQGAYuweFzrKWJJJ/lCHw8Vc8j5CpkQC3mW8XmN6kNc5V0FbG0CfzKZdvC
         kPVDnimxOBjWmCO9MQauh8hINJtAMfifgfkX9aVtQ5r1VoSR0RL/bLB2Q7oAxzz/CO5h
         viJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=a8Cr1GVg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jd9-20020a05622a718900b00423b14b6473si7152639qtb.576.2023.11.28.15.58.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 15:58:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=a8Cr1GVg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r87xP-0001HK-Kw; Tue, 28 Nov 2023 18:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1r87xI-0001FJ-CB; Tue, 28 Nov 2023 18:57:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1r87xE-0007qc-NZ; Tue, 28 Nov 2023 18:57:27 -0500
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASNqAvX006765; Tue, 28 Nov 2023 23:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=vM6VBvC9dlljZcFwCQFK0mCxo28kiLW172rY7fNviK4=;
 b=a8Cr1GVgD8AXb3NWIMSiRAnN5ApE+nwb2Mm1gDk6FemYGI6ZKnNpjI2AnFdlzt9D/Aai
 JTA8u7DbzGLaHnwjeWATdkkmCRXYKTxmeGBPYMcE4367bRU1AfAYzWjUlzAai6HBwBEK
 pS7rP9wuOR1lJRCN4npXLVAZTZjsG+B0CjB0xFvjNlPjEXFjzwbQLN5ihvS0MUpJbnfA
 ci9Yrrhx7wmjsBL3phXtKce6NdTF34Joh/TIjP2Pof8H9uI2YLzSE/fysJuPoyBeNcKA
 6A2nFNILOkzc51NKySwE2bkJVPTMv/Gn1ettNF4q9drd5ktlMYjokPCtOmIOe2dFvSnH SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unt8n82p1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 23:57:08 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ASNrkWN009968;
 Tue, 28 Nov 2023 23:57:08 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unt8n82nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 23:57:08 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASN01wK004905; Tue, 28 Nov 2023 23:57:07 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwfk3b2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 23:57:07 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3ASNv6J321496518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Nov 2023 23:57:06 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 116EB58055;
 Tue, 28 Nov 2023 23:57:06 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFBDD58043;
 Tue, 28 Nov 2023 23:57:05 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Nov 2023 23:57:05 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v8 08/10] hw/fsi: Added qtest
Date: Tue, 28 Nov 2023 17:56:58 -0600
Message-Id: <20231128235700.599584-9-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231128235700.599584-1-ninad@linux.ibm.com>
References: <20231128235700.599584-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LW1UhwENDWNAVUHbtGZv4mSiNMi_x5WS
X-Proofpoint-ORIG-GUID: Zx20VGULlXVpUr8B_6GpyemtedTU0uMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_25,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 spamscore=0 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=505
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280188
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jFXKGVzvwyKy

Added basic qtests for FSI model.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/qtest/aspeed-fsi-test.c | 205 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   1 +
 2 files changed, 206 insertions(+)
 create mode 100644 tests/qtest/aspeed-fsi-test.c

diff --git a/tests/qtest/aspeed-fsi-test.c b/tests/qtest/aspeed-fsi-test.c
new file mode 100644
index 0000000000..b3020dd821
--- /dev/null
+++ b/tests/qtest/aspeed-fsi-test.c
@@ -0,0 +1,205 @@
+/*
+ * QTest testcases for IBM's Flexible Service Interface (FSI)
+ *
+ * Copyright (c) 2023 IBM Corporation
+ *
+ * Authors:
+ *   Ninad Palsule <ninad@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+
+#include "qemu/module.h"
+#include "libqtest-single.h"
+
+/* Registers from ast2600 specifications */
+#define ASPEED_FSI_ENGINER_TRIGGER   0x04
+#define ASPEED_FSI_OPB0_BUS_SELECT   0x10
+#define ASPEED_FSI_OPB1_BUS_SELECT   0x28
+#define ASPEED_FSI_OPB0_RW_DIRECTION 0x14
+#define ASPEED_FSI_OPB1_RW_DIRECTION 0x2c
+#define ASPEED_FSI_OPB0_XFER_SIZE    0x18
+#define ASPEED_FSI_OPB1_XFER_SIZE    0x30
+#define ASPEED_FSI_OPB0_BUS_ADDR     0x1c
+#define ASPEED_FSI_OPB1_BUS_ADDR     0x34
+#define ASPEED_FSI_INTRRUPT_CLEAR    0x40
+#define ASPEED_FSI_INTRRUPT_STATUS   0x48
+#define ASPEED_FSI_OPB0_BUS_STATUS   0x80
+#define ASPEED_FSI_OPB1_BUS_STATUS   0x8c
+#define ASPEED_FSI_OPB0_READ_DATA    0x84
+#define ASPEED_FSI_OPB1_READ_DATA    0x90
+
+/*
+ * FSI Base addresses from the ast2600 specifications.
+ */
+#define AST2600_OPB_FSI0_BASE_ADDR 0x1e79b000
+#define AST2600_OPB_FSI1_BASE_ADDR 0x1e79b100
+
+static uint32_t aspeed_fsi_base_addr;
+
+static uint32_t aspeed_fsi_readl(QTestState *s, uint32_t reg)
+{
+    return qtest_readl(s, aspeed_fsi_base_addr + reg);
+}
+
+static void aspeed_fsi_writel(QTestState *s, uint32_t reg, uint32_t val)
+{
+    qtest_writel(s, aspeed_fsi_base_addr + reg, val);
+}
+
+/* Setup base address and select register */
+static void test_fsi_setup(QTestState *s, uint32_t base_addr)
+{
+    uint32_t curval;
+
+    aspeed_fsi_base_addr = base_addr;
+
+    /* Set the base select register */
+    if (base_addr == AST2600_OPB_FSI0_BASE_ADDR) {
+        /* Unselect FSI1 */
+        aspeed_fsi_writel(s, ASPEED_FSI_OPB1_BUS_SELECT, 0x0);
+        curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB1_BUS_SELECT);
+        g_assert_cmpuint(curval, ==, 0x0);
+
+        /* Select FSI0 */
+        aspeed_fsi_writel(s, ASPEED_FSI_OPB0_BUS_SELECT, 0x1);
+        curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB0_BUS_SELECT);
+        g_assert_cmpuint(curval, ==, 0x1);
+    } else if (base_addr == AST2600_OPB_FSI1_BASE_ADDR) {
+        /* Unselect FSI0 */
+        aspeed_fsi_writel(s, ASPEED_FSI_OPB0_BUS_SELECT, 0x0);
+        curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB0_BUS_SELECT);
+        g_assert_cmpuint(curval, ==, 0x0);
+
+        /* Select FSI1 */
+        aspeed_fsi_writel(s, ASPEED_FSI_OPB1_BUS_SELECT, 0x1);
+        curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB1_BUS_SELECT);
+        g_assert_cmpuint(curval, ==, 0x1);
+    } else {
+        g_assert_not_reached();
+    }
+}
+
+static void test_fsi_reg_change(QTestState *s, uint32_t reg, uint32_t newval)
+{
+    uint32_t base;
+    uint32_t curval;
+
+    base = aspeed_fsi_readl(s, reg);
+    aspeed_fsi_writel(s, reg, newval);
+    curval = aspeed_fsi_readl(s, reg);
+    g_assert_cmpuint(curval, ==, newval);
+    aspeed_fsi_writel(s, reg, base);
+    curval = aspeed_fsi_readl(s, reg);
+    g_assert_cmpuint(curval, ==, base);
+}
+
+static void test_fsi0_master_regs(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+
+    test_fsi_setup(s, AST2600_OPB_FSI0_BASE_ADDR);
+
+    test_fsi_reg_change(s, ASPEED_FSI_OPB0_RW_DIRECTION, 0xF3F4F514);
+    test_fsi_reg_change(s, ASPEED_FSI_OPB0_XFER_SIZE, 0xF3F4F518);
+    test_fsi_reg_change(s, ASPEED_FSI_OPB0_BUS_ADDR, 0xF3F4F51c);
+    test_fsi_reg_change(s, ASPEED_FSI_INTRRUPT_CLEAR, 0xF3F4F540);
+    test_fsi_reg_change(s, ASPEED_FSI_INTRRUPT_STATUS, 0xF3F4F548);
+    test_fsi_reg_change(s, ASPEED_FSI_OPB0_BUS_STATUS, 0xF3F4F580);
+    test_fsi_reg_change(s, ASPEED_FSI_OPB0_READ_DATA, 0xF3F4F584);
+}
+
+static void test_fsi1_master_regs(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+
+    test_fsi_setup(s, AST2600_OPB_FSI1_BASE_ADDR);
+
+    test_fsi_reg_change(s, ASPEED_FSI_OPB1_RW_DIRECTION, 0xF3F4F514);
+    test_fsi_reg_change(s, ASPEED_FSI_OPB1_XFER_SIZE, 0xF3F4F518);
+    test_fsi_reg_change(s, ASPEED_FSI_OPB1_BUS_ADDR, 0xF3F4F51c);
+    test_fsi_reg_change(s, ASPEED_FSI_INTRRUPT_CLEAR, 0xF3F4F540);
+    test_fsi_reg_change(s, ASPEED_FSI_INTRRUPT_STATUS, 0xF3F4F548);
+    test_fsi_reg_change(s, ASPEED_FSI_OPB1_BUS_STATUS, 0xF3F4F580);
+    test_fsi_reg_change(s, ASPEED_FSI_OPB1_READ_DATA, 0xF3F4F584);
+}
+
+static void test_fsi0_getcfam_addr0(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+    uint32_t curval;
+
+    test_fsi_setup(s, AST2600_OPB_FSI0_BASE_ADDR);
+
+    /* Master access direction read */
+    aspeed_fsi_writel(s, ASPEED_FSI_OPB0_RW_DIRECTION, 0x1);
+    /* word */
+    aspeed_fsi_writel(s, ASPEED_FSI_OPB0_XFER_SIZE, 0x3);
+    /* Address */
+    aspeed_fsi_writel(s, ASPEED_FSI_OPB0_BUS_ADDR, 0xa0000000);
+    aspeed_fsi_writel(s, ASPEED_FSI_INTRRUPT_CLEAR, 0x1);
+    aspeed_fsi_writel(s, ASPEED_FSI_ENGINER_TRIGGER, 0x1);
+
+    curval = aspeed_fsi_readl(s, ASPEED_FSI_INTRRUPT_STATUS);
+    g_assert_cmpuint(curval, ==, 0x10000);
+    curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB0_BUS_STATUS);
+    g_assert_cmpuint(curval, ==, 0x0);
+    curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB0_READ_DATA);
+    g_assert_cmpuint(curval, ==, 0x152d02c0);
+}
+
+static void test_fsi1_getcfam_addr0(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+    uint32_t curval;
+
+    test_fsi_setup(s, AST2600_OPB_FSI1_BASE_ADDR);
+
+    /* Master access direction read */
+    aspeed_fsi_writel(s, ASPEED_FSI_OPB1_RW_DIRECTION, 0x1);
+
+    aspeed_fsi_writel(s, ASPEED_FSI_OPB1_XFER_SIZE, 0x3);
+    aspeed_fsi_writel(s, ASPEED_FSI_OPB1_BUS_ADDR, 0xa0000000);
+    aspeed_fsi_writel(s, ASPEED_FSI_INTRRUPT_CLEAR, 0x1);
+    aspeed_fsi_writel(s, ASPEED_FSI_ENGINER_TRIGGER, 0x1);
+
+    curval = aspeed_fsi_readl(s, ASPEED_FSI_INTRRUPT_STATUS);
+    g_assert_cmpuint(curval, ==, 0x20000);
+    curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB1_BUS_STATUS);
+    g_assert_cmpuint(curval, ==, 0x0);
+    curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB1_READ_DATA);
+    g_assert_cmpuint(curval, ==, 0x152d02c0);
+}
+
+int main(int argc, char **argv)
+{
+    int ret = -1;
+    QTestState *s;
+
+    g_test_init(&argc, &argv, NULL);
+
+    s = qtest_init("-machine ast2600-evb ");
+
+    /* Tests for OPB/FSI0 */
+    qtest_add_data_func("/aspeed-fsi-test/test_fsi0_master_regs", s,
+                        test_fsi0_master_regs);
+
+    qtest_add_data_func("/aspeed-fsi-test/test_fsi0_getcfam_addr0", s,
+                        test_fsi0_getcfam_addr0);
+
+    /* Tests for OPB/FSI1 */
+    qtest_add_data_func("/aspeed-fsi-test/test_fsi1_master_regs", s,
+                        test_fsi1_master_regs);
+
+    qtest_add_data_func("/aspeed-fsi-test/test_fsi1_getcfam_addr0", s,
+                        test_fsi1_getcfam_addr0);
+
+    ret = g_test_run();
+    qtest_quit(s);
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 47dabf91d0..33f8bfc9cb 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -207,6 +207,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
   (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] : []) + \
   (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed-fsi-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
-- 
2.39.2

