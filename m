Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1125205njf;
        Fri, 16 Aug 2024 01:18:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWr9M7CbN3bc6gaG0RQZeuqdS6smmcdbUGC8juiSWaQnUf+1bomOoP2bC4NkYojZVULBRlXbOgy7XW3cXVkBP097Bb26s5p
X-Received: by 2002:a17:907:e249:b0:a7a:ab8a:38a with SMTP id a640c23a62f3a-a839292ffbdmr174001866b.27.1723796279756;
        Fri, 16 Aug 2024 01:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723796279; cv=none;
        d=google.com; s=arc-20160816;
        b=uLdmekhBT0p0a+1+0Qk1mivonC+pUgKF2BCaswZoNKKQGXiGQz7FvRtD30FrbzxJp0
         6w+qG4TH8rRFmiV2AQj+lyt+gT1Ni9GUkuZ8NdjwlAhR5UokXCMDI0og9/lu1+zXUQJc
         P6gwhwTeJXD4wt+Nhi3hVA4B3r8+lCIsz7jpAyDZaYrxnhnvh2TWdGFcJ276Q0c5BL3X
         Ml8qdOzUW2WCBe9KuZyhvmeY2WYW5cv6IEzPLNfUiObd8NGrhW8yyOJ0GeAXx3hpAgKM
         HrLnUW1QfrK4wimNoRYqK0seMChWNEePQfn7t2FB+ybIAydvQ8RTnJeZ3aIkedJhrR2r
         t/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nPpU0PH6JcycdB2I98txnw/CAZnoVrAUDVWZJg3o/Sk=;
        fh=iD3UpddV2zLRsYpwxBdiPsnZvkzFElupffwmuAK1cC8=;
        b=fGX9FMg3rHst0naYIRPoquczH8FFluZjxawcr18tiSV5N9bidtAWkOKlOdxwKajSaA
         pVPZWABpvuSLMqQPk1nX7O6wYCRMqAmF3HVsIWAP3tC9lHaEHPfRpZ3l1Cql8n1zW9r3
         mFc/k4eOV8vwOmkcmVYv/VQVWeww6AGaenEHe9qPO7pw4HoCv6ePvTsnFrNHTDem9sn/
         bSWEXWrxa1swTEfpTxJ+PEb8ZJQxI4ell5pnZqP8095Se4yj5OX7d8ZUosmI98labAJk
         TanL7MXNXNbiZsPhPYG1wpqo3ArALQ/2Q99KrAWyY38ga53ltIDnbq5+EzhsZHD6zSbD
         i5TQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CtzNQ9oq;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a838394629bsor82570466b.20.2024.08.16.01.17.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Aug 2024 01:17:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CtzNQ9oq;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723796279; x=1724401079; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nPpU0PH6JcycdB2I98txnw/CAZnoVrAUDVWZJg3o/Sk=;
        b=CtzNQ9oqu936aYbVrHDSPAkUsQSYetJ0ociBR24q3ttrjq7wLW/HRIA9j4wfPy7dnl
         A9KWc0gwDsu+m2TgclJZ4Ce4+DPeUVbnkva6RTZKg2LxkFOOTFqZUaeT1rtRzi4KCLfi
         xg6yzux0sQoe1Z6HSSffvMCUiFGSvftdeebqVhVf7cY3UY1szCGXIQ1XV869d9w2Ud65
         g2zZRf1KERj2QvNCaBULdjMO9YlTZFaV5k8IKzy8PxhxMT58ve6i+hsK0OZ0L77CC2Sz
         4hc5yTgTPAK+iK8JLC0PdYgvKBQ0qLlMd2O4CGwFcBPKbA29dbfc4lyfL83+0L6MZED4
         R5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723796279; x=1724401079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPpU0PH6JcycdB2I98txnw/CAZnoVrAUDVWZJg3o/Sk=;
        b=lvMyISq17TzgTrJTh53mk2AYhjpQMrLs4PetbJFZ9hPo05hjZ7oI5lmRKeLsBZyVJk
         AM2d+t6YRM6xJZm2KBnP2E60Z+wziwazdBJ3cbOZ2Wo8HxTS+B1taXT9j9PUj82Sl1Nb
         NV//yAY8637fLLevT0V0GaPyeGRNEt509YNaLIxXSG/a1RGHYH0ooYqNG74UaSsNaFFT
         WgYV6FPdlKwrOYHhxfRqAVZclh4slV40b1rTxdnII5h0v3MYufFQCOl2lwBjyJRmXAtB
         uzKB+5KYEJKlpA2b9hg7iDE61Hf6cj0+f6Uxo5NfdjG/hIyaazBoVRCvftOanJ7P/xP0
         fi/w==
