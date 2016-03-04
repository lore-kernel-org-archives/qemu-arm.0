Received: by 10.25.208.211 with SMTP id h202csp114182lfg;
        Fri, 4 Mar 2016 07:04:10 -0800 (PST)
X-Received: by 10.140.98.163 with SMTP id o32mr6737692qge.46.1457103850124;
        Fri, 04 Mar 2016 07:04:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188si3941752qka.72.2016.03.04.07.04.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Mar 2016 07:04:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:41622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abrGz-0002xh-GP
	for alex.bennee@linaro.org; Fri, 04 Mar 2016 10:04:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1abrGy-0002wk-1j
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 10:04:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1abrGu-0002SY-OF
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 10:04:07 -0500
Received: from forward9m.cmail.yandex.net ([5.255.216.202]:47958)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1abrGu-0002OO-Ei; Fri, 04 Mar 2016 10:04:04 -0500
Received: from web18m.yandex.ru (web18m.yandex.ru [37.140.138.109])
	by forward9m.cmail.yandex.net (Yandex) with ESMTP id 4A60021E14;
	Fri,  4 Mar 2016 18:04:00 +0300 (MSK)
Received: from web18m.yandex.ru (localhost [127.0.0.1])
	by web18m.yandex.ru (Yandex) with ESMTP id EB19A1560047;
	Fri,  4 Mar 2016 18:03:58 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1457103839; bh=TkI+he4kzkAUo8iiwA9aRHBsTNPBqOzjmCpw47v1E4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=o2siYwgxGI43g/95PAdxWxmdRNZ6Zju+XqXElm57op4oAsyYOTDVKHt4dS99tcSLk
	NnoLUSXj8Dr3FLCyeoYqkv5ISnRFoYqTstGgDQKt/MmT7yJL6CvlXOfoa/LcFq/ttu
	DmDzN/fXf1Nq46iC/5AM3X9bKx1/owj+OTnDMLc0=
Received: by web18m.yandex.ru with HTTP;
	Fri, 04 Mar 2016 18:03:58 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Peter Maydell <peter.maydell@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>
In-Reply-To: <CAFEAcA9dPg9Zs4LMzjb738nsVQXPicQSLU5yHXgG0wffD0M=Gg@mail.gmail.com>
References: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
	<56D73CB6.7040702@gmail.com>
	<CAFEAcA9gPrmcn3TNUueei1f5V0QMr-Nox9JHEE23EsQxbEO9qQ@mail.gmail.com>
	<56D84EB5.30808@gmail.com>
	<CAFEAcA9Sp5282BfXFK8W9x8N0HJCbmxZBNL7Cxof7cYRsp8FgA@mail.gmail.com>
	<56D8683D.1080004@gmail.com>
	<CAFEAcA9dPg9Zs4LMzjb738nsVQXPicQSLU5yHXgG0wffD0M=Gg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <5345871457103838@web18m.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 04 Mar 2016 18:03:58 +0300
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.216.202
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Fix translation
	level on early translation faults
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
X-TUID: IRttXZ6OzU2O



03.03.2016, 19:54, "Peter Maydell" <peter.maydell@linaro.org>:
> =9AOn 3 March 2016 at 16:37, Sergey Fedorov <serge.fdrv@gmail.com> wrot=
e:
>> =9A=9AOn 03.03.2016 17:55, Peter Maydell wrote:
>>> =9A=9AYes, this patch is definitely fixing a bug; I'm just mentioning=
 that other
>>> =9A=9Acode path because it seems to be the result of previously fixin=
g the bug
>>> =9A=9Afor a particular special case...
>>
>> =9A=9AAh, right, I think I understand you :) So we'd better remove the=
se lines:
>>
>> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A/* AArch64 reports these as =
level 0 faults.
>> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A* AArch32 reports these a=
s level 1 faults.
>> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A*/
>> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Alevel =3D va_size =3D=3D 64 =
? 0 : 1;
>> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Afault_type =3D translation_f=
ault;
>
> =9AThose lines come after some code which has set level to something
> =9Aelse, so you'd need to rearrange that code a bit so it didn't
> =9Aset level before it had determined that there wasn't a fault.
>
> =9Athanks
> =9A-- PMM

Do we really need to rearrange the code?
In pseudo-code the level is set explicitly as well, in case of a fault.
