Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c69041f6sm20183566b.103.2024.07.04.12.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 12:55:12 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8FB315F839;
	Thu,  4 Jul 2024 20:55:11 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  akihiko.odaki@daynix.com,  qemu-arm@nongnu.org
Subject: Re: [PATCH v4 00/14] test/tcg: Clang build fixes for arm/aarch64
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org> (Richard
	Henderson's message of "Sun, 30 Jun 2024 12:00:36 -0700")
References: <20240630190050.160642-1-richard.henderson@linaro.org>
Date: Thu, 04 Jul 2024 20:55:11 +0100
Message-ID: <87sewplyow.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NS5g8CI5/gkh

Richard Henderson <richard.henderson@linaro.org> writes:

> Supercedes: 20240629-tcg-v3-0-fa57918bdf09@daynix.com
> ("[PATCH v3 0/7] tests/tcg/aarch64: Fix inline assemblies for clang")
>
> On top of Akihiko's patches for aarch64, additional changes are
> required for arm, both as a host and as a guest.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
