Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ba1-20020a0560001c0100b0033ae593e830sm7766308wrb.23.2024.01.30.02.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:05:51 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3E0BF5F9D3;
	Tue, 30 Jan 2024 10:05:51 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-block@nongnu.org,
  peter.maydell@linaro.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Stefano Stabellini <sstabellini@kernel.org>,  Anthony Perard
 <anthony.perard@citrix.com>,  Paul Durrant <paul@xen.org>,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/6] hw/xen/xen-mapcache.c: convert DPRINTF to
 tracepoints
In-Reply-To: <2fbe1fbc59078e384761c932e97cfa4276a53d75.1706544115.git.manos.pitsidianakis@linaro.org>
	(Manos Pitsidianakis's message of "Mon, 29 Jan 2024 18:09:40 +0200")
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
	<2fbe1fbc59078e384761c932e97cfa4276a53d75.1706544115.git.manos.pitsidianakis@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Tue, 30 Jan 2024 10:05:51 +0000
Message-ID: <87bk93qgow.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: j6RlPASTjlRD

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> Tracing DPRINTFs to stderr might not be desired. A developer that relies
> on tracepoints should be able to opt-in to each tracepoint and rely on
> QEMU's log redirection, instead of stderr by default.
>
> This commit converts DPRINTFs in this file that are used for tracing
> into tracepoints.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
