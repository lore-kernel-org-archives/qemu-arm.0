Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id r17-20020a05600c459100b004124907f43fsm21956884wmo.12.2024.02.22.09.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:27:18 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D005A5F89B;
	Thu, 22 Feb 2024 17:27:17 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  David Hildenbrand <david@redhat.com>,  Weiwei Li <liwei1518@gmail.com>,
  Richard Henderson <richard.henderson@linaro.org>,  Michael Rolnik
 <mrolnik@gmail.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-ppc@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  qemu-riscv@nongnu.org,  Cleber Rosa
 <crosa@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Song Gao
 <gaosong@loongson.cn>,  qemu-arm@nongnu.org,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  John Snow <jsnow@redhat.com>,
  =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>,  Nicholas Piggin <npiggin@gmail.com>,
  qemu-s390x@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Yanan Wang <wangyanan55@huawei.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Brian Cain <bcain@quicinc.com>,  Mahmoud
 Mandour <ma.mandourr@gmail.com>,  Alexandre Iooss <erdnaxe@crans.org>,
  Bin Meng <bin.meng@windriver.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
  Eduardo Habkost <eduardo@habkost.net>,  Alistair Francis
 <alistair.francis@wdc.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH 18/23] plugins: add an API to read registers
In-Reply-To: <f4b0b535-9e2b-47c7-a84b-afd851deb88a@daynix.com> (Akihiko
	Odaki's message of "Thu, 22 Feb 2024 22:22:35 +0900")
References: <20240216163025.424857-1-alex.bennee@linaro.org>
	<20240216163025.424857-19-alex.bennee@linaro.org>
	<c38a22b5-01e8-40f1-bfc4-4bba9bf7b516@daynix.com>
	<87il2jcje8.fsf@draig.linaro.org>
	<bf31a250-9539-448c-9c64-4168ab8741f1@daynix.com>
	<87bk8ab0f4.fsf@draig.linaro.org>
	<bf5e9471-c09f-47f2-a5a3-83713255c47a@daynix.com>
	<87zfvtaoqq.fsf@draig.linaro.org>
	<7e4b4ba6-3683-464f-ac37-3b7f19455643@daynix.com>
	<87cysoajhl.fsf@draig.linaro.org>
	<f4b0b535-9e2b-47c7-a84b-afd851deb88a@daynix.com>
User-Agent: mu4e 1.11.28; emacs 29.1
Date: Thu, 22 Feb 2024 17:27:17 +0000
Message-ID: <87plwo8l56.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6Nlf/+c3qBXV

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2024/02/22 19:20, Alex Benn=C3=A9e wrote:
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>=20
>>> On 2024/02/21 23:14, Alex Benn=C3=A9e wrote:
>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>
>>>>> On 2024/02/21 19:02, Alex Benn=C3=A9e wrote:
>>>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>>>
>>>>>>> On 2024/02/20 23:14, Alex Benn=C3=A9e wrote:
>>>>>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>>>>>
>>>>>>>>> On 2024/02/17 1:30, Alex Benn=C3=A9e wrote:
>>>>>>>>>> We can only request a list of registers once the vCPU has been
>>>>>>>>>> initialised so the user needs to use either call the get functio=
n on
>>>>>>>>>> vCPU initialisation or during the translation phase.
>>>>>>>>>> We don't expose the reg number to the plugin instead hiding it
>>>>>>>>>> behind
>>>>>>>>>> an opaque handle. This allows for a bit of future proofing shoul=
d the
>>>>>>>>>> internals need to be changed while also being hashed against the
>>>>>>>>>> CPUClass so we can handle different register sets per-vCPU in
>>>>>>>>>> hetrogenous situations.
>>>>>>>>>> Having an internal state within the plugins also allows us to ex=
pand
>>>>>>>>>> the interface in future (for example providing callbacks on regi=
ster
>>>>>>>>>> change if the translator can track changes).
>>>>>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>>>>>>>>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>>>>>> Message-Id: <20240103173349.398526-39-alex.bennee@linaro.org>
>>>>>>>>>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>>>>>>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>>>>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>>>>> <snip>
>>>>>>>>>> +/*
>>>>>>>>>> + * Register handles
>>>>>>>>>> + *
>>>>>>>>>> + * The plugin infrastructure keeps hold of these internal data
>>>>>>>>>> + * structures which are presented to plugins as opaque handles.=
 They
>>>>>>>>>> + * are global to the system and therefor additions to the hash =
table
>>>>>>>>>> + * must be protected by the @reg_handle_lock.
>>>>>>>>>> + *
>>>>>>>>>> + * In order to future proof for up-coming heterogeneous work we=
 want
>>>>>>>>>> + * different entries for each CPU type while sharing them in the
>>>>>>>>>> + * common case of multiple cores of the same type.
>>>>>>>>>> + */
>>>>>>>>>> +
>>>>>>>>>> +static QemuMutex reg_handle_lock;
>>>>>>>>>> +
>>>>>>>>>> +struct qemu_plugin_register {
>>>>>>>>>> +    const char *name;
>>>>>>>>>> +    int gdb_reg_num;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +static GHashTable *reg_handles; /* hash table of PluginReg */
>>>>>>>>>> +
>>>>>>>>>> +/* Generate a stable key - would xxhash be overkill? */
>>>>>>>>>> +static gpointer cpu_plus_reg_to_key(CPUState *cs, int gdb_regnu=
m)
>>>>>>>>>> +{
>>>>>>>>>> +    uintptr_t key =3D (uintptr_t) cs->cc;
>>>>>>>>>> +    key ^=3D gdb_regnum;
>>>>>>>>>> +    return GUINT_TO_POINTER(key);
>>>>>>>>>> +}
>>>>>>>>>
>>>>>>>>> I have pointed out this is theoretically prone to collisions and
>>>>>>>>> unsafe.
>>>>>>>> How is it unsafe? The aim is to share handles for the same CPUClass
>>>>>>>> rather than having a unique handle per register/cpu combo.
>>>>>>>
>>>>>>> THe intention is legitimate, but the implementation is not safe. It
>>>>>>> assumes (uintptr)cs->cc ^ gdb_regnum is unique, but there is no such
>>>>>>> guarantee. The key of GHashTable must be unique; generating hashes =
of
>>>>>>> keys should be done with hash_func given to g_hash_table_new().
>>>>>> This isn't a hash its a non-unique key. It is however unique for
>>>>>> the same register on the same class of CPU so for each vCPU in a sys=
tem
>>>>>> can share the same opaque handles.
>>>>>> The hashing is done internally by glib. We would assert if there was
>>>>>> a
>>>>>> duplicate key referring to a different register.
>>>>>> I'm unsure what you want here? Do you have a suggestion for the key
>>>>>> generation algorithm? As the comment notes I did consider a more com=
plex
>>>>>> mixing algorithm using xxhash but that wouldn't guarantee no clash
>>>>>> either.
>>>>>
>>>>> I suggest using a struct that holds both of cs->cc and gdb_regnum, and
>>>>> pass g_direct_equal() and g_direct_hash() to g_hash_table_new().
>>>> We already do:
>>>>           if (!reg_handles) {
>>>>               reg_handles =3D g_hash_table_new(g_direct_hash, g_direct=
_equal);
>>>>           }
>>>> But we can't use g_direct_equal with something that exceeds the
>>>> width of
>>>> gpointer as it is a straight equality test of the key. What you are
>>>> suggesting requires allocating memory for each key and de-referencing
>>>> with a custom GEqualFunc.
>>>
>>> My bad. I wrongly remembered g_direct_equal() and g_direct_hash(). It
>>> indeed seems to need a more complicated solution.
>>>
>>> It is possible to write a GEqualFunc and a GHashFunc that consumes a
>>> struct but it is a chore. How about having a two-level GHashTable?
>>> reg_handles will be a GHashTable keyed with cs->cc, and another
>>> GHashTable will be keyed with gdb_regnum.
>> That still seems overkill for a clash that can't happen. What do you
>> think about the following:
>>    /*
>>     * Generate a stable key shared across CPUs of the same class
>>     *
>>     * In order to future proof for up-coming heterogeneous work we want
>>     * different entries for each CPU type while sharing them in the
>>     * common case of multiple cores of the same type. This makes the
>>     * assumption you won't see two CPUClass pointers that are similar
>>     * enough that the low bits mixed with different registers numbers
>>     * will give you the same key.
>>     *
>>     * The build time assert will fire if CPUClass goes on a sudden diet
>>     * and we assert further down if we detect two keys representing
>>     * different regnums. In practice allocations of CPUClass are much
>>     * farther apart making clashes practically impossible.
>>     */
>>    static gpointer cpu_plus_reg_to_key(CPUState *cs, int gdb_regnum)
>>    {
>>        uintptr_t key =3D (uintptr_t) cs->cc;
>>        /* this protects some of the assumptions above */
>>        qemu_build_assert(sizeof(*cs->cc) >=3D 256);
>>        key ^=3D gdb_regnum;
>>        return GUINT_TO_POINTER(key);
>>    }
>
>
> I think the assertion and comments are overkill. Doesn't having a
> nested GHashTable save some words you have to wrote for the
> assumption?

A nested hash table for a single entry is overkill.

> I'm also not quite convinced that the comments and assertions are
> enough to say this hack is safe; what if some sort of pointer
> authentication is added and shuffles bits? Will this hack be
> compatible with static and dynamic checkers we may have in the future?

We are not using the value as a pointer so that should be irrelevant
although generally those bits tend to be at the top of pointers so they
can be masked off.

I'm not sure what we are trying to achieve here. I've got something that
works, doesn't fail any tests and has some guards in for potential
future problems. At the same time I'm not prepared to over-engineer the
solution for a theoretical future problem we haven't got yet.

What about if I just key based of gdb_regnum and we accept that that
might break the one heterogeneous system we model today?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
