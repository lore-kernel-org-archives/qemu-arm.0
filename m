Received: by 10.25.208.211 with SMTP id h202csp1134181lfg;
        Mon, 4 Apr 2016 06:21:32 -0700 (PDT)
X-Received: by 10.55.79.5 with SMTP id d5mr33515399qkb.30.1459776092655;
        Mon, 04 Apr 2016 06:21:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z78si22238586qkz.49.2016.04.04.06.21.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 06:21:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an4Rg-0000p1-4t
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 09:21:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1an4RX-0000oO-MH
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 09:21:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1an4RR-0003BL-Ft
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 09:21:23 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:32176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1an4RR-0003BF-6G; Mon, 04 Apr 2016 09:21:17 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Websense Email Security Gateway with ESMTPS id 13DDE49AD461B;
	Mon,  4 Apr 2016 14:21:13 +0100 (IST)
Received: from BADAG01.ba.imgtec.org (10.20.40.113) by HHMAIL01.hh.imgtec.org
	(10.100.10.19) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Mon, 4 Apr 2016 14:21:15 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	BADAG01.ba.imgtec.org ([fe80::8c38:df2b:fd93:33d3%14]) with mapi id
	14.03.0266.001; Mon, 4 Apr 2016 06:21:11 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Richard Henderson <rth@twiddle.net>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 1/2] softfloat: Enable
	run-time-configurable meaning of signaling NaN bit
Thread-Index: AQHRiTn1NbDGT6IVBEOe7v6ZuxAy1J950y3G
Date: Mon, 4 Apr 2016 13:21:10 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B859168FB0A@BADAG02.ba.imgtec.org>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>,
	<56F9A3D1.2050402@twiddle.net>
In-Reply-To: <56F9A3D1.2050402@twiddle.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.117.201.26]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"ehabkost@redhat.com" <ehabkost@redhat.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>, Petar
	Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, Miodrag
	Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>, Leon
	Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
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
X-TUID: B6ayXIYm2n8X

Hello, Richard.

I truly appreciate your guidance, it is of tremendous help to me.

I plan to address all issues you brought up in this mail in the V2 of my pa=
tch series.

All is clear to me, except some subtleties regarding initialization of plat=
forms.
More specifically, for setting snan bit, I adopted this principle.

1. If target platform doesn't use SoftFloatLibrary, nothing is added.
      (cris, lm32, moxie)
2. Else, if target platform's signalling bit meaning is "1 is signalling",
   explicit invocation of set_snan_bit_is_one(1) is added.
      (mips, sh4, unicore32)
         (for mips this will change in the second patch of this series,
         but this very patch leaves mips features as they currently are.)
3. Else, if target platform explicitely sets other fields of its
   float_status structure(s), explicit invocation of
   set_snan_bit_is_one(0) is added.
      (arm, ppc, s390x, tricore)
4. Else, if target platform doesn't exlpcitely sets its structure CPUXXXSta=
te,
   explicit invocation of set_snan_bit_is_one(0) is added.
      (alpha, xtensa)
5. For remaining cases, nothing is added. (Those cases explicitely set
   their CPUXXXState to 0, and implicitly perform set_snan_bit_is_one(0).)
      (i386, m68k, microblaze, openrisc, sparc)

By platforms, this looks like following:

A. alpha - structure CPUAlphaState not explicitely set to 0s,
      explicit invocation of set_snan_bit_is_one(0) added
B. arm - explicitely sets other fields of float_status,
      explicit invocation of set_snan_bit_is_one(0) added
C. cris - does not use SoftFloat library, nothing added
D. i386 - structure CPUX86State explicitely set to 0s,
      nothing added (implicit set_snan_bit_is_one(0))
E. lm32 - does not use SoftFloat library, nothing added
F. m68k - structure CPUM68KState explicitely set to 0s,
      nothing added (implicit set_snan_bit_is_one(0))
G. microblaze - structure CPUMBState explicitely set to 0s,
      nothing added (implicit set_snan_bit_is_one(0))
