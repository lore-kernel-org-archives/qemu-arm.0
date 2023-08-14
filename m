Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id v22-20020a1cf716000000b003fe23b10fdfsm17785682wmh.36.2023.08.14.08.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 08:15:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CE78B1FFBB;
	Mon, 14 Aug 2023 16:15:02 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-22-akihiko.odaki@daynix.com>
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
Subject: Re: [RFC PATCH 21/24] plugins: Allow to read registers
Date: Mon, 14 Aug 2023 16:05:16 +0100
In-reply-to: <20230731084354.115015-22-akihiko.odaki@daynix.com>
Message-ID: <87y1idpseh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JT5A/8ni/IS1


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> It is based on GDB protocol to ensure interface stability.

See comments bellow.

> The timing of the vcpu init hook is also changed so that the hook will
> get called after GDB features are initialized.

This might be worth splitting to a separate patch for cleaner bisecting.

>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  include/qemu/qemu-plugin.h   | 65 ++++++++++++++++++++++++++++++++++--
>  cpu.c                        | 11 ------
>  hw/core/cpu-common.c         | 10 ++++++
>  plugins/api.c                | 40 ++++++++++++++++++++++
>  plugins/qemu-plugins.symbols |  2 ++
>  5 files changed, 114 insertions(+), 14 deletions(-)
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 50a9957279..214b12bfd6 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -11,6 +11,7 @@
>  #ifndef QEMU_QEMU_PLUGIN_H
>  #define QEMU_QEMU_PLUGIN_H
>=20=20
> +#include <glib.h>
>  #include <inttypes.h>
>  #include <stdbool.h>
>  #include <stddef.h>
> @@ -51,7 +52,7 @@ typedef uint64_t qemu_plugin_id_t;
>=20=20
>  extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
>=20=20
> -#define QEMU_PLUGIN_VERSION 1
> +#define QEMU_PLUGIN_VERSION 2
>=20=20
>  /**
>   * struct qemu_info_t - system information for plugins
> @@ -218,8 +219,8 @@ struct qemu_plugin_insn;
>   * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
>   * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
>   *
> - * Note: currently unused, plugins cannot read or change system
> - * register state.
> + * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot chan=
ge
> + * system register state.
>   */
>  enum qemu_plugin_cb_flags {
>      QEMU_PLUGIN_CB_NO_REGS,
> @@ -664,4 +665,62 @@ uint64_t qemu_plugin_end_code(void);
>   */
>  uint64_t qemu_plugin_entry_code(void);
>=20=20
> +/**
> + * struct qemu_plugin_register_file_t - register information
> + *
> + * This structure identifies registers. The identifiers included in this
> + * structure are identical with names used in GDB's standard target feat=
ures
> + * with some extensions. For details, see:
> + *
> https://sourceware.org/gdb/onlinedocs/gdb/Standard-Target-Features.html

I'm not super keen on baking GDB-isms into the plugin register
interface.

> + *
> + * A register is uniquely identified with the combination of a feature n=
ame
> + * and a register name or a register number. It is recommended to derive
> + * register numbers from feature names and register names each time a ne=
w vcpu
> + * starts.

Do you have examples of clashing register names from different feature
sets?=20

> + *
> + * To derive the register number from a feature name and a register name,
> + * first look up qemu_plugin_register_file_t with the feature name, and =
then
> + * look up the register name in its @regs. The sum of the @base_reg and =
the
> + * index in the @reg is the register number.
> + *
> + * Note that @regs may have holes; some elements of @regs may be NULL.
> + */
> +typedef struct qemu_plugin_register_file_t {
> +    /** @name: feature name */
> +    const char *name;
> +    /** @regs: register names */
> +    const char * const *regs;
> +    /** @base_reg: the base identified number */
> +    int base_reg;
> +    /** @num_regs: the number of elements in @regs */
> +    int num_regs;
> +} qemu_plugin_register_file_t;
> +
> +/**
> + * qemu_plugin_get_register_files() - returns register information
> + *
> + * @vcpu_index: the index of the vcpu context
> + * @size: the pointer to the variable to hold the number of returned ele=
ments
> + *
> + * Returns an array of qemu_plugin_register_file_t. The user should g_fr=
ee()
> + * the array once no longer needed.
> + */
> +qemu_plugin_register_file_t *
> +qemu_plugin_get_register_files(unsigned int vcpu_index, int *size);

I think I'd rather have a simpler interface that returns an anonymous
handle to the plugin. For example:

  struct qemu_plugin_register;
  struct qemu_plugin_register qemu_plugin_find_register(const char *name);

> +
> +/**
> + * qemu_plugin_read_register() - read register
> + *
> + * @buf: the byte array to append the read register content to.
> + * @reg: the register identifier determined with
> + *       qemu_plugin_get_register_files().
> + *
> + * This function is only available in a context that register read acces=
s is
> + * explicitly requested.
> + *
> + * Returns the size of the read register. The content of @buf is in targ=
et byte
> + * order.
> + */
> +int qemu_plugin_read_register(GByteArray *buf, int reg);

and this then becomes:

  int qemu_plugin_read_register(GByteArray *buf, struct qemu_plugin_registe=
r);

in practice these can become anonymous pointers which hide the
implementation details from the plugin itself. Then the details of
mapping the register to a gdb regnum can be kept in the plugin code
keeping us free to further re-factor the code as we go.

The plugin code works quite hard to try and avoid leaking implementation
details to plugins so as not to tie QEMU's hands in re-factoring. While
the interface provided is technically GDB's, not QEMUs I don't think its
a particularly nice one to expose.

<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
