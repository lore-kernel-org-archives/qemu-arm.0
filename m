Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b647sm1683632a12.18.2024.10.21.01.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 01:28:34 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9A3115F8B9;
	Mon, 21 Oct 2024 09:28:33 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH] tests/tcg/aarch64: Use raw strings for regexes in
 test-mte.py
In-Reply-To: <20241015140806.385449-1-gustavo.romero@linaro.org> (Gustavo
	Romero's message of "Tue, 15 Oct 2024 14:08:06 +0000")
References: <20241015140806.385449-1-gustavo.romero@linaro.org>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Mon, 21 Oct 2024 09:28:33 +0100
Message-ID: <87a5exq2q6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /A4qu4ryvv4u

Gustavo Romero <gustavo.romero@linaro.org> writes:

> Use Python's raw string notation instead of string literals for regex so
> it's not necessary to double backslashes when regex special forms are
> used. Raw notation is preferred for regex and easier to read.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>

Queued to gdbstub/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
