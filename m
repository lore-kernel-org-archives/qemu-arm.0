Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp651066njk;
        Thu, 17 Apr 2025 02:58:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3b93:b0:43a:ed4d:716c with SMTP id 5b1f17b1804b1-4405d69b031mr33433115e9.22.1744883890750;
        Thu, 17 Apr 2025 02:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744883890; cv=none;
        d=google.com; s=arc-20240605;
        b=ITN6OtQ/Gd0Z7jtKzC/3OWl6oUwXmtsO2kdH0E/1cnQM1bUiQbwX+LCOSpl4XrBI/z
         XQQFrlyvAQpRRyx/CTVn1mGWljXzXb9eLM/6OfwSrWyKvnZSGmBHbMfqxXlthNuDIWMn
         fuI2CbKk42Dv2IQkO6GJNCo8noMFNdsbQECvaJMRpuJOCWpaw/uzD4feljM4GBg1cSan
         EmCyHDX8vrOLeoVwcHW28DuLOS21i4TNNW33Xg33TDUUP563RNVroc9qgoKY+aKZ/UIk
         YWZw6c00rVYjuuI37HxXF3WyTIwm3SRPFUVF+UP6UziDh0m3eib5bwYklKdRx2KEueVE
         0xtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WhbUksNA5WCsHu7DVyS15rbACub4hYHmoXK4gfbw1I8=;
        fh=fBlaMbEcqh7qRrh/4PMPxXZXWarHK9f7O0uylPUAsHQ=;
        b=RLx04kynvyuN+K+9db/sVlDiLWmXhH48cUkMIWHUeJ94EkuFcdpwDhFH6rk5opB7PA
         qx3xbK0OhKxYWjNUDicEU9Zn9WWsIDOPZOqanl6PHryd2ME9wJfgjlRaou1UxPXwJ4hj
         Fn2qiTV6ZctETXp5F30iCFpKGPn8SsuA/swvr0AAyVDdIn6QcDOR5LvDqZDYLbuF2MQ2
         +w6uYFu/Wl9tqgv5HdXojG4KWTD6DL9KbrHGhKm8yJ6w7pg1yPab5CNArPw3RDsEdS9C
         lEKLbz7REOpvr8my2Uz890Rb98PPQYniSOL7PnM56k2v9wGZM53/y45HQsveLwBobvH+
         BxNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k/0IUHWB";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f3099cb0csor61738125e9.4.2025.04.17.02.58.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Apr 2025 02:58:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k/0IUHWB";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744883890; x=1745488690; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WhbUksNA5WCsHu7DVyS15rbACub4hYHmoXK4gfbw1I8=;
        b=k/0IUHWBE4G3tTEnBq51alTw7RWbXyOHZo0kjPtD3UGGgAbs/FIBoQbsC3hSF/wzCj
         MLh8/flx1o1FIisiCIlNyf97V+sTYIfi5mQ9f1dpSujbTrdvtW5XGZe6kUfIUhvxgJB1
         NElS+Bm0Vl2Ro+DHnBJ8/LqTKTCYigv81ZI2e2sTR27jyQuzANFx30wtuZqvgDh6/S26
         7fzFcoYGZrS6tiDW7OIG3+sNWaAiAq6mDwbiEKo0nXgjgu6SpJ0AVTgw8Gn0/lBcMleH
         PY1etpRef88FMiojft7+ePCQ7pfDLHeuZIJSWP45SkInFeSjfb3uE/TmkoQTrmM2wcg6
         WEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883890; x=1745488690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WhbUksNA5WCsHu7DVyS15rbACub4hYHmoXK4gfbw1I8=;
        b=nm5TugWi0eoDF6n6lrJ+JcA+qmQEjIwQ0OA2AUhFI6kSauJ6H4C07gqS/brr6wlDh0
         PPK5f3YfXfojEjcIaPDFLoLBBu08ZWgdIz6jAI6g8OywCZ5Ww1Q3pH6yxDPuaFNRvXQU
         DBFBllbdwBIEF5TXnqRnBCNVloYeLtafhMdnwzHojsM5DXT2WMrgykV+8sNU1WH4OOK+
         m8ORiCK7HhdPfbLnWoPi6EmsPKdi64F6UJ+5qugHahCmZ8RwmTdKPvptZM5wb4710pFK
         MN/AEOtlVomciD0yksyCZepnKlh4bcJLw6Dt+1nAxcc+M7kekqY2453SHYTnQIegmIKm
         e3Dw==
