Received: by 10.25.21.96 with SMTP id l93csp376997lfi;
        Fri, 17 Jun 2016 10:47:57 -0700 (PDT)
X-Received: by 10.200.40.49 with SMTP id 46mr3753994qtq.79.1466185677711;
        Fri, 17 Jun 2016 10:47:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d66si32382201qgf.70.2016.06.17.10.47.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 10:47:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@livius-net.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDxs5-0000y3-2d
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 13:47:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ilg@livius.net>) id 1bDwXv-0001Lu-AR
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 12:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ilg@livius.net>) id 1bDwXr-00007e-6h
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 12:23:03 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:38041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ilg@livius.net>) id 1bDwXq-00007R-Uz
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 12:22:59 -0400
Received: by mail-wm0-x22d.google.com with SMTP id m124so6388021wme.1
	for <qemu-devel@nongnu.org>; Fri, 17 Jun 2016 09:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=livius-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=vFJ6+3O6Y+UsvQQhQ5YnZWr66CmOVq6HfCn6KhcIMTE=;
	b=Ba2X6Le9E9uMF7O584mpg0Vws35s2nu8TCQyFa0oz4wekVbCtoD0/tm2lwtq1cb2XL
	ZlQNOHNEM5S7Ti4tBTwoAZ/q+YP01MwIMz53InFiBj8vuoEb8x48QBwz2OrnVdgbh1PI
	qFLhwLZ7whfFs3X+gbSeez9C5pP0kPPCnEDM64ESindvx/wCQyikBE9wB97N5jgOlugn
	zTDIhGe2FbsBSeeKY1jpzYCTR0AHqG/dSi7boaz7E6CmTsdUiP1wHEIX24SFobWTBOlH
	oHL/uDwlGeY572vgqv9BXZ6EltFXVoUlHGf5pswqdgFpJR2+MqWHtmhTDvTW01ufyLXi
	EXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=vFJ6+3O6Y+UsvQQhQ5YnZWr66CmOVq6HfCn6KhcIMTE=;
	b=mfX0qqMZz1JQCW1gJV6NnVZAruNEkXGeuO8Ozk1cwcBv/FiJITP1mVe1+FjvQuDJcL
	m7xT6RRElBdEqt2jbaP9nTqXy/eqboeYvXxOtTErmeA3zUnP/zbmZ0sX+Mtse724htdi
	+3ZNJOqo8jrglUGo0JEVTAjazzxTY7BHVpTirrTeUyWRZxjIkoqFXCGAx/Z/tCE0yoCG
	632YvX8VobnRmbPpPOKTyX6C7TU2KMdx0QysvokuNl1SUhVCJlb07Cpf2auwtN3dXgdw
	UjJYHx0qS9/nKYt/srQFdP+rCbdxDY2QuKst74TaB6RoQJZ03Dor1MEuZd43sZFCUsh+
	iBVA==
X-Gm-Message-State: ALyK8tIRGmFy9MTqJcpxSqxuy+jGxAwx6BLGJrlqLuuhIAchoXW4i5zQUSOWOrI/KTM4lA==
X-Received: by 10.195.11.163 with SMTP id ej3mr3518212wjd.130.1466180578037;
	Fri, 17 Jun 2016 09:22:58 -0700 (PDT)
Received: from [172.16.62.12] ([109.99.239.84])
	by smtp.gmail.com with ESMTPSA id q63sm160618wma.0.2016.06.17.09.22.56
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 09:22:57 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
Date: Fri, 17 Jun 2016 19:22:55 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8CD3C5F-E177-460D-AD9B-4636681ACFAA@livius.net>
References: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
To: Tsung-Han Lin <tsunghan.tw@gmail.com>
X-Mailer: Apple Mail (2.3124)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-devel] [RFC] target-arm: fix semihosting ram base issue
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AbSk12QSg7D5


> On 17 Jun 2016, at 05:37, Tsung-Han Lin <tsunghan.tw@gmail.com> wrote:
>=20
> Hi, I made some changes to TRY TO fix the ARM semihosting issue ...
> This problem has been bothering me for quite a while.

semihosting was the first thing I fixed in GNU ARM Eclipse QEMU, and =
since then I use it constantly.

I don't know if this addresses your problem, but perhaps you could also =
take a look there.


regards,

Liviu

