Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y5-20020adfd085000000b003095bd71159sm13284995wrh.7.2023.06.06.10.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 10:04:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 24E3D1FFBB;
	Tue,  6 Jun 2023 18:04:52 +0100 (BST)
References: <20230606141252.95032-1-philmd@linaro.org>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 0/5] misc: Enforce .[ch].inc extension for re-included
 .c/.h files
Date: Tue, 06 Jun 2023 18:02:14 +0100
In-reply-to: <20230606141252.95032-1-philmd@linaro.org>
Message-ID: <87sfb4h68b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: C6zLJMsmVQ+r


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Follow the convention to use the .inc extension for .c/.h files
> re-included, as docummented in Coding Style since commit 6a0057aa22:
>
>     If you do use template header files they should be named with
>     the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>     being included for expansion.
>
> Most of the codebase already uses this extension:
>
>   $ git ls-files | fgrep .inc | wc -l
>        155

Ahh prescient as I've just added this hack to the loc tool I'm using:

  modified   src/lib.rs
  @@ -338,7 +338,7 @@ pub fn lang_from_ext(filepath: &str) -> Lang {
           "at" =3D> AmbientTalk,
           "awk" =3D> Awk,
           "bat" | "btm" | "cmd" =3D> Batch,
  -        "c" | "ec" | "pgc" =3D> C,
  +        "c" | "ec" | "pgc" | "inc" =3D> C,
           "cc" | "cpp" | "cxx" | "c++" | "pcc" =3D> Cpp,
           "cfc" =3D> ColdFusionScript,
           "cmake" =3D> CMake,

while gathering loc stats for the project.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
