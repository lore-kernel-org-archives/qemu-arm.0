Received: by 10.25.208.211 with SMTP id h202csp2741298lfg;
        Wed, 30 Mar 2016 09:59:04 -0700 (PDT)
X-Received: by 10.140.233.135 with SMTP id e129mr11341424qhc.86.1459357137969;
        Wed, 30 Mar 2016 09:58:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f189si4521273qhc.12.2016.03.30.09.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Mar 2016 09:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1alJSL-0000Xo-JA
	for alex.bennee@linaro.org; Wed, 30 Mar 2016 12:58:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1alJRv-0000FG-SS
	for qemu-devel@nongnu.org; Wed, 30 Mar 2016 12:58:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1alJRq-0001yS-4J
	for qemu-devel@nongnu.org; Wed, 30 Mar 2016 12:58:31 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:12200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1alJRk-0001xD-5Z; Wed, 30 Mar 2016 12:58:20 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Websense Email Security Gateway with ESMTPS id 376D3F4F99FD5;
	Wed, 30 Mar 2016 17:58:11 +0100 (IST)
Received: from BADAG04.ba.imgtec.org (10.20.40.112) by HHMAIL01.hh.imgtec.org
	(10.100.10.19) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 30 Mar 2016 17:58:14 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	BADAG04.ba.imgtec.org ([fe80::b930:4082:95b0:e446%15]) with mapi id
	14.03.0266.001; Wed, 30 Mar 2016 09:58:10 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 1/2] softfloat: Enable
	run-time-configurable meaning of signaling NaN bit
Thread-Index: AQHRibng5w2DaWOZ8EqdChKJw2g9kZ9yNkYR
Date: Wed, 30 Mar 2016 16:58:09 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B859168E1CC@BADAG02.ba.imgtec.org>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>,
	<56FA79F9.60606@mail.uni-paderborn.de>
In-Reply-To: <56FA79F9.60606@mail.uni-paderborn.de>
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
	"rth@twiddle.net" <rth@twiddle.net>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>, Petar
	Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, Miodrag
	Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>, Leon
	Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"proljc@gmail.com" <proljc@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] softfloat: Enable
 run-time-configurable meaning of signaling NaN bit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cX8w36b5mz8R

Thank you very much. I will let you know if any change regarding tricore ap=
pears in later versions of this patch.=0A=
________________________________________=0A=
From: qemu-devel-bounces+aleksandar.markovic=3Dimgtec.com@nongnu.org [qemu-=
devel-bounces+aleksandar.markovic=3Dimgtec.com@nongnu.org] on behalf of Bas=
tian Koppelmann [kbastian@mail.uni-paderborn.de]=0A=
Sent: Tuesday, March 29, 2016 5:50 AM=0A=
To: Aleksandar Markovic; qemu-devel@nongnu.org=0A=
Cc: peter.maydell@linaro.org; ehabkost@redhat.com; proljc@gmail.com; mark.c=
ave-ayland@ilande.co.uk; agraf@suse.de; Petar Jovanovic; blauwirbel@gmail.c=
om; jcmvbkbc@gmail.com; Miodrag Dinic; qemu-arm@nongnu.org; qemu-ppc@nongnu=
.org; edgar.iglesias@gmail.com; pbonzini@redhat.com; gxt@mprc.pku.edu.cn; L=
eon Alrae; afaerber@suse.de; aurelien@aurel32.net; rth@twiddle.net=0A=
Subject: Re: [Qemu-devel] [PATCH 1/2] softfloat: Enable run-time-configurab=
le meaning of signaling NaN bit=0A=
=0A=
On 03/25/2016 01:50 PM, Aleksandar Markovic wrote:=0A=
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>=0A=
>=0A=
> This patch enables SoftFloat library to be configured at run-time in=0A=
> relation to the meaning of signaling NaN bit.=0A=
>=0A=
> Background:=0A=
>=0A=
> In floating-point calculations, there is a need for denoting undefined or=
=0A=
> unrepresentable values. This is achieved by defining certain floating-poi=
nt=0A=
> numerical values to be NaNs (which stands for "not a number"). For additi=
onal=0A=
> reasons, virtually all modern floating-point unit implementations use two=
=0A=
> kinds of NaNs: quiet and signaling. The binary representations of these t=
wo=0A=
> kinds of NaNs, as a rule, differ only in one bit (it is traditionally,=0A=
> the first bit of mantissa).=0A=
>=0A=
> Up to 2008, standards for floating-point did not specify all details abou=
t=0A=
> binary representation of NaNs. More specifically, the meaning of the bit=
=0A=
> that is used for distinguishing between signaling and quiet NaNs was not=
=0A=
> strictly prescribed. (IEEE 754-2008 was the first floating-point standard=
=0A=
> that defined that meaning clearly, see [1], p. 35) As a result, different=
=0A=
> platforms took different approaches, and this presented certain challenge=
=0A=
> in emulators like QEMU.=0A=
>=0A=
> Mips architecture represent the most complex case among QEMU-supported=0A=
> architectures regarding signaling NaN bit. Up to Release 6 of Mips=0A=
> architecture, "1" in signaling NaN bit denoted signaling NaN, which is=0A=
> opposite to IEEE 754-2008 standard. From Release 6 on, Mips architecture=
=0A=
> adopted IEEE standard prescription, and "0" denotes signaling NaN. On top=
 of=0A=
