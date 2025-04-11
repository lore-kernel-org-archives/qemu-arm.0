Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp490005njc;
        Fri, 11 Apr 2025 07:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWO02ItglYJC960T8qz7ZS1pPFQvncPA6jk2XYIV4ygZ9sdYtru7NKyQTiDayuFF5rQtkOiIkLOeU185A==@linaro.org
X-Received: by 2002:a17:907:3fa7:b0:abf:59e1:ad88 with SMTP id a640c23a62f3a-acad34c96a5mr254492066b.29.1744382184868;
        Fri, 11 Apr 2025 07:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744382184; cv=none;
        d=google.com; s=arc-20240605;
        b=AWUJjEqpR1WYsVwmqbO6zbVv0sPzVhOBajmwwOjAETBhN/am+uiAdcCmwrCHNIqBVn
         jGOwFDrF/fkcU9JGG5EzvhOK4YiGUbiVw8aVTVYYtW15uHKcLbI/c12iw6Q2SAXkvley
         2a52w6ZhRWY0hkwFIG2JE4uzyeh02qa3aJVb1hkUt7TpZXgfEhAHDx0zcxkLKzWed2uZ
         2bYRk/HSHGGKdJ3UgEDHGCQIq1tpJuPElR+GxMC6fEJ0CRTMU6s+asnxoFS4UdtwWH7t
         IGSCNoGqmwLnCrAviFV5PC/iT3Ix/3C9ZEmNKNBk4PoDhQ4Le/vq5hlFKTjksb/jduyu
         9hWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TlF6NDZu6E7cqFh7Nc+T41PatugtSHL1p7nnfIPlLdk=;
        fh=Af5rR7vqSLlcc90ee1CwLq8ihN3hUpMlUoNrg7u9Hrk=;
        b=NWEQscmzxXMFiF2yyb3+0vw1dOZ54upKUaBV+OYN4Tqo/M96s7ZQwWMDhl0zpLTvej
         o7vv3yLvcq1y6JXS5lZ7BmJLCIkn2ShxhW0TJA+paGXMAuyFESjPlpGMPP+9VTjzXftL
         xXZl4HS46kf/7U4S2yiEeaF5TlcAYNuqpLjbXefw/eWleWQE++UBX5rtuSrRR2meBp5j
         qsmsSNrBfURp1IClzlKhpKbbEeR/4nGYr5Ss5gKCyqfzib5zf2WQGB6mN7z41aKeI1qd
         SnnO6bxlSSeEaUWfr3nfoK/VXyXlfA1Smj6vuDcybyN4dQzSCd1U6w56bf+D0Y3DqqTp
         i4lQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="CQgCOO/1";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-acaa1c99a03sor301057966b.12.2025.04.11.07.36.24
        (Google Transport Security);
        Fri, 11 Apr 2025 07:36:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="CQgCOO/1";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744382184; x=1744986984; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TlF6NDZu6E7cqFh7Nc+T41PatugtSHL1p7nnfIPlLdk=;
        b=CQgCOO/1N6ZeFfeh8MfbfSUrV/9uF480vFIGvUopotHv6ZeFiRSaAQo7jc9SrYBLw5
         ZAKFchA40uZ3EG55+bzTnZOumjG70w3o4/LWq0vq3mGnt29wrU7k8cN+n7Jj2IYe7lTc
         GwSaJanehe2rS27YgWK2zsxEnA0MbCrFqlHnhYbHgD/vm+XKjnFXACKyFbbeIvP9YEIx
         YIYot6zGlhJoQgdkXJxUDQbR8P/K8M762g4M0/p2iSEKnWrqdXWGGxEcKANOCT5/9Jdb
         tXPUY+f1YO8bSOLXTOj36qNsEoCRmrJ26tLkKud69Irbqr1wz8/wo0ccUtaWxhJ3nKim
         Xtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744382184; x=1744986984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TlF6NDZu6E7cqFh7Nc+T41PatugtSHL1p7nnfIPlLdk=;
        b=WEWyDi0Cmj6X3dL7V8yoOsSWnSXA6QUbnzcF/mkJhMProiYpZVhB6hQKXC4/n/BCSm
         MiIBvdOlnqlgJEYCQ1Y/+Iswt9LqId3gEFseUyNdsMZbYOHkc/her75aKMHP9YhHPdMH
         5o46AKHxvaeGL6zNn9TQo4Yc4bZ1mFIuXdCvWjjiudjybPRHe1alwAZA71KhWGddKOuQ
         pW+Od3jzV2dB6dZlZcQld6gcBCfAHLbnUPaIpy++9Nu/QDm1JLizowOR3RpOWEkF+4Ot
         NceXlS2LfU1uEMdiny6UprE2Nl7IDKJW+xDFZyKf5pe+MdjAOk3JySR9/Oa/uXzYGxnJ
         LlWw==
