Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532581cesm199366366b.45.2025.02.13.13.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:17:44 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3BA375F7DE;
	Thu, 13 Feb 2025 21:17:43 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: qemu-devel@nongnu.org,  maz@kernel.org,  Joel Stanley <joel@jms.id.au>,
  Ninad Palsule <ninad@linux.ibm.com>,  qemu-arm@nongnu.org,  Andrew
 Jeffery <andrew@codeconstruct.com.au>,  Peter Maydell
 <peter.maydell@linaro.org>,  Alexandre Iooss <erdnaxe@crans.org>,  Jamin
 Lin <jamin_lin@aspeedtech.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>,  Eric Auger
 <eric.auger@redhat.com>,  Yi Liu <yi.l.liu@intel.com>,  Hao Wu
 <wuhaotsh@google.com>,  Tyrone Ting <kfting@nuvoton.com>,
  sebott@redhat.com,  Steven Lee <steven_lee@aspeedtech.com>,  Zhenzhong
 Duan <zhenzhong.duan@intel.com>,  Troy Lee <leetroy@gmail.com>,  Alistair
 Francis <alistair@alistair23.me>
Subject: Re: [PATCH v2 2/3] docs/cpu-features: Update "PAuth" (Pointer
 Authentication) details
In-Reply-To: <20250213135032.2987289-3-kchamart@redhat.com> (Kashyap
	Chamarthy's message of "Thu, 13 Feb 2025 14:50:30 +0100")
References: <20250213135032.2987289-1-kchamart@redhat.com>
	<20250213135032.2987289-3-kchamart@redhat.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 21:17:43 +0000
Message-ID: <87pljlpmrs.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: XvAz3AhGLJEz

Kashyap Chamarthy <kchamart@redhat.com> writes:

> PAuth (Pointer Authentication), a security feature in software, is
> relevant for both KVM and QEMU.  Relect this fact into the docs:
>
>   - For KVM, `pauth` is a binary, "on" vs "off" option.  The host CPU
>     will choose the cryptographic algorithm.
>
>   - For TCG, however, along with `pauth`, a couple of properties can be
>     controlled -- they're are related to cryptographic algorithm choice.
>
> Thanks to Peter Maydell and Marc Zyngier for explaining more about PAuth
> on IRC (#qemu, OFTC).
>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
