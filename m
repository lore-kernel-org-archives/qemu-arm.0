Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bk7-20020a0560001d8700b0033addbf2d2csm9821485wrb.9.2024.01.30.02.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:03:09 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 47B485F9D3;
	Tue, 30 Jan 2024 10:03:09 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-block@nongnu.org,
  peter.maydell@linaro.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v3 3/6] hw/arm/xen_arm.c: convert DPRINTF to trace
 events and error/warn reports
In-Reply-To: <fe5e3bd54231abe933f95a24e0e88208cd8cfd8f.1706544115.git.manos.pitsidianakis@linaro.org>
	(Manos Pitsidianakis's message of "Mon, 29 Jan 2024 18:09:38 +0200")
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
	<fe5e3bd54231abe933f95a24e0e88208cd8cfd8f.1706544115.git.manos.pitsidianakis@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Tue, 30 Jan 2024 10:03:09 +0000
Message-ID: <87h6ivqgte.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CXeJXtkeQMMV

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> Tracing DPRINTFs to stderr might not be desired. A developer that relies
> on trace events should be able to opt-in to each trace event and rely on
> QEMU's log redirection, instead of stderr by default.
>
> This commit converts DPRINTFs in this file that are used for tracing
> into trace events. Errors or warnings are converted to error_report and
> warn_report calls.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
