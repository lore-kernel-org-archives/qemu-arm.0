Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s19-20020a05600c45d300b0040648217f4fsm9901678wmo.39.2023.10.17.06.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:13:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2916C1FFBB;
	Tue, 17 Oct 2023 14:13:55 +0100 (BST)
References: <20230915185453.1871167-1-peter.maydell@linaro.org>
 <20230915185453.1871167-2-peter.maydell@linaro.org>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 1/2] target/arm: Correct minor errors in Cortex-A710
 definition
Date: Tue, 17 Oct 2023 14:13:51 +0100
In-reply-to: <20230915185453.1871167-2-peter.maydell@linaro.org>
Message-ID: <87il75bdd8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: W4fu8itM0bcA


Peter Maydell <peter.maydell@linaro.org> writes:

> Correct a couple of minor errors in the Cortex-A710 definition:
>  * ID_AA64DFR0_EL1.DebugVer is 9 (indicating Armv8.4 debug architecture)
>  * ID_AA64ISAR1_EL1.APA is 5 (indicating more PAuth support)
>  * there is an IMPDEF CPUCFR_EL1, like that on the Neoverse-N1
>
> Fixes: e3d45c0a89576 ("target/arm: Implement cortex-a710")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