H. mips - must explicitely invoke set_snan_bit_is_one(1)
I. moxie - does not use SoftFloat library, nothing added
J. openrisc - structure CPUOpenRISCState explicitely set to 0s,
      nothing added (implicit set_snan_bit_is_one(0))
K. ppc - explicitely sets other fields of float_status,
      explicit invocation of set_snan_bit_is_one(0) added
L. s390x - explicitely sets other fields of float_status,
      explicit invocation of set_snan_bit_is_one(0) added
M. sh4 - must explicitely invoke set_snan_bit_is_one(1)
N. sparc - structure CPUSPARCState explicitely set to 0s,
      nothing added (implicit set_snan_bit_is_one(0))
O. tricore - explicitely sets other fields of float_status,
      explicit invocation of set_snan_bit_is_one(0) added
P. unicore32 - must explicitely invoke set_snan_bit_is_one(1)
Q. xtensa - structure CPUXtensaState not explicitely set to 0s,
      explicit invocation of set_snan_bit_is_one(0) added

Does such approach look OK to you?

Feightfully yours,
Aleksandar



________________________________________
From: qemu-devel-bounces+aleksandar.markovic=3Dimgtec.com@nongnu.org [qemu-=
devel-bounces+aleksandar.markovic=3Dimgtec.com@nongnu.org] on behalf of Ric=
hard Henderson [rth@twiddle.net]
Sent: Monday, March 28, 2016 2:36 PM
To: Aleksandar Markovic; qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org; ehabkost@redhat.com; kbastian@mail.uni-paderb=
orn.de; mark.cave-ayland@ilande.co.uk; agraf@suse.de; Petar Jovanovic; blau=
wirbel@gmail.com; jcmvbkbc@gmail.com; Miodrag Dinic; qemu-arm@nongnu.org; q=
emu-ppc@nongnu.org; edgar.iglesias@gmail.com; pbonzini@redhat.com; gxt@mprc=
.pku.edu.cn; Leon Alrae; afaerber@suse.de; aurelien@aurel32.net; proljc@gma=
il.com
Subject: Re: [Qemu-devel] [PATCH 1/2] softfloat: Enable run-time-configurab=
le meaning of signaling NaN bit

On 03/25/2016 05:50 AM, Aleksandar Markovic wrote:
> +float16 float16_default_nan(float_status *status) {

{ on the next line.

> +        return const_float64(LIT64( 0xFFF8000000000000 ));

Let's please fix the horrible formatting in this file as we touch the lines=
,
please.

> -#define floatx80_default_nan_high 0x7FFF
> -#define floatx80_default_nan_low  LIT64(0xBFFFFFFFFFFFFFFF)
> -#else
> -#define floatx80_default_nan_high 0xFFFF
> -#define floatx80_default_nan_low  LIT64( 0xC000000000000000 )
> -#endif
> +uint16_t floatx80_default_nan_high(float_status *status) {
> +uint64_t floatx80_default_nan_low(float_status *status) {

Why do you need two separate functions for this?

> +floatx80 floatx80_default_nan(float_status *status) {

Seems to me this one is good enough, and indeed preferable.

> -#define float128_default_nan_high LIT64(0x7FFF7FFFFFFFFFFF)
> -#define float128_default_nan_low  LIT64(0xFFFFFFFFFFFFFFFF)
...
> +float128 float128_default_nan(float_status *status) {

Likewise.


> diff --git a/target-alpha/cpu.c b/target-alpha/cpu.c
> index 2eab060..1714387 100644
> --- a/target-alpha/cpu.c
> +++ b/target-alpha/cpu.c
> @@ -277,6 +277,8 @@ static void alpha_cpu_initfn(Object *obj)
>   #endif
>       env->lock_addr =3D -1;
>       env->fen =3D 1;
> +
> +    set_snan_bit_is_one(0, &env->fp_status);

We've just done a memset of (most of) the entire cpu struct.  We don't need=
 to
re-initialize this field to zero here.  Same with most of the other cpus.


r~
