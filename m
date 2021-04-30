Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp324491lfg;
        Fri, 30 Apr 2021 10:25:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHU8w8WxCvyEW73GLYpP/9ozSCo6Jmy9NcL/0TCLh7NhYiQVXNp8Qn1nQpmMaG9bnUIIUz
X-Received: by 2002:a05:6402:17ef:: with SMTP id t15mr4515214edy.385.1619803550034;
        Fri, 30 Apr 2021 10:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619803550; cv=none;
        d=google.com; s=arc-20160816;
        b=kVK+HvmRUY5YlGJbaXs6FUJnmsy75VGeuaEef0Di9t0vjXW8SOuB/WJxoT8hJKhN7T
         M6jHm7HqmHr8u3i7DQ/ruPaJ+m2aqOcQUr4PpcBuXC7C4zweSlcOdFfatlvJVtlxppdR
         oYqdJJ3reyN/rM2tGsezIm6QmRIHGXI9tyJa1X1/KqNglcA2k4Cxqu5SCWujVJfA9Rhe
         2rs0Nb6pIuY61C3JSyMpKnfhYEUFfmPevoqmxij6rHYCYbVuHaUNAQ+EK6uUOjQ/+CVz
         5cuif3RkOSa0ZsCfm7lKAO4A3HLYThaZUwpmdcHrIGEUf9oAUfpR+Y4eALNS4vC/ckez
         /vIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=4ChMVyuQV2ZYm9KemfbdH2KymaWzDGsz2O5HgfvGuh0=;
        b=IY1syfNdUCVlBrQ15MgmfRUG3P0krAaKVtzK8/ty3I/JXqfv35HREjFsASIto0rrjn
         pbgHiHkEGnJ9QmX4ZiC5h+ZMZf8yX4K7q6zvFj/bxOqJ/glOH2dZkB4SXOJb/z+wkG3E
         2CjkgQSxYvnT3zi9y1FDx9r3YbZcMgn2aAiUqLMWMIcCdT/nePS6UhpyE6P3X91qylCK
         PI6b5FMU9UGGR9qo5B0w01P6OynJjWDBs+SFLIV6T175fx6XwNAMIOeB47AC0oD9bx8w
         DH4MBivs/0z6LIA68HIfVFfcTsKKLpCTTY6JLrlDsGYLray2WBrrYH76LD0J8GTFH5iO
         y4/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si2656882edr.432.2021.04.30.10.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 10:25:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcWtg-00058b-Sz
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 13:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW5-0000I2-MS; Fri, 30 Apr 2021 13:01:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW3-0002Vh-VP; Fri, 30 Apr 2021 13:01:25 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UGXG6A051955; Fri, 30 Apr 2021 13:01:19 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388m5nuvks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 13:01:19 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UGueWj013869;
 Fri, 30 Apr 2021 17:01:16 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 384ay8kam1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 17:01:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13UH0nXt25428262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 17:00:49 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 593F25204E;
 Fri, 30 Apr 2021 17:01:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 1CFA75204F;
 Fri, 30 Apr 2021 17:01:14 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 75844220193;
 Fri, 30 Apr 2021 19:01:13 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 17/18] hw/block: m25p80: Add support for mt25ql02g and mt25qu02g
Date: Fri, 30 Apr 2021 19:01:07 +0200
Message-Id: <20210430170108.10261-8-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430170108.10261-1-clg@kaod.org>
References: <20210430170108.10261-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: umj7qbXoIjo8MZ6VQxJE6oPUin3bDZkc
X-Proofpoint-ORIG-GUID: umj7qbXoIjo8MZ6VQxJE6oPUin3bDZkc
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=674 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104300109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yhOWsG41VAxK

The Micron mt25ql02g is a 3V 2Gb serial NOR flash memory supporting
dual I/O and quad I/O, 4KB, 32KB, 64KB sector erase. It also supports
4B opcodes. The mt25qu02g operates at 1.8V.

  https://4donline.ihs.com/images/VipMasterIC/IC/MICT/MICT-S-A0008500026/MI=
CT-S-A0008511423-1.pdf?hkey=3D52A5661711E402568146F3353EA87419

Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 183d3f44c259..b77503dc845f 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -259,6 +259,8 @@ static const FlashPartInfo known_devices[] =3D {
     { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4=
) },
     { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2=
) },
     { INFO_STACKED("mt25qu01g", 0x20bb21, 0x1040, 64 << 10, 2048, ER_4K, 2=
) },
+    { INFO_STACKED("mt25ql02g", 0x20ba22, 0x1040, 64 << 10, 4096, ER_4K | =
ER_32K, 2) },
+    { INFO_STACKED("mt25qu02g", 0x20bb22, 0x1040, 64 << 10, 4096, ER_4K | =
ER_32K, 2) },
=20
     /* Spansion -- single (large) sector size only, at least
      * for the chips listed here (without boot sectors).
--=20
2.26.3

