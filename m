Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5845175wro;
        Tue, 30 Oct 2018 10:07:31 -0700 (PDT)
X-Received: by 2002:a1c:1984:: with SMTP id 126-v6mr2408631wmz.7.1540919251442;
        Tue, 30 Oct 2018 10:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540919251; cv=none;
        d=google.com; s=arc-20160816;
        b=EwyHHM6SUKOxrfGwxuqf9qbUu1eUo94SWmTFPY5ku408fy3gaGZtXZTd/76aqri3iK
         gh25veKu5BhItdeyZbEiqv3nB+pArj31gzkaPsY0RQwKiaf6C9V6tebXDEqvFyKM9nFH
         q8lZbri3qYoA5XcUWf3vUU8ohLxxSVVlfZYDF2/QujUAGIlxe0pYCH/hHGDOn5dug4RF
         WE5Gcz0HzHLQw4GAulTxEjC5PD+3ZKt2vWsRzbn9r2/mZqddh3Y3O0AKdUAiVyKqN/MZ
         mrLd5MvmxeVswNcn0rzX2g+cMqAgylkG9Y9WYsZv2dA+gW1TOy7nuUWv8zCjHynXdEhU
         PUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=LarWKcr12nopClG1I63dhfwhMfAkLmzzIty1T15TT9M=;
        b=Iolh0lRY/V7mPab1ewtdVeFKztmOrrmOvNUwXRhASJOHGk77RGh7keYx9JWKsnCN5f
         hwi5vaBhgS1pcELKqOSxeLdedf72g5/v5v9VTmTBwhs+cm+ij0hMtAijT89uD/p0HTqY
         fPC8RyUZ9ShjVLjzc+gDW5DZeCY75hfS/XobGb8j4BUK+GCew2JE+Qt7POVzbqBquUJk
         WMoCJYrqo7zEvpjdmUf93mSx5o+Bftmf0RqA4VyROluajl7UeqHxYCy0wXt45BHmKoJC
         GZUsfq4qqRhpPLicHbQEHeyv77ONMynOvHW7/97tKNiVllXCFI2m6kQL2+0F+/3+gtDg
         z1EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v13-v6sor15684922wrs.6.2018.10.30.10.07.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 Oct 2018 10:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LarWKcr12nopClG1I63dhfwhMfAkLmzzIty1T15TT9M=;
        b=CnFyGeVZRYY9qTVJfEvRlLJLNXhPiFICN32QfRje9wZMcTd4pWrQPnP804Le2zN8Ji
         P1sjZlzTUS8IdtnoB+vuGrplyZrxbK2dvR1NSh4Qk5n7zV/uVsRiOVF1IgFUkv3DYr9i
         nBp7UnCs9QdNhIQKE4l0WqPP+i1pbyLncEJSUpBmifjJIBI/r2OztGZRRIMchUAOfE5a
         Vb/Z4q+zmRLPmF4zWyPoxW3EZY7pE0xNdyfHmlNR39yfr0T8SCFd5idCsY3mfYHO48kt
         esVuctnA+tE/SVtupoMvi0go1GCIbPWdG16+Z+vj6a0EScZYEXrek+R3ZcZia03/l9hF
         q+6g==
X-Gm-Message-State: AGRZ1gJyp4g3ql5cQw+fq0wFdd9MiscPP262qkWqP6VAQF5hwm65yHBz
	p+sByGXOwfq8tTua0YsPEulo4A==
X-Google-Smtp-Source: AJdET5ebu4Ff2Sna1y4CJCxuUA4jrYbidsRsNYVI+nx9NrEuVxzaubnerOgpibwjYqu/5fe3Iwq5rw==
X-Received: by 2002:adf:fb4b:: with SMTP id c11-v6mr18421618wrs.117.1540919251171;
        Tue, 30 Oct 2018 10:07:31 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.130] ([139.47.13.138])
        by smtp.gmail.com with ESMTPSA id z4-v6sm11532338wru.83.2018.10.30.10.07.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 10:07:30 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH for-3.1] target/arm: Remove can't-happen if()
 from handle_vec_simd_shli()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, patches@linaro.org
References: <20181030162517.21816-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9cf97523-9d9e-6799-d2bc-8b19fb6bf8e2@redhat.com>
Date: Tue, 30 Oct 2018 18:07:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181030162517.21816-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: dwFwMSh93QVZ

On 30/10/18 17:25, Peter Maydell wrote:
> In handle_vec_simd_shli() we have a check:
>       if (size > 3 && !is_q) {
>           unallocated_encoding(s);
>           return;
>       }
> However this can never be true, because we calculate
>      int size = 32 - clz32(immh) - 1;
> where immh is a 4 bit field which we know cannot be all-zeroes.
> So the clz32() return must be in {28,29,30,31} and the resulting
> size is in {0,1,2,3}, and "size > 3" is never true.
> 
> This unnecessary code confuses Coverity's analysis:
> in CID 1396476 it thinks we might later index off the
> end of an array because the condition implies that we
> might have a size > 3.
> 
> Remove the code, and instead assert that the size is in [0..3],
> since the decode that enforces that is somewhat distant from
> this function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
> Alex, if you could run this through the risu testset just as
> a sanity check that would be very helpful.
> 
>   target/arm/translate-a64.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 88195ab9490..fd36425f1ae 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -9483,12 +9483,10 @@ static void handle_vec_simd_shli(DisasContext *s, bool is_q, bool insert,
>       int immhb = immh << 3 | immb;
>       int shift = immhb - (8 << size);
>   
> -    if (extract32(immh, 3, 1) && !is_q) {
> -        unallocated_encoding(s);
> -        return;
> -    }
> +    /* Range of size is limited by decode: immh is a non-zero 4 bit field */
> +    assert(size >= 0 && size <= 3);
>   
> -    if (size > 3 && !is_q) {
> +    if (extract32(immh, 3, 1) && !is_q) {
>           unallocated_encoding(s);
>           return;
>       }
> 
