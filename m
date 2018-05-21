Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp642839wme;
        Mon, 21 May 2018 12:46:42 -0700 (PDT)
X-Received: by 2002:a17:902:3c5:: with SMTP id d63-v6mr21374597pld.163.1526932002537;
        Mon, 21 May 2018 12:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526932002; cv=none;
        d=google.com; s=arc-20160816;
        b=CcTj7+zT2+vCFyKdtdAr4x2fuX5D5sWVIzFahAn+ad+uCspn1iIQlabbcYHNskYrhA
         KtIL2IWLiFxVmOiuLhu0ge8+t0e0cC0e1RZQAwk4YWG1hGAmi5kLIrZenq+8BT2WxA1Z
         UDj8D1L8So7op/OJytRkuWctAYm8djpfZs0rGYozVMyXtZcc2qjmh3dHabkZVOqElkaH
         U0gLf7/NZTvFR619WAa7chP7tmjq5LDrRePHbFYCfsgo0Xa2vJmIxBsZvuY6TPFGIeM7
         OgEM1u7LhDNysXNnnYWyMUW4ZzLSO5juqeYGvPsKDvYc/XCWvP0TY0oOLpn8EWIqIW1C
         qdZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=juwllGhGU+k+0us8mVBFU2rdFl9ISovVSWopGYFHPwU=;
        b=aAxNrgk17DCNwcKClF0pYSvX5zzRmTGkrF/SEHTafMxfzx6lvnvEzpIM3kd4h1oyjc
         2oAHzAHWJcUGfngsm7xeApufmKwT2seSOqwP7zQB2HzsVPeT13qO8QU+LnOOTXwUcRpU
         uAKSYFEq/44nAd/IxVKxCgm29BDEbpufnoWtpd1mBQBLCEC5P+gmq/p7HFveDZRlBrkQ
         dl3NsVLHHxYjWYtSd621zpA6t1nNBEninI+3RG+O0TiUKVa2fdfSTvskvYAUOVpHMQkx
         kCgcCU6dT/xdY8EEYyHqHe1rrLpBaa9M1K1JnoMRLO39euVmLb23WZUsCFQTn8vXzNge
         nyGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rimOs9Ai;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x4-v6sor6019904plv.130.2018.05.21.12.46.42
        (Google Transport Security);
        Mon, 21 May 2018 12:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rimOs9Ai;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=juwllGhGU+k+0us8mVBFU2rdFl9ISovVSWopGYFHPwU=;
        b=rimOs9AiU2qHGLDz1rgFYm6yoFgfSEJCwuDx76rrO2uuEkLqUCGFZDNGOo6FjW1tZT
         c6RilLv3xMUrdnk1AN2DL7ryitcWtOt1ayRmEkBw5vqb9LEfAMw4ZERkojjHONzdqeHQ
         yTYAiTr0zkz3wK4N+OJpq8X2i7YrQ+DHqF66WqCdqBWZqjXg7aWP7WU381oOxddWhfeC
         jZIBICQKLhM93zBJDSdj+hpTdJBoqcVsWKlEPRcpvJCommQoJbm45nayUeIZ3Q5ni/B+
         CNxEhlcq3xJ1IwKmCp8vukgCUD3t3X4YYX+Si4FaSBk+rUNVwNJ8BqNqWXsv43iioBzM
         iIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=juwllGhGU+k+0us8mVBFU2rdFl9ISovVSWopGYFHPwU=;
        b=o+Q5WoZxvQ+WVmacmKPTbdTriXaMVdzUp6eISQszHQJTO2elxOoUSzh+WLpiSNB9xK
         M5kbrPqtQngKnigQVztI3eFO0Q2sSDslgauAy70+Z8zZu33ElNFwMI6DEeACzgZYHE+o
         UR7SQ6VkA6UuJVXXQ2Kl76zbSmFIjTMu2tZMHF2pIYF9MTjbVaYSOj2X0l/K2zugQlEp
         14L/stODwfDN0i76BfHiNgQ8d7uN3mbZEkowRfLMywq8of6GNca0ZoOk2GD8Q70Z/P8h
         hiwkkDeDkKu4b0mYkO1sbZfGCOQ7XSUgn95KAhpNJRSsWTP4Q3UbamXS4s31rvtgWRj0
         V/rQ==
X-Gm-Message-State: ALKqPweuTKJYCDFXGbM3Z1jvclrtBCNOkdiZUC3iD+zhT2ewCJQtZS/4
	A79MnsfLRgCfwcnbktu6BJz+GdR0
X-Google-Smtp-Source: AB8JxZraRtPMVk6vBvY17dfKPBkmX9AbYbE1C3abOaGhC1t2uKd66EzLdI9eNw5XNYmPWUjscQHb/g==
X-Received: by 2002:a17:902:2983:: with SMTP id h3-v6mr21850422plb.232.1526932001624;
        Mon, 21 May 2018 12:46:41 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id c18-v6sm20200461pgu.63.2018.05.21.12.46.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 May 2018 12:46:40 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 01/27] memory.h: Improve IOMMU related documentation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-2-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <7c621d84-8909-5a23-2fad-9e5bf8915a8e@twiddle.net>
Date: Mon, 21 May 2018 12:46:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: +YITIBW67h91

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> Add more detail to the documentation for memory_region_init_iommu()
> and other IOMMU-related functions and data structures.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v2->v3 changes:
>  * minor wording tweaks per Eric's review
>  * moved the bit about requirements to notify out from the translate
>    method docs to the top level class doc comment
>  * added description of flags argument and in particular that it's
>    just an optimization and callers can pass IOMMU_NONE to get the
>    full permissions
> v1 -> v2 changes:
>  * documented replay method
>  * added note about wanting RCU or big qemu lock while calling
>    translate
> ---
>  include/exec/memory.h | 105 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 95 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
