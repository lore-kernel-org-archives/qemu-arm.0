Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5134613wrt;
        Sat, 1 Dec 2018 12:55:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VRq3WeSwLgwTPS+JNPk6OPUFJtEurkGJ5eIblkaM+fq5PY3o0Dxyo1tqiCFhQlYGcCiBqg
X-Received: by 2002:a25:bc0a:: with SMTP id i10-v6mr10385021ybh.150.1543697732891;
        Sat, 01 Dec 2018 12:55:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543697732; cv=none;
        d=google.com; s=arc-20160816;
        b=FTIdGYUqD1BTWmgVU8HA33exWasp3g9LIIWUwYftTSTXJNcpAmgDo6nBhYWkRZNlO8
         9C+RkqtYqtqM+kQUxrzSCWaz2E+Fcpy5DVE90ph3J5fAZDiGXp0F6EWc2RNmbDPmfBBZ
         TuGzfnGVx/5/mpHpycXYEDpwxWbHLi/vdtxmBNutGOQvo4tGPSP7UKMVimUPIsUfouh6
         ZP9d9xog9hVuFRo5+xTWtFrvzh73TzXmkCkFxKbXzCFW+4YapCzy1Nf3Vts69gs3UAjs
         CRTt0rd18F1ADmpp5ee0GrIoVBXjVQ5TFxVuHx5+4ote+ElHf7XivOhseZyH9CBPHowN
         yYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=S3m6ymC10SOBgDu6te+UJ9YAUctyb3N4XZMJRc5sjW0=;
        b=Pz7lYX2w2KwMmzUREELrdP2JGS7ZYcAwhbJVRcBWd89riuz3VNDp5uUDYwfXIIDrB9
         1GStkLcPNFbU2POK0WXeviM5/zAMK83kZx27VYxrAF64XLsl2GTGk0yOui3ravuQfEPx
         Kq7a+4NVYknp3DRU8pG8uKc7cZ1x8uS9ZQHho0gyWrKxAlfUN6WFlWTfH1fnI+p6ogcr
         pyE5PAqsiDzS5udzh5kXZmo1vcILsJB6zIUJO8te5wvtWPnQurUUpEzFmI+sMAJWvpP6
         3TJ1ZvfJIA5TGzjThxyXStSG3fGjj8NYnSD1KVDYLgQ8DfoW+bSWcfBxe3td60Gh4+n7
         D/pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aSvQeaCR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 204si5598842yws.455.2018.12.01.12.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Dec 2018 12:55:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aSvQeaCR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTCIW-0003xB-C1
	for alex.bennee@linaro.org; Sat, 01 Dec 2018 15:55:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gTCIM-0003wb-LT
	for qemu-arm@nongnu.org; Sat, 01 Dec 2018 15:55:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gTCIL-0006T4-BT
	for qemu-arm@nongnu.org; Sat, 01 Dec 2018 15:55:22 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50519)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1gTCIJ-0006Qt-Vv; Sat, 01 Dec 2018 15:55:21 -0500
Received: by mail-wm1-x343.google.com with SMTP id 125so2187637wmh.0;
	Sat, 01 Dec 2018 12:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=S3m6ymC10SOBgDu6te+UJ9YAUctyb3N4XZMJRc5sjW0=;
	b=aSvQeaCR5/fd7vyB3Z+NxxO9l+SzHrA3wald0pqVmkJOFmAUz87duWwrGqoRfpiAtH
	UXm3oH2VlhDLx/npCDpgo1j+PsdT3fteVMOYLbIAbD0kPrt6gOxrIlazGDrfek0NWjqK
	06qThQUIRtNC+NwNk2sfjmX+BfdqnWbEpyeSrmfSt4cTEjcOh47CeC526TPtNIV5rncP
	dLOSH4flET62e+Q7DOKAYYePZFzb9BqvVndU9xJfgUelqrSzY+A0w8NRXeqluztBV/0Y
	OrjMzhI/IA7zhgU5F+3RdKqVZDXaIujjJtGGoUiQ81tN7i5OyzLYVrH2T2TLssqr4Tm9
	tBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=S3m6ymC10SOBgDu6te+UJ9YAUctyb3N4XZMJRc5sjW0=;
	b=XAM2GITgcpPBS0g6mHbexxwXD9Ufi8J0NWcWQEhh+nyKEwRM8h/Y6bCkyTpS2eVEGt
	cbxIRfX8PWHC/2MunMpopqtqPUbQ+z389DI3SPYInJTtJsE2hZcg31cktxgAi9LRLnZB
	NsxMUBBZF/c/px7t/vDo847bHdigTr2u2U7q4apxFw1pjEgOPlaQ8OJR4qkKMHQYO7eq
	ztwKsZlhc5iySno3qrLYUBMEqoLAYZOwM56Umj71C049022kV1GJKt4AujvLMX/uJSAx
	fgRg7UQ8Uxj4bzUuXARP2eQiJlJmoQyyzBaxlDsNBvseAdk4d4FF3QeUuhc2sv1FFi9w
	G3jA==
X-Gm-Message-State: AA+aEWaOpAoPlFeyqOPQSgsduwiAb67TbhSpV8jTbVpMDGJ/ydyaVHsi
	V19eo8y/Gsecxo+ZA/6dscAnQe/KiBdWo8Eqdy4=
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr3226364wme.16.1543697717248; 
	Sat, 01 Dec 2018 12:55:17 -0800 (PST)
MIME-Version: 1.0
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-25-marcandre.lureau@redhat.com>
	<20181130124821.292bd5c9@redhat.com>
