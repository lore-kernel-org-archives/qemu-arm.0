Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4630517wrm;
        Mon, 14 Oct 2019 09:16:47 -0700 (PDT)
X-Received: by 2002:a63:4d47:: with SMTP id n7mr8790034pgl.123.1571069807498;
        Mon, 14 Oct 2019 09:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571069807; cv=none;
        d=google.com; s=arc-20160816;
        b=eu6MENtXDH7JwPymv1NDr0PYBionc9KdM2IvBlJ7XNBtdtXBo1rAo7XlzfZbGxhmnN
         1wl7utK4D5ub9JkL8d8JY1E3KZSJSW943XK3e/qhgDofBV67OqV3Xf/MBW2jJToksY1E
         E8kp3Y7KFL2kB7DrdGYbq+t3LwMjI/84B9onMUdqoczIVtXtjs5Ct1leVQcSaaMJUg9q
         CvyKjTAyBCgwheGcIFDiJZCB9P7eDiBXX8lnCbPPOwDoCqHZEKtBUHofYHBb15mlbhVh
         +zdJmxfqqR+tH32qTV/xj+GaQ5ZlRCfftwMk3JyawlwscHb8HVY0bHp/KyslbSPoxZYP
         oodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=Bgy4XE/eZ6UU38NhtgYxs1nh1iQwZ1ytqpBpjWUapu8=;
        b=qMKxXziOF9vdy5k6XtbL9ogS8vfn0iP5N4LoS+7T+/HpECk8fqf2BL5sRiFIpKMQWF
         E/qq33TPWUJAIpkkxcV2f0rzE8qxIYI9Ohdx+WCkAEZvYg6k47WNgyYjWJLjYW7mwE9Z
         2LgVVbk8HNxERVgxpg2rK+sFiQvRo/VD0l09mxuyJF1PTRpKi1eX4N6f5c0A8rZFz3zO
         5zaqslBcoiFuyhpso+BW5wMqmWNeWTNAk9lEza3bzGEZ/0/1Y7yEqnneH1feSqSu/cYD
         eAdKXMKBXSKNG+FGLmrCD2QCWw/t/L6Op8AwyN7bPNNnxO/CV94Q3nzXaWHfrGtKwkf5
         LVxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HPvPYeFR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c64sor20326077pfa.21.2019.10.14.09.16.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Oct 2019 09:16:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HPvPYeFR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bgy4XE/eZ6UU38NhtgYxs1nh1iQwZ1ytqpBpjWUapu8=;
        b=HPvPYeFR1eUM0lVILctrBC2oPDSm6uX4xhZBkkNPRWd23rtL0XEi7artAEiRYcCh1F
         53ZCcho5yOADLwsRpDCzry/Wr+5PSUikT3CujR4BE5XWVSLQgoas28cLBnOAcQxjkmUP
         cScV9Y/ki9cD1TeKJEX1IGUh1y9wdv18INiM6KCHZTK27RHP1EiXsFaDT2AKXCG1MlNy
         AINnz7tcrfY7zVkkX6Z6GvpdSR+ZjQGuo1rF8Ab8FTxPd90LDqrVn8O/IQ+YhCvAOrwT
         WAF/GfotgsneJqG8sdMAA0u6/T13TM64M/LyQwLZBZoLYdkywrXTra7OiHT+kPzhSueV
         0zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bgy4XE/eZ6UU38NhtgYxs1nh1iQwZ1ytqpBpjWUapu8=;
        b=A05emYJn7Yr56TCwZMt/HnYnP69pLrBe4Ra8iQaoUArfPM8+mWjcrq+wpMwvwWJ+H9
         I3Z9CX5L/jawpd7nq+n+TZe5yXlcCHoo8TPMBp6an5uLHhjfVDX1Q9kkx2q+sBQwAQir
         XpHZmcKbkTVoVetHg93CKojsACoobjLicVG/4OaYWkjHPJyuLul5JpCpqiMkR3Vdbu1O
         T+dufj1uTMtlX1NtCLZj9g6gLNFE2NDt7KwH4T4jFaFgOBAMsWxhK1ze1ChcEL3if+U9
         9kI/+jVyEkxCpwFevrOB+mjAwSb6ADtABQK5V/H0r26tNwIQ3bzIMyyic/CoWg/nvYFo
         w6rw==
X-Gm-Message-State: APjAAAXb4qOSaehQvmf1EPung/PKagMx5Gk4RrvTkXRY+HJ6eONVEtQP
	oUjeKLuGk87YETrD32iXwWxoQMJpTbFxdA==
X-Google-Smtp-Source: APXvYqy1FQtSb1UVjb59xyyC+RVB6FzUpvVixZCNwImjVXhCYUfpHAtJhrkHU3U8k/DuYPM52RcMzg==
X-Received: by 2002:aa7:9e8d:: with SMTP id p13mr32603059pfq.171.1571069807080;
        Mon, 14 Oct 2019 09:16:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id y4sm16238962pfr.118.2019.10.14.09.16.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:16:46 -0700 (PDT)
Subject: Re: [PATCH v5 42/55] tests/tcg: move "virtual" tests to EXTRA_TESTS
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, robert.foley@futurewei.com,
 peter.puhov@futurewei.com, aaron@os.amperecomputing.com, cota@braap.org,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20191014104948.4291-1-alex.bennee@linaro.org>
 <20191014104948.4291-43-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c7e62a0d-1515-bc35-c716-812654da6892@linaro.org>
Date: Mon, 14 Oct 2019 09:16:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014104948.4291-43-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 181MmjKn3SAa

On 10/14/19 3:49 AM, Alex Bennée wrote:
> Otherwise clever expanders like the plugins test get unstuck.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/Makefile.target                 | 4 +++-
>  tests/tcg/aarch64/Makefile.softmmu-target | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
