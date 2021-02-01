Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u3sm28397960wre.54.2021.02.01.03.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 03:23:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 93CBE1FF7E;
	Mon,  1 Feb 2021 11:23:51 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-7-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Sarah Harris
 <S.E.Harris@kent.ac.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Anthony Green
 <green@moxielogic.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Chris Wulff <crwulff@gmail.com>, Guan Xuetao
 <gxt@mprc.pku.edu.cn>, qemu-riscv@nongnu.org, David Hildenbrand
 <david@redhat.com>, qemu-arm@nongnu.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Michael Walle <michael@walle.cc>, Greg
 Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>, Cornelia
 Huck <cohuck@redhat.com>, Marek Vasut <marex@denx.de>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, =?utf-8?Q?Mar?=
 =?utf-8?Q?c-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 06/10] target/i386: Move SEV feature to target Kconfig
Date: Mon, 01 Feb 2021 11:20:31 +0000
In-reply-to: <20210131111316.232778-7-f4bug@amsat.org>
Message-ID: <87h7mwvxo8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: heTbvXcKWl/L


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> SEV is an architecture feature, move its declaration to target/i386/.

In docs/devel/kconfig.rst we make the distinction between:

  **subsystems**, of which **buses** are a special case
  **devices**
  **device groups**
  **boards**
  **internal elements**

Are we treating architecture features as internal elements or should we
add some additional words to the kconfig document before we starting to
move stuff there. In fact I realise this is better directed at 5/10 so
for this patch:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/Kconfig     | 4 ----
>  target/i386/Kconfig | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 7f91f30877f..3d67c172dab 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -1,7 +1,3 @@
> -config SEV
> -    bool
> -    depends on KVM
> -
>  config PC
>      bool
>      imply APPLESMC
> diff --git a/target/i386/Kconfig b/target/i386/Kconfig
> index ce6968906ee..27c76c554c7 100644
> --- a/target/i386/Kconfig
> +++ b/target/i386/Kconfig
> @@ -3,3 +3,7 @@ config I386
>=20=20
>  config X86_64
>      bool
> +
> +config SEV
> +    bool
> +    depends on KVM && I386


--=20
Alex Benn=C3=A9e
