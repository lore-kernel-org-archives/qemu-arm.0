Received: by 2002:a0c:dd89:0:0:0:0:0 with SMTP id v9csp357286qvk;
        Fri, 20 Nov 2020 08:19:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8CITHIFvXvxZ/z5kcCdNPniZoKv9g+g/UTRYUnxGyS7AXinj8pZhuck+K9PevzAXLCIk4
X-Received: by 2002:a25:d287:: with SMTP id j129mr25729276ybg.289.1605889148312;
        Fri, 20 Nov 2020 08:19:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605889148; cv=none;
        d=google.com; s=arc-20160816;
        b=lv5XEdfIf06wQmk5YTpI1OXsexU9pRwvppx6m1UrSvxBVPYGLptzq9hjoQNnACxNa0
         OLtySjtfk0LkIv2efjl3HK/jCUyUGLy2x1IT4pjk98bftJrxLMcjPMgRn2laJ9GVVsU7
         2EyLiSoEXaOIMnBSk9f+zgfaM2alSr/NplZXJAmXb+5C70PftX0/mhM8FLR+u5++/U9L
         9zZfJwUicLwCrzek8JQ0mQQm5FKE26ytiP34LAb45/976vULfS+rRIAEu7yfvDf0At89
         lHH8//VjEtP/u+SVKWCm7B5dICI16YfFMgk6f6BZdgUJAX1tAkkkYFwWr3AiiUr9eDQn
         nxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=atKCHAYdZeRl2Eqe0hDvQY41s3k4upJUWYZ4I9Hy7Bs=;
        b=pgmaifGYd4U7Odq07JxxDLNjCq/4MYm+Gc88x1L6ewDxJdcNDvPHIfRyD1PMrY8vKD
         4LRlbzav+1hbJJ2FvN6i49YOL4stTQbIDXXURHJfF6E8jgriQnOEOLaTBfexJsNGpqMF
         qqPxJUr29yuf4KrRRVtNexCln5IGPTP05ek3In1FPGXOwfc8DuJXVfUci2mo6gVisK9j
         cSvpM/qrMlQJUDOqDj3fCnS/WCBzYiPn5FPLci17h7To3J6a/Ho3MrjZi0WuOY18+/KO
         ERe969JqPCTmYXENYwMWM5bnc3LLl25wEEnG9KymIuTIvmuB64AcRVZB+aJpKk/McDZT
         1Y7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si3358236ybc.466.2020.11.20.08.19.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 08:19:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg97r-0006O3-Rz
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 11:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kg956-00031B-CE; Fri, 20 Nov 2020 11:16:16 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kg954-0004lR-QM; Fri, 20 Nov 2020 11:16:16 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKG2YW2086058; Fri, 20 Nov 2020 11:15:56 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xd7xgsxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 11:15:56 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKGCZJF005801;
 Fri, 20 Nov 2020 16:15:54 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 34t6v8e4yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 16:15:53 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKGFpDd66126116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 16:15:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A52144C04A;
 Fri, 20 Nov 2020 16:15:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CE714C040;
 Fri, 20 Nov 2020 16:15:51 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 20 Nov 2020 16:15:51 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-178-186.de.ibm.com [9.145.178.186])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8C4C722021B;
 Fri, 20 Nov 2020 17:15:50 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 2/2] aspeed/smc: Add extra controls to request DMA
Date: Fri, 20 Nov 2020 17:15:47 +0100
Message-Id: <20201120161547.740806-3-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120161547.740806-1-clg@kaod.org>
References: <20201120161547.740806-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_08:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=1 clxscore=1034 mlxlogscore=466 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200106
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OfdJxouahX5v

The controller has a set of hidden bits to request/grant DMA access.

Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index e3d5e26058c0..c1557ef5d848 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -127,6 +127,8 @@
=20
 /* DMA Control/Status Register */
 #define R_DMA_CTRL        (0x80 / 4)
+#define   DMA_CTRL_REQUEST      (1 << 31)
+#define   DMA_CTRL_GRANT        (1 << 30)
 #define   DMA_CTRL_DELAY_MASK   0xf
 #define   DMA_CTRL_DELAY_SHIFT  8
 #define   DMA_CTRL_FREQ_MASK    0xf
@@ -1237,6 +1239,11 @@ static void aspeed_smc_dma_done(AspeedSMCState *s)
=20
 static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint64_t dma_ctrl)
 {
+    if (dma_ctrl & DMA_CTRL_REQUEST) {
+            s->regs[R_DMA_CTRL] =3D dma_ctrl | DMA_CTRL_GRANT;
+            return;
+    }
+
     if (!(dma_ctrl & DMA_CTRL_ENABLE)) {
         s->regs[R_DMA_CTRL] =3D dma_ctrl;
=20
--=20
2.26.2

