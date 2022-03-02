Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp528274lfo;
        Wed, 2 Mar 2022 00:33:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuLxlxtEvCje6SsbDXQKLUdbH9LEJp7tpPYqgIK+N+SeePpVm8jAsnijZXpBQPG1VX/+iw
X-Received: by 2002:a05:6214:4015:b0:433:bc7:2ec8 with SMTP id kd21-20020a056214401500b004330bc72ec8mr9860540qvb.12.1646210038865;
        Wed, 02 Mar 2022 00:33:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646210038; cv=none;
        d=google.com; s=arc-20160816;
        b=sgcDvhiWAZOGijMFUEl0F4s83mqtKagMkWTe4XUvomyKSbuQ4N1akGiEwXLoUEg9px
         A7Xdf1ovhdKZWPNGBb+CdTEB8CZhtTOTEI026AaGPBqURYZmwVIiUcaWOZAg2FxXdDqU
         nhiis47scKhN6hEn6U8RUUagQSpoLKxlIoPBILuMN4OSeFq4VgD2/2Wz/smKYwIoWdWM
         IV3u3NQ4bNiJXv1njP+G0QDa/8WQNrgT98LEJ/RqDHRG1bOtoKWrnVjLnTWVnSCl2f5X
         A+6Ud7tW/4mWHWnLOHy+IR/jKswh4R5fC1ZKKwsT+OkCZJzwKl8/Vdvrn0n8kVa7KOT3
         vfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=ins25LCy0g297xla4c9bcObqHdkMT+xeB37D32YWW8I=;
        b=mFajlaO/7NRE8sj/hlXVzjNo8iobUBDAprV5gtfFBq81EBs/9YTtONQYw3yqaocTUq
         PBgL0iNEOqigHTonDUHLCVxifMbpb4ePf/TIYzrhtzSh+Na6hKltA8Z4kSKOYbLvfilq
         X2/3iInXo9XHM8y1lXwANQE+zKwXRmvcVTll41xMQoDWNF1XHJGcepB5k8Hc1SUZB/CQ
         yyH+xQOQqzKdSSTLpnWiAvS4MNut31aUpIsBmAQqoebrX3qT1CI6sA70EIgOUmMWCYx9
         bpPskzvWI+XuuhMHAHh4B0x5VcbWqhYx+TrrbR/6krssXX95B22pNi7BU3TPS6ULDL8b
         fGHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv1-20020a056214240100b0043518a29909si993944qvb.82.2022.03.02.00.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Mar 2022 00:33:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPKQo-0006A1-6g
	for alex.bennee@linaro.org; Wed, 02 Mar 2022 03:33:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPKQb-00068r-Rg; Wed, 02 Mar 2022 03:33:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5396
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPKQa-0004GU-5d; Wed, 02 Mar 2022 03:33:45 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2227sWuQ015405; 
 Wed, 2 Mar 2022 08:33:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej4kwgnpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 08:33:16 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2228Tlse024410;
 Wed, 2 Mar 2022 08:33:15 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej4kwgnpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 08:33:15 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2228ScF5015760;
 Wed, 2 Mar 2022 08:33:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjp2sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 08:33:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2228MG5b35455290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 08:22:16 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55C0011C04A;
 Wed,  2 Mar 2022 08:33:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0440711C04C;
 Wed,  2 Mar 2022 08:33:11 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 08:33:10 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E42302201C1;
 Wed,  2 Mar 2022 09:33:09 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] aspeed: Fix a potential memory leak bug in write_boot_rom()
Date: Wed,  2 Mar 2022 09:33:08 +0100
Message-Id: <20220302083308.820072-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KxdqpoCxck4pB0R8u3v9h1gUpNGNFnz-
X-Proofpoint-ORIG-GUID: vfjEnt29jw4TqKeEmmdnvzXM79LHObnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=843 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1034 adultscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203020034
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Wentao_Liang <Wentao_Liang_g@163.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EOx1hNb2PWNv

From: Wentao_Liang <Wentao_Liang_g@163.com>

A memory chunk is allocated with g_new0() and assigned to the variable
'storage'. However, if the branch takes true, there will be only an
error report but not a free operation for 'storage' before function
returns. As a result, a memory leak bug is triggered.

Use g_autofree to fix the issue.

Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Wentao_Liang <Wentao_Liang_g@163.com>
[ clg: reworked the commit log ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 11558b327bc9..b71bc2559baa 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -246,7 +246,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr a=
ddr, size_t rom_size,
                            Error **errp)
 {
     BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
-    uint8_t *storage;
+    g_autofree void *storage =3D NULL;
     int64_t size;
=20
     /* The block backend size should have already been 'validated' by
@@ -262,14 +262,13 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr=
 addr, size_t rom_size,
         rom_size =3D size;
     }
=20
-    storage =3D g_new0(uint8_t, rom_size);
+    storage =3D g_malloc0(rom_size);
     if (blk_pread(blk, 0, storage, rom_size) < 0) {
         error_setg(errp, "failed to read the initial flash content");
         return;
     }
=20
     rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
-    g_free(storage);
 }
=20
 static void aspeed_board_init_flashes(AspeedSMCState *s,
--=20
2.34.1

