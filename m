Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z24sm827912ejn.101.2022.01.21.04.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 04:19:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8AA3D1FFB7;
	Fri, 21 Jan 2022 12:19:52 +0000 (GMT)
References: <20220120151609.433555-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/armv7m: Fix broken VMStateDescription
Date: Fri, 21 Jan 2022 12:19:46 +0000
In-reply-to: <20220120151609.433555-1-peter.maydell@linaro.org>
Message-ID: <87a6fp702f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1uX8CyDua2GU


Peter Maydell <peter.maydell@linaro.org> writes:

> In commit d5093d961585f02 we added a VMStateDescription to
> the TYPE_ARMV7M object, to handle migration of its Clocks.
> However a cut-and-paste error meant we used the wrong struct
> name in the VMSTATE_CLOCK() macro arguments. The result was
> that attempting a 'savevm' might result in an assertion
> failure.
>
> Cc: qemu-stable@nongnu.org
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/803
> Fixes: d5093d961585f02
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
