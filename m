Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n5-20020adf8b05000000b00207a4fd0185sm13372759wra.7.2022.04.27.03.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 03:37:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E8A4B1FFB7;
	Wed, 27 Apr 2022 11:37:53 +0100 (BST)
References: <20220427051926.295223-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Chris Howard <cvz185@web.de>
Subject: Re: [PATCH] target/arm: Use field names for accessing DBGWCRn
Date: Wed, 27 Apr 2022 11:37:49 +0100
In-reply-to: <20220427051926.295223-1-richard.henderson@linaro.org>
Message-ID: <87wnfa4xry.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: stkjqpNN2vM/


Richard Henderson <richard.henderson@linaro.org> writes:

> While defining these names, use the correct field width of 5 not 4 for
> DBGWCR.MASK.  This typo prevented setting a watchpoint larger than 32k.
>
> Reported-by: Chris Howard <cvz185@web.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
