Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp523101njc;
        Fri, 27 Sep 2024 11:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUya4tqKih7Gg3ZWUT+02vmzYAGfKB8zjs7zhzP01H5Q7LowZX3j3z4CYPqvtkt5BB06nnRunFQTx2MqA==@linaro.org
X-Google-Smtp-Source: AGHT+IGWQHJP/ni1DAz8ZoIFrPndNbfFuX388Gg+HG7joLjBRDeCr5/MPo7RSyUj9I6gHjt7POXz
X-Received: by 2002:a05:6214:3908:b0:6c3:5926:a070 with SMTP id 6a1803df08f44-6cb3b62cc3amr54584926d6.30.1727462463419;
        Fri, 27 Sep 2024 11:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727462463; cv=none;
        d=google.com; s=arc-20240605;
        b=densMiO7SgIzzSsX1k0jkVXHAIH/XfWwDehMs4KeW5iqq9LDkTCFUu5pL9XrScb8zQ
         gmkP99dhhw10SQum9Z7N3OK5fdp3N/HKLCuqzILrSuUZpOWwnNK0nd9jMr56qz+dbr8x
         +vkZCMnIQFOeJrAnHrBvIT2WPnTAhfd1p9tRG8kuWeFJ5luHfPU+y3XketYFbXi6OpxQ
         EhdGO4MroLy6xlKKa5FI5ziOuRbS3dpUK6V5NayUymXVKw1XjeMsKYaSpxycTCnq/I0N
         xvQQXYw6rwW+c68054v4f4mBzLGHAP3IVdZdvCZAICjwQB/nyIAQ5ez3KLpe4bwnliNL
         KjNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=inndt6ew6MTEcC6kmRfkoTY6qU9U3jastIodPwqdQos=;
        fh=0jvlPj6FfZI8yMiCe8KYsRPZa/AaDVZptXEU0geLoY4=;
        b=FcWOzBCJNF2syecuUCDwK7vy/Cax7/+wdGpesWYUZHnMlx0JmEeliua3j1mv6w+/PK
         2F+9TOYm7jyFyoZrdqt63Cb86BkA1ar9HNU0ZUpxPQlSMQlAlua+mGF/rnjrJrcGtjhk
         AH+OYNxjD82z047IALYrVTx92d+q8rFF8vl3B26rz4AQyoadojTtqlOYL7eOkj6EVe8T
         /dHMX2Svu0Wm2PzjiB10KagL+NocIy7hhv/k2SNJLqZh089NpbCVYouKdX5QOPV7sJGX
         Xl5KZ97R4xRYtrR+KzKr9eDIAwqJY5e7VBHlFYh+vANDlvwszxk8WHidvbRzBQAn88yh
         Qopw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=Xa+ZALnN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b6be3aesi28488346d6.517.2024.09.27.11.41.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 11:41:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=Xa+ZALnN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1suFtB-0007gO-C5; Fri, 27 Sep 2024 14:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1suFt7-0007ah-DA; Fri, 27 Sep 2024 14:40:21 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1suFt5-0002Jp-Sp; Fri, 27 Sep 2024 14:40:21 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RHMbn0032355;
 Fri, 27 Sep 2024 18:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :reply-to:mime-version:content-transfer-encoding; s=
 corp-2023-11-20; bh=inndt6ew6MTEcC6kmRfkoTY6qU9U3jastIodPwqdQos=; b=
 Xa+ZALnN9X4H+25sdnv2cmXax2QbWp+RbHhxnpYDOue8Q7lU8Vx4tb25i0rk0kca
 swLZn3fv8wBdhukgVcM08xIRixZitRdWB+8BxF00g+YScj/GlTJVKTiQ505Aw6CM
 zJ3qAeA1GvBZFlcBRJt4AjobrWJLXlNojrSe7eeNyA16GfMmtp8Xbhj/mNUGUkv2
 W0CpRYt6cAGYmDtheBvT/fEhkBDgIE/45V6f7EmZYXAtxsRLZjrNSo0+VrtkVWeF
 zDWqPbWA2bt7UdLvHAfOsxlpQia4Dml9raleROkmbr916edNiR2HsBy7MRTRMTpH
 Q25aDOmLU6fpIt5LG7zVzA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41sp1ar9e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2024 18:40:12 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 48RIA5lt032892; Fri, 27 Sep 2024 18:40:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 41smkm8gjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2024 18:40:10 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48RIdIoj009004;
 Fri, 27 Sep 2024 18:40:09 GMT
Received: from localhost.localdomain (dhcp-10-175-14-34.vpn.oracle.com
 [10.175.14.34])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 41smkm8ff6-9; Fri, 27 Sep 2024 18:40:09 +0000
From: Annie Li <annie.li@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com
Cc: dave@treblig.org, mst@redhat.com, anisinha@redhat.com,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, zhao1.liu@intel.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eblake@redhat.com, armbru@redhat.com,
 annie.li@oracle.com, miguel.luis@oracle.com
Subject: [RFC V2 PATCH 08/11] tests/acpi: allow FACP and DSDT table changes
 for arm/virt
Date: Fri, 27 Sep 2024 14:39:03 -0400
Message-ID: <20240927183906.1248-9-annie.li@oracle.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240927183906.1248-1-annie.li@oracle.com>
References: <20240927183906.1248-1-annie.li@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_06,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409270135
X-Proofpoint-ORIG-GUID: 595fO0j4qbCA8aJwtyAjaqmLQKpJjjjy
X-Proofpoint-GUID: 595fO0j4qbCA8aJwtyAjaqmLQKpJjjjy
Received-SPF: pass client-ip=205.220.165.32; envelope-from=annie.li@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tEOjnavHOys1

From: Miguel Luis <miguel.luis@oracle.com>

List changed files for FACP and DSDT table changes for the arm/virt.

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..dcc7c2306d 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/virt/DSDT.memhp",
+"tests/data/acpi/virt/DSDT.pxb",
+"tests/data/acpi/virt/DSDT.topology",
+"tests/data/acpi/virt/FACP",
-- 
2.43.5

