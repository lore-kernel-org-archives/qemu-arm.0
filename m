Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp537662lfq;
        Fri, 18 Feb 2022 00:19:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKKkIbwnDmr//1jI9cHGkdWHp+aj5uiWIQQiwceVEwSurbfSxsMALS704QGO7RDEFCuUJw
X-Received: by 2002:a37:6593:0:b0:47b:a835:728a with SMTP id z141-20020a376593000000b0047ba835728amr3933106qkb.657.1645172382072;
        Fri, 18 Feb 2022 00:19:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645172382; cv=none;
        d=google.com; s=arc-20160816;
        b=IUv4Yj65s8vnLTk3F2uCVdwurf48yLni6K/dE0Urje7fjtqi9BiAnTDRcWNFCeHZbC
         bwAG+1pJjAAKOes2EbZwhEAdT6nC/lAe7GrgOydpk/SMhdI/KXw7/As7IJsF14Su1IZj
         /ZvfDQSkHFtncp0ny0QkYdxGx/EWlumXk6D16jeEMzXl/Fp6I0VTGEof2rIzCl+kF87T
         IDzzLw0vzdVFzBgYfHTPqpHNG1MZ7Pa9wJ4yYasIQmBbSh7q8bJBKqnLgTSaJhpS2Krj
         kPxpzRETKtYFAVnNyOTfH49bvvan29T1Js9cDHFkh6cWjrZ76JFTgiZ5mnuGfQz517fV
         UA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=IRVc8UrucN2KS+qj+oRxu6Qx/29ynOHMayuhDFTns10=;
        b=uh84f48vX/C9aEsrbCi6EM0T2gB53KYrKBpLhoX9YWSoGbtOdw2Pm7/WQwZHZ+rkCV
         ASegG32C7X8u/zOZnNzLYegCg+E2h/ILbXkmTborg66y5OpYW9X3g2DnnjSt1oDA5Rcv
         Tqh+JSeeUeNL74huS/JshQGc+bYVdxXZEHf5Ly8YN2u6CkVjBMRfPm7MZRwmFHG8DS6o
         U1gLVP5/nckkpPh/1w14s0IcMikhihFfPKjZUgVGrHHtG7VtcP1zf8nMhTxHerUnKFsp
         D9uj7PSTVk0EYjdHn3+bnZ3AZiIIRMdBWJ2eRiNipsjT4RJh3z1ftZIcNl3LMWvuBx/H
         OuHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t189si2283421qkh.733.2022.02.18.00.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Feb 2022 00:19:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKyUP-000881-IE
	for alex.bennee@linaro.org; Fri, 18 Feb 2022 03:19:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTP-00076g-6r; Fri, 18 Feb 2022 03:18:39 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5222
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTM-0000Yp-DX; Fri, 18 Feb 2022 03:18:38 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I6GicO027147; 
 Fri, 18 Feb 2022 08:18:25 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea620j89y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:25 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21I8COnE024485;
 Fri, 18 Feb 2022 08:18:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3e64hadxvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21I8IKnH41681394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 08:18:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9A385204E;
 Fri, 18 Feb 2022 08:18:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 8714052057;
 Fri, 18 Feb 2022 08:18:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id CD5CA22016E;
 Fri, 18 Feb 2022 09:18:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] aspeed: rainier: Add strap values taken from hardware
Date: Fri, 18 Feb 2022 09:18:12 +0100
Message-Id: <20220218081815.641169-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218081815.641169-1-clg@kaod.org>
References: <20220218081815.641169-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yjtMjS49iacIcjgjC4CZMBz1irQZod8y
X-Proofpoint-ORIG-GUID: yjtMjS49iacIcjgjC4CZMBz1irQZod8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_03,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=406 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180051
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bS96jOrJswDc

From: Joel Stanley <joel@jms.id.au>

When time permits, we should introduce defines for the HW strapping
registers to cleanly decode the values.

SCU500 =3D 0x00422016
  Disable ARM JTAG trusted world debug: 0x1
  Disable ARM JTAG debug: 0x1
  VGA Memory Size: 0x1 [16MB]
  Cortex M3: 0x1 [Disabled]
  Boot device: 0x1 [eMMC]
  Reserved: 0x1

SCU510 =3D 0x80000848
  Secure Boot Enable: 0x1
  Enable boot SPI or eMMC ABR (second boot): 0x1
  Enable LPC mode: 0x1 [LPC]
  Disable LPC SuperIO 0x2e/0x4e: 0x1

Signed-off-by: Joel Stanley <joel@jms.id.au>
[ clg: rewrote the commit log ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7590b36bb017..f71a5d87473f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -160,8 +160,8 @@ struct AspeedMachineState {
 #define TACOMA_BMC_HW_STRAP2  0x00000040
=20
 /* Rainier hardware value: (QEMU prototype) */
-#define RAINIER_BMC_HW_STRAP1 0x00000000
-#define RAINIER_BMC_HW_STRAP2 0x00000000
+#define RAINIER_BMC_HW_STRAP1 0x00422016
+#define RAINIER_BMC_HW_STRAP2 0x80000848
=20
 /* Fuji hardware value */
 #define FUJI_BMC_HW_STRAP1    0x00000000
--=20
2.34.1

