Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2295830lfo;
        Tue, 8 Mar 2022 04:22:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKhNmR/o50RwgBtn/gMwnBTksARbm7sFJel/3Wct2SOptVBKXw8emvNTHltC31fcnf1m1W
X-Received: by 2002:a81:92ce:0:b0:2dc:72a:b624 with SMTP id j197-20020a8192ce000000b002dc072ab624mr12146314ywg.264.1646742177805;
        Tue, 08 Mar 2022 04:22:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646742177; cv=none;
        d=google.com; s=arc-20160816;
        b=uxnfaeRsjJRXeeg6IcBgl4/tTzv2xTyXqdZmE3Kd281+Q1GIX3DTzFCpAf2INHTAhr
         B6XnKUQzBJaNsbFrbUOGvLmbo0ht3mwhGGlmOWKD23jjQ2PeHd9QEObn5AjCfSdo+lF4
         tUAV4fdgzV6PdDWEDiYHdYkr6sN0QulJT4pGwP0yHfu96b0OZVZvk4D+Emu+eB+9yzMs
         YC0c8ukZeYXH103zFxZXpk1QjvsWFSMg3DJ0CUreEv/HnDN6zfAatj0/AM3bFH0ISS65
         xb9qaepe2mVghLxJptZV7YUAYQnP/M/+sZj3Fwn/f6WWmmstANUrLkgn5ADqN1ng28Ld
         gwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=lwujD0ag3BV0GyUkmZ0i/4LMDTffCe6WygcT1mzeuU4=;
        b=g0OPrOSYSeTEiYM9KRvCWLpIUsbfle9PSXZf370Gs/BJ2pbz2TRkwJuI+2HhT3D06y
         7jizlY4j8xMA4YycVZWJSP6kxNoM2OUYrjxD/iP57BEoanhHNxL37NHGLjf8XwqYAoY5
         hvshoa1UimHi6B9Q8eqc68POC5cKfGBkvuZffA8I/rDCiJZS7CkEOSCZ97/UPV/IC6jU
         h/NDgas0KOqUtYkk0c4NveX/2CgaHbMYDps4IcBIFyaoQ11kUKTI+Uqoa9/Rb6235N6a
         iFAqJzCkyM9JIAgqL2wEXq9ac/43/iS4E/dygJOs0dSMGgoDR7dSc6DtpRbH5Z8ud/Ne
         S+Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n80-20020a254053000000b00628735c1556si9668214yba.122.2022.03.08.04.22.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 04:22:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRYrh-0001AR-7a
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 07:22:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYr4-0000Xj-Tx; Tue, 08 Mar 2022 07:22:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYr3-0006Gm-6p; Tue, 08 Mar 2022 07:22:18 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228BBFLb012183; 
 Tue, 8 Mar 2022 12:22:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ep03vggm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:00 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 228CLxbs020801;
 Tue, 8 Mar 2022 12:21:59 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ep03vggks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:21:59 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228C94mb019225;
 Tue, 8 Mar 2022 12:21:57 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3eky4hygr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:21:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 228CLsIF40370462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 12:21:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF4EFAE051;
 Tue,  8 Mar 2022 12:21:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CB7EAE045;
 Tue,  8 Mar 2022 12:21:54 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Mar 2022 12:21:54 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.238])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DEB7522027F;
 Tue,  8 Mar 2022 13:21:53 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 01/11] aspeed: Fix a potential memory leak bug in
 write_boot_rom()
Date: Tue,  8 Mar 2022 13:21:39 +0100
Message-Id: <20220308122149.1602798-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308122149.1602798-1-clg@kaod.org>
References: <20220308122149.1602798-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J1qQsT8RZFyCl_RkWbIaPobrNd5aVRST
X-Proofpoint-ORIG-GUID: MgjUXyBen3CrEx2TlJJm8weYrf8rVJun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 spamscore=0 clxscore=1034 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203080063
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Wentao_Liang <Wentao_Liang_g@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PmSj5Y1b0Ygf

From: Wentao_Liang <Wentao_Liang_g@163.com>

A memory chunk is allocated with g_new0() and assigned to the variable
'storage'. However, if the branch takes true, there will be only an
error report but not a free operation for 'storage' before function
returns. As a result, a memory leak bug is triggered.

Use g_autofree to fix the issue.

Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

