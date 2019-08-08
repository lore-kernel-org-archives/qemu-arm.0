Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8032081wrv;
        Thu, 8 Aug 2019 08:43:50 -0700 (PDT)
X-Received: by 2002:a17:90a:b908:: with SMTP id p8mr4742485pjr.94.1565279030108;
        Thu, 08 Aug 2019 08:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565279030; cv=none;
        d=google.com; s=arc-20160816;
        b=qQu3fS6YitCczAaURfgylPh/2dGo1nSiNvo+ljzA+4SW2NPKfNOvWuFduN9RJU+aHj
         2ZJLF9+SGbRcvwSNVKvU2Lnn6lsy7q9xXiYWdkcYxt7zlsLhsqCM2XrWVFKwQcJOq/OW
         NKInwQz4nXjBmqmtTHi39NiC8SOk+q+WIBtZsgPFCZaJxjbfqoNWqDBEDOkDrw7qClIP
         X3fPM7jLsABPoRpsS2IZoQNv1fil5lzb6KiUE5tayXIIUNGR7od6vXReUnX0B4os8TL4
         LncPYBrAuy7cAwyIFp/c6Ug6vFLVJC8BHXPBLPUEuBKWap0+iHWvTQQaVWMoOfx7LT+g
         6dbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=9d84VbIVt4jjibDMNJI2YnvtvcFe4PhCYXQq/m+rW9s=;
        b=UNFUZYkHaXOukReMmmorHrG2iZsZCCeurP6yuRIO3VLLpAvEdEyKjjkPUrp/GFtu4c
         c9yy4KxixHOsF9o+LLmBfNARRZDt+lloPSngnzsk7ZDrAOpzjn8W8WK8a0Y+rv/sX6X3
         SqqmcoSosU4KymGJOHkNKS8TfzOwdQXMWP1k2pYUezGB9gv0PL72M/DbgEMN9elmk5Tz
         0OvaYjo+rCbpNrknImSvBhZ712c3YW65MIprs44DsOtHCq7HsTtkSTGJ5mqr4w6fNewM
         9MKxSUo+EYA3QQ/mw2wTk9GtJmBOXE+aS716RrnoRQTKouUZpu5JZkCS1hgTCCqhA9QH
         wJzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=stX8bg6K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t69sor3112352pjb.5.2019.08.08.08.43.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Aug 2019 08:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=stX8bg6K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9d84VbIVt4jjibDMNJI2YnvtvcFe4PhCYXQq/m+rW9s=;
        b=stX8bg6KKmAt8OjkgL3Wxsz9JeeJKPpg6wYsqROe0aSyI29F+3G5HnFLYJLXyJrVVV
         dHhZnMWVJCA8KsBEqiGkZnQ8sVE7TfkTCnvRtGEbYbJKc3r3YaTuUOJggg23IGBRKHNM
         YNE0ZxKXCyA4Txxx+W7md2+D2SCkkZPXO3UTD3GMFAtQClz5R5ZO5zYkFLAyBvCb4D9t
         Mpgxd/FDvMd+qzW+xrlg+AG+0/+Dk/A+p8DOL4mOgbcJvA5TPslnXnuupH/45fzTPnop
         hACseYyUPEHVM9YhbBIwOemouF0iDlaggk5qbrY2cPDIvf9JO7eEAkZ5ZejiJrfT4Q1+
         /+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9d84VbIVt4jjibDMNJI2YnvtvcFe4PhCYXQq/m+rW9s=;
        b=O7Nplqrw4VYu1hQ5rLjFt5cgI1uH9Fha05WWqxgX/8XbNwcMneix+hdpOHXjfHDcTi
         pKKYNmc/fY6TUovtQ2W0zGjSyudaXzolW5o1N4jy7ETtLy5FrmM8dQKZJJXyxf2P/p3i
         xr31+JXTMRLs0H/f+9PGg8zj/0u3NUbJifBHoT53+wipkpMDXkDBsOzkooQYitq384K9
         2wgyY2EG0GU1Pxbx9VqZG9iv1+X939vIYSIUQguLBkIHFFPB8x7eixdUtARvYDjSzfoc
         GSVcHPFLjNX76F5lXJ8dYrV8VMMHVOr0bJMKPq+W83O4uYfOHtg2aQzH5RWAfrzeZuxF
         Cy4Q==
X-Gm-Message-State: APjAAAXr3iLFmSTulxdCmqpKtUCAC2LnlUiqQtMtsNBGOe5KdWtH8k5q
	OOfCxSsRsahAx6TuQeaTZQYH6l36Qr47pg==
X-Google-Smtp-Source: APXvYqxfg1F7BJ0gks9TCbVT+vJgoaHQqdsON63JGGJ8nxrEKehhMotNDSDcWkac9W0lpIfK8SqiKg==
X-Received: by 2002:a17:90a:db52:: with SMTP id u18mr4727536pjx.107.1565279029109;
        Thu, 08 Aug 2019 08:43:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id b136sm125480578pfb.73.2019.08.08.08.43.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 08:43:48 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 11/67] target/arm: Add stubs for aa32
 decodetree
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Stellaris" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-12-richard.henderson@linaro.org>
 <CAL1e-=gwyGB4ibo_B5W1MpFy-9bB7=5juqTJVBdD9N6XFOOsSQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0f37edc5-2fb6-c92d-fb47-a381af649072@linaro.org>
Date: Thu, 8 Aug 2019 08:43:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=gwyGB4ibo_B5W1MpFy-9bB7=5juqTJVBdD9N6XFOOsSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: BFN0FM7L6acK

On 8/8/19 4:41 AM, Aleksandar Markovic wrote:
>     +/*
>     + * Include the generated decoders.
>     + * Note that the T32 decoder reuses some of the trans_* functions
>     + * initially declared by the A32 decoder, which results in duplicate
>     + * declaration warnings.  Suppress them.
>     + */
>     +
>     +#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
>     +# pragma GCC diagnostic push
>     +# pragma GCC diagnostic ignored "-Wredundant-decls"
>     +# ifdef __clang__
>     +#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
>     +# endif
>     +#endif
>     +
> 
> 
> This looks more like a "band aid" solution rather than the right one.

What would the "right" solution be, would you say?

A couple of days ago Phil suggested moving these pragmas into the generated
code, so that this need not be done by hand in the several targets that use
multiple decoders.  That sounds reasonable to me.


r~
