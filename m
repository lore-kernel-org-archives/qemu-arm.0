Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3643209lfg;
        Wed, 26 Feb 2020 14:55:40 -0800 (PST)
X-Received: by 2002:a17:90b:4396:: with SMTP id in22mr1417014pjb.83.1582757739720;
        Wed, 26 Feb 2020 14:55:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582757739; cv=none;
        d=google.com; s=arc-20160816;
        b=PFvrOi3z77/ZUyPpz8HOto8CHIqPGwdElj61DdDQqCIlYM6ShvIqWjNcKgu/HHjaXJ
         S2Eo0dSTAkDo6uDMOwekNBsPAzaDWJ+mH6A4lIprdAx7BeArYUNnCZWVTI18mc3C6eQZ
         QcQXDwxQO0pddjmL1ASTMCVwtvDILc2gf2WBnCcDvy3V9eHQOoVJo8XW9/4ujE58hT/q
         pyHKkQ0vsVCaHg9tMlSwSPRUdBQrcxI+aS6ezQeSmOYj47Be/cxGEZWk6VzFAZDu7VA5
         L2UHyKIy+Y4EdXwiPs0z0JofWaENLBNchDFxvk6kPZchN9h+CFTV/ZWmZVuemjE0Y3WJ
         c8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=6pTrTW2yxzhcyTv22bbpHT3wemj2wTbUxloA7/tytpc=;
        b=VWx0xowbTJFLhVFNjrKqD0BoHL3n3OJyLUs5kscroEWcAy9hHGwaSfIMOTL977QJn1
         c3aY1vVShjNtD3CNguodlYhVrVbD2OOLYbKEkn3oKE5edEoVCfsgJGldKTe5xdApqy/8
         L2MfhLzJx2nRDcNuEF7TE6cAlLDv2yXCpOqUDzQEDQj9fsxeIUQAgXt6J1FRcG633H6N
         iBxhPXaaycxK55qZpHYO6/GTGh0R6H075ELlpeeddLKTIe8teGyNsaQsXTXFGYOZskqO
         rj6D+Eb2k5ItbiqFKtcLs9rORUWHyLWv33Gatc8lwN87Xx8wrwB14yVWROoG2FPI8o35
         TDGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uO4qgUxR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p4sor853344pff.66.2020.02.26.14.55.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Feb 2020 14:55:39 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uO4qgUxR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6pTrTW2yxzhcyTv22bbpHT3wemj2wTbUxloA7/tytpc=;
        b=uO4qgUxR8Hy5bm48qSeSmUy77qXL4Smm9vAKfpbzxZwPSrlRrzSqvNofuFqsY44nUj
         7s5fM9ZnIcqLkQ+gz8p7oT+WBCpCNYIVc9/aagKn7gba3unzjOhZ0EnGQfdSaNqdEbPq
         /WwD22fcFFMjuDjzIo5ejI5Zo0Uo/AIf11+JFORlubazX6h8cVgAY6YTwmLPHq81cFBj
         Qy9iBWsfdSmipJj++S0CmYkBJ0wP4goH+rSAM9PiKt0eXzRrjxyDR4iLhYXsrhDmbtWJ
         n1ppp0jA+7CeqhPTJYbLDSuN1hx4wMidna+4Ukd9V7yXjpZTXTkCSzSz3Z7VarMKnxK8
         xonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6pTrTW2yxzhcyTv22bbpHT3wemj2wTbUxloA7/tytpc=;
        b=qgfo/6vJHdKkAJ6CmJ6ZkTfSvZthU/7izng0GQXiN2JvEylXHgdnWWq+mSGkK86EDK
         UoRBzoI0UOYf/xC/cfiRwWh3NjabsH37cFPfXNZRRHFO2+7EKQ9r9I1yvBkBUKUkEFv2
         5DR4KbBotg7RLM+tgfNc+uQ+LbvgSdxaJtXffI3DBezuT50oO1+9QUB+vbtqnN0uad/X
         qDIFNbaLS40mXHageHCzAI7VznbRFYbgyq4XE6EgpGJQG2b+eWBp7dixddBNULQZatZx
         1MNoCAjBn2qbisph88KBHgipXz+tyWJOmjjQftmBM45zrXhxJD7ThHdEgrajURo/i4bu
         B15A==
X-Gm-Message-State: APjAAAWlUTUOpMM7ROCS/b3QJlf6Ll33on6Ym/KYRW9PtCwIZHSzChsb
	xUssaNtBLPtOdCYI1ee3hygH/OxAM8rM8A==
X-Google-Smtp-Source: APXvYqzPkWGjGgy7qNRkSzRNBzqkFyQzH4ecjg2aWHrqQomX3f/Iy3PomIHJWGPCgBs6Ei/RWOR1Og==
X-Received: by 2002:a62:33c6:: with SMTP id z189mr1002969pfz.246.1582757739161;
        Wed, 26 Feb 2020 14:55:39 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id 64sm4093441pfd.48.2020.02.26.14.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 14:55:38 -0800 (PST)
Subject: Re: [PATCH v1 4/4] accel/tcg: increase default code gen buffer size
 for 64 bit
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ca7b55b-5674-370d-5c4d-dc8b7782ca64@linaro.org>
Date: Wed, 26 Feb 2020 14:55:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226181020.19592-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hcXw8GRFljL2

On 2/26/20 10:10 AM, Alex Bennée wrote:
> While 32mb is certainly usable a full system boot ends up flushing the
> codegen buffer nearly 100 times. Increase the default on 64 bit hosts
> to take advantage of all that spare memory. After this change I can
> boot my tests system without any TB flushes.

> +#if TCG_TARGET_REG_BITS == 32
>  #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
> +#else
> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (2 * GiB)
> +#endif

This particular number, I'm not so sure about.

It makes sense for a lone vm, running in system mode, on a large-ish host.
It's more questionable for a large-ish host running many system mode vm's,
although one can tune that from the command-line, so perhaps it's still ok.

It does not make sense for a linux-user chroot, running make -jN, on just about
any host.  For linux-user, I could be happy with a modest increase, but not all
the way out to 2GiB.

Discuss.


r~
