Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2297291lfo;
        Tue, 8 Mar 2022 04:24:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAAeUNAekVaK7LW5xj2xAKxuRK+Uq5MnW3TT3VLXuS1+7zOcjDSUhJk/P6IxteYnp4AGZF
X-Received: by 2002:a25:ce05:0:b0:628:9612:16ca with SMTP id x5-20020a25ce05000000b00628961216camr11747971ybe.191.1646742298279;
        Tue, 08 Mar 2022 04:24:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646742298; cv=none;
        d=google.com; s=arc-20160816;
        b=I0NVobHm71VrB2svttlnTA7bjanfwA5Rmw1GveGVkTqXV/p/7viPcIDnFh62Fx27KE
         g7qJ69/mhzfbcQmFAlk5LNrCF5JReZKJDhO7ZIdLnrjtzz9HwGFzQxhWY5ZHAX//qBOV
         1GTh7slDhLBerze78TJ/N7xyvvmleSSHWcfpqgD+AnTW6ITxZOmtcQl0kFWHlQ5an/9y
         myNI1LvssKLUOhhHN5Bg6P+AGySFlk8zVIlZFUROkqGw+byj/ElM8f3lhPRjzyv54/XS
         Or4Q6QPGYj/Y/ODW1y21OHKyKmFqfezITYQQedKo4Qn1HZ0kxavRCUm8/K98ReEQMPi6
         ypdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=31yqGUrPuMr3+FaZIbF0k5Gsjb5yucObIH5o/eNsf/8=;
        b=ZVk1A1QQ1WnuzwpbGBqF/p8nIWao/+6Zq/FFAGyRFrhNnEls+ycY1zia9rncvc0sJ8
         edv/WFxhuzLqnVCNw1DxNupcUW1t9bI/RG9Xq0spxOm+qPIs/R3n4Tq+6xsRwIT/lVQR
         YqqcDhEelFZVmek6XPeGUBShbCP08aJL3spPbky6ztkzGjpbuqosg0BQcj45A2OQf+QX
         aoI+cXrxDVn3F340AfWSZxjhimmCQrfO+9/u2mjCrqcq7iosfy+5luZ1uUorBX8DLuru
         vXd9L/eJr1J8hUFL1JTCkbPr6ysiTyDXJaeMsHgwSyErE++6orHZHp3Q/2s0IoS/NDy0
         16Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t135-20020a81788d000000b002d0718d922fsi9913131ywc.248.2022.03.08.04.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 04:24:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRYtd-0005Kx-MW
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 07:24:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYqy-0000Dd-TK; Tue, 08 Mar 2022 07:22:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYqx-0006Dr-Et; Tue, 08 Mar 2022 07:22:12 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228A2p17002954; 
 Tue, 8 Mar 2022 12:22:06 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enyw8gp32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:05 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228C9YUJ013340;
 Tue, 8 Mar 2022 12:22:04 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3ekyg8xarv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:04 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 228CM10X34603386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 12:22:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB099A404D;
 Tue,  8 Mar 2022 12:22:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80048A4051;
 Tue,  8 Mar 2022 12:22:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Mar 2022 12:22:01 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.238])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C39F622027F;
 Tue,  8 Mar 2022 13:22:00 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 11/11] hw: aspeed_gpio: Cleanup stray semicolon after switch
Date: Tue,  8 Mar 2022 13:21:49 +0100
Message-Id: <20220308122149.1602798-12-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308122149.1602798-1-clg@kaod.org>
References: <20220308122149.1602798-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lt40z2z-Cdl__DEGkTZ4sgheijOPtXgZ
X-Proofpoint-ORIG-GUID: Lt40z2z-Cdl__DEGkTZ4sgheijOPtXgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1034 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=871 phishscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203080063
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cfyd95d+KwDx

From: Andrew Jeffery <andrew@aj.id.au>

Not sure how that got there.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Message-Id: <20220207150409.358888-2-andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/gpio/aspeed_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 911d21c8cfbe..c63634d3d3e2 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -571,7 +571,7 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr=
 offset, uint32_t size)
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
                       HWADDR_PRIx"\n", __func__, offset);
         return 0;
-    };
+    }
 }
=20
 static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data=
,
--=20
2.34.1

