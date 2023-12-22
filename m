Received: by 2002:a17:906:3017:b0:a26:c056:f233 with SMTP id 23csp16546ejz;
        Thu, 21 Dec 2023 20:37:55 -0800 (PST)
X-Received: by 2002:a05:6808:1415:b0:3bb:6d9b:845 with SMTP id w21-20020a056808141500b003bb6d9b0845mr849571oiv.44.1703219875432;
        Thu, 21 Dec 2023 20:37:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703219875; cv=none;
        d=google.com; s=arc-20160816;
        b=Muhu66Ib+oTnfVUlGT3In3MrGmNCaFmsTyT8UPlG9Bwo2ZT8019MhVl/i+os7XHIpW
         uPoqBWZvJM9elf5SqXOjOwcbcRGG3Y5nVfSdJ5KhPDD5Nv0y5xxv16MYTANbQZfncqAS
         8XklDdOUk5/jcrAlkOprNaqcYKAFMm4/bniSBHOE5wt9wQcaK0zZZqf0QPwCu2uVT9rA
         kkY8wtD90xewc9MkxE4rvLapHRzODPfQIMrDxitoz8dIMbzsIVjUxv1jU0Dj6+noXjEv
         nz+zFHOah2IbhpTzHgBlxL6xH7JrngEBkJSIZ0TEtxB9JpPBXieCfdKRds+d6b5bhbfW
         6B7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=ubXue0ZHyXpELIbpnzirK9Dyfve4h1EaxAGTUFo0d/k=;
        fh=Hs0NBelrbu8Hrccpz+I/RDli2hRUqgrAXJmBwEce9ao=;
        b=DOVfmy4ds8rHykrCgl2Olf4PUO3Kl3YQxZ0ZSxbTp8QoZCMfxJUfInLfQxDogs6CCs
         VzZnwu2e3zqj+Jl18ml+ItXUs8shZMz1Wsa/xJIWq3BYnjR2KZfQEYeIX3DZZn4RL0E+
         a2V9b0XBPoUWa3VS7x3/5uLcZQBrthDxmA7MeQruV9NPgL0u1f3TqB5nkR+ccecY4bHA
         Sq8GXAUR9nLpshTZ6yn7lQSTNUGC75K567ErEdf6uSDe3pM/sGJ2DQWn4GdF+k79Q3lm
         4GrmyK/rZx0jRZR2nq5dZ0Sll6Tw/LZzq6UBAIwaJotgoM8xtI6NeNmWPy4cGmpJlFM5
         RZhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YBG1ROTK;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o1-20020a05680803c100b003bb744333a5sor1934490oie.3.2023.12.21.20.37.55
        (Google Transport Security);
        Thu, 21 Dec 2023 20:37:55 -0800 (PST)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YBG1ROTK;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703219874; x=1703824674; darn=linaro.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubXue0ZHyXpELIbpnzirK9Dyfve4h1EaxAGTUFo0d/k=;
        b=YBG1ROTKNaA1caelkgcnCJDNALJVVBfJDVsexJAX/lLj6hWNm1Uqa0uec8Uoq0hMcj
         aqlMCQSqptESQUCTK3WDMmgJj6kK4MTTZbmohmrjKL0MP3Rq5gog4IxrtbVUeJCQnXFA
         rGjmj4RXpn4bwgJiYuCTpoyA8rIekm/z2AIxytxUJId1en9wUNt6pEu4uBXSE8k00Qxv
         BdY4jiF3G7jraa10XBy6VnLhUAGYfwQ7xeJVeUzTlj6gAo36Hg6R5cjwQ+a/pmPgMR9E
         M+dtash4oALM+sguBh8lgkU0dv3L0TNUerrEg8walgsTPep//aaMf4HQ0gXjUiYTUUys
         4L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703219874; x=1703824674;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ubXue0ZHyXpELIbpnzirK9Dyfve4h1EaxAGTUFo0d/k=;
        b=PKCY1p9EvYkLnfeogaLN4o5xAVX85oFv0yJGZAjA+T7WC3rPPJ4KSCRXGWSUKYWY42
         BW/P3aukAr6t39ByxAq0nDsbP5lQt20dHvIBAImjOEl5I7WJZB/xsbuzmq95Ld4qnaGo
         EKszDIUEzxFuJgzDZM3AZpQEesyDRumsx8Rv/5UqvL6JXUtS89edoAakHfUbln8ecMlf
         Ok2aXw6c4dbIGec9mTNYbNOx84uL0xdSQd3kjt2OV18DTASv1XcmfpRjmU1uAhAKeuhF
         ySMVDq1EqVfD0tuE/pvdZNXgnLLN4yAy469jUwF9AlHKKV3HzRC/5/s8vRz3R5ehSpuu
         z5ug==
