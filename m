Received: by 10.25.208.137 with SMTP id h131csp1613233lfg;
        Mon, 16 May 2016 23:50:18 -0700 (PDT)
X-Received: by 10.140.43.166 with SMTP id e35mr25213214qga.72.1463467818238;
        Mon, 16 May 2016 23:50:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d90si1113678qgd.122.2016.05.16.23.50.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 23:50:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2Ypd-0001nD-Rf
	for alex.bennee@linaro.org; Tue, 17 May 2016 02:50:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <21521131@zju.edu.cn>) id 1b2Ypa-0001ip-Oj
	for qemu-arm@nongnu.org; Tue, 17 May 2016 02:50:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <21521131@zju.edu.cn>) id 1b2YpX-0003li-9b
	for qemu-arm@nongnu.org; Tue, 17 May 2016 02:50:14 -0400
Received: from [124.160.105.205] (port=37089 helo=zju.edu.cn)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <21521131@zju.edu.cn>) id 1b2YpW-0003hJ-HX
	for qemu-arm@nongnu.org; Tue, 17 May 2016 02:50:11 -0400
Received: by ajax-webmail-mailapp3 (Coremail) ; Tue, 17 May 2016 14:43:50
	+0800 (GMT+08:00)
Date: Tue, 17 May 2016 14:43:50 +0800 (GMT+08:00)
From: 21521131@zju.edu.cn
To: "Peter Maydell" <peter.maydell@linaro.org>
Message-ID: <79205621.29aa8.154bd74d3ab.Coremail.21521131@zju.edu.cn>
In-Reply-To: <CAFEAcA9uFmxf-Ddyut+1_YxTtqcgsXoWw5rkvFrCKkXGqRjm9A@mail.gmail.com>
References: <2b8f6d83.266f6.154b846f92c.Coremail.21521131@zju.edu.cn>
	<CAFEAcA9uFmxf-Ddyut+1_YxTtqcgsXoWw5rkvFrCKkXGqRjm9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.214.147.15]
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 4.0.8 dev build
	20150107(58648.7033.6860) Copyright (c) 2002-2016 www.mailtech.cn zju
X-CM-TRANSID: IQbKCkCZoMSmvTpXjPaaAA--.31802W
X-CM-SenderInfo: qsrvjiartrq6lmxovvfxof0/1tbiAguJf1ZdsxnzLAAwsx
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUb90S07vEb7Iv0x
	C_Ar1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
	bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
	CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
	z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wCS07vE84ACjcxK6I8E87Iv67AKxVW0oV
	Cq3wCS07vE84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DMIAIbVAS0I0E0xvYzxvE52x0
	82IY62kv0487MIAIbVAqx4xG64xvF2IEw4CE5I8CrVC2j2WlV2xY6cIj6xIIjxv20xvE14
	v26r1j6r18MIAIbVAv7VC2z280aVAFwI0_Jr0_Gr1lV2xY6cvjeVCFs4IE7xkEbVWUJVW8
	JwCS07vE7I0Y64k_MIAIbVCY0x0Ix7I2Y4AK64vIr41lV2xY6xCjnVCjjxCrMIAIbVCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwCS07vEx2IqxVAqx4xG67AKxVWUJVWUGwCS07vEx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlV2xY6I8E67AF67kF1VAFwI0_Jrv_JF1lV2xY6IIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lV2xY6IIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCS07vEIxAI
	cVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lV2xY6IIF0xvEx4A2jsIE14v26r1j6r4UMIAIbV
	CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 124.160.105.205
Subject: Re: [Qemu-arm] help! I have downloaded
 "debian-8.4.0-armel-CD-1.iso" from
 "http://get.debian.org/cdimage/release/current/armel/iso-cd/"
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jN74OIkJY417

Yes, you are right. Thank you for your answer.

GaoJin

=E5=9C=A82016-05-16 17:18:21,<21521131@zju.edu.cn>=E5=86=99=E9=81=93=EF=BC=
=9A
> On 16 May 2016 at 07:35,  <21521131@zju.edu.cn> wrote:
> > Hello! I have downloaded an iso image file from website
> > "http://get.debian.org/cdimage/release/current/armel/iso-cd/", I downlo=
aded
> > the "debian-8.4.0-armel-CD-1.iso", but i don't know how to use
> > qemu-system-arm to run it. Is it supported?
> > How to boot the iso image using qemu-system-arm?
>=20
> This sounds like a question to ask the Debian folks, not us.
> Whether you can boot this on one of QEMU's board models
> depends on what platforms Debian's armel CD supports
> (which you should be able to find in their release notes).
>=20
> thanks
> -- PMM
>=20
>=20


