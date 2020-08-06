Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j4sm6082272wmi.48.2020.08.06.04.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 04:46:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8B71B1FF7E;
	Thu,  6 Aug 2020 12:46:17 +0100 (BST)
References: <20200806104453.30393-1-peter.maydell@linaro.org>
 <20200806104453.30393-3-peter.maydell@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 2/4] target/arm: Make A32/T32 use new fpstatus_ptr() API
In-reply-to: <20200806104453.30393-3-peter.maydell@linaro.org>
Date: Thu, 06 Aug 2020 12:46:17 +0100
Message-ID: <87imdwknee.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mX1wTrILwGcr


Peter Maydell <peter.maydell@linaro.org> writes:

> Make A32/T32 code use the new fpstatus_ptr() API:
>  get_fpstatus_ptr(0) -> fpstatus_ptr(FPST_FPCR)
>  get_fpstatus_ptr(1) -> fpstatus_ptr(FPST_STD)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
<snip>

--=20
Alex Benn=C3=A9e
