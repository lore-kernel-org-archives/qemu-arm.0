Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp517709njc;
        Fri, 11 Apr 2025 08:17:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3uiMQ3b1j3jQs7hy1VvjVLZRxfvXDRkM+uIuBX23WcU1fpBO0hAGv+ONJgH3ibmhp2b42BPOkAeACQA==@linaro.org
X-Received: by 2002:a17:90a:d008:b0:2ee:dd9b:e402 with SMTP id 98e67ed59e1d1-30823670b27mr5766217a91.12.1744384668612;
        Fri, 11 Apr 2025 08:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744384668; cv=none;
        d=google.com; s=arc-20240605;
        b=NjWqGlPf/WwMLHnaQ2E6x7YExRJFNzxSxaJTypquI57Jz1w1fgSeCn6b7njyc4zi8h
         RTNi3rVClgg4qgL64e0kc/E+2J8NjHU2h37A3n0N12Z9iiMoWLQNFbNFLerK54ppZbFy
         PzHNYkkQX21M776eCEj553l10b1eSV4BP+WJLrnHg/ls3+uXk/rhwUdsJaJUlrM1XCKC
         0N5eQ8OmjUrsn3WCL4qyYZTnSoSKxptSBTujG2f2LV/vHAbV678c5gtEmlHyriw1ifas
         xKtgipEQgtGvbKG8N0E2Zec6Ffa2Kuy0hn+V9UlXhwyH1Ls15crsXoj+zJKj9EeW4HpJ
         Bqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zJ5UrI6lGg/6jemr9I1l89LQvEyd7+1XTZ0231uslAs=;
        fh=bHrGogJGXmAEA4Vj6UmX/B2PxLsB9JLL/VXpCtedqgs=;
        b=X3mnImpIRBSg5S8UFDlQI2IBNppNK/sWwo/Km5dSuSag5UkzTya+GTZDy/ltZJg7c9
         Z4+myx7kusfbnE7zBsQ2v8G8tSen6uk8+ZdwtAaU1aJCvCl6GOeIbpmZS9JdOa4vnGBn
         N+nYNEkIw9jBWtgMB9ilMb06HbkCFISfHIIlURuWe5CNpYOGGnI2Q2cLhy3n8Q4eq5zC
         +KBEkzrtHQ1Caw3zgcrryKxnhJv6APryXCZdjR0vZpvnBESNsxIO7jgcoLpkQkswUaxY
         5FJVZF0dDEOtR0Lx7B8O3s/i/DH0Zq1gbLet5VAOw1Xz7AWrEMFxAZkvQRY0GOHbJlEE
         gRVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=cRwiTURB;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22be11713eesor25598825ad.14.2025.04.11.08.17.48
        (Google Transport Security);
        Fri, 11 Apr 2025 08:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=cRwiTURB;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744384668; x=1744989468; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zJ5UrI6lGg/6jemr9I1l89LQvEyd7+1XTZ0231uslAs=;
        b=cRwiTURBMh9PgZU79+xUBUWKlwNyGImKcygnVhH7jkfYRHKQVpCuvs4WH182PR8MCH
         9UCUKNeYuwyruvpuW8J+y9up/FGtf84z3ze/nr7eH6z3NufjRmTT/oq0sdZ447/IbdyQ
         CrnyFH/f2zp/VFpy9mYh/0g5pFinpY5O2pYfws/H3A6ggQ4hAnti9AcqPUymB5sH619w
         MITRuLP8OkceyFT2M2H1iQ3jWI0PWdszAYG39mhhaniQA+Pq2jHLJjr+cgMlbHJggA99
         6wbNpFGDVGyJXDCTNp+1RSO31xcWAAoNltQBdAnrG0dSNfMowXbBhUfgOx00BkSv56c8
         hTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744384668; x=1744989468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJ5UrI6lGg/6jemr9I1l89LQvEyd7+1XTZ0231uslAs=;
        b=PJRdp4yiLTjokAl4LcaUTzag0VIcWz0VzqTlGvcsFPwF38OKH01bgQcd+7eBmypmRU
         oW22qTTbB4wgoI1LVtXcA3N6o38zKYC6nO1Jzn7JfvXjeMlv1jnp6fuVZLcRvAfwtsAu
         t/MCEr5Yqgu0JoVOq7ES72s0Pariu+Y0RavdgruJh4n81DKQ0JcaseJQvHz2bbxzkrUi
         fdaYOZCFctfOvPXyzrZTuvRyqCK5HlShsBc3IpS9zXapH13w2AcfipFO35kTv2F0ELFT
         8pmv9xJx5MJvl0JBthMxAR/cCsAQZaj+wjhyTcr62p6L6eViLWVtV2h3/qb4sa7RS88j
         i62A==
