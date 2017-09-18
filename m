Received: by 10.223.172.38 with SMTP id v35csp3673802wrc;
        Mon, 18 Sep 2017 05:06:12 -0700 (PDT)
X-Received: by 10.200.53.200 with SMTP id l8mr39252735qtb.334.1505736372178;
        Mon, 18 Sep 2017 05:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505736372; cv=none;
        d=google.com; s=arc-20160816;
        b=lgAJc6sAd5+7aFOZfEl9jn0FTJtMITWmIoFwNMzjoV6hpJzqpZpdC8VLpWLDs4I7uF
         Qs5nBBWCno2tk3yK83WeRxLxrw597zUhBIVYPidzf+IxbM8zPWqbHnR5mPo4TiH65UIR
         cfZZdDKvyYZZNV3TfC7fdGk6eXQw0SJO1RYJ1jHLtUca2pR21EozVjkr7aDCVAzmDagv
         ZwChgEw7VKb0JPD4+A2o5YLXUmHbql4brjoJzqhTzpsKYHwAOXGLkZ9P1ewf5j7cEdsP
         ejtR/0NfPzErxDsdHPfgf7YfOlVsH4Na5v/o9UtrCeP+kmmy+AOjh7YVHLN/yimjgEJb
         xhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=OKtMhrOrRfeHgcEradYgfapL5s6yuG33/LK/O6iYqTM=;
        b=be2kxJWb6cN+A6Ld0wzW1tJXm3ygNMKWfq5CcDB5y21UsFWu5vmp6D4j9nbKvr6vhx
         ItR1uw9h/by2eduu+CElsnh+hl+PaNwXhqglCfrjRudgZJT7y06RF9Aeo1EYvR+Cn5o6
         DAPmyzuzN+3gDBfHTvSmlxsDtBM188+EIMw/ypvgybXXHqhuhZ8iDIfKgUEST0KjZkui
         DqrJhfMRf78WL9SN6KtcHSQxJapFRmjwrDXZDCIMXc7wsDKPvr9FDd/N/5lLTUZiMgfP
         Zr0FkEvUql8pRrR08kxW+rpvYfSs5l6/qQcnTdk4CQbzsMTbzrtXOmisuOSMKT9dujSu
         +QAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xw0SpITz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7si6411480qka.275.2017.09.18.05.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 05:06:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xw0SpITz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36205 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtuoT-0004C6-Qj
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 08:06:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1dtuoC-00047V-B7
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 08:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1dtuo6-0003Hx-7a
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 08:05:52 -0400
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:35613)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <atar4qemu@gmail.com>)
	id 1dtuo1-0003DI-Ru; Mon, 18 Sep 2017 08:05:42 -0400
Received: by mail-it0-x244.google.com with SMTP id u2so384009itb.2;
	Mon, 18 Sep 2017 05:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OKtMhrOrRfeHgcEradYgfapL5s6yuG33/LK/O6iYqTM=;
	b=Xw0SpITzHeRFFgTzQwLPMZUjEXxSp1EBdLCJd9Et2llJrPXtGn3W1T8dh5/Jm6K893
	spBgHBMirnkkayqspUlF1/zmHUuBUWlTH7ZnlJEPhs9SaXOcVR/Xe0VUhswcnUaJUnXD
	ajd/V1ilwpYjWMZDv2zQFBSY/fJBXrF+94DdK6d5gt0DZbCxvzkWpZ/NABiTWQ3tvLGl
	QkbCtH5Hm7PB6ZhEAQHPmx1ojFbFYFkJfFsOTQGkUSvE6kNG+jCO/lgHkj16q9VDtft/
	thebFtAeVtiGZQ8Ik9AKUkIsmUdio0Iz8dKwOWLoA+oxJ14gbBDHY+OoWSrFYDN7mc93
	i59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OKtMhrOrRfeHgcEradYgfapL5s6yuG33/LK/O6iYqTM=;
	b=QcAvZ2XeYEamZnby+7IMNpABQcK/VQGTF6eDZ0/y4Zty0nmU3hVi4aYkOCCc9VIILX
	3+ani0eCsdTf72vfaPN826XgJk4L99WfiSVApsz3qy9tJVdcY9iL3h3kCNlfJLJS1uFC
	GrbHk7V+MENkI7uFoG1xOms9M1gcBEvgZzToqvuMy0d+gqwtsdQMND8mWzTisq+k6R3S
	GA3vy7TN5g9dtzJ19Jwdw6+DyQRcqaRVR4CSJEygjJ714Bq0FIUFLRqBAMq18zoSdqAb
	GlxcIi72PPpp0Uz4hy2zqOomn5jT/oOGMy7dyuN8sse0LOSGp2zvUxzonYxbwH15TYpR
	efbA==
X-Gm-Message-State: AHPjjUilL19Vl32xPfXG+1LwbZpFad1om1+Ah1WCL5R8mhH82Md510bz
	fqRfotWaa354JLfCdjV+nCGauW8aAj3glgl1ziw=
X-Google-Smtp-Source: AOwi7QAtCS1ZdoFpcWoWPJ2w2zWg5/ttOhQ1F3Il0IPLuiREO3StMkGjA29plmmv16p7HGxOnAss0kZGmOBnn6O6AZs=
X-Received: by 10.36.200.10 with SMTP id w10mr18223267itf.4.1505736339640;
	Mon, 18 Sep 2017 05:05:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.79.194 with HTTP; Mon, 18 Sep 2017 05:05:19 -0700 (PDT)
In-Reply-To: <20170917232842.14544-1-f4bug@amsat.org>
References: <20170917232842.14544-1-f4bug@amsat.org>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Mon, 18 Sep 2017 14:05:19 +0200
Message-ID: <CACXAS8Bz6R-VXLq1o_Z0vNr=u4Fy6GQAMn7Rpd2QZv4t-gn=GQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
Subject: Re: [Qemu-arm] [PATCH] qom/cpu: move cpu_model null check to
 cpu_class_by_name()
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
	qemu-devel <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>,
	Marek Vasut <marex@denx.de>, Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GnNzyLejrP4z

On Mon, Sep 18, 2017 at 1:28 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> and clean every implementation.
>
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>

> ---
> Based-on: 20170917232010.14183-7-f4bug@amsat.org
>
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
>
> diff --git a/qom/cpu.c b/qom/cpu.c
> index dc5392dbeb..411d8cdd2b 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -311,7 +311,12 @@ static bool cpu_common_has_work(CPUState *cs)
>
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
>
>      return cc->class_by_name(cpu_model);
>  }
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index e6c6aabdf0..b8a21f4e01 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -127,14 +127,10 @@ static const AlphaCPUAlias alpha_cpu_aliases[] =3D =
{
>
>  static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
>  {
> -    ObjectClass *oc =3D NULL;
> +    ObjectClass *oc;
>      char *typename;
>      int i;
>
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
>
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
>
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
>
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
>
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
>
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
>
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
>
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
>
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
>
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
>
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
>
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
>
> -    if (cpu_model =3D=3D NULL) {
> -        return NULL;
> -    }
> -
>      typename =3D g_strdup_printf("%s-" TYPE_XTENSA_CPU, cpu_model);
>      oc =3D object_class_by_name(typename);
>      g_free(typename);
> --
> 2.14.1
>



--=20
Regards,
Artyom Tarasenko

SPARC and PPC PReP under qemu blog: http://tyom.blogspot.com/search/label/q=
emu
