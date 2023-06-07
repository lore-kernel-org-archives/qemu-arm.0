Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d470e000000b002fed865c55esm15435828wrq.56.2023.06.07.06.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 06:36:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C19531FFBB;
	Wed,  7 Jun 2023 14:36:05 +0100 (BST)
References: <20230530152240.79160-1-marcin.juszkiewicz@linaro.org>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 1/1] tests/avocado: update firmware to enable sbsa-ref/max
Date: Wed, 07 Jun 2023 14:36:00 +0100
In-reply-to: <20230530152240.79160-1-marcin.juszkiewicz@linaro.org>
Message-ID: <873533gzsq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: XdZn5BVTqiR4


Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

> Update prebuilt firmware images to have TF-A with FEAT_FGT support
> enabled. This allowed us to enable test for "max" cpu in sbsa-ref
> machine.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Queued to testing/next, thanks.
--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
