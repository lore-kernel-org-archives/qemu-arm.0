Received: by 10.28.71.27 with SMTP id u27csp1233460wma;
        Fri, 23 Feb 2018 16:53:47 -0800 (PST)
X-Received: by 10.99.125.69 with SMTP id m5mr2735508pgn.77.1519433627196;
        Fri, 23 Feb 2018 16:53:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519433627; cv=none;
        d=google.com; s=arc-20160816;
        b=RYJ9LBWUtURguSKhR3BHY6mcAchbVXfRN/N71CeRNcPnLsXbwgneZTd9wnCvWSndXw
         JeBTPqd+C3rtMe6N+NUqRdPfo+NJKWc2b30e452ECe9KdckGfjOE4frxx0x0ikyz4sgc
         /dQtWjTnbBGzcLaP1CM7lcM8ECqF2S9ZrY7Uc/Eobi8XGa91kAdP6KZFjAgKavkSzN6F
         UVpLDf5CoUm+e4PmtKRTAPo0vvkPsPj0UIZ1yIBOhuz5bizocSshTKkD7Sjgb4XgzyWP
         u1wgztlXrqTZnmbv4y+IF8kINfZ2TfVJV1IyD0q9HqeQrlOoLzhOIVEsTyZIYSCtqGNq
         r6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=PHTyqE1/aOhNMB6Bb9wOufgubZ65AVsRelr5uASe8o0=;
        b=L6URkj/cJZwaDTZylv2A7dh94cuiuPmsxHj/Wor4u75wQuSuaxXSvXxmwrEQy8XmHt
         wiv21B8GQdz9alglGAop7SkCEPYS1SdgDK7Q7xsQo9j85/FqWWq0+IpgcakGN//IKDWr
         XIicA2Y7/IhAOCCeEAZzE87Na2T39R/VWt2c6uZ2CSZ8xPdURuMcgZNX3hT1jU5wIkpK
         MKo7B9J2nZdj6M+stZ/yf+2zfjReHbWa1hQhhtQf+cSjdQfd6fSUB55XS4iVF74VD9s2
         AeUJIrTA+NZL3WFEckFHk8o07E3g8j349nL9kBV5aKBdu73bM8cMM66V15+eIzOZXrHQ
         2Iwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MLDLPu6K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j21sor1130329pfi.44.2018.02.23.16.53.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 16:53:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MLDLPu6K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PHTyqE1/aOhNMB6Bb9wOufgubZ65AVsRelr5uASe8o0=;
        b=MLDLPu6K8R92gz499K7dE2IOe2Jf83op+HDfFU37V1kB4zHES+AkQNYCUhdCb/Nghr
         wVyZgo+BRdZOaKpgh8uPSzsoryzh9PGTmS/5nTYV3QN290RsPUX0/6SB0KHs75dbFpiV
         xkxa93EseeSu+CBDmDBqSSZL9ggxg3whcIHO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PHTyqE1/aOhNMB6Bb9wOufgubZ65AVsRelr5uASe8o0=;
        b=R7JU1E1NAo9EsQf5gwMMxhe8NicxS4tPYLFPGTSIezb8VvMoTE2diWAM1iaeQOOhAr
         m1sQ6pZCDY/FQJqXAWyg25VGuhBQjGgOqvRQPD3DBoeNus4Mj+IrGerYOkAI6FuUd0LO
         1EhOspLmKcxf3Dv8279dxSUb33j72rAOJIBANFW+LiyUjapF3j+o5r54h6DS7DVH2TQ+
         Vstsb3TBPu/uEnKXDg+b58VGuSPpN0kEH5SgZLrOaY6Q3JyUKb07rx94OnE+4oY5jpIH
         KGalFBmM5CtKcr0g73CDQWBQAGhJL3/sS0CHodwb7OC2uFJlpMo9RwdlxlREAIixhm2u
         /BVA==
X-Gm-Message-State: APf1xPBzdaFwlsAljMTVGLkwpKyfYJGZCZlyBwMjkyPq4vCflc44W4n/
	JwlHoz2nS8YMD1DtYLMend4hopZB
X-Google-Smtp-Source: AH8x224RH4ROzL0TfzyXmgpEFRV6zLZN3x5HS+thvUTyWOoCCaV2XTcm8sr2fnbxBy7D+EtCxccFRg==
X-Received: by 10.167.130.12 with SMTP id k12mr3448519pfi.73.1519433626727;
        Fri, 23 Feb 2018 16:53:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id g9sm5982684pfh.153.2018.02.23.16.53.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 16:53:45 -0800 (PST)
Subject: Re: [PATCH v3 31/31] arm/translate-a64: add all single op FP16 to
 handle_fp_1src_half
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
 <20180223153636.29809-32-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b0df779-a143-0057-722b-284aa03ebc66@linaro.org>
Date: Fri, 23 Feb 2018 16:53:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-32-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: XJaEY91d8nmB

On 02/23/2018 07:36 AM, Alex Bennée wrote:
> This includes FMOV, FABS, FNEG, FSQRT and  FRINT[NPMZAXI]. We re-use
> existing helpers to achieve this.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>   - make fabs a bitwise operation
>   - use read_vec_element_i32 to read value
>   - properly wire into disas_fp_1rc
> ---
>  target/arm/translate-a64.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