X-Forwarded-Encrypted: i=1; AJvYcCUPZY5twOg+yUrPabigfOPdpvrtfBD9/ZMz2hBlggZ5rPMLnuy2aU2C4qZ62AyqcfP7tUYSUbCTMaLn9w==@linaro.org, AJvYcCV8jUWOqyrKbQKCsSDSRgVdqHHch1Io6cSTifzwCyxeIZ0ZsmvYYsQHyl1KnR5+sgAgRdoWMgGJ@linaro.org, AJvYcCXOb5nIkUGkTMSwrRqFcHy5hwhU1vW2qAYXCbRp7WWNoY4CdqO3NFu+f44uV0M1l7GyeopYGBITn6xYUFvSfg==@linaro.org, AJvYcCXet99KpYGshtk2PYFsmOg2yJAIR43wlGE+QzZUM2O0CzT4K2AjJ8143e25OzpKQu7vgYqYNQE5Eo7tVWDB3xD9aAc=@linaro.org
X-Gm-Message-State: AOJu0Yza8HeSPpgixmTFyjlpRkPqft6hB9fkQv5QpMW+tHkcLGwbvXNb
	QaZr3z7rEl2io0c1P83npOKv0OmkhoUemeX0FaqmTdfYNfkGxs6AMoAS3GK+JbNG/uT6IDP8rJI
	6j9sCEGegwIy+aZpsXbGl6p+CNb4=
X-Gm-Gg: ASbGncvDIRKN6TEMuCgRWEqpTZrEF3XPHzrli/fYAIIA8ip/Sw2nGefnhDYfz+Op9oq
	xA+czCSub8C/Nldtcev/60Z7zwAyOKZhUIVdjOLLuLXil+2llOKZM2Xnr3dwqXmos4TKDKugOwQ
	OgcqCzf/j0FzsLZrrPHen/tpGYz6Pi1fxpp8NwDYy2qZ4PZuqxm/I=
X-Google-Smtp-Source: AGHT+IGLD6jygAABjZ5gVgXftD6Pr67ZRJ2wBnTAkHzsT1x3Xo93SgZdZfq1toSOFlxuAz9PlvSlfsSCN8QytmN18IM=
X-Received: by 2002:a17:90a:c105:b0:2f8:b2c:5ef3 with SMTP id
 98e67ed59e1d1-30823670d04mr5885118a91.14.1744384667840; Fri, 11 Apr 2025
 08:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora> <Z_jwRMsLhtjzdcF5@redhat.com>
In-Reply-To: <Z_jwRMsLhtjzdcF5@redhat.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Sat, 12 Apr 2025 00:17:35 +0900
X-Gm-Features: ATxdqUHOawVEa5VymNvEMcZ-3JLYRNrhku_4rFbqNbzfrOe0HX6d0g7wW9byFFk
Message-ID: <CAEDrbUZPFa8nyQNg=ag36RL4vt2ic3pPL240v1vp1D1G+3Lb-w@mail.gmail.com>
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
	qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007a7b99063282340d"
X-TUID: 8uk/XBKkFyj/

--0000000000007a7b99063282340d
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

> On Wed, Apr 09, 2025 at 03:21:15PM -0400, Stefan Hajnoczi wrote:
> > On Mon, Apr 07, 2025 at 11:45:51PM +0900, Kohei Tokunaga wrote:
> > > This patch series enables QEMU's system emulator to run in a browser
using
> > > Emscripten.
> > > It includes implementations and workarounds to address browser
environment
> > > limitations, as shown in the following.
> >
> > I think it would be great to merge this even if there are limitations
> > once code review comments have been addressed. Developing WebAssembly
> > support in-tree is likely to allow this effort to develop further than
> > if done in personal repos (and with significant efforts required to
> > rebase the code periodically).
>
> It is certainly impressive & clever but first two critical questions..
>
> Is there a committment to long term (many years) development & maintenance
> of this, or is it just a short term experiment which will have attention
> dwindle in a year's time ?
>
> Is there a compelling real world use case for this that will justify
> carrying it in QEMU, or is it a case of "it exists because it can" ?

