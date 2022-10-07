Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp559386ocg;
        Fri, 7 Oct 2022 08:39:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Zgr0Pr/Zs2XHlIQQUdArYWGmNH2ORPWnF5kWgxa6fMDWmU9YCuZLDqK/8AL3pQcrtANRF
X-Received: by 2002:a05:622a:1489:b0:38b:4ffe:1e14 with SMTP id t9-20020a05622a148900b0038b4ffe1e14mr4591312qtx.3.1665157169937;
        Fri, 07 Oct 2022 08:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665157169; cv=none;
        d=google.com; s=arc-20160816;
        b=lCc33vLcX6p7q6FiA0OYTnNfRllIahmDUif79XDw4SI0kKtBZQhHd/0BBe+Ow1mKvc
         2mVTtH6PiycQC3xEY54Er9GQmyLj3epCP0D1qKzBAiZ2xHExkQaqStK0Ql0tfemoTR37
         +pJ+L9742mvPwwU+umUPPjwNPvbXevLDvU+P8CjK/9GEdkvUlpfENhXrrFnlws7VE2LS
         3kr0/tgSBb8GcODzTnaYW51CjN5g5S774zhJmyOIMkI9Flp4T7nLcZT7biG9T13n2Opp
         0jirZXOGp32V6FgdmESt8AmWlsEitx4DQc9ktT9EZhcxgKbKmsvf47d1NJQmDuJKfyhP
         41NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z5R9k+zKUF4wLdXiAOWytWCQ+hAL2PHaZ/kaHNyfscU=;
        b=bjb5C3A/V7fyJ66MvonAN3V5YTfIfQOJl/O9evjeIdzavMABp4yTGygyHg3IL0wE+I
         FgiQ22Lumdp2GHneV9J1DQx5/kuBjqF7QqZx0NMCt9eKcGFBabOnsAU8wCq6ZvgVmsUB
         wU7W02K52mLrOVoElLZb5lYMuAT3llL46NmLfSTXhw74ls49K9s6jw42IdqZ4ym/h1Rk
         O3agSxU+DbhUWO/mo7ypLL0rIYkDLk7Vog2c/nHjSleCNltIx6YNv+vGYfnD1bB3tBmq
         s7Vom1luXoPsfx8kbanaE3oQGpNy5bN4npFa9M2XffuOSl1GAYWg3qKHCxlreEPU8+fd
         0ceA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b="RaLOH/gV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm5-20020a05622a250500b0035cf02874bcsi1341437qtb.253.2022.10.07.08.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 08:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b="RaLOH/gV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:33206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogpRh-0007Sj-HP
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 11:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogocQ-00082H-8f; Fri, 07 Oct 2022 10:46:30 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:9072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogocO-0000AR-K4; Fri, 07 Oct 2022 10:46:29 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297BxQlH023379;
 Fri, 7 Oct 2022 14:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=z5R9k+zKUF4wLdXiAOWytWCQ+hAL2PHaZ/kaHNyfscU=;
 b=RaLOH/gVHHZkSTzVvMhzTUTEM7yCwROmweoX6hTy/3ARflEmglwT5xtmla7LfhoKi9J0
 iRaiWrSQpyD/Wwfe5B2DDPGv9iG7HnzAn6UxwqcQC0hsH/TBdqoLHS25r+0/W5+21/LX
 KtueSSzLqcHQodfu/slrhtKS9MG8sxPfpGHXOhQ4X4I6Vb0dzre0w0wk2+IcbDj2G2Gx
 ZdIONRRgMGmSZOsfNsLkiWEWUhcsBnFCJzZvZjJbwAuVGp2/brgSk/wxLd95/09eVVWf
 dR8u7veXZQQ+LblIj9o4GgcTTtjFdfAYOlJfslzQhXoUbGdJ3zgW7aJdrZjiBawIY318 Fg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxe3typst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 14:46:23 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 297DXQQh002678; Fri, 7 Oct 2022 14:46:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc0d8n4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 14:46:21 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 297EkCYI028446;
 Fri, 7 Oct 2022 14:46:21 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-212-78.vpn.oracle.com
 [10.175.212.78])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3jxc0d8n08-2; Fri, 07 Oct 2022 14:46:20 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [PATCH v2 1/3] tests/acpi: virt: allow acpi GTDT changes
Date: Fri,  7 Oct 2022 14:45:51 +0000
Message-Id: <20221007144553.79648-2-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007144553.79648-1-miguel.luis@oracle.com>
References: <20221007144553.79648-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070088
X-Proofpoint-ORIG-GUID: Z4nMMgh_bRy2TCXwLMfrAW37eu_bKBKz
X-Proofpoint-GUID: Z4nMMgh_bRy2TCXwLMfrAW37eu_bKBKz
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
X-TUID: d50NLenWw+2Z

Step 3 from bios-tables-test.c documented procedure.

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..957bd1b4f6 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/GTDT",
+"tests/data/acpi/virt/GTDT.memhp",
+"tests/data/acpi/virt/GTDT.numamem",
-- 
2.37.3