X-Forwarded-Encrypted: i=1; AJvYcCXphB0BXpt8qz4Ru+OF5PEE5DS7fjjKTBjpc66Dg5BTKHHMkEvs1lsrkQu4oF4tTx7Xny8KNJoKZy+MfwWrcf21PAhmoTJo
X-Gm-Message-State: AOJu0YwBaL7S0UT8utJ9oXeBDqLtkGz20ftaQUMCbsY4nD22jh/7FHgY
	1tVdliwTVGvWLM733D5eEYVxQHQS+r80TqH5ztJdcGcsngcJ29P1eSL10PCnhKGhSOwyCe97kps
	0SpPVrdkarDFtyYwsYFXwhSPc7gzyNQwGm6L1drJj
X-Google-Smtp-Source: AGHT+IHwBzP7404BHcFLdlD7qbYBGf8bhQDZW5S7N8RM6o9qavhPbf51m0tm6yH9raLsgP8+KMvrnH8N/L9NMM3uGoo=
X-Received: by 2002:a05:6402:2353:b0:5a1:1:27a9 with SMTP id
 4fb4d7f45d1cf-5beca595cbcmr1609888a12.18.1723796279045; Fri, 16 Aug 2024
 01:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240815-rust-pl011-v7-0-975135e98831@linaro.org> <8f5f670b-313e-4172-a04b-ff8439bc4777@intel.com>
In-Reply-To: <8f5f670b-313e-4172-a04b-ff8439bc4777@intel.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 16 Aug 2024 11:17:47 +0300
Message-ID: <CAAjaMXYyggQuenzEt-cTpENAM5S46_Wi4iqeXjzLYoDrHXzj2g@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Add Rust build support, ARM PL011 device impl
To: Junjie Mao <junjie.mao@intel.com>
Cc: "open list:ARM SMMU <qemu-arm@nongnu.org>," <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, "Liu, Zhao1" <zhao1.liu@intel.com>, 
	Peter Maydell <peter.maydell@linaro.org>, ARM TCG CPUs <qemu-arm@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>, 
	"Hart, Rowan" <rowan.hart@intel.com>, Mads Ynddal <mads@ynddal.dk>, 
	Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e0ce20061fc89844"
X-TUID: wbYmz91GXGXD

--000000000000e0ce20061fc89844
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Aug 2024, 11:06 Junjie Mao, <junjie.mao@intel.com> wrote:

> On 8/15/2024 7:42 PM, Manos Pitsidianakis wrote:
> > Outstanding issues
> > ==================
> >
> > Outstanding issues that are not blocking for merge are:
> >
> > - Cross-compilation for aarch64 is not possible out-of-the-box because
> of this bug:
> >    <https://github.com/rust-lang/rust/issues/125619> in llvm which when
> >    fixed, must be ported to upstream rust's llvm fork. Since the problem
> >    is an extraneous symbol we could strip it with objcopy
> -N|--strip-symbol
> > - Adding more than one Rust device ends up with duplicate symbols from
> >    rust std library because we are linking as whole archives because...
> >    constructors are stripped by the linker otherwise :( It can be worked
> >    around if a single Rust library is built with all the devices as
> >    dependencies which is then linked to qemu. The fix is a small change
> >    which I will add either in a next version or when a new Rust device is
> >    added.
> >
>
> Hi Manos,
>
> I also noticed that when I tried adding a second device. Some other
> projects met
> similar issues [1], but no clean solution seems to be available yet. The
> options
> are:
>
> 1) Combining all crates into one staticlib which is linked to the final
> executable. That requires generating one .rs with extern crate decls of
> all
> enabled crates. In the context of QEMU, different targets may enable
> different
> set of crates (e.g., some crates have arch constraints), thus one .rs for
> each
> target will be needed in general.
>
> 2) Linking rlibs (or emitted objects) directly with other C objects using
> the C
> linker. That somehow works (with some tricks) but is not officially
> supported
> and may break in the future.
>
> I'm working on (1), but would like to have your thoughts and preference on
> those
> options.
>

