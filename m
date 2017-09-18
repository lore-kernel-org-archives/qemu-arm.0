Received: by 10.223.172.38 with SMTP id v35csp3559185wrc;
        Mon, 18 Sep 2017 02:37:22 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDo5mpxu2aOqRR1jaiTYJDY/GFqeUXZW0DHVD3RekF2FfJo/oYS5j9mXoUpmmvgg/d0Dcn+
X-Received: by 10.200.53.35 with SMTP id y32mr47636561qtb.276.1505727442218;
        Mon, 18 Sep 2017 02:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505727442; cv=none;
        d=google.com; s=arc-20160816;
        b=D8rzr/dYepwp2XUQbBjyWJNT3Iss36BBuZTihD7wIRslkKvnVC1TflEu+VyJfoIa9t
         uBJGdcu3etiLyfd2XmDV7R+2ZSS0s0ueRS5uUDIo4XjAzuCibv/gi9cg3Tk6BTf9c5Ki
         7ihcSz8xHO41jGmMOEhmQY8dnEtVViB3evzEz+s6tzaaO/dYnduMTvX6eK0ML/G/bPjT
         2o4tVdg1E8dl0A1abw+zvhjxMzk/Oli3QTmKCboBtsPZ/2SVmR3lybcRPVBBV4R3kwb2
         VtAoE43KClW82wSmlyho/Eh6YUmYGXBrSCB7w8mMUvFGY+cUwGsHgxqp8BfYtS7RiBbu
         jw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dmarc-filter:arc-authentication-results;
        bh=HHCwKIAvXXQukzzXMvv2m9UWtuXD1LffwGhfy3Orsv4=;
        b=woO2CkcamZGAK4nkG8UelDbKyT8lE3ziSvIct4gDXiyAUXsiKSTnHZBYdzs1GRJ4Px
         Kk1pkHIOpyIlsOWgpu1tll15+cjmUEzUlZahz5Whd4g7j/McI4I/SvAsjdZnnIjc6Yoc
         E/wTGQErbT7UR0lzqef7U876IdSqHB6I5ooYLxfiM5xClp0wK179+nkpvFS3bucBFe7j
         PQ+7bQp/AEuhxuAT4qsUJwAQPDCU/2MW6+P33DkDf3HJxZqp90L6OrIdQrfXN4YU0Iyx
         o2u9P9QIwTFuO/nAStD8D9K8LjuIpCehmUwNMioRRIvipYV6/Oj8VEoc8++HcnZCwzdM
         UMSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i36si6618240qtb.440.2017.09.18.02.37.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 02:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35433 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtsUR-0003RJ-V8
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 05:37:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dtsUH-0003PQ-Cw
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 05:37:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dtsUA-0002TF-Uj
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 05:37:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52718)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dtsUA-0002Sy-M4; Mon, 18 Sep 2017 05:37:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F68F4E4C6;
	Mon, 18 Sep 2017 09:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7F68F4E4C6
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=imammedo@redhat.com
Received: from nial.brq.redhat.com (unknown [10.43.2.209])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47D5B5C891;
	Mon, 18 Sep 2017 09:36:41 +0000 (UTC)
Date: Mon, 18 Sep 2017 11:36:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Message-ID: <20170918113639.7deae179@nial.brq.redhat.com>
In-Reply-To: <20170917232842.14544-1-f4bug@amsat.org>
References: <20170917232842.14544-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 18 Sep 2017 09:37:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] qom/cpu: move cpu_model null
 check to cpu_class_by_name()
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
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?B?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>,
	Marek Vasut <marex@denx.de>, Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DSHOYuNlU/N2

