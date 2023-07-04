Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w18-20020a5d6092000000b003143be36d99sm3429053wrt.58.2023.07.04.07.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 07:59:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F41131FFBB;
	Tue,  4 Jul 2023 15:59:00 +0100 (BST)
References: <20230704130647.2842917-1-peter.maydell@linaro.org>
 <20230704130647.2842917-3-peter.maydell@linaro.org>
User-agent: mu4e 1.11.8; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 2/2] target/arm: Define neoverse-v1
Date: Tue, 04 Jul 2023 15:58:54 +0100
In-reply-to: <20230704130647.2842917-3-peter.maydell@linaro.org>
Message-ID: <87sfa3g1u3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: z1yfjpmgqaP7


Peter Maydell <peter.maydell@linaro.org> writes:

> Now that we have implemented support for FEAT_LSE2, we can define
> a CPU model for the Neoverse-V1, and enable it for the virt and
> sbsa-ref boards.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
