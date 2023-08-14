Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d6dc2000000b00317f70240afsm14426724wrz.27.2023.08.14.06.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 06:29:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 08F5B1FFBB;
	Mon, 14 Aug 2023 14:29:24 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-13-akihiko.odaki@daynix.com>
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
Subject: Re: [RFC PATCH 12/24] gdbstub: Simplify XML lookup
Date: Mon, 14 Aug 2023 14:27:08 +0100
In-reply-to: <20230731084354.115015-13-akihiko.odaki@daynix.com>
Message-ID: <87jztxrbv0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xleC+501HIxb


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> Now we know all instances of GDBFeature that is used in CPU so we can
> traverse them to find XML. This removes the need for a CPU-specific
> lookup function for dynamic XMLs.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  gdbstub/gdbstub.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 182efe7e0f..e5bb2c89ba 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -354,8 +354,7 @@ static const char *get_feature_xml(const char *p, con=
st char **newp,
>                                     GDBProcess *process)
>  {
>      size_t len;
> -    int i;
> -    const char *name;
> +    GDBRegisterState *r;
>      CPUState *cpu =3D gdb_get_first_cpu_in_process(process);
>      CPUClass *cc =3D CPU_GET_CLASS(cpu);
>=20=20
> @@ -364,15 +363,12 @@ static const char *get_feature_xml(const char *p, c=
onst char **newp,
>          len++;
>      *newp =3D p + len;
>=20=20
> -    name =3D NULL;
>      if (strncmp(p, "target.xml", len) =3D=3D 0) {
>          char *buf =3D process->target_xml;
>          const size_t buf_sz =3D sizeof(process->target_xml);
>=20=20
>          /* Generate the XML description for this CPU.  */
>          if (!buf[0]) {
> -            GDBRegisterState *r;
> -
>              pstrcat(buf, buf_sz,
>                      "<?xml version=3D\"1.0\"?>"
>                      "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
> @@ -389,28 +385,22 @@ static const char *get_feature_xml(const char *p, c=
onst char **newp,
>              pstrcat(buf, buf_sz, "\"/>");
>              for (r =3D cpu->gdb_regs; r; r =3D r->next) {
>                  pstrcat(buf, buf_sz, "<xi:include href=3D\"");
> -                pstrcat(buf, buf_sz, r->feature->xml);
> +                pstrcat(buf, buf_sz, r->feature->xmlname);
>                  pstrcat(buf, buf_sz, "\"/>");
>              }
>              pstrcat(buf, buf_sz, "</target>");
>          }
>          return buf;
>      }

It would be nice to modernise this code before adding to it. The static
target_xml buffer and use of pstrcat could be replaced by GString code
that is less sketchy.


> -    if (cc->gdb_get_dynamic_xml) {
> -        char *xmlname =3D g_strndup(p, len);
> -        const char *xml =3D cc->gdb_get_dynamic_xml(cpu, xmlname);
> -
> -        g_free(xmlname);
> -        if (xml) {
> -            return xml;
> -        }
> +    if (strncmp(p, cc->gdb_core_feature->xmlname, len) =3D=3D 0) {
> +        return cc->gdb_core_feature->xml;
>      }
> -    for (i =3D 0; ; i++) {
> -        name =3D gdb_features[i].xmlname;
> -        if (!name || (strncmp(name, p, len) =3D=3D 0 && strlen(name) =3D=
=3D len))
> -            break;
> +    for (r =3D cpu->gdb_regs; r; r =3D r->next) {
> +        if (strncmp(p, r->feature->xmlname, len) =3D=3D 0) {
> +            return r->feature->xml;
> +        }
>      }
> -    return name ? gdb_features[i].xml : NULL;
> +    return NULL;
>  }
>=20=20
>  const GDBFeature *gdb_find_static_feature(const char *xmlname)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
