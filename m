Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n23-20020a7bc5d7000000b003ee74c25f12sm19634231wmk.35.2023.05.09.04.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:39:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 288D41FFBB;
	Tue,  9 May 2023 12:39:30 +0100 (BST)
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
 <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
 <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
 <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
 <CAFEAcA9h2JKPeMinDFqsJ_5wN1rtAfr6YSSbfyf6JK9ohdxXmA@mail.gmail.com>
 <70da6b28-d731-7e3b-b5a6-7d9983389d57@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier
 <lvivier@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, Helge
 Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Stefan
 Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>, John
 Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Beraldo Leal
 <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, =?utf-8?Q?Marc-And?=
 =?utf-8?Q?r=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Date: Tue, 09 May 2023 12:37:15 +0100
In-reply-to: <70da6b28-d731-7e3b-b5a6-7d9983389d57@redhat.com>
Message-ID: <878rdxbuoe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Pmt/mK7vZJO6


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/9/23 12:00, Peter Maydell wrote:
>> On Tue, 9 May 2023 at 10:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>
>>> On 5/9/23 11:27, Peter Maydell wrote:
>>>> On Mon, 8 May 2023 at 23:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>>> --without-default-devices is not about choosing to not build
>>>>> some devices; it is about making non-selected devices opt-in
>>>>> rather than opt-out.
>>>>
>>>> Hmm, so it's basically "the person doing the configuration needs
>>>> to know what they're doing, the Kconfig system will give them
>>>> no hints about what devices might or might not be needed to
>>>> make machine type M functional" ?
>>>
>>> It depends on what you mean by functional.  I would say you do get what
>>> is needed to have a functional machine, but not what is needed to have a
>>> useful machine.
>> If you need to pass '-nodefaults' to get the thing to start up at
>> all, that seems to be stretching the definition of "functional"
>> to me.
>
> Then, an accurate description that uses "functional" in that sense
> could be as follows:
>
> The Kconfig system will include any devices and subsystems that are
> mandatory for a given machine type, and will flag any configuration
> conflicts. However, the person doing the configuration still needs to
> know which devices are needed (on top of the mandatory ones) to obtain
> a functional guest, and Kconfig will not provide any hints in this
> respect.

So I thought that was the model I was following in adding devices but it
seems I don't understand the no-defaults behaviour. What is the
difference between a device that is added in the machine.c that makes it
required or expendable with -nodefaults?

>
> Paolo


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