Thank you for the qeustions.

In recent years, I've observed several use cases for on-browser VM
environments.

One potential application is an on-browser development environment, similar
to VSCode's on-browser Python execution environment [1], but with QEMU
offering enhanced compatibility for existing software

Another use case could be an on-browser playground or demo
environment. Several programming languages, such as Ruby [2] and Swift [3],
have already leveraged WebAssembly for this purpose. On-browser QEMU would
extend this capability, allowing a wider variety of software to run within
browsers.

Although the current Wasm backend implementation is still in its early
stages and has room for improvement (e.g., the aforementioned workarounds,
performance, etc.), I believe the examples above represent promising use
cases. Of course, I am committed to maintaining and improving this backend.

[1] https://code.visualstudio.com/docs/python/python-web
[2]
https://github.com/ruby/ruby.wasm/blob/d4a9a03aae6b84327d29783b75edb63549df7e6c/README.md#try-rubywasm-no-installation-needed
[3] https://swiftwasm.org/

--0000000000007a7b99063282340d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Daniel,<br><br>&gt; On Wed, Apr 09, 20=
25 at 03:21:15PM -0400, Stefan Hajnoczi wrote:<br>&gt; &gt; On Mon, Apr 07,=
 2025 at 11:45:51PM +0900, Kohei Tokunaga wrote:<br>&gt; &gt; &gt; This pat=
ch series enables QEMU&#39;s system emulator to run in a browser using<br>&=
gt; &gt; &gt; Emscripten.<br>&gt; &gt; &gt; It includes implementations and=
 workarounds to address browser environment<br>&gt; &gt; &gt; limitations, =
as shown in the following.<br>&gt; &gt; <br>&gt; &gt; I think it would be g=
reat to merge this even if there are limitations<br>&gt; &gt; once code rev=
iew comments have been addressed. Developing WebAssembly<br>&gt; &gt; suppo=
rt in-tree is likely to allow this effort to develop further than<br>&gt; &=
gt; if done in personal repos (and with significant efforts required to<br>=
&gt; &gt; rebase the code periodically).<br>&gt; <br>&gt; It is certainly i=
mpressive &amp; clever but first two critical questions..<br>&gt; <br>&gt; =
Is there a committment to long term (many years) development &amp; maintena=
nce<br>&gt; of this, or is it just a short term experiment which will have =
attention<br>&gt; dwindle in a year&#39;s time ?<br>&gt; <br>&gt; Is there =
a compelling real world use case for this that will justify<br>&gt; carryin=
g it in QEMU, or is it a case of &quot;it exists because it can&quot; ?<br>=
<br>Thank you for the qeustions.<br><br>In recent years, I&#39;ve observed =
several use cases for on-browser VM<br>environments.<br><br>One potential a=
pplication is an on-browser development environment, similar<br>to VSCode&#=
39;s on-browser Python execution environment [1], but with QEMU<br>offering=
 enhanced compatibility for existing software<br><br>Another use case could=
 be an on-browser playground or demo<br>environment. Several programming la=
nguages, such as Ruby [2] and Swift [3],<br>have already leveraged WebAssem=
bly for this purpose. On-browser QEMU would<br>extend this capability, allo=
wing a wider variety of software to run within<br>browsers.<br><br>Although=
 the current Wasm backend implementation is still in its early<br>stages an=
d has room for improvement (e.g., the aforementioned workarounds,<br>perfor=
mance, etc.), I believe the examples above represent promising use<br>cases=
. Of course, I am committed to maintaining and improving this backend.<br><=
br>[1] <a href=3D"https://code.visualstudio.com/docs/python/python-web">htt=
ps://code.visualstudio.com/docs/python/python-web</a><br>[2] <a href=3D"htt=
ps://github.com/ruby/ruby.wasm/blob/d4a9a03aae6b84327d29783b75edb63549df7e6=
c/README.md#try-rubywasm-no-installation-needed">https://github.com/ruby/ru=
by.wasm/blob/d4a9a03aae6b84327d29783b75edb63549df7e6c/README.md#try-rubywas=
m-no-installation-needed</a><br>[3] <a href=3D"https://swiftwasm.org/">http=
s://swiftwasm.org/</a><br><br></div></div>

--0000000000007a7b99063282340d--
