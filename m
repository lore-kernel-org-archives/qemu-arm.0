Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bv15-20020a0560001f0f00b0033d47c6073esm11024174wrb.12.2024.02.27.02.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 02:29:04 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4E8A15F754;
	Tue, 27 Feb 2024 10:29:04 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Nicholas Piggin <npiggin@gmail.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  qemu-riscv@nongnu.org,  Michael
 Rolnik <mrolnik@gmail.com>,  Song Gao <gaosong@loongson.cn>,  Alexandre
 Iooss <erdnaxe@crans.org>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  David Hildenbrand <david@redhat.com>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  John Snow <jsnow@redhat.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  Mahmoud Mandour <ma.mandourr@gmail.com>,
  qemu-arm@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Cleber Rosa <crosa@redhat.com>,
  qemu-ppc@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>,
  qemu-s390x@nongnu.org,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Thomas Huth <thuth@redhat.com>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Yanan Wang <wangyanan55@huawei.com>,
  Brian Cain <bcain@quicinc.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
  Weiwei Li <liwei1518@gmail.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Bin Meng <bin.meng@windriver.com>,  Laurent
 Vivier <laurent@vivier.eu>,  Palmer Dabbelt <palmer@dabbelt.com>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  Alistair Francis
 <alistair.francis@wdc.com>
Subject: Re: [PATCH v3 21/27] plugins: add an API to read registers
In-Reply-To: <485e6093-54e9-4ce4-ae01-c44525b202ef@daynix.com> (Akihiko
	Odaki's message of "Tue, 27 Feb 2024 19:15:15 +0900")
References: <20240226165646.425600-1-alex.bennee@linaro.org>
	<20240226165646.425600-22-alex.bennee@linaro.org>
	<b7aac53e-cde5-4596-b0fc-d39f52d4ceb8@daynix.com>
	<878r36dxsv.fsf@draig.linaro.org>
	<485e6093-54e9-4ce4-ae01-c44525b202ef@daynix.com>
User-Agent: mu4e 1.12.0; emacs 29.1
Date: Tue, 27 Feb 2024 10:29:04 +0000
Message-ID: <8734tedwun.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9Iyvn25RsI6T

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2024/02/27 19:08, Alex Benn=C3=A9e wrote:
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>=20
>>> On 2024/02/27 1:56, Alex Benn=C3=A9e wrote:
>>>> We can only request a list of registers once the vCPU has been
>>>> initialised so the user needs to use either call the get function on
>>>> vCPU initialisation or during the translation phase.
>>>> We don't expose the reg number to the plugin instead hiding it
>>>> behind
>>>> an opaque handle. For now this is just the gdb_regnum encapsulated in
>>>> an anonymous GPOINTER but in future as we add more state for plugins
>>>> to track we can expand it.
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> Message-Id: <20240103173349.398526-39-alex.bennee@linaro.org>
>>>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>
>>> Hi,
>>>
>>> Mostly looks good. I have a few trivial comments so please have a look
>>> at them.
>> Done
>> <snip>
>>>> +        g_array_append_val(find_data, desc);
>>>> +    }
>>>> +
>>>> +    return find_data;
>>>> +}
>>>> +
>>>> +GArray *qemu_plugin_get_registers(void)
>>>> +{
>>>> +    g_assert(current_cpu);
>>>> +
>>>> +    g_autoptr(GArray) regs =3D gdb_get_register_list(current_cpu);
>>>> +    return regs->len ? create_register_handles(current_cpu, regs) : N=
ULL;
>>>
>>> Why do you need regs->len check?
>> Not all guests expose register to gdb so we need to catch that:
>>    TEST    catch-syscalls-with-libinsn.so on alpha
>> **
>> ERROR:../../plugins/api.c:459:qemu_plugin_get_registers: assertion faile=
d: (regs->len)
>> Aborted
> Certainly regs->len can be 0, but why do you need to return NULL in
> that case? Can't qemu_plugin_get_registers() return an empty array
> just as gdb_get_register_list() does?

That seems more troublesome to handle the other end. NULL is nothing is
a fairly common pattern here which makes short-circuiting the array
iteration simple.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