X-Forwarded-Encrypted: i=1; AJvYcCUYNdLHT+NdC81jjY82pbyYSmSON8OCkfoDN9LpqdRKc7pamWDvr3tO1SLssqEDOo9l4wbVHgNAPYqSrU5icA==@linaro.org, AJvYcCW4DLyMxeIUONvmpLGTlS4Bt/4qcw6qnyA6RW/PkMH4cHWwbAQBrouLMe0c7RpWUniAQ+XUh1oeErgsVjWbG7GoCG8=@linaro.org, AJvYcCXR66mW+jIFZlSrmsCNuDOHrLfrq+0+cVayCUGohGJwSprvzf0ReyJo0rDahT+MY4kn5puPIiBLIcd5yg==@linaro.org
X-Gm-Message-State: AOJu0YyxtDgKhzAetVw0ZLgRZGVJwz1Ps2S4v7x+z94mYP8nvAwA5cDX
	Fixf9u/0wa3vuGSs7l46iXrKmPGrHQZBLHzjeE8eErc7KSNqYWG59IDw6AnZ7yji1KUYxnzzPT9
	o74tAwji7uKlKyRV4JR9P8sK0kPE4xzdK5s4=
X-Gm-Gg: ASbGncuKTNVYmz6zBkCBndk0DQ9noj/2n/sIW8gCnayyyzb9rjaAKpzcvExvrEjaDDT
	LfMSz7Iyts/FqC0I6aFD97AhD1GFKj/RVcKqWRE7FwcWEzb4YnFL9Myl+9V77aaFTPGKsWFEGG+
	TcdGpdwSI4q2Mv7W2DmkB/58lAMU/sSK7FUfFOihztLMA8YBo+aeo=
X-Google-Smtp-Source: AGHT+IEK4IlWPqik4XVDKLNC42CRTXGG0nCurAmChUtUb3OKn1+5+1bmiQVlarf1wzo4Olhm09ujK8nS6X9rvaZgqTI=
X-Received: by 2002:a17:906:3551:b0:aca:d4f6:440d with SMTP id
 a640c23a62f3a-acad4f64472mr203284666b.17.1744382183784; Fri, 11 Apr 2025
 07:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora> <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
 <CAEDrbUZ4mbCT-npk8Nha4fDd9a5PGguAxS_RD0wG96gpQRUp+g@mail.gmail.com>
 <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com> <83f44749-0eea-48f0-8aa5-3882132e30d0@linaro.org>
In-Reply-To: <83f44749-0eea-48f0-8aa5-3882132e30d0@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Fri, 11 Apr 2025 23:36:10 +0900
X-Gm-Features: ATxdqUG2wUVfL0Bc-xKm6Ed3L3KzqObfzFH1fQHjiBHOvWTFvTqQyENfOv92ae8
Message-ID: <CAEDrbUbjD0d-pP_s1oV7gSuFoDpKTDiXd7bQf6p5hQUcN_iT+g@mail.gmail.com>
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Hanna Reitz <hreitz@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
	qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006acb94063281a09e"
