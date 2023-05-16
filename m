Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id r7-20020adff107000000b003012030a0c6sm1885718wro.18.2023.05.16.02.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 02:08:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AF6531FFBB;
	Tue, 16 May 2023 10:08:40 +0100 (BST)
References: <20230516072959.49994-1-m.elsayed4420@gmail.com>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mohamed ElSayed <m.elsayed4420@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PULL SUBSYSTEM arm 0/8] TivaC Implementation
Date: Tue, 16 May 2023 10:00:09 +0100
In-reply-to: <20230516072959.49994-1-m.elsayed4420@gmail.com>
Message-ID: <87bkikprs7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 89q9dH9MMxlB


Mohamed ElSayed <m.elsayed4420@gmail.com> writes:

> ***
> This is an implementation for the TivaC board.
> For now it models the system control block, the general purpose I/O, the =
general purpose timers, the watchdog timers and the usart module.
>
> The code is available at https://github.com/moesay/qemu_TivaC.git
> ***

Hi Mohamed,

I'm afraid this pull request won't get processed. Pull requests are sent
by maintainers who are listed in the MAINTAINERS file with signed PRs.
If you want to get support for the TivacC board up-streamed you should
post a series of patches and participate in code review. We have some
general guidance for the process here:

  https://qemu.readthedocs.io/en/latest/devel/submitting-a-patch.html

A couple of general points to get you started:

 - patch 7

   This is obviously wrong as it updates the project README with your
   personal fork information.

 - patch 8

   code format fixes to your own code should be folded into the relevant co=
mmit

 - use of qemu_log

   direct use of qemu_log is discouraged. Generally for devices you
   would be using qemu_log_mask with LOG_UNIMP or LOG_GUEST_ERROR as
   appropriate. Think about if the log point would be better handled at
   a tracepoint (or removed completely if it was a debugging aid during
   development).

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
