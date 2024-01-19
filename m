Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id g21-20020a05600c311500b0040d30af488asm32646679wmo.40.2024.01.19.03.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:24:40 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D04B85F8C8;
	Fri, 19 Jan 2024 11:24:39 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Jan Kiszka
 <jan.kiszka@web.de>
Subject: Re: [PATCH] hw/arm/musicpal: Convert to qemu_add_kbd_event_handler()
In-Reply-To: <20231103182750.855577-1-peter.maydell@linaro.org> (Peter
	Maydell's message of "Fri, 3 Nov 2023 18:27:50 +0000")
References: <20231103182750.855577-1-peter.maydell@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Fri, 19 Jan 2024 11:24:39 +0000
Message-ID: <871qadh8g8.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +v2EsC/8aogJ

Peter Maydell <peter.maydell@linaro.org> writes:

> Convert the musicpal key input device to use
> qemu_add_kbd_event_handler().  This lets us simplify it because we no
> longer need to track whether we're in the middle of a PS/2 multibyte
> key sequence.
>
> In the conversion we move the keyboard handler registration from init
> to realize, because devices shouldn't disturb the state of the
> simulation by doing things like registering input handlers until
> they're realized, so that device objects can be introspected
> safely.
>
> The behaviour where key-repeat is permitted for the arrow-keys only
> is intentional (added in commit 7c6ce4baedfcd0c), so we retain it,
> and add a comment to that effect.

Well the key input all works as intended and looks good to me. I'm a
little disappointed I couldn't get audio working on the musicpal machine
but that is not a problem for this patch.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
