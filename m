Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a13-20020adfeecd000000b0033ec94c6277sm646545wrp.115.2024.03.14.05.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 05:27:54 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7AC575F713;
	Thu, 14 Mar 2024 12:27:53 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
  qemu-devel@nongnu.org,  Radoslaw Biernacki <rad@semihalf.com>,  Leif
 Lindholm <quic_llindhol@quicinc.com>,  Cleber Rosa <crosa@redhat.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Wainer dos
 Santos Moschetta
 <wainersm@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Brad Smith
 <brad@comstyle.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH v2 2/4] tests/avocado: drop virtio-rng from sbsa-ref tests
In-Reply-To: <CAFEAcA8GhAMtvsRE71fybuY90hXBavbXwCrb=-fWGqg8JebTEQ@mail.gmail.com>
	(Peter Maydell's message of "Thu, 14 Mar 2024 12:14:03 +0000")
References: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
	<20240314-sbsa-ref-firmware-update-v2-2-b557c56559cd@linaro.org>
	<87h6h9gghs.fsf@draig.linaro.org>
	<CAFEAcA8GhAMtvsRE71fybuY90hXBavbXwCrb=-fWGqg8JebTEQ@mail.gmail.com>
User-Agent: mu4e 1.12.1; emacs 29.2
Date: Thu, 14 Mar 2024 12:27:53 +0000
Message-ID: <875xxpgfqu.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5T5CUl2KSUHJ

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 14 Mar 2024 at 12:11, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:
>>
>> > sbsa-ref is supposed to emulate real hardware so virtio-rng-pci
>> > does not fit here
>>
>> What is real anyway ;-)
>>
>> VirtIO devices exist in real life and I would argue for PCI the device
>> appears very much like a normal PCI device. I could see the argument for
>> avoiding virtio-mmio devices which are a lot more VM-only in flavour.
>
> But our platform for testing virtio-rng-pci should be the 'virt'
> board (and our avocado test for virt does indeed have that device).
> What exactly are we adding by testing it also in sbsa-ref,
> where the typical user will *not* be using it (if they wanted
> a virtio setup they would be using 'virt')?

I assume just ensuring the board has enough entropy to boot cleanly. If
it doesn't need it then it doesn't matter I guess.

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
