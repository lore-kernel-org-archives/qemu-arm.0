Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp660710lfr;
        Wed, 7 Apr 2021 10:28:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCDUem17hp5g13HHv8KidwsFDeHImdoQRAfHsSKDIQzENRJnCZ9Vp+CKuh8nh9MOKi7o4f
X-Received: by 2002:a92:1910:: with SMTP id 16mr3588830ilz.201.1617816529425;
        Wed, 07 Apr 2021 10:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617816529; cv=none;
        d=google.com; s=arc-20160816;
        b=qCf6+K8F+SWsf7YrXUKeMinuqaYi8yeVt97M/FQoJzm1qnkvmU3ANghiqwQiJe2RzS
         EpbibcceBIZ2E/Xd2jyOFeAWwjwb67eQ7pEz5sval/SgYblWkGiSKCa1t13wqDZcwpTU
         8CxMfqfrMPlpBKSGOx4LZ/rtGjDVHykpalHu3ZTmu/GM1DcEtqKu8Hp3JvP/X6QVnLV9
         UbqgJGmuaCHVZCNJduVdic5EOT6yc/FFhG70GRjMC0dpygWuLNVFgXZsiULX2+fusRas
         yD9AvkAK8Syoa735aM3SbQORkEcWRPVX9Z0eKvSqN3BxtCCedQZKbsmhpnW72Cxp9LEO
         1SQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=/qjuOuyN8Pz3dGwEGEHhnW3NlsyTdB/+b/HQXOvfrZM=;
        b=m+9jYPu6YyWYfBoKCOMEldqmib6EImCM/4BVFBue40LQqxH31O2to9+54jIa6I129C
         e3Cehg8CCBSjwLEWYRBWQF9FJYrMFITZxWNvmfWiha9500wTl7C8dxwEL8Tr93izCoUw
         2wmd6sRBZK4Z1eOPaHnd4qpeSbdhDNDmiD7xSA5egPbBY7NyxxjVeIdxO71TBK3EFsKB
         HCYjH3cjuhe72pgpQ1nv3xivbq5XjJG3eHHL5ux9Gk1f+G0AfewpBiJz3XB2fawCKMy1
         gyhEuVWN62EOMIJNZbIVcaBDtyPOVi15kMWTRhqFh7FkRPIXHQ9DdjYH0IN7/YMP5GA0
         cN2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si1632561jan.106.2021.04.07.10.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 10:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUByy-0005TL-P2
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 13:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnl-0007fw-T4; Wed, 07 Apr 2021 13:17:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnh-0006kj-Q9; Wed, 07 Apr 2021 13:17:13 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H3ioQ102181; Wed, 7 Apr 2021 13:16:49 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvn0r4tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:48 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HEXZm002980;
 Wed, 7 Apr 2021 17:16:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37rvbw8w5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGhWP33489248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8A8B11C050;
 Wed,  7 Apr 2021 17:16:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56EBA11C04C;
 Wed,  7 Apr 2021 17:16:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5F328220190;
 Wed,  7 Apr 2021 19:16:42 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 03/24] aspeed/i2c: Fix DMA address mask
Date: Wed,  7 Apr 2021 19:16:16 +0200
Message-Id: <20210407171637.777743-4-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BJiI0AYrpp1pBzXTKZNIdUEuS4Nzhxwh
X-Proofpoint-ORIG-GUID: BJiI0AYrpp1pBzXTKZNIdUEuS4Nzhxwh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 phishscore=0
 mlxlogscore=798 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070116
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l3eUU78rdn3J

The RAM memory region is now used for DMAs accesses instead of the
memory address space region. Mask off the top bits of the DMA address
to reflect this change.

Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 518a3f5c6f9d..e7133528899f 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -601,7 +601,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr=
 offset,
             break;
         }
=20
-        bus->dma_addr =3D value & 0xfffffffc;
+        bus->dma_addr =3D value & 0x3ffffffc;
         break;
=20
     case I2CD_DMA_LEN:
--=20
2.26.3

