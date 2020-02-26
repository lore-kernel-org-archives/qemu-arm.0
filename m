Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3592909lfg;
        Wed, 26 Feb 2020 14:00:26 -0800 (PST)
X-Received: by 2002:a02:c84d:: with SMTP id r13mr1599690jao.76.1582754426362;
        Wed, 26 Feb 2020 14:00:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582754426; cv=none;
        d=google.com; s=arc-20160816;
        b=PXNeaqP9kFMHIUaJEPef5qywHDhPkB+yhBOAjWTg/fEX/0++KWm6ST0zgxDfpAJ2LM
         uprqkQa+lcV7h6JI0WUAkW3ntbGlA33IEqAhsXAqB8H7kIcrMzgO8WWTSmJxqFySC+xu
         sqXrlDeduIGK3CbKe5qWxh4vfkoWkJUy/pHMUvWA5IMw6Bj7f6nsl9z2ERZBNjBYJeLc
         vtLDKivv7mcEVZFRuU56DiZfks3YSZygvpabOA3mc5+kOlMs+KvJdUs4d/NFN+Y5RET4
         ilQpMeIYDMkGjqKVJMTV7lsDQ97ktApz57ZwGwCFWvD5kbClHqGRdoXJ9lbr6k8B9h9v
         tuvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/Q+xYwkm6ri94nuzgMOTuFQwr8uB85kmkJI+QSjsZs0=;
        b=oL10UNe/h4vfCK6xuP8mTShQhJKAIGmJdQ8yFhbX4HKWx4F99bSnkXAV4BG/PRHykw
         YdKe8icqa+zwEtvNsyw+I6WOX5qsNP7cQbBX38lyi9qe8NtS1wKr1ZZLV/iLLY1hMqMi
         WHnBiEnIhUD4ugGG65fHy7HfAHY84qhG2fvt3GBMGrBB/c1z3pVdX65nPpmhGv98rCv6
         y7nmyAYkisat7nCTPeOeAc+aCqY1t03FiBoDOo5pR1is45KqP5NIBQc6mR/1fmGZi5Q/
         7zvHWQu3VWP7bVtweIkIXbP11nZ0hJ0244vz7DJYlxIHqArIctvBZJ89SQOqSnFDkTpc
         IPFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=n7WttgQx;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o71sor750926ilb.67.2020.02.26.14.00.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Feb 2020 14:00:26 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=n7WttgQx;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Q+xYwkm6ri94nuzgMOTuFQwr8uB85kmkJI+QSjsZs0=;
        b=n7WttgQxsj7u2eJGFQfttOpWRlqg/GeDFKcPFB4QZKLVvewwG6gKFvPOqxJg8ZoUwh
         /8wVwPp3uHExn8TtfhiYxNu1q2U69u2LVLUbOHyk/u0ejr027ij5ksRTZil7qYJs0gyL
         vC+BXlbQUDp1/y86LhfaM62uvzNqzqepFOfQzxY5ET4Q0YvUykxlUgEZCccFQ/yy402W
         OCE6l7WBIbYReMDhryIaQhqi+t923eUu00VCSEl2PYKsB3djUKlHG90cdUyCUQc9mmNc
         BWWcUPkKRwZR3yyw5Z6hIJudZvXZQx+z4kYpE0Z4C5AL0ZZwhGjzbZF/NbZrohqoZa/a
         2ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Q+xYwkm6ri94nuzgMOTuFQwr8uB85kmkJI+QSjsZs0=;
        b=Pli6pgN2SZKablPG/KgRfPL48hqep6gyArD361gXtD9AdoNcbOxCppICXyHHmCnUln
         2ZzP0i9BTQOkzO6Muvwvp3fnwZ9rqhl6mToO6bXINvl97Ocs8NQednI3TagRcFPgx10r
         oFb4IOOX41jT6R7nPS/QTH7Ere2WU3Ovud7FUkaZeJaI7zOSV6cw2TJ2hnjHGS8CExyp
         q6zKcVw/ipvs6NVAZ0vZaJyJtA1xhgiZT11SfJ6wgE2va/G2eOivaLTXdtBVBvMLyMJH
         qsXnaj2oOjd7gI+PIo7qr9so94IxVWvudRxNMz+nkNxGwtFk9ZC4k/vk8C9S5fnhUYWh
         ME6Q==
X-Gm-Message-State: APjAAAUiOfhfKSExEJQSkk9qeS66WfvWwZW36IX3g38ssBscwHFJv/M8
	cCx4b2ob6BYkA1Wm9Hjn5wZU3TrITMiHVeegWdZHAw==
X-Google-Smtp-Source: APXvYqxMJy81fwJLh/KuNEJ0vtG40HZvRlw6dUhgPOjBGkjjTdQOKKkN/R8LD0ykvg1DRlQj4wp1ANCgAJVXH5IEkVw=
X-Received: by 2002:a92:af08:: with SMTP id n8mr983895ili.217.1582754425424;
 Wed, 26 Feb 2020 14:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20200226181020.19592-1-alex.bennee@linaro.org> <20200226181020.19592-2-alex.bennee@linaro.org>
In-Reply-To: <20200226181020.19592-2-alex.bennee@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 26 Feb 2020 23:00:13 +0100
Message-ID: <CAPan3Woa8rb7NBOALieuyEiE=p_C_P+basRummBhPoX5On_XWw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] accel/tcg: use units.h for defining code gen
 buffer sizes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/alternative; boundary="0000000000004b5113059f81bb1d"
