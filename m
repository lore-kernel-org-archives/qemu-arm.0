Received: by 10.28.71.27 with SMTP id u27csp2534336wma;
        Thu, 8 Feb 2018 12:54:39 -0800 (PST)
X-Received: by 10.107.176.14 with SMTP id z14mr473653ioe.8.1518123279464;
        Thu, 08 Feb 2018 12:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518123279; cv=none;
        d=google.com; s=arc-20160816;
        b=hJwijMZ9GHYUw1jWgIuZUvVqRXhQKCdvXRr/jqcY6KBJ6c29vK4Buc79HpehgtK7Gn
         QD+vE2TDoXr6xnRHsfhD9VOcV6GqfOwD3DBd/UmE9uDjbSTxSxlKrDU5lKIp3yFjv5RT
         RvvVgDpLQelh8i2fmooK3Vg9kQwFfKL5yKJfn5vvOseJnqKwI6CFAp+dIO/KqYRqieqo
         7zV/kNXNk7aK45Wo+GbBtCl/KY6KswpiChpHSdTKM5VQjpl39l/uB5J5rAoK5IhO8T1y
         GeiBX/60KBvJBqU8cb1gKaFI+M9Bi6q3M8eNRNvHl4F7Kb7BWXcIyiAJI9oW9XYlkQx+
         XbfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=LGvD/3QX5USKmS19G8y/3UcrH9PDbekKB8wwsYBXrkw=;
        b=bGxh+STmOtVPRKF0h9skDUvldnk9cBZVVcKBYbp7lF0JKs9NS03GMhWCt2g+N4vH9l
         E7lP94Ydav9UfhvtfAYKY8oyqoUPyMfHHlxfxJTsRBRZOLK18tEZ3BjwoLGSTyeaViz/
         2WfC+xQrBkac6kEVOu4q+xYguhE9lWyF9pgzIGZs0VEt1T9muPbXJm6VTmvm8No5Ppep
         lHRZBsyWTSr7RmPq+lag4cL+41zktAJF39TjNJspFn3OKpjRJ7cNWJQaxHDeYAKmKs+H
         5aswMf2EnIrsFwe50TZNFaiO0ujbcMpBVoKhD9cfzCoih7VoY4sx+u5GtOueMb2vP3JE
         3FMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LWcaqTEa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s67sor533825itg.88.2018.02.08.12.54.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 12:54:39 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LWcaqTEa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LGvD/3QX5USKmS19G8y/3UcrH9PDbekKB8wwsYBXrkw=;
        b=LWcaqTEax1TvO9nkX9WoiPLb1BmEZv958+IIhtM5VR6ITB31faqq4XSSqA/J3MzgBd
         Tyx1ptmWM+xGTMs0wnoyiFInFq3hrFO055Tjafu36fbkxAf4dTXv4RXfSomSZRyGKCda
         wxmfxaVG9Dc/EgzVGNl2A+4Fvm2RKOLwnXpKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LGvD/3QX5USKmS19G8y/3UcrH9PDbekKB8wwsYBXrkw=;
        b=Ap8vJblWQPlWnhxZxodYIycBGMjpXLo9xuoqHQwS5stNFzkwMLvonHxQ2uouo5IsD9
         VSobEDxN68WuXmNns2wN53ga4YbSApU9WZ5Tn68x8m8Yp0ig2iw7cQuJfOCmAbK7u9JV
         jbDmkkT4anu2N5lC1U+qjzRJ+oZYSVs4CuUI8nr07hNlDsNco87GokPzR8SzYDFWERti
         UKBlcLJDaOtWyk0cQyLekUdLapYsac2RgCBwi/litO7ose1vZY3DHETt3Z1YrTpvFcLQ
         GWnCH1f7PkrKnZhkWQlAVj8YN2j0etqsUxiBmR4QASrNlBLWlTsSl6xaL0t7975aOhss
         0JaA==
X-Gm-Message-State: APf1xPB2NgFKcT8qk8mQ6BkIJ7J2Kn3cqh1jWPcfyYAKAkK1o4FoiGTH
	Yx6jG8U8w7SbbhLWJ16VNS8pejjN3GyKFA==
X-Google-Smtp-Source: AH8x224nMW0NFAwHsaEkrhpAgdI1pkDECnbe9W6/+9t74gGpUnYq3g9NSLKMYfDOhEqlRSbwSr5kag==
X-Received: by 10.36.176.13 with SMTP id d13mr621080itf.71.1518123279052;
        Thu, 08 Feb 2018 12:54:39 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id r137sm612702ita.23.2018.02.08.12.54.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 12:54:38 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 11/32] arm/translate-a64: add FP16
 F[A]C[EQ/GE/GT] to simd_three_reg_same_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da2bc012-1693-3335-eb5a-921d94e6015e@linaro.org>
Date: Thu, 8 Feb 2018 12:54:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: EqjyrnKuKK8W

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper-a64.c    | 49 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/helper-a64.h    |  5 +++++
>  target/arm/translate-a64.c | 15 ++++++++++++++
>  3 files changed, 69 insertions(+)
> 
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index 25e45121af..78eeda31d1 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -599,3 +599,52 @@ ADVSIMD_HALFOP(min)
>  ADVSIMD_HALFOP(max)
>  ADVSIMD_HALFOP(minnum)
>  ADVSIMD_HALFOP(maxnum)
> +
> +/*
> + * Floating point comparisons produce an integer result. Softfloat
> + * routines return float_relation types which we convert to the 0/-1
> + * Neon requires.
> + */
> +
> +#define ADVSIMD_CMPRES(test) (test) ? 0xffff : 0
> +
> +uint32_t HELPER(advsimd_ceq_f16)(float16 a, float16 b, void *fpstp)
> +{
> +    float_status *fpst = fpstp;
> +    int compare = float16_compare_quiet(a, b, fpst);
> +    return ADVSIMD_CMPRES(compare == float_relation_equal);

Not using float16_eq etc?

> +}
> +
> +uint32_t HELPER(advsimd_cge_f16)(float16 a, float16 b, void *fpstp)
> +{
> +    float_status *fpst = fpstp;
> +    int compare = float16_compare(a, b, fpst);
> +    return ADVSIMD_CMPRES(compare == float_relation_greater ||
> +                          compare == float_relation_equal);

Especially float16_le(b, a, fpst).

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
