Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x6sm3870813wmj.32.2021.03.05.02.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 02:13:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 63D1E1FF7E;
	Fri,  5 Mar 2021 10:13:44 +0000 (GMT)
References: <20210226131356.3964782-1-f4bug@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Chris Wulff <crwulff@gmail.com>,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Marek Vasut <marex@denx.de>, Palmer
 Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 0/2] semihosting: Move it out of hw/
Date: Fri, 05 Mar 2021 10:13:37 +0000
In-reply-to: <20210226131356.3964782-1-f4bug@amsat.org>
Message-ID: <87k0qlgb6v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: sF0Kkwsma+TG


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> In order to reduce CONFIG_USER_ONLY uses in hw/, move
> semihosting out of it, being a generic feature.

Queued to semihosting/next, thanks.

--=20
Alex Benn=C3=A9e
