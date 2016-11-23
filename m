Received: by 10.25.150.194 with SMTP id y185csp2309985lfd;
        Tue, 22 Nov 2016 16:46:48 -0800 (PST)
X-Received: by 10.200.58.65 with SMTP id w59mr386695qte.54.1479862008390;
        Tue, 22 Nov 2016 16:46:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20si10542264qts.263.2016.11.22.16.46.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Nov 2016 16:46:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9Li3-0004iK-U0
	for alex.bennee@linaro.org; Tue, 22 Nov 2016 19:46:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1c9Li0-0004iC-EN
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 19:46:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1c9Lhw-00038Y-Es
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 19:46:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47550)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1c9Lhw-00037P-5I
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 19:46:40 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uAN0jXT6045030
	for <qemu-arm@nongnu.org>; Tue, 22 Nov 2016 19:46:38 -0500
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
	by mx0a-001b2d01.pphosted.com with ESMTP id 26vvrqj7h7-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Tue, 22 Nov 2016 19:46:38 -0500
Received: from localhost
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Wed, 23 Nov 2016 10:46:36 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 23 Nov 2016 10:46:34 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id F38153578057;
	Wed, 23 Nov 2016 11:46:33 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uAN0kXcT31260706; Wed, 23 Nov 2016 11:46:33 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uAN0kXZK032314; Wed, 23 Nov 2016 11:46:33 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uAN0kXHm032305; Wed, 23 Nov 2016 11:46:33 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D848FA023E;
	Wed, 23 Nov 2016 11:46:32 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-arm@nongnu.org
Date: Wed, 23 Nov 2016 11:46:32 +1100
In-Reply-To: <948f93ef-50d3-a450-c69f-faefd078f00d@kaod.org>
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-5-git-send-email-alastair@au1.ibm.com>
	<948f93ef-50d3-a450-c69f-faefd078f00d@kaod.org>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112300-0008-0000-0000-000000E690A8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112300-0009-0000-0000-0000088E18AA
Message-Id: <1479861992.11116.112.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-22_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611230012
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id uAN0jXT6045030
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-arm] [PATCH 4/4] arm: Add an RX8900 RTC to the ASpeed
 board
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ckv/zMEzOqri

On Tue, 2016-11-22 at 17:56 +0100, C=C3=A9dric Le Goater wrote:
> On 11/17/2016 05:36 AM, Alastair D'Silva wrote:
> >=20
> > From: Alastair D'Silva <alastair@d-silva.org>
> >=20
> > Connect an RX8900 RTC to i2c12 of the AST2500 SOC at address 0x32
>=20
> If this is a board device, we should include it under a machine
> routine.
>=20
> Is that for the palmetto ? The ast2500 does not have a RTC.
>=20
> Thanks,
>=20
> C.=C2=A0

Ok


--=20
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

