Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w99sm20885974wrb.5.2017.01.24.09.00.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 09:00:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id B1CFE3E0133;
	Tue, 24 Jan 2017 17:00:38 +0000 (GMT)
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 0/6] ARMv7M: some simple bugfixes and cleanups
In-reply-to: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 17:00:38 +0000
Message-ID: <87o9yw9yvd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: ZzjSyzVzFvRv


Peter Maydell <peter.maydell@linaro.org> writes:

> This set of six patches is some simple bug fixes which
> I've pulled out of Michael Davidsaver's old NVIC rewrite
> patchset, as an initial start on getting it upstream.
> None of them are particularly exciting, but they're
> self-contained so they might as well go through code
> review and get into master ahead of the main rewrite.

I've completed my pass through - it all looks pretty good to me
(squashed tab stops on the commit messages not-withstanding ;-)

--
Alex Bennée