X-TUID: DvwXLfz4Prai

--0000000000004b5113059f81bb1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 7:11 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> It's easier to read.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>


> ---
>  accel/tcg/translate-all.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index a08ab11f657..238b0e575bf 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -18,6 +18,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qemu-common.h"
>
>  #define NO_CPU_IO_DEFS
> @@ -901,33 +902,33 @@ static void page_lock_pair(PageDesc **ret_p1,
> tb_page_addr_t phys1,
>
>  /* Minimum size of the code gen buffer.  This number is randomly chosen,
>     but not so small that we can't have a fair number of TB's live.  */
> -#define MIN_CODE_GEN_BUFFER_SIZE     (1024u * 1024)
> +#define MIN_CODE_GEN_BUFFER_SIZE     (1 * MiB)
>
>  /* Maximum size of the code gen buffer we'd like to use.  Unless otherwi=
se
>     indicated, this is constrained by the range of direct branches on the
>     host cpu, as used by the TCG implementation of goto_tb.  */
>  #if defined(__x86_64__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
>  #elif defined(__sparc__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
>  #elif defined(__powerpc64__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
>  #elif defined(__powerpc__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (32u * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (32 * MiB)
>  #elif defined(__aarch64__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
>  #elif defined(__s390x__)
>    /* We have a +- 4GB range on the branches; leave some slop.  */
> -# define MAX_CODE_GEN_BUFFER_SIZE  (3ul * 1024 * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
>  #elif defined(__mips__)
>    /* We have a 256MB branch region, but leave room to make sure the
>       main executable is also within that region.  */
> -# define MAX_CODE_GEN_BUFFER_SIZE  (128ul * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (128 * MiB)
>  #else
>  # define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>  #endif
>
> -#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32u * 1024 * 1024)
> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
>
>  #define DEFAULT_CODE_GEN_BUFFER_SIZE \
>    (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
> --
> 2.20.1
>
>
>

--=20
Niek Linnenbank

--0000000000004b5113059f81bb1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26, 2020 at 7:11 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">It&#39;s easier to read.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br></blockquote><div>Re=
viewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">=
nieklinnenbank@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
---<br>
=C2=A0accel/tcg/translate-all.c | 19 ++++++++++---------<br>
=C2=A01 file changed, 10 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c<br>
index a08ab11f657..238b0e575bf 100644<br>
--- a/accel/tcg/translate-all.c<br>
+++ b/accel/tcg/translate-all.c<br>
@@ -18,6 +18,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#define NO_CPU_IO_DEFS<br>
@@ -901,33 +902,33 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page=
_addr_t phys1,<br>
<br>
=C2=A0/* Minimum size of the code gen buffer.=C2=A0 This number is randomly=
 chosen,<br>
=C2=A0 =C2=A0 but not so small that we can&#39;t have a fair number of TB&#=
39;s live.=C2=A0 */<br>
-#define MIN_CODE_GEN_BUFFER_SIZE=C2=A0 =C2=A0 =C2=A0(1024u * 1024)<br>
+#define MIN_CODE_GEN_BUFFER_SIZE=C2=A0 =C2=A0 =C2=A0(1 * MiB)<br>
<br>
=C2=A0/* Maximum size of the code gen buffer we&#39;d like to use.=C2=A0 Un=
less otherwise<br>
=C2=A0 =C2=A0 indicated, this is constrained by the range of direct branche=
s on the<br>
=C2=A0 =C2=A0 host cpu, as used by the TCG implementation of goto_tb.=C2=A0=
 */<br>
=C2=A0#if defined(__x86_64__)<br>
-# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (2ul * 1024 * 1024 * 1024)<br>
+# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (2 * GiB)<br>
=C2=A0#elif defined(__sparc__)<br>
-# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (2ul * 1024 * 1024 * 1024)<br>
+# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (2 * GiB)<br>
=C2=A0#elif defined(__powerpc64__)<br>
-# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (2ul * 1024 * 1024 * 1024)<br>
+# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (2 * GiB)<br>
=C2=A0#elif defined(__powerpc__)<br>
-# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (32u * 1024 * 1024)<br>
+# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (32 * MiB)<br>
=C2=A0#elif defined(__aarch64__)<br>
-# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (2ul * 1024 * 1024 * 1024)<br>
+# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (2 * GiB)<br>
=C2=A0#elif defined(__s390x__)<br>
=C2=A0 =C2=A0/* We have a +- 4GB range on the branches; leave some slop.=C2=
=A0 */<br>
-# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (3ul * 1024 * 1024 * 1024)<br>
+# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (3 * GiB)<br>
=C2=A0#elif defined(__mips__)<br>
=C2=A0 =C2=A0/* We have a 256MB branch region, but leave room to make sure =
the<br>
=C2=A0 =C2=A0 =C2=A0 main executable is also within that region.=C2=A0 */<b=
r>
-# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (128ul * 1024 * 1024)<br>
+# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 (128 * MiB)<br>
=C2=A0#else<br>
=C2=A0# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 ((size_t)-1)<br>
=C2=A0#endif<br>
<br>
-#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32u * 1024 * 1024)<br>
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)<br>
<br>
=C2=A0#define DEFAULT_CODE_GEN_BUFFER_SIZE \<br>
=C2=A0 =C2=A0(DEFAULT_CODE_GEN_BUFFER_SIZE_1 &lt; MAX_CODE_GEN_BUFFER_SIZE =
\<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000004b5113059f81bb1d--
