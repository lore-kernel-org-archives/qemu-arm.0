Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a11-20020adff7cb000000b00326f0ca3566sm21067816wrq.50.2023.10.13.10.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 10:09:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 840FB1FFBB;
	Fri, 13 Oct 2023 18:09:07 +0100 (BST)
References: <20231013141131.1531-1-philmd@linaro.org>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Evgeny
 Iakovlev <eiakovlev@linux.microsoft.com>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 0/10] hw/char/pl011: Implement TX (async) FIFO to
 avoid blocking the main loop
Date: Fri, 13 Oct 2023 18:08:34 +0100
In-reply-to: <20231013141131.1531-1-philmd@linaro.org>
Message-ID: <87a5smlaa4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Nk0d7wHYBYi4


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi,
>
> This series add support for (async) FIFO on the transmit path
> of the PL011 UART.

Hmm neither I or patchew received 10/10:

  https://patchew.org/QEMU/20231013141131.1531-1-philmd@linaro.org/

?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
