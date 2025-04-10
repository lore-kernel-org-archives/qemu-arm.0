Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8383735njd;
        Thu, 10 Apr 2025 06:12:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXvZL5jKSKpN7S/KegcOnDe0b7nrhttVUCr8So4ZVNdQPp1XYzEbW5On4eee6XHpQRi9YPwXmSq0Mnag==@linaro.org
X-Received: by 2002:a05:6a21:998c:b0:1f5:8f7f:8f19 with SMTP id adf61e73a8af0-2016cd083bdmr3299605637.10.1744290730126;
        Thu, 10 Apr 2025 06:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744290730; cv=none;
        d=google.com; s=arc-20240605;
        b=KBzqrUkBd2gXdKvICHeiwQp+I8bXMFtfAzK92xcxNXVZCwVWUTCyt3HcxDsR1Uzmfy
         mrRMVjU0OBNuANa+bhfnz1NW0DS5WFZ/WRriqGXdxDMAKYfDF7rNCXP042DzSPvnUonO
         yY/uBhIS9nCFDUgupUtfifuGEyoOjfJvktt96AqfBsyIOZJvsEha2CJLqTPIlp4dVoZH
         MxM/wSynai0HndtSj6V4MGNZ/rHjEPvE7ZkQ7OGwCs2pLZRia8xGnx5DxmUjR2m8ZxRF
         59lU0OIvoHdfcxGjQUhym3/b74cb6+c3h9tnSeKfB8buwXkYtsaQEMmQnCM0Xmdrqc5m
         0Hwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HmI2bjN6zGXjbfxLwXVYEXPcQclMjbuVOoLUyfiC0/w=;
        fh=q7PzvZlOixqxBF7W6Nu04wIs8WIuCWd73giugeGFHJ4=;
        b=NdjJjbtc9iRAkNOkfvLgk/G9fQK4s1IfUiBTlGiQUWfLGUnYGx4iUycQKiy8Nm8Uou
         l04AIlriERNYajOY/EdPPY2sUONxxy6Uj1aLyK1gn1GZ42B5qWLBMhGTOlNLVjRwf9qT
         FIADL5sFJIIZ9a+bEXJPEvvfElKGcwv8WbQifEb/vKVE64EcI2Q1LEJui+MNMQpkDdgp
         oANYzdl24TBgzL5i0iKK7SOtBiir9cMZoR7BC1ljcoLtx1JpA/VbvCXM1Lu6P/e78IcT
         Y4ho8D3EqehzXlj+AHHQxP3B0yXdW94/jl0+GPHHZHuIxIxAuCoMpDKNtzkhE9Wu51G1
         3FTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="bOQ5SC/s";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b03f88384f8sor1014838a12.4.2025.04.10.06.12.09
        (Google Transport Security);
        Thu, 10 Apr 2025 06:12:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="bOQ5SC/s";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290729; x=1744895529; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HmI2bjN6zGXjbfxLwXVYEXPcQclMjbuVOoLUyfiC0/w=;
        b=bOQ5SC/syEpvGTyP5Hcn+LAHVGqWNKdH8CyJ93sVBkNHeL2UaRROEZAy3Rcm/Db4SK
         QumO5Zt3denkVftvzNBuquNUkcBS+xdjP2UXC20otL1cFbvo++L6uV5Dq+xiy9zd+Gx/
         +Dt24lxlICitMLx8nEo4IbEDfMeKbbVbB0BpY6JmM4KFZSi1A7CVeV6eito/15Saf7A0
         +mqrnohPi/v6mn6ekAcWFxf2Tdh7ZIVBmPTxp7KN+S8oL91e3lVO5OGODY2xMpHxqFg5
         21PcqjTK8lXnhXczHUCzJMOnopcpuI4Rdwfj86OFZgtubqxhHHZ9S3v0/BS/s4vY9jPM
         M5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290729; x=1744895529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmI2bjN6zGXjbfxLwXVYEXPcQclMjbuVOoLUyfiC0/w=;
        b=HiNachl9/McwUbG+hQtjz/ZQBU9r2dORdJ8gAIeRMnN7lhBNLc5nB84wSSBGxWQtvb
         /C8oPuit+T2ze18M9frqOHeqwSCiYK9ugp9NF7rqh+9NJS5OmSomGEVZdbvc7TSLrP9Y
         LJBcA8WAE/k1KXcWCjOa4VtyKcLIM3+wFSkra9Uo54hyyN+xgeSabCIT6gg3sAC2oqqJ
         4759Xg3ALyXJlxMhpOuq5yt7gHip8OULdQ9gn/IiX9Gih03rExZqppW6O6UmptWG8fz3
         cqrkMxPFVFFQ14UKd1sRJrWkzjHwZiws0Iaqc+Q3DGLx97GKkK3zEzSljfbRbFOEFl1i
         VDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDfQvUeTj4TBuWVK3mgu+TpyKOJg58MPvcKTH90auBfssyzv5hgxFkMx0Qza3jCNDxe3tuzEQTZyT7E6vE5g==@linaro.org, AJvYcCVcvzbdgzyEHyDQGR9O6DO03E1NU4SbZn49Pu10oKmvCmNq3iOA0bhf+q/MYobbX5kbSQXon2A1AePXxA==@linaro.org, AJvYcCXk6DxSq7bEnaUkwqo34qvQ7/zKkR/dE8KFHh9dqPM44IeV1CUkaLwi39+epwJx+48fMdWDFvlkZcL9f6pqIgeQA3I=@linaro.org
