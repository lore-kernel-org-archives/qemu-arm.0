Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y14sm7258669wro.58.2021.01.28.07.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 07:42:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A63981FF7E;
	Thu, 28 Jan 2021 15:42:54 +0000 (GMT)
References: <20200929224355.1224017-1-philmd@redhat.com>
 <87r1m5x56h.fsf@linaro.org>
 <98f06a0a-efe6-c630-8e68-0e4559f04d58@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Fam Zheng <fam@euphon.net>, Peter Maydell
 <peter.maydell@linaro.org>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v4 00/12] Support disabling TCG on ARM (part 2)
Date: Thu, 28 Jan 2021 15:42:38 +0000
In-reply-to: <98f06a0a-efe6-c630-8e68-0e4559f04d58@redhat.com>
Message-ID: <87bld9ukxt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mwUzC1Tb6RCG


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Alex,
>
> On 1/28/21 1:41 AM, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Cover from Samuel Ortiz from (part 1) [1]:
>>>
>>>   This patchset allows for building and running ARM targets with TCG
>>>   disabled. [...]
>>>
>>>   The rationale behind this work comes from the NEMU project where we're
>>>   trying to only support x86 and ARM 64-bit architectures, without
>>>   including the TCG code base. We can only do so if we can build and run
>>>   ARM binaries with TCG disabled.
>>>
>>> v4 almost 2 years later... [2]:
>>> - Rebased on Meson
>>> - Addressed Richard review comments
>>> - Addressed Claudio review comments
>>=20
>> Have you re-based recently because I was having a look but ran into
>> merge conflicts. I'd like to get the merged at some point because I ran
>> into similar issues with the Xen only build without TCG.
>
> I addressed most of this review comments locally. Since Claudio's
> accelerator series was getting more attention (and is bigger) I was
> waiting it gets merged first. He just respun v14:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07171.html

OK I'll have a look at Claudio's first ;-)



--=20
Alex Benn=C3=A9e
