Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z5-20020a1c4c05000000b003f60eb72cf5sm1232296wmf.2.2023.05.23.08.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 08:57:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 67CAA1FFBB;
	Tue, 23 May 2023 16:57:03 +0100 (BST)
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-2-richard.henderson@linaro.org>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 01/27] util: Introduce host-specific cpuinfo.h
Date: Tue, 23 May 2023 16:56:58 +0100
In-reply-to: <20230520162634.3991009-2-richard.henderson@linaro.org>
Message-ID: <87v8gj2g8g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: paSxLw60tSvH


Richard Henderson <richard.henderson@linaro.org> writes:

> The entire contents of the header is host-specific, but the
> existence of such a header is not, which could prevent some
> host specific ifdefs at the top of the file for the include.
>
> Add host/include/{arch,generic} to the project arguments.
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
