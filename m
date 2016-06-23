Received: by 10.25.21.96 with SMTP id l93csp434371lfi;
        Thu, 23 Jun 2016 03:04:03 -0700 (PDT)
X-Received: by 10.55.186.193 with SMTP id k184mr44139705qkf.184.1466676243409;
        Thu, 23 Jun 2016 03:04:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d6si4883698qtd.124.2016.06.23.03.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 03:04:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:35629 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG1UQ-0004np-Qw
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 06:04:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG1UI-0004kt-A6
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 06:04:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG1UD-00068U-5E
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 06:03:53 -0400
Received: from forward2j.cmail.yandex.net ([5.255.227.20]:42295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bG1UB-00062s-Kb; Thu, 23 Jun 2016 06:03:49 -0400
Received: from mxback5j.mail.yandex.net (mxback5j.mail.yandex.net
	[5.45.198.19])
	by forward2j.cmail.yandex.net (Yandex) with ESMTP id 1816720F7B;
	Thu, 23 Jun 2016 13:03:33 +0300 (MSK)
Received: from web21j.yandex.ru (web21j.yandex.ru [5.45.198.62])
	by mxback5j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	D6EebyiVv4-3W103Wbr; Thu, 23 Jun 2016 13:03:32 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1466676212; bh=KPdQSFcUIorgMJAM0ANT/KX7Q5sYcHh93U7TYAjHyNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	X-Mailer:Date:Content-Transfer-Encoding:Content-Type;
	b=lIRowEbRT/s5GWIBOTz/wK+OWG7b2yZiI5dTmr+gtQgv1dT2Fi0MvuV7jwXQ/rkGk
	99v7M7OZe+iOY6CduSa8DYvJTA0hyzPWi+/CrnkRB6XjpRE3ymC4ep1H6psasfhNdp
	ZRNIwqGDRnIXq3RehCvspCnoh0AxrosTlfL0nTp8=
Authentication-Results: mxback5j.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web21j.yandex.ru with HTTP;
	Thu, 23 Jun 2016 13:03:32 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Richard Henderson <rth@twiddle.net>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <6c24c820-4a26-848c-e62d-88ebce59125d@twiddle.net>
References: <1466599029-3388432-1-git-send-email-afarallax@yandex.ru>
	<5d86b8ba-16e8-e94d-ba7f-e865cbcc938e@twiddle.net>
	<1793281466613020@web5h.yandex.ru>
	<6c24c820-4a26-848c-e62d-88ebce59125d@twiddle.net>
MIME-Version: 1.0
Message-Id: <201241466676212@web21j.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 23 Jun 2016 13:03:32 +0300
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.227.20
Subject: Re: [Qemu-arm] [PATCH v2] Improve the alignment check infrastructure
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
Cc: Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yIqT5/KWdgO2

So what's wrong in this part of the patch?

22.06.2016, 20:12, "Richard Henderson" <rth@twiddle.net>:
> On 06/22/2016 09:30 AM, Sergey Sorokin wrote:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0diff --git a/tcg/ppc/tcg-target.i=
nc.c b/tcg/ppc/tcg-target.inc.c
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0index da10052..3dc38fa 100644
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--- a/tcg/ppc/tcg-target.inc.c
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+++ b/tcg/ppc/tcg-target.inc.c
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0@@ -1399,6 +1399,7 @@ static TCGR=
eg tcg_out_tlb_read(TCGContext *s,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0TCGMemOp opc,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int=
 add_off =3D offsetof(CPUArchState, tlb_table[mem_index][0].addend);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0TCG=
Reg base =3D TCG_AREG0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0TCG=
MemOp s_bits =3D opc & MO_SIZE;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+ int a_bits =3D get_alignment_bi=
ts(opc);
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* =
Extract the page index, shifted into place for tlb index. */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if =
(TCG_TARGET_REG_BITS =3D=3D 64) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0@@ -1456,14 +1457,21 @@ static TC=
GReg tcg_out_tlb_read(TCGContext *s,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0TCGMemOp opc,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* the bottom bits and thus trigger a compariso=
n failure on
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* unaligned accesses
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+ if (a_bits > 0) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+ tcg_debug_assert((((1 << a_bits=
) - 1) & TLB_FLAGS_MASK) =3D=3D 0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+ } else {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+ a_bits =3D s_bits;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+ }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0tcg_out_rlw(s, RLWINM, TCG_REG_R0, addrlo, 0,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+ (32 - a_bits) & 31, 31 - TARGET=
_PAGE_BITS);
>>>
>>> =C2=A0ppc32 can certainly support over-alignment, just like every oth=
er target. It's
>>> =C2=A0just that there are some 32-bit parts that don't support unalig=
ned accesses.
>>
>> =C2=A0I don't understand your point here.
>
> ppc32 can support a_bits > s_bits.
>
> r~
