Received: by 10.25.159.131 with SMTP id i125csp336230lfe;
        Fri, 9 Dec 2016 07:08:41 -0800 (PST)
X-Received: by 10.237.33.173 with SMTP id l42mr69265894qtc.271.1481296121555;
        Fri, 09 Dec 2016 07:08:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y48si20291556qtc.195.2016.12.09.07.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Dec 2016 07:08:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cFMmu-0008Ty-Vz
	for alex.bennee@linaro.org; Fri, 09 Dec 2016 10:08:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <leejose911@gmail.com>) id 1cFLpV-0006zb-Us
	for qemu-arm@nongnu.org; Fri, 09 Dec 2016 09:07:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <leejose911@gmail.com>) id 1cFLpS-0003By-S2
	for qemu-arm@nongnu.org; Fri, 09 Dec 2016 09:07:17 -0500
Received: from mail-wj0-f173.google.com ([209.85.210.173]:35106)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <leejose911@gmail.com>)
	id 1cFLpS-0002yi-LJ
	for qemu-arm@nongnu.org; Fri, 09 Dec 2016 09:07:14 -0500
Received: by mail-wj0-f173.google.com with SMTP id v7so15475850wjy.2
	for <qemu-arm@nongnu.org>; Fri, 09 Dec 2016 06:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=MFqlv8hOGQaY564/VAzknZmYjf2b1rJkM38+o2/5Q2w=;
	b=nwPRU6J9h4NK3BHMkVcP9nDgyBy9Xl5+tx/PdDV/3RNmXpfY8m3ER6tzj6ssu9FyZ8
	6r0kpw45qbRNDpWjqyRQ68Fb+QK/l4/Uqcw1v8QGsv5xA+rmD71boCr6sXfG0SClV1+s
	YiK2yhcq/5yoKOxZksgyXS6gENYJJahvs+avub5uKGrPNr5LmBygV109AU3IGPgWNX4J
	XSz2tFBx7QCG+zmMoMsZzWNfiVo7dFVmZbTx/+dSVMTCwHWMx7Ng4WVNjS+Z0F8GSeRE
	vAGAyqJ4toClS1LWUW2hCXdv7d8IK8bsaQBUWGOASD5uWNcw9i/572XkyHPC7KjkvG88
	zYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MFqlv8hOGQaY564/VAzknZmYjf2b1rJkM38+o2/5Q2w=;
	b=D+PNQ6SO1YMwB2aI41GJyrcLG7vAeryJtYed0BHXLBGKLvDpxJsoknluyRAVmBuewY
	YR5AqWWbi9PpocU02M+oFCB+gC/YRrUJ2J1ObChUsKi/8jHZQS5v22i4g426bg7I+0E6
	POxsxg7AWehwjk9Nj1O+23HR8zpC1fEUUTypHUU64wsum8G04npovR4pf2h4QAEyOArr
	4TltEB1h5kUgTrYriU67Ig221A3PdWrjRJ8vUJq6OrRysFTdBx4GQHN9ZnNnt4lg3D9s
	EuLHznvf0qYHWXuTWYVbIb1esOemu1P1ohHC5kBy8QWxhw4mxnR54N/NRTzxTxkVD9vw
	EDkQ==
X-Gm-Message-State: AKaTC02x3DZcE97Tz6w8LnHjxUFSlQreU4xQ5HSkusaK5b5IdV8SiRJZnJtemgijgx3w96Eh6Ow3FZ1fqhpELg==
X-Received: by 10.194.97.8 with SMTP id dw8mr43166598wjb.84.1481292352063;
	Fri, 09 Dec 2016 06:05:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.143.67 with HTTP; Fri, 9 Dec 2016 06:05:51 -0800 (PST)
From: Joseph Lee <leejose911@gmail.com>
Date: Fri, 9 Dec 2016 14:05:51 +0000
Message-ID: <CABDqRrKbxXphJKSFkcV9-DZjVxH4LRGE9K4N6TQBLirL-Nmb0Q@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=047d7bfcfa54742e4f05433a40e5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.173
X-Mailman-Approved-At: Fri, 09 Dec 2016 10:08:38 -0500
Subject: [Qemu-arm] [ARM TrustZone] Running Android in the normal world
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
X-TUID: c43aU0dTzftG

--047d7bfcfa54742e4f05433a40e5
Content-Type: text/plain; charset=UTF-8

Hi,

I am new to QEMU. I wanted to setup an experiment using QEMU emulator that
supports ARM TrustZone. I wanted to run Android in the normal world while a
secure kernel (which I don't know) is running in the secure world and the
context switch between the two worlds is possible. Could you please give me
steps how to set up this experiment? Thanks in advance for your answers.

Thanks,
Joseph

--047d7bfcfa54742e4f05433a40e5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi, <br><br></div>I am new to QEMU. I wante=
d to setup an experiment using QEMU emulator that supports ARM TrustZone. I=
 wanted to run Android in the normal world while a secure kernel (which I d=
on&#39;t know) is running in the secure world and the context switch betwee=
n the two worlds is possible. Could you please give me steps how to set up =
this experiment? Thanks in advance for your answers.<br><br></div>Thanks,<b=
r></div>Joseph<br></div>

--047d7bfcfa54742e4f05433a40e5--
