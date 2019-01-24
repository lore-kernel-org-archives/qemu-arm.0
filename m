Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1969761wrt;
        Thu, 24 Jan 2019 06:09:50 -0800 (PST)
X-Google-Smtp-Source: ALg8bN48YcQVJaCT9ntUVuwON+XtQV4Kn1CqIQLdHtOBYgaDbiOqd96SPsk/9wbAECA+9fwEvVtm
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr2975534wmd.36.1548338990606;
        Thu, 24 Jan 2019 06:09:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548338990; cv=none;
        d=google.com; s=arc-20160816;
        b=GqtqUagjjTUWmJvhC+8c+obLmwVrtI83PBv8CncgxfU16ski1LaDRjMFt8WfB/gaQ0
         SLPs00BQ9FTq7O4kkYS60m9v/wlYFHaM5qHDQ3EoZB4XU7MnmuZElZKTA7HCIeZddytz
         XBceg0E6bWYOSHLi+0vRVFq0OKxQaNqrJlcnzEsXe7T2lGrzk+d3NsiSBlhHyLAaHcOS
         RdetbacA3cG7MU/5NLAP2nMlN0j/6Ok0P/GBhEMtvbY2mNWZVFP5lYZQfycrLpc4Rp79
         xkgHd1zxO+ogPB65xWtBXVvAXRg5JlVeV2acDWupTwrjSkcTahG1oSVhiKcmZmrNBCiB
         k2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:message-id:mime-version:references
         :in-reply-to:date:to:from;
        bh=xJSGWTGbBG6tQi4Y90gnTAQSBZ9SpqQ/1UNpMlU2vEs=;
        b=Ju6cO2ucSdq0bBkt4H4rCymfaPXrznX8zWRegsDIbmVR3gD0OhP/XaRbR6d3W2dw9Z
         30JnQHeDYGAQpiX7dv6QgPCNvfohBJtcg+GSmS7YPEOtc7bStMFt8KOisxBXBBdcCWWm
         3c5MtXycCh9WYNHQq3UtCBMpuFLLgGsJS5k2eM2bGg4Ahf+4Xnp2HklUO1MJac3Ny4Ll
         SdvmWqOI1A4A24z/VdAw9/vpuAEOAMup/faOBibTu31/18QO7EAleDzV9ZrJtUnmJbpp
         3CidSvBTZuX0m4o8Ebut8Vzg69QXrpQrQP44VzMbmuYy+QGC/erG6LiRsgffPkLiDBbP
         hZmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f188si38923007wmg.24.2019.01.24.06.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 06:09:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:54537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfhV-0001KJ-Ji
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 09:09:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmfdZ-0006No-Nk
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 09:05:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmfdY-0000Uq-NP
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 09:05:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57260
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1gmfdY-0000Na-Hd
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 09:05:44 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x0OE4uqa101911
	for <qemu-arm@nongnu.org>; Thu, 24 Jan 2019 09:05:34 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2q7e55teka-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Thu, 24 Jan 2019 09:05:33 -0500
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <clg@kaod.org>;
	Thu, 24 Jan 2019 14:05:31 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 24 Jan 2019 14:05:27 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x0OE5Q6T66191518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 24 Jan 2019 14:05:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B01AAA4053;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A396A4040;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from smtp.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.1])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from zorba.lab.toulouse-stg.fr.ibm.com
	(zorba.lab.toulouse-stg.fr.ibm.com [9.101.4.32])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 6002C2201B3;
	Thu, 24 Jan 2019 15:05:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Thu, 24 Jan 2019 15:05:17 +0100
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124140519.13838-1-clg@kaod.org>
References: <20190124140519.13838-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19012414-0008-0000-0000-000002B56D28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012414-0009-0000-0000-00002221A1C2
Message-Id: <20190124140519.13838-3-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-01-24_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=767 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1901240102
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id x0OE4uqa101911
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-arm] [PATCH 2/4] aspeed/smc: define registers for all
 possible CS
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
X-TUID: dmxBdhtAqZ4c

The model should expose one control register per possible CS. When
testing the validity of the register number in the read operation,
replace 's->num_cs' by 'ctrl->max_slaves' which represents the maximum
number of flash devices a controller can handle.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 7af808c33c50..6045ca11b969 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -665,7 +665,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
         addr =3D=3D s->r_ce_ctrl ||
         addr =3D=3D R_INTR_CTRL ||
         (addr >=3D R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slav=
es) ||
-        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs)) {
+        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_slaves=
)) {
         return s->regs[addr];
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
--=20
2.20.1

