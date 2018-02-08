Received: by 10.28.71.27 with SMTP id u27csp9514wma;
        Thu, 8 Feb 2018 14:15:19 -0800 (PST)
X-Received: by 10.107.170.234 with SMTP id g103mr763093ioj.240.1518128119630;
        Thu, 08 Feb 2018 14:15:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518128119; cv=none;
        d=google.com; s=arc-20160816;
        b=woIyeyQmi4WXOEQIb+eZbCEG39r88RTSQw5Has19oIPWuSl2AtMdu+mzSuWkh7r093
         rSdoz5FudIKzuJiLfl5DauORoZD8qgM8YXjzpWGbPcE1pqaVpvcatfCffaNgn8fi0KXM
         lxa1JCbs3nv1LPWZpkz69gmUGNDXhdY1ZHZ3CfSXE3ugmGbH3g9C5GUFpaE4eOrTAbeh
         N7fdfem0PnvnNmtRb9x9Xs2Ml3qNfJaqk44bYJGascjH9pdhmbkFLrL7L9fUu3AyJBXO
         lhIs22UTpiRuzYhlqPH5gqFefNHQBpw5qhsCiuamWGQpAdNFHZy8a5VLQNcQUpREQhK4
         DRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=gXxhkndRnXvFuYbA5tJooyTi0IHO5P9u5oWEcMw38wA=;
        b=Y46kGhY19hc/1gPfD3w5xl4bip7AH2AfLFGc41btwNFkynd3k9++jUumg/clvM+Bam
         axKJNqxnKBs4kwa6ENP8Dr6hnxtf85JygxogOp3aJkyTvSP/W2Q1PlAR1huTr7pID+oU
         hAUlWiIkpfNzkcXZJPJjn/H3WCABsOSvLLbSDofJwmIPDdy7ryREF/xEXQ5VqcnHbsUF
         r52MAJHwA0zaRi1Sr3qRGTVcs5EZTPoS+bdBKMLY9tOEHFj+eRbPcTifCBWvftufkVjV
         C6yyXoDsJ/YPK3RMLnoRm8aKPeDnsxIETzJ8jMqytKIHrXU0ZmmJ16KUypYephFm8OZh
         e0uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wo3m5l42;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o76sor645255ita.41.2018.02.08.14.15.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 14:15:19 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wo3m5l42;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gXxhkndRnXvFuYbA5tJooyTi0IHO5P9u5oWEcMw38wA=;
        b=Wo3m5l42NjtPyBvDfN8kVA7u8NUZHxKPVR3vI7z5TgTxt1b3Gk+BsU7+Q5LvLwazFE
         vRe37hdT7lD+Ybs2x1xkmIjteW5z8ZVwX9ybZY30Mhfpq0zn/z/gqeLJyWBTyGA0offY
         WhjNV8aKr+MPk462++DNtZ2UMRTswfjXHUbDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gXxhkndRnXvFuYbA5tJooyTi0IHO5P9u5oWEcMw38wA=;
        b=TM2UbZ6JZNttxj5WuZd7JUFxX+KHXy7OHhNgBvVvwYzouWkkIMj4AZM5NJyqR4CVsL
         tqD2JWs2k+rDg6ofO1MF+wkpz/cljLs2QinF4X0Jwef0u/uoPJnJ0CDZY1vXd0egw94N
         yd9e55VH2qPrfwkRm9FOiTr+KBnyuYbRaB1ECRtkHe+5BWJDz7ZGfxCJgwJOvTeOLE3P
         H9JIy8KtMhxfJnU6VCiaFYRlagd1g3csGLldD5J79TxKejQFgFPq5FHvrzLw2WVAPlqi
         kWa+glg7DDur4rTgkv2kKC6iS0ynzsWafGRCXArO+JuiUqDR0sYgme/Dk+Po8t2PmT8f
         XTGw==
X-Gm-Message-State: APf1xPAGLtGg+fBA5tYXq83vh0wUIKrOj+OIzTyzPXUyy6m3FZjj+b9J
	N0YzuNKMVnx+fDHHP2KQYQc91lV1PHpmMA==
X-Google-Smtp-Source: AH8x227u0M8GFULCJizhGJzqqsZn9qXupEF7KmgL+/XQApy9NE1RBoN4RftE5HiIrGIFnoqdxDdhwg==
X-Received: by 10.36.9.73 with SMTP id 70mr855364itm.133.1518128119245;
        Thu, 08 Feb 2018 14:15:19 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id w78sm733683iod.25.2018.02.08.14.15.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 14:15:18 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 17/32] arm/translate-a64: initial decode
 for simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05283e69-89b3-2379-84a6-b329419a5f05@linaro.org>
Date: Thu, 8 Feb 2018 14:15:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: HpuCUrw8urvj

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> @@ -11472,6 +11512,8 @@ static void disas_data_proc_simd(DisasContext *s, uint32_t insn)
>      if (fn) {
>          fn(s, insn);
>      } else {
> +        /* fprintf(stderr, "%s: failed to find %#4x @ %#" PRIx64 "\n", */
> +        /*         __func__, insn, s->pc); */
>          unallocated_encoding(s);

Prolly wanna drop this.  ;-)  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
