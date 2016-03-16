Received: by 10.25.208.211 with SMTP id h202csp1138493lfg;
        Wed, 16 Mar 2016 05:07:36 -0700 (PDT)
X-Received: by 10.55.18.168 with SMTP id 40mr4354189qks.99.1458130056494;
        Wed, 16 Mar 2016 05:07:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j11si2997203qgj.90.2016.03.16.05.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 05:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:55858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agAEh-0000R1-U7
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 08:07:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1agAEf-0000OJ-4F
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 08:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1agAEZ-00053y-FU
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 08:07:33 -0400
Received: from m12-12.163.com ([220.181.12.12]:54206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1agAEY-00052l-PY; Wed, 16 Mar 2016 08:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Mime-Version:Subject:From:Date:Message-Id; bh=o3wTy
	n7nEqgrelWvemzDNHN61OUumhiTYdjmA84Vufw=; b=lsTh/w1xxyQNjxirIOo6e
	UOMxYv6Ebx8UPGNBMFsdpvyqXlhnCRvh4qBR5/ni0MZnWZjeuhYkx1z7SgH6GGxf
	HFP2iMEKbw26V9saXuzp0cSgI566kVVJcxRAmXNCgzjw0DAVl1xfc16pSujkUZzR
	/OC3HzakQjTkroN95puCaw=
Received: from [192.168.199.233] (unknown [114.111.167.199])
	by smtp8 (Coremail) with SMTP id DMCowABHyzxVTOlWAL6qAg--.25101S2;
	Wed, 16 Mar 2016 20:06:47 +0800 (CST)
Content-Type: text/plain;
	charset=gb2312
Mime-Version: 1.0 (1.0)
From: xiaoqiang zhao <zxq_yx_007@163.com>
X-Mailer: iPhone Mail (13D15)
In-Reply-To: <CAFEAcA-P25AkJLBLst04J=BxTVvbfuQQAiE8nVS=w7oMXdtX8A@mail.gmail.com>
Date: Wed, 16 Mar 2016 20:06:46 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <B4692CD6-B6AF-4FFA-A612-C13556103FA8@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA98BiQipq4PL=_9fBeOa01ESzyp7U4ghN0gZuxAyAqwoA@mail.gmail.com>
	<CAFEAcA-P25AkJLBLst04J=BxTVvbfuQQAiE8nVS=w7oMXdtX8A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-CM-TRANSID: DMCowABHyzxVTOlWAL6qAg--.25101S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr4Utw4UJw1fGF17GFWkXrb_yoWxCwcEgF
	yv9rn7Kw4qyws7Ga1ayFs8Zr43ta97JrWrXr1Fv3yfXryavryDXrWrXr1avr13urZY9FZx
	Zr1xtw43trWSqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnUku7UUUUU==
X-Originating-IP: [114.111.167.199]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEBguxlWBUOET9wAAsh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
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
X-TUID: l5wdAg4RcZIr



> =D4=DA 2016=C4=EA3=D4=C216=C8=D5=A3=AC20:00=A3=ACPeter Maydell <peter.mayd=
ell@linaro.org> =D0=B4=B5=C0=A3=BA
>=20
>> On 16 March 2016 at 11:31, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>> A general note -- since these aren't bug fixes and we're in soft
>> freeze now, I don't think we should put them in until 2.6 is out.
>> I'll review the patches in a second, though.
>=20
> Well, the patches all look good -- ping me after 2.6 is out to
> apply them to target-arm.next then.
>=20
> Where I've noted possible further cleanups, that's intended as
> an "if you like writing cleanup patches" thing -- you don't need
> to try to do them as part of this patch series.
>=20
> thanks
> -- PMM

Okay.  Happy to contribute!=20
Thanks!=

