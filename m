Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5813460wrq;
        Tue, 26 Jun 2018 22:38:26 -0700 (PDT)
X-Received: by 2002:a62:678f:: with SMTP id t15-v6mr1161642pfj.85.1530077906688;
        Tue, 26 Jun 2018 22:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530077906; cv=none;
        d=google.com; s=arc-20160816;
        b=zvUAXULJLwbIlLrjx71/OS/FB7rGfRYLNrggow2ukhU+XojZ29v+trfc8w7VK4TW+F
         52JNny+VB9SdfOHSQvxHa1j9K8SEN82L0puEGFfQs7wJqj0m4pXhlMkfdjlBEmHVVlO0
         rjcsYTNkqY2z219QldzcCDVH52eY3pGZHGnRE3NMv2OfqpfvX9IRX4vSUfSwlgpHNvMy
         9GcmVO92ahwoRfnideWWi2PQUErubZgrUsUpAZ7gjnfWPB3Fgk9vvOhkYm2HVsorAHmy
         vbshMnTvnm6AxVo7Ex90kfYuPVSCCPFLYuruQLpw9vQkMOW8fIlYf+DYDzC+7MKNk7Lk
         XVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=NK3HtvsbGLlxPvQghuOf8RiA+HdQbTe7CRZFHc9VSC8=;
        b=A2e091NqS7ErvXnipRje4jfg9SidTTSKBiMOabHjjiChXzilEzchZ5vRJENryFm0Y2
         6pEOgBMUstkFz1Q7wp3E2zqCa23t1rr56TM4/FD6uHtUvLPkh0IqiI0bXaSWCoQfWWSN
         i+ZUoXnBkuBwB11PNgQeZQM8DAOQbGT8tckhPSySNQAbcELAuw6auJK8DLjtUtr+3jcg
         qzcc90mePAwbSUBJmH/79CAIXt7z0hIknFNaVCggSXwSWbP7iJVIOYJRZs+4sW9X/I8b
         78ZF0M037jWer1xCmZe1RLr5UozlK4jXgJjghg539dmSyX1tUL1fDem3TsFLMlS4RbYM
         zdaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvbUFeJS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id bh5-v6sor995524plb.87.2018.06.26.22.38.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Jun 2018 22:38:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvbUFeJS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NK3HtvsbGLlxPvQghuOf8RiA+HdQbTe7CRZFHc9VSC8=;
        b=PvbUFeJSeJCcJHNo6oqSNofbsVJpoAtOMAMPU6ExRDfvyhczopwa7KZY07Iuv8K1f+
         LrLTKsjGpeWYRPZqVtdVjl80RaupwJEnjrl7fE3kSWdqOYdaFOh/YYTAr+3zZdf93MnV
         3py4d1OZX10V/kiFX/ksqYiqzeojhdZIIzWJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NK3HtvsbGLlxPvQghuOf8RiA+HdQbTe7CRZFHc9VSC8=;
        b=Q/nblQHVpNYlH1UZNDtyG912efgSN5S5eNiqJPXJQ+T2viTyC0eK5PHaIMV+Jb4Y4E
         ND2bgebb+umnG0TijbFQxnL18dzxi1qzZkgxIUz0+15E/aVJcocyvOrUryGSMPdXXtBd
         gcpUrsiZ6ujPmoCpSjn1my1hg3fMIDV5j9sGma6MAXIeN/eR3Poc8Wn51TLwBN00KPge
         BcrGPc4xAPRLY9Wy/0WwgjLE2qlAPuEHz7FXAhx9O0BqKyR+oyMPP1ppUNjypj8rEUKW
         sdF++TONFW3bz8Pi78j8QaXEuWhajeuWHCu+3+3pudKlAFV3xG1FDLiX3j91JIaVHUVa
         zVrg==
X-Gm-Message-State: APt69E3XDzfr7CtTSXk6B4vmHsszhuXkOZE0UMUBysesOEDDSRazXnRF
	ULmNj2NtuFx0wszvxQ21UoOOaCc8
X-Google-Smtp-Source: ADUXVKKrCHWc4RgZNx5QVEPwwcCSM6+wxEyLqRKIgN8CFaptYlGQEg+sT2712GWyglP+9MPeBgW2Jg==
X-Received: by 2002:a17:902:a989:: with SMTP id bh9-v6mr4722145plb.245.1530077906305;
        Tue, 26 Jun 2018 22:38:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.gmail.com with ESMTPSA id g10-v6sm4660723pfi.148.2018.06.26.22.38.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jun 2018 22:38:25 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v3 5/5] tests/tcg/aarch64: userspace system
 register test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180625160009.17437-1-alex.bennee@linaro.org>
 <20180625160009.17437-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3dfbf7c2-5db5-eb3f-78e7-6700aadc40e1@linaro.org>
Date: Tue, 26 Jun 2018 22:38:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625160009.17437-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 2nln4g0OyPFA

On 06/25/2018 09:00 AM, Alex Bennée wrote:
> This tests a bunch of registers that the kernel allows userspace to
> read including the CPUID registers.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/Makefile.target |  2 +-
>  tests/tcg/aarch64/sysregs.c       | 99 +++++++++++++++++++++++++++++++
>  2 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/aarch64/sysregs.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
