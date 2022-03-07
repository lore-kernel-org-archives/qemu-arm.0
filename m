Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1294940lfo;
        Sun, 6 Mar 2022 23:46:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAukc6xXiCcsl1IwXAu4QNzvB1hhADySlt6r8ZXhILEbpeXAxHx1fTEfp3AwFhwQCI21bg
X-Received: by 2002:a05:620a:45:b0:508:176a:8892 with SMTP id t5-20020a05620a004500b00508176a8892mr6158382qkt.731.1646639165798;
        Sun, 06 Mar 2022 23:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646639165; cv=none;
        d=google.com; s=arc-20160816;
        b=LS8DL27Qi7cNGt2LVfcYK2YwArqLUW9IphT6g1f7VePxy6IdBjIExEmVovN9u+nW6t
         H/umjwbUUtgqWRRte9Yd8V7kG+Q+NK7oj0aDoN99ox3tlq6yo8SFRLnPrh4I4hIh3jgg
         /pmlHfR9sJeGd6KTRGoLtcaJnB1V6syfDbmnzQikyTwhj8t9z5KiDLFctKGLbHU7xY6R
         2h4xlmf8qbDHnTaYL4jBMrmtVi096+rbolXGK5TuHyOkION5YuBhBYH26vK2wTAqDRyZ
         q3MZF+XbybZF8eza9Jwmj7J/Enl/iC+858itnsSbSCG663YRIxx4JfaLXCUP32nUKroX
         /Szw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=N2Qxp0OqxBGMcT9yFFbbTl8i+vHkecsVVGXuyatfyz0=;
        b=ceZ5ZYav7Tihwae5Tv4mPzQWQs2CnVF/28nY9jPMIQewtpS5bjWJy9wnYcEJft1g7O
         fCVAv33k0w235cyGzsBP1cFCdXhs8QWt+71h626kjOspiheIdnFbO4yfFbkA+EIXj0CQ
         lZMSXLg/2Cvh00TxolH2VTfV17rYg50IkbPnHPVrNNaHZDv9qJOmU95dWsMjtRlDgAJ5
         s03XJWxLvV/MxdOeKdPS/ikp7/zuf/S4pCF+GGay85Ru02RNMVvaJLdO1ZsChoA9i6PW
         QdiY2G6ij+VrKDpAbJ8slEGzHdhxCjlmPZ9Vb5G4W7hq1Ugn7pGh5W5xLAO7TogiLNCe
         fmlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05622a138f00b002e063e2b15dsi1479123qtk.739.2022.03.06.23.46.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Mar 2022 23:46:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nR84D-0001wa-A9
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 02:46:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nR7eR-0003L0-NW; Mon, 07 Mar 2022 02:19:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nR7eP-00039G-Ew; Mon, 07 Mar 2022 02:19:27 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2277AJu8031586; 
 Mon, 7 Mar 2022 07:19:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3emsauy2d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 07:19:03 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2277GtWY012555;
 Mon, 7 Mar 2022 07:19:01 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3eky4huxsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 07:19:01 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2277IxrI46924266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Mar 2022 07:18:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C8325204E;
 Mon,  7 Mar 2022 07:18:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id C590F5204F;
 Mon,  7 Mar 2022 07:18:58 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.76.59])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 013F82201D3;
 Mon,  7 Mar 2022 08:18:57 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/6] aspeed/smc: 'num_cs' cleanup 
Date: Mon,  7 Mar 2022 08:18:50 +0100
Message-Id: <20220307071856.1410731-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3xSsqms644Uv3olVuU-WNNQMENM0TEb4
X-Proofpoint-ORIG-GUID: 3xSsqms644Uv3olVuU-WNNQMENM0TEb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_01,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=440 clxscore=1034 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070041
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
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +0lE3JRhxFwM

Hi,

This series removes a redudant 'num_cs' field in the Aspeed SMC model
and does a few cleanups on the way.

Thanks,

C.

C=C3=A9dric Le Goater (6):
  aspeed/smc: Use max number of CE instead of 'num_cs'
  aspeed: Rework aspeed_board_init_flashes() interface
  aspeed/smc: Remove 'num_cs' field
  aspeed/smc: Rename 'max_peripherals' to 'max_cs'
  aspeed/smc: Let the SSI core layer define the bus name
  aspeed/smc: Fix error log

 include/hw/ssi/aspeed_smc.h |  3 +--
 hw/arm/aspeed.c             | 13 ++++-----
 hw/arm/aspeed_ast2600.c     |  2 --
 hw/arm/aspeed_soc.c         |  2 --
 hw/ssi/aspeed_smc.c         | 53 ++++++++++++++++---------------------
 5 files changed, 29 insertions(+), 44 deletions(-)

--=20
2.34.1

