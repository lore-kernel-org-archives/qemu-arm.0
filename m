Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id je16-20020a05600c1f9000b0040ec66021a7sm12753644wmb.1.2024.01.30.02.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:07:39 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7BEC85F9D3;
	Tue, 30 Jan 2024 10:07:39 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-block@nongnu.org,
  peter.maydell@linaro.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Stefano Stabellini <sstabellini@kernel.org>,  Anthony Perard
 <anthony.perard@citrix.com>,  Paul Durrant <paul@xen.org>,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 6/6] hw/xen: convert stderr prints to error/warn reports
In-Reply-To: <42a8953553cf68e8bacada966f93af4fbce45919.1706544115.git.manos.pitsidianakis@linaro.org>
	(Manos Pitsidianakis's message of "Mon, 29 Jan 2024 18:09:42 +0200")
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
	<42a8953553cf68e8bacada966f93af4fbce45919.1706544115.git.manos.pitsidianakis@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Tue, 30 Jan 2024 10:07:39 +0000
Message-ID: <87zfwnp21g.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1TuJF2v5rg7x

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> According to the QEMU Coding Style document:
>
>> Do not use printf(), fprintf() or monitor_printf(). Instead, use
>> error_report() or error_vreport() from error-report.h. This ensures the
>> error is reported in the right place (current monitor or stderr), and in
>> a uniform format.
>> Use error_printf() & friends to print additional information.
>
> This commit changes fprintfs that report warnings and errors to the
> appropriate report functions.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
