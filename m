Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a21sm17470627wmb.5.2021.02.08.06.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 06:36:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A2E0A1FF7E;
	Mon,  8 Feb 2021 14:36:25 +0000 (GMT)
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-5-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Richard Henderson
 <richard.henderson@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Aurelien Jarno
 <aurelien@aurel32.net>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 4/6] accel/tcg: Include missing "tcg/tcg.h" header
Date: Mon, 08 Feb 2021 14:36:04 +0000
In-reply-to: <20210207232310.2505283-5-f4bug@amsat.org>
Message-ID: <877dnibp92.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8tiSXasIfM7k


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Commit 3468b59e18b ("tcg: enable multiple TCG contexts in softmmu")
> introduced use of typedef/prototypes declared in "tcg/tcg.h" without
> including it. This was not a problem because "tcg/tcg.h" is pulled
> in by "exec/cpu_ldst.h". To be able to remove this header there, we
> first need to include it here in op_helper.c, else we get:
>
>   accel/tcg/tcg-accel-ops-mttcg.c: In function =E2=80=98mttcg_cpu_thread_=
fn=E2=80=99:
>   accel/tcg/tcg-accel-ops-mttcg.c:52:5: error: implicit declaration of fu=
nction =E2=80=98tcg_register_thread=E2=80=99; did you mean =E2=80=98rcu_reg=
ister_thread=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>      52 |     tcg_register_thread();
>         |     ^~~~~~~~~~~~~~~~~~~
>         |     rcu_register_thread
>   accel/tcg/tcg-accel-ops-mttcg.c:52:5: error: nested extern declaration =
of =E2=80=98tcg_register_thread=E2=80=99 [-Werror=3Dnested-externs]
>   cc1: all warnings being treated as errors
>
>   accel/tcg/tcg-accel-ops-rr.c: In function =E2=80=98rr_cpu_thread_fn=E2=
=80=99:
>   accel/tcg/tcg-accel-ops-rr.c:153:5: error: implicit declaration of func=
tion =E2=80=98tcg_register_thread=E2=80=99; did you mean =E2=80=98rcu_regis=
ter_thread=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>     153 |     tcg_register_thread();
>         |     ^~~~~~~~~~~~~~~~~~~
>         |     rcu_register_thread
>   accel/tcg/tcg-accel-ops-rr.c:153:5: error: nested extern declaration of=
 =E2=80=98tcg_register_thread=E2=80=99 [-Werror=3Dnested-externs]
>   cc1: all warnings being treated as errors
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  accel/tcg/tcg-accel-ops-mttcg.c | 1 +
>  accel/tcg/tcg-accel-ops-rr.c    | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mt=
tcg.c
> index 42973fb062b..ddbca6c5b8c 100644
> --- a/accel/tcg/tcg-accel-ops-mttcg.c
> +++ b/accel/tcg/tcg-accel-ops-mttcg.c
> @@ -32,6 +32,7 @@
>  #include "exec/exec-all.h"
>  #include "hw/boards.h"
>=20=20
> +#include "tcg/tcg.h"
>  #include "tcg-accel-ops.h"
>  #include "tcg-accel-ops-mttcg.h"
>=20=20
> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index 4a66055e0d7..1bb1d0f8f1c 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -32,6 +32,7 @@
>  #include "exec/exec-all.h"
>  #include "hw/boards.h"
>=20=20
> +#include "tcg/tcg.h"
>  #include "tcg-accel-ops.h"
>  #include "tcg-accel-ops-rr.h"
>  #include "tcg-accel-ops-icount.h"

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
