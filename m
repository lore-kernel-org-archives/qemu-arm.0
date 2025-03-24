Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef098sm11291084f8f.84.2025.03.24.10.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 10:29:16 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B01EA5F906;
	Mon, 24 Mar 2025 17:29:15 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Nicholas Piggin
 <npiggin@gmail.com>,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
  Markus Armbruster <armbru@redhat.com>,  Akihiko Odaki
 <akihiko.odaki@daynix.com>,  qemu-ppc@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Thomas Huth <thuth@redhat.com>,  David
 Gibson <david@gibson.dropbear.id.au>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  qemu-s390x@nongnu.org,  Wainer dos
 Santos Moschetta <wainersm@redhat.com>,  David Hildenbrand
 <david@redhat.com>,  Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: Re: [PATCH v2 11/11] include/gdbstub: add note to helpers.h
In-Reply-To: <729ee2cc-ecaf-41d0-afbd-25f51952dbeb@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 24 Mar 2025 17:46:31
 +0100")
References: <20250324102142.67022-1-alex.bennee@linaro.org>
	<20250324102142.67022-12-alex.bennee@linaro.org>
	<729ee2cc-ecaf-41d0-afbd-25f51952dbeb@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 24 Mar 2025 17:29:15 +0000
Message-ID: <87v7ry2v84.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: u6r+AODwghXl

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 24/3/25 11:21, Alex Benn=C3=A9e wrote:
>> We've not yet deprecated but we should steer users away from these
>> helpers if they want to be in a single/heterogeneous binary.
>
> Why not deprecate?

I guess philosophically do we expect to eventually convert all frontends
to the new API or only those that want to be in the single binary?
Should I just be more explicit:

>>    *
>>    * These are all used by the various frontends and have to be host
>> - * aware to ensure things are store in target order.
>> + * aware to ensure things are store in target order. Consider using
>> + * the endian neutral registers.h if you want the architecture to be
>> + * included in an eventual single QEMU binary.
>>    *
>>    * Copyright (c) 2022 Linaro Ltd
>>    *


 These are all used by the various frontends and have to be host aware
 to ensure things are store in target order.

 New front-ends should not be using these APIs at all. They should be
 using the endian neutral registers.h as should any architecture that
 intends to be included in an eventual single QEMU binary.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
