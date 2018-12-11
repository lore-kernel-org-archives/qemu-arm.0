Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp598398wrt;
        Tue, 11 Dec 2018 05:43:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U1ul+Mk6H+1/rtePGbk4O4mjePeaYaLbwgVkaFj7GzzQU2uHPc9sq10sja7b9nbsnHyCvQ
X-Received: by 2002:ac8:1889:: with SMTP id s9mr15522772qtj.268.1544535815039;
        Tue, 11 Dec 2018 05:43:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544535815; cv=none;
        d=google.com; s=arc-20160816;
        b=LGvDGgOisLPs/0me6CdJC0sYtLJHdm4rMYWnR5gQAaXZ6BIRQ+r5wcVAxv0G6pQVQo
         b1ZPMuAlpdK+WQYL3I4sMsxHvhu5DOAiLV+x4a9Y1dZYoXF+0jgzRqr1S87S7FM7On+j
         g6HosymClVvJkzBFBYyUL8jScabLZGc7Tyr1H7Gxi2+9i9Y4x15Y0E9JWy5BB32514Mh
         Nc7P0plQVks8YsymFntyKNrASK51g4V9SwUv8zzvelXrd5RydMx5TyFNbWjmcL4p5duY
         AY5hoy1n5iQM/vxyeLLhKrwH9RY0CE52eZmxiK2PW3pnmqLqewlCoT/v67sG+Svtxnik
         MwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=CRcOnd9dLAj39qXgCvVxN80hXcrbpZ69U2ClfXC3Q+0=;
        b=HqIksfdCseUoKrCq8kpUcWwkQq24CGpDTlaxlmtp3r5nItom+OKqhtsCB7sZMGFbBC
         gb+D83EoYKivURYQKeEYR/vyWKbP/xzVjcTM5mCrh1So+saaEVG1SJEvukgFsh3CL8jk
         cq7iqiwX4xIiCbil8/rI6gRpm8ymdhkksCgTWqjAg9wONT5pU30r32RfMD60mjCmK1mK
         4iyUN+BfSyPOiAhlynKGyJpf3F84rXieLxltU/6e/QQlsXAkUAC/IptUdBK/mPFAaaD2
         l79r4bDAeKsvPbxgA0hINVTmx5aFwtbZWUHsNFfvuN6NSHmLFbvDMzmj63B046foqh4J
         hOPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2si7937096qvn.10.2018.12.11.05.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 05:43:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38210 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWiJy-0000bj-Ix
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 08:43:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gWiJq-0000be-OM
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 08:43:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gWiJm-0003Kd-8J
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 08:43:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gWiJl-0003Io-34; Tue, 11 Dec 2018 08:43:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A6A4307D91D;
	Tue, 11 Dec 2018 13:43:19 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2887060C64;
	Tue, 11 Dec 2018 13:43:15 +0000 (UTC)
Date: Tue, 11 Dec 2018 14:43:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181211144313.12befbbb@redhat.com>
In-Reply-To: <20181204142023.15982-17-marcandre.lureau@redhat.com>
References: <20181204142023.15982-1-marcandre.lureau@redhat.com>
	<20181204142023.15982-17-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 11 Dec 2018 13:43:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v5 16/19] RFC: arm:
 replace instance_post_init()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org,
	ehabkost@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8T3r4IIk5RNf

On Tue,  4 Dec 2018 18:20:20 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Replace arm_cpu_post_init() instance callback by calling it from leaf
> classes, to avoid potential ordering issue with other post_init callbacks.
>=20
> Note: this patch is no longer needed in this series, since the
> compat-props interface approach was abandoned.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
Current call chain is
  aarch64_a57_initfn()
  arm_cpu_post_init()
  device_post_init()

so no compats nor globals influence arm_cpu_post_init() flow,
so it's save to squash it in initfn.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
=20
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

