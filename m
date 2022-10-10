Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2429322ocg;
        Mon, 10 Oct 2022 06:24:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6mKMLX2QEX+sqL9yxhK4V5cjiEGt5+WxCCiIIud1Zl4FBx3S+776lcA9cn+/qty73IQ9/2
X-Received: by 2002:a0c:90a2:0:b0:47b:6b36:f94a with SMTP id p31-20020a0c90a2000000b0047b6b36f94amr14533929qvp.26.1665408241634;
        Mon, 10 Oct 2022 06:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665408241; cv=none;
        d=google.com; s=arc-20160816;
        b=fVJNp0gIJDaTt+P71Xd2INAUCbbG+AHwM4fIyeTbuktpQYZVR7qSDroLFpUNQSGehG
         i7Pcw3Azlib/ZB8vkwzOMraO+riA+mTNWBANKTuU6mBLN7/Ht+rjSBk1BWetaGRsIXTj
         ixCPZ4e44fKArv9GJ8esWgbLsLzVsm43p7h8G6thIdVDGZV+o95LKgoFn/uwuljZhKD1
         C6QukrJmHTfnXQye6uaSytGWBv5d5YbqR8xf+bI1bfXTenmGDIGro5ACSpJuDcT+hfie
         kJOty1C3/yZsIn3HvZpgmlyTrZvEsjNGavifjng7RSwonO0lxGYtd2oK3Z9DvoSb2Q7S
         00qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5GHVn7JC7YycS7J8f1l8OLLsQyao+YPeGmO4bOOeT10=;
        b=UZyqqrKzIN5kBZJuXBRrWHVktoy4n34q4+4iX8yfRhuP5QfwBmd00spjTFSzJPrgVZ
         llA73HZREbvyOEGuZHoQt0uzF9GP2MNYAnlbRRBd+63M0YlEtbxkaUpVscidVd0BaCrQ
         AWcjyYBEvIPGKchNjYzEtXJYDEhYsbQDx4HH7Bi0bLpmXmbHBm7F6GJufSUNjpP71Iid
         1reaWnWZy058lkU3JRzEYwGkrr8LWZCnrlSdZxy9RqNBOk8wTOmrHtmLTFTUiZxpUQl6
         TmAo5jELkbQ/kXQ1pW434fD09T0AN0CJFWkFc/6XJquvmdTptHADI7mN9jfyfnZTTEyy
         PUjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=DUNSpnm1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj24-20020a05620a191800b006b55fab9f37si5302667qkb.595.2022.10.10.06.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 06:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=DUNSpnm1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohslF-0006I3-7R
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 09:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ohskw-0005uG-4G; Mon, 10 Oct 2022 09:23:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ohsku-0003Um-5b; Mon, 10 Oct 2022 09:23:41 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29ABv1Kk012837;
 Mon, 10 Oct 2022 13:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=5GHVn7JC7YycS7J8f1l8OLLsQyao+YPeGmO4bOOeT10=;
 b=DUNSpnm1crfdjwG3kIU5sEdTk8NvHm5aogFQviq8agd2xUjRzZGt+udS4jrH4tbp92AF
 0nBXz2pWq9wuF8JB4jkuBDLeLNCvgsBneIhZ3g41tf4tD2Q7DQEhEjTPv8C0cueaJcT8
 RWGFb7VtnfUDlvzm8YlXHyOFsNcdJaXGPVGAM3ZBwrXZHB8rVXLDB8Sm79MUXjpQ2Fhq
 ZcnrgKmTPAazPoNI9ke4OfE257wiSxECdegroLKXvCOFNZtKIekoa3F14OSzV393IJUf
 /wadUEzM+ffLw/+AHQSMQ9fDruPucAtUF34U080LzQ2EHWKBDOXSZMYvInc8uwwDt6wa MQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k31rtbk72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Oct 2022 13:23:34 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29ADDD1B021822; Mon, 10 Oct 2022 13:23:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yn3482a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Oct 2022 13:23:33 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29ADNNh2019450;
 Mon, 10 Oct 2022 13:23:33 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-204-94.vpn.oracle.com
 [10.175.204.94])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3k2yn347wn-2; Mon, 10 Oct 2022 13:23:32 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [RFC PATCH v2 1/4] tests/acpi: virt: allow acpi MADT and FADT changes
Date: Mon, 10 Oct 2022 13:22:57 +0000
Message-Id: <20221010132300.96935-2-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010132300.96935-1-miguel.luis@oracle.com>
References: <20221010132300.96935-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_08,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100080
X-Proofpoint-GUID: 3l1drk8VkhU8H6AQlwSNvhBnaW9hI9SL
X-Proofpoint-ORIG-GUID: 3l1drk8VkhU8H6AQlwSNvhBnaW9hI9SL
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
Reply-To: miguel.luis@oracle.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5hlEqhqfo6Yi

Step 3 from bios-tables-test.c documented procedure.

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..8dc50f7a8a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/FACP",
+"tests/data/acpi/virt/FACP.numamem",
+"tests/data/acpi/virt/FACP.memhp",
+"tests/data/acpi/virt/APIC",
+"tests/data/acpi/virt/APIC.memhp",
+"tests/data/acpi/virt/APIC.numamem",
-- 
2.37.3

