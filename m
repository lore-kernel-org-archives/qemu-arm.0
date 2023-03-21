Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d684a000000b002d89e113691sm2356900wrw.52.2023.03.21.06.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 06:59:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1E1651FFB7;
	Tue, 21 Mar 2023 13:59:48 +0000 (GMT)
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: vma-pthread unstable on aarch64 hardware
Date: Tue, 21 Mar 2023 13:59:48 +0000
Message-ID: <875yau6w8b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GflxNgmES8n+

Date: Tue, 21 Mar 2023 13:48:20 +0000
User-agent: mu4e 1.9.22; emacs 29.0.60

Hi,

Chasing down some unstable check-tcg tests and I can get vma-pthread to
fail fairly reliably on the CI configuration ('../../configure'
'--enable-debug' '--static' '--disable-system' '--disable-pie') although
it seems to hold up on the default configuration ok.

  retry.py -n 30 -c -- ./qemu-aarch64 ./tests/tcg/aarch64-linux-user/vma-pt=
hread
  ...
  **
  ERROR:../../accel/tcg/cpu-exec.c:1019:cpu_exec_setjmp: assertion failed: =
(cpu =3D=3D current_cpu)
  Bail out! ERROR:../../accel/tcg/cpu-exec.c:1019:cpu_exec_setjmp: assertio=
n failed: (cpu =3D=3D current_cpu)
  ...
  Results summary:
  0: 29 times (96.67%), avg time 1.503 (0.00 varience/0.00 deviation)
  -5: 1 times (3.33%), avg time 0.252 (0.00 varience/0.00 deviation)
  Ran command 30 times, 29 passes

That said it might be responsible for some of the other tests that fail
when I do something like:

  cd tests/tcg/aarch64-linux-user/
  retry.py -n 30 --until -- make -f ../Makefile.target run

where I've seen random failures in float_convs, mte-1 and testthread
which make me wonder if this is some sort of toolchain/build config
issue?

Any ideas?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
