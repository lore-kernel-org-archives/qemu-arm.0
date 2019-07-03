Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp995056wru;
        Wed, 3 Jul 2019 09:26:55 -0700 (PDT)
X-Received: by 2002:a5d:4ecc:: with SMTP id s12mr30617632wrv.157.1562171215252;
        Wed, 03 Jul 2019 09:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562171215; cv=none;
        d=google.com; s=arc-20160816;
        b=pc6mAh+vXT+J3WdJigyTXkMNMRvH4DLzJ3C1L0AC7E/LOeRbLNFufnpxAco8/3KiAO
         gfWr12sMqMnKuY/kl34Vx39O7TaHLIlJoe2sFyZJnYGFY7Dbr/OVl7wN7+nfEYkSUHw7
         LqgD0R37wSjEprTyuKyRx+TJ7wGqp5J2l2DGyMKxHHTpkh71nd8coaWmAUKWxdV1vGQ7
         ZhrRP6Bk6JnlxR4oz6wPzzUSzOKfB4qOZNT/TW/OD5H63JxNI7Qs5MvNDQkcvLmxb0cX
         vaITWu/wrJsEmHYH6ziKWITVWJiUjmv0I1pXM55O3IMaiOuuWa1tqiTBi8Sbm5LuFGzw
         RDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=XIdp8b9YZOIts7YvsxasQGlbEVEtg/lMz67qoCvXUXY=;
        b=JR3tEMUVHVDTJIOzguVDjou8x8CYG1f/s2F2V8bci6TNicRrunXZFkQALMxf0uSsYv
         b+hKU8S5zVKllyz+c6agKzGdu1awigvNGX4DbRVanQdlJBt/KDM/qzX8RmrXs9FumBRv
         1M3CEwSjuXLXTiVAokhJ1XLAxRPGc1JOEDdaSMuFs4UJJY8+VD0YrcAcQ2T+N9qCIzxB
         X+oCQy0dS6DUnP2Bd1Vi7YkOd5jzRSt27mm38GbV0kjDnCtjwEX2poPcC52KSKoG7Co7
         6mAV/BPswpqin8Ye5/+bbEae2KHUK+CkHcUahdTtxPPzS0XDspJ98NL6qdz7jcpojHs2
         AfSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zisYD7qs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o62sor1606529wma.17.2019.07.03.09.26.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jul 2019 09:26:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zisYD7qs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XIdp8b9YZOIts7YvsxasQGlbEVEtg/lMz67qoCvXUXY=;
        b=zisYD7qs+C/5nNOZAYP5ytn98kwwCz3M1sawcBXWFuTq3n5QBYnrn6WKK8lzeaYoaF
         mMHiD3J1bAFDhRd4iWZVrIHnjPsaDJ1S3H6bdZ77+Awb8VvWnBPI5fTsr/KDQK+3vUVi
         /4n3/SYEQOosg3DNI+K6OzQFG3b3rDqJ/VIKj/kAFtzWu4WNDJbJCTDNtek5iuEwF0cT
         yc8GdKu7O6Nr34P9CQUP3av4XWSF/3RIDvmnd/876vjzqGH1XEjYxxieVCvv/LVUhu0a
         o6NHk3bPiE5a4tApoLOl954XIs/e3abKH4m+TiauQtau7v+d9Uh5gpMMBuo1PE7goUq5
         e+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XIdp8b9YZOIts7YvsxasQGlbEVEtg/lMz67qoCvXUXY=;
        b=FjnVdbc8D7Jzt5A2xxTAZPy7Tq1XLBK/BcH/diqtqsdrX3VEzOT2KDoMdJERZ0k9aD
         5BqG81xWjOhiD3GTtoFyb+Bk+c+JxV2hoedmHqRclJrVzapq8F7clNiUDnKXAH2bP9Kv
         LkeBWao2qK1LXJ2Pr+tPxMbhFhXe11oD5e0sPH/0Q/8/rJMBphdWSrq8OLR3mOwVp00D
         yXAS3HYSy3kjgESe6S6GynvnDyEb+SZnxDGlCpHs79vbjTRcn0jhvFGCXUu9Bi0mzP+O
         7yIU2+w6nNTUhVTSbcAzk5nhRE8/2d8kGBi/oKqmLfoI5xvVg02brToBfERnSsmSSRrn
         TjTQ==
X-Gm-Message-State: APjAAAW/D4BdnvLFcaIDFi09iopFfqxZdPzE6MBoUPUvoH1wAP0Vd2Ks
	/Rd88FVT8GGxO2J53eVom4iAP2/v
X-Google-Smtp-Source: APXvYqysQlhx3iv0914nO4KCAnLLDf+tTScVW8AIUJp46JIkE09GmetTzz5nAkYsfZhF3T/ok3BoXQ==
X-Received: by 2002:a1c:96c7:: with SMTP id y190mr7922532wmd.87.1562171214604;
        Wed, 03 Jul 2019 09:26:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id z9sm3789345wrs.14.2019.07.03.09.26.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:26:54 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 1/4] target/arm: handle M-profile
 semihosting at translate time
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20190703155244.28166-1-alex.bennee@linaro.org>
 <20190703155244.28166-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <927219a5-a56d-bbbe-26ed-ffb8be12f006@linaro.org>
Date: Wed, 3 Jul 2019 18:26:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190703155244.28166-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: uWQcVqRtnAND

On 7/3/19 5:52 PM, Alex Bennée wrote:
> +static inline void gen_thumb_bkpt(DisasContext *s, int imm8)
> +{
> +    if (arm_dc_feature(s, ARM_FEATURE_M) &&
> +        semihosting_enabled() &&
> +#ifndef CONFIG_USER_ONLY
> +        s->current_el != 0 &&
> +#endif
> +        (imm8 == 0xab)) {

Extra parenthesis.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
