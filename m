Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3476012wrt;
        Fri, 30 Nov 2018 03:48:43 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WXcFbg3RV2GdXVUHbKje7Ub+LKvZt+APV9gqDCODKsHrB37D//2PqYnw7p9+PYubx26Du+
X-Received: by 2002:a81:c808:: with SMTP id n8mr4570632ywi.20.1543578523670;
        Fri, 30 Nov 2018 03:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543578523; cv=none;
        d=google.com; s=arc-20160816;
        b=aTLR3a0qMjDWkd6B7fNx/ByZdAhPMjSlyJJPpV6n4lufFkC9qfn0d7aeJYl+59JbQY
         fAVRk5/Ud00VZfe0r4aj5U7bca7laNYmx/D/9F+JQ9TA83HBCADCuWxP6Q+o86SSstYN
         DKyiIx8f6JUpfyEpZbETx4xjsDnF0cyFIc2WZhoofsHVUrUz3gvQGOBrF/plD32Nqfsp
         P/C5BDeuDDMk25CAJQNutvnJjeM+Cba+oTppLl1tZVbBZo2r28q7ChJQCiVQwzbkuSo5
         CksQ52Mg5M4lQWySl0o/+9vp/QkT8nWmzrY01vZ2FVU2jlTpKT8WWqUbXW6vs5wllvY8
         JeMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=gYFR/iv2W1roFNY9RyXmayEBrelXtCZXskrXuiYKdk0=;
        b=Wc0VPPTwpzsVk4KP5GsdsP5pHf/VH1A5A/xCsO8v04JBN3xUt0uvkYbflYAKMraEdv
         4F2Y8O8tVD/djvy+QY+uFMz77ArTrbfRjvJgJpQwVnNqLEazRRnLOsfhNwgLMUuQxI1y
         FGXa6NfQAs9qPyinrpBf3dou13qSa9HfWvIjj+V89cuyD69kWEWF5JdJQTJdzzUH7ZVm
         9GLRAp3FcNLNFhvlYrvMWRiLcHtFZfq0mXDKZQRZGkhHMCKyoEfvkLdP4+vLvIGWT5Zs
         8mpNyU3TfgrIOQRfSQB+XmILF+hHeh9PXqKUr8w+W90nW08u4v43LZZ0UCe7KRVKHszC
         N5ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l8-v6si2705290ybp.221.2018.11.30.03.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 03:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gShHn-0001z2-5S
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 06:48:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gShHb-0001yP-3e
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 06:48:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gShHX-0007ps-Vk
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 06:48:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51356)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gShHX-0007pM-Na; Fri, 30 Nov 2018 06:48:27 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F002B394D48;
	Fri, 30 Nov 2018 11:48:26 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C330626540;
	Fri, 30 Nov 2018 11:48:22 +0000 (UTC)
Date: Fri, 30 Nov 2018 12:48:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181130124821.292bd5c9@redhat.com>
In-Reply-To: <20181127092801.21777-25-marcandre.lureau@redhat.com>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-25-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 30 Nov 2018 11:48:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "open
	list:ARM" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3v5UDMEFE6y0

