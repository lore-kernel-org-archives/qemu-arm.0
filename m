Received: by 10.25.21.96 with SMTP id l93csp564130lfi;
        Fri, 17 Jun 2016 22:58:08 -0700 (PDT)
X-Received: by 10.200.50.237 with SMTP id a42mr7161354qtb.80.1466229488047;
        Fri, 17 Jun 2016 22:58:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d71si3338663qkj.177.2016.06.17.22.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 22:58:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@livius-net.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bE9Gh-0004nd-DK
	for alex.bennee@linaro.org; Sat, 18 Jun 2016 01:58:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ilg@livius.net>) id 1bE9Gd-0004kL-Ei
	for qemu-arm@nongnu.org; Sat, 18 Jun 2016 01:58:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ilg@livius.net>) id 1bE9GX-0008TI-Vf
	for qemu-arm@nongnu.org; Sat, 18 Jun 2016 01:58:02 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:37262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ilg@livius.net>) id 1bE9GX-0008Sy-Pm
	for qemu-arm@nongnu.org; Sat, 18 Jun 2016 01:57:57 -0400
Received: by mail-wm0-x22b.google.com with SMTP id a66so12668779wme.0
	for <qemu-arm@nongnu.org>; Fri, 17 Jun 2016 22:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=livius-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=mveZOXuOzoin/wr1QqGMbSyVz1H3El2ozzrXE9b3OUk=;
	b=zjT3nkPmCv3WKavcrfXg+a7Zuycd9BTpJ4Yc+4fOFECDE3ndUSU+MrhiiBVHpAx4Yy
	VZe1maUy1Ct0ufJO91NUwRJ77lQMGBbxRJP2qS9bcVl1TX0JLvapdKr+xXhTYkvBcSIM
	irm2JfxqeS6f+sFk18jfE5vTCmEIijpQdkUKHdPSY0byYayDdnuIgMzRtcJEfg95mfwT
	LjH8pNcJLRv48MSUHqTnC2e/o3KisU9b4XBuZywuecillYkf1+JZZvHHIhDx/dZ4wrry
	qjNAfag4Wgz+esnqzZk+r1ttqKmxYxHfk6MI2MMBIwpw7EAqaJ/L5j1G61icVqhTUmtj
	Uwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=mveZOXuOzoin/wr1QqGMbSyVz1H3El2ozzrXE9b3OUk=;
	b=JV6fr157682pWT/uDlpMAVh493QZ4MJJNOorw6KT8gUoRd5oUJGboKoLXgIyy1GDbh
	8ODWv+R1W6tbWS//KBjTf+3+c3RDYu75GaUKm9fXCo2dpfVph0SIJnrsdZtsJaOy/6FP
	pxLKo8rR0G1Sndr/a8Wn31dsMsbpfFXc1WS+0D9/UfDqSNrwzZE9RgLWaSHDEi7kP4GH
	FwMV/E6wav4E9yFxhmn+B/AVAjwsrbUq5TXz5aJ1JgDSt3KSgeFe4HX+gVjGlyceQYCz
	8/R+B+Q5I4rau0hPmtdSDHvRbx/+ymCTIG97pwTKM6Dxmqnaqo8cy8Zp6pBSEze7mIyt
	vKdQ==
X-Gm-Message-State: ALyK8tKr4+PvKh8rZ5tDf9I23q5znpqajXON+ME2AoLumW1ssfDMm8wjUKFXdvsPXxLtFw==
X-Received: by 10.194.47.71 with SMTP id b7mr5252644wjn.107.1466229475751;
	Fri, 17 Jun 2016 22:57:55 -0700 (PDT)
Received: from [172.16.62.12] ([109.99.239.84])
	by smtp.gmail.com with ESMTPSA id
	f196sm2005461wmg.15.2016.06.17.22.57.54
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 22:57:55 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CA+BS1oGcMDdG_j9M6zMV3gqV-Gjg=rEMdkCSzp3J=VXw5bu7QA@mail.gmail.com>
Date: Sat, 18 Jun 2016 08:57:53 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <630F50C7-F9D7-457A-8FEA-62CBED76E86F@livius.net>
References: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
	<B8CD3C5F-E177-460D-AD9B-4636681ACFAA@livius.net>
	<CA+BS1oGcMDdG_j9M6zMV3gqV-Gjg=rEMdkCSzp3J=VXw5bu7QA@mail.gmail.com>
To: Tsung-Han Lin <tsunghan.tw@gmail.com>
X-Mailer: Apple Mail (2.3124)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC] target-arm: fix semihosting ram
 base issue
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4oGQg2aUQF4O


> On 18 Jun 2016, at 01:22, Tsung-Han Lin <tsunghan.tw@gmail.com> wrote:
>=20
> ... It seems like to me that the issue is the default address assumed =
by qemu, which is 0x0.
> (since Eclipse QEMU uses the same code, I believe they have the same =
problem.)

it uses the same main code, but with many improvements.=20

if I remember right, for semihosting there were several small problems =
requiring changes, but they were all fixed now. you can give it a try =
(http://gnuarmeclipse.github.io/qemu/options/).

in addition to semihosting, which I use for running the CMSIS++ tests, =
GNU ARM Eclipse QEMU also implements graphical animated LEDs for a =
selection of boards, which might be very convenient for simple blinky =
tests.


regards,

Liviu

