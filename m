Received: by 10.25.208.211 with SMTP id h202csp1109549lfg;
        Fri, 19 Feb 2016 03:51:13 -0800 (PST)
X-Received: by 10.140.95.76 with SMTP id h70mr7888545qge.105.1455882673136;
        Fri, 19 Feb 2016 03:51:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21si13942277qkb.86.2016.02.19.03.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 03:51:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:51312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWjaa-0003jl-N7
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 06:51:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aWjaT-0003V7-Q2
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 06:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aWjaP-0001Ex-WA
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 06:51:05 -0500
Received: from m12-14.163.com ([220.181.12.14]:58981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aWjaH-00018D-L1; Fri, 19 Feb 2016 06:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Mime-Version:Subject:From:Date:Message-Id; bh=auBXy
	PRnjqEDJRLcxjQqYtX6LqmSh0TgA6v0YhLIVXM=; b=g6YHYL2Q9gdqAznReaD4u
	Ug2Qef7pFTnGR1UKayLTG7XErKG2OPzNIe+L/Ju1JitwLvsqOMhrsyYj5/NCbkne
	cc9kXhnxjjL4b6FZDeGfdzUKtM/7+EjmQ8/J44oBKk60dv07gT4cP1evR+f98Qh4
	DTntu6nIue/oPu3V5J6Pho=
Received: from [10.32.192.133] (unknown [223.104.3.203])
	by smtp10 (Coremail) with SMTP id DsCowABXXjYwAcdWH77VBg--.64303S2;
	Fri, 19 Feb 2016 19:49:05 +0800 (CST)
Content-Type: text/plain;
	charset=gb2312
Mime-Version: 1.0 (1.0)
From: xiaoqiang zhao <zxq_yx_007@163.com>
X-Mailer: iPhone Mail (13D15)
In-Reply-To: <CAFEAcA8JOM_qVG0_T_GvhCmyjHR5fWBRh9hUn1Oi9j=mKpw92g@mail.gmail.com>
Date: Fri, 19 Feb 2016 19:49:04 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <99FDC702-8A44-44F6-AEF9-54E1FCDC8CAD@163.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
	<1455621027-13927-7-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA98eqLbA863L-t3y7wFFO8eiXgZZvaSge0e6cUTu8S0-A@mail.gmail.com>
	<56C6F63A.9060907@163.com>
	<CAFEAcA8JOM_qVG0_T_GvhCmyjHR5fWBRh9hUn1Oi9j=mKpw92g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-CM-TRANSID: DsCowABXXjYwAcdWH77VBg--.64303S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUbyCGUUUUU
X-Originating-IP: [223.104.3.203]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEBMUxlUL6y59VwAAsg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.14
Cc: Evgeny Voevodin <e.voevodin@samsung.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v3 16/16] hw/timer: QOM'ify tusb6010
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
X-TUID: Do5WZteN8gmZ



> =D4=DA 2016=C4=EA2=D4=C219=C8=D5=A3=AC19:37=A3=ACPeter Maydell <peter.mayd=
ell@linaro.org> =D0=B4=B5=C0=A3=BA
>=20
> Mmm, I thought this might be related to the MUSB code.
> I think this device cannot be converted properly to current
> QOM standards until the MUSB code which it relies on has
> been converted first.

Reasonable !




