Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j23sm8122562wmo.33.2021.04.07.06.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:55:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A216A1FF7E;
	Wed,  7 Apr 2021 14:55:57 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-2-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Stephen Long <steplong@quicinc.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v4 01/12] accel/tcg: Preserve PAGE_ANON when changing
 page permissions
Date: Wed, 07 Apr 2021 14:55:20 +0100
In-reply-to: <20210406174031.64299-2-richard.henderson@linaro.org>
Message-ID: <87tuoiurki.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: uYnDu8zD1eRp


Richard Henderson <richard.henderson@linaro.org> writes:

> Using mprotect() to change PROT_* does not change the MAP_ANON
> previously set with mmap().  Our linux-user version of MTE only
> works with MAP_ANON pages, so losing PAGE_ANON caused MTE to
> stop working.
>
> Reported-by: Stephen Long <steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Yay test case ;-) It certainly fails before and works after.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