X-Gm-Message-State: AOJu0YyF3Go5sKvyBtJJSdyH9BIeTwcL0elduNQ5xlGIeqgYA5wTWH3b
	f5ByyqKxtFF0SpBZ73gQaN+faB68bSFyyTIKWL0zTqG2ybO+zQNv8V7p1Y5hNctUt+cxvQI2l+7
	BmFXkcRsbTC9MB4MnfMEouzCx6Ak=
X-Gm-Gg: ASbGncsQ/Vot4fn00WwCJT0m6AVFfW+znZrRPoHvvuL2m5sjcGbwJiVdZACxXOX52zo
	iRjAxkyO/cETGi164bFXph5OOG9QOBXHKPN9qUxvwMdwrL5bHSyNaiqYr0u4zO7zrQ40TGyCc6j
	bgZRv1R95d+rw10H18TyoUKg5AP97ORuIacIiYM9gVwx8g3cFFqD4=
X-Google-Smtp-Source: AGHT+IGoJMcJ+U+31eewFk8jAnjwMIFXYhPze63Ut5gUAsyN3CHJEV0vEawtmKl8IXOWQnQE128cIHWnSmUJjtsuNdA=
X-Received: by 2002:a17:90b:2cc5:b0:2ee:aed6:9ec2 with SMTP id
 98e67ed59e1d1-307e5971608mr4069537a91.14.1744290729576; Thu, 10 Apr 2025
 06:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora> <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
In-Reply-To: <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 10 Apr 2025 22:11:57 +0900
X-Gm-Features: ATxdqUEhVEutAfuc3mDKSzX98cgxWYclBJOkBj_kRiDIuAjwYlvWPv-oniVljnY
Message-ID: <CAEDrbUZ4mbCT-npk8Nha4fDd9a5PGguAxS_RD0wG96gpQRUp+g@mail.gmail.com>
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Hanna Reitz <hreitz@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
	qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000052547f06326c55cc"
X-TUID: bNVmb1Eynb8/

--00000000000052547f06326c55cc
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

> > This patch series enables QEMU's system emulator to run in a browser
using
> > Emscripten.
> > It includes implementations and workarounds to address browser
environment
> > limitations, as shown in the following.
>
> I think it would be great to merge this even if there are limitations
> once code review comments have been addressed. Developing WebAssembly
> support in-tree is likely to allow this effort to develop further than
> if done in personal repos (and with significant efforts required to
> rebase the code periodically).
>
> > # New TCG Backend for Browsers
> >
> > A new TCG backend translates IR instructions into Wasm instructions and
runs
> > them using the browser's WebAssembly APIs (WebAssembly.Module and
> > WebAssembly.instantiate). To minimize compilation overhead and avoid
hitting
> > the browser's limitation of the number of instances, this backend
integrates
> > a forked TCI. TBs run on TCI by default, with frequently executed TBs
> > compiled into WebAssembly.
> >
> > # Workaround for Running 64-bit Guests
> >
> > The current implementation uses Wasm's 32-bit memory model, even though
Wasm
> > supports 64-bit variables and instructions. This patch explores
implementing
> > TCG 64-bit instructions while leveraging SoftMMU for address
translation. To
> > enable 64-bit guest support in Wasm today, it was necessary to partially
> > revert recent changes that removed support for different pointer widths
> > between the host and guest (e.g., commits
> > a70af12addd9060fdf8f3dbd42b42e3072c3914f and
> > bf455ec50b6fea15b4d2493059365bf94c706273) when compiling with
> > Emscripten. While this serves as a temporary workaround, a long-term
> > solution could involve adopting Wasm's 64-bit memory model once it gains
> > broader support, as it is currently not widely adopted (e.g.,
unsupported by
> > Safari and libffi). Feedback and suggestions on this approach are
welcome.
> >
> > # Emscripten-Based Coroutine Backend
> >
> > Emscripten does not support couroutine methods currently used by QEMU
but
> > provides a coroutine implementation called "fiber". This patch series
> > introduces a coroutine backend using fiber. However, fiber does not
support
> > submitting coroutines to other threads. So this patch series modifies
> > hw/9pfs/coth.h to disable this behavior when compiled with Emscripten.
>
> QEMU's block job coroutines also rely on switching between threads. See
> how job_co_entry() schedules job_exit(). It's not very likely that users
> will run jobs in a WebAssembly environment, so maybe this is more of a
> theoretical problem for the time being.

