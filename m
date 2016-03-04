Received: by 10.25.208.211 with SMTP id h202csp488397lfg;
        Sat, 5 Mar 2016 02:09:06 -0800 (PST)
X-Received: by 10.140.102.104 with SMTP id v95mr15790555qge.48.1457172546147;
        Sat, 05 Mar 2016 02:09:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w63si7400141qgw.87.2016.03.05.02.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 05 Mar 2016 02:09:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=ge.com
Received: from localhost ([::1]:45579 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ac98z-0006xi-JB
	for alex.bennee@linaro.org; Sat, 05 Mar 2016 05:09:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <juan.carlos.sanchez@ge.com>) id 1abwiV-0001DH-OO
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 15:52:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <juan.carlos.sanchez@ge.com>) id 1abwiU-0001jc-Ty
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 15:52:55 -0500
Received: from mx0a-00176a03.pphosted.com ([67.231.149.52]:40775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <juan.carlos.sanchez@ge.com>)
	id 1abwiQ-0001im-O1; Fri, 04 Mar 2016 15:52:50 -0500
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
	by m0048274.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	u24Kqhf4033127; Fri, 4 Mar 2016 15:52:46 -0500
Received: from cinmlip10.e2k.ad.ge.com (n165-156-000-000.static.ge.com
	[165.156.4.1] (may be forged))
	by m0048274.ppops.net-00176a03. with ESMTP id 21ffcdr3un-12
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT);
	Fri, 04 Mar 2016 15:52:46 -0500
Received: from unknown (HELO ALPMBHT04.e2k.ad.ge.com) ([3.159.19.197])
	by cinmlip10.e2k.ad.ge.com with ESMTP/TLS/AES128-SHA;
	04 Mar 2016 15:52:38 -0500
Received: from ALPMBAPA04.e2k.ad.ge.com (3.159.19.32) by
	ALPMBHT04.e2k.ad.ge.com (3.159.19.197) with Microsoft SMTP Server (TLS)
	id 14.3.266.1; Fri, 4 Mar 2016 15:52:37 -0500
Received: from ALPMBAPA12.e2k.ad.ge.com ([169.254.5.12]) by
	ALPMBAPA04.e2k.ad.ge.com ([169.254.4.119]) with mapi id 14.03.0266.001;
	Fri, 4 Mar 2016 15:52:37 -0500
From: "Sanchez, Juan Carlos (GE Aviation)" <juan.carlos.sanchez@ge.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: Hi good afternoon, some small support
Thread-Index: AdF2V8dm1QoHYP/xQ8SaH+Vm3B6hKw==
Date: Fri, 4 Mar 2016 20:52:37 +0000
Message-ID: <709659D8C88A4047B113A8F68771E8EA46B91006@ALPMBAPA12.e2k.ad.ge.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [3.159.19.216]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1601100000
	definitions=main-1603040362
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.149.52
X-Mailman-Approved-At: Sat, 05 Mar 2016 05:09:04 -0500
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: [Qemu-arm] Hi good afternoon, some small support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: znogXbO9M/5+

Hi,
 	I am trying to execute an image created by ARM in QEMU using windows OS, =
could you give me guide to example the command line?=20

The command line in Unix work well, but I don't understood all the options.=
 This the reason that I looking for some help

/home/nhcu02t/yocto_i686/prebuild/sysroots/i686-pokysdk-linux/usr/bin/qemu-=
system-arm -kernel zImage-qemuarm.bin -net nic,model=3Dvirtio -net tap,vlan=
=3D0,ifname=3Dtap0,script=3Dno,downscript=3Dno -M versatilepb -drive file=
=3D/home/nhcu02t/yocto_org_built/images/qemuarm/core-image-minimal-qemuarm.=
ext4,if=3Dvirtio,format=3Draw -no-reboot -show-cursor -usb -usbdevice wacom=
-tablet -no-reboot -m 128 -serial mon:vc -serial null --append "root=3D/dev=
/vda rw console=3DttyAMA0,115200 console=3Dtty ip=3D192.168.7.2::192.168.7.=
1:255.255.255.0 mem=3D128M highres=3Doff rootfstype=3Dext4 "


I accept any help that you provide me.

Juan Carlos Sanchez

