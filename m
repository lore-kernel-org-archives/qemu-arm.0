Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x69sm18436393wma.15.2017.03.15.01.05.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Mar 2017 01:05:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 7E44F3E024D;
	Wed, 15 Mar 2017 08:05:56 +0000 (GMT)
References: <20170313180432.7067-1-krzk@kernel.org> <87mvcnpzll.fsf@linaro.org> <20170314173513.wruppu4js7ikaxu2@kozik-lap> <CAHDbmO1apk81csbC7BJK2JFK23fvVBLb-wA5z7_y29T=ueFPyg@mail.gmail.com> <20170314185632.kzbccv2y7ah3nhqd@kozik-lap>
User-agent: mu4e 0.9.19; emacs 25.2.9
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v2 0/5] hw: arm: exynos: Bring up secondary CPU + CPUIDLE issue
In-reply-to: <20170314185632.kzbccv2y7ah3nhqd@kozik-lap>
Date: Wed, 15 Mar 2017 08:05:56 +0000
Message-ID: <87k27rotgb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: E8hcDrlD+rhT


Krzysztof Kozlowski <krzk@kernel.org> writes:

> On Tue, Mar 14, 2017 at 06:24:33PM +0000, Alex Bennée wrote:
>> That means you're on a pre-mttcg tree so that's not the reason.
>
> I managed to build it on current master (v2.8.0-2182-g5e2fb7c598c6). It
> behaves the same (with "-accel tcg,thread=single": cannot reach
> switching to init).

Interesting. Can you post your exact qemu command line and I'll have a
go at reproducing.

In the meantime you can always --enable-debug-tcg your build and see if
any of the asserts fire.

>
> Best regards,
> Krzysztof


--
Alex Bennée
