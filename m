Received: by 10.25.208.211 with SMTP id h202csp11313lfg;
        Thu, 31 Mar 2016 01:16:18 -0700 (PDT)
X-Received: by 10.140.89.178 with SMTP id v47mr1012925qgd.11.1459412178725;
        Thu, 31 Mar 2016 01:16:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t65si6901678qhc.2.2016.03.31.01.16.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Mar 2016 01:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58707 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1alXm6-0002KY-8E
	for alex.bennee@linaro.org; Thu, 31 Mar 2016 04:16:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1alXm2-0002HI-8a
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 04:16:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1alXlz-0003ir-1o
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 04:16:14 -0400
Received: from m12-18.163.com ([220.181.12.18]:48868)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1alXlx-0003g9-4W; Thu, 31 Mar 2016 04:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Mime-Version:Subject:From:Date:Message-Id; bh=QL9pH
	4ScbjVCm8bP5cSJApPZDQ9wWUpqnHxNC+NXuME=; b=L7O9bBv9NV966u5xqBUwV
	mVMpmjU8QIXYaNb5f/JHZSfno0TTJFbogGiE7OQqzdbr3rbgJFxuiivK7HBrXcye
	zZhp3sJUr7vgXx/b9HU8Y5a2wKw4qHI6/CScTFctX8Mhtl7Qe7xioyO4zMziOHTd
	yxbuTT+l0w1sWNZDUx4hF0=
Received: from [192.168.31.183] (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowEBJlUOV3PxWOqtxAA--.9048S2;
	Thu, 31 Mar 2016 16:15:19 +0800 (CST)
Content-Type: text/plain;
	charset=gb2312
Mime-Version: 1.0 (1.0)
From: xiaoqiang zhao <zxq_yx_007@163.com>
X-Mailer: iPhone Mail (13E233)
In-Reply-To: <CAFEAcA_xGVpHW8ki0qqGMN8OtpbiZYtAsCJoxQG9z8FPXZBVqQ@mail.gmail.com>
Date: Thu, 31 Mar 2016 16:15:17 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <E44DBEC6-F0C6-4B70-A753-24D62179283D@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA98BiQipq4PL=_9fBeOa01ESzyp7U4ghN0gZuxAyAqwoA@mail.gmail.com>
	<CAFEAcA-P25AkJLBLst04J=BxTVvbfuQQAiE8nVS=w7oMXdtX8A@mail.gmail.com>
	<56FC81E0.1000203@163.com>
	<CAFEAcA_xGVpHW8ki0qqGMN8OtpbiZYtAsCJoxQG9z8FPXZBVqQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-CM-TRANSID: EsCowEBJlUOV3PxWOqtxAA--.9048S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw45CFW8tFy3AFyxCryrXrb_yoWfurcE9F
	Z2kwn7Gw4DJwsrJanIyFsxZFsxtFs7Xr4rGw1Fv34Fq3savr98Jrs5Kr1Svr1rurZa9FZx
	ur1Fqay3JrWSqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1QeOtUUUUU==
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEBc9xlUL7lZiNwAAsP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 0/9] some QOM'ify work under hw/arm
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
X-TUID: nk+ub5x49Dku



> =D4=DA 2016=C4=EA3=D4=C231=C8=D5=A3=AC16:05=A3=ACPeter Maydell <peter.mayd=
ell@linaro.org> =D0=B4=B5=C0=A3=BA
>=20
>> On 31 March 2016 at 02:48, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>>=20
>>> =D4=DA 2016=C4=EA03=D4=C216=C8=D5 20:00, Peter Maydell =D0=B4=B5=C0:
>>>=20
>>>> On 16 March 2016 at 11:31, Peter Maydell <peter.maydell@linaro.org> wro=
te:
>>>>=20
>>>> A general note -- since these aren't bug fixes and we're in soft
>>>> freeze now, I don't think we should put them in until 2.6 is out.
>>>> I'll review the patches in a second, though.
>>>=20
>>> Well, the patches all look good -- ping me after 2.6 is out to
>>> apply them to target-arm.next then.
>>>=20
>>> Where I've noted possible further cleanups, that's intended as
>>> an "if you like writing cleanup patches" thing -- you don't need
>>> to try to do them as part of this patch series.
>=20
>> ping !
>=20
> I suggested you ping me after 2.6 is out, which won't be til the
> end of April or thereabouts.
>=20
> thanks
> -- PMM

Ok=A3=A12.6rc misleads me=A3=A1=


