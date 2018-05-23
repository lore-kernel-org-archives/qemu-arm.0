Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h196-v6sm1935931wme.1.2018.05.23.04.01.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 May 2018 04:01:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 022373E006A;
	Wed, 23 May 2018 12:01:29 +0100 (BST)
References: <20180521140402.23318-1-peter.maydell@linaro.org> <20180521140402.23318-23-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 22/27] vmstate.h: Provide VMSTATE_BOOL_SUB_ARRAY
In-reply-to: <20180521140402.23318-23-peter.maydell@linaro.org>
Date: Wed, 23 May 2018 12:01:28 +0100
Message-ID: <87wovutz3r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9jjuMfkctUqB


Peter Maydell <peter.maydell@linaro.org> writes:

> Provide a VMSTATE_BOOL_SUB_ARRAY to go with VMSTATE_UINT8_SUB_ARRAY
> and friends.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/migration/vmstate.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index df463fd33d..59fc75e418 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -870,6 +870,9 @@ extern const VMStateInfo vmstate_info_qtailq;
>  #define VMSTATE_BOOL_ARRAY(_f, _s, _n)                               \
>      VMSTATE_BOOL_ARRAY_V(_f, _s, _n, 0)
>
> +#define VMSTATE_BOOL_SUB_ARRAY(_f, _s, _start, _num)                \
> +    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_bool, bool)
> +
>  #define VMSTATE_UINT16_ARRAY_V(_f, _s, _n, _v)                         \
>      VMSTATE_ARRAY(_f, _s, _n, _v, vmstate_info_uint16, uint16_t)


--
Alex Benn=C3=A9e
