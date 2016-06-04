Received: by 10.25.27.66 with SMTP id b63csp599528lfb;
        Sat, 4 Jun 2016 00:14:31 -0700 (PDT)
X-Received: by 10.140.220.209 with SMTP id q200mr7048816qhb.18.1465024471897;
        Sat, 04 Jun 2016 00:14:31 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 131si3673771qkf.60.2016.06.04.00.14.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Jun 2016 00:14:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b95mx-0001vH-CI
	for alex.bennee@linaro.org; Sat, 04 Jun 2016 03:14:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b95mB-0001Vw-A9
	for qemu-devel@nongnu.org; Sat, 04 Jun 2016 03:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b95m7-0004Js-1g
	for qemu-devel@nongnu.org; Sat, 04 Jun 2016 03:13:42 -0400
Received: from m12-11.163.com ([220.181.12.11]:60946)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b95m6-0004IS-AR; Sat, 04 Jun 2016 03:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Mime-Version:Subject:From:Date:Message-Id; bh=Hr7jb
	lwaIw16GOtrvbs1slgN2pVnRW3BkhbI7Irmjvw=; b=Zu7raEzrkYJ5/BQe183+x
	QVJlsyNEAnXl64nva3za69mGu/QSTPzM+t5jmmluCEwKDBuFR8zHS6ZGq1+Hs1tG
	pkpVHEhdqHZ2uyc1CAcxtrTTUTCmUP9jDwYbdKQSuhciWEd9BJ7UXXoNetZMYi86
	SOvMMS4urgjdkW6UopkzGg=
Received: from [192.168.199.233] (unknown [114.111.167.200])
	by smtp7 (Coremail) with SMTP id C8CowACXr+N+f1JX_FL+AQ--.13757S2;
	Sat, 04 Jun 2016 15:13:03 +0800 (CST)
Content-Type: text/plain;
	charset=gb2312
Mime-Version: 1.0 (1.0)
From: xiaoqiang zhao <zxq_yx_007@163.com>
X-Mailer: iPhone Mail (13F69)
In-Reply-To: <CAFEAcA-R6F+aEGadimis3j5UoH8pf-4na7eEMo_6Sv9gVMhLXg@mail.gmail.com>
Date: Sat, 4 Jun 2016 15:13:02 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <C0721449-AAA6-46C5-A4A4-A3CFB7CB728C@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA-R6F+aEGadimis3j5UoH8pf-4na7eEMo_6Sv9gVMhLXg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-CM-TRANSID: C8CowACXr+N+f1JX_FL+AQ--.13757S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWkGw13GF13Gr1DCw4fuFg_yoWftFcE9F
	W8Cayvg3ZrWr1ayFZ3Kr48JFyayF4agr9aqF4qqr4IqryfArZrJrnY9rWa9F1aywsxAr98
	Xry2q3W2ywnIvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUewID7UUUUU==
X-Originating-IP: [114.111.167.200]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMwB+xlXlgpgTmQAAsr
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.11
Subject: Re: [Qemu-devel] [PATCH 0/6] Drop the qemu_char_get_next_serial
 function
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
Cc: Rob Herring <robh@kernel.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?GB2312?B?p6Gn36fkp+Cn3yCnsafRp9On3afgp9M=?= <antonynpavlov@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aa0kQsb0YO8C



> =D4=DA 2016=C4=EA6=D4=C24=C8=D5=A3=AC02:24=A3=ACPeter Maydell <peter.mayde=
ll@linaro.org> =D0=B4=B5=C0=A3=BA
>=20
>> On 25 May 2016 at 11:58, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>> This patch series's main idea is to drop the use of
>> qemu_char_get_next_serial. patches 1-5 QOM'ify the related
>> device model and the affected board code. Most of them
>> are arm related. The patch 6 get rid of the function from
>> the code base.
>>=20
>> I only test the code with ARM versatilepb machine. The other
>> machine need test!
>>=20
>> xiaoqiang zhao (6):
>>  hw/char: QOM'ify pl011 model
>>  hw/char: QOM'ify cadence_uart model
>>  hw/char: QOM'ify digic-uart model
>>  hw/char: QOM'ify stm32f2xx_usart model
>>  hw/char: QOM'ify xilinx_uartlite model
>>  char: get rid of qemu_char_get_next_serial
>=20
> Hi; I'm afraid this patch series doesn't pass "make check"
> (it looks like we segfault trying to instantiate the raspi2
> board).
>=20
> thanks
> -- PMM
>=20

Will fix in the next version.=


