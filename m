Received: by 2002:a0c:dd89:0:0:0:0:0 with SMTP id v9csp355190qvk;
        Fri, 20 Nov 2020 08:16:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEFtixfY4mhwQTnuTlT84b+JxcUQSWGTb3sd2M7jJ4VKE6pvxiXTUwmPrV1fFfkDvTbfHf
X-Received: by 2002:a25:3812:: with SMTP id f18mr16606225yba.126.1605888995709;
        Fri, 20 Nov 2020 08:16:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605888995; cv=none;
        d=google.com; s=arc-20160816;
        b=r+yHEVdVbMZ6MnnOwHCUj6bTteatwmNK0Uj9qMvO/AsrB7CXNQbRLUQ0wysltTR60V
         Yi1/BxDunqA83dVERF8SyCVU1NVoKiokkebzdmJhN3/qo8Qd4Updg5kyDkoqs6/ZAn4u
         a5kB0rJnetavabNl/PiHUVpabLq1P/paJY7RtMyF77eij/87z2nk8lDcMAMUccklmQIT
         Vac19fOGXRBoI2CX6HcKeYR63zrQWziysrmDj/FIhxln2QoDYx5053vBCWWPKgLay5Qq
         n6NfmVKrplIr8+1l20reTIyJ6ImuLVm0EuqTj8IamA6JMg3UL0i1G4mn6gH97MG0/pbg
         ekzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=u3S89E21q+oiyePCy+q0GJOFYkJ2MdpWiZAgSJbPMVw=;
        b=ZVHU304+Yt3wvttKrCyC8x5ZrvjYpBmrbzl/Ro4GhtbH6332HzRsJr+6PjF9S2V/3q
         N9wt4TY2/RMGQYG3Mf/s3g9nXXSTPW9++fUlSj3t/2iBeYUbL9gCYNsme44ORdOtYEZL
         ia6cDbA9N1IsNEBNXpAjWXgwvMXU7/fAkN2kFckotAf++42t5dreL7mIZaicBHvuP4Uw
         /16gtVmZkXmn2LLTuMU9z3SWd2sndSKVOlDtP19PCZQJPTcL1E6m1sS7nmumkaxqC1jd
         654Ak7HQLBOgbHL6/i+2EVYcHCRqLvWh0eLvCpa7p6GznC7wRQWD6rfO2CVmnBEDFCD1
         tTkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h126si2888696ybb.169.2020.11.20.08.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 08:16:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg95P-00031W-7N
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 11:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kg954-0002z7-Dv; Fri, 20 Nov 2020 11:16:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kg951-0004jc-V2; Fri, 20 Nov 2020 11:16:14 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKG2FJe158369; Fri, 20 Nov 2020 11:15:55 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xdrvyvtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 11:15:55 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKGCJuC018652;
 Fri, 20 Nov 2020 16:15:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 34t6v83b9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 16:15:52 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKGFox610027704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 16:15:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DB12A4051;
 Fri, 20 Nov 2020 16:15:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BFF0A404D;
 Fri, 20 Nov 2020 16:15:50 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 20 Nov 2020 16:15:50 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-178-186.de.ibm.com [9.145.178.186])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2CAF2220144;
 Fri, 20 Nov 2020 17:15:49 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 0/2] aspeed/smc: Extend support
Date: Fri, 20 Nov 2020 17:15:45 +0100
Message-Id: <20201120161547.740806-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_08:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 mlxscore=1 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=1 impostorscore=0
 phishscore=0 mlxlogscore=225 clxscore=1034 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200106
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YAtdWQ75m/St

Hello,

These extensions are required to support the new SPI driver proposed
by Chin-Ting Kuo from Aspeed :

https://lore.kernel.org/linux-spi/20201105120331.9853-1-chin-ting_kuo@asp=
eedtech.com/T/#mf495e230e7dde8f91cf3a485b0a7293e9db54d32

Thanks,

C.

C=C3=A9dric Le Goater (2):
  aspeed/smc: Add support for address lane disablement
  aspeed/smc: Add extra controls to request DMA

 hw/ssi/aspeed_smc.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

--=20
2.26.2

