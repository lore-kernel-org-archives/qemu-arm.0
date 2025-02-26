Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp980293njg;
        Wed, 26 Feb 2025 07:28:16 -0800 (PST)
X-Received: by 2002:a05:6a00:234c:b0:730:95f1:53ca with SMTP id d2e1a72fcca58-73426cb13f2mr32355827b3a.10.1740583695846;
        Wed, 26 Feb 2025 07:28:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740583695; cv=none;
        d=google.com; s=arc-20240605;
        b=NYn3Ln35t5Q5f7A0gfwrWjTVX+JHMZIOf6TBceFy/IGnf+4MdPyRngC57cN7rfYEpW
         4pDvLoqjvDPyoNGLed9FeFib54azkXk0IX+3tl5E2kzZ74fG7atSBf/RH7suh2t3WG2E
         wnHmGd2pdWjU5sHMiv65A0pwGdfIW1uBRdGkAgGWHHzrUd81Lgc9vVNZwOTuTL5AXwmu
         JvSHQjKR2uJS6jJNpQzprsoyicXyD+SCLG3aOvlI+wsstBiPzZ3g2a9ItzoiEYIjhqU5
         4BJbkS5DMlFo59nAIggxGfxF12SrHJvK9rrQb999EyTeMRasys5f/K4mJ+/xxoOpQJro
         83BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=otPD1pltukCVXEyy81M2xkMuRQbnIkdeFAXSVz93YqU=;
        fh=W+2JWW6xFml6qiSEaxM+JL157RRMHNHccOyug4N9QtI=;
        b=BTZb+nTYMnQ0+MYA2InjYz5dTbDGwM0I6M8HxaasHbGOXy6MjgwM54MYVfNauN2i2n
         mXAdm95+i7BbTeaSdJW2ZBevT0FmQR5HgCwNhPSf42pwsE1PA8E8JuX6xEHz9+bga12z
         PAE23YR+EPvhc+lK0xXvA6lJV08B3U/YmfzN4gqu23M+ZPlOnta3l0InC6LBZ3Jmz6D7
         T385AY8uXUHyW7EAKh65TEuda6PzaMZNzi4zFRRH55hEzr0Ys268/vmfL6k7p8J2qRAO
         TfKlmMFVqef/jW4b9iGFxlzbGEh9pvR/yBUwKFTAAwe1d3JnbgOOeTnaY+PlyU0aAHtq
         veTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b="JY0Sk/eG";
       spf=none (google.com: wlosh@bsdimp.com does not designate permitted sender hosts) smtp.mailfrom=wlosh@bsdimp.com;
       dara=neutral header.i=@linaro.org
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7347a6aa5c6sor2506516b3a.2.2025.02.26.07.28.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Feb 2025 07:28:15 -0800 (PST)
Received-SPF: none (google.com: wlosh@bsdimp.com does not designate permitted sender hosts) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b="JY0Sk/eG";
       spf=none (google.com: wlosh@bsdimp.com does not designate permitted sender hosts) smtp.mailfrom=wlosh@bsdimp.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1740583694; x=1741188494; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=otPD1pltukCVXEyy81M2xkMuRQbnIkdeFAXSVz93YqU=;
        b=JY0Sk/eGyLF0VY+9cBZDI1xce53sQwwIfpl3q7F/C+hrv8Tm1+SyPHLfhKxXvi2egC
         x1xsIHU1VGX2eFq03hWwvjnsPllBTSSTEDlnh2E0qUCVHT5mC5zS10vXsIDGFA5FGFHp
         2+B5CQFepa4iq8qIxhhsHJ0Mc7PErT/f2mpsq/H9/OMRaBm3ZMwqXh4SvyIAz30CS5QJ
         jBZ7hKsh0vY4KgA1vYAPLahBi/GdW+40GwcFGiCEHvg37ZnLVGYirjrNmFF/j8Q9bMYt
         /znomMv7XybA30WgGHG1OQU5q9ctdyCmplmFz+L7aq6o215Sz03u0JM7h9uQlHpITkvB
         zxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583694; x=1741188494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otPD1pltukCVXEyy81M2xkMuRQbnIkdeFAXSVz93YqU=;
        b=LvSOaA1ZOTlwLiO5eOjpkuB04qj6wqIuLgPzkR8tqyXc3YxWm00S6FWAXdsqjn4aMB
         /8oR2kubxQOcYfb4Lo1rzaebj8ybmMC77OfZEWRB2fVIJAKs6cFul156fnnFy1+UvLMN
         7ukpaJY1NvaRdQwVjiDtdbNvDI1dAgw+ZEsIy20ngBKKQ5FEGgjkudHDJPCeaRiU6t9V
         P3+UuWQnJPAL2I/tOcv5NgDz3oB99O8HikjJcaOqMbg62GQwB5karrIScFqMHBtNgf6H
         TchXDUuo5qeNmU/TaaWYGevKkBwpe8v65BA/FjSg58yKhobzO7JWe1ckwub19OG/V5mW
         jYkg==
