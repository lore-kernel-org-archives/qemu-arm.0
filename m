Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp667273lfr;
        Wed, 7 Apr 2021 10:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdXA0bxTfEP+1rHnIKoUwmtdXOVLrsL7iv4vBtk2ln/B5s3LbSncTMkqN9sclqEUVVoxFa
X-Received: by 2002:a05:6e02:921:: with SMTP id o1mr3674884ilt.107.1617817015048;
        Wed, 07 Apr 2021 10:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617817015; cv=none;
        d=google.com; s=arc-20160816;
        b=zwrXvd2UyeWfn9kEW0NS0mfl1SKuKcs869hrEtIsDJ2gCj9a7BBsh+Vdplwu4DTg9f
         BdXnBaOKJDsCGmDaXwESYBOzJyAJi7A+mRsZzM0jAhotk64rGTBrkrKI/jJ1bxDhny3K
         v7EgNRBLoEyS+xhGljDi75aXZCcpm0qo5BrXYimv5UIsXhw33Wz+bZ7vT5JZX3ZA+n52
         WSrB11wlHtQntkwxwIOalMEMEvg08PuYUalFRvcDwDlNagl4FntJ0JbCDM840LnD9uxy
         SAfN9LNQGbRFKmo4VnuvygzBL/lZWemv0Ek7hp3EfqQoyYbUB5AUyJRZvDT5XdekohZv
         9UEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=jNQF2vCisyyUpT4w8oMIn4bkX9CFgmPcR77RBH7Tmx4=;
        b=srHPPeOAnwL5MUfTAQBarYmLEKoxBGCDhVVLGciFG+C4lv5mGYB9ZROl9CjbB7f5aK
         iM2B5hdSqLoo+NvoLzVRi/EAOjmI2cisSy4F0r/qJ7Vqy/cmQENJ6GJh9ud0av/hL2U0
         fkuGwTdVHOvw1iNutasStaLr2/9KZvuHxYeREnhJTfB1RqTdpWmzOKuwQ0Qx1vLR5tjM
         F80iYReZkwsucBrIDM6P1E64Ws4WLAANo2wRcPCIchjcO55bzG8aZAeEx13ugTxkN/Py
         ACe7JcoTCvvnvBahMQ56a/v6xQjtZO2YTvHO9UJlbqpq6mdJ/ixsikx6TZyn+GsXHCz2
         3/Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15si20949138ion.84.2021.04.07.10.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 10:36:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUC6o-0007N7-Ao
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 13:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnl-0007f1-Iy; Wed, 07 Apr 2021 13:17:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnh-0006oU-Ja; Wed, 07 Apr 2021 13:17:13 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H2mGb119170; Wed, 7 Apr 2021 13:16:59 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37s5xsmr7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:59 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HDduL031076;
 Wed, 7 Apr 2021 17:16:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 37rvbu8wby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:57 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGt8i34472430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:55 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81E67A4040;
 Wed,  7 Apr 2021 17:16:55 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DF11A4053;
 Wed,  7 Apr 2021 17:16:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:55 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 81312220190;
 Wed,  7 Apr 2021 19:16:54 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 21/24] hw/block: m25p80: Add support for mt25qu02g
Date: Wed,  7 Apr 2021 19:16:34 +0200
Message-Id: <20210407171637.777743-22-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ijcW1bumLS8_2W-tb9G0UCSroWWc4G85
X-Proofpoint-ORIG-GUID: ijcW1bumLS8_2W-tb9G0UCSroWWc4G85
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=757
 bulkscore=0 clxscore=1034 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070116
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fEpMmN9KW2Wo

The Micron mt25qu02g is a 3V 2Gb serial NOR flash memory supporting
dual I/O and quad I/O, 4KB, 32KB, 64KB sector erase. It also supports
4B opcodes.

Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 183d3f44c259..2afb939ae28e 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -259,6 +259,7 @@ static const FlashPartInfo known_devices[] =3D {
     { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K,=
 4) },
     { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K,=
 2) },
     { INFO_STACKED("mt25qu01g", 0x20bb21, 0x1040, 64 << 10, 2048, ER_4K,=
 2) },
+    { INFO_STACKED("mt25qu02g", 0x20ba22, 0x1040, 64 << 10, 4096, ER_4K,=
 2) },
=20
     /* Spansion -- single (large) sector size only, at least
      * for the chips listed here (without boot sectors).
--=20
2.26.3

