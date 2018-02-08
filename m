Received: by 10.28.71.27 with SMTP id u27csp6222wma;
        Thu, 8 Feb 2018 14:35:59 -0800 (PST)
X-Received: by 2002:a17:902:a9ca:: with SMTP id b10-v6mr504048plr.223.1518129359473;
        Thu, 08 Feb 2018 14:35:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518129359; cv=none;
        d=google.com; s=arc-20160816;
        b=wGFhUT68FNow2FAbEL9mZlKznLTMXEx0/SY1j8fIEZN829gwJPqFOVe4HyBfVdPwD4
         fgFpeIuddK+Ztb62ACU55/UFgy361eWUUPRBVsOSJzkgjJJdCAmomiCdHKjYP/jb8zYo
         Lti9PJPbpIdWgiWF7tj97j7zQaOyrofxekC77IZlfNYzEHm4z1DyjE9Ue11IJTTM6edK
         G0K2QPs31GRu7AnqjexsZD5UElijgpsH/ASoou3yghdh21wJVNreyoh4Pxax/L6jIJ5s
         qMAw//Rau5uydsS6kk5sCy5NFD3DhSirgVMCccGqLIrJahI2klWLWr4tagaOh1wUesMR
         G4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=H1Lb3XNUMHxvdLRoEm9fBqUpsC0Awyl/45KWrJljTmY=;
        b=bwAgiu6TbN7aYKE8yZbcEwexdMcGQS7PogyjhYzuvMS0+6ZXf33ktWgG1SkVo/9x2K
         /ccRg6uDZN+OK1zVxBLhwWGUFQN9htRZKDDyntM59WC5fNWQXw8tIDsUlySj/2QBmFAr
         6iHcV74MMv6Ix7UOkBUX00kyZcpAqK3ziVrh49B4j6nIdT7RgmRtYpHJogEIZBoS4E1Y
         V3TZ5bmenqesKJNULQCRzy0t6LHudmwXAs2CjjFUtmR4jBIT6WiX7MAvvBnGFAtFv8w1
         ruFQZ8SoxHkyzpQnzijPc73/zkasuT80HGuybuXhahD96k/H6hOQCuDmcgbMFVzhuUhm
         pORA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mhgf+euA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e82sor303862pfh.17.2018.02.08.14.35.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 14:35:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mhgf+euA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H1Lb3XNUMHxvdLRoEm9fBqUpsC0Awyl/45KWrJljTmY=;
        b=Mhgf+euAd8GdjdTwS+EqWr47irUfZr5ASTElxIvQAbhpucOBK70BPk3jVZgFymy22p
         LkMKzN/aoeNe8+eFLizEXXmI1yqoUnlkG//Urw304vVho3G9bKPu/EeqqhZ3+YGfk3cc
         +tWl2ag0dsY/6+AkVAgUpmooCpSDc3nvPPiSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H1Lb3XNUMHxvdLRoEm9fBqUpsC0Awyl/45KWrJljTmY=;
        b=MR8KWes2N1H2hRlv9kl3zyy0HxOLrODvtJ2yKpEkKWGvFGojUe/mm7z7n4sLOYSLbJ
         uHYVH/3U8URAgrNQjB6wHCTpu8AvIC1if1fNGovDevGYnkeSorV3tHrv01ijfJWpLg+p
         PL9fqeGLFyGHaBjFA6jXZE3RXSLfGk/rIatou26CaEWPpq4OnhiPpz6Z2jOEK9Rs36au
         Q8kcsp9lluQ+Vnc6w/RkDFcPJHUnFnRmoyBncyGe3+PonHAJWRewwNW58AhJO7JxMpGn
         yUarLjInpEQcD5J4i/rGVfH86unltMNTr8RueP1lyEtTxS36x/VeLeDXd5ExVviwsLwi
         F6NQ==
X-Gm-Message-State: APf1xPBYrFYq4UU2afR6DvvBnlivDr0xolL67RGYIp/Dv4Jm237IcdbR
	7VQU0hcdHHzATc7inWQ6o+5MvAQH
X-Google-Smtp-Source: AH8x225Jqs6ETeoYsXVJylHVplNqDaQify3KBoQBPwNDMkzZwFHkZY4WGi8v2sViJJhVY5A/Tx8yww==
X-Received: by 10.98.66.86 with SMTP id p83mr562766pfa.229.1518129359067;
        Thu, 08 Feb 2018 14:35:59 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id z90sm3782931pfd.78.2018.02.08.14.35.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 14:35:58 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 19/32] arm/translate-a64: add FCVTxx to
 simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <793713b1-37af-80e8-8985-939d809489f9@linaro.org>
Date: Thu, 8 Feb 2018 14:35:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: rC0zFSgIDi3U

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> This covers all the floating point convert operations.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper-a64.c    | 32 +++++++++++++++++
>  target/arm/helper-a64.h    |  2 ++
>  target/arm/translate-a64.c | 85 +++++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 118 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
