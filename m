Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id e3-20020a5d4e83000000b0033d12895cfdsm7965045wru.61.2024.02.26.03.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:12:17 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 221805F7A7;
	Mon, 26 Feb 2024 11:12:17 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Song Gao <gaosong@loongson.cn>,
  qemu-s390x@nongnu.org,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
  Bin Meng <bin.meng@windriver.com>,  Yanan Wang <wangyanan55@huawei.com>,
  Laurent Vivier <laurent@vivier.eu>,  qemu-ppc@nongnu.org,  David
 Hildenbrand <david@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Cleber Rosa <crosa@redhat.com>,
  Nicholas Piggin <npiggin@gmail.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,
  Richard Henderson <richard.henderson@linaro.org>,  Philippe =?utf-8?Q?Ma?=
 =?utf-8?Q?thieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Alexandre Iooss <erdnaxe@crans.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  qemu-arm@nongnu.org,  qemu-riscv@nongnu.org,
  Palmer Dabbelt <palmer@dabbelt.com>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  John Snow <jsnow@redhat.com>,  Weiwei Li
 <liwei1518@gmail.com>,  Alistair Francis <alistair.francis@wdc.com>,
  Yoshinori Sato <ysato@users.sourceforge.jp>,  Brian Cain
 <bcain@quicinc.com>,  Paolo Bonzini <pbonzini@redhat.com>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Michael Rolnik <mrolnik@gmail.com>
Subject: Re: [PATCH v2 21/27] plugins: add an API to read registers
In-Reply-To: <2a7f0e06-0bc9-4fad-add7-9675a4cc2a0a@daynix.com> (Akihiko
	Odaki's message of "Sat, 24 Feb 2024 17:34:03 +0900")
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
	<20240223162202.1936541-22-alex.bennee@linaro.org>
	<2a7f0e06-0bc9-4fad-add7-9675a4cc2a0a@daynix.com>
User-Agent: mu4e 1.12.0; emacs 29.1
Date: Mon, 26 Feb 2024 11:12:17 +0000
Message-ID: <87y1b7eay6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ja4XTMkmY6Ge

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2024/02/24 1:21, Alex Benn=C3=A9e wrote:
>> We can only request a list of registers once the vCPU has been
>> initialised so the user needs to use either call the get function on
>> vCPU initialisation or during the translation phase.
>> We don't expose the reg number to the plugin instead hiding it
>> behind
>> an opaque handle. As the register set is potentially different for
>> each vCPU we store a separate set of handles for each vCPU. This will
>> become more important if we are able to emulate more heterogeneous
>> systems.
>> Having an internal state within the plugins also allows us to expand
>> the interface in future (for example providing callbacks on register
>> change if the translator can track changes).
<snip>
>> +
>> +/*
>> + * Register handles
>> + *
>> + * The plugin infrastructure keeps hold of these internal data
>> + * structures which are presented to plugins as opaque handles. They
>> + * are local to each vCPU as there can be slight variations for each
>> + * vCPU depending on enabled features. We track this in
>> + * CPUPluginState.
>> + */
>
> Since we do no longer coalesce registers for different classes, I need
> to bring my old question back: Why don't you just cast register
> numbers into pointers and use it as handles?

In the interest of getting this merged before the fast approaching
soft-freeze I shall do this for now. However once the plugin system has
knowledge of individual registers exposed by TCG it will need to track
internal state so will need some sort of container for that.

> You can even just expose gdb_reg_num with the interface.

As I have explained before I don't want plugins to treat the handle as
a pure index in case they start providing numbers that aren't in the
list provided by qemu_plugin_get_registers.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
