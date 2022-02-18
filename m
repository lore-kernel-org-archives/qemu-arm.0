Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp542522lfq;
        Fri, 18 Feb 2022 00:29:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrthX0r9S9JR5XfnLq/npbemQ2wR99TpcA5iBQ5oRUsXa3YN6ErZ+tzx3neLgUMx71FqaK
X-Received: by 2002:a05:6214:1c83:b0:42c:f990:aff2 with SMTP id ib3-20020a0562141c8300b0042cf990aff2mr4777467qvb.45.1645172978938;
        Fri, 18 Feb 2022 00:29:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645172978; cv=none;
        d=google.com; s=arc-20160816;
        b=zTK9oxcuKvgY7avMoEWnL7tA7Ha25F0vnkJSn8DOBkYLoGRBQPue+lekMwYO78gZhQ
         pk6NNDOYeErolixmcQ3KnLrLdAW0cAa2a3PqrLjp0g9VW7BnZX41reheb4+9MrcAK0Ly
         bz5UiFgCDrvY8BUgLRFyJmbpM2q7vGCMRJ9Ks6M7z5zqMwFn5DEhMG3AQzimN9DL3GDA
         EpiKlwW7P/9jPm5Fu/yw6gW+RFipMuZmf0FHWYy8u/zmddZXSt1bhyibS/41wexXU1p7
         kSuyjXK+XRiIJRaA2X+PnLYQ6vDBkKE9RArZdmM6XXpEWYJNsjWZ1DBfaAWi5XLkbA8J
         4Ofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Ir2Ml+n/KEHS3fj1kAi5MOwmM0nmWlWktIVeC8e2WZs=;
        b=KQm3JmkJ2jfeVyz6Hum1OUVYSnwACS6qxqCpU1PdvCYxhHWii9OM4P0Hm3lJnzzSgy
         rMJTtIQqtCORJwhsF1mpSs5pCMyEytXmubC6g8jhVm6Pjnf9c6X4fEPcgO5fmwSQ7hq3
         f4F7eN2QlG6NWw9pTSFEgFYwCZkpQmq+01jMqYOACOwRFy++4c43giuANq7CpPRi2/yo
         vn4Fb6I0sQjN9PzSsXI9HkL5+k6dp37T4ZvmA0zK5TfFbW2w0p/3c3peDgbmCNxblK2P
         Qf69XWwHFqkAA9SKiwu2WsVmj3VhJYtcVhrTabdRX/NoxQMgiGIdZQtl+GR0YpZhCWGU
         MUvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si1876789qtk.445.2022.02.18.00.29.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Feb 2022 00:29:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKye2-0002DS-BT
	for alex.bennee@linaro.org; Fri, 18 Feb 2022 03:29:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTS-00079T-Tc; Fri, 18 Feb 2022 03:18:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTP-0000Zp-VA; Fri, 18 Feb 2022 03:18:41 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I88U7c008873; 
 Fri, 18 Feb 2022 08:18:27 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea5yhhu9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:27 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21I8E06k017919;
 Fri, 18 Feb 2022 08:18:24 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3e645kdydy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:24 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21I8IMe945875544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 08:18:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D8DFA4040;
 Fri, 18 Feb 2022 08:18:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDE4FA404D;
 Fri, 18 Feb 2022 08:18:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 08:18:21 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3E4D922016E;
 Fri, 18 Feb 2022 09:18:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] aspeed/smc: Add an address mask on segment registers
Date: Fri, 18 Feb 2022 09:18:14 +0100
Message-Id: <20220218081815.641169-7-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218081815.641169-1-clg@kaod.org>
References: <20220218081815.641169-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d7APdcL1Rk9zmjZKSUqeHXwEwn0eY5Tp
X-Proofpoint-ORIG-GUID: d7APdcL1Rk9zmjZKSUqeHXwEwn0eY5Tp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_03,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1034 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202180051
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: v9LnlX7A6PMZ