Hello Junjie, I have also implemented (1) already (the fix I mentioned in
the cover letter). In general I'd like to do it on a standalone patch so
that it can be separated from the other changes instead of squashing it.

If you have something already too, please share here! I will send mine as a
reply to this thread when I am able. I am not familiar with meson so my
version could be lacking!

Manos



[1] https://github.com/rust-lang/rust/issues/73632
>
> ---
> Best Regards
> Junjie Mao
>

--000000000000e0ce20061fc89844
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 16 Aug 2024, 11:06 Junjie Mao, &lt;<a href=3D"=
mailto:junjie.mao@intel.com" target=3D"_blank" rel=3D"noreferrer">junjie.ma=
o@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 8/15/2024 7:42 PM, Manos Pitsidianakis wrote:<br>
&gt; Outstanding issues<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; Outstanding issues that are not blocking for merge are:<br>
&gt; <br>
&gt; - Cross-compilation for aarch64 is not possible out-of-the-box because=
 of this bug:<br>
&gt;=C2=A0 =C2=A0 &lt;<a href=3D"https://github.com/rust-lang/rust/issues/1=
25619" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://g=
ithub.com/rust-lang/rust/issues/125619</a>&gt; in llvm which when<br>
&gt;=C2=A0 =C2=A0 fixed, must be ported to upstream rust&#39;s llvm fork. S=
ince the problem<br>
&gt;=C2=A0 =C2=A0 is an extraneous symbol we could strip it with objcopy -N=
|--strip-symbol<br>
&gt; - Adding more than one Rust device ends up with duplicate symbols from=
<br>
&gt;=C2=A0 =C2=A0 rust std library because we are linking as whole archives=
 because...<br>
&gt;=C2=A0 =C2=A0 constructors are stripped by the linker otherwise :( It c=
an be worked<br>
&gt;=C2=A0 =C2=A0 around if a single Rust library is built with all the dev=
ices as<br>
&gt;=C2=A0 =C2=A0 dependencies which is then linked to qemu. The fix is a s=
mall change<br>
&gt;=C2=A0 =C2=A0 which I will add either in a next version or when a new R=
ust device is<br>
&gt;=C2=A0 =C2=A0 added.<br>
&gt; <br>
<br>
Hi Manos,<br>
<br>
I also noticed that when I tried adding a second device. Some other project=
s met <br>
similar issues [1], but no clean solution seems to be available yet. The op=
tions <br>
are:<br>
<br>
1) Combining all crates into one staticlib which is linked to the final <br=
>
executable. That requires generating one .rs with extern crate decls of all=
 <br>
enabled crates. In the context of QEMU, different targets may enable differ=
ent <br>
set of crates (e.g., some crates have arch constraints), thus one .rs for e=
ach <br>
target will be needed in general.<br>
<br>
2) Linking rlibs (or emitted objects) directly with other C objects using t=
he C <br>
linker. That somehow works (with some tricks) but is not officially support=
ed <br>
and may break in the future.<br>
<br>
I&#39;m working on (1), but would like to have your thoughts and preference=
 on those <br>
options.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Hello Junjie, I have also implemented (1) already (the fix I ment=
ioned in the cover letter). In general I&#39;d like to do it on a standalon=
e patch so that it can be separated from the other changes instead of squas=
hing it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If you have som=
ething already too, please share here! I will send mine as a reply to this =
thread when I am able. I am not familiar with meson so my version could be =
lacking!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Manos</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
[1] <a href=3D"https://github.com/rust-lang/rust/issues/73632" rel=3D"noref=
errer noreferrer noreferrer" target=3D"_blank">https://github.com/rust-lang=
/rust/issues/73632</a><br>
<br>
---<br>
Best Regards<br>
Junjie Mao<br>
</blockquote></div></div></div>

--000000000000e0ce20061fc89844--
