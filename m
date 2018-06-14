Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2488980wrq;
        Thu, 14 Jun 2018 13:24:51 -0700 (PDT)
X-Received: by 2002:a65:6252:: with SMTP id q18-v6mr3644531pgv.106.1529007891433;
        Thu, 14 Jun 2018 13:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529007891; cv=none;
        d=google.com; s=arc-20160816;
        b=Sg2PRRszi15RqeKpKBZMCDhUFbx6tJh3ljWdyGZyNwXcDF/OmX+OZ93fLah6UP9AEt
         ihWNdrlf5++hpHnmQ/lvf3wbGoRE7SlEm3lyx3axMOLARCalqmW3lJfAot6dPgkG9JDK
         DUBBUDkvBSBff+TbEV6Yi1Jyo5zUYTo4kvppovARfRjlH84mOqKHuUhKKEZe4tNRoZ8P
         rKJ12YnGVk54UdI1K2d/gMRdC1AcAiB/kMMhDHLPbYrLg+HNLmbYR20C8jIsY5PK72HI
         ylGz9a40XXsyUQukZiaWR6ENpJaMGGQDuMieQ7G7Vq2M0uBb2gmEsF+REX5ayGtJQ3db
         c5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=4fgv007Xu4jqBg56+a3AzTYhMbrRuJ070C5Ms1lFB8Q=;
        b=NOhoM/Ven/SV3E1TFFmmr1vbo3WVCvXY6JQlF5LR90cNbFb0zfkv18oG6B5tgG0N3v
         P2ayAFjR2BmItAYtL+9hxHROYX4xCPpS7kzdy22jP5wxDr35A5TRqrrlBfkQnZbAqQYz
         Yl4tYbgFIKu4NhgNe9gYwAIlp25egV5mcLrxuSMCd/o74yrld3viKc8FrnCDTVxcsLCK
         JkJAslFzVgK+N1s1cF7QIm/Xmb5nfwFraPwRlAFNq7ZDo5Z/1VFjbBVohBnw07qubZS5
         6bncHmX8ZS5cw22Ayu6bULBJV0SZxgNHDRXUPKp4ll94mZI6e5IiZeQOShv+9lBDKsar
         wSsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BtRN7Afc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m5-v6sor1946994pff.55.2018.06.14.13.24.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Jun 2018 13:24:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BtRN7Afc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4fgv007Xu4jqBg56+a3AzTYhMbrRuJ070C5Ms1lFB8Q=;
        b=BtRN7Afcel0yFt7J+lL+A+3kWgMagbOYQeZAbNlfQOE1+g3V8l2xznwC9h0CnDftvq
         pvsdlc7vukyRCXtQN45if30zzIL4LoqcB5pvqGX6FwgQQBxaxu2TYwj7z6iuLYk8MTSP
         ZhOSD9GpsTS4/Rhp75c47T/fxXBzjDF+h8q2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4fgv007Xu4jqBg56+a3AzTYhMbrRuJ070C5Ms1lFB8Q=;
        b=q5L5EI7jpvA6lUAm7UhRTo4ZsvK5ZtVD7fajkBSoBnIADjlTGKaNYgv4RMSxd423ew
         iZRO7+ewRDw9e0A3Qo6dMyp9sMTWiswaYBlm9CkQDWhfHZkl3W9fFO1CmUcMAhBGx6Oo
         X2jAUFnuGzvjhb8vegRA/APwUkyn2rh1qixspTaPKynSdtSGEOe0Q+a25uWc0yidg7AW
         MxKyI+coD+Ml0U2icrcOQocmhVRQcuEg3IZcwy+o/k0QxhkZ0YpIIv4M7GDRG4EVvl3Q
         GRT/9COwa5jksVtZ4mmdiitO1LSxYo5gmwFJOJj6U0GtGRHkQKcUBZlhn95BZ5PEq88P
         bG/A==
X-Gm-Message-State: APt69E21RFo9eDKdz+TuDrkMntONv/T9yGmDOGUdqWXSb8vf/QZQVFon
	a8yRTavDm+tM8+omb99WUv8FAQVf8iH2LA==
X-Google-Smtp-Source: ADUXVKJDymvp7lMIjvOmzWBre/nLmveLK10YPP4h5a7SH7BTUzpSMz21s2w4zDXuuenRMpcFo9+wtw==
X-Received: by 2002:a62:b417:: with SMTP id h23-v6mr10948214pfn.121.1529007890991;
        Thu, 14 Jun 2018 13:24:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id h13-v6sm3946579pgp.13.2018.06.14.13.24.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 13:24:50 -0700 (PDT)
Subject: Re: [RISU PATCH v3 16/22] risu_reginfo_aarch64: unionify VFP regs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dd909890-3c79-cb7e-6e25-c8b672361782@linaro.org>
Date: Thu, 14 Jun 2018 10:24:47 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: c7FqKZzjpFAB

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> This is preparation for the SVE work as we won't want to be carrying
> around both VFP and SVE registers at the same time as they overlap.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  risu_reginfo_aarch64.c | 16 ++++++++--------
>  risu_reginfo_aarch64.h |  9 ++++++++-
>  2 files changed, 16 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