On Sun, 17 Sep 2017 20:28:42 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> and clean every implementation.
>=20
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Based-on: 20170917232010.14183-7-f4bug@amsat.org
>=20
>  qom/cpu.c              | 7 ++++++-
>  target/alpha/cpu.c     | 6 +-----
>  target/arm/cpu.c       | 4 ----
>  target/cris/cpu.c      | 4 ----
>  target/lm32/cpu.c      | 4 ----
>  target/m68k/cpu.c      | 4 ----
>  target/mips/cpu.c      | 4 ----
>  target/moxie/cpu.c     | 8 +-------
>  target/openrisc/cpu.c  | 4 ----
>  target/sh4/cpu.c       | 3 ---
>  target/sparc/cpu.c     | 4 ----
>  target/tricore/cpu.c   | 4 ----
>  target/unicore32/cpu.c | 4 ----
>  target/xtensa/cpu.c    | 4 ----
>  14 files changed, 8 insertions(+), 56 deletions(-)
>=20
> diff --git a/qom/cpu.c b/qom/cpu.c
> index dc5392dbeb..411d8cdd2b 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -311,7 +311,12 @@ static bool cpu_common_has_work(CPUState *cs)
> =20
>  ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_mod=
el)
>  {
> -    CPUClass *cc =3D CPU_CLASS(object_class_by_name(typename));
> +    CPUClass *cc;
> +
> +    if (!cpu_model) {
> +        return NULL;
> +    }
> +    cc =3D CPU_CLASS(object_class_by_name(typename));
> =20
>      return cc->class_by_name(cpu_model);
>  }
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index e6c6aabdf0..b8a21f4e01 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -127,14 +127,10 @@ static const AlphaCPUAlias alpha_cpu_aliases[] =3D {
> =20
>  static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
>  {
> -    ObjectClass *oc =3D NULL;
> +    ObjectClass *oc;
>      char *typename;
>      int i;
> =20
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
> -
>      oc =3D object_class_by_name(cpu_model);
>      if (oc !=3D NULL && object_class_dynamic_cast(oc, TYPE_ALPHA_CPU) !=
=3D NULL &&
>          !object_class_is_abstract(oc)) {
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 412e94c7ad..ea219c2dde 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -906,10 +906,6 @@ static ObjectClass *arm_cpu_class_by_name(const char=
 *cpu_model)
>      char *typename;
>      char **cpuname;
> =20
> -    if (!cpu_model) {
> -        return NULL;
> -    }
> -
>      cpuname =3D g_strsplit(cpu_model, ",", 1);
>      typename =3D g_strdup_printf("%s-" TYPE_ARM_CPU, cpuname[0]);
>      oc =3D object_class_by_name(typename);
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index ceebfed79b..88d93f2d11 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -69,10 +69,6 @@ static ObjectClass *cris_cpu_class_by_name(const char =
*cpu_model)
>      ObjectClass *oc;
>      char *typename;
> =20
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
> -
>  #if defined(CONFIG_USER_ONLY)
>      if (strcasecmp(cpu_model, "any") =3D=3D 0) {
>          return object_class_by_name("crisv32-" TYPE_CRIS_CPU);
> diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
> index 2b8c36b6d0..bf081f56d2 100644
> --- a/target/lm32/cpu.c
> +++ b/target/lm32/cpu.c
> @@ -246,10 +246,6 @@ static ObjectClass *lm32_cpu_class_by_name(const cha=
r *cpu_model)
>      ObjectClass *oc;
>      char *typename;
> =20
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
> -
>      typename =3D g_strdup_printf("%s-" TYPE_LM32_CPU, cpu_model);
>      oc =3D object_class_by_name(typename);
>      g_free(typename);
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 55bf24bae6..8c70e0805c 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -87,10 +87,6 @@ static ObjectClass *m68k_cpu_class_by_name(const char =
*cpu_model)
>      ObjectClass *oc;
>      char *typename;
> =20
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
> -
>      typename =3D g_strdup_printf("%s-" TYPE_M68K_CPU, cpu_model);
>      oc =3D object_class_by_name(typename);
>      g_free(typename);
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 1a9a3ed94d..c15b894362 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -166,10 +166,6 @@ static ObjectClass *mips_cpu_class_by_name(const cha=
r *cpu_model)
>      ObjectClass *oc;
>      char *typename;
> =20
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
> -
>      typename =3D mips_cpu_type_name(cpu_model);
>      oc =3D object_class_by_name(typename);
>      g_free(typename);
> diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
> index 748d02f29e..30bd44fcad 100644
> --- a/target/moxie/cpu.c
> +++ b/target/moxie/cpu.c
> @@ -89,13 +89,7 @@ static void moxie_cpu_initfn(Object *obj)
> =20
>  static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
>  {
> -    ObjectClass *oc;
> -
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
> -
> -    oc =3D object_class_by_name(cpu_model);
> +    ObjectClass *oc =3D object_class_by_name(cpu_model);
>      if (oc !=3D NULL && (!object_class_dynamic_cast(oc, TYPE_MOXIE_CPU) =
||
>                         object_class_is_abstract(oc))) {
>          return NULL;
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index a979f0bf8b..af9cdcc102 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -108,10 +108,6 @@ static ObjectClass *openrisc_cpu_class_by_name(const=
 char *cpu_model)
>      ObjectClass *oc;
>      char *typename;
> =20
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
> -
>      typename =3D g_strdup_printf("%s-" TYPE_OPENRISC_CPU, cpu_model);
>      oc =3D object_class_by_name(typename);
>      g_free(typename);
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 6ce7cba5a9..252440e019 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -133,9 +133,6 @@ static ObjectClass *superh_cpu_class_by_name(const ch=
ar *cpu_model)
>      ObjectClass *oc;
>      GSList *list, *item;
> =20
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
>      if (strcasecmp(cpu_model, "any") =3D=3D 0) {
>          return object_class_by_name(TYPE_SH7750R_CPU);
>      }
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 0806d699e6..beab90f3e6 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -730,10 +730,6 @@ static ObjectClass *sparc_cpu_class_by_name(const ch=
ar *cpu_model)
>      ObjectClass *oc;
>      char *typename;
> =20
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
> -
>      typename =3D sparc_cpu_type_name(cpu_model);
>      oc =3D object_class_by_name(typename);
>      g_free(typename);
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index 5ab5b56454..871eb35453 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -120,10 +120,6 @@ static ObjectClass *tricore_cpu_class_by_name(const =
char *cpu_model)
>      ObjectClass *oc;
>      char *typename;
> =20
> -    if (!cpu_model) {
> -        return NULL;
> -    }
> -
>      typename =3D g_strdup_printf("%s-" TYPE_TRICORE_CPU, cpu_model);
>      oc =3D object_class_by_name(typename);
>      g_free(typename);
> diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
> index c9b78ce68e..138acc9dd8 100644
> --- a/target/unicore32/cpu.c
> +++ b/target/unicore32/cpu.c
> @@ -44,10 +44,6 @@ static ObjectClass *uc32_cpu_class_by_name(const char =
*cpu_model)
>      ObjectClass *oc;
>      char *typename;
> =20
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
> -
>      typename =3D g_strdup_printf("%s-" TYPE_UNICORE32_CPU, cpu_model);
>      oc =3D object_class_by_name(typename);
>      g_free(typename);
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index 85897df0a8..dcdc765a86 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -83,10 +83,6 @@ static ObjectClass *xtensa_cpu_class_by_name(const cha=
r *cpu_model)
>      ObjectClass *oc;
>      char *typename;
> =20
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
> -
>      typename =3D g_strdup_printf("%s-" TYPE_XTENSA_CPU, cpu_model);
>      oc =3D object_class_by_name(typename);
>      g_free(typename);

