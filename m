Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y12sm11099737wrn.73.2021.12.13.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 05:42:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2216B1FF96;
	Mon, 13 Dec 2021 13:42:59 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-19-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 18/26] hw/intc/arm_gicv3_its: Fix handling of
 process_its_cmd() return value
Date: Mon, 13 Dec 2021 13:41:17 +0000
In-reply-to: <20211211191135.1764649-19-peter.maydell@linaro.org>
Message-ID: <87zgp4k4d8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5AwgE1QeLO/8


Peter Maydell <peter.maydell@linaro.org> writes:

> process_its_cmd() returns a bool, like all the other process_ functions.
> However we were putting its return value into 'res', not 'result',
> which meant we would ignore it when deciding whether to continue
> or stall the command queue. Fix the typo.

Arguably having to generic result types is confusing. Naming things is
hard but maybe it should be a clear:

      MemTxResult memtx_res =3D MEMTX_OK;
      ItsCmdResult its_res =3D CMD_CONTINUE;

?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
