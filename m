Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7753584wrv;
        Thu, 8 Aug 2019 04:42:08 -0700 (PDT)
X-Received: by 2002:a05:6808:144:: with SMTP id h4mr2059358oie.20.1565264528048;
        Thu, 08 Aug 2019 04:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565264528; cv=none;
        d=google.com; s=arc-20160816;
        b=IQpLzsyXVDjM+xOkbuqyovHBpy66Jea9ovIJ0nmKQrTen5XDN+izvVfozqDKX3D6Ym
         kpjfzx5oz8Tep8obmcEGArSDty+LyyJYo04vvNDxjP4yuentg9TKBtxnPBW+1hPDxIYW
         vHWeU7PSTq/dKSoX7nbr94pezzJj6+Bsa/uqIrXUIvUk7oLHnXTiC0fACBBfGe8JT68v
         58F3ta0gI4hFbYqE7gq6o7LUXZzaLsjVid5OwBadqAttlEY8TJbvdnWJSbwbsxX9Pf83
         le1mbDEEvDLc1Z19HCkaTl0QA+9J2nABlfbYcx29JTb+r9J89P8VWTnZ/jKs5lt3x62n
         qThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CKno2DapZpYQu3Z86w+Y/66MwzpYCKih6dsAa+KGQMM=;
        b=IoghgWxGTxSgMUVOOHqGur9NIyjJPbfEfECDw9daWuFYKdaYSN77p8gWEk10ObqFOh
         fDFkFM7/Igki23rYMuCip7ZmUITa0hOjiXa7TAYiOA/p3HFEPEebbukTN+FKnzGsVgjH
         bnh43SmvRd/y/6ozv5EGT1P9faHz60S94w4orglyfV1zQu8h5PdJBeLI4/jWsuaBfg2u
         i5i3UWQZL2SFJrq1GtrNK7X2kdDTUSXEdt8MclUvVncsSyt0sWKQU7MZhlZZZxskbJ34
         qmI8QiKsFGV3Ad446Qnt0KIqazzYstse8Rwv4+UQ/q6JOd5xPV6BMdoWlXYWPSFzUKPf
         w2fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nvfew2mL;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.m.mail@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v16sor42209204oie.59.2019.08.08.04.42.07
        (Google Transport Security);
        Thu, 08 Aug 2019 04:42:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nvfew2mL;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CKno2DapZpYQu3Z86w+Y/66MwzpYCKih6dsAa+KGQMM=;
        b=Nvfew2mLDamU8cFkBhiE2CiDDCVnotyr+hOUtAfW7/+xfmWZotY5HkD7FutbawFQ9l
         p7pAhxypd2PXJ+z9YPgCXnPbBEh7sDUoXhdVZCj60t9MahN5LtisHl6E9nNkobIZz+gQ
         bOuDc9Aop7eiPF9pA+Mx6sjWYGQcl0rtso+y/N4L83NUGiLtivmOsxVEIm3Wpkfo38qp
         Ly/uFN9ZQ0OeE9ksxZHyyjeV76xwUAqZOyIuYkl5m9SP4DNkvXCC/EO7IvQsKQquzUgH
         da9CJYAuYwheKzLkSOZVLiTE1s5BW5qRZrQsnz28ivc8lh3Ik5FtaJVGkk1tcrTOIMg1
         6tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CKno2DapZpYQu3Z86w+Y/66MwzpYCKih6dsAa+KGQMM=;
        b=US+Hma4kG+VOBmH91IZY32zvZJvMTxi8pNpNtWBBtkIhRYQO7UyFboKaHbsH57vhH1
         MLG7jTD2KYS6yR11QZ3kHF09ah/A90R3ha4Scf94wbDitSLfHUGYqjygWs9ItYG+EouU
         eX6J7NJtlYrs1rLE9EuRkMNC4MK1Rubxeg5BScmd+9lElcR9jGWPfYzCYUcLPlZgnAsc
         RSlzSOJ+LopDxqhIR8LgvNIljddEisBnbBRGu/zzhwAspY98HvgZYwz/wsQdfWB7Txci
         aJhi8WB7IhafoA5VHaPGWH08Bc/KRRl2MCz0DR1PGtMiOFBwPh7voxIxeyrsyz4bmXHL
         d8kA==
