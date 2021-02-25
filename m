Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z2sm6951654wml.30.2021.02.25.01.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 01:53:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0C1F21FF7E;
	Thu, 25 Feb 2021 09:53:42 +0000 (GMT)
References: <20210224230532.276878-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2] target/arm: Speed up aarch64 TBL/TBX
Date: Thu, 25 Feb 2021 09:52:51 +0000
In-reply-to: <20210224230532.276878-1-richard.henderson@linaro.org>
Message-ID: <874ki0bhi1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JaJMfljvpG9n


Richard Henderson <richard.henderson@linaro.org> writes:

> Always perform one call instead of two for 16-byte operands.
> Use byte loads/stores directly into the vector register file
> instead of extractions and deposits to a 64-bit local variable.
>
> In order to easily receive pointers into the vector register file,
> convert the helper to the gvec out-of-line signature.  Move the
> helper into vec_helper.c, where it can make use of H1 and clear_tail.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Looked marginally slower on the (1!) run I did but probably in the noise
and the generated code looks nicer.

--=20
Alex Benn=C3=A9e