On Tue, 27 Nov 2018 13:27:57 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Replace arm_cpu_post_init() instance callback by calling it from leaf
> classes, to avoid potential the ordering issue with interfaces
> post-init.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  target/arm/cpu.h   |  2 ++
>  target/arm/cpu.c   | 15 ++++++++++++---
>  target/arm/cpu64.c | 11 ++++++++++-
>  3 files changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 2a73fed9a0..84fba2b24b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -884,6 +884,8 @@ static inline ARMCPU *arm_env_get_cpu(CPUARMState *en=
v)
>      return container_of(env, ARMCPU, env);
>  }
> =20
> +void arm_cpu_post_init(Object *obj);
> +
>  uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
> =20
>  #define ENV_GET_CPU(e) CPU(arm_env_get_cpu(e))
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 60411f6bfe..8a4aae7438 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -734,7 +734,7 @@ static Property arm_cpu_pmsav7_dregion_property =3D
>  static Property arm_cpu_initsvtor_property =3D
>              DEFINE_PROP_UINT32("init-svtor", ARMCPU, init_svtor, 0);
> =20
> -static void arm_cpu_post_init(Object *obj)
> +void arm_cpu_post_init(Object *obj)
>  {
>      ARMCPU *cpu =3D ARM_CPU(obj);
> =20
> @@ -2094,6 +2094,7 @@ static void arm_host_initfn(Object *obj)
>      ARMCPU *cpu =3D ARM_CPU(obj);
> =20
>      kvm_arm_set_cpu_features_from_host(cpu);
> +    arm_cpu_post_init(ARM_CPU(obj));
>  }
> =20
>  static const TypeInfo host_arm_cpu_type_info =3D {
> @@ -2108,14 +2109,23 @@ static const TypeInfo host_arm_cpu_type_info =3D {
> =20
>  #endif
> =20
> +static void arm_cpu_instance_init(Object *obj)
> +{
> +    const ARMCPUInfo *info =3D object_class_get_class_data(object_get_cl=
ass(obj));
> +
> +    info->initfn(obj);
> +    arm_cpu_post_init(obj);
> +}
now imagine leaf cpu class call chain:
before patch:
   arm-cpu::initfn()
   cortex-a8::initfn()
      set feature AAA
   device_post_init()
     -> arm_cpu_post_init()
          if (AAA)
             do something  =20

after patch:
   arm-cpu::initfn()
      -> arm_cpu_post_init()
            if (AAA)
               do something  <--- won't happen anymore
   cortex-a8::initfn()

arm_cpu_post_init() helper has to go to leaf classes only

> +
>  static void cpu_register(const ARMCPUInfo *info)
>  {
>      TypeInfo type_info =3D {
>          .parent =3D TYPE_ARM_CPU,
>          .instance_size =3D sizeof(ARMCPU),
> -        .instance_init =3D info->initfn,
> +        .instance_init =3D arm_cpu_instance_init,
>          .class_size =3D sizeof(ARMCPUClass),
>          .class_init =3D info->class_init,
> +        .class_data =3D (void *)info,
>      };
> =20
>      type_info.name =3D g_strdup_printf("%s-" TYPE_ARM_CPU, info->name);
> @@ -2128,7 +2138,6 @@ static const TypeInfo arm_cpu_type_info =3D {
>      .parent =3D TYPE_CPU,
>      .instance_size =3D sizeof(ARMCPU),
>      .instance_init =3D arm_cpu_initfn,
> -    .instance_post_init =3D arm_cpu_post_init,
>      .instance_finalize =3D arm_cpu_finalizefn,
>      .abstract =3D true,
>      .class_size =3D sizeof(ARMCPUClass),
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 873f059bf2..dbfc3ee490 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -447,14 +447,23 @@ static void aarch64_cpu_class_init(ObjectClass *oc,=
 void *data)
>      cc->gdb_arch_name =3D aarch64_gdb_arch_name;
>  }
> =20
> +static void aarch64_cpu_instance_init(Object *obj)
> +{
> +    const ARMCPUInfo *info =3D object_class_get_class_data(object_get_cl=
ass(obj));
> +
> +    info->initfn(obj);
> +    arm_cpu_post_init(obj);
> +}
> +
>  static void aarch64_cpu_register(const ARMCPUInfo *info)
>  {
>      TypeInfo type_info =3D {
>          .parent =3D TYPE_AARCH64_CPU,
>          .instance_size =3D sizeof(ARMCPU),
> -        .instance_init =3D info->initfn,
> +        .instance_init =3D aarch64_cpu_instance_init,
>          .class_size =3D sizeof(ARMCPUClass),
>          .class_init =3D info->class_init,
> +        .class_data =3D (void *)info,
>      };
> =20
>      type_info.name =3D g_strdup_printf("%s-" TYPE_ARM_CPU, info->name);