> that, Mips architecture for SIMD (also known as MSA, or vector instructio=
ns)=0A=
> also specifies signaling bit in accordance to IEEE standard. MSA unit can=
 be=0A=
> implemented with both pre-Release 6 and Release 6 main processor units.=
=0A=
>=0A=
> QEMU uses SoftFloat library to implement various floating-point-related=
=0A=
> instructions on all platforms. The current implementation allows for defi=
ning=0A=
> meaning of signaling NaN bit during build time, and is implemented via=0A=
> preprocessor macro called SNAN_BIT_IS_ONE.=0A=
>=0A=
> The change in this patch enables SoftFloat library to be configured in=0A=
> run-time. This configuration is meant to occur during CPU initialization,=
=0A=
> when it is definitely known what desired behavior for particular CPU=0A=
> (or any additional FPUs) is.=0A=
>=0A=
> The change is implemented so that it is consistent with existing=0A=
> implementation of similar cases. This means that structure float_status i=
s=0A=
> used for passing the information about desired signaling NaN bit during e=
ach=0A=
> invocation of SoftFloat functions. The additional field in float_status i=
s=0A=
> called snan_bit_is_one, which supersedes macro SNAN_BIT_IS_ONE.=0A=
>=0A=
> Further break down of changes:=0A=
>=0A=
>   (for the sake of brevity, a placeholder XXX is used below and it might=
=0A=
>   mean float16, float32, float64, floatx80, or float128)=0A=
>=0A=
>   1) Added field snan_bit_is_one to the structure float_status,=0A=
>      and the correspondent setter function set_snan_bit_is_one().=0A=
>=0A=
>   2) SoftFloat library constants XXX_default_nan converted to functions=
=0A=
>      XXX_default_nan(float_status*). This is necessary since they are=0A=
>      dependant on signaling bit meaning.=0A=
>=0A=
>   3) Added a float_status* argument to SoftFloat library functions=0A=
>      XXX_is_quiet_nan(XXX a_), XXX_is_signaling_nan(XXX a_),=0A=
>      XXX_maybe_silence_nan(XXX a_).=0A=
>=0A=
>   4) Updated code in all architectures to reflect changes in SoftFloat=0A=
>      library. This change is twofolds: it includes modification of SoftFl=
oat=0A=
>      library functions invocations, and addition of invocations of functi=
on=0A=
>      set_snan_bit_is_one() during CPU initialization, with arguments that=
=0A=
>      are appropriate for each architecture.=0A=
>=0A=
> IMPORTANT:=0A=
>=0A=
> This change is not meant to create any change in emulator behavior or=0A=
> functionality on any platform. It just provides the means for SoftFloat=
=0A=
> library to be used in a more flexible way - in other words, it will just=
=0A=
> prepare SoftFloat library for usage related to Mips platform and its=0A=
> specifics regarding signaling bit meaning, which is done in the next patc=
h.=0A=
>=0A=
> [1] "IEEE Standard for Floating-Point Arithmetic",=0A=
>     IEEE Computer Society, August 29, 2008.=0A=
>     (http://www.csee.umbc.edu/~tsimo1/CMSC455/IEEE-754-2008.pdf)=0A=
>=0A=
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>=0A=
> ---=0A=
>  fpu/softfloat-specialize.h    | 546 +++++++++++++++++++++---------------=
------=0A=
>  fpu/softfloat.c               | 170 +++++++------=0A=
>  include/fpu/softfloat.h       |  49 ++--=0A=
>  target-alpha/cpu.c            |   2 +=0A=
>  target-arm/cpu.c              |   2 +=0A=
>  target-arm/helper-a64.c       |  14 +-=0A=
>  target-arm/helper.c           |  40 ++--=0A=
>  target-i386/cpu.c             |   4 +=0A=
>  target-m68k/cpu.c             |   2 +=0A=
>  target-m68k/helper.c          |   6 +-=0A=
>  target-microblaze/cpu.c       |   2 +=0A=
>  target-microblaze/op_helper.c |   6 +-=0A=
>  target-mips/helper.h          |   4 +-=0A=
>  target-mips/msa_helper.c      |  96 ++++----=0A=
>  target-mips/op_helper.c       |  13 +-=0A=
>  target-mips/translate.c       |   4 +-=0A=
>  target-mips/translate_init.c  |   6 +-=0A=
>  target-openrisc/cpu.c         |   2 +=0A=
>  target-ppc/fpu_helper.c       | 120 +++++-----=0A=
>  target-ppc/translate_init.c   |   2 +=0A=
>  target-s390x/cpu.c            |   1 +=0A=
>  target-s390x/fpu_helper.c     |  28 ++-=0A=
>  target-s390x/helper.h         |   6 +-=0A=
>  target-s390x/translate.c      |   6 +-=0A=
>  target-sh4/cpu.c              |   1 +=0A=
>  target-sparc/cpu.c            |   1 +=0A=
>  target-tricore/helper.c       |   1 +=0A=
>  target-unicore32/cpu.c        |   1 +=0A=
>  target-xtensa/cpu.c           |   3 +=0A=
>  29 files changed, 608 insertions(+), 530 deletions(-)=0A=
>=0A=
=0A=
For the TriCore part you can have a=0A=
=0A=
Tested-by: Bastian Koppelmann<kbastian@mail.uni-paderborn.de>=0A=
=0A=
Cheers,=0A=
Bastian=0A=
=0A=
=0A=
