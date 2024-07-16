Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b37f8sm337612966b.46.2024.07.16.09.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 09:55:02 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 17EEE5F7A0;
	Tue, 16 Jul 2024 17:55:01 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  Akihiko Odaki <akihiko.odaki@daynix.com>,
  Gustavo Bueno Romero <gustavo.romero@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] gdbstub: Re-factor gdb command extensions
In-Reply-To: <b9b178fc-04f5-49a6-992a-f6920408b41f@linaro.org> (Richard
	Henderson's message of "Wed, 17 Jul 2024 02:33:23 +1000")
References: <20240716114229.329355-1-alex.bennee@linaro.org>
	<b9b178fc-04f5-49a6-992a-f6920408b41f@linaro.org>
Date: Tue, 16 Jul 2024 17:55:01 +0100
Message-ID: <87cyndgtui.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CHTs4NC0cAZQ

Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/16/24 21:42, Alex Benn=C3=A9e wrote:
>>   void gdb_extend_qsupported_features(char *qsupported_features)
>>   {
>> -    /*
>> -     * We don't support different sets of CPU gdb features on different=
 CPUs yet
>> -     * so assert the feature strings are the same on all CPUs, or is se=
t only
>> -     * once (1 CPU).
>> -     */
>> -    g_assert(extended_qsupported_features =3D=3D NULL ||
>> -             g_strcmp0(extended_qsupported_features, qsupported_feature=
s) =3D=3D 0);
>> -
>> -    extended_qsupported_features =3D qsupported_features;
>> +    if (!extended_qsupported_features) {
>> +        extended_qsupported_features =3D g_strdup(qsupported_features);
>> +    } else if (!g_strrstr(extended_qsupported_features, qsupported_feat=
ures)) {
>
> Did you really need the last instance of the substring?

Not really - I just want to check the string hasn't been added before.

>
> I'll note that g_strrstr is quite simplistic, whereas strstr has a
> much more scalable algorithm.
>
>
>> +        char *old =3D extended_qsupported_features;
>> +        extended_qsupported_features =3D g_strdup_printf("%s%s", old, q=
supported_features);
>
> Right tool for the right job, please: g_strconcat().
>
> That said, did you *really* want to concatenate now, and have to
> search through the middle, as opposed to storing N strings separately?
> You could defer the concat until the actual negotiation with gdb.
> That would reduce strstr above to a loop over strcmp.
>
>> +    for (int i =3D 0; i < extensions->len; i++) {
>> +        gpointer entry =3D g_ptr_array_index(extensions, i);
>> +        if (!g_ptr_array_find(table, entry, NULL)) {
>> +            g_ptr_array_add(table, entry);
>
> Are you expecting the same GdbCmdParseEntry object to be registered
> multiple times?  Can we fix that at a higher level?

Its basically a hack to deal with the fact everything is tied to the
CPUObject so we register everything multiple times. We could do a if
(!registerd) register() dance but I guess I'm thinking forward to a
hydrogenous future but I guess we'd need to do more work then anyway.

>
>
> r~

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
