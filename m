Received: by 10.28.71.27 with SMTP id u27csp1206524wma;
        Fri, 23 Feb 2018 16:13:50 -0800 (PST)
X-Received: by 10.99.8.4 with SMTP id 4mr2723095pgi.289.1519431230275;
        Fri, 23 Feb 2018 16:13:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519431230; cv=none;
        d=google.com; s=arc-20160816;
        b=piCi8YGjDyWxKm0ptl4YFsn5Eja/ERRbWY9K/PBaIGIWfW9jOg7VOcGmzbFYDBMua7
         NgcK2fEEDYxndLSTQ9J2nzKtCR+h1uj954rP5QZJkmXYIb2xXOIm7XC7cSLH+ZaalDsQ
         KHQfRNyqXV22s5tFa8/zPCVhXp180cqUqpq3tMvW0r5ayTEMUM1Ps28Wv+LxfJWNI+cP
         9Am16ZAMlxLYc+F7CrTW8TirkyTBsNM3xAwNMQDZPYI0GJwY0TBn9xzf4aWTQMK4xWZL
         jnnZ8jxb8BaDMfkrbpEX3QTvtYxp4UN9XsQoE2iPcChfe8QajswOUeoF0aZAvVK2kwDr
         Ebwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=FNg8SsC6nQ2SUbcdE0iMdXRLuvDf2NLu7TLqb6XOmWk=;
        b=IqAng4qVZJpTdis3o2GDpt3cMly7N7s5eGSCriF/btq1HYZzLJQqFTS8Qmby6eL53c
         zeRe3IHRSIgv/7M4PuJggtc5YGMqMrfKSooVbJQr/umC+d5OgzuzxQwYImvZkVFV/0sY
         ZV7qqjeE5Q0bd1YIHVtU6vaFpO41p7zH6iDlzY1IOZyL3X8PCXOngoxYhC/NJzXnOOn8
         1s4rYfNNKXZxjTSJNgOyzhxmS2ek5qYbj7o7DV/ngqRXBrJ3O8l/+EfjRv8nlW/uKbFI
         mBp64bjug0b5CaQM9jwy3lxk/n0lXbyNTXkP6AyJnFrtmsE2e8VlAqtn0Lxh5d2kXYVF
         8oUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dAUkRk5U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a14-v6sor1131321plt.37.2018.02.23.16.13.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 16:13:50 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dAUkRk5U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FNg8SsC6nQ2SUbcdE0iMdXRLuvDf2NLu7TLqb6XOmWk=;
        b=dAUkRk5UbQk4WqeWzXYyvBqzxXNBRBaG2+WuGsPUOhTy/n+YQeQY5BCpv3o/H7SgKj
         hqrjaPNr2SY4/aKl1PuRYkWKKKslJ1X1ufDdBo2svHcihmaBSkaXfm5pt7Ybnlb5vPcW
         2mBZnrkfs79XK1i5ooKqUMcTK3P15oMfDGwg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FNg8SsC6nQ2SUbcdE0iMdXRLuvDf2NLu7TLqb6XOmWk=;
        b=dHI9uJNYFk8N8+bL0A917ahVjTGnvlIH06qTbKXFY9Nv3tp75Ta7hLD3M+lV8qbWMp
         12LOipFKohy+5tyA1eGDUp7VTmDUb2P/co0z1opvjlrMmUb6z+otEERP99ruumk6jMd6
         tP1wsJf7asB0X+/icn4RQ+sEw11BuIRlhZQ95YQz3t+9fg6wMVC6/wSfQ5cEeGKrEiir
         wQ8YNLPv51kg9aNqd0aQvBL5zRmb+067B480K90hg18kIjAvkbzeVFyIMlsXVsR52Eyo
         aOribGOjGLHZolLiHByZ745sumX2T42AgttqMvAvKRles+HMTF6Le2TiwGCjOYODe4RR
         xZWQ==
X-Gm-Message-State: APf1xPCskkd3fMjIRqUAwUiZxWGwpVbO50uhrnF/HRgvWqlugiaWKsCu
	eQJc4LOlAfOqy291ZUvHBWAokFeW
X-Google-Smtp-Source: AH8x227c+TX54UHO0i4W3fP4/KTXKzHmwGkMmEvUfP7j2zR2W84oDQVZPt3A7CHkQtPiTZIxrEBpCw==
X-Received: by 2002:a17:902:bc85:: with SMTP id bb5-v6mr3351086plb.425.1519431229740;
        Fri, 23 Feb 2018 16:13:49 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id m184sm6575572pfb.57.2018.02.23.16.13.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 16:13:48 -0800 (PST)
Subject: Re: [PATCH v3 17/31] arm/translate-a64: add FP16 FPRINTx to
 simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
 <20180223153636.29809-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <63ca260b-f49d-41cd-2eaf-63c938191bf0@linaro.org>
Date: Fri, 23 Feb 2018 16:13:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jYEyrnC0uNV5

On 02/23/2018 07:36 AM, Alex Bennée wrote:
> This adds the full range of half-precision floating point to integral
> instructions.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>   - fix re-base conflicts
>   - move comment to previous commit
>   - don't double test is_scalar in unallocated checks
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
