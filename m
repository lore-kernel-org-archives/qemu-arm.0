Received: by 10.25.208.194 with SMTP id h185csp522820lfg;
        Thu, 14 Apr 2016 03:52:48 -0700 (PDT)
X-Received: by 10.140.33.161 with SMTP id j30mr17179192qgj.37.1460631168128;
        Thu, 14 Apr 2016 03:52:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d82si17095644qka.123.2016.04.14.03.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Apr 2016 03:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aqetC-0006Vb-F5
	for alex.bennee@linaro.org; Thu, 14 Apr 2016 06:52:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aqet9-0006T0-FQ
	for qemu-arm@nongnu.org; Thu, 14 Apr 2016 06:52:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aqet6-0001RZ-MY
	for qemu-arm@nongnu.org; Thu, 14 Apr 2016 06:52:43 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:29371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1aqet6-0001RM-HF; Thu, 14 Apr 2016 06:52:40 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 959D7E01C6B3A;
	Thu, 14 Apr 2016 11:52:36 +0100 (IST)
Received: from [192.168.169.37] (192.168.169.37) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Thu, 14 Apr 2016 11:52:38 +0100
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	<qemu-devel@nongnu.org>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460465891-6142-8-git-send-email-aleksandar.markovic@rt-rk.com>
From: Leon Alrae <leon.alrae@imgtec.com>
Message-ID: <570F7670.4060303@imgtec.com>
Date: Thu, 14 Apr 2016 11:52:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1460465891-6142-8-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="utf-8"
X-Originating-IP: [192.168.169.37]
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v4 7/9] target-mips: Add abs2008 flavor of
 <ABS|NEG>.<S|D>
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
Cc: proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, afaerber@suse.de,
	aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zt3H7n6dfpYs

On 12/04/16 13:58, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
>=20
> Updated handling of instuctions <ABS|NEG>.<S|D>. Note that legacy
> (pre-abs2008) ABS and NEG instructions are arithmetic (any NaN operand
> signals invalid operation), while abs2008 ones are non-arithmetic, alwa=
ys
> changing the sign bit, even for NaN-like operands. Details on these
> instructions are documented in [1] p. 35 and 359.
>=20
> [1] "MIPS=C2=AE Architecture For Programmers Volume II-A:
>     The MIPS64=C2=AE Instruction Set Reference Manual",
>     Imagination Technologies LTD, Revision 6.04, November 13, 2015
>=20
> Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
> Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> ---
>  target-mips/translate.c |   27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
>=20
> diff --git a/target-mips/translate.c b/target-mips/translate.c
> index de0b224..1d376fc 100644
> --- a/target-mips/translate.c
> +++ b/target-mips/translate.c
> @@ -1434,6 +1434,8 @@ typedef struct DisasContext {
>      bool vp;
>      bool cmgcr;
>      bool mrp;
> +    bool abs2008;
> +

Blank line. Otherwise:

Reviewed-by: Leon Alrae <leon.alrae@imgtec.com>

Regards,
Leon

