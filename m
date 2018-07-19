Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1798900wru;
        Thu, 19 Jul 2018 09:16:43 -0700 (PDT)
X-Received: by 2002:a63:231a:: with SMTP id j26-v6mr10537781pgj.138.1532017003442;
        Thu, 19 Jul 2018 09:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532017003; cv=none;
        d=google.com; s=arc-20160816;
        b=J3iCCYUz6r+qUbDDOauJ3IJZ6D1ezC69PT1P6HtTlG1aHYOkvAoTO1c5XlObfaNkTA
         PtpFx73Nn0wGhP/XCMMGO1kZ5RmBxaFH/ABGmjgrlKAZnbI+g7eL6r3DPjnF06EUsyDH
         bWIx3fXMSTxq7/P8CYxNW51G0qDwLruY32HVcq21lRVzTu1HZJocVVpawl7fVXzEsZ1G
         8RA02XXEWccUW9BnMf59bDcgKCefFFUZPIVa0ZysApVn4GlFp6FJLAGcWpYI7Q3kQTM1
         IPcnnTqHB8YBWkfbbyATs9vRtkjWP1BTabNajn6MCXp5C8E7Us2BVF3Ke4mQgTv7Zwj5
         Jx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=LfQ4i7gOkvLRIHs1nG9+v4JSdT8gZ5OdUz3BPRRIegU=;
        b=vffPObZsPsgJak4CUH1O5Qd//8EN2VHONNDAWa7paz7fjg00MHBdiKoGYGiT+xX4bu
         O70/Jm65RXm1x1UMOXvkyajlbzSCqenQVm/VA3wEx9bzfQmrxUaT+4XXgbzOUx9giwtA
         GXnBHFqAviHHhQaGgQ5gFJDjC1thwwnkdQxP2131MYmN3QfOKVTfYVBWzg7GocXMpSI0
         b7UckIqs0bJE9daeTPucy9r4Dy/gDIsYBDlxbw9fwAcYZnXEa/X5Z/cx3acteccxc02D
         uXfVmsUEE1MSAshW6FyVlaq2mEjEWIBsSgsXlFUld7ODiAeUWrHwBsQ1PnU0irmCdWKM
         k/mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ErxT0bVk;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 71-v6sor2152698plc.147.2018.07.19.09.16.43
        (Google Transport Security);
        Thu, 19 Jul 2018 09:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ErxT0bVk;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LfQ4i7gOkvLRIHs1nG9+v4JSdT8gZ5OdUz3BPRRIegU=;
        b=ErxT0bVkr1pfCLYqArJEn9yWZD5Qh9Bcb0xPa6KAnanF6dgOOoXBFF15QFwGfjIi2C
         X51VkdwCcGejjnVP2wJRnHeqJlEypfTyWO/2TS2FRJrTrccopfc7XND6yVGh9yKJRCZM
         JxMBCzfPe666nnmiNl5cAZs0STbZMcKn9RzhyNp8vMh2u71RG4HCdA8sZYindQ2clHKS
         ayHKmtiitKF8PPNsUpA5xKmlUp8CtPnFtay7wfVeUHq5EwdXto17i7TyAKeOUgcp7Pf9
         m6u/vBEodULkTvKUtoK/3CKBg4CCA863K5ib8lH1UEEsTOWFxJMnb+Nr+RjIu8nGfzaG
         M3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LfQ4i7gOkvLRIHs1nG9+v4JSdT8gZ5OdUz3BPRRIegU=;
        b=e1Bh/gSTGp4K3O0i6SwoDzAI9L4ZdNNunwTplSSp+1+PmpqJfNmxYkXQkpQkgomXVS
         8aZdkVjlP6Z2w/59ofpvcLuxWeRuuCrTrjKLgAkbfyXxFbu0omRYMeH6hrj2uceuxFt7
         tHEGBPNjUkHgo5EaCKc/INahCtmiwOZpnQoWOmcPLYpDadoLZnuAIxG2Z5n/nmvgPgXm
         I3Rz5YBn3ZNnurXb1GO26DPF7/sg8f8IPNi667CZr+OjTmP4XWPtb4RjeycGMhns/8Ut
         wf4kVKycDZnfnC7QDjEYEB3uhXAFn8TxPLZu0OX0//V1TPpF8e90tLEe5u0KchQrQrKI
         i7kA==
X-Gm-Message-State: AOUpUlGHoSzvDVihAaC3hOuGTJlnLKaTf9q3VbKzDpr2Hy9FUEmM9EP1
	iJjKD9ZVi8L+/J9mc6Irl5LZRtO8
X-Google-Smtp-Source: AAOMgpd1W8UMM+BpUfC2CJku2Qag2IWgw0El1JO+8uR045bd8dnW974UkatGNHXGDIr/4i04ADBOgA==
X-Received: by 2002:a17:902:e005:: with SMTP id ca5-v6mr10785575plb.224.1532017002953;
        Thu, 19 Jul 2018 09:16:42 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.googlemail.com with ESMTPSA id r22-v6sm17628683pfl.112.2018.07.19.09.16.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jul 2018 09:16:42 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH] tcg/aarch64: limit mul_vec size
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Claudio Fontana <claudio.fontana@huawei.com>
References: <20180719154248.29669-1-alex.bennee@linaro.org>
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
Message-ID: <9d98177c-4bf1-1e2d-a2bb-b5c907e76705@twiddle.net>
Date: Thu, 19 Jul 2018 09:16:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180719154248.29669-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: rsET8EYy5Fvx

On 07/19/2018 08:42 AM, Alex Bennée wrote:
> In AdvSIMD we can only do 32x32 integer multiples although SVE is
> capable of larger 64 bit multiples. As a result we can end up
> generating invalid opcodes. Fix this by only reprting we can emit mul
> vector ops if the size is small enough.
> 
> Fixes a crash on:
> 
>   sve-all-short-v8.3+sve@vq3/insn_mul_z_zi___INC.risu.bin
> 
> When running on AArch64 hardware.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tcg/aarch64/tcg-target.inc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Queued.  Thanks,


r~
