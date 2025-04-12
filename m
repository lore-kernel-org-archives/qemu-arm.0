Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp915884njc;
        Sat, 12 Apr 2025 02:04:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf82:b0:1f5:8cf7:de4b with SMTP id adf61e73a8af0-2017959b180mr7376222637.16.1744448687316;
        Sat, 12 Apr 2025 02:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744448687; cv=none;
        d=google.com; s=arc-20240605;
        b=EMus8dEH8zAiN5YHOZmOEs8gCd/4Yhah/bzvQyZ8eyZAH76GoSHJPQYScquRRNWWF8
         Ac5094+mDRZVaI5PdN5D2mxyY2SQYHcsbEwss4gBbGboFEGFYaWCgbRhFz/2VUlnKy6x
         +Atlm/7eNReg+neJ6yo6z4ADO14L5KPB9FJSpHohxloMekcjTMbE7aZNS/ldYmKfFKs8
         yYUI3KjzqnWF5DBsNzRX8vGZmDoeoolg1uufX7voWxZPOgL63UBf/GVsWiLNT+8FUOCt
         4Nml0yXRGMUWa+cXr5X6E5+yjc8Gx9YsSYCqbTA+/spve2zJlgXA8IyzvmU6wKuv2q9J
         kclQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oEiLipnvsKcQMkPKwfqRP4Rn+ofRlgKbhD3Gs9CpC+o=;
        fh=91S5Rs827F4GJWZOx3plEQkNonmHDTg5H1MHrPpIZXM=;
        b=ZMiIpBdZusn9FsW/lvZpRR3edlCeHmVM2+Ehq4R7+IZhWspFN4Osypt2tqJwzPHeRN
         YBzSUG6ow4k2CQMq7/PWiqxMEvvghteB9YbULJX4kxqra2s73hFzJvSjH/IBbUT/canJ
         2IEhPqdkFAlgtGGjpruBYaPKLwy52+U9J81IEQNkKYCjbgJnDYDjSy9WJereSWJMBuGi
         XdVK4HdcDOywYcCHjHBFfv2hZ3iTuyjZA4uXK1HjCgxuuqi/v4tF/Yr66LnNo6tCi1tM
         gLfku/GilFwytLSXSw9clcogRUmZK7/BeGaqTiG1g88UXKOMAHVMU5FsJr1m8EukANwB
         w6BQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAI24mb1;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b0276fd6fe5sor4536717a12.0.2025.04.12.02.04.47
        (Google Transport Security);
        Sat, 12 Apr 2025 02:04:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAI24mb1;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744448687; x=1745053487; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oEiLipnvsKcQMkPKwfqRP4Rn+ofRlgKbhD3Gs9CpC+o=;
        b=lAI24mb1z0QUB06Sgdbdr7M4q53EQy2F451WRQ9PC8bld4UGeF6pL8/Ca4VNBWmvj+
         ePr34CsEblxtv/UHIh/4Lz2xqIb+hrb3OSosMWkDQVQEXYbifQVWPbMcQTKVN1nSGUtO
         tnXS/Rh8BXkylRtD2wim+wQx10f9rNsZGC5nHKAuKmHQ2oHFNqXNZeNDASZ069G7iiP1
         bjcakw2DOgMs3NIN2vwpNEtfyfFSsJ2P0dtBxt6dzPBev7m9mZIT7p3bFpbNkpWcrZ9c
         S1TvMUdre5koLMadGlZN4jfjaJ61m13ganAOlifI2VzVbgJnHee5n/cbZ7uO8v5AUm4r
         KeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744448687; x=1745053487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEiLipnvsKcQMkPKwfqRP4Rn+ofRlgKbhD3Gs9CpC+o=;
        b=UStcOIlXgYYrzYzx/UP/I88u9UCCTOlPDSI6Paq+6upwzdsPMVLvAJPRDh6Ow5s1ch
         ZxG4x4N1ubuSzIP7EJnlm1M38tA74ruQ8NJh74yLExzfcku7lvMdSTdtYMUV0Px7xLko
         WAPKkWAaYwKSuVhqsrvXs3VhEQ5yw4N506RjqdFjimx+EmoX/CJ0bP5LrRBx9vD9SLE/
         7Rlx9ySjxNCurEFbJ7+1PgvBw8Kbag4d937wk0lcUEBVRD1/rDT6WWlUT7eiGVui494z
         8FFd6xc4Rd22WgoCG6VT4gcfI2M1Es+FHfJNj2qESdGUm04e/L7tl8kW3LzsO4yRfuzT
         Ya9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXhjXBDPUspjyZsTW18fepPRnaxxO71FA+XP+tdIA7mOJT7/FjROG0DHpWOWgkuAFtzGQ/6EU3ot37SS0gYEHaA6U=@linaro.org, AJvYcCXjo4l6i+BCE8yW1OODrJeTDPsSduLixbhCTM85yiiAQPMauTo9bR9KE5cdPCa75YzPGKS3+TAPP6y/LInM@linaro.org
