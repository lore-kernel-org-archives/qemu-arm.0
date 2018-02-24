Received: by 10.28.71.27 with SMTP id u27csp1231062wma;
        Fri, 23 Feb 2018 16:49:51 -0800 (PST)
X-Received: by 10.99.43.67 with SMTP id r64mr2739479pgr.403.1519433391343;
        Fri, 23 Feb 2018 16:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519433391; cv=none;
        d=google.com; s=arc-20160816;
        b=mvJ3U/pJw6gX0uPQPscTyyHPjOE3sze50QoAtHkhzvoiQtCH/yR5mN8srwajxdEUZ6
         dQSIv+16EN+WpDfaAHb2OTopccy/2h0p0/yTsLoI7O1F+t3UUrUg5leCBSd5iSxeJUXH
         fLLXTutdoZ0mK5pit6hMa72VdO9xnL0NAMfySTRsDA1gQapYGjjH3Qr+VkMilwBxn5HI
         DX3BTeOcJRK+Nocj2Fl4OngTRTW01hQMVvqIvyYGiNHo6S/fANlWecmrWcoAPZt9zdlp
         y9qxT6iNHsO7+uv1DWAGyK7qffYLwr+imgdle67grEwX2cYckd/MWRziHdx+ZSZRnSuH
         pgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=fBlzFR5Hrmd7Cpj2IisnoWOP4rWvi1QKotLgYF37eGo=;
        b=CIvEpRtuL5whDqsiT5WmWylo9H/dqOBUPb0MLW7RiqtifgL9Hcgt03NpI1CKDpr3iI
         OA/h/5vpHaKQ6EZqkJ1YtKEEqucRHbmwq8H053JIfIoYR0tukYhM0aKRnP+fM4spYFdb
         B53KP5f74VXChM4Dj53aNOuaiTqH02q89dZ/RvOdMWPzQ9c++m1Mx1ZiMtkEOwqrZr1o
         +N5zjsr893mPT2+VY+a0c2z+GNYe85tU+zv7IxBtsm8hCc0L0Sw3Qdsy6G6AAPWMnZ+U
         AwCNMBrfsdSoMX3AykHT9aV7FkOoJhIMM/RlwuPCdOfTEq/71jpoaFs0jE1+O2Ifs/jz
         XcpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CcpWAxnQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 37-v6sor1229672pld.90.2018.02.23.16.49.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 16:49:51 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CcpWAxnQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fBlzFR5Hrmd7Cpj2IisnoWOP4rWvi1QKotLgYF37eGo=;
        b=CcpWAxnQgoitRVsu0d/KSvbkzRHfTwwKF51xPi7tnDO557wpFlpPGj8g/Zdx5nZEVs
         JVgCAM+cX9NUD0RtifFV5Mt4QcfN7EfcY5I2adJgcHo+jftYuwzT6Zy0uCAExV5hE4Oe
         vafWelh824OljB2P7829S8PK1FNuihBLGc/7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fBlzFR5Hrmd7Cpj2IisnoWOP4rWvi1QKotLgYF37eGo=;
        b=t/lh/MHNMbu8QkCKC5O6gmqXilNNKftaqfLdicsSRK8rzKhHnDBOQ4v+4NR7jT0CIe
         X5ic7uPPaG7LL1rLWt7u2ae/1Ne6xtYV1gKpn6G3ZfH3vWfeLZm2pB7UH4e+/os78wf4
         0lr64kWvSc8MT16aYPFFJkaC8uSempnHXm2F7Vqmix3NVTIJHsJXk6eVDlBL6dHYT7uh
         yKfhbTSisRfo4vQE1W67Sc3bDIKVhE0+VBvQHK4spC0s5kGQZm9bjOZwbgN+H8mbqX4P
         0JXyv11nYNMmwY2RxTzMUlyFQwYmh4hamkgxzj4gE892Ux5fUctUBHQiXZZYX4TOzdib
         Oo2A==
X-Gm-Message-State: APf1xPAdzqaFGqo/ITjCsEQ13WwuJQWvH7PE97kRme9W7BknNDYKlxWP
	wNkkzt4HsFXgEBJx8WL1N9lmLWRDbL4u8g==
X-Google-Smtp-Source: AH8x225c8HCOxcx3N7Up+t51gYdW2hdYVptQuIa0/lg4tnX+jdYgj2hMigLq6KudMginavieattLJA==
X-Received: by 2002:a17:902:71c9:: with SMTP id t9-v6mr3321217plm.107.1519433390865;
        Fri, 23 Feb 2018 16:49:50 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id c18sm7817534pfd.100.2018.02.23.16.49.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 16:49:49 -0800 (PST)
Subject: Re: [PATCH v3 30/31] arm/translate-a64: implement
 simd_scalar_three_reg_same_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
 <20180223153636.29809-31-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0274e558-e60a-6af8-25ea-ce465ff7b6d8@linaro.org>
Date: Fri, 23 Feb 2018 16:49:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-31-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: yP4279MbZ0sF

On 02/23/2018 07:36 AM, Alex Bennée wrote:
> This covers the encoding group:
> 
>   Advanced SIMD scalar three same FP16
> 
> As all the helpers are already there it is simply a case of calling the
> existing helpers in the scalar context.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - checkpatch fixes
> v3
>   - check for FP16 feature
>   - remove stray debug
>   - make abs a bitwise operation
>   - checkpatch long line
> ---
>  target/arm/translate-a64.c | 99 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