X-Gm-Message-State: AOJu0YxgCFTJJyWw+8dGOczYCT6ETBDuDsuTigP0FI0Xg0opctbqb1Hr
	LLtVNfIubrd1jT1vXn2aZIp+142ydUmL4/o+QnShJ+XiwXAKJuUBid8ulA3OAw8kznWyVmQY1IO
	XD1yV/Rdy8+Ilsl48fZD7VfKfQU744VLaP2ZG5LACMVacp41HeSs=
X-Gm-Gg: ASbGnctwoBMzayUjJrTqR9R+xSc0pv6oM1olz/tgUuzOEeEc4Go+Y5ppNrNHmTQtaf4
	Khc90BVYtk2eJFxi1G8fnHMlk5bZHeyaZHWYXlmb5MxABDcJPAw5rQRc1yxOBcdQ8+RcyMSZvYv
	x6XvuLhhK4/Z56AzJMCACW3pw1OIhQPw3tC+fU
X-Google-Smtp-Source: AGHT+IFDGdRBfHt4loK7VAklIdzpp19LOxcXzmYSI6uEsQuL9C+jaZmROm2s2zmXXfTmZValoB4mU9fwZptsdyEBeuI=
X-Received: by 2002:a17:90a:fe15:b0:2fe:8a84:e033 with SMTP id
 98e67ed59e1d1-2fe8a84edd4mr3020639a91.2.1740583694413; Wed, 26 Feb 2025
 07:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20250226140343.3907080-1-alex.bennee@linaro.org> <20250226140343.3907080-22-alex.bennee@linaro.org>
In-Reply-To: <20250226140343.3907080-22-alex.bennee@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 26 Feb 2025 08:28:02 -0700
X-Gm-Features: AQ5f1JoolAEwz_7kDX-Shjy5y_qUhTrXMzzYy5xY6wbDbZxX1QcqF4s-Ejptic4
Message-ID: <CANCZdfqAZ19c9pKsLDDJ8kqbBaoi94OY9Rwq2P9D92dEUn9qBw@mail.gmail.com>
Subject: Re: [PATCH 21/25] plugins/api: split out binary path/start/end/entry code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>, 
	Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Ed Maste <emaste@freebsd.org>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cecf76062f0d38a4"
X-TUID: Ux/sjNe504um

--000000000000cecf76062f0d38a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 7:11=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:

> To move the main api.c to a single build compilation object we need to
> start splitting out user and system specific code. As we need to grob
> around host headers we move these particular helpers into the *-user
> mode directories.
>
> The binary/start/end/entry helpers are all NOPs for system mode.
>
> While using the plugin-api.c.inc trick means we build for both
> linux-user and bsd-user the BSD user-mode command line is still
> missing -plugin. This can be enabled once we have reliable check-tcg
> tests working for the BSDs.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20250225110844.3296991-8-alex.bennee@linaro.org>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

I'd love to see the check-tcg working well for bsd, but I'm swamped with
other commitments.

Warner