Thank you for the feedback. I'll investigate the block job coroutines
further. As you pointed out, I agree that users aren't likely to run block
jobs in the WebAssembly environment.

> If I understand correctly the QEMU project is only build the statically
> linked wasm binary in the CI system and not distributing it (e.g. making
> it available for download)? I'm asking because if the QEMU project wants
> to distribute the wasm binary it may be necessary to put together a
> combined software license to meet the license requirements of glib and
> other dependencies that are statically linked.

Yes, it doesn't distribute the statically linked wasm binary.

--00000000000052547f06326c55cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Stefan,<br><br>&gt; &gt; This patch se=
ries enables QEMU&#39;s system emulator to run in a browser using<br>&gt; &=
gt; Emscripten.<br>&gt; &gt; It includes implementations and workarounds to=
 address browser environment<br>&gt; &gt; limitations, as shown in the foll=
owing.<br>&gt; <br>&gt; I think it would be great to merge this even if the=
re are limitations<br>&gt; once code review comments have been addressed. D=
eveloping WebAssembly<br>&gt; support in-tree is likely to allow this effor=
t to develop further than<br>&gt; if done in personal repos (and with signi=
ficant efforts required to<br>&gt; rebase the code periodically).<br>&gt; <=
br>&gt; &gt; # New TCG Backend for Browsers<br>&gt; &gt; <br>&gt; &gt; A ne=
w TCG backend translates IR instructions into Wasm instructions and runs<br=
>&gt; &gt; them using the browser&#39;s WebAssembly APIs (WebAssembly.Modul=
e and<br>&gt; &gt; WebAssembly.instantiate). To minimize compilation overhe=
ad and avoid hitting<br>&gt; &gt; the browser&#39;s limitation of the numbe=
r of instances, this backend integrates<br>&gt; &gt; a forked TCI. TBs run =
on TCI by default, with frequently executed TBs<br>&gt; &gt; compiled into =
WebAssembly.<br>&gt; &gt; <br>&gt; &gt; # Workaround for Running 64-bit Gue=
sts<br>&gt; &gt; <br>&gt; &gt; The current implementation uses Wasm&#39;s 3=
2-bit memory model, even though Wasm<br>&gt; &gt; supports 64-bit variables=
 and instructions. This patch explores implementing<br>&gt; &gt; TCG 64-bit=
 instructions while leveraging SoftMMU for address translation. To<br>&gt; =
&gt; enable 64-bit guest support in Wasm today, it was necessary to partial=
ly<br>&gt; &gt; revert recent changes that removed support for different po=
inter widths<br>&gt; &gt; between the host and guest (e.g., commits<br>&gt;=
 &gt; a70af12addd9060fdf8f3dbd42b42e3072c3914f and<br>&gt; &gt; bf455ec50b6=
fea15b4d2493059365bf94c706273) when compiling with<br>&gt; &gt; Emscripten.=
 While this serves as a temporary workaround, a long-term<br>&gt; &gt; solu=
tion could involve adopting Wasm&#39;s 64-bit memory model once it gains<br=
>&gt; &gt; broader support, as it is currently not widely adopted (e.g., un=
supported by<br>&gt; &gt; Safari and libffi). Feedback and suggestions on t=
his approach are welcome.<br>&gt; &gt; <br>&gt; &gt; # Emscripten-Based Cor=
outine Backend<br>&gt; &gt; <br>&gt; &gt; Emscripten does not support couro=
utine methods currently used by QEMU but<br>&gt; &gt; provides a coroutine =
implementation called &quot;fiber&quot;. This patch series<br>&gt; &gt; int=
roduces a coroutine backend using fiber. However, fiber does not support<br=
>&gt; &gt; submitting coroutines to other threads. So this patch series mod=
ifies<br>&gt; &gt; hw/9pfs/coth.h to disable this behavior when compiled wi=
th Emscripten.<br>&gt; <br>&gt; QEMU&#39;s block job coroutines also rely o=
n switching between threads. See<br>&gt; how job_co_entry() schedules job_e=
xit(). It&#39;s not very likely that users<br>&gt; will run jobs in a WebAs=
sembly environment, so maybe this is more of a<br>&gt; theoretical problem =
for the time being.<br><br>Thank you for the feedback. I&#39;ll investigate=
 the block job coroutines<br>further. As you pointed out, I agree that user=
s aren&#39;t likely to run block<br>jobs in the WebAssembly environment.<br=
><br>&gt; If I understand correctly the QEMU project is only build the stat=
ically<br>&gt; linked wasm binary in the CI system and not distributing it =
(e.g. making<br>&gt; it available for download)? I&#39;m asking because if =
the QEMU project wants<br>&gt; to distribute the wasm binary it may be nece=
ssary to put together a<br>&gt; combined software license to meet the licen=
se requirements of glib and<br>&gt; other dependencies that are statically =
linked.<br><br>Yes, it doesn&#39;t distribute the statically linked wasm bi=
nary.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr"><br></div></div></div>

--00000000000052547f06326c55cc--
