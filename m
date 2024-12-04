Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e3cbe250sm12296071f8f.94.2024.12.04.01.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 01:38:12 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E55DD5F897;
	Wed,  4 Dec 2024 09:38:11 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  mathieu.poirier@linaro.org,
  jean-philippe@linaro.org,  marcin.juszkiewicz@linaro.org,
  gustavo.romero@linaro.org
Subject: Re: [PATCH v4] tests/functional/aarch64: add tests for FEAT_RME
In-Reply-To: <20241203213629.2482806-1-pierrick.bouvier@linaro.org> (Pierrick
	Bouvier's message of "Tue, 3 Dec 2024 13:36:29 -0800")
References: <20241203213629.2482806-1-pierrick.bouvier@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 04 Dec 2024 09:38:11 +0000
Message-ID: <87frn3bxfg.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: HB4n26OAhWuG

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> This boot an OP-TEE environment, and launch a nested guest VM inside it
> using the Realms feature. We do it for virt and sbsa-ref platforms.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
