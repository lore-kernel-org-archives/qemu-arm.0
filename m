Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q6sm18548438wja.19.2016.01.25.02.44.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 02:44:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 4D57B3E0552;
	Mon, 25 Jan 2016 10:44:57 +0000 (GMT)
References: <1453456243-19879-1-git-send-email-edgar.iglesias@gmail.com> <1453456243-19879-4-git-send-email-edgar.iglesias@gmail.com>
User-agent: mu4e 0.9.17; emacs 25.0.50.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, edgar.iglesias@xilinx.com
Subject: Re: [PATCH v3 3/3] target-arm: Implement the S2 MMU inputsize > pamax check
In-reply-to: <1453456243-19879-4-git-send-email-edgar.iglesias@gmail.com>
Date: Mon, 25 Jan 2016 10:44:57 +0000
Message-ID: <87y4bendjq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Jo+7DSIUR4JP


Edgar E. Iglesias <edgar.iglesias@gmail.com> writes:

> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Implement the inputsize > pamax check for Stage 2 translations.
> We have multiple choices for how to respond to errors and
> choose to fault.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
<snip>

Too fast ;-)

I'm awaiting v4.

--
Alex Bennée
