Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k11sm6250309wmj.1.2021.06.03.09.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:41:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2D6BB1FF7E;
	Thu,  3 Jun 2021 17:41:42 +0100 (BST)
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210517191856.enjxmb7v2ai6ecdh@habkost.net>
 <20210517200416.pt4xghxiuzuwknvn@habkost.net>
 <610577a6-0aea-e6af-7f93-0caa9eb75e27@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Alistair Francis
 <alistair.francis@wdc.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, David Gibson
 <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/12] hw: Various Kconfig fixes
Date: Thu, 03 Jun 2021 17:40:31 +0100
In-reply-to: <610577a6-0aea-e6af-7f93-0caa9eb75e27@redhat.com>
Message-ID: <87tume7veh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: AnX/EEb5JvXa


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 5/17/21 10:04 PM, Eduardo Habkost wrote:
>> On Mon, May 17, 2021 at 03:18:56PM -0400, Eduardo Habkost wrote:
>>> CCing Build system architecture maintainer (Daniel).
>>=20
>> Oops, I was misled by the subsection title.  Daniel is
>> responsible only for the build system documentation.
>>=20
>> Do we have any volunteers willing to be listed as reviewers for
>> build system changes in MAINTAINERS?  meson.build has a
>> non-trivial amount of code and no maintainers or reviewers at
>> all.
>
> Hmmm OK I can add an entry. Ideally with Paolo/Thomas but I don't
> think they want to be listed in any new section ;)
>
>>> On Sat, May 15, 2021 at 07:37:04PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
>>>> Various Kconfig fixes when building stand-alone machine binaries.
>>>
>>> Who should merge this once it's ready?
>
> Paolo said in v1 that I can send the pull request myself :))
>
> I will do it in the next 48h~.

Did this happen? I tried to apply the series but it conflicted straight
away.=20

--=20
Alex Benn=C3=A9e