X-Gm-Message-State: AOJu0Yzb63wNf/7WDDoQQl23Txy30Z6iscUoNuk5UYpcrTBu9DfE/W5q
	sS0OPpoIeqL/Vlf9ZAWmRf7Xa8VR2MU=
X-Google-Smtp-Source: AGHT+IF7n4AUbnBmECv575kazZeQ++dtW9tAC2x/p6q/pARNv7y29BoLqvElYyZiMFOUNvxEZ23OQA==
X-Received: by 2002:a05:6808:128a:b0:3bb:7174:eb with SMTP id a10-20020a056808128a00b003bb717400ebmr926627oiw.60.1703219874450;
        Thu, 21 Dec 2023 20:37:54 -0800 (PST)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.146.126.39])
        by smtp.gmail.com with ESMTPSA id y22-20020a056a00191600b006cef521b151sm2433777pfi.168.2023.12.21.20.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 20:37:54 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 14:37:42 +1000
Message-Id: <CXUL1V42EKAH.2TYZ3ZFJPHGZ5@wheely>
Cc: "Ilya Leoshkevich" <iii@linux.ibm.com>, "Peter Xu" <peterx@redhat.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Peter Maydell"
 <peter.maydell@linaro.org>, "Mark Cave-Ayland"
 <mark.cave-ayland@ilande.co.uk>, "Eduardo Habkost" <eduardo@habkost.net>,
 <qemu-arm@nongnu.org>, "Paolo Bonzini" <pbonzini@redhat.com>,
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>,
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?b?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 <qemu-riscv@nongnu.org>, "David Hildenbrand" <david@redhat.com>, "Warner
 Losh" <imp@bsdimp.com>, "Claudio Fontana" <cfontana@suse.de>, "Brian Cain"
 <bcain@quicinc.com>, "Daniel Henrique Barboza" <danielhb413@gmail.com>,
 "Richard Henderson" <richard.henderson@linaro.org>, "Thomas Huth"
 <thuth@redhat.com>, =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 17/24] target/ppc/excp_helper: Avoid 'abi_ptr' in system
 emulation
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
X-Mailer: aerc 0.15.2
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-18-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-18-philmd@linaro.org>
X-TUID: aCF03UMbkmkl

On Tue Dec 12, 2023 at 7:19 AM AEST, Philippe Mathieu-Daud=C3=A9 wrote:
> 'abi_ptr' is a user specific type. The system emulation
> equivalent is 'target_ulong'. Use it in ppc_ldl_code()
> to emphasis this is not an user emulation function.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  target/ppc/excp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a42743a3e0..3d7c9bbf1a 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -142,7 +142,7 @@ static inline bool insn_need_byteswap(CPUArchState *e=
nv)
>      return !!(env->msr & ((target_ulong)1 << MSR_LE));
>  }
> =20
> -static uint32_t ppc_ldl_code(CPUArchState *env, abi_ptr addr)
> +static uint32_t ppc_ldl_code(CPUArchState *env, target_ulong addr)
>  {
>      uint32_t insn =3D cpu_ldl_code(env, addr);
> =20