X-TUID: aYmFTco8jGOT

--0000000000006acb94063281a09e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pierrick, thank you for the feedback.

> first, congrats for this work!
> It would be really nice to have this available upstream, starting with a
> modest TCI port, before having the tcg backend also.

Sure, I'll split the patch series, starting with the TCI port.

> Do you have recent information about wasm64? It seems to be something
> that has been discussed for several years, without really seeing any
> progress.

According to the adoption status=E2=80=AF[1], wasm64 is supported by recent=
 versions
of Chrome and Firefox. Emscripten also supports wasm64=E2=80=AF[2]. However=
, it is
not yet supported by Safari or libffi=E2=80=AF[3], and I haven't found a ro=
admap for
the adoption.

[1] https://webassembly.org/features/
[2]
https://emscripten.org/docs/tools_reference/settings_reference.html#memory6=
4
[3]
https://github.com/libffi/libffi/blob/6a99edb8082f75e523e0d6ebaba42218b80e1=
0c8/README.md#supported-platforms

> As Philippe said, we can't really revert that (it's now an assumption
> for our softmmu implementation, and would break code if we enabled it
> again now.)
>
> That said, we can always have a first version supporting only 32 bits
> targets. And later, when wasm64 will be available, we can extend this to
> all remaining ones.

The main challenge I'm seeing is that I couldn't find a clear timeline for
wasm64 adoption so it's difficult to predict when it will be widely
available.

Regarding the revert, the wasm backend supports 64-bit words, so the revert
introduced in patch 06/10 is partial, as also pointed out by Paolo.

--0000000000006acb94063281a09e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Pierrick, thank you for the feedback.<=
/div><br>&gt; first, congrats for this work!<br>&gt; It would be really nic=
e to have this available upstream, starting with a<br>&gt; modest TCI port,=
 before having the tcg backend also.<br><br>Sure, I&#39;ll split the patch =
series, starting with the TCI port.<br><br>&gt; Do you have recent informat=
ion about wasm64? It seems to be something<br>&gt; that has been discussed =
for several years, without really seeing any<br>&gt; progress.<br><br>Accor=
ding to the adoption status=E2=80=AF[1], wasm64 is supported by recent vers=
ions<br>of Chrome and Firefox. Emscripten also supports wasm64=E2=80=AF[2].=
 However, it is<br>not yet supported by Safari or libffi=E2=80=AF[3], and I=
 haven&#39;t found a roadmap for<br>the adoption.<br><br>[1] <a href=3D"htt=
ps://webassembly.org/features/">https://webassembly.org/features/</a><br>[2=
] <a href=3D"https://emscripten.org/docs/tools_reference/settings_reference=
.html#memory64">https://emscripten.org/docs/tools_reference/settings_refere=
nce.html#memory64</a><br>[3] <a href=3D"https://github.com/libffi/libffi/bl=
ob/6a99edb8082f75e523e0d6ebaba42218b80e10c8/README.md#supported-platforms">=
https://github.com/libffi/libffi/blob/6a99edb8082f75e523e0d6ebaba42218b80e1=
0c8/README.md#supported-platforms</a><br><br>&gt; As Philippe said, we can&=
#39;t really revert that (it&#39;s now an assumption <br>&gt; for our softm=
mu implementation, and would break code if we enabled it <br>&gt; again now=
.)<br>&gt; <br>&gt; That said, we can always have a first version supportin=
g only 32 bits <br>&gt; targets. And later, when wasm64 will be available, =
we can extend this to <br>&gt; all remaining ones.<br><br>The main challeng=
e I&#39;m seeing is that I couldn&#39;t find a clear timeline for<br>wasm64=
 adoption so it&#39;s difficult to predict when it will be widely<br>availa=
ble.<br><br>Regarding the revert, the wasm backend supports 64-bit words, s=
o the revert<br>introduced in patch 06/10 is partial, as also pointed out b=
y Paolo.<br><br></div>

--0000000000006acb94063281a09e--
