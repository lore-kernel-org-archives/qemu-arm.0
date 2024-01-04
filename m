Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k9-20020a05600c1c8900b0040d772030c2sm5545801wms.44.2024.01.04.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 04:22:24 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B05F75F92F;
	Thu,  4 Jan 2024 12:22:23 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,
  Richard Henderson <richard.henderson@linaro.org>,  Song Gao
 <gaosong@loongson.cn>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  David Hildenbrand <david@redhat.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  Yanan Wang <wangyanan55@huawei.com>,  Bin Meng <bin.meng@windriver.com>,
  Laurent Vivier <lvivier@redhat.com>,  Michael Rolnik <mrolnik@gmail.com>,
  Alexandre Iooss <erdnaxe@crans.org>,  David Woodhouse
 <dwmw2@infradead.org>,  Laurent Vivier <laurent@vivier.eu>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Brian Cain <bcain@quicinc.com>,  Daniel Henrique
 Barboza <danielhb413@gmail.com>,  Beraldo Leal <bleal@redhat.com>,  Paul
 Durrant <paul@xen.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Thomas
 Huth <thuth@redhat.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
  Cleber Rosa <crosa@redhat.com>,  kvm@vger.kernel.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  qemu-arm@nongnu.org,  Weiwei Li
 <liwei1518@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  John
 Snow <jsnow@redhat.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Nicholas Piggin <npiggin@gmail.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>,  qemu-riscv@nongnu.org,
  Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 38/43] plugins: add an API to read registers
In-Reply-To: <52cac44e-a467-4748-8c5b-c9c47f5b0f79@daynix.com> (Akihiko
	Odaki's message of "Thu, 4 Jan 2024 21:05:22 +0900")
References: <20240103173349.398526-1-alex.bennee@linaro.org>
	<20240103173349.398526-39-alex.bennee@linaro.org>
	<52cac44e-a467-4748-8c5b-c9c47f5b0f79@daynix.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Thu, 04 Jan 2024 12:22:23 +0000
Message-ID: <87cyuhguf4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GuSw7rDC6hzm

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2024/01/04 2:33, Alex Benn=C3=A9e wrote:
>> We can only request a list of registers once the vCPU has been
>> initialised so the user needs to use either call the get function on
>> vCPU initialisation or during the translation phase.
>> We don't expose the reg number to the plugin instead hiding it
>> behind
>> an opaque handle. This allows for a bit of future proofing should the
>> internals need to be changed while also being hashed against the
>> CPUClass so we can handle different register sets per-vCPU in
>> hetrogenous situations.
>> Having an internal state within the plugins also allows us to expand
>> the interface in future (for example providing callbacks on register
>> change if the translator can track changes).
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> v3
>>    - also g_intern_string the register name
>>    - make get_registers documentation a bit less verbose
>> v2
>>    - use new get whole list api, and expose upwards
>> vAJB:
>> The main difference to Akikio's version is hiding the gdb register
>> detail from the plugin for the reasons described above.
>> ---
>>   include/qemu/qemu-plugin.h   |  51 +++++++++++++++++-
>>   plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>>   plugins/qemu-plugins.symbols |   2 +
>>   3 files changed, 153 insertions(+), 2 deletions(-)
>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> index 4daab6efd29..95380895f81 100644
>> --- a/include/qemu/qemu-plugin.h
>> +++ b/include/qemu/qemu-plugin.h
>> @@ -11,6 +11,7 @@
>>   #ifndef QEMU_QEMU_PLUGIN_H
>>   #define QEMU_QEMU_PLUGIN_H
>>   +#include <glib.h>
>>   #include <inttypes.h>
>>   #include <stdbool.h>
>>   #include <stddef.h>
>> @@ -227,8 +228,8 @@ struct qemu_plugin_insn;
>>    * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
>>    * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
>>    *
>> - * Note: currently unused, plugins cannot read or change system
>> - * register state.
>> + * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot cha=
nge
>> + * system register state.
>>    */
>>   enum qemu_plugin_cb_flags {
>>       QEMU_PLUGIN_CB_NO_REGS,
>> @@ -708,4 +709,50 @@ uint64_t qemu_plugin_end_code(void);
>>   QEMU_PLUGIN_API
>>   uint64_t qemu_plugin_entry_code(void);
>>   +/** struct qemu_plugin_register - Opaque handle for register
>> access */
>> +struct qemu_plugin_register;
>
> Just in case you missed my comment for the earlier version:
>
> What about identifying a register with an index in an array returned
> by qemu_plugin_get_registers(). That saves troubles having the handle
> member in qemu_plugin_reg_descriptor.

The handle gets de-referenced internally in the plugin api and
additional checking could be added there. If we pass an index then we'd
end up having to track the index assigned during get_registers as well
as account for a potential skew in the index value if the register
layout varies between vCPUs (although I admit this is future proofing
for potential heterogeneous models).

The concept of opaque handle =3D=3D pointer is fairly common in the QEMU
code base. We are not making it hard for a plugin author to bypass this
"protection", just making it clear if you do so your violating the
principle of the API.

>
> Regards,
> Akihiko Odaki

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
