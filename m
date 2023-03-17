Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p15-20020a7bcdef000000b003dc4480df80sm8328321wmj.34.2023.03.17.10.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 10:23:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8E1571FFB7;
	Fri, 17 Mar 2023 17:23:22 +0000 (GMT)
References: <20230317165057.1522743-1-peter.maydell@linaro.org>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Luis Machado <luis.machado@arm.com>
Subject: Re: [PATCH for-8.0] target/arm: Don't advertise aarch64-pauth.xml
 to gdb
Date: Fri, 17 Mar 2023 17:23:16 +0000
In-reply-to: <20230317165057.1522743-1-peter.maydell@linaro.org>
Message-ID: <87ilez70mt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 64AVPmo+kp3d


Peter Maydell <peter.maydell@linaro.org> writes:

> Unfortunately a bug in older versions of gdb means that they will
> crash if QEMU sends them the aarch64-pauth.xml.  This bug is fixed in
> gdb commit 1ba3a3222039eb25, and there are plans to backport that to
> affected gdb release branches, but since the bug affects gdb 9
> through 12 it is very widely deployed (for instance by distros).
>
> It is not currently clear what the best way to deal with this is; it
> has been proposed to define a new XML feature name that old gdb will
> ignore but newer gdb can handle.  Since QEMU's 8.0 release is
> imminent and at least one of our CI runners is now falling over this,
> disable the pauth XML for the moment.  We can follow up with a more
> considered fix either in time for 8.0 or else for the 8.1 release.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Queued to pr/170323-for-8.0-1, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