X-Gm-Message-State: APjAAAUQ+UqJNvDDOOhzPQGO2++7t7yUIVuYe2AxHJgWw2rRLDxA3Glr
	CwXsKvC0I2WmYNDWlLwsav0wSbD/Vcgi8/t5nr80WPZ1
X-Google-Smtp-Source: APXvYqycvW8qLjEFI1IdB++gfO6awBOibqkHotUF7WIlQxSpl0A8fDc5jIFe4oIeNwCNK3/oTRDkW6QyAfPQQwrNuLw=
X-Received: by 2002:a54:4619:: with SMTP id p25mr2464756oip.62.1565264527449;
 Thu, 08 Aug 2019 04:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-12-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-12-richard.henderson@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 8 Aug 2019 13:41:56 +0200
Message-ID: <CAL1e-=gwyGB4ibo_B5W1MpFy-9bB7=5juqTJVBdD9N6XFOOsSQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 11/67] target/arm: Add stubs for aa32 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:Stellaris" <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000236167058f998c62"
X-TUID: zDKXoo9T9HEZ

--000000000000236167058f998c62
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 26, 2019 at 8:05 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Add the infrastructure that will become the new decoder.
> No instructions adjusted so far.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c       | 45 +++++++++++++++++++++++++++++++++++-
>  target/arm/Makefile.objs     | 18 +++++++++++++++
>  target/arm/a32-uncond.decode | 23 ++++++++++++++++++
>  target/arm/a32.decode        | 23 ++++++++++++++++++
>  target/arm/t32.decode        | 20 ++++++++++++++++
>  5 files changed, 128 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/a32-uncond.decode
>  create mode 100644 target/arm/a32.decode
>  create mode 100644 target/arm/t32.decode
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 36419025db..4738b91957 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7715,6 +7715,33 @@ static void arm_skip_unless(DisasContext *s,
> uint32_t cond)
>      }
>  }
>
> +/*
> + * Include the generated decoders.
> + * Note that the T32 decoder reuses some of the trans_* functions
> + * initially declared by the A32 decoder, which results in duplicate
> + * declaration warnings.  Suppress them.
> + */
> +
> +#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> +# pragma GCC diagnostic push
> +# pragma GCC diagnostic ignored "-Wredundant-decls"
> +# ifdef __clang__
> +#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
> +# endif
> +#endif
> +
>

This looks more like a "band aid" solution rather than the right one.

I find it surprising that in spite of ever-growing complexity and numerous
refinements of the decodetree module, it still generates code that causes
these complaints of the compiler.

Regards,
Aleksandar



