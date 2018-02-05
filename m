Received: by 10.28.71.27 with SMTP id u27csp2741164wma;
        Mon, 5 Feb 2018 09:09:14 -0800 (PST)
X-Google-Smtp-Source: AH8x225Zn25h7Z3e+AFvajusz92XxyTqExM4wT/bLXb0JX+ATJ2nl/wz3gYTaS2VQeAKWGBVtTzw
X-Received: by 10.202.52.130 with SMTP id b124mr30759260oia.292.1517850554691;
        Mon, 05 Feb 2018 09:09:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517850554; cv=none;
        d=google.com; s=arc-20160816;
        b=N6eE4OKdPIY1+SJ1D+lzfHKVsHNM0lEcvqzMrECJnXTfAc05IymKGuNDUHDlP8A+ko
         ArQ2thhIjfGQPFXalO1D2YQ32pNiA02rkGb5ypwi8+Rrj6kxANDZLrtoxdGPWTgruq05
         fN+6bnbs92vwnLibsgDAAPigk/BDmsbpsE6ZAY3RSgk/pIbSxdcHMeOqSNu8e58yVY2N
         N7qA0Rfu5nraDbRmTJLYtcLXkCXJALAPftiUA89bnUg3Xr4R0maQwLJgBTHRxcEWNcPo
         KXhdXxHzYCuOytw2/ZSfwz9JQI2gzdNtAq3oAvV0KdA6g65L/u5QFA8WxQ2MUd9wReEt
         Loyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=JyJiZcfL6QRAVKZp3E43N/LiWtHGxjk8duYyUnjHQ/k=;
        b=b1oPH93R2zpJTjq4hk7arAyKCiNtkpbooU7BLz67bw3FX8nV1SE+Ql8IZO6xg6sB7E
         3lyfW57MZC/kDOCWEH6cjQMEhmVFKVgy0AbbJu/H9CvTs/llV6VyvI3dPiFStdhnPW8N
         fFDILfQTosgI06rqzAzC176dFUBbqbLOOOQ7gZyYzaFPkhz7oplWy6TCGUGtMP1RT/Iq
         HbWK/LR8pGghvt5GGsI/MCTFyDSBEK+MEdiolI6HQmeMz4NXHhLG+cDZP16ciVDVOKgL
         OQoomr4fyBHybrPCFz1S+XodGHN1TyvohXLnVHLYizXZKKz0YIrLrDGbmq5BiBCuWg5B
         AA3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l123si3188222oib.157.2018.02.05.09.09.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Feb 2018 09:09:14 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE1F05B302;
	Mon,  5 Feb 2018 17:09:13 +0000 (UTC)
Received: from localhost (unknown [10.43.2.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5B44508E9;
	Mon,  5 Feb 2018 17:09:11 +0000 (UTC)
Date: Mon, 5 Feb 2018 18:09:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, "Emilio G. Cota" <cota@braap.org>
Subject: Re: [Qemu-devel] [PATCH v3 25/25] cpu: get rid of
 cpu_generic_init()
Message-ID: <20180205180910.16b8a5ba@redhat.com>
In-Reply-To: <1516694904-64879-26-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<1516694904-64879-26-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 05 Feb 2018 17:09:14 +0000 (UTC)
X-TUID: hsG9os4fds/6

On Tue, 23 Jan 2018 09:08:24 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> There aren't any users of the helper left, remove it.
after rebase this patch nor longer does what subj says
and it should be squashed into 23/25 where cpu_generic_init() is removed,
so pls ignore this patch I'll post v4 for 23/25 with this squashed in
and actual removal of not used MachineState::cpu_model
which I've lost on rebase.

>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: Richard Henderson <richard.henderson@linaro.org>
> CC: "Emilio G. Cota" <cota@braap.org>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> CC: Eduardo Habkost <ehabkost@redhat.com>
> CC: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> CC: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> ---
>  qom/cpu.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
>=20
> diff --git a/qom/cpu.c b/qom/cpu.c
> index aab8437..cf6880d 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -304,22 +304,9 @@ static ObjectClass *cpu_common_class_by_name(const c=
har *cpu_model)
>  static void cpu_common_parse_features(const char *typename, char *featur=
es,
>                                        Error **errp)
>  {
> -    char *featurestr; /* Single "key=3Dvalue" string being parsed */
>      char *val;
> -    static bool cpu_globals_initialized;
> -
> -    /* TODO: all callers of ->parse_features() need to be changed to
> -     * call it only once, so we can remove this check (or change it
> -     * to assert(!cpu_globals_initialized).
> -     * Current callers of ->parse_features() are:
> -     * - cpu_generic_init()
> -     */
> -    if (cpu_globals_initialized) {
> -        return;
> -    }
> -    cpu_globals_initialized =3D true;
> -
> -    featurestr =3D features ? strtok(features, ",") : NULL;
> +    /* Single "key=3Dvalue" string being parsed */
> +    char *featurestr =3D features ? strtok(features, ",") : NULL;
> =20
>      while (featurestr) {
>          val =3D strchr(featurestr, '=3D');
