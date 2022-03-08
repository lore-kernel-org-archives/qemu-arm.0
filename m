Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2299660lfo;
        Tue, 8 Mar 2022 04:29:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnVcFBkBX5OYTXs48JQyGV1bUoMDo6iuMk6g/Ee3N6s4WCRY15rYo/kaleaoozLQC49znk
X-Received: by 2002:a81:5a57:0:b0:2dc:374c:4b92 with SMTP id o84-20020a815a57000000b002dc374c4b92mr12439199ywb.385.1646742540186;
        Tue, 08 Mar 2022 04:29:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646742540; cv=none;
        d=google.com; s=arc-20160816;
        b=ql0k6IUS8yQObfUIOdEZ4R4rafPncfhGx2QlxQnKsSUs8ZQNAy2LkH4kmmZwqfeZBw
         KTy3lOY8kfJu6q+f0gYBL7fbZKJEYnYActRz4zDfMF6kd8NzURFQcEYJ9DeodR1t9VRP
         ml1ayBns0PSgmhbmGaZqoI4iqUGLlyEn6QBlUJ8n4uzFdN9lWQBxmJzPoU/8h89mnrXS
         mQEYyjiIXnfhO2e+PpxmhacPEyHLyS8p+iGH2DLbrODbbACvl6QZa1L0an7m10hYbdp8
         MNFSSWBkB2ZrSq0DLLiiieBrUenv4HWOJpligVEfbWgrxEaqHnS2cNflS7H009JyPYfX
         S9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=bAZs0w98I9neHIXg1HcQ5C9SEcjiMV3eP2lLAW4pMbE=;
        b=p3nxkVm/71/CuCZ2x08gJyKMRzpR8powwcoRD5f1+q1AOigIrAyJ3w5y3JCxD66E+6
         gOUKH77qgmg4uje68rrjNzfJ+XWvPdf0K/CIYVNbF/NhqDMXXxBlRasaiNpeEuv0WZMk
         fYbzMQ8nerYpVZIAY3BMizhU/qtunvW4F2SJOyN8Cae90uiDd8Nc9Qquy7FRxjOslbJD
         gqEkbHvys0wRA3vdtebqTCZTVeArW5XDuEeTAr1zt28vE55zY10/F4Cx1NS3/eJL4c5Q
         ATgseQLF36tSsMDY7p86Zcu+F51vLoU4mkVQR1S3pmYy/jQPX2EpN+S3+h+td933DDJu
         BNvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a190-20020a811ac7000000b002d6dcc00c6asi9832939ywa.19.2022.03.08.04.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 04:29:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRYxU-000259-3P
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 07:28:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYr6-0000by-4G; Tue, 08 Mar 2022 07:22:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51338
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYr4-0006HE-Lc; Tue, 08 Mar 2022 07:22:19 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228CGlLn028797; 
 Tue, 8 Mar 2022 12:22:03 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ep10672qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:03 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228C9MR1024829;
 Tue, 8 Mar 2022 12:22:01 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3ekyg96bd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 228CLx5Q47645128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 12:21:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0126711C04A;
 Tue,  8 Mar 2022 12:21:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3CF711C04C;
 Tue,  8 Mar 2022 12:21:58 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Mar 2022 12:21:58 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.238])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DEE7E22027F;
 Tue,  8 Mar 2022 13:21:57 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 07/11] aspeed/smc: Fix error log
Date: Tue,  8 Mar 2022 13:21:45 +0100
Message-Id: <20220308122149.1602798-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308122149.1602798-1-clg@kaod.org>
References: <20220308122149.1602798-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oMA4kbnQtIwn5EP2FZdAUf449q4_tyXX
X-Proofpoint-GUID: oMA4kbnQtIwn5EP2FZdAUf449q4_tyXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=883 malwarescore=0 impostorscore=0
 clxscore=1034 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203080063
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
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8JdHo1Uw++Wb

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220307071856.1410731-7-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index dc6d4a169df8..48305e1574ec 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -327,7 +327,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSta=
te *s, int cs,
 static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr addr,
                                               unsigned size)
 {
-    aspeed_smc_error("To 0x%" HWADDR_PRIx " of size %u" PRIx64, addr, si=
ze);
+    aspeed_smc_error("To 0x%" HWADDR_PRIx " of size %u", addr, size);
     return 0;
 }
=20
--=20
2.34.1