> +#include "decode-a32.inc.c"
> +#include "decode-a32-uncond.inc.c"
> +#include "decode-t32.inc.c"
> +
> +#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> +# pragma GCC diagnostic pop
> +#endif
> +
> +/*
> + * Legacy decoder.
> + */
> +
>  static void disas_arm_insn(DisasContext *s, unsigned int insn)
>  {
>      unsigned int cond, val, op1, i, shift, rm, rs, rn, rd, sh;
> @@ -7733,7 +7760,8 @@ static void disas_arm_insn(DisasContext *s, unsigned
> int insn)
>          return;
>      }
>      cond = insn >> 28;
> -    if (cond == 0xf){
> +
> +    if (cond == 0xf) {
>          /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
>           * choose to UNDEF. In ARMv5 and above the space is used
>           * for miscellaneous unconditional instructions.
> @@ -7741,6 +7769,11 @@ static void disas_arm_insn(DisasContext *s,
> unsigned int insn)
>          ARCH(5);
>
>          /* Unconditional instructions.  */
> +        if (disas_a32_uncond(s, insn)) {
> +            return;
> +        }
> +        /* fall back to legacy decoder */
> +
>          if (((insn >> 25) & 7) == 1) {
>              /* NEON Data processing.  */
>              if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
> @@ -7953,6 +7986,11 @@ static void disas_arm_insn(DisasContext *s,
> unsigned int insn)
>
>      arm_skip_unless(s, cond);
>
> +    if (disas_a32(s, insn)) {
> +        return;
> +    }
> +    /* fall back to legacy decoder */
> +
>      if ((insn & 0x0f900000) == 0x03000000) {
>          if ((insn & (1 << 21)) == 0) {
>              ARCH(6T2);
> @@ -9440,6 +9478,11 @@ static void disas_thumb2_insn(DisasContext *s,
> uint32_t insn)
>          ARCH(6T2);
>      }
>
> +    if (disas_t32(s, insn)) {
> +        return;
> +    }
> +    /* fall back to legacy decoder */
> +
>      rn = (insn >> 16) & 0xf;
>      rs = (insn >> 12) & 0xf;
>      rd = (insn >> 8) & 0xf;
> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
> index 5cafc1eb6c..7806b4dac0 100644
> --- a/target/arm/Makefile.objs
> +++ b/target/arm/Makefile.objs
> @@ -28,9 +28,27 @@ target/arm/decode-vfp-uncond.inc.c:
> $(SRC_PATH)/target/arm/vfp-uncond.decode $(D
>           $(PYTHON) $(DECODETREE) --static-decode disas_vfp_uncond -o $@
> $<,\
>           "GEN", $(TARGET_DIR)$@)
>
> +target/arm/decode-a32.inc.c: $(SRC_PATH)/target/arm/a32.decode
> $(DECODETREE)
> +       $(call quiet-command,\
> +         $(PYTHON) $(DECODETREE) --static-decode disas_a32 -o $@ $<,\
> +         "GEN", $(TARGET_DIR)$@)
> +
> +target/arm/decode-a32-uncond.inc.c:
> $(SRC_PATH)/target/arm/a32-uncond.decode $(DECODETREE)
> +       $(call quiet-command,\
> +         $(PYTHON) $(DECODETREE) --static-decode disas_a32_uncond -o $@
> $<,\
> +         "GEN", $(TARGET_DIR)$@)
> +
> +target/arm/decode-t32.inc.c: $(SRC_PATH)/target/arm/t32.decode
> $(DECODETREE)
> +       $(call quiet-command,\
> +         $(PYTHON) $(DECODETREE) --static-decode disas_t32 -o $@ $<,\
> +         "GEN", $(TARGET_DIR)$@)
> +
>  target/arm/translate-sve.o: target/arm/decode-sve.inc.c
>  target/arm/translate.o: target/arm/decode-vfp.inc.c
>  target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
> +target/arm/translate.o: target/arm/decode-a32.inc.c
> +target/arm/translate.o: target/arm/decode-a32-uncond.inc.c
> +target/arm/translate.o: target/arm/decode-t32.inc.c
>
>  obj-y += tlb_helper.o debug_helper.o
>  obj-y += translate.o op_helper.o
> diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
> new file mode 100644
> index 0000000000..8dee26d3b6
> --- /dev/null
> +++ b/target/arm/a32-uncond.decode
> @@ -0,0 +1,23 @@
> +# A32 unconditional instructions
> +#
> +#  Copyright (c) 2019 Linaro, Ltd
> +#
> +# This library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2 of the License, or (at your option) any later version.
> +#
> +# This library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with this library; if not, see <
> http://www.gnu.org/licenses/>.
> +
> +#
> +# This file is processed by scripts/decodetree.py
> +#
> +# All insns that have 0xf in insn[31:28] are decoded here.
> +# All of those that have a COND field in insn[31:28] are in a32.decode
> +#
> diff --git a/target/arm/a32.decode b/target/arm/a32.decode
> new file mode 100644
> index 0000000000..2d84a02861
> --- /dev/null
> +++ b/target/arm/a32.decode
> @@ -0,0 +1,23 @@
> +# A32 conditional instructions
> +#
> +#  Copyright (c) 2019 Linaro, Ltd
> +#
> +# This library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2 of the License, or (at your option) any later version.
> +#
> +# This library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with this library; if not, see <
> http://www.gnu.org/licenses/>.
> +
> +#
> +# This file is processed by scripts/decodetree.py
> +#
> +# All of the insn that have a COND field in insn[31:28] are here.
> +# All insns that have 0xf in insn[31:28] are in a32u.decode.
> +#
> diff --git a/target/arm/t32.decode b/target/arm/t32.decode
> new file mode 100644
> index 0000000000..ac01fb6958
> --- /dev/null
> +++ b/target/arm/t32.decode
> @@ -0,0 +1,20 @@
> +# Thumb2 instructions
> +#
> +#  Copyright (c) 2019 Linaro, Ltd
> +#
> +# This library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2 of the License, or (at your option) any later version.
> +#
> +# This library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with this library; if not, see <
> http://www.gnu.org/licenses/>.
> +
> +#
> +# This file is processed by scripts/decodetree.py
> +#
> --
> 2.17.1
>
>
>

--000000000000236167058f998c62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 26, 2019 at 8:05 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Add the infrastructure that will become the new decoder.<=
br>
No instructions adjusted so far.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/arm/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 45 +++++++++++++++=
++++++++++++++++++++-<br>
=C2=A0target/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0| 18 +++++++++++++++<br>
=C2=A0target/arm/a32-uncond.decode | 23 ++++++++++++++++++<br>
=C2=A0target/arm/a32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++++++++++++++=
+++<br>
=C2=A0target/arm/t32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20 +++++++++++++++=
+<br>
=C2=A05 files changed, 128 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 target/arm/a32-uncond.decode<br>
=C2=A0create mode 100644 target/arm/a32.decode<br>
=C2=A0create mode 100644 target/arm/t32.decode<br>
<br>
diff --git a/target/arm/translate.c b/target/arm/translate.c<br>
index 36419025db..4738b91957 100644<br>
--- a/target/arm/translate.c<br>
+++ b/target/arm/translate.c<br>
@@ -7715,6 +7715,33 @@ static void arm_skip_unless(DisasContext *s, uint32_=
t cond)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+/*<br>
+ * Include the generated decoders.<br>
+ * Note that the T32 decoder reuses some of the trans_* functions<br>
+ * initially declared by the A32 decoder, which results in duplicate<br>
+ * declaration warnings.=C2=A0 Suppress them.<br>
+ */<br>
+<br>
+#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE<br>
+# pragma GCC diagnostic push<br>
+# pragma GCC diagnostic ignored &quot;-Wredundant-decls&quot;<br>
+# ifdef __clang__<br>
+#=C2=A0 pragma GCC diagnostic ignored &quot;-Wtypedef-redefinition&quot;<b=
r>
+# endif<br>
+#endif<br>
+<br></blockquote><div><br></div><div>This looks more like a &quot;band aid=
&quot; solution rather than the right one.</div><div><br></div><div>I find =
it surprising that in spite of ever-growing complexity and numerous refinem=
ents of the decodetree module, it still generates code that causes these co=
mplaints of the compiler.</div><div><br></div><div>Regards,</div><div>Aleks=
andar</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+#include &quot;decode-a32.inc.c&quot;<br>
+#include &quot;decode-a32-uncond.inc.c&quot;<br>
+#include &quot;decode-t32.inc.c&quot;<br>
+<br>
+#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE<br>
+# pragma GCC diagnostic pop<br>
+#endif<br>
+<br>
+/*<br>
+ * Legacy decoder.<br>
+ */<br>
+<br>
=C2=A0static void disas_arm_insn(DisasContext *s, unsigned int insn)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0unsigned int cond, val, op1, i, shift, rm, rs, rn, rd, =
sh;<br>
@@ -7733,7 +7760,8 @@ static void disas_arm_insn(DisasContext *s, unsigned =
int insn)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0cond =3D insn &gt;&gt; 28;<br>
-=C2=A0 =C2=A0 if (cond =3D=3D 0xf){<br>
+<br>
+=C2=A0 =C2=A0 if (cond =3D=3D 0xf) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* In ARMv3 and v4 the NV condition is UN=
PREDICTABLE; we<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * choose to UNDEF. In ARMv5 and above th=
e space is used<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * for miscellaneous unconditional instru=
ctions.<br>
@@ -7741,6 +7769,11 @@ static void disas_arm_insn(DisasContext *s, unsigned=
 int insn)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH(5);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Unconditional instructions.=C2=A0 */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (disas_a32_uncond(s, insn)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall back to legacy decoder */<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (((insn &gt;&gt; 25) &amp; 7) =3D=3D 1=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* NEON Data processing.=C2=
=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!arm_dc_feature(s, ARM_=
FEATURE_NEON)) {<br>
@@ -7953,6 +7986,11 @@ static void disas_arm_insn(DisasContext *s, unsigned=
 int insn)<br>
<br>
=C2=A0 =C2=A0 =C2=A0arm_skip_unless(s, cond);<br>
<br>
+=C2=A0 =C2=A0 if (disas_a32(s, insn)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* fall back to legacy decoder */<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if ((insn &amp; 0x0f900000) =3D=3D 0x03000000) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((insn &amp; (1 &lt;&lt; 21)) =3D=3D 0=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH(6T2);<br>
@@ -9440,6 +9478,11 @@ static void disas_thumb2_insn(DisasContext *s, uint3=
2_t insn)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH(6T2);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (disas_t32(s, insn)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* fall back to legacy decoder */<br>
+<br>
=C2=A0 =C2=A0 =C2=A0rn =3D (insn &gt;&gt; 16) &amp; 0xf;<br>
=C2=A0 =C2=A0 =C2=A0rs =3D (insn &gt;&gt; 12) &amp; 0xf;<br>
=C2=A0 =C2=A0 =C2=A0rd =3D (insn &gt;&gt; 8) &amp; 0xf;<br>
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs<br>
index 5cafc1eb6c..7806b4dac0 100644<br>
--- a/target/arm/Makefile.objs<br>
+++ b/target/arm/Makefile.objs<br>
@@ -28,9 +28,27 @@ target/arm/decode-vfp-uncond.inc.c: $(SRC_PATH)/target/a=
rm/vfp-uncond.decode $(D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON) $(DECODETREE) --static-decode =
disas_vfp_uncond -o $@ $&lt;,\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;GEN&quot;, $(TARGET_DIR)$@)<br>
<br>
+target/arm/decode-a32.inc.c: $(SRC_PATH)/target/arm/a32.decode $(DECODETRE=
E)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command,\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON) $(DECODETREE) --static-decode =
disas_a32 -o $@ $&lt;,\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;GEN&quot;, $(TARGET_DIR)$@)<br>
+<br>
+target/arm/decode-a32-uncond.inc.c: $(SRC_PATH)/target/arm/a32-uncond.deco=
de $(DECODETREE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command,\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON) $(DECODETREE) --static-decode =
disas_a32_uncond -o $@ $&lt;,\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;GEN&quot;, $(TARGET_DIR)$@)<br>
+<br>
+target/arm/decode-t32.inc.c: $(SRC_PATH)/target/arm/t32.decode $(DECODETRE=
E)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command,\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON) $(DECODETREE) --static-decode =
disas_t32 -o $@ $&lt;,\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;GEN&quot;, $(TARGET_DIR)$@)<br>
+<br>
=C2=A0target/arm/translate-sve.o: target/arm/decode-sve.inc.c<br>
=C2=A0target/arm/translate.o: target/arm/decode-vfp.inc.c<br>
=C2=A0target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c<br>
+target/arm/translate.o: target/arm/decode-a32.inc.c<br>
+target/arm/translate.o: target/arm/decode-a32-uncond.inc.c<br>
+target/arm/translate.o: target/arm/decode-t32.inc.c<br>
<br>
=C2=A0obj-y +=3D tlb_helper.o debug_helper.o<br>
=C2=A0obj-y +=3D translate.o op_helper.o<br>
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode<br=
>
new file mode 100644<br>
index 0000000000..8dee26d3b6<br>
--- /dev/null<br>
+++ b/target/arm/a32-uncond.decode<br>
@@ -0,0 +1,23 @@<br>
+# A32 unconditional instructions<br>
+#<br>
+#=C2=A0 Copyright (c) 2019 Linaro, Ltd<br>
+#<br>
+# This library is free software; you can redistribute it and/or<br>
+# modify it under the terms of the GNU Lesser General Public<br>
+# License as published by the Free Software Foundation; either<br>
+# version 2 of the License, or (at your option) any later version.<br>
+#<br>
+# This library is distributed in the hope that it will be useful,<br>
+# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU<b=
r>
+# Lesser General Public License for more details.<br>
+#<br>
+# You should have received a copy of the GNU Lesser General Public<br>
+# License along with this library; if not, see &lt;<a href=3D"http://www.g=
nu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/l=
icenses/</a>&gt;.<br>
+<br>
+#<br>
+# This file is processed by scripts/decodetree.py<br>
+#<br>
+# All insns that have 0xf in insn[31:28] are decoded here.<br>
+# All of those that have a COND field in insn[31:28] are in a32.decode<br>
+#<br>
diff --git a/target/arm/a32.decode b/target/arm/a32.decode<br>
new file mode 100644<br>
index 0000000000..2d84a02861<br>
--- /dev/null<br>
+++ b/target/arm/a32.decode<br>
@@ -0,0 +1,23 @@<br>
+# A32 conditional instructions<br>
+#<br>
+#=C2=A0 Copyright (c) 2019 Linaro, Ltd<br>
+#<br>
+# This library is free software; you can redistribute it and/or<br>
+# modify it under the terms of the GNU Lesser General Public<br>
+# License as published by the Free Software Foundation; either<br>
+# version 2 of the License, or (at your option) any later version.<br>
+#<br>
+# This library is distributed in the hope that it will be useful,<br>
+# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU<b=
r>
+# Lesser General Public License for more details.<br>
+#<br>
+# You should have received a copy of the GNU Lesser General Public<br>
+# License along with this library; if not, see &lt;<a href=3D"http://www.g=
nu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/l=
icenses/</a>&gt;.<br>
+<br>
+#<br>
+# This file is processed by scripts/decodetree.py<br>
+#<br>
+# All of the insn that have a COND field in insn[31:28] are here.<br>
+# All insns that have 0xf in insn[31:28] are in a32u.decode.<br>
+#<br>
diff --git a/target/arm/t32.decode b/target/arm/t32.decode<br>
new file mode 100644<br>
index 0000000000..ac01fb6958<br>
--- /dev/null<br>
+++ b/target/arm/t32.decode<br>
@@ -0,0 +1,20 @@<br>
+# Thumb2 instructions<br>
+#<br>
+#=C2=A0 Copyright (c) 2019 Linaro, Ltd<br>
+#<br>
+# This library is free software; you can redistribute it and/or<br>
+# modify it under the terms of the GNU Lesser General Public<br>
+# License as published by the Free Software Foundation; either<br>
+# version 2 of the License, or (at your option) any later version.<br>
+#<br>
+# This library is distributed in the hope that it will be useful,<br>
+# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU<b=
r>
+# Lesser General Public License for more details.<br>
+#<br>
+# You should have received a copy of the GNU Lesser General Public<br>
+# License along with this library; if not, see &lt;<a href=3D"http://www.g=
nu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/l=
icenses/</a>&gt;.<br>
+<br>
+#<br>
+# This file is processed by scripts/decodetree.py<br>
+#<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000236167058f998c62--
