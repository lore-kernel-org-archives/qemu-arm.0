Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2295604lfo;
        Tue, 8 Mar 2022 04:22:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ/lfcaO6iyimHYFoCEF0tO1V+gKFEpWkVKvP7AeCL5q9JiSyTWCPNhWK6uovdkrHOONKu
X-Received: by 2002:a0d:ed82:0:b0:2dc:3c9e:430b with SMTP id w124-20020a0ded82000000b002dc3c9e430bmr12069284ywe.115.1646742156857;
        Tue, 08 Mar 2022 04:22:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646742156; cv=none;
        d=google.com; s=arc-20160816;
        b=cQiEKo2TfQw2NKDxpWsdC9prcPqJcJKWkC1r7nAoVMkTwaNRsZIyHR3qQ0k9UsItRU
         hEvvyc2nf/4eN2JlwKwDtcxIthJVyPFGsOfNMth8eukwW8vtrsjfXA1ww0j7hYdxCb3r
         OIrsUQ1Tdop45OpryBHBTnPYXTVGhF1INvNs2//xmBZsXTav0sDvmMZ1Sf9GHuRGERW7
         AGbjgL0sDUf19KB2ucznsH3UVDkWP9ADGtYJ/zwjKZjawYMudCuwoLlEM2MreZxklSRD
         VgdAxtBOwEPYJpmYrglrU9oyEpn+kRj9Qu7XjxnCPZ1PbE6wdAbmABLl4aDeX0qHws2U
         CfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=PkSbkl5KdAbuV6z0d7LQqJbo8mkxsjikBfsCkGY1wMo=;
        b=p+Uu9QRBaE0jPgDNNe1qR66vI41rwRrbf4vxT9pMHWb2lNOZHSS1k1W4Zz76BWuFQD
         +5iMfAEPu8kyZrmJyPV8Pi+MgeWfVrLJm5/+hLVdjIKI4/Vt3oYN5aJXfWynZvken6Ux
         Og7yS6IgXBnUR+jYcExjAv09ydKUew31YT629gO34iD0F2uWeqba+0uFiQCvMRVz9leQ
         SaJ+kUgODcjsgPUpcJBJCKeuXlCN8X/+UBq3Obs/q8BuNTw0CY9G9sbGP5ceMKY5Cq17
         NAz3ZWNCyDGFrwx8+GwcJAUkvC5UgXWU4H+jv7F+wtvMOnqBuPuQ2WfYOqPagD3mlO8w
         36Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a0dca13000000b002dcd6a52812si2774814ywd.96.2022.03.08.04.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 04:22:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRYrM-0000El-7D
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 07:22:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYqy-0000DL-NT; Tue, 08 Mar 2022 07:22:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51752
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYqw-0006DL-66; Tue, 08 Mar 2022 07:22:12 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228BjhrK012750; 
 Tue, 8 Mar 2022 12:21:59 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3enweh3cgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:21:59 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228C8I6j004893;
 Tue, 8 Mar 2022 12:21:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3enpk2srsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:21:57 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 228CLtfX52953592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 12:21:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AB7211C050;
 Tue,  8 Mar 2022 12:21:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4916E11C052;
 Tue,  8 Mar 2022 12:21:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Mar 2022 12:21:55 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.238])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8CF162201DC;
 Tue,  8 Mar 2022 13:21:54 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 02/11] aspeed/smc: Use max number of CE instead of 'num_cs'
Date: Tue,  8 Mar 2022 13:21:40 +0100
Message-Id: <20220308122149.1602798-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308122149.1602798-1-clg@kaod.org>
References: <20220308122149.1602798-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: C1IhtlgwQps7CItZgQpJpRN7wSdokB_X
X-Proofpoint-ORIG-GUID: C1IhtlgwQps7CItZgQpJpRN7wSdokB_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=765
 spamscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1034 adultscore=0
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
X-TUID: KESdAsVf3uxB

The Aspeed SMC model uses the 'num_cs' field to allocate resources
fitting the number of devices of the machine. This is a small
optimization without real need in the controller. Simplify modelling
and use the max_peripherals field instead.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220307071856.1410731-2-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index d899be17fd71..a5d8bb717fc7 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -693,7 +693,7 @@ static void aspeed_smc_reset(DeviceState *d)
     }
=20
     /* Unselect all peripherals */
-    for (i =3D 0; i < s->num_cs; ++i) {
+    for (i =3D 0; i < asc->max_peripherals; ++i) {
         s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
         qemu_set_irq(s->cs_lines[i], true);
     }
@@ -1042,7 +1042,7 @@ static void aspeed_smc_write(void *opaque, hwaddr a=
ddr, uint64_t data,
          addr < s->r_timings + asc->nregs_timings) ||
         addr =3D=3D s->r_ce_ctrl) {
         s->regs[addr] =3D value;
-    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
+    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peri=
pherals) {
         int cs =3D addr - s->r_ctrl0;
         aspeed_smc_flash_update_ctrl(&s->flashes[cs], value);
     } else if (addr >=3D R_SEG_ADDR0 &&
@@ -1139,9 +1139,9 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
     s->spi =3D ssi_create_bus(dev, "spi");
=20
     /* Setup cs_lines for peripherals */
-    s->cs_lines =3D g_new0(qemu_irq, s->num_cs);
+    s->cs_lines =3D g_new0(qemu_irq, asc->max_peripherals);
=20
-    for (i =3D 0; i < s->num_cs; ++i) {
+    for (i =3D 0; i < asc->max_peripherals; ++i) {
         sysbus_init_irq(sbd, &s->cs_lines[i]);
     }
=20
--=20
2.34.1