Only a limited set of bits are used for decoding the Start and End
addresses of the mapping window of a flash device.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  1 +
 hw/ssi/aspeed_smc.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index e26555581996..cad73ddc13f2 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -99,6 +99,7 @@ struct AspeedSMCClass {
     uint8_t max_peripherals;
     const uint32_t *resets;
     const AspeedSegments *segments;
+    uint32_t segment_addr_mask;
     hwaddr flash_window_base;
     uint32_t flash_window_size;
     uint32_t features;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index ff154eb84f85..d899be17fd71 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -259,6 +259,10 @@ static void aspeed_smc_flash_set_segment_region(Aspe=
edSMCState *s, int cs,
     memory_region_set_enabled(&fl->mmio, !!seg.size);
     memory_region_transaction_commit();
=20
+    if (asc->segment_addr_mask) {
+        regval &=3D asc->segment_addr_mask;
+    }
+
     s->regs[R_SEG_ADDR0 + cs] =3D regval;
 }
=20
@@ -1364,6 +1368,7 @@ static void aspeed_2400_fmc_class_init(ObjectClass =
*klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 5;
     asc->segments          =3D aspeed_2400_fmc_segments;
+    asc->segment_addr_mask =3D 0xffff0000;
     asc->resets            =3D aspeed_2400_fmc_resets;
     asc->flash_window_base =3D 0x20000000;
     asc->flash_window_size =3D 0x10000000;
@@ -1446,6 +1451,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass =
*klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 3;
     asc->segments          =3D aspeed_2500_fmc_segments;
+    asc->segment_addr_mask =3D 0xffff0000;
     asc->resets            =3D aspeed_2500_fmc_resets;
     asc->flash_window_base =3D 0x20000000;
     asc->flash_window_size =3D 0x10000000;
@@ -1483,6 +1489,7 @@ static void aspeed_2500_spi1_class_init(ObjectClass=
 *klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 2;
     asc->segments          =3D aspeed_2500_spi1_segments;
+    asc->segment_addr_mask =3D 0xffff0000;
     asc->flash_window_base =3D 0x30000000;
     asc->flash_window_size =3D 0x8000000;
     asc->features          =3D 0x0;
@@ -1517,6 +1524,7 @@ static void aspeed_2500_spi2_class_init(ObjectClass=
 *klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 2;
     asc->segments          =3D aspeed_2500_spi2_segments;
+    asc->segment_addr_mask =3D 0xffff0000;
     asc->flash_window_base =3D 0x38000000;
     asc->flash_window_size =3D 0x8000000;
     asc->features          =3D 0x0;
@@ -1598,6 +1606,7 @@ static void aspeed_2600_fmc_class_init(ObjectClass =
*klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 3;
     asc->segments          =3D aspeed_2600_fmc_segments;
+    asc->segment_addr_mask =3D 0x0ff00ff0;
     asc->resets            =3D aspeed_2600_fmc_resets;
     asc->flash_window_base =3D 0x20000000;
     asc->flash_window_size =3D 0x10000000;
@@ -1636,6 +1645,7 @@ static void aspeed_2600_spi1_class_init(ObjectClass=
 *klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 2;
     asc->segments          =3D aspeed_2600_spi1_segments;
+    asc->segment_addr_mask =3D 0x0ff00ff0;
     asc->flash_window_base =3D 0x30000000;
     asc->flash_window_size =3D 0x10000000;
     asc->features          =3D ASPEED_SMC_FEATURE_DMA |
@@ -1674,6 +1684,7 @@ static void aspeed_2600_spi2_class_init(ObjectClass=
 *klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 3;
     asc->segments          =3D aspeed_2600_spi2_segments;
+    asc->segment_addr_mask =3D 0x0ff00ff0;
     asc->flash_window_base =3D 0x50000000;
     asc->flash_window_size =3D 0x10000000;
     asc->features          =3D ASPEED_SMC_FEATURE_DMA |
--=20
2.34.1

