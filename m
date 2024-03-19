Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n5-20020aa7c685000000b00568d4cf3288sm2846385edq.7.2024.03.19.09.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:18:59 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F329C5F873;
	Tue, 19 Mar 2024 16:18:58 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org,  Radoslaw Biernacki <rad@semihalf.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Cleber Rosa <crosa@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Wainer dos Santos
 Moschetta
 <wainersm@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Brad Smith
 <brad@comstyle.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH v3 0/4] tests/avocado: update sbsa-ref firmware to latest
In-Reply-To: <20240318-sbsa-ref-firmware-update-v3-0-1c33b995a538@linaro.org>
	(Marcin Juszkiewicz's message of "Mon, 18 Mar 2024 15:08:00 +0100")
References: <20240318-sbsa-ref-firmware-update-v3-0-1c33b995a538@linaro.org>
User-Agent: mu4e 1.12.2; emacs 29.2
Date: Tue, 19 Mar 2024 16:18:58 +0000
Message-ID: <87v85i42kt.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5he4icRuASL6

Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

> Updating sbsa-ref firmware for QEMU CI was manual task. Now it is
> replaced by CI job run on CodeLinaro Gitlab instance.
>
> This patchset updates to current state:
>
> - Trusted Firmware v2.10.2 (latest LTS)
> - Tianocore EDK2 stable202402 (latest release)
>
> And Tianocore EDK2-platforms commit 085c2fb (edk2-platforms does not
> have releases).
>
> Firmware images were built using Debian 'bookworm' cross gcc 12.2.0
> compiler.
>
> And while I am in that file I dropped use of 'virtio-rng-pci' device as
> sbsa-ref is supposed to emulate physical hardware.
>
> Added 'max' tests with 'pauth=3Doff' and 'pauth-impdef=3Don' variants.

Queued to for-9.0/misc-fixes, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
