Received: by 10.25.208.211 with SMTP id h202csp1124935lfg;
        Mon, 22 Feb 2016 03:26:46 -0800 (PST)
X-Received: by 10.140.221.16 with SMTP id r16mr6045676qhb.67.1456140406459;
        Mon, 22 Feb 2016 03:26:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e5si29141267qkb.92.2016.02.22.03.26.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 03:26:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:48546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXodZ-0003au-PG
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 06:26:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXodX-0003ZQ-Lx
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 06:26:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXodW-0004d6-OB
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 06:26:43 -0500
Received: from m12-18.163.com ([220.181.12.18]:33677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXodQ-0004cI-9T; Mon, 22 Feb 2016 06:26:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Mime-Version:Subject:From:Date:Message-Id; bh=zddTN
	CJrz1xTyGczgx+juSqrMqUx+BYcQrFtuPQKEPU=; b=NGlB1snsAhH1lMxM9YKHU
	og7mGAlIWoNA9OEtKaGbL67svtlr0966yBN9WVkua6vnwidjMzZBNr3J4VuSX42t
	RmecGEgeXZXMVnhnIs2Rbu0pjfnJQEXWtAvdkYq9PuFeHEOqoFfK/3t3gDe5m3Cm
	8RAfyQua8ZGMnYQqqaj2TU=
Received: from [10.81.21.67] (unknown [117.136.0.165])
	by smtp14 (Coremail) with SMTP id EsCowEDZCkRE8MpWei0DAA--.2767S3;
	Mon, 22 Feb 2016 19:25:57 +0800 (CST)
Content-Type: text/plain;
	charset=gb2312
Mime-Version: 1.0 (1.0)
From: xiaoqiang zhao <zxq_yx_007@163.com>
X-Mailer: iPhone Mail (13D15)
In-Reply-To: <CAFEAcA-nbrRN7ecP9G4O-bj=K-NtKoOQXpxGygKMPgxpgxQvBA@mail.gmail.com>
Date: Mon, 22 Feb 2016 19:25:16 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <815FFF36-5332-4C3E-98D6-7126A841BE1F@163.com>
References: <1456132310-4826-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA-sDDj=kKmQnru0nfrjuHSjD8KDzO-PWGd0ia3GMZrEdg@mail.gmail.com>
	<56CAE2DB.3080702@163.com>
	<CAFEAcA-nbrRN7ecP9G4O-bj=K-NtKoOQXpxGygKMPgxpgxQvBA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-CM-TRANSID: EsCowEDZCkRE8MpWei0DAA--.2767S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF1fWFW3tF4UCr1fZF4DXFb_yoW8GrWDpF
	Z3G3W0kr4Dtr1xurs29rWIyaySkr4kG3429ryUta4FyFWYqry5tFWkta13Za93GFyS9w4j
	qa1YywnxCw4jkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUrcfUUUUU=
X-Originating-IP: [117.136.0.165]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTAUXxlSINf9pXQAAs6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v4 5/9] hw/timer: QOM'ify m48txx_sysbus (pass
	2)
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
X-TUID: ytXPJuYM5oYT


>> =D4=DA 2016=C4=EA2=D4=C222=C8=D5=A3=AC19:03=A3=ACPeter Maydell <peter.may=
dell@linaro.org> =D0=B4=B5=C0=A3=BA
>>=20
>>> On 22 February 2016 at 10:28, hitmoon <zxq_yx_007@163.com> wrote:
>>> =D4=DA 2016=C4=EA02=D4=C222=C8=D5 17:24, Peter Maydell =D0=B4=B5=C0:
>>> Just noticed this won't work as it is -- the vmstate
>>> struct is for the M48t59State*, but the ISA and
>>> Sysbus wrappers have their own structs which are
>>> what the dc->vmsd will be wanting to operate on.
>>> You'd need extra VMState structs I think and
>>> somebody who knows migration better than me to say
>>> whether that is a migration compat break.
>=20
>> It seems that the old code also use the same vmstate structure. Maybe it'=
s a
>> common structure which will not be used at the same time.
>=20
> The old code passes vmstate_register() a pointer to the
> M48t59State, and so the offsets in the vmstate line up correctly
> with the fields it wants to access. If you use dc->vmsd then the
> pointer that is (implicitly) used is the pointer to the device
> structure itself, which is not the same address as the
> M48t59State embedded inside that struct.
>=20
> You'd basically need to have extra VMState structures for the
> devices themselves which just said "inside this M48txxISAState
> is an M48t59State", and "inside this M48txxSysBusState is a
> M48t59State" and referred to the existing vmstate for the
> M48t59State.
>=20
> thanks
> -- PMM

I will have a closer look.=

