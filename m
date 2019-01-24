Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1966157wrt;
        Thu, 24 Jan 2019 06:06:44 -0800 (PST)
X-Google-Smtp-Source: ALg8bN47KiDZ3Ovau9oe8i+ZPDSp77XumUgGNpk1/TnulTCe4khsDPInd/fh4Ut8FHi6T9tcAMh8
X-Received: by 2002:a1c:f613:: with SMTP id w19mr2824114wmc.0.1548338804850;
        Thu, 24 Jan 2019 06:06:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548338804; cv=none;
        d=google.com; s=arc-20160816;
        b=vFgjtNn7v5awDbHOoxxqBzwnbJztc0GbpAvN8jWNxESYEuhIALZP+upvEGPCNhxYtQ
         663oxUe/Mbytpsk9DND3kWTKm/3jUD3gQUSr2dlLYHxfnKq7i18fB+G4yUzHUBRDqTk1
         PVdtwC15y8KBvYF/FpoKUVGACQkdA6mJ4/Fg6z6v7PkbW3o9k4kLlBxvwVSHX1B0FzKP
         h6SkY3jMBOqnD+xXG2pg5oq45dUK/p+P2iKtpBt2P9reiem+yg+0vDUwrPE1uP2Exc0F
         hmfQQtLTisskuDHbmBELW+zrAH2G4yWPdP3sVLRtGgnzaXU7ZEMu8I5/a/22UoTb3NbO
         AVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:message-id:mime-version:references
         :in-reply-to:date:to:from;
        bh=zUCB2/os/xpGmAD5g88thBmMOlS/xd1aR5g6Ab8DZ4g=;
        b=CzlxLeLnwi4ZnjvW8rcNKndOsPD1AwUiYmh0hsjPqwXE3HNNsYvwyjQnUDu5Ar2ySm
         O08hqBu5dIKrQ4JPe6ExoKw9baVjh9s1giw1YZg1P/CmH0csV3C2vYwwC4qtCHmkNN+r
         aFwh6lsyHyZ4aGv74YIFG92X3uIwZcQLFC5Ms1qGl6Elm4OqZ/SuYbH1Ys9lr2g3GcY4
         J4oZyI/Fo8wWCsV6GlIB5seNduybPejA5q8fSEpsJw0BH7tWipwJs6quwfC1uEtFx2q8
         kRA/ZV3U8mmnf10+fuDbB5Axxy0pbPR/tzZzPJJOLtFoL2BZhQOTQnImr0Al9u6+R8xU
         mCEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q62si39846911wme.159.2019.01.24.06.06.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 06:06:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:54505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfeV-0006yH-Q0
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 09:06:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmfdZ-0006NX-97
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 09:05:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmfdY-0000UU-Eq
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 09:05:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33680
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1gmfdY-0000My-7a
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 09:05:44 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x0OE51wa102726
	for <qemu-arm@nongnu.org>; Thu, 24 Jan 2019 09:05:32 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2q7dx53591-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Thu, 24 Jan 2019 09:05:32 -0500
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <clg@kaod.org>;
	Thu, 24 Jan 2019 14:05:30 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 24 Jan 2019 14:05:27 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x0OE5Qi64522354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 24 Jan 2019 14:05:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 943FF4204C;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88C3942049;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from smtp.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.1])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from zorba.lab.toulouse-stg.fr.ibm.com
	(zorba.lab.toulouse-stg.fr.ibm.com [9.101.4.32])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 5038E2201AF;
	Thu, 24 Jan 2019 15:05:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Thu, 24 Jan 2019 15:05:16 +0100
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124140519.13838-1-clg@kaod.org>
References: <20190124140519.13838-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19012414-0028-0000-0000-0000033D8CB7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012414-0029-0000-0000-000023FACEBF
Message-Id: <20190124140519.13838-2-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-01-24_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=641 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1901240102
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id x0OE51wa102726
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-arm] [PATCH 1/4] aspeed/smc: fix default read value
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
X-TUID: WFSxoQ1i6uUS

0xFFFFFFFF should be returned for non implemented registers.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 1270842dcf0c..7af808c33c50 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -670,7 +670,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
                       __func__, addr);
-        return 0;
+        return -1;
     }
 }
=20
--=20
2.20.1

