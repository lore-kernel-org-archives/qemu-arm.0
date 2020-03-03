Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t187sm3629324wmt.25.2020.03.03.03.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 03:11:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3EA201FF87;
	Tue,  3 Mar 2020 11:11:55 +0000 (GMT)
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-5-nieklinnenbank@gmail.com>
User-agent: mu4e 1.3.9; emacs 27.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, b.galvani@gmail.com, jasowang@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v6 04/18] hw/arm/allwinner-h3: add USB host controller
In-reply-to: <20200301215029.15196-5-nieklinnenbank@gmail.com>
Date: Tue, 03 Mar 2020 11:11:55 +0000
Message-ID: <87mu8x7kw4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RVFsR3ejTARz


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> The Allwinner H3 System on Chip contains multiple USB 2.0 bus
> connections which provide software access using the Enhanced
> Host Controller Interface (EHCI) and Open Host Controller
> Interface (OHCI) interfaces. This commit adds support for
> both interfaces in the Allwinner H3 System on Chip.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
