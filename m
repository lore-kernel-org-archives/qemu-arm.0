Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f141sm7751350wmf.3.2020.04.11.11.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 11:45:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5684A1FF7E;
	Sat, 11 Apr 2020 19:45:35 +0100 (BST)
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <20200326230838.31112-2-richard.henderson@linaro.org>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: rajav@quicinc.com, qemu-arm@nongnu.org, apazos@quicinc.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 01/31] target/arm: Add ID_AA64ZFR0 fields and
 isar_feature_aa64_sve2
In-reply-to: <20200326230838.31112-2-richard.henderson@linaro.org>
Date: Sat, 11 Apr 2020 19:45:35 +0100
Message-ID: <87o8rx97zk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xmyalEn1l8+L


Richard Henderson <richard.henderson@linaro.org> writes:

> Will be used for SVE2 isa subset enablement.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