> ---
> v2
>   - use common-user/plugin-api.c.inc instead
>   - add commentary about state of plugins for BSD user
> ---
>  bsd-user/plugin-api.c        | 15 +++++++++++++
>  linux-user/plugin-api.c      | 14 ++++++++++++
>  plugins/api-system.c         | 39 ++++++++++++++++++++++++++++++++
>  plugins/api.c                | 43 ------------------------------------
>  common-user/plugin-api.c.inc | 43 ++++++++++++++++++++++++++++++++++++
>  bsd-user/meson.build         |  1 +
>  linux-user/meson.build       |  1 +
>  plugins/meson.build          |  2 +-
>  8 files changed, 114 insertions(+), 44 deletions(-)
>  create mode 100644 bsd-user/plugin-api.c
>  create mode 100644 linux-user/plugin-api.c
>  create mode 100644 plugins/api-system.c
>  create mode 100644 common-user/plugin-api.c.inc
>
> diff --git a/bsd-user/plugin-api.c b/bsd-user/plugin-api.c
> new file mode 100644
> index 0000000000..6ccef7eaa0
> --- /dev/null
> +++ b/bsd-user/plugin-api.c
> @@ -0,0 +1,15 @@
> +/*
> + * QEMU Plugin API - bsd-user-mode only implementations
> + *
> + * Common user-mode only APIs are in plugins/api-user. These helpers
> + * are only specific to bsd-user.
> + *
> + * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
> + * Copyright (C) 2019-2025, Linaro
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu.h"
> +#include "common-user/plugin-api.c.inc"
> diff --git a/linux-user/plugin-api.c b/linux-user/plugin-api.c
> new file mode 100644
> index 0000000000..e4f796d926
> --- /dev/null
> +++ b/linux-user/plugin-api.c
> @@ -0,0 +1,14 @@
> +/*
> + * QEMU Plugin API - linux-user-mode only implementations
> + *
> + * Common user-mode only APIs are in plugins/api-user. These helpers
> + * are only specific to linux-user.
> + *
> + * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
> + * Copyright (C) 2019-2025, Linaro
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu.h"
> +#include "common-user/plugin-api.c.inc"
> diff --git a/plugins/api-system.c b/plugins/api-system.c
> new file mode 100644
> index 0000000000..cb0dd8f730
> --- /dev/null
> +++ b/plugins/api-system.c
> @@ -0,0 +1,39 @@
> +/*
> + * QEMU Plugin API - System specific implementations
> + *
> + * This provides the APIs that have a specific system implementation
> + * or are only relevant to system-mode.
> + *
> + * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
> + * Copyright (C) 2019-2025, Linaro
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/plugin.h"
> +
> +/*
> + * In system mode we cannot trace the binary being executed so the
> + * helpers all return NULL/0.
> + */
> +const char *qemu_plugin_path_to_binary(void)
> +{
> +    return NULL;
> +}
> +
> +uint64_t qemu_plugin_start_code(void)
> +{
> +    return 0;
> +}
> +
> +uint64_t qemu_plugin_end_code(void)
> +{
> +    return 0;
> +}
> +
> +uint64_t qemu_plugin_entry_code(void)
> +{
> +    return 0;
> +}
> diff --git a/plugins/api.c b/plugins/api.c
> index c3ba1e98e8..ffccd71e4b 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -471,49 +471,6 @@ bool qemu_plugin_bool_parse(const char *name, const
> char *value, bool *ret)
>      return name && value && qapi_bool_parse(name, value, ret, NULL);
>  }
>
> -/*
> - * Binary path, start and end locations
> - */
> -const char *qemu_plugin_path_to_binary(void)
> -{
> -    char *path =3D NULL;
> -#ifdef CONFIG_USER_ONLY
> -    TaskState *ts =3D get_task_state(current_cpu);
> -    path =3D g_strdup(ts->bprm->filename);
> -#endif
> -    return path;
> -}
> -
> -uint64_t qemu_plugin_start_code(void)
> -{
> -    uint64_t start =3D 0;
> -#ifdef CONFIG_USER_ONLY
> -    TaskState *ts =3D get_task_state(current_cpu);
> -    start =3D ts->info->start_code;
> -#endif
> -    return start;
> -}
> -
> -uint64_t qemu_plugin_end_code(void)
> -{
> -    uint64_t end =3D 0;
> -#ifdef CONFIG_USER_ONLY
> -    TaskState *ts =3D get_task_state(current_cpu);
> -    end =3D ts->info->end_code;
> -#endif
> -    return end;
> -}
> -
> -uint64_t qemu_plugin_entry_code(void)
> -{
> -    uint64_t entry =3D 0;
> -#ifdef CONFIG_USER_ONLY
> -    TaskState *ts =3D get_task_state(current_cpu);
> -    entry =3D ts->info->entry;
> -#endif
> -    return entry;
> -}
> -
>  /*
>   * Create register handles.
>   *
> diff --git a/common-user/plugin-api.c.inc b/common-user/plugin-api.c.inc
> new file mode 100644
> index 0000000000..5b8a1396b6
> --- /dev/null
> +++ b/common-user/plugin-api.c.inc
> @@ -0,0 +1,43 @@
> +/*
> + * QEMU Plugin API - *-user-mode only implementations
> + *
> + * Common user-mode only APIs are in plugins/api-user. These helpers
> + * are only specific to the *-user frontends.
> + *
> + * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
> + * Copyright (C) 2019-2025, Linaro
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/plugin.h"
> +#include "qemu.h"
> +
> +/*
> + * Binary path, start and end locations. Host specific due to TaskState.
> + */
> +const char *qemu_plugin_path_to_binary(void)
> +{
> +    TaskState *ts =3D get_task_state(current_cpu);
> +    return g_strdup(ts->bprm->filename);
> +}
> +
> +uint64_t qemu_plugin_start_code(void)
> +{
> +    TaskState *ts =3D get_task_state(current_cpu);
> +    return ts->info->start_code;
> +}
> +
> +uint64_t qemu_plugin_end_code(void)
> +{
> +    TaskState *ts =3D get_task_state(current_cpu);
> +    return ts->info->end_code;
> +}
> +
> +uint64_t qemu_plugin_entry_code(void)
> +{
> +    TaskState *ts =3D get_task_state(current_cpu);
> +    return ts->info->entry;
> +}
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 39bad0ae33..37b7cd6de8 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -13,6 +13,7 @@ bsd_user_ss.add(files(
>    'elfload.c',
>    'main.c',
>    'mmap.c',
> +  'plugin-api.c',
>    'signal.c',
>    'strace.c',
>    'uaccess.c',
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index f75b4fe0e3..f47a213ca3 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -27,6 +27,7 @@ linux_user_ss.add(libdw)
>  linux_user_ss.add(when: 'TARGET_HAS_BFLT', if_true: files('flatload.c'))
>  linux_user_ss.add(when: 'TARGET_I386', if_true: files('vm86.c'))
>  linux_user_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING', if_true:
> files('semihost.c'))
> +linux_user_ss.add(when: 'CONFIG_TCG_PLUGINS', if_true:
> files('plugin-api.c'))
>
>  syscall_nr_generators =3D {}
>
> diff --git a/plugins/meson.build b/plugins/meson.build
> index f7820806d3..9c9bc9e5bb 100644
> --- a/plugins/meson.build
> +++ b/plugins/meson.build
> @@ -59,7 +59,7 @@ if host_os =3D=3D 'windows'
>  endif
>
>  user_ss.add(files('user.c'))
> -system_ss.add(files('system.c'))
> +system_ss.add(files('system.c', 'api-system.c'))
>
>  common_ss.add(files('loader.c'))
>
> --
> 2.39.5
>
>

--000000000000cecf76062f0d38a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26,=
 2025 at 7:11=E2=80=AFAM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee=
@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">To move the main api.c to a single build=
 compilation object we need to<br>
start splitting out user and system specific code. As we need to grob<br>
around host headers we move these particular helpers into the *-user<br>
mode directories.<br>
<br>
The binary/start/end/entry helpers are all NOPs for system mode.<br>
<br>
While using the plugin-api.c.inc trick means we build for both<br>
linux-user and bsd-user the BSD user-mode command line is still<br>
missing -plugin. This can be enabled once we have reliable check-tcg<br>
tests working for the BSDs.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20250225110844.3296991-8-alex.bennee@lina=
ro.org" target=3D"_blank">20250225110844.3296991-8-alex.bennee@linaro.org</=
a>&gt;<br></blockquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a =
href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div><br></div><=
div>I&#39;d love to see the check-tcg working well for bsd, but I&#39;m swa=
mped with</div><div>other commitments.</div><div><br></div><div>Warner</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
v2<br>
=C2=A0 - use common-user/plugin-api.c.inc instead<br>
=C2=A0 - add commentary about state of plugins for BSD user<br>
---<br>
=C2=A0bsd-user/plugin-api.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 +++++++++++++<b=
r>
=C2=A0linux-user/plugin-api.c=C2=A0 =C2=A0 =C2=A0 | 14 ++++++++++++<br>
=C2=A0plugins/api-system.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 39 ++++++++++=
++++++++++++++++++++++<br>
=C2=A0plugins/api.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 43 ------------------------------------<br>
=C2=A0common-user/plugin-api.c.inc | 43 +++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0bsd-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0linux-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0plugins/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br=
>
=C2=A08 files changed, 114 insertions(+), 44 deletions(-)<br>
=C2=A0create mode 100644 bsd-user/plugin-api.c<br>
=C2=A0create mode 100644 linux-user/plugin-api.c<br>
=C2=A0create mode 100644 plugins/api-system.c<br>
=C2=A0create mode 100644 common-user/plugin-api.c.inc<br>
<br>
diff --git a/bsd-user/plugin-api.c b/bsd-user/plugin-api.c<br>
new file mode 100644<br>
index 0000000000..6ccef7eaa0<br>
--- /dev/null<br>
+++ b/bsd-user/plugin-api.c<br>
@@ -0,0 +1,15 @@<br>
+/*<br>
+ * QEMU Plugin API - bsd-user-mode only implementations<br>
+ *<br>
+ * Common user-mode only APIs are in plugins/api-user. These helpers<br>
+ * are only specific to bsd-user.<br>
+ *<br>
+ * Copyright (C) 2017, Emilio G. Cota &lt;<a href=3D"mailto:cota@braap.org=
" target=3D"_blank">cota@braap.org</a>&gt;<br>
+ * Copyright (C) 2019-2025, Linaro<br>
+ *<br>
+ * SPDX-License-Identifier: GPL-2.0-or-later<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu.h&quot;<br>
+#include &quot;common-user/plugin-api.c.inc&quot;<br>
diff --git a/linux-user/plugin-api.c b/linux-user/plugin-api.c<br>
new file mode 100644<br>
index 0000000000..e4f796d926<br>
--- /dev/null<br>
+++ b/linux-user/plugin-api.c<br>
@@ -0,0 +1,14 @@<br>
+/*<br>
+ * QEMU Plugin API - linux-user-mode only implementations<br>
+ *<br>
+ * Common user-mode only APIs are in plugins/api-user. These helpers<br>
+ * are only specific to linux-user.<br>
+ *<br>
+ * Copyright (C) 2017, Emilio G. Cota &lt;<a href=3D"mailto:cota@braap.org=
" target=3D"_blank">cota@braap.org</a>&gt;<br>
+ * Copyright (C) 2019-2025, Linaro<br>
+ *<br>
+ * SPDX-License-Identifier: GPL-2.0-or-later<br>
+ */<br>
+<br>
+#include &quot;qemu.h&quot;<br>
+#include &quot;common-user/plugin-api.c.inc&quot;<br>
diff --git a/plugins/api-system.c b/plugins/api-system.c<br>
new file mode 100644<br>
index 0000000000..cb0dd8f730<br>
--- /dev/null<br>
+++ b/plugins/api-system.c<br>
@@ -0,0 +1,39 @@<br>
+/*<br>
+ * QEMU Plugin API - System specific implementations<br>
+ *<br>
+ * This provides the APIs that have a specific system implementation<br>
+ * or are only relevant to system-mode.<br>
+ *<br>
+ * Copyright (C) 2017, Emilio G. Cota &lt;<a href=3D"mailto:cota@braap.org=
" target=3D"_blank">cota@braap.org</a>&gt;<br>
+ * Copyright (C) 2019-2025, Linaro<br>
+ *<br>
+ * SPDX-License-Identifier: GPL-2.0-or-later<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/main-loop.h&quot;<br>
+#include &quot;qemu/plugin.h&quot;<br>
+<br>
+/*<br>
+ * In system mode we cannot trace the binary being executed so the<br>
+ * helpers all return NULL/0.<br>
+ */<br>
+const char *qemu_plugin_path_to_binary(void)<br>
+{<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+uint64_t qemu_plugin_start_code(void)<br>
+{<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+uint64_t qemu_plugin_end_code(void)<br>
+{<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+uint64_t qemu_plugin_entry_code(void)<br>
+{<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
diff --git a/plugins/api.c b/plugins/api.c<br>
index c3ba1e98e8..ffccd71e4b 100644<br>
--- a/plugins/api.c<br>
+++ b/plugins/api.c<br>
@@ -471,49 +471,6 @@ bool qemu_plugin_bool_parse(const char *name, const ch=
ar *value, bool *ret)<br>
=C2=A0 =C2=A0 =C2=A0return name &amp;&amp; value &amp;&amp; qapi_bool_parse=
(name, value, ret, NULL);<br>
=C2=A0}<br>
<br>
-/*<br>
- * Binary path, start and end locations<br>
- */<br>
-const char *qemu_plugin_path_to_binary(void)<br>
-{<br>
-=C2=A0 =C2=A0 char *path =3D NULL;<br>
-#ifdef CONFIG_USER_ONLY<br>
-=C2=A0 =C2=A0 TaskState *ts =3D get_task_state(current_cpu);<br>
-=C2=A0 =C2=A0 path =3D g_strdup(ts-&gt;bprm-&gt;filename);<br>
-#endif<br>
-=C2=A0 =C2=A0 return path;<br>
-}<br>
-<br>
-uint64_t qemu_plugin_start_code(void)<br>
-{<br>
-=C2=A0 =C2=A0 uint64_t start =3D 0;<br>
-#ifdef CONFIG_USER_ONLY<br>
-=C2=A0 =C2=A0 TaskState *ts =3D get_task_state(current_cpu);<br>
-=C2=A0 =C2=A0 start =3D ts-&gt;info-&gt;start_code;<br>
-#endif<br>
-=C2=A0 =C2=A0 return start;<br>
-}<br>
-<br>
-uint64_t qemu_plugin_end_code(void)<br>
-{<br>
-=C2=A0 =C2=A0 uint64_t end =3D 0;<br>
-#ifdef CONFIG_USER_ONLY<br>
-=C2=A0 =C2=A0 TaskState *ts =3D get_task_state(current_cpu);<br>
-=C2=A0 =C2=A0 end =3D ts-&gt;info-&gt;end_code;<br>
-#endif<br>
-=C2=A0 =C2=A0 return end;<br>
-}<br>
-<br>
-uint64_t qemu_plugin_entry_code(void)<br>
-{<br>
-=C2=A0 =C2=A0 uint64_t entry =3D 0;<br>
-#ifdef CONFIG_USER_ONLY<br>
-=C2=A0 =C2=A0 TaskState *ts =3D get_task_state(current_cpu);<br>
-=C2=A0 =C2=A0 entry =3D ts-&gt;info-&gt;entry;<br>
-#endif<br>
-=C2=A0 =C2=A0 return entry;<br>
-}<br>
-<br>
=C2=A0/*<br>
=C2=A0 * Create register handles.<br>
=C2=A0 *<br>
diff --git a/common-user/plugin-api.c.inc b/common-user/plugin-api.c.inc<br=
>
new file mode 100644<br>
index 0000000000..5b8a1396b6<br>
--- /dev/null<br>
+++ b/common-user/plugin-api.c.inc<br>
@@ -0,0 +1,43 @@<br>
+/*<br>
+ * QEMU Plugin API - *-user-mode only implementations<br>
+ *<br>
+ * Common user-mode only APIs are in plugins/api-user. These helpers<br>
+ * are only specific to the *-user frontends.<br>
+ *<br>
+ * Copyright (C) 2017, Emilio G. Cota &lt;<a href=3D"mailto:cota@braap.org=
" target=3D"_blank">cota@braap.org</a>&gt;<br>
+ * Copyright (C) 2019-2025, Linaro<br>
+ *<br>
+ * SPDX-License-Identifier: GPL-2.0-or-later<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/main-loop.h&quot;<br>
+#include &quot;qemu/plugin.h&quot;<br>
+#include &quot;qemu.h&quot;<br>
+<br>
+/*<br>
+ * Binary path, start and end locations. Host specific due to TaskState.<b=
r>
+ */<br>
+const char *qemu_plugin_path_to_binary(void)<br>
+{<br>
+=C2=A0 =C2=A0 TaskState *ts =3D get_task_state(current_cpu);<br>
+=C2=A0 =C2=A0 return g_strdup(ts-&gt;bprm-&gt;filename);<br>
+}<br>
+<br>
+uint64_t qemu_plugin_start_code(void)<br>
+{<br>
+=C2=A0 =C2=A0 TaskState *ts =3D get_task_state(current_cpu);<br>
+=C2=A0 =C2=A0 return ts-&gt;info-&gt;start_code;<br>
+}<br>
+<br>
+uint64_t qemu_plugin_end_code(void)<br>
+{<br>
+=C2=A0 =C2=A0 TaskState *ts =3D get_task_state(current_cpu);<br>
+=C2=A0 =C2=A0 return ts-&gt;info-&gt;end_code;<br>
+}<br>
+<br>
+uint64_t qemu_plugin_entry_code(void)<br>
+{<br>
+=C2=A0 =C2=A0 TaskState *ts =3D get_task_state(current_cpu);<br>
+=C2=A0 =C2=A0 return ts-&gt;info-&gt;entry;<br>
+}<br>
diff --git a/bsd-user/meson.build b/bsd-user/meson.build<br>
index 39bad0ae33..37b7cd6de8 100644<br>
--- a/bsd-user/meson.build<br>
+++ b/bsd-user/meson.build<br>
@@ -13,6 +13,7 @@ bsd_user_ss.add(files(<br>
=C2=A0 =C2=A0&#39;elfload.c&#39;,<br>
=C2=A0 =C2=A0&#39;main.c&#39;,<br>
=C2=A0 =C2=A0&#39;mmap.c&#39;,<br>
+=C2=A0 &#39;plugin-api.c&#39;,<br>
=C2=A0 =C2=A0&#39;signal.c&#39;,<br>
=C2=A0 =C2=A0&#39;strace.c&#39;,<br>
=C2=A0 =C2=A0&#39;uaccess.c&#39;,<br>
diff --git a/linux-user/meson.build b/linux-user/meson.build<br>
index f75b4fe0e3..f47a213ca3 100644<br>
--- a/linux-user/meson.build<br>
+++ b/linux-user/meson.build<br>
@@ -27,6 +27,7 @@ linux_user_ss.add(libdw)<br>
=C2=A0linux_user_ss.add(when: &#39;TARGET_HAS_BFLT&#39;, if_true: files(&#3=
9;flatload.c&#39;))<br>
=C2=A0linux_user_ss.add(when: &#39;TARGET_I386&#39;, if_true: files(&#39;vm=
86.c&#39;))<br>
=C2=A0linux_user_ss.add(when: &#39;CONFIG_ARM_COMPATIBLE_SEMIHOSTING&#39;, =
if_true: files(&#39;semihost.c&#39;))<br>
+linux_user_ss.add(when: &#39;CONFIG_TCG_PLUGINS&#39;, if_true: files(&#39;=
plugin-api.c&#39;))<br>
<br>
=C2=A0syscall_nr_generators =3D {}<br>
<br>
diff --git a/plugins/meson.build b/plugins/meson.build<br>
index f7820806d3..9c9bc9e5bb 100644<br>
--- a/plugins/meson.build<br>
+++ b/plugins/meson.build<br>
@@ -59,7 +59,7 @@ if host_os =3D=3D &#39;windows&#39;<br>
=C2=A0endif<br>
<br>
=C2=A0user_ss.add(files(&#39;user.c&#39;))<br>
-system_ss.add(files(&#39;system.c&#39;))<br>
+system_ss.add(files(&#39;system.c&#39;, &#39;api-system.c&#39;))<br>
<br>
=C2=A0common_ss.add(files(&#39;loader.c&#39;))<br>
<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div></div>

--000000000000cecf76062f0d38a4--
