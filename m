Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece28808fsm1729099a12.75.2025.02.13.13.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:09:14 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D273F5F7DE;
	Thu, 13 Feb 2025 21:09:12 +0000 (GMT)
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
Subject: Re: [PATCH v2 1/3] docs/cpu-features: Consistently use vCPU instead
 of VCPU
In-Reply-To: <20250213135032.2987289-2-kchamart@redhat.com> (Kashyap
	Chamarthy's message of "Thu, 13 Feb 2025 14:50:29 +0100")
References: <20250213135032.2987289-1-kchamart@redhat.com>
	<20250213135032.2987289-2-kchamart@redhat.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 21:09:12 +0000
Message-ID: <87v7tdpn5z.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gS8k9ccn5zxV

Kashyap Chamarthy <kchamart@redhat.com> writes:

> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>

Should we add vCPU to glossary.rst?

Anyway: Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
