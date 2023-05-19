Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp138108ejq;
        Fri, 19 May 2023 15:23:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7l+ylAebusnGGat8xYtg6ldmI9Ya2EeagptF/g+fsphGsDm8Fh9JNVXvdIjN2afXq2023W
X-Received: by 2002:a05:622a:28c:b0:3f4:f58d:d00d with SMTP id z12-20020a05622a028c00b003f4f58dd00dmr6817047qtw.40.1684534996508;
        Fri, 19 May 2023 15:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684534996; cv=none;
        d=google.com; s=arc-20160816;
        b=hrRAuZW/9dDtJetUNWhmlp41BO8OZ8vVyy3h1SASsv/+aVZRDU9G0XfgRIAvLg6AD+
         lVZwgXwGHmjV5QBaHxAZpk4mKQJajJZANMJdyDAffs6u5t0Ts68+as9TNQxW6PYOuF81
         +aqfCqTmuTnGuUWF6cOkKbC/IGsSNp+5JgznIhDXb4zlEBNVZvpFxxFNUhUKS1ta59+7
         iO1pLGAA9YfpvWEVEBoG14c6jtcROvlhqTuAzfryEO7RHN4D0Ze0kMDO99k5ZhgTyPY8
         ey577+JRL4Fu6RhUYqGE/+V/WXTPze9dADeN0rUDYitA8pbQqm1g3300pRUwoU03D1yf
         T9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZQMgiGeTP0aj2d/37QCAcVJcNvrxA4WCQM4ErIojyYo=;
        b=jW/v2xGKu+rveYVv3RHjYKL36Uj3K6c4+QCms9eccmDQgTzyY6FeiPTyxqn9m3H/pI
         XKOh55fUU3SUEib0lmJo2zuzOAwV+K1CebmlRmTeISpJLq+B1H6XQqdJnE9IwL8LUOfG
         1/l7NKnqPloLQjPh5biWXocXhIMXjnJtnwRIYeoPP8PQtjIF+UML+UCVbGlAg7WpGJzC
         UAcgANe024VQjPs4H6QfsM/e7BPqsvcvvTUzRnegfoZ4kIPprXqe/jlzgUS43T9vuYyf
         5g4jtWpzAeerhNzwqD6Qal6d69F0zYClBI2ZQZW1Dp7uOKddPE4MP96u8lFQBZKY48Po
         +otQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sJZqvDyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b26-20020a05620a119a00b0074fb79aed78si80151qkk.73.2023.05.19.15.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 May 2023 15:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sJZqvDyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q08V0-0005XI-Ka; Fri, 19 May 2023 18:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1q07aZ-00022q-Uj
 for qemu-arm@nongnu.org; Fri, 19 May 2023 17:24:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1q07aY-0007f5-2z
 for qemu-arm@nongnu.org; Fri, 19 May 2023 17:24:39 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34JLKihP009137; Fri, 19 May 2023 21:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZQMgiGeTP0aj2d/37QCAcVJcNvrxA4WCQM4ErIojyYo=;
 b=sJZqvDyGFA8+XQJse7BaKNc6N//yALB86PeN7ymE3wUiksHHD48Q3ey6n4CSWnXhxFId
 pTrQJAwqZDcNl0H6/4SCHX7L/6uqhaWTz6DPuztaPbxbGmwY/GpEFnx2HAc6DC+GbJQh
 aIkZcX6JoavyzlntKMywhHYJHLuqzNolw8XFYJZmXcNKXkQHQ8QKrjqkLqy/vzl3hRfG
 /XtuuG0Hn1wF6Hz47/oG1d1YgPEfgXtHo6rIe1q5DEIdeAUYDlbQWOV29MH9id0DkHGa
 +dl4DnMnNTn5BkYZeYhZMRtL3YAQtED113CuCiwTX68IUDZQcrLEQWXK+NR8BeDbIZ0j 3A== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qpfhkjmx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 21:24:21 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34JIhjVZ010793;
 Fri, 19 May 2023 21:24:20 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3qj266h40p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 21:24:20 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34JLOJjD34406798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 May 2023 21:24:19 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D96AB58055;
 Fri, 19 May 2023 21:24:18 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C37FB5804B;
 Fri, 19 May 2023 21:24:18 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 19 May 2023 21:24:18 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id F25662ED7E4; Fri, 19 May 2023 16:24:17 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 qemu-arm@nongnu.org, joe@jms.id.au
