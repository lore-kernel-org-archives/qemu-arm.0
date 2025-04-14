Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee5541fsm4537046a12.14.2025.04.14.02.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 02:11:27 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 79A7D5F8A5;
	Mon, 14 Apr 2025 10:11:26 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Phil Dennis-Jordan
 <phil@philjordan.eu>,  Cameron Esfahani <dirty@apple.com>,  Roman
 Bolshakov <rbolshakov@ddn.com>,  Peter Maydell <peter.maydell@linaro.org>,
  Alexander Graf <agraf@csgraf.de>,  Mads Ynddal <m.ynddal@samsung.com>,
  Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH 2/2] hvf: only update sysreg from owning thread
In-Reply-To: <20250402135229.28143-3-mads@ynddal.dk> (Mads Ynddal's message of
	"Wed, 2 Apr 2025 15:52:29 +0200")
References: <20250402135229.28143-1-mads@ynddal.dk>
	<20250402135229.28143-3-mads@ynddal.dk>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 14 Apr 2025 10:11:26 +0100
Message-ID: <8734ebf6pt.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7n53N1xE0Ici

Mads Ynddal <mads@ynddal.dk> writes:

> From: Mads Ynddal <m.ynddal@samsung.com>
>
> hv_vcpu_set_sys_reg should only be called from the owning thread of the
> vCPU, so to avoid crashes, the call to hvf_update_guest_debug is
> dispatched to the individual threads.
>
> Tested-by: Daniel Gomez <da.gomez@samsung.com>
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
