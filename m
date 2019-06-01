Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 197sm8797252wma.36.2019.06.01.02.34.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 01 Jun 2019 02:34:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5877D1FF87;
	Sat,  1 Jun 2019 10:34:57 +0100 (BST)
References: <20190531154735.20809-1-philmd@redhat.com> <CAFEAcA9TJGq-8fMv2amQEEGz9QKCNWYwJxCXrjqSh=Yc87yTww@mail.gmail.com> <947e851b-4b95-3126-2eaf-d5d16f8b831b@redhat.com> <431872249.25606899.1559321648368.JavaMail.zimbra@redhat.com> <CAFEAcA_KKH62rK2pbR8dWXOCJWe1X8wif5whc+y0_e-hTpmoRQ@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Miroslav Rezanina <mrezanin@redhat.com>, Philippe =?utf-8?Q?Mathieu-Da?=
 =?utf-8?Q?ud=C3=A9?= <philmd@redhat.com>, QEMU Developers
 <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Aleksandar Rikalo
 <arikalo@wavecomp.com>, qemu-arm <qemu-arm@nongnu.org>, Aleksandar
 Markovic <amarkovic@wavecomp.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Samuel Ortiz <sameo@linux.intel.com>, Rob Bradford
 <robert.bradford@intel.com>
Subject: Re: [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabled
In-reply-to: <CAFEAcA_KKH62rK2pbR8dWXOCJWe1X8wif5whc+y0_e-hTpmoRQ@mail.gmail.com>
Date: Sat, 01 Jun 2019 10:34:57 +0100
Message-ID: <87lfyl8x8e.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lnhih0dmJzJX


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 31 May 2019 at 17:54, Miroslav Rezanina <mrezanin@redhat.com> wro=
te:
>> What about CONFIG_ARM_VIRT - can we use it to introduce dependency on
>> CONFIG_SEMIHOSTING or is there valid scenario of qemu build with CONFIG_=
ARM_VIRT
>> enabled and CONFIG_SEMIHOSTING disabled?
>
> Semihosting is a feature that works on all Arm CPUs
> regardless of which machine model you're using (or whether
> you're using softmmu or linux-user), so I think
> the machine's Kconfig fragment is the wrong place to try
> to pull it in.

Although amusingly it doesn't work in kvm but perhaps it should?

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
