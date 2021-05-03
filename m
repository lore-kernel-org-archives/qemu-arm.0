Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2372336lfg;
        Sun, 2 May 2021 22:41:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/OXCXteCvt46IimVHzE6OUSLOvAAp0JdI4zLlc+bsfSWAEow8YkVIgQ1NWQR2Sfu0bvoK
X-Received: by 2002:a25:b290:: with SMTP id k16mr23118842ybj.145.1620020484285;
        Sun, 02 May 2021 22:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620020484; cv=none;
        d=google.com; s=arc-20160816;
        b=v3dvd/giXPyEauSSfJBVS6HvZ9xQskt0tsiojzxQWm+wpB1cRVkFlscvWfrg9p0su+
         L2hsU3F8a6wYzzltQ8GnQoCdJltGlh1JzOCsDnEMjph7tY8Tcb1US8bufiUSSKAZKVog
         BaH8Q3hZsQokqCLyICJk/rLcg1PTa5ZOZHvn8Rd/dGV1DEaz6PPsNBkp3rE+Cl7KJAM1
         dkyQhlxnSi50On/OL5QGAZl6H8kPhyFvp4G0v4AC1p11BnZfisyiVLZinpYBoJoA1fn0
         lm0MggpeXq3ozzbnWVsg7MeshynSvV78b8/XQsERK4eIPSliatGHjs+BjA6DBN6YwygS
         qabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=4ChMVyuQV2ZYm9KemfbdH2KymaWzDGsz2O5HgfvGuh0=;
        b=OyS4kXH/Nm6EpOb9cwoqUIOU+2mcIkT1zdEX6AOhSawMukVrl5Zjj6G3AV5SzNPpuO
         IDKvRWGCec60zZSJsMyHbhGuw0qXGHGUgHOwKeiYK8EW/EQ9TvDEN4F8BOsIHke8ZbNE
         2JxCcQI0Phq+KXuuBNbWcDtQkIdMQRLN8Ju8IMySKh+3ki019uTzgwb/GVxmvDSsxS1v
         mNAWAdu6Vhg2QkmhYwuxr0s3AVWKWHl+ayi6wU0Y9A0a9mxOI+yaMs8Gvxr46vHyFD2M
         KqzNEWCMOG2I7Ej7EauMLyiqapIiGZyrK8BS0g1jbyM2apPb/48KY1CvugFKyGnZJrkr
         gAOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si13116347ybc.315.2021.05.02.22.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 22:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldRKd-0006ep-MR
	for alex.bennee@linaro.org; Mon, 03 May 2021 01:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6g-00058I-6b; Mon, 03 May 2021 01:26:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6c-0006CN-O5; Mon, 03 May 2021 01:26:57 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14352jcc156957; Mon, 3 May 2021 01:26:23 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38a9h29m94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:23 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1435JkNu015435;
 Mon, 3 May 2021 05:26:21 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 388x8hgh7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 05:26:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1435PrtH36766070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 05:25:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA7B2A4051;
 Mon,  3 May 2021 05:26:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC8E0A4055;
 Mon,  3 May 2021 05:26:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 May 2021 05:26:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 005F722007C;
 Mon,  3 May 2021 07:26:17 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 17/18] hw/block: m25p80: Add support for mt25ql02g and mt25qu02g
Date: Mon,  3 May 2021 07:25:59 +0200
Message-Id: <20210503052600.290483-18-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
References: <20210503052600.290483-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: utzRlXxpSwpDo8HpkKu1yPOpsgh-zHwm
X-Proofpoint-ORIG-GUID: utzRlXxpSwpDo8HpkKu1yPOpsgh-zHwm
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_02:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=668 phishscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1034
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030033
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
X-TUID: QdDCU1ZOQOey

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