X-Gm-Message-State: AOJu0YxsGRNjftafHCfqsgahqdnYjavnTm1Wsohpj3MdLiHDBD/sHFeD
	Im2UBAdvetSCx+bV1y9f2DMcjPYsqZ3QzWDtxF8LRdjbhRApNuYcoeGmIhbI5k/LLQ==
X-Gm-Gg: ASbGncvyvRvpgUf8clBKMBw4G46+A3Z6hsUj2FvduRjK9YgceWc6Xa90lj5H8VOqMBO
	/snS8+hlBxuDN9AXr71iGayfYAfjdfXI4xJZvig2NdLjADusCQn4ExKJkJaJJMwdxU5pQw1GtSN
	bdVoq0wBf3WCRp1UI4b6LTAAQVm6zWoTT6DSEB7a0RSp69k3hfZW4r1heYhZRBm8tJ9qb5d0KQ2
	Wf7AGFdQLC1ldlIavC5RUFZ8pQjK6E/THESt/vC1ukRsgRADUNJ12OeFKXpzfNb3ZBcuxsvhKAJ
	K4FPdaksr/tF/skPUqGPiWnqGoFa6QIpTauli2yznkBl15cLbo65L4zF9DkL3F+4hG9ZatKI+v1
	bMHgwqQsiK9IKORKUsHw=
X-Google-Smtp-Source: AGHT+IEqeET6AdG1UMkwctbSE4l83P0Z+vGmkZxifhSHVLyYOM9QHGkJShfCLgn7NkJNkBmlC0mTqA==
X-Received: by 2002:a05:6000:420b:b0:38f:2678:d790 with SMTP id ffacd0b85a97d-39ee5b37c35mr4702997f8f.33.1744883890140;
        Thu, 17 Apr 2025 02:58:10 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d3463sm47258745e9.13.2025.04.17.02.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 02:58:09 -0700 (PDT)
Message-ID: <1e658b6e-02ed-47d1-9c19-d5753cc6e6c8@linaro.org>
Date: Thu, 17 Apr 2025 11:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/19] include/qemu/osdep.h: Add Emscripten-specific OS
 dependencies
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <58863961cf88a72b76a90279da09ea332943924d.1744787186.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <58863961cf88a72b76a90279da09ea332943924d.1744787186.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XYM00o3UlxQ6

Hi Kohei,

On 16/4/25 10:14, Kohei Tokunaga wrote:
> On emscripten, some implementations in os-posix.c can't be used such as
> daemonizing and changing user. This commit introduces os-wasm.c and
> os-wasm.h which are forked from os-posix.c and os-posix.h and patched for
> targetting Emscripten.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   include/qemu/osdep.h      |   8 ++-
>   include/system/os-posix.h |   3 +-
>   include/system/os-wasm.h  | 105 +++++++++++++++++++++++++++++++++
>   os-wasm.c                 | 119 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 232 insertions(+), 3 deletions(-)
>   create mode 100644 include/system/os-wasm.h
>   create mode 100644 os-wasm.c


> diff --git a/include/system/os-posix.h b/include/system/os-posix.h
> index ce5b3bccf8..e87cc36a3a 100644
> --- a/include/system/os-posix.h
> +++ b/include/system/os-posix.h
> @@ -1,5 +1,6 @@
>   /*
> - * posix specific declarations
> + * posix specific declarations forked from os-posix.c, removing functions not
> + * working on Emscripten

You shouldn't have to modify this file, likely a rebase typo.

>    *
>    * Copyright (c) 2003-2008 Fabrice Bellard
>    * Copyright (c) 2010 Jes Sorensen <Jes.Sorensen@redhat.com>
