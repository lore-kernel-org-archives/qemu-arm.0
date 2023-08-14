Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id v14-20020a1cf70e000000b003fe24441e23sm14095038wmh.24.2023.08.14.04.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 04:57:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 052581FFBB;
	Mon, 14 Aug 2023 12:57:06 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-5-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, Aurelien
 Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Chris Wulff
 <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, Stafford Horne
 <shorne@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Nicholas Piggin
 <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [RFC PATCH 04/24] gdbstub: Introduce gdb_find_static_feature()
Date: Mon, 14 Aug 2023 12:56:38 +0100
In-reply-to: <20230731084354.115015-5-akihiko.odaki@daynix.com>
Message-ID: <878radsupa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZDO+BqLyGwud


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> This function is useful to determine the number of registers exposed to
> GDB from the XML name.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  include/exec/gdbstub.h |  2 ++
>  gdbstub/gdbstub.c      | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 22e5add5b1..3115dc21c0 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -34,6 +34,8 @@ void gdb_register_coprocessor(CPUState *cpu,
>   */
>  int gdbserver_start(const char *port_or_device);
>=20=20
> +const GDBFeature *gdb_find_static_feature(const char *xmlname);
> +
>  void gdb_set_stop_cpu(CPUState *cpu);
>=20=20
>  /**
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index fad70200d8..6d9cef5b95 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -414,6 +414,19 @@ static const char *get_feature_xml(const char *p, co=
nst char **newp,
>      return name ? gdb_features[i].xml : NULL;
>  }
>=20=20
> +const GDBFeature *gdb_find_static_feature(const char *xmlname)
> +{
> +    const GDBFeature *feature;
> +
> +    for (feature =3D gdb_features; feature->xmlname; feature++) {
> +        if (!strcmp(feature->xmlname, xmlname)) {

I'd prefer g_strcmp0(feature->xmlname, xmlname) =3D=3D 0 but either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
