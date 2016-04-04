Received: by 10.25.208.211 with SMTP id h202csp1220609lfg;
        Mon, 4 Apr 2016 09:10:52 -0700 (PDT)
X-Received: by 10.55.41.16 with SMTP id p16mr17197392qkh.86.1459786252213;
        Mon, 04 Apr 2016 09:10:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2si22812258qkb.17.2016.04.04.09.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 09:10:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an75X-0001ph-K8
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 12:10:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1an75P-0001oC-KR
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 12:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1an75K-0002qF-7s
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 12:10:43 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:2332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1an75K-0002q0-1h; Mon, 04 Apr 2016 12:10:38 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email Security Gateway with ESMTPS id CA79447DDE52B;
	Mon,  4 Apr 2016 17:10:33 +0100 (IST)
Received: from [192.168.169.37] (192.168.169.37) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Mon, 4 Apr 2016 17:10:36 +0100
To: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>, Aleksandar Markovic
	<aleksandar.markovic@rt-rk.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
	<56FEC5D1.8020908@imgtec.com>
	<EF5FA6C3467F85449672C3E735957B859168F4EA@BADAG02.ba.imgtec.org>
From: Leon Alrae <leon.alrae@imgtec.com>
Message-ID: <570291F0.1010108@imgtec.com>
Date: Mon, 4 Apr 2016 17:10:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <EF5FA6C3467F85449672C3E735957B859168F4EA@BADAG02.ba.imgtec.org>
Content-Type: text/plain; charset="windows-1252"
X-Originating-IP: [192.168.169.37]
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"ehabkost@redhat.com" <ehabkost@redhat.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"rth@twiddle.net" <rth@twiddle.net>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	"afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"proljc@gmail.com" <proljc@gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] softfloat: Enable
 run-time-configurable meaning of signaling NaN bit
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
X-TUID: EOGYe1iUun0I

On 03/04/16 15:25, Aleksandar Markovic wrote:
> It just seems to me that, in similar case, 16-bit default NaN value sho=
uld be 0x7E00. This value is needed for MSA operations. ("MIPS Architectu=
re for Programmers Volume IV-j: The MIPS32=AE SIMD Architecture Module", =
Revision 1.12, (february 3, 2016), page 52, table 3.7 "Default NaN Encodi=
ngs")
>=20
> I plan to include all three corrections in the next version of this pat=
ch set. Please, let me know if you think that I should not.

Great, thanks.

Also, the pickNaNMulAdd() for MIPS requires updating to match "3.5.3 NaN
Propagation" from the same MSA doc:
"When two or three operands are NaN, the payload of the resulting NaN is
identical to the payload of one of the input NaNs selected from left to
right as described by the instruction format".
This indicates the "c, a, b" order instead of "a, b, c" which is
currently implemented.

Regards,
Leon

