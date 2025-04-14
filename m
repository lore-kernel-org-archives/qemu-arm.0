Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2a13sm168915825e9.10.2025.04.14.02.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 02:20:23 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D79135F8A5;
	Mon, 14 Apr 2025 10:20:22 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Phil Dennis-Jordan
 <phil@philjordan.eu>,  Cameron Esfahani <dirty@apple.com>,  Roman
 Bolshakov <rbolshakov@ddn.com>,  Peter Maydell <peter.maydell@linaro.org>,
  Alexander Graf <agraf@csgraf.de>,  Mads Ynddal <m.ynddal@samsung.com>,
  Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH 1/2] hvf: avoid repeatedly setting trap debug for each cpu
In-Reply-To: <20250402135229.28143-2-mads@ynddal.dk> (Mads Ynddal's message of
	"Wed, 2 Apr 2025 15:52:28 +0200")
References: <20250402135229.28143-1-mads@ynddal.dk>
	<20250402135229.28143-2-mads@ynddal.dk>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 14 Apr 2025 10:20:22 +0100
Message-ID: <87wmbndrqh.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lmy+aJOWiTvr

Mads Ynddal <mads@ynddal.dk> writes:

> From: Mads Ynddal <m.ynddal@samsung.com>
>
> hvf_arch_set_traps is already called from a context of a specific
> CPUState, so we don't need to do a nested CPU_FOREACH.
>
> It also results in an error from hv_vcpu_set_sys_reg, as it may only be
> called from the thread owning the vCPU.
>
> Tested-by: Daniel Gomez <da.gomez@samsung.com>
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>

Looks reasonable to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
