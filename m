Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q11-20020a05600c46cb00b003ebf73acf9asm830403wmo.3.2023.03.10.09.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 09:56:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9CD461FFB7;
	Fri, 10 Mar 2023 17:56:35 +0000 (GMT)
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-8-alex.bennee@linaro.org>
 <97cbb69d-eae9-e7e9-cabd-afdba875aed8@linaro.org>
 <766cc218-dcbc-b6bf-d172-bb4d4ad0b7e2@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, Peter Xu
 <peterx@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, Thomas
 Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal
 <bleal@redhat.com>
Subject: Re: [PATCH 07/11] tcg: Clear plugin_mem_cbs on TB exit
Date: Fri, 10 Mar 2023 17:56:22 +0000
In-reply-to: <766cc218-dcbc-b6bf-d172-bb4d4ad0b7e2@linaro.org>
Message-ID: <87wn3olcbw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /8cKUrl043Ju


Richard Henderson <richard.henderson@linaro.org> writes:

> On 3/10/23 09:39, Richard Henderson wrote:
>> +=C2=A0=C2=A0=C2=A0 /* Undo any setting in generated code. */
>> +=C2=A0=C2=A0=C2=A0 plugin_gen_disable_mem_helpers();
>
> Oh!  And this is the wrong function.  Should be
> qemu_plugin_disable_mem_helpers.

Did I miss a newer version of the patches?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
