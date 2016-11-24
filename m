Received: by 10.25.150.194 with SMTP id y185csp52146lfd;
        Thu, 24 Nov 2016 17:29:48 -0800 (PST)
X-Received: by 10.55.75.17 with SMTP id y17mr4425666qka.26.1480037388688;
        Thu, 24 Nov 2016 17:29:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u62si23846380qkd.232.2016.11.24.17.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Nov 2016 17:29:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@abv.bg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cA5Km-00037k-5u
	for alex.bennee@linaro.org; Thu, 24 Nov 2016 20:29:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gatakag@abv.bg>) id 1cA2w4-0000kD-Kz
	for qemu-arm@nongnu.org; Thu, 24 Nov 2016 17:56:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gatakag@abv.bg>) id 1cA2vz-0004qx-87
	for qemu-arm@nongnu.org; Thu, 24 Nov 2016 17:56:08 -0500
Received: from smtp-out.abv.bg ([194.153.145.80]:36561)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gatakag@abv.bg>) id 1cA2vy-0004jX-Qe
	for qemu-arm@nongnu.org; Thu, 24 Nov 2016 17:56:03 -0500
Received: from nm62.abv.bg (nm62.ni.bg [192.168.151.127])
	by smtp-out.abv.bg (Postfix) with ESMTP id 982DF46D6D
	for <qemu-arm@nongnu.org>; Fri, 25 Nov 2016 00:55:53 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abv.bg; s=smtp-out;
	t=1480028153; bh=PVzTuW5Fv1+OVrhp4MgwLNBXBe5SAZa2XO3jJ6RCKq4=;
	h=Date:From:To:Subject:From;
	b=V/PgF4ntmXzzyurATxLsJmP4YTI0m6a0w43FN5snSYfGjVRw4Bi4lSckgeZwEmhtU
	3gO0izKlVx7EpdPdS6iHTl4IlQHGj8lxoM5VXNGYn8Z0hacn6b62BiwtZ6a3GvGApT
	BJ1O4Y3XBNxR52hq76MJUKiGbFdPgAQ5h/kN/25g=
Received: from nm62.abv.bg (localhost [127.0.0.1])
	by nm62.abv.bg (Postfix) with ESMTP id 7900F1FBD9
	for <qemu-arm@nongnu.org>; Fri, 25 Nov 2016 00:55:53 +0200 (EET)
Date: Fri, 25 Nov 2016 00:55:52 +0200 (EET)
From: gataka gataka <gatakag@abv.bg>
To: qemu-arm@nongnu.org
Message-ID: <1174880880.1520202.1480028153486.JavaMail.apache@nm62.abv.bg>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1520201_517596741.1480028152941"
X-Mailer: AbvMail 3.0
X-Originating-IP: 158.58.218.94
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 194.153.145.80
X-Mailman-Approved-At: Thu, 24 Nov 2016 20:29:45 -0500
Subject: [Qemu-arm] qemu not working with kernel 4.4
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4/LcyEKVzoy0

------=_Part_1520201_517596741.1480028152941
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

qemu-arm with raspi2 do not working with latest raspbian with kernel 4.4 =
please fix error

------=_Part_1520201_517596741.1480028152941
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<HTML><BODY>
qemu-arm with raspi2 do not working with latest raspbian with kernel 4.4 pl=
ease fix error<br></BODY></HTML>

------=_Part_1520201_517596741.1480028152941--