Cc: Ninad Palsule <ninadpalsule@us.ibm.com>, ninad@linux.ibm.com
Subject: [PATCH v1 1/1] Add vpd data for Rainier machine
Date: Fri, 19 May 2023 16:24:12 -0500
Message-Id: <20230519212412.3362107-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230519212412.3362107-1-ninad@linux.ibm.com>
References: <20230519212412.3362107-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sGrmRWUNMw3FHim5D4qojKjO9KAP9JB6
X-Proofpoint-GUID: sGrmRWUNMw3FHim5D4qojKjO9KAP9JB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_16,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=993 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190182
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@us.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 19 May 2023 18:22:57 -0400
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
X-TUID: ZM3IhfiqkGhP

From: Ninad Palsule <ninadpalsule@us.ibm.com>

The VPD data is added for system and BMC FRU. This data is fabricated.

Tested:
   - The system-vpd.service is active.
   - VPD service related to bmc is active.
Signed-off-by: Ninad Palsule <ninadpalsule@us.ibm.com>
---
 hw/arm/aspeed.c        |  6 ++++--
 hw/arm/aspeed_eeprom.c | 45 +++++++++++++++++++++++++++++++++++++++++-
 hw/arm/aspeed_eeprom.h |  5 +++++
 3 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0b29028fe1..bfc2070bd2 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -788,8 +788,10 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
                      0x4a);
-    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
-    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
+    at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50,
+                          64 * KiB, rainier_bb_fruid, rainier_bb_fruid_len);
+    at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51,
+                          64 * KiB, rainier_bmc_fruid, rainier_bmc_fruid_len);
     create_pca9552(soc, 8, 0x60);
     create_pca9552(soc, 8, 0x61);
     /* Bus 8: ucd90320@11 */
diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
index dc33a88a54..ace5266cec 100644
--- a/hw/arm/aspeed_eeprom.c
+++ b/hw/arm/aspeed_eeprom.c
@@ -119,9 +119,52 @@ const uint8_t yosemitev2_bmc_fruid[] = {
     0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
 };
 
