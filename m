Received: by 10.223.172.38 with SMTP id v35csp100017wrc;
        Tue, 12 Sep 2017 14:05:12 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD+5h0Lgl2wBGo84aSK1tzszlJgWvj9+lRZkyN9DODHqiat3gF+ehGYqEqrE5snhfrQB0XH
X-Received: by 10.200.26.176 with SMTP id x45mr25233031qtj.181.1505250312705;
        Tue, 12 Sep 2017 14:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505250312; cv=none;
        d=google.com; s=arc-20160816;
        b=C+Q11FHNQeiyij4ZJ5lrPztPnVoWHz0vipgHCI87jVLVdj3+uh6MYikVUDg5b2MFro
         7F9T3GSPfPdS1WE4awCtJi9YL+A/pNzBBHjTpOR+q9q/q9t7jePlum8+IyvAoWvMkb1R
         u7NLjTcjv9eWEFvy0ny8ukNxUz3UgUYXWvtRS1wH8ipe/DeIDapi6H6if3qIC0sdqUel
         D9/tPvxKoLvgVdoeE/UXlU1Sg2UFDKiGxKG0aFBMu7FW0mAUjAGGq+lj7q63aYJWjXGn
         hBuoPJq00pSSgj/GaoHTPEojkEVo2ZvnxFj/kNCqYROeDST5cSU+glvYlf1n/L5Mplig
         u5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:to:from:arc-authentication-results;
        bh=yEpC7wnlNSnse25PjAY8vflOn1zPBQU2n1wJRkOSF5g=;
        b=iCbYO4fyJV01gOgD2o71L292qAUEoBKoe1G/kPwYRcQLjHt4mjQC84BgWRBwan/tYb
         drfCuG7C/LuDJwUivL5RWwBkI164FG9/Tve6fQqyyPsmHsRxVmn5fMvRssHqBCrnP5Hq
         Rx7kKVEf4KAuf7KMumCQ3bbgri7Yt60gI/vkFTr6UEfWZk3eUK8mY6GsCneYpjL1COxw
         S8sYwIIoljCZsi2PMh2dJ5wGjwodLieGrAt18ml7LpXkWkTyxGWyooX1bGkfqlbW8HDP
         rTpUXgSeQwackpwxwaZ2iAfSbh59ggVFQ9sNA32ZG3dKHHtcTn+5G+WEbbdfHUpk4jpC
         GDnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p66si1742804qka.85.2017.09.12.14.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 14:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drsMo-0003SJ-Ga
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 17:05:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <a.nandagoban@traxens.com>) id 1drsKl-0001sn-ML
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 17:03:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <a.nandagoban@traxens.com>) id 1drsKi-0007Hz-Bb
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 17:03:03 -0400
Received: from [185.29.148.65] (port=56336 helo=mail.traxens.com)
	by eggs.gnu.org with smtp (Exim 4.71)
	(envelope-from <a.nandagoban@traxens.com>) id 1drsKY-00077J-4Q
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 17:03:00 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.traxens.com (Postfix) with ESMTP id 7F9671474B21
	for <qemu-arm@nongnu.org>; Tue, 12 Sep 2017 22:23:51 +0200 (CEST)
Received: from mail.traxens.com ([127.0.0.1])
	by localhost (mail.traxens.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Ricewc0eU_Gk for <qemu-arm@nongnu.org>;
	Tue, 12 Sep 2017 22:23:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.traxens.com (Postfix) with ESMTP id 18F801474B23
	for <qemu-arm@nongnu.org>; Tue, 12 Sep 2017 22:23:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.traxens.com
Received: from mail.traxens.com ([127.0.0.1])
	by localhost (mail.traxens.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id H8wtU6L44XkT for <qemu-arm@nongnu.org>;
	Tue, 12 Sep 2017 22:23:51 +0200 (CEST)
Received: from mailhost.traxens.com (unknown [10.222.4.5])
	by mail.traxens.com (Postfix) with ESMTPS id F30961474B21
	for <qemu-arm@nongnu.org>; Tue, 12 Sep 2017 22:23:50 +0200 (CEST)
From: Arulnambi NANDAGOBAN <a.nandagoban@traxens.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: Emulating beaglebone black on QEMU
Thread-Index: AQHTLAVSbugjqZdoSUSmdytLh+Yu/Q==
Date: Tue, 12 Sep 2017 20:26:59 +0000
Message-ID: <799052b6b21941e9a7360fbdbf57fc4b@traxens.com>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [78.244.35.126]
Content-Type: multipart/alternative;
	boundary="_000_799052b6b21941e9a7360fbdbf57fc4btraxenscom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 185.29.148.65
X-Mailman-Approved-At: Tue, 12 Sep 2017 17:05:01 -0400
Subject: [Qemu-arm] Emulating beaglebone black on QEMU
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
X-TUID: 82bzJWGlfZIu

--_000_799052b6b21941e9a7360fbdbf57fc4btraxenscom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello all,


I am trying to emulate beaglebone black with QEMU but withh no success. Cou=
ld someone please explain me the process?  if it was already done .


Thank you


Arulnambi

Traxens SAS

France

--_000_799052b6b21941e9a7360fbdbf57fc4btraxenscom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;back=
ground-color:#FFFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hello all,&nbsp;</p>
<p><br>
</p>
<p>I am trying to emulate beaglebone black with QEMU but withh no success. =
Could someone please explain me the process?&nbsp; if it was&nbsp;already d=
one .&nbsp;</p>
<p><br>
</p>
<p>Thank you</p>
<p><br>
</p>
<p>Arulnambi</p>
<p>Traxens SAS</p>
<p>France</p>
</div>
</body>
</html>

--_000_799052b6b21941e9a7360fbdbf57fc4btraxenscom_--
