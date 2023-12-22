Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id az3-20020a05600c600300b0040d4954ac04sm1253567wmb.43.2023.12.22.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 05:45:07 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 734CF5F7DA;
	Fri, 22 Dec 2023 13:45:07 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
  John Snow <jsnow@redhat.com>,  Aurelien Jarno <aurelien@aurel32.net>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>,  Eduardo Habkost <eduardo@habkost.net>,  Brian
 Cain <bcain@quicinc.com>,  Laurent Vivier <laurent@vivier.eu>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Cleber Rosa <crosa@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Beraldo Leal <bleal@redhat.com>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Weiwei Li
 <liwei1518@gmail.com>,  Paul Durrant <paul@xen.org>,
  qemu-s390x@nongnu.org,  David Woodhouse <dwmw2@infradead.org>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
  Michael Rolnik <mrolnik@gmail.com>,  Alistair Francis
 <alistair.francis@wdc.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Laurent Vivier <lvivier@redhat.com>,
  kvm@vger.kernel.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  Alexandre Iooss <erdnaxe@crans.org>,  Thomas Huth <thuth@redhat.com>,
  Peter Maydell <peter.maydell@linaro.org>,  qemu-ppc@nongnu.org,  Paolo
 Bonzini <pbonzini@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Nicholas Piggin <npiggin@gmail.com>,
  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,  Song Gao
 <gaosong@loongson.cn>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  Richard Henderson <richard.henderson@linaro.org>,  Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,
  Mahmoud Mandour <ma.mandourr@gmail.com>,  Bin Meng
 <bin.meng@windriver.com>
Subject: Re: [PATCH 37/40] plugins: add an API to read registers
In-Reply-To: <a26a55b2-240c-48c3-b341-48c1d7195bd9@daynix.com> (Akihiko
	Odaki's message of "Thu, 21 Dec 2023 22:19:25 +0900")
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
	<20231221103818.1633766-38-alex.bennee@linaro.org>
	<a26a55b2-240c-48c3-b341-48c1d7195bd9@daynix.com>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Fri, 22 Dec 2023 13:45:07 +0000
Message-ID: <87y1dmxsf0.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: bbQrXMSzxjGr

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2023/12/21 19:38, Alex Benn=C3=A9e wrote:
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
>> v2
>>    - use new get whole list api, and expose upwards
>> vAJB:
>> The main difference to Akikio's version is hiding the gdb register
>> detail from the plugin for the reasons described above.
>> ---
>>   include/qemu/qemu-plugin.h   |  53 +++++++++++++++++-
>>   plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>>   plugins/qemu-plugins.symbols |   2 +
>>   3 files changed, 155 insertions(+), 2 deletions(-)
>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> index 4daab6efd29..e3b35c6ee81 100644
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
>> @@ -708,4 +709,52 @@ uint64_t qemu_plugin_end_code(void);
>>   QEMU_PLUGIN_API
>>   uint64_t qemu_plugin_entry_code(void);
>>   +/** struct qemu_plugin_register - Opaque handle for a translated
>> instruction */
>> +struct qemu_plugin_register;
>
> What about identifying a register with an index in an array returned
> by qemu_plugin_get_registers(). That saves troubles having the handle
> member in qemu_plugin_reg_descriptor.
>
>> +
>> +/**
>> + * typedef qemu_plugin_reg_descriptor - register descriptions
>> + *
>> + * @name: register name
>> + * @handle: opaque handle for retrieving value with qemu_plugin_read_re=
gister
>> + * @feature: optional feature descriptor, can be NULL
>
> Why can it be NULL?
>
>> + */
>> +typedef struct {
>> +    char name[32];
>
> Why not const char *?

I was trying to avoid too many free floating strings. I could intern it
in the API though.

>
>> +    struct qemu_plugin_register *handle;
>> +    const char *feature;
>> +} qemu_plugin_reg_descriptor;
>> +
>> +/**
>> + * qemu_plugin_get_registers() - return register list for vCPU
>> + * @vcpu_index: vcpu to query
>> + *
>> + * Returns a GArray of qemu_plugin_reg_descriptor or NULL. Caller
>> + * frees the array (but not the const strings).
>> + *
>> + * As the register set of a given vCPU is only available once
>> + * the vCPU is initialised if you want to monitor registers from the
>> + * start you should call this from a qemu_plugin_register_vcpu_init_cb()
>> + * callback.
>
> Is this note really necessary? You won't know vcpu_index before
> qemu_plugin_register_vcpu_init_cb() anyway.

Best to be clear I think.

>
>> + */
>> +GArray * qemu_plugin_get_registers(unsigned int vcpu_index);
>
> Spurious space after *.
>
>> +
>> +/**
>> + * qemu_plugin_read_register() - read register
>> + *
>> + * @vcpu: vcpu index
>> + * @handle: a @qemu_plugin_reg_handle handle
>> + * @buf: A GByteArray for the data owned by the plugin
>> + *
>> + * This function is only available in a context that register read acce=
ss is
>> + * explicitly requested.
>> + *
>> + * Returns the size of the read register. The content of @buf is in tar=
get byte
>> + * order. On failure returns -1
>> + */
>> +int qemu_plugin_read_register(unsigned int vcpu,
>> +                              struct qemu_plugin_register *handle,
>> +                              GByteArray *buf);
>
> Indention is not correct. docs/devel/style.rst says:
>
>> In case of function, there are several variants:
>>
>> * 4 spaces indent from the beginning
>> * align the secondary lines just after the opening parenthesis of
>     the first

Isn't that what it does?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
