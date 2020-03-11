Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f4sm15175548wrt.24.2020.03.11.07.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 07:04:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 75E091FF7E;
	Wed, 11 Mar 2020 14:04:06 +0000 (GMT)
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
User-agent: mu4e 1.3.9; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, b.galvani@gmail.com, jasowang@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v7 00/18] Add Allwinner H3 SoC and Orange Pi PC Machine
In-reply-to: <20200310213203.18730-1-nieklinnenbank@gmail.com>
Date: Wed, 11 Mar 2020 14:04:06 +0000
Message-ID: <87o8t3f0o9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lX6Y9xa+U5dW


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> Dear QEMU developers,
>
> Hereby I would like to contribute the following set of patches to QEMU
> which add support for the Allwinner H3 System on Chip and the
> Orange Pi PC machine. The following features and devices are supported:
<snip>

I've finished my pass through and I think everything has a review tag
now. As there are some small fixes needed you can you do a v8 respin
which Peter can apply to target-arm/next.

--=20
Alex Benn=C3=A9e