X-Gm-Message-State: AOJu0Yxvy1QRvz04p4Q783O3gou2tTiR9uHwC19WQQTGfRQPpEp+/PCX
	SzrfkOrMp6B7SzdgN7fmyuuQiryCzc1GcdKwfo4FhBtkHxBSnS6HvZ7VCwqkk7rQ5rZwqAJZ3r4
	3kqAzlTWxfSf+CCk/h0Os599EpR5T+Ip0CBQ=
X-Gm-Gg: ASbGncvfmrW6FYi5ijsV5jrL8gpLRz/NfTRVF2ccoVtBDoz5JQXxSoV++DgsSNnRTOM
	8rzBNrbSs09hojY2uoXSTPOm4wQhsxvglxlT6KSGLPug5Lu07EK81pjVgHJVK5+3Nx6sKXfD9KU
	Gx34pm5eZEhs+3vKBVg6YA73zg7qeSPlTNMtU9JM1Vc+KwWCuEJt89QcihUnwqAg==
X-Google-Smtp-Source: AGHT+IFQ0eWcMBThgwrsDqQxBeUhx/8wH5Y0zRfw+lVVwVZWbQZ8ZkhT3Dhc6QF3VBzutjP/cPGhxwFNejUT6GOQg5M=
X-Received: by 2002:a17:90b:5111:b0:2ff:53d6:2b82 with SMTP id
 98e67ed59e1d1-30784d3f77emr15557946a91.11.1744448686486; Sat, 12 Apr 2025
 02:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <24b5ff124d70043aff97dc30aa45f8a502676989.1744032780.git.ktokunaga.mail@gmail.com>
 <264d9113-16ce-4c05-a468-78e1f9921df6@linaro.org>
In-Reply-To: <264d9113-16ce-4c05-a468-78e1f9921df6@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Sat, 12 Apr 2025 18:04:34 +0900
X-Gm-Features: ATxdqUFx6htIveUfw8JOGhtktwCwD1PA9Pd1byehNiK70ORRRwiyOyho3hePkAo
Message-ID: <CAEDrbUZO+vJZacBJeE2Od_9Eb+vjX1JYCsNz1QQA4MKFTi9cnw@mail.gmail.com>
Subject: Re: [PATCH 07/10] tcg: Add a TCG backend for WebAssembly
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000497be10632911ced"
X-TUID: yeJ5gQRJOlVP

--000000000000497be10632911ced
Content-Type: text/plain; charset="UTF-8"

Hi Philippe, thank you for the feedback.

> > diff --git a/tcg/tcg.c b/tcg/tcg.c
> > index dfd48b8264..154a4dafa7 100644
> > --- a/tcg/tcg.c
> > +++ b/tcg/tcg.c
> > @@ -136,6 +136,10 @@ static void tcg_out_goto_tb(TCGContext *s, int
which);
> >   static void tcg_out_op(TCGContext *s, TCGOpcode opc, TCGType type,
> >                          const TCGArg args[TCG_MAX_OP_ARGS],
> >                          const int const_args[TCG_MAX_OP_ARGS]);
> > +#if defined(EMSCRIPTEN)
>
> Maybe we can let this independently of EMSCRIPTEN, to reduce #ifdef'ry.

Sure, I'll make this independent of EMSCRIPTEN in the next version of the
series.