In-Reply-To: <20181130124821.292bd5c9@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 2 Dec 2018 00:55:05 +0400
Message-ID: <CAJ+F1C+FRkVv-wHUpr5iFbZ84410dp1QH7m9bDqnf39QBXO1Zw@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v4 24/28] arm: replace
 instance_post_init()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z5FJNMNGN63i

Hi
On Fri, Nov 30, 2018 at 3:48 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Tue, 27 Nov 2018 13:27:57 +0400
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
>
> > Replace arm_cpu_post_init() instance callback by calling it from leaf
> > classes, to avoid potential the ordering issue with interfaces
> > post-init.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  target/arm/cpu.h   |  2 ++
> >  target/arm/cpu.c   | 15 ++++++++++++---
> >  target/arm/cpu64.c | 11 ++++++++++-
> >  3 files changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 2a73fed9a0..84fba2b24b 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -884,6 +884,8 @@ static inline ARMCPU *arm_env_get_cpu(CPUARMState *=
env)
> >      return container_of(env, ARMCPU, env);
> >  }
> >
> > +void arm_cpu_post_init(Object *obj);
> > +
> >  uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
> >
> >  #define ENV_GET_CPU(e) CPU(arm_env_get_cpu(e))
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 60411f6bfe..8a4aae7438 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -734,7 +734,7 @@ static Property arm_cpu_pmsav7_dregion_property =3D
> >  static Property arm_cpu_initsvtor_property =3D
> >              DEFINE_PROP_UINT32("init-svtor", ARMCPU, init_svtor, 0);
> >
> > -static void arm_cpu_post_init(Object *obj)
> > +void arm_cpu_post_init(Object *obj)
> >  {
> >      ARMCPU *cpu =3D ARM_CPU(obj);
> >
> > @@ -2094,6 +2094,7 @@ static void arm_host_initfn(Object *obj)
> >      ARMCPU *cpu =3D ARM_CPU(obj);
> >
> >      kvm_arm_set_cpu_features_from_host(cpu);
> > +    arm_cpu_post_init(ARM_CPU(obj));
> >  }
> >
> >  static const TypeInfo host_arm_cpu_type_info =3D {
> > @@ -2108,14 +2109,23 @@ static const TypeInfo host_arm_cpu_type_info =
=3D {
> >
> >  #endif
> >
> > +static void arm_cpu_instance_init(Object *obj)
> > +{
> > +    const ARMCPUInfo *info =3D object_class_get_class_data(object_get_=
class(obj));
> > +
> > +    info->initfn(obj);
> > +    arm_cpu_post_init(obj);
> > +}
> now imagine leaf cpu class call chain:
> before patch:
>    arm-cpu::initfn()
>    cortex-a8::initfn()
>       set feature AAA
>    device_post_init()
>      -> arm_cpu_post_init()
>           if (AAA)
>              do something
>
> after patch:
>    arm-cpu::initfn()
>       -> arm_cpu_post_init()
>             if (AAA)
>                do something  <--- won't happen anymore
>    cortex-a8::initfn()
>

Hmm? No, after the patch cortex-a8::initfn() is called before
arm_cpu_post_init().

> arm_cpu_post_init() helper has to go to leaf classes only

That's what the patch does, unless I am missing something.
arm_cpu_instance_init() is called on the leaf class, calling the
leaf-cpu init (cortex-8a::initfn() etc) before calling
arm_cpu_post_init()

>
> > +
> >  static void cpu_register(const ARMCPUInfo *info)
> >  {
> >      TypeInfo type_info =3D {
> >          .parent =3D TYPE_ARM_CPU,
> >          .instance_size =3D sizeof(ARMCPU),
> > -        .instance_init =3D info->initfn,
> > +        .instance_init =3D arm_cpu_instance_init,
> >          .class_size =3D sizeof(ARMCPUClass),
> >          .class_init =3D info->class_init,
> > +        .class_data =3D (void *)info,
> >      };
> >
> >      type_info.name =3D g_strdup_printf("%s-" TYPE_ARM_CPU, info->name)=
;
> > @@ -2128,7 +2138,6 @@ static const TypeInfo arm_cpu_type_info =3D {
> >      .parent =3D TYPE_CPU,
> >      .instance_size =3D sizeof(ARMCPU),
> >      .instance_init =3D arm_cpu_initfn,
> > -    .instance_post_init =3D arm_cpu_post_init,
> >      .instance_finalize =3D arm_cpu_finalizefn,
> >      .abstract =3D true,
> >      .class_size =3D sizeof(ARMCPUClass),
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 873f059bf2..dbfc3ee490 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -447,14 +447,23 @@ static void aarch64_cpu_class_init(ObjectClass *o=
c, void *data)
> >      cc->gdb_arch_name =3D aarch64_gdb_arch_name;
> >  }
> >
> > +static void aarch64_cpu_instance_init(Object *obj)
> > +{
> > +    const ARMCPUInfo *info =3D object_class_get_class_data(object_get_=
class(obj));
> > +
> > +    info->initfn(obj);
> > +    arm_cpu_post_init(obj);
> > +}
> > +
> >  static void aarch64_cpu_register(const ARMCPUInfo *info)
> >  {
> >      TypeInfo type_info =3D {
> >          .parent =3D TYPE_AARCH64_CPU,
> >          .instance_size =3D sizeof(ARMCPU),
> > -        .instance_init =3D info->initfn,
> > +        .instance_init =3D aarch64_cpu_instance_init,
> >          .class_size =3D sizeof(ARMCPUClass),
> >          .class_init =3D info->class_init,
> > +        .class_data =3D (void *)info,
> >      };
> >
> >      type_info.name =3D g_strdup_printf("%s-" TYPE_ARM_CPU, info->name)=
;
>
>


--=20
Marc-Andr=C3=A9 Lureau
