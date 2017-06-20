Received: by 10.25.15.165 with SMTP id 37csp876229lfp;
        Tue, 20 Jun 2017 07:03:16 -0700 (PDT)
X-Received: by 10.202.204.207 with SMTP id c198mr16510799oig.71.1497967396266;
        Tue, 20 Jun 2017 07:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497967396; cv=none;
        d=google.com; s=arc-20160816;
        b=qlhnXIRwK4wXzrn7KTZZhyzmikGOum5h161fMDNVuYLDGgazkSxkPAhty0MLKTI5aP
         XYa+pMGSOc6nIDQ7IVZp302G53Q3l5DpclNavCysXq1z559diSpV+IdjLT5FQumtNKmF
         EnGCshoxQNt68gkL6lJ+dBkkPlZTNjcuw8DVo9K+sc0Jcl3bGaF3cAVErfHJQmvV1hfM
         gWJIBztWwHBUxRIZSJ9Jl8zNkJqbiRYtv9qO2k1BKtDuLIvJ3YyDHmDyaZM1mbBPkhOv
         yRLpI+FoCjubOyqUyGhtVPwqppTyYQlMDrlfzroC+Crse8Sn8Nfwi6M98wxZzZUw/cI8
         hJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:to:from:arc-authentication-results;
        bh=/O65WCVVZAUGZINy95iRwjP1UfTAAQY+JjNtDiu/P68=;
        b=FUnTybCCStdVyqLtF4AlX0oIbM0DzBPxDXm/RIX8ZXbaxVsVb7AQ+nSlcU4yAsKYt4
         WnWMdU+VIW+iWwLJK4n7Drz6KAh25eeKnczNW38uV8wKGlAneZktSTbQPvkn9zH+PYiI
         i3PkuHvQYFGVcZVFPqyfivUjVkIPwK12JkzUQQ1hA8of/yP63TASWG1PbUYGGjjejGRb
         ey9IJskq3E+C93VmCH3PTTb/VuYhOaX/hB5OMQlVW5PnWXgDZU5KGkn5lqGLGMkb1OZF
         Suur9WYBy5MwRTBFfjmzm6AeJXoSaCsoXMv/Ho4/FRWedM/WXuv2T/7dpK2o6Z8BmCzZ
         fZ3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d189si6057187vka.55.2017.06.20.07.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Jun 2017 07:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dNJkR-0002nD-Mj
	for alex.bennee@linaro.org; Tue, 20 Jun 2017 10:03:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <manuelgr@student.ethz.ch>) id 1dNHGp-0001oV-Ez
	for qemu-arm@nongnu.org; Tue, 20 Jun 2017 07:24:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <manuelgr@student.ethz.ch>) id 1dNHGk-0001W9-H3
	for qemu-arm@nongnu.org; Tue, 20 Jun 2017 07:24:31 -0400
Received: from edge20.ethz.ch ([82.130.99.26]:57121)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <manuelgr@student.ethz.ch>)
	id 1dNHGk-0001Vx-6l
	for qemu-arm@nongnu.org; Tue, 20 Jun 2017 07:24:26 -0400
Received: from CAS10.d.ethz.ch (172.31.38.210) by edge20.ethz.ch
	(82.130.99.26) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Tue, 20 Jun 2017 13:02:37 +0200
Received: from MBX13.d.ethz.ch ([fe80::c4aa:956e:5014:ce66]) by
	CAS10.d.ethz.ch ([fe80::cce:fc66:7b56:a06a%10]) with mapi id
	14.03.0319.002; Tue, 20 Jun 2017 13:02:41 +0200
From: "Grossmann  Manuel" <manuelgr@student.ethz.ch>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: Error when running Go programs (QEMU ARM)
Thread-Index: AQHS6bS7Dv7BE60xu0CpfbFzOjJHnw==
Date: Tue, 20 Jun 2017 11:02:40 +0000
Message-ID: <82094596CAFDB842B18EE1F7F37819CE354BC622@MBX13.d.ethz.ch>
Accept-Language: de-CH, en-US
Content-Language: de-CH
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.162.50.8]
Content-Type: multipart/alternative;
	boundary="_000_82094596CAFDB842B18EE1F7F37819CE354BC622MBX13dethzch_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 82.130.99.26
X-Mailman-Approved-At: Tue, 20 Jun 2017 10:00:22 -0400
Subject: [Qemu-arm] Error when running Go programs (QEMU ARM)
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
X-TUID: NfGdU+ND7uyx

--_000_82094596CAFDB842B18EE1F7F37819CE354BC622MBX13dethzch_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi guys,

I am currently writing my bachelor thesis about setting up SCION on ARM dev=
ices. To do this, I create my own image of Ubuntu and customize it, that th=
e image has installed everything when I flash it to the SD card.

The problem which I am having currently is, that I need to run Go programs =
to install SCION. Unfortunately I get this error (https://github.com/golang=
/go/issues/13024) when I want to do this.

Is there any workaround or alternatives?
Here is the Stackoverflow question I created, if you want to answer there (=
as well).
https://stackoverflow.com/questions/44635983/qemu-arm-user-emulation-error-=
when-using-go?noredirect=3D1&lq=3D1

Thanks for your time!

Best,
Manuel

--_000_82094596CAFDB842B18EE1F7F37819CE354BC622MBX13dethzch_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi guys,<br>
<br>
I am currently writing my bachelor thesis about setting up SCION on ARM dev=
ices. To do this, I create my own image of Ubuntu and customize it, that th=
e image has installed everything when I flash it to the SD card.<br>
<br>
The problem which I am having currently is, that I need to run Go programs =
to install SCION. Unfortunately I get this error (<a href=3D"https://github=
.com/golang/go/issues/13024" rel=3D"nofollow noreferrer">https://github.com=
/golang/go/issues/13024</a>) when I
 want to do this.<br>
<br>
Is there any workaround or alternatives?<br>
Here is the Stackoverflow question I created, if you want to answer there (=
as well).<br>
<a href=3D"https://stackoverflow.com/questions/44635983/qemu-arm-user-emula=
tion-error-when-using-go?noredirect=3D1&amp;lq=3D1" target=3D"_blank">https=
://stackoverflow.com/questions/44635983/qemu-arm-user-emulation-error-when-=
using-go?noredirect=3D1&amp;lq=3D1</a><br>
<br>
Thanks for your time!<br>
<br>
Best,<br>
Manuel<br>
</div>
</body>
</html>

--_000_82094596CAFDB842B18EE1F7F37819CE354BC622MBX13dethzch_--