> > +static void tcg_out_label_cb(TCGContext *s, TCGLabel *l);
> > +static int tcg_out_tb_end(TCGContext *s);
> > +#endif
> >   #if TCG_TARGET_MAYBE_vec
> >   static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned
vece,
> >                               TCGReg dst, TCGReg src);
> > @@ -251,7 +255,7 @@ TCGv_env tcg_env;
> >   const void *tcg_code_gen_epilogue;
> >   uintptr_t tcg_splitwx_diff;
> >
> > -#ifndef CONFIG_TCG_INTERPRETER
> > +#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
>
> s/&&/||/ otherwise breaks TCI? (various cases)

Thank you for pointing this out. Let me break it down with a table to
clarify this logic.

                  | !defined(CONFIG_TCG_INTERPRETER) | !defined(EMSCRIPTEN)
| && | || |
------------------+----------------------------------+----------------------+----+----+
non-emcc + TCI    |              F                   |           T
 | F  |  T |
non-emcc + non-TCI|              T                   |           T
 | T  |  T |
emcc + TCI        |              F                   |           F
 | F  |  F |
emcc + wasm       |              T                   |           F
 | F  |  T |

If we use "||", this condition becomes always true for non-emscripten
builds, regardless of whether TCI is used. That would break TCI's intended
behaviour. On emscripten builds, both of TCI and wasm backends define
tcg_qemu_tb_exec on their own so the declaration here is unnecessary. This
aligns with the behaviour of "&&", not "||". So unless I'm missing
something, "&&" seems to match the intent?

That said, this condition is a bit complex. Parhaps we shoud introduce a
clearer flag (e.g., HAS_TCG_QEMU_TB_EXEC) in tcg-target.h?

> Out of curiosity, have you tried to run a big-endian guest?

I've just tried a s390x guest by booting Linux. It worked after applying a
small bugfix (unrelated to endianness, shown below). I'll include this fix
in the next verison of the patch series.

> @@ -1718,6 +1718,7 @@ static void tcg_wasm_out_sub2_i64(TCGContext *s,
TCGReg retl, TCGReg reth,
>          tcg_wasm_out_op_local_get(s, TMP64_LOCAL_0_IDX);
>          tcg_wasm_out_op_global_get_r(s, al);
>          tcg_wasm_out_op_i64_gt_u(s);
> +        tcg_wasm_out_op_i64_extend_i32_s(s);
>
>          tcg_wasm_out_op_local_get(s, TMP64_LOCAL_0_IDX);
>          tcg_wasm_out_op_global_set_r(s, retl);
> @@ -1727,6 +1728,7 @@ static void tcg_wasm_out_sub2_i64(TCGContext *s,
TCGReg retl, TCGReg reth,
>          tcg_wasm_out_op_global_get_r(s, retl);
>          tcg_wasm_out_op_global_get_r(s, al);
>          tcg_wasm_out_op_i64_gt_u(s);
> +        tcg_wasm_out_op_i64_extend_i32_s(s);
>      }

--000000000000497be10632911ced
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe, thank you for the feedback.<=
br><br>&gt; &gt; diff --git a/tcg/tcg.c b/tcg/tcg.c<br>&gt; &gt; index dfd4=
8b8264..154a4dafa7 100644<br>&gt; &gt; --- a/tcg/tcg.c<br>&gt; &gt; +++ b/t=
cg/tcg.c<br>&gt; &gt; @@ -136,6 +136,10 @@ static void tcg_out_goto_tb(TCGC=
ontext *s, int which);<br>&gt; &gt; =C2=A0 static void tcg_out_op(TCGContex=
t *s, TCGOpcode opc, TCGType type,<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const TCGArg=
 args[TCG_MAX_OP_ARGS],<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const int const_args[TC=
G_MAX_OP_ARGS]);<br>&gt; &gt; +#if defined(EMSCRIPTEN)<br>&gt; <br>&gt; May=
be we can let this independently of EMSCRIPTEN, to reduce #ifdef&#39;ry.<br=
><br>Sure, I&#39;ll make this independent of EMSCRIPTEN in the next version=
 of the<br>series.<br><br>&gt; &gt; +static void tcg_out_label_cb(TCGContex=
t *s, TCGLabel *l);<br>&gt; &gt; +static int tcg_out_tb_end(TCGContext *s);=
<br>&gt; &gt; +#endif<br>&gt; &gt; =C2=A0 #if TCG_TARGET_MAYBE_vec<br>&gt; =
&gt; =C2=A0 static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsign=
ed vece,<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGReg dst, TCGReg src=
);<br>&gt; &gt; @@ -251,7 +255,7 @@ TCGv_env tcg_env;<br>&gt; &gt; =C2=A0 c=
onst void *tcg_code_gen_epilogue;<br>&gt; &gt; =C2=A0 uintptr_t tcg_splitwx=
_diff;<br>&gt; &gt; =C2=A0 <br>&gt; &gt; -#ifndef CONFIG_TCG_INTERPRETER<br=
>&gt; &gt; +#if !defined(CONFIG_TCG_INTERPRETER) &amp;&amp; !defined(EMSCRI=
PTEN)<br>&gt; <br>&gt; s/&amp;&amp;/||/ otherwise breaks TCI? (various case=
s)<br><br>Thank you for pointing this out. Let me break it down with a tabl=
e to<br>clarify this logic.<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | !defined(CONFIG_TCG_INTERPRETER) | !defined(EMSC=
RIPTEN) | &amp;&amp; | || |<br>------------------+-------------------------=
---------+----------------------+----+----+<br>non-emcc + TCI =C2=A0 =C2=A0=
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0F =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 T =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| F =C2=A0| =C2=A0T |<br>non-emcc +=
 non-TCI| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 T =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| T =C2=A0| =C2=A0T |<br>emc=
