Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c26d200b003da28dfdedcsm1860843wmv.5.2023.01.26.06.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:12:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 14A1F1FFB7;
	Thu, 26 Jan 2023 14:12:31 +0000 (GMT)
References: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>, Peter Maydell
 <peter.maydell@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] sbsa-ref: remove cortex-a76 from list of supported cpus
Date: Thu, 26 Jan 2023 14:12:26 +0000
In-reply-to: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
Message-ID: <87lelppepc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nIZJL1SlsciK


Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

> Cortex-A76 supports 40bits of address space. sbsa-ref's memory
> starts above this limit.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
