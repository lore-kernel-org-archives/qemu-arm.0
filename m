Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a5sm3552190wmb.37.2020.01.23.10.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 10:26:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 66A121FF87;
	Thu, 23 Jan 2020 18:26:53 +0000 (GMT)
References: <20191217173252.4672-1-philmd@redhat.com>
 <6a8266c6-7c6d-3139-249f-2dd46c98e02f@redhat.com>
 <87blquza17.fsf@linaro.org>
 <47e28e48-362a-39ea-ee58-9bbe7d222394@redhat.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, Fam Zheng
 <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>, Hannes
 Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Jason Wang
 <jasowang@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Peter
 Chubb <peter.chubb@nicta.com.au>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Kevin
 Wolf <kwolf@redhat.com>, =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?=
 <dirty.ice.hu@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
In-reply-to: <47e28e48-362a-39ea-ee58-9bbe7d222394@redhat.com>
Date: Thu, 23 Jan 2020 18:26:53 +0000
Message-ID: <878slyyqoi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gH43U2L7spab


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 1/23/20 12:28 PM, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> On 12/17/19 6:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> Fix some trivial warnings when building with -O3.
>>>> Philippe Mathieu-Daud=C3=A9 (6):
>>>>     audio/audio: Add missing fall through comment
>>>>     hw/display/tcx: Add missing fall through comments
>>>>     hw/net/imx_fec: Rewrite fall through comments
>>>>     hw/timer/aspeed_timer: Add a fall through comment
>>>>     hw/scsi/megasas: Silent GCC9 duplicated-cond warning
>>>>     qemu-io-cmds: Silent GCC9 format-overflow warning
>>>
>>> Sorry, this series failed because I used this tag in the first patch:
>>>
>>> Cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>
>>>
>>> Then git-send-email was happy with --dry-run, but then failed:
>>> (body) Adding cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmai=
l.com> from line
>>> 'Cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>'
>>> 5.1.1 <K  v  g  >: Recipient address rejected: User unknown in local
>>> recipient table
>>>
>>> Note to self, enclose utf-8 names, as:
>>> Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com>
>> I never have to with my tags:
>> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Is it possible to be more even utf-8? Sounds like a bug in the git
>> tools
>> to me.
>
> The problem is the comma.
> What do you mean by "more UTF-8"?

It was a joke - I think you are either utf-8 clean or not. Now the
question is should the tools have slurped the coma as part of the name?
Is it a localisation issue?

--=20
Alex Benn=C3=A9e