c + TCI =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0F =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 F =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
F =C2=A0| =C2=A0F |<br>emcc + wasm =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 F =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| F =C2=A0| =C2=A0T |<br><br>If we use &quot;||&quot;, =
this condition becomes always true for non-emscripten<br>builds, regardless=
 of whether TCI is used. That would break TCI&#39;s intended<br>behaviour. =
On emscripten builds, both of TCI and wasm backends define<br>tcg_qemu_tb_e=
xec on their own so the declaration here is unnecessary. This<br>aligns wit=
h the behaviour of &quot;&amp;&amp;&quot;, not &quot;||&quot;. So unless I&=
#39;m missing<br>something, &quot;&amp;&amp;&quot; seems to match the inten=
t?<br><br>That said, this condition is a bit complex. Parhaps we shoud intr=
oduce a<br>clearer flag (e.g., HAS_TCG_QEMU_TB_EXEC) in tcg-target.h?<br><b=
r>&gt; Out of curiosity, have you tried to run a big-endian guest?<br><br>I=
&#39;ve just tried a s390x guest by booting Linux. It worked after applying=
 a<br>small bugfix (unrelated to endianness, shown below). I&#39;ll include=
 this fix<br>in the next verison of the patch series.<br><br>&gt; @@ -1718,=
6 +1718,7 @@ static void tcg_wasm_out_sub2_i64(TCGContext *s, TCGReg retl, =
TCGReg reth,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_wasm_out_op_loca=
l_get(s, TMP64_LOCAL_0_IDX);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_=
wasm_out_op_global_get_r(s, al);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tcg_wasm_out_op_i64_gt_u(s);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_wasm_=
out_op_i64_extend_i32_s(s);<br>&gt; =C2=A0<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tcg_wasm_out_op_local_get(s, TMP64_LOCAL_0_IDX);<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_wasm_out_op_global_set_r(s, retl);<br>&gt; @=
@ -1727,6 +1728,7 @@ static void tcg_wasm_out_sub2_i64(TCGContext *s, TCGRe=
g retl, TCGReg reth,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_wasm_out=
_op_global_get_r(s, retl);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_wa=
sm_out_op_global_get_r(s, al);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc=
g_wasm_out_op_i64_gt_u(s);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_wasm_ou=
t_op_i64_extend_i32_s(s);<br>&gt; =C2=A0 =C2=A0 =C2=A0}<br><br></div></div>

--000000000000497be10632911ced--
