Received: by 10.25.208.194 with SMTP id h185csp116899lfg;
        Wed, 13 Apr 2016 11:42:02 -0700 (PDT)
X-Received: by 10.140.248.8 with SMTP id t8mr14087748qhc.50.1460572922036;
        Wed, 13 Apr 2016 11:42:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m79si26939041qgd.126.2016.04.13.11.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Apr 2016 11:42:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aqPjl-0007eU-Am
	for alex.bennee@linaro.org; Wed, 13 Apr 2016 14:42:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1aqPji-0007bi-Kn
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 14:41:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1aqPjf-0002Yo-AI
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 14:41:58 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:10825)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1aqPjf-0002YU-3G; Wed, 13 Apr 2016 14:41:55 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 61F0FDE605C29;
	Wed, 13 Apr 2016 19:41:48 +0100 (IST)
Received: from BADAG03.ba.imgtec.org (10.20.40.115) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 13 Apr 2016 19:41:52 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	badag03.ba.imgtec.org ([::1]) with mapi id 14.03.0266.001;
	Wed, 13 Apr 2016 11:41:48 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Aleksandar Markovic
	<aleksandar.markovic@rt-rk.com>
Thread-Topic: [Qemu-devel] [PATCH v4 1/9] softfloat: Implement
	run-time-configurable meaning of signaling NaN bit
Thread-Index: AQHRlLsD7sE3dk5nvEKtZ9tYdGK2y5+HIvWAgAEY2K0=
Date: Wed, 13 Apr 2016 18:41:48 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B8591692A9C@BADAG02.ba.imgtec.org>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460465891-6142-2-git-send-email-aleksandar.markovic@rt-rk.com>,
	<20160412184551.GC26803@thinpad.lan.raisama.net>
In-Reply-To: <20160412184551.GC26803@thinpad.lan.raisama.net>
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
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 1/9] softfloat: Implement
 run-time-configurable meaning of signaling NaN bit
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
Cc: "proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>, Maciej
	Rozycki <Maciej.Rozycki@imgtec.com>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kz8xY3Iffwqj

Hello, Eduardo,

I greatly appreciate your time spent on this matter and your unfailing atte=
ntion to detail.

For Alpha and Xtensa, this is for sure, they will zero their CPU objects, a=
s you hinted:

target-alpha/cpu.c:
  162          cpu_class =3D object_class_by_name(TYPE("ev67"));
  163      }
  164:     cpu =3D ALPHA_CPU(object_new(object_class_get_name(cpu_class)));
  165 =20
  166      object_property_set_bool(OBJECT(cpu), true, "realized", NULL);

target-xtensa/helper.c:
  125      }
  126 =20
  127:     cpu =3D XTENSA_CPU(object_new(object_class_get_name(oc)));
  128      env =3D &cpu->env;
  129 =20

So, I will remove their set_snan_bit_is_one(0) calls, as you suggested.

This leaves only ppc, s390x, and TriCore calling set_snan_bit_is_one(0) it =
this
patch series..

I'll take one more look at them tomorrow, and will get back to you.

Yours,
Aleksandar

________________________________________
From: Eduardo Habkost [ehabkost@redhat.com]
Sent: Tuesday, April 12, 2016 11:45 AM
To: Aleksandar Markovic
Cc: qemu-devel@nongnu.org; proljc@gmail.com; kbastian@mail.uni-paderborn.de=
; mark.cave-ayland@ilande.co.uk; agraf@suse.de; Maciej Rozycki; Petar Jovan=
ovic; blauwirbel@gmail.com; jcmvbkbc@gmail.com; Aleksandar Markovic; qemu-a=
rm@nongnu.org; qemu-ppc@nongnu.org; edgar.iglesias@gmail.com; Miodrag Dinic=
; pbonzini@redhat.com; gxt@mprc.pku.edu.cn; Leon Alrae; afaerber@suse.de; a=
urelien@aurel32.net; rth@twiddle.net
Subject: Re: [Qemu-devel] [PATCH v4 1/9] softfloat: Implement run-time-conf=
igurable meaning of signaling NaN bit

On Tue, Apr 12, 2016 at 02:58:03PM +0200, Aleksandar Markovic wrote:
[...]
>   4) Updated code for all platforms to reflect changes in SoftFloat libra=
ry.
>      This change is twofolds: it includes modifications of SoftFloat libr=
ary
>      functions invocations, and an addition of invocation of function
>      set_snan_bit_is_one() during CPU initialization, with arguments that
>      are appropriate for each particular platform.
>
>      In order to be at the same time accurate in relation to floating poi=
nt
>      arithmetics and consistent with a particular platform code, followin=
g
>      principle is adopted related to invocations of new function
>      set_snan_bit_is_one():
>
>      1. If a target platform doesn't use SoftFloat library, nothing is ad=
ded.
>             (cris, lm32, moxie)
>      2. Else, if a target platform's signaling bit meaning is "1 is
>         signaling", explicit invocation of set_snan_bit_is_one(1) is adde=
d.
>             (mips, sh4, unicore32)
>               (for mips this will change in the second patch of this
>               series, but this very patch leaves mips features as
>               they currently are.)
>      3. Else, if a target platform explicitly sets other fields of its
>         float_status structure(s), explicit invocation of
>         set_snan_bit_is_one(0) is added.
>             (ppc, s390x, tricore)
>      4. Else, if a target platform doesn't explicitly set its structure
>         CPUXXXState, explicit invocation of set_snan_bit_is_one(0) is add=
ed.
>             (alpha, xtensa)

The CPU struct is zeroed by object_new() when the CPU object is
created, so the field is already set to 0 by default on all
architectures. You shouldn't need set_snan_bit_is_one(0) calls on
CPU initialization on any architecture.


>      5. For remaining cases, nothing is added. (Those cases explicitly se=
t
>         their CPUXXXState/float_status structures to 0, and thus implicit=
ly
>         perform set_snan_bit_is_one(0).)
>             (arm, i386, m68k, microblaze, openrisc, sparc)
>

--
Eduardo=
