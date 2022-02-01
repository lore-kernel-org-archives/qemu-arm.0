Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r2sm4949187wmq.0.2022.02.01.07.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 07:31:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 701421FFB7;
	Tue,  1 Feb 2022 15:31:09 +0000 (GMT)
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-13-alex.bennee@linaro.org>
 <YflK+fSCdRCzmNrS@strawberry.localdomain>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, minyihh@uci.edu, ma.mandourr@gmail.com,
 Luke.Craig@ll.mit.edu, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, Alexandre Iooss
 <erdnaxe@crans.org>, Peter Maydell <peter.maydell@linaro.org>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH  v1 12/22] plugins: stxp test case from Aaron (!upstream)
Date: Tue, 01 Feb 2022 15:29:05 +0000
In-reply-to: <YflK+fSCdRCzmNrS@strawberry.localdomain>
Message-ID: <87o83qy56q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: guMjqCWS2g54


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Jan 24 20:15, Alex Benn=C3=A9e wrote:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
>> Message-ID: <YXCA62xdRDeueQR6@strawberry.localdomain>
>>=20
>> ---
>> [AJB] this was for testing, I think you can show the same stuff with
>> the much more complete execlog now.
>
> Is it true that execlog can also reproduce the duplicate loads which are
> still an outstanding issue?

Are we still seeing duplicate loads? I thought that had been fixed.

>
> -Aaron
>
>> ---
>>  contrib/plugins/stxp-plugin.c     | 50 +++++++++++++++++++++++++++++++
>>  tests/tcg/aarch64/stxp.c          | 28 +++++++++++++++++
>>  contrib/plugins/Makefile          |  1 +
>>  tests/tcg/aarch64/Makefile.target |  3 ++
>>  4 files changed, 82 insertions(+)
>>  create mode 100644 contrib/plugins/stxp-plugin.c
>>  create mode 100644 tests/tcg/aarch64/stxp.c
>>=20
>> diff --git a/contrib/plugins/stxp-plugin.c b/contrib/plugins/stxp-plugin=
.c
>> new file mode 100644
>> index 0000000000..432cf8c1ed
>> --- /dev/null
>> +++ b/contrib/plugins/stxp-plugin.c
>> @@ -0,0 +1,50 @@
>> +#include <stdio.h>
>> +#include <stdarg.h>
>> +#include <qemu-plugin.h>
>> +
>> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>> +
>> +void qemu_logf(const char *str, ...)
>> +{
>> +    char message[1024];
>> +    va_list args;
>> +    va_start(args, str);
>> +    vsnprintf(message, 1023, str, args);
>> +
>> +    qemu_plugin_outs(message);
>> +
>> +    va_end(args);
>> +}
>> +
>> +void before_insn_cb(unsigned int cpu_index, void *udata)
>> +{
>> +    uint64_t pc =3D (uint64_t)udata;
>> +    qemu_logf("Executing PC: 0x%" PRIx64 "\n", pc);
>> +}
>> +
>> +static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminf=
o, uint64_t va, void *udata)
>> +{
>> +    uint64_t pc =3D (uint64_t)udata;
>> +    qemu_logf("PC 0x%" PRIx64 " accessed memory at 0x%" PRIx64 "\n", pc=
, va);
>> +}
>> +
>> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *t=
b)
>> +{
>> +    size_t n =3D qemu_plugin_tb_n_insns(tb);
>> +
>> +    for (size_t i =3D 0; i < n; i++) {
>> +        struct qemu_plugin_insn *insn =3D qemu_plugin_tb_get_insn(tb, i=
);
>> +        uint64_t pc =3D qemu_plugin_insn_vaddr(insn);
>> +
>> +        qemu_plugin_register_vcpu_insn_exec_cb(insn, before_insn_cb, QE=
MU_PLUGIN_CB_R_REGS, (void *)pc);
>> +        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb, QEMU_PLUGIN_CB_N=
O_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);
>> +    }
>> +}
>> +
>> +QEMU_PLUGIN_EXPORT
>> +int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
>> +                        int argc, char **argv)
>> +{
>> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>> +    return 0;
>> +}
>> diff --git a/tests/tcg/aarch64/stxp.c b/tests/tcg/aarch64/stxp.c
>> new file mode 100644
>> index 0000000000..fb8ef6a46d
>> --- /dev/null
>> +++ b/tests/tcg/aarch64/stxp.c
>> @@ -0,0 +1,28 @@
>> +
>> +
>> +void stxp_issue_demo(void *arr)
>> +{
>> +    asm(".align 8\n\t"
>> +        "    mov x0, %[in]\n\t"
>> +        "    mov x18, 0x1000\n\t"
>> +        "    mov x2, 0x0\n\t"
>> +        "    mov x3, 0x0\n\t"
>> +        "loop:\n\t"
>> +        "    prfm  pstl1strm, [x0]\n\t"
>> +        "    ldxp  x16, x17, [x0]\n\t"
>> +        "    stxp  w16, x2, x3, [x0]\n\t"
>> +        "\n\t"
>> +        "    subs x18, x18, 1\n\t"
>> +        "    beq done\n\t"
>> +        "    b loop\n\t"
>> +        "done:\n\t"
>> +        : /* none out */
>> +        : [in] "r" (arr) /* in */
>> +        : "x0", "x2", "x3", "x16", "x17", "x18"); /* clobbers */
>> +}
>> +
>> +int main()
>> +{
>> +    char arr[16];
>> +    stxp_issue_demo(&arr);
>> +}
>> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
>> index 54ac5ccd9f..576ed5875a 100644
>> --- a/contrib/plugins/Makefile
>> +++ b/contrib/plugins/Makefile
>> @@ -20,6 +20,7 @@ NAMES +=3D howvec
>>  NAMES +=3D lockstep
>>  NAMES +=3D hwprofile
>>  NAMES +=3D cache
>> +NAMES +=3D stxp-plugin
>>=20=20
>>  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
>>=20=20
>> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makef=
ile.target
>> index 1d967901bd..54b2e90d00 100644
>> --- a/tests/tcg/aarch64/Makefile.target
>> +++ b/tests/tcg/aarch64/Makefile.target
>> @@ -72,4 +72,7 @@ endif
>>=20=20
>>  endif
>>=20=20
>> +# Load/Store exclusive test
>> +AARCH64_TESTS +=3D stxp
>> +
>>  TESTS +=3D $(AARCH64_TESTS)
>> --=20
>> 2.30.2
>>=20


--=20
Alex Benn=C3=A9e
