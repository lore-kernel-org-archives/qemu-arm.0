Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s21sm689891wmc.10.2021.04.28.12.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 12:05:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2B5881FF7E;
	Wed, 28 Apr 2021 20:05:16 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
 <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com>
 <874kfqs5gl.fsf@linaro.org>
 <763dbed9-35e9-0f85-3b94-01bffc7fcbf8@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Andrew Jones
 <drjones@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>, "Emilio G . Cota"
 <cota@braap.org>
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if
 TCG is selected
Date: Wed, 28 Apr 2021 20:04:54 +0100
In-reply-to: <763dbed9-35e9-0f85-3b94-01bffc7fcbf8@redhat.com>
Message-ID: <871raus00j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yVN0avHyXiwQ


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 4/28/21 7:06 PM, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Alex, Richard, do you mind reviewing this one please?
>>=20
>> Isn't it already merged (with my r-b tag no less ;-)
>>=20
>>   f77147cd4de8c726f89b2702f7a9d0c9711d8875
>
> See ...
>
>>   Author:     Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>   AuthorDate: Fri Jan 22 21:44:31 2021 +0100
>>   Commit:     Paolo Bonzini <pbonzini@redhat.com>
>>   CommitDate: Mon Feb 8 14:43:55 2021 +0100
>>=20
>>>
>>> On 4/15/21 6:33 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>>
>>>> The previous attempt (commit f77147cd4de) doesn't work as
>
> ... ^ this comment :(

Ahh - my tooling was confused having searched by the subject title ;-)

>
>>>> expected, as we still have CONFIG_TCG=3D1 when using:
>>>>
>>>>   configure --disable-system --disable-user
>>>>
>>>> Now than we have removed the use of CONFIG_TCG from target-dependent
>>>> files in tests/qtest/, we can remove the unconditional definition of
>>>> CONFIG_TCG in config_host.
>>>>
>>>> This avoid to build a bunch of unrequired objects when building with
>>>> --disable-tcg (in particular the softfloat tests):
>>>>
>>>> Before:
>>>>
>>>>   $ make
>>>>   [1/812] Generating trace-qom.h with a custom command
>>>>   ...
>>>>
>>>> After:
>>>>
>>>>   $ make
>>>>   [1/349] Generating trace-qom.h with a custom command
>>>>   ...
>>>>
>>>> A difference of 463 objects...
>>>>
>>>> Reported-by: Claudio Fontana <cfontana@suse.de>
>>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> ---
>>>> v3: Include Paolo's feedback:
>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
>>>> therefore o not include Alex's R-b tag.
>>>>
>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>>> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> Cc: Emilio G. Cota <cota@braap.org>
>>>> ---
>>>>  meson.build | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/meson.build b/meson.build
>>>> index c6f4b0cf5e8..623cbe50685 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -262,7 +262,6 @@
>>>>                          language: ['c', 'cpp', 'objc'])
>>>>=20=20
>>>>    accelerators +=3D 'CONFIG_TCG'
>>>> -  config_host +=3D { 'CONFIG_TCG': 'y' }
>>>>  endif
>>>>=20=20
>>>>  if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
>>>>
>>=20
>>=20


--=20
Alex Benn=C3=A9e
