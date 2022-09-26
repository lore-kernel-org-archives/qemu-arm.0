Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id fc17-20020a05600c525100b003b435c41103sm11416542wmb.0.2022.09.26.04.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 04:06:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6F1F11FFB7;
	Mon, 26 Sep 2022 12:06:36 +0100 (BST)
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-4-alex.bennee@linaro.org>
 <85155F4E-0FFF-4DE6-A336-3F9C5B561CDC@ynddal.dk>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: mads@ynddal.dk
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM cores" <qemu-arm@nongnu.org>
Subject: Re: [PATCH  v1 3/9] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Date: Mon, 26 Sep 2022 12:01:12 +0100
In-reply-to: <85155F4E-0FFF-4DE6-A336-3F9C5B561CDC@ynddal.dk>
Message-ID: <87tu4u4coz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RF0Q+0T+YjF/


mads@ynddal.dk writes:

>> On 22 Sep 2022, at 16.58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>>=20
>> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
>> This solves edge cases like accessing via gdbstub or qtest.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>>=20
>> ---
>> v2
>>  - update for new field
>>  - bool asserts
>> ---
>> hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>> 1 file changed, 22 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index 492b2421ab..b58d3c4a95 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] =3D {
>>     0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0x=
b1
>> };
>>=20
>> -static inline int gic_get_current_cpu(GICState *s)
>> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>> {
>> -    if (!qtest_enabled() && s->num_cpu > 1) {
>> -        return current_cpu->cpu_index;
>> -    }
>> -    return 0;
>> +    /*
>> +     * Something other than a CPU accessing the GIC would be a bug as
>> +     * would a CPU index higher than the GICState expects to be
>> +     * handling
>> +     */
>> +    g_assert(attrs.requester_is_cpu);
>> +    g_assert(attrs.cpu_index < s->num_cpu);
>> +
>> +    return attrs.requester_id;
>> }
>
> The asserts here abort on macOS, with HVF accelerator:
>
> ERROR:../hw/intc/arm_gic.c:66:gic_get_current_cpu: assertion failed: (att=
rs.requester_is_cpu)
> Bail out! ERROR:../hw/intc/arm_gic.c:66:gic_get_current_cpu: assertion fa=
iled: (attrs.requester_is_cpu)
>
> If I revert the changes inside this function, it seemingly works
> again.

Thanks for testing.

I guess this is because the we have a soft GIC for HVF. Somewhere in the
hvf code path we must encode up an MemTxAttrs when the gic is accessed.

Could you try in the EC_DATAABORT path in
target/arm/hvf/hvf.c:hvf_vcpu_exec:

        if (iswrite) {
            val =3D hvf_get_reg(cpu, srt);
            address_space_write(&address_space_memory,
                                hvf_exit->exception.physical_address,
                                MEMTXATTRS_CPU(cpu->cpu_index), &val, len);
        } else {
            address_space_read(&address_space_memory,
                               hvf_exit->exception.physical_address,
                               MEMTXATTRS_CPU(cpu->cpu_index), &val, len);
            hvf_set_reg(cpu, srt, val);
        }

if that works I'll cook up a proper patch.

--=20
Alex Benn=C3=A9e
