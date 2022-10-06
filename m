Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp634493ocb;
        Thu, 6 Oct 2022 10:13:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4d3FySctRWc382PP96IxZTA9Cel1FsdGQH4ObmxGZYLMvKaLjbgVAf6RurcMJX4gR1SNXC
X-Received: by 2002:ac8:5c0b:0:b0:35c:e066:998d with SMTP id i11-20020ac85c0b000000b0035ce066998dmr1031926qti.336.1665076391124;
        Thu, 06 Oct 2022 10:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665076391; cv=none;
        d=google.com; s=arc-20160816;
        b=Lg/pWWT8EJRNLOp1AJnWuATHSf5UDDu6+e4KlGk/kI+zdND5zT78ekMRnvqmGBAOLl
         oDXisfyQwL7wgN3SB7Z2DLVpbDJqlVTxXea3FbAggTPLV0Txk31uWb2tG4chD4/bnxQi
         Mn1syX1Q6oWw6GqNuIK87LBiU+jgLjtI8er8hke+ZRGwbOF5h//XL6r8QPXB14uNlBUw
         eCqsUmxN2qwQx4eHjMdvC1xfjlo2ZentWmskKDr8tOgmH2VxhJFBtDFZe7UOg56nzY2n
         X2L10NoxNJmmqg+oPCS+CefFmLW2VSPLPnef55VN3sOruKm1jNRXUoobDtyAzD7sYkbp
         M0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5GHVn7JC7YycS7J8f1l8OLLsQyao+YPeGmO4bOOeT10=;
        b=EwrLyqpCYkiJfWqsvaFgq1rT+pKe/3dhTm04BBJ2gTOdtDa47zpew8ChSStGxNmZN8
         jfClafAA1+p1riYEjxi1BHf9EWWGazBjaR0O/oRC1Mf3rxZjfAKhP2QqizHNz4c+yXfb
         5BL4UHqC74YaGWcMi0C8SBLei919qTRXeG6JNNgsGhokDrXQSgzs0mj3o/We1WHCfJud
         O87ZNUfwiiGMVK6s1aPD5iK0CUs7VMUttG9424ksj9PE3pOIdoVuUwqBxf3S3qtC4uq5
         JoWzVSEA2aG61EmVpWYFtLvRxgkPW551mDlz9hs8V+V1mCUrabsleubqwQSRixdGtWMi
         rnFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=MOX53My+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020ad45dc3000000b004b17bb24688si3638741qvh.571.2022.10.06.10.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 10:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=MOX53My+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:50272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogUQo-0001xY-Mj
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 13:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogTXA-0007OQ-27; Thu, 06 Oct 2022 12:15:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:3562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogTX7-0006nJ-3E; Thu, 06 Oct 2022 12:15:39 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296FhkfG009472;
 Thu, 6 Oct 2022 16:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=5GHVn7JC7YycS7J8f1l8OLLsQyao+YPeGmO4bOOeT10=;
 b=MOX53My+mE8Jr4TeWbL3DGtqNpbEPvBmXew0AiU9i6dFN9vsxgsFI0F3ThYzMXSMoAyC
 fHBtnDKxGe1JwBsn1jgSrb+tNnm0Z0Ksv1sLu1Gxwq4OKnqjmv83wk6njcka93+McDRK
 jZ+3uXlQ5KYfLwmB1dm0oaFvra3vptbuVlNMr1skiCOMItIpBIy1x0cvbBbSgNqIXSkT
 aeOaFvBfB1F35Wran+Nf4G8hywpcFOLD1NlApyaQgc3OyP1WHXrn2nMVwVvcsgnqCyei
 AeHvbDBSzD0hFwMAqEH7+BzQG2JBbYD6t+kPkFH38n159ekcL5Oof3zyJs5maKqjd79T Yg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k15up440f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 16:15:30 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 296FD397028324; Thu, 6 Oct 2022 16:15:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc06eq70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 16:15:29 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 296GFLrh001092;
 Thu, 6 Oct 2022 16:15:28 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-170-234.vpn.oracle.com
 [10.175.170.234])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3jxc06eq1e-2; Thu, 06 Oct 2022 16:15:28 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [RFC PATCH 1/4] tests/acpi: virt: allow acpi MADT and FADT changes
Date: Thu,  6 Oct 2022 16:14:47 +0000
Message-Id: <20221006161450.69912-2-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006161450.69912-1-miguel.luis@oracle.com>
References: <20221006161450.69912-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_04,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210060094
X-Proofpoint-GUID: 35ec96lBh-qf7HhV3iu0KpK9E1G8XMr6
X-Proofpoint-ORIG-GUID: 35ec96lBh-qf7HhV3iu0KpK9E1G8XMr6
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
X-TUID: t5bGWl0RaqHQ

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

