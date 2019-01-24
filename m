Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1968764wrt;
        Thu, 24 Jan 2019 06:09:00 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6dirQPNoN8B+XR75T/ykWJc1fbpLT603IT3A7TIVZ3C8v1JegnGVXp2A30rGxmOcp5Zwee
X-Received: by 2002:a7b:c181:: with SMTP id y1mr2911174wmi.10.1548338940910;
        Thu, 24 Jan 2019 06:09:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548338940; cv=none;
        d=google.com; s=arc-20160816;
        b=WMTSUP288U375VNaWAbn0JIxzP10xoO3RioAKwDTMY84QaoxW+XdO1aDgLrALG/6Ad
         wgLTkh/OawZc2scBJkMVZMWPihU2H0N3yonYAzYQUOneXNt9Nf/6ZmhG6Uh77S1WnmaD
         sDBp/kHYRwYKUqpvC3DBQwma74oEZO3HkgPE78dSEOPn3zeGV0gg9oSwF5f7zR0olFdg
         Yt1plbL/sRi5MVS8sFFWosuXi3w6HStqt4J31z5Da3JVVoifI2CqBRXLEcPgEVuPI2tc
         jCD5pMJ+zkKut32Fr1eY4gl5NnuTxkScJA61IsrRZWBV5Pc0v9XSGiRMDtQJMYyo01/X
         IgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:message-id:mime-version:date:to:from;
        bh=hwB4P8WhoXOI4Wu7jgg+vNdbaK450OEP8edAOLntiro=;
        b=DkP0Xx5IQDscyQY0H5lGZrluLKCC6b4T7fPsv1ImxjIwvQ5v81GZ65I3fjEL/IY3Zq
         VBNFwNThjhnlDza0MysVr3me1+yxTQwi6zSTkCdHAyEwTxPNki2094H6Dn3twKYpUC0c
         M48mBOqPT7gtJEkBrVDCs5ycOlpAhEY4KnDzyxnmsUuUtXejBu8elfZJMScJhaq+k50u
         P2B6x+l1eFfGKgHL/kf3svWiZfXywX7tx9ZnEbZ28MsgsZXY1l8kOsobceIowGHtPC2q
         PV8QMDUv1KycHlZb+Z/BnAXLNt2QRG4X/TRONaU7XQ3oJbVR1FDWn9Js66bSgmNkHVLh
         TzAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si73742995wrv.204.2019.01.24.06.09.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 06:09:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:54527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfgh-0000Rc-Td
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 09:08:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmfeV-00078h-Ld
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 09:06:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmfeM-000154-66
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 09:06:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1gmfeK-0000yz-4x
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 09:06:34 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x0OE65hB136521
	for <qemu-arm@nongnu.org>; Thu, 24 Jan 2019 09:06:24 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2q7c9v0gga-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Thu, 24 Jan 2019 09:06:12 -0500
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <clg@kaod.org>;
	Thu, 24 Jan 2019 14:05:31 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 24 Jan 2019 14:05:27 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
	[9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x0OE5QRm66191516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 24 Jan 2019 14:05:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CEE111C05E;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77D8811C04C;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from smtp.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.1])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from zorba.lab.toulouse-stg.fr.ibm.com
	(zorba.lab.toulouse-stg.fr.ibm.com [9.101.4.32])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 3CD56220164;
	Thu, 24 Jan 2019 15:05:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Thu, 24 Jan 2019 15:05:15 +0100
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19012414-0012-0000-0000-000002EC6566
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012414-0013-0000-0000-000021239966
Message-Id: <20190124140519.13838-1-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-01-24_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=410 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1901240102
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id x0OE65hB136521
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-arm] [PATCH 0/4] aspeed/smc: add fast read support under User
 command mode.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B1oGjkajXigm

Hello,

When in the User command mode, the Aspeed SMC controller driver
performs the dummy cycles of a fast read command using byte transfers,
that is ony byte for eight cycles. But, the QEMU m25p80 models one
dummy cycle with one byte transfer.

To restore the correct number of cycles, this series adds a function
snooping the SPI transfers to catch commands requiring dummy cycles
and replaces them with byte transfers compatible with the m25p80 model.

Thanks,

C.

C=C3=A9dric Le Goater (4):
  aspeed/smc: fix default read value
  aspeed/smc: define registers for all possible CS
  aspeed/smc: Add dummy data register
  aspeed/smc: snoop transfers to fake dummy cycles

 include/hw/ssi/aspeed_smc.h |   3 +
 hw/ssi/aspeed_smc.c         | 128 +++++++++++++++++++++++++++++++++---
 2 files changed, 123 insertions(+), 8 deletions(-)

--=20
2.20.1

