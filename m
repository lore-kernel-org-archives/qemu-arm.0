Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id i8sm1980974edt.49.2022.02.22.08.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 08:18:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 78CB41FFB7;
	Tue, 22 Feb 2022 16:18:29 +0000 (GMT)
References: <874k4xbqvp.fsf@linaro.org>
User-agent: mu4e 1.7.8; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel <qemu-devel@nongnu.org>, Laszlo Ersek <lersek@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <cleber@redhat.com>, Oleg Vasilev <me@svin.in>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Date: Tue, 22 Feb 2022 16:17:23 +0000
In-reply-to: <874k4xbqvp.fsf@linaro.org>
Message-ID: <878ru2nacq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NCjXVp2eK4sk


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> TL;DR:
>
>   - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug

Laszlo,

Would it be possible to do a less debug enabled version of EDK2 on the
next update to pc-bios/edk2-*?

>
> So my working theory is:
>
>   - booting with EFI leaves a number stale code pages
>   - as the kernel boots it clears these pages triggering lots of
>     slow-path writes
>   - result very slow boot
>
> I think the only real solution is to improve our TB invalidation code
> but perhaps another approach would be to detect a high TB invalidation
> churn and just tb_flush the whole thing and start again?
>
> Any thoughts or ideas?


--=20
Alex Benn=C3=A9e
