Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2824357njb;
        Mon, 3 Mar 2025 11:03:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFpx6zfkB6lSEgNj+P0suimfMHQF0SEmqNHoPPeP7eKOh8c7WaMj1QjxoX5uB061jUPHJ0W5WHaOwz5A==@linaro.org
X-Received: by 2002:a05:600c:3ba9:b0:439:a155:549d with SMTP id 5b1f17b1804b1-43ba66e74f8mr121437855e9.12.1741028590230;
        Mon, 03 Mar 2025 11:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741028590; cv=none;
        d=google.com; s=arc-20240605;
        b=CIi56oLfmaGpR/S10uuYxU5ZQOZv2+GE5t1W8+BQmECCgV3QONf02ewrn3zM3yT7ON
         SvZoNd/IfTUuUgTePcICWtU/PTOvFvecgAa+aKcJ+v52VBaBAhIm5bXxAzd2Suc0HXDk
         CiXJMS4XEOZYiKoMUXkFADxjPoutnCjVx3bqn5SrSdAXltC5w/paV5u7W60YSiAG7Pq7
         1BGeliT4MxrCPnGzaMq2fRKTtoeA98A5tWdNSjnITwgdpaJdwSTv66xoCqhoKvqZWZ5Q
         3S08g6tx/72K82NkuXOS7Ch4XJu/meuBnm2GaMDzvFtfB2NEPlAHeouxprtCBzr/O1aG
         rIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HpNCDMqr9ofV4zMIvFBgpuAzQ6AQt2EVqCFH295cKBU=;
        fh=/E+ChJ1PdhTu8lURRR7ORdlOV5Je/1f8z+NI5d7PRhs=;
        b=MnORp+ekaiUW37jQGDA7+QfWf3LC0DRzqT1IIXA++QIy+ajXA3Xbbcf6DOgWHCMy2P
         Igiky21wF8RQshm59p6s30Ols2h/R4KtKLg2Mrmyx7ieMiGLcm959TpEUlP3m4tReXOL
         JTjnNm+2NXksaQHpgXnRSAoYu9wi4ZRxkrQIOYBqGouhyKw/bJyxNx9sqlJosG+erNyb
         NUuKmae9nMB5Jr23gOscxF00rYTZp1V+Zg6cxTmUvmcXUhFUJ7svlfbA3zbdNxmISKP9
         qGekNAKRwKBCP/8zUxz5C+LqDrKhwHbhhqsh2RimPIDjzSBpiKOHXmU+qiw8C3hZySNy
         f7hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bPxiKpW+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43bc3367cc0sor8223815e9.5.2025.03.03.11.03.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Mar 2025 11:03:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bPxiKpW+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741028590; x=1741633390; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HpNCDMqr9ofV4zMIvFBgpuAzQ6AQt2EVqCFH295cKBU=;
        b=bPxiKpW+s0BhbHQvgqBnxZa1yxoDEh3oYD8EUw3XIgKi/CZjW8jLi1Ffa7JfkPEuNs
         Zxqa+dXYyAoK0U9J/BqZljTcgfLGTrob3VCPUTpfPtqkQC9t2MZSUIDZjQXtOQ1z7m99
         9k5BfeEB9kkPbcWAws07HvwZZvIXE/oMAR/9II3rimAB54SDcL8EEsbGXz4DqWklf9Sj
         ERkLoTY4u/dbK7wvf2xbi0fET7ek3czuoHQz1zGERdcQaz2PwD3EMiWq67CLK6r8iPel
         rJKzxAx6t5ma2ykv9da7v4QWiTbpvY5daCCUQ3HTF7Js3lddi/c7w1MC60UYM4NI6Q6Y
         qY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741028590; x=1741633390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpNCDMqr9ofV4zMIvFBgpuAzQ6AQt2EVqCFH295cKBU=;
        b=I5+S+mVrcCJZj0/WXsrYf/dL3FzAqq+GbgcfmUZ1IzUuXrR23Q1sVs9zC1LqwG8lEP
         8jKCMHXfisCGkvO0cAkxcmosmqPE+is+Ot+1l26G4Wa9NHsuk6vy430N9knwzVpz6AdX
         3xTCX95xe20qZideX26zC/gvZmRickVfEEAqT0CO9c5eIAERe3UxTxwOCPBdzuF0DWv5
         AOehFj5V8QkE7d/uHqIfLOmbubf2MAcJo0nQVPDaLYXvFn8nEOSMX8RRYQcN7sGVps8N
         yDUmtZYqHb7UCU71HVUmBIwVkJGLRppqmEu+1UX5iL2t2IUNculT3Wf3gJMfz9O0m9iv
         mCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCyLGuu7PmVh1lF1b1cmMnRjNxAPE4mC5ZokDA2/f4l00yh0Fa2wHgqrEGOoMsJm+B8Cv1NvJ2i046/Q==@linaro.org
X-Gm-Message-State: AOJu0Yw+6TjymwvCnqyw9m9W0JbfHKM+FjvOTr4U5fTTXoBis2j+tIBr
	JIJJiE6tL2/SAq3rhfO5C2A1ZJOX8eFqLlqEpJ2OxOHTwKJunKa3pdYREOdBVr9hSRmjXxSTBZo
	pM+e5eQ==
X-Gm-Gg: ASbGncsJxIHa5NVM0s55R+ybOpWU/qwVT795lqgvt9JJ+muQMTcV7umQ0rGoVs0QQ+C
	IAXtSZulZZRZRrUdHBRxIlfa5TkjbRobcJlkJE9BJSropWc4LQHwbHplUmUmz24fIOGrgE2GTaa
	BPjSmnSt554fKntvpU2rSTs/j8kQDrxZSCSFnF83TX3lHC+MjwcbnhWnAoZyBYHF199tOu1t5lk
	Mk5baUR8bnAGOkEGuNdBfrf3tNEWMF7aTEN+m3ttKIfBjFizBGd2eY3CghJ2WPqQZtCKEZVVHWB
	Gcl4LtdzpwwOpP9HGK/7ZEZY2ulLvb66WVNb1wCnFfjdBDmWly3wY2kbA52q5KXSe5DYyEIaHd/
	Dqn484BQ9Pv5o
X-Google-Smtp-Source: AGHT+IEgpXDh5bbA1oMbYFshI1H7iWJ2ylywogCfKe4O1oeGdDHJAOiIwMNy5OxfkSLs+hOJgapgtQ==
X-Received: by 2002:a05:600c:6545:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-43bc0fafe4cmr34625185e9.25.1741028589706;
        Mon, 03 Mar 2025 11:03:09 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc63877desm20482495e9.1.2025.03.03.11.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 11:03:09 -0800 (PST)
Message-ID: <afeba573-188d-4101-ba45-22cb0fd79a72@linaro.org>
Date: Mon, 3 Mar 2025 20:03:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: add boot error detection for RME tests
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>
References: <20250303185745.2504842-1-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250303185745.2504842-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: CLsFxuaF2zXk

On 3/3/25 19:57, Pierrick Bouvier wrote:
> It was identified that those tests randomly fail with a synchronous
> exception at boot (reported by EDK2).
> While we solve this problem, report failure immediately so tests don't
> timeout in CI.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   tests/functional/test_aarch64_rme_sbsaref.py | 3 ++-
>   tests/functional/test_aarch64_rme_virt.py    | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