+const uint8_t rainier_bb_fruid[] = {
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x84,
+    0x28, 0x00, 0x52, 0x54, 0x04, 0x56, 0x48, 0x44, 0x52, 0x56, 0x44, 0x02,
+    0x01, 0x00, 0x50, 0x54, 0x0e, 0x56, 0x54, 0x4f, 0x43, 0x00, 0x00, 0x37,
+    0x00, 0x4a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x46, 0x08, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46, 0x00, 0x52, 0x54,
+    0x04, 0x56, 0x54, 0x4f, 0x43, 0x50, 0x54, 0x38, 0x56, 0x49, 0x4e, 0x49,
+    0x00, 0x00, 0x81, 0x00, 0x3a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x56, 0x53,
+    0x59, 0x53, 0x00, 0x00, 0xbb, 0x00, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x56, 0x43, 0x45, 0x4e, 0x00, 0x00, 0xe2, 0x00, 0x27, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x56, 0x53, 0x42, 0x50, 0x00, 0x00, 0x09, 0x01, 0x19, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x50, 0x46, 0x01, 0x00, 0x00, 0x00, 0x36, 0x00,
+    0x52, 0x54, 0x04, 0x56, 0x49, 0x4e, 0x49, 0x44, 0x52, 0x04, 0x44, 0x45,
+    0x53, 0x43, 0x48, 0x57, 0x02, 0x30, 0x31, 0x43, 0x43, 0x04, 0x33, 0x34,
+    0x35, 0x36, 0x46, 0x4e, 0x04, 0x46, 0x52, 0x34, 0x39, 0x53, 0x4e, 0x04,
+    0x53, 0x52, 0x31, 0x32, 0x50, 0x4e, 0x04, 0x50, 0x52, 0x39, 0x39, 0x50,
+    0x46, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23, 0x00, 0x52, 0x54,
+    0x04, 0x56, 0x53, 0x59, 0x53, 0x53, 0x45, 0x07, 0x49, 0x42, 0x4d, 0x53,
+    0x59, 0x53, 0x31, 0x54, 0x4d, 0x08, 0x32, 0x32, 0x32, 0x32, 0x2d, 0x32,
+    0x32, 0x32, 0x50, 0x46, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23,
+    0x00, 0x52, 0x54, 0x04, 0x56, 0x43, 0x45, 0x4e, 0x53, 0x45, 0x07, 0x31,
+    0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x46, 0x43, 0x08, 0x31, 0x31, 0x31,
+    0x31, 0x2d, 0x31, 0x31, 0x31, 0x50, 0x46, 0x04, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x15, 0x00, 0x52, 0x54, 0x04, 0x56, 0x53, 0x42, 0x50, 0x49,
+    0x4d, 0x04, 0x50, 0x00, 0x10, 0x01, 0x50, 0x46, 0x04, 0x00, 0x00, 0x00,
+    0x00, 0x00,
+};
+
+/* Rainier BMC FRU */
+const uint8_t rainier_bmc_fruid[] = {
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x84,
+    0x28, 0x00, 0x52, 0x54, 0x04, 0x56, 0x48, 0x44, 0x52, 0x56, 0x44, 0x02,
+    0x01, 0x00, 0x50, 0x54, 0x0e, 0x56, 0x54, 0x4f, 0x43, 0x00, 0x00, 0x37,
+    0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x46, 0x08, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x52, 0x54,
+    0x04, 0x56, 0x54, 0x4f, 0x43, 0x50, 0x54, 0x0e, 0x56, 0x49, 0x4e, 0x49,
+    0x00, 0x00, 0x57, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x46,
+    0x01, 0x00, 0x00, 0x00, 0x1a, 0x00, 0x52, 0x54, 0x04, 0x56, 0x49, 0x4e,
+    0x49, 0x44, 0x52, 0x04, 0x44, 0x45, 0x53, 0x43, 0x48, 0x57, 0x02, 0x30,
+    0x31, 0x50, 0x46, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
+};
+
 const size_t tiogapass_bmc_fruid_len = sizeof(tiogapass_bmc_fruid);
 const size_t fby35_nic_fruid_len = sizeof(fby35_nic_fruid);
 const size_t fby35_bb_fruid_len = sizeof(fby35_bb_fruid);
 const size_t fby35_bmc_fruid_len = sizeof(fby35_bmc_fruid);
-
 const size_t yosemitev2_bmc_fruid_len = sizeof(yosemitev2_bmc_fruid);
+const size_t rainier_bb_fruid_len = sizeof(rainier_bb_fruid);
+const size_t rainier_bmc_fruid_len = sizeof(rainier_bmc_fruid);
diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
index 86db6f0479..bbf9e54365 100644
--- a/hw/arm/aspeed_eeprom.h
+++ b/hw/arm/aspeed_eeprom.h
@@ -22,4 +22,9 @@ extern const size_t fby35_bmc_fruid_len;
 extern const uint8_t yosemitev2_bmc_fruid[];
 extern const size_t yosemitev2_bmc_fruid_len;
 
+extern const uint8_t rainier_bb_fruid[];
+extern const size_t rainier_bb_fruid_len;
+extern const uint8_t rainier_bmc_fruid[];
+extern const size_t rainier_bmc_fruid_len;
+
 #endif
-- 
2.37.2

