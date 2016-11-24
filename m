Received: by 10.25.150.194 with SMTP id y185csp187136lfd;
        Thu, 24 Nov 2016 06:29:33 -0800 (PST)
X-Received: by 10.55.67.132 with SMTP id q126mr2421115qka.132.1479997773112;
        Thu, 24 Nov 2016 06:29:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4si22614334qka.218.2016.11.24.06.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Nov 2016 06:29:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9v1o-00077j-I3
	for alex.bennee@linaro.org; Thu, 24 Nov 2016 09:29:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1c9v1d-00076V-3v
	for qemu-arm@nongnu.org; Thu, 24 Nov 2016 09:29:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1c9v1Z-0001A2-3A
	for qemu-arm@nongnu.org; Thu, 24 Nov 2016 09:29:21 -0500
Received: from 16.mo7.mail-out.ovh.net ([46.105.72.216]:55933)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1c9v1Y-00017r-TV
	for qemu-arm@nongnu.org; Thu, 24 Nov 2016 09:29:17 -0500
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id DF84421746
	for <qemu-arm@nongnu.org>; Thu, 24 Nov 2016 15:29:13 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player697.ha.ovh.net (Postfix) with ESMTPSA id 84BF848008D;
	Thu, 24 Nov 2016 15:29:11 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1471946352-20779-1-git-send-email-clg@kaod.org>
	<CAFEAcA_+tECGsnVnp7YKYFXWZDoi9n7mQRjFAoWGZ6hRs2FFpQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f5ef5137-47a3-c345-ae34-0893e20de116@kaod.org>
Date: Thu, 24 Nov 2016 15:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_+tECGsnVnp7YKYFXWZDoi9n7mQRjFAoWGZ6hRs2FFpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 17958384990252862384
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdelgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.72.216
Subject: Re: [Qemu-arm] [PATCH] target-arm: Add VBAR support to ARM1176 CPUs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N8z2DYj+wVIz

On 09/05/2016 04:39 PM, Peter Maydell wrote:
> On 23 August 2016 at 10:59, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> ARM1176 CPUs support the Vector Base Address Register but currently,
>> qemu only supports VBAR on ARMv7 CPUs. Fix this by adding a new
>> feature ARM_FEATURE_VBAR which is used for ARMv7 and ARM1176 CPUs.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> This looks mostly good; one question below.

Sorry for the late answer. I was drilling down through PPC with=20
the initial support of the pnv machine.=20

For 2.9, I would like to send a couple of fixes for the Aspeed =20
machines, this is one of them and I feel I didn't choose the=20
easiest path to enter the ARM world :)

>> Index: qemu-aspeed.git/target-arm/cpu.h
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- qemu-aspeed.git.orig/target-arm/cpu.h
>> +++ qemu-aspeed.git/target-arm/cpu.h
>> @@ -1129,6 +1129,7 @@ enum arm_features {
>>      ARM_FEATURE_V8_SHA256, /* implements SHA256 part of v8 Crypto Ext=
ensions */
>>      ARM_FEATURE_V8_PMULL, /* implements PMULL part of v8 Crypto Exten=
sions */
>>      ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodi=
ngs */
>> +    ARM_FEATURE_VBAR, /* has cp15 VBAR (ARM1176) */
>=20
> you don't need the bit in brackets, I think (it's not complete
> anyway, since v7+ also has this).

ok.

>>  };
>>
>>  static inline int arm_feature(CPUARMState *env, int feature)
>> Index: qemu-aspeed.git/target-arm/cpu.c
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- qemu-aspeed.git.orig/target-arm/cpu.c
>> +++ qemu-aspeed.git/target-arm/cpu.c
>> @@ -584,6 +584,7 @@ static void arm_cpu_realizefn(DeviceStat
>>          set_feature(env, ARM_FEATURE_LPAE);
>>      }
>>      if (arm_feature(env, ARM_FEATURE_V7)) {
>> +        set_feature(env, ARM_FEATURE_VBAR);
>>          set_feature(env, ARM_FEATURE_VAPA);
>>          set_feature(env, ARM_FEATURE_THUMB2);
>>          set_feature(env, ARM_FEATURE_MPIDR);
>> @@ -867,6 +868,7 @@ static void arm1176_initfn(Object *obj)
>>
>>      cpu->dtb_compatible =3D "arm,arm1176";
>>      set_feature(&cpu->env, ARM_FEATURE_V6K);
>> +    set_feature(&cpu->env, ARM_FEATURE_VBAR);
>>      set_feature(&cpu->env, ARM_FEATURE_VFP);
>>      set_feature(&cpu->env, ARM_FEATURE_VAPA);
>>      set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
>=20
> Is it sufficient to set ARM_FEATURE_VBAR in the realizefn
> if FEATURE_V7 or FEATURE_EL3? (watch out that realizefn
> may change the value of the FEATURE_EL3 bit partway down
> so you'd need to do the check there) ?

It looks like it, yes.=20

The addition of the VBAR only depends on ARM_FEATURE_VBAR=20
bit which is set for 1176 and V7. I followed the pattern=20
used by ARM_FEATURE_V6K. FEATURE_EL3 does not come in play
but may be it should indeed, see below.

> We implement VBAR in v7-without-EL3 even though architecturally
> it should only exist in v7-with-EL3 because we have some
> legacy board models which we implement as without-EL3 but
> where the guest (Linux) assumes it's running on a with-EL3
> CPU in NS mode. I'd rather we stick to the architectural
> definition for 1176 if we can rather than expanding the
> "things we do which aren't architectural" set if there's
> no legacy config that requires it. (If it is necessary
> to define it for 1176 always then that's OK, I'd just
> prefer not to unless we know we have to.)

According to the ARM spec, 1176 is a v6 with a couple of=20
extensions, among which v6k and TrustZone. So it has Secure=20
and Non-Secure VBAR and MVBAR registers.

Looking at :

  https://en.wikipedia.org/wiki/List_of_ARM_microarchitectures

May be, we should instead introduce a new ARMv6Z architecture=20
for the 1176 cpu which would represent a ARMv6 + TrustZone ?


But I am a bit confused with this EL3 feature. 1176 does not=20
have EL3 to my understanding (I am beyond my ARM skills there).
So why is it part of the feature list in arm1176_initfn ?=20
Is that a way to define the MVBAR and SCR regs ?=20

Should we define VBAR under el3_cp_reginfo and not under=20
v7_cp_reginfo then ?=20

> We should probably also have a brief comment noting that
> we define VBAR always in v7, even though architecturally
> it doesn't exist in non-EL3 configs, for the benefit of
> legacy board models.

ok. I can add that.

Thanks,

C.=20

> (In v8 VBAR is required whether EL3 is implemented or not.)
>=20
> thanks
> -- PMM
>=20

