Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2613197ejn;
        Tue, 11 Oct 2022 11:18:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qqU0Rw4VQSJE6N7HXOaKr/AwFCnDrNpSIS8h/3eidTGd2o5k23JMirEwUJoXSvA3VYoeM
X-Received: by 2002:a05:620a:1986:b0:6ec:fc63:1dce with SMTP id bm6-20020a05620a198600b006ecfc631dcemr8085039qkb.90.1665512337329;
        Tue, 11 Oct 2022 11:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665512337; cv=none;
        d=google.com; s=arc-20160816;
        b=dwOe8+u4JqnaubHglTR9UWkUU3O30TLdDXO+VKPjWnNpDcomCBXNSyceHiHrgf9XpD
         K56Mi0t5LAlmL1eSDFQBzJMZpXMy16zuMOcT2MzmB5znwJNMh9o/+iYzWqt5/o1zN9ti
         LSTc0wqlPx9TQrn/ABtnEtV4UM86HYMIpjiF5sDVjx5Wt5lmb21BayYWt2Y3vUsu8f7F
         2ugPIALlbCb7zK451JvcpCYLzIL4YlZccKkmQJGX1EjGHb/f7Pc5TLR1n3Fh/aVeMZ4M
         4bvExl+BR8+laKPBm8McFPs3L+WYieamVhQXAZnWsGtx5unzQQ0AgaGBkEkqXyVXyBp2
         wZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5GHVn7JC7YycS7J8f1l8OLLsQyao+YPeGmO4bOOeT10=;
        b=LNsPQXCRUrdBp2k1Sm78CYABTBYBbbsFno2HPdosmlEX8E1X31xnsqjBPvc6mVRJ0S
         ljNtSfTgD3lbl84Hqt3LIdmv2lRJB1e/JjXCJz1w1oYgGb1L85nzcQ03A/L1e4H9mHin
         0x0iwsOgKMRsVO3wb3XZb694p9ey5uwEJCmIKKzLYtqvmxosEg4hB05JWqAfvHUsT+27
         OvVdlxCFK4R0bVyzdUuG0eEQxZOSxuk18mUy+H+Vrq44sED01sGt0KbQcBCZU+OU/P/A
         +HkI0ptfjUNYXWQ8qthCXHiAv0V0WfZtlKI5aKEIb0IX5+w7eqya3uZSgb1r6ifoh+3e
         d5kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=bu1cjTkD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk6-20020a056214508600b004b3d3741f5dsi6262051qvb.331.2022.10.11.11.18.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 11:18:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=bu1cjTkD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiJqC-0006cr-HN
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 14:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oiJpK-0006bC-Tr; Tue, 11 Oct 2022 14:18:02 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oiJpI-0003TC-GY; Tue, 11 Oct 2022 14:18:02 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29BHTBab001498;
 Tue, 11 Oct 2022 18:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=5GHVn7JC7YycS7J8f1l8OLLsQyao+YPeGmO4bOOeT10=;
 b=bu1cjTkDHgO3A+sIi2sinWfM+OY0z4lCw86nzyrXjfGLioS7dRtVza/xdtMB6RrnCTSb
 ikpwgrk9CR1j/NIM7XmbURVnvYryEbA/0R5Osw0gbjoWqb6N8yJ3WX9uS1r8gsomN23K
 XWYlfkyGB8LoCrInZwPj9HGxyRaVqRIHRrC6ZnG41LeR5iTgZqEHVUnc8OYtp1YiYZzh
 2jQP9R8QvBiSE8B3wG+2KF0vqI8vu8Kx2JLqnk7oKdsrONAOvwAiyLsVwWa4g2yXMZ5I
 4WXc7JYeKrMZVmitmWGmEClrBE6bZIZ5OSP/C3pdHO3Rd3LcsgusJ+cJuZRtfi7paEbO JQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k2ymcyen9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 18:17:57 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29BFWbtu027624; Tue, 11 Oct 2022 18:17:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2ynaf4hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 18:17:56 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29BIEwgo034553;
 Tue, 11 Oct 2022 18:17:56 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-196-28.vpn.oracle.com
 [10.175.196.28])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3k2ynaf4fc-2; Tue, 11 Oct 2022 18:17:56 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [PATCH 1/4] tests/acpi: virt: allow acpi MADT and FADT changes
Date: Tue, 11 Oct 2022 18:17:27 +0000
Message-Id: <20221011181730.10885-2-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011181730.10885-1-miguel.luis@oracle.com>
References: <20221011181730.10885-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_08,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110106
X-Proofpoint-GUID: fsodX5ora60tBtbIFd5HMJj1Y-4k4B2t
X-Proofpoint-ORIG-GUID: fsodX5ora60tBtbIFd5HMJj1Y-4k4B2t
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
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
X-TUID: BKwk06ZuWw7r

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

