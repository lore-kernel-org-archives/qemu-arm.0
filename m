Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2061649wrw;
        Sun, 11 Nov 2018 05:55:58 -0800 (PST)
X-Received: by 2002:adf:eb48:: with SMTP id u8-v6mr12946619wrn.22.1541944558226;
        Sun, 11 Nov 2018 05:55:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541944558; cv=none;
        d=google.com; s=arc-20160816;
        b=LJRdtXLyNzRVGwWTr4u8o/mW9eBxUtslj8btf43wbwWqaRDRbtMygLr/kzHrE+gllo
         VR1P8CIO43YsgymD1ZpLx3QYR1PMZrr1nmt2S8PhE+yt1/1ZCV36cX6esTmsGm/dSC0V
         icIGS3d6WK+2HMgUcafTxXpTJbojMd/dL+8CGK9DXvPso3tpQq4PU39OUIIdyVnCWAqf
         pPMNQHyAmHByxHb9BaaNqXEPYneM/0kp9hQ8oR2Og1BPr86+svjuRZDa8xw/r8wxFiHd
         RJr5MIyzKL1PvMEnxGkQzlRISxdGy8qUkSdFSsHCcQuayA3YUiiBmI3a4CsUW2TFSkzs
         4g8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=ZtWexDi69YMClHntdnr+M+TwyExnNfOYnFOAPBRqIcE=;
        b=lw2ImTz8dqg+LDeshURkwFYhL5UZAcV9KfvMrjy3vLBS1psTLs30XfenvIsnCeq6yp
         JIaeDuHc4pQSJcihXEOJfWm7HHvkot8Yi4ioGShPWIjZ2IBFxPaZ6zaU3yAFjU2OOoHd
         4E/+LxMLE4FJecwIYifNlEZZdLhGPL6psy6JTEH/z4mG3CysQL2w4QZHfhSX/MkB3R60
         9PvxGgD4rBvcQvAr+Wh9Hdf7MW3p1OZZqrxOO+iXiED5aVNyQCzg3hFBqQTqghV9gvl1
         MG2HNHiw3uouQ5cWU602HmcepQ72EQSgwVWOBRYZZESdZHw4yLWGDUTSFvYmWYl7NLZA
         tUrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3LqfaqG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 76-v6sor3788351wmj.23.2018.11.11.05.55.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 11 Nov 2018 05:55:58 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3LqfaqG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZtWexDi69YMClHntdnr+M+TwyExnNfOYnFOAPBRqIcE=;
        b=Y3LqfaqGx1ul/1lJuxCcbGuA5vWcRdHWlhw+bNO6U2yzByFqKfdqgeU9Whl9bqWK93
         xqsirDoDqfef3VG2/JKJXj6A1E65KEaHgJ4lTqpeYyJKXn5gk3fz47ycczIoYQxiLE0g
         mZCxgfpqrPlwDWw1VHghKMQlZYBW3r3FXx5f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZtWexDi69YMClHntdnr+M+TwyExnNfOYnFOAPBRqIcE=;
        b=kF/2v2PE5l9zjbWMmBZAZP/FTWeOau5Q7EN8KJBvjtncpsGpIn0vnIoW1kTQxkM2bk
         uQ8Kt+7hKzDcf1WU9pgu/XVu5EKmU+UTutdwT+6oDXII4V4TAIeNRjEfiFQdTNtj3k+S
         xSaxBN67M//+WrhGHyQ4/yJHRQ3yHgxcxSocGryo6vubCU419APdztNDHVZqGRqPXtob
         5MownyYJB0mAdlzRqCK/98pmlqfhP6tQ6PSw6m96/nN6e36KFSn3DzHtTFIzGbFjKEyk
         bTRRuGTfk73SejEtIX12NKHNhNNGzMpTEA5Cr0bhsquN03/u5wqqk/Ut47os++6BJbMh
         uHfQ==
X-Gm-Message-State: AGRZ1gJxuD7w/sNYf+kHVK+JOpW1yVQUbflgcHeaQ6r6CixBAceQt7Pl
	XHI5Lr/Vypo4xBc82DP2IDiTFhlVQiIP1Rcs
X-Google-Smtp-Source: AJdET5eb8y+lnjyvwX/QQM6xkAf6qYoo0hIVi1389BnDhU+nZ8MDImFfP8I5twE6PyhR0n/fh7pWCQ==
X-Received: by 2002:a1c:ae4a:: with SMTP id x71-v6mr4937801wme.125.1541944557807;
        Sun, 11 Nov 2018 05:55:57 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (151.red-213-99-169.dynamicip.rima-tde.net. [213.99.169.151])
        by smtp.gmail.com with ESMTPSA id v189-v6sm6498145wmd.40.2018.11.11.05.55.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Nov 2018 05:55:57 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v3 1/7] target/arm64: properly handle DBGVR
 RESS bits
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20181109152119.9242-1-alex.bennee@linaro.org>
 <20181109152119.9242-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c73b6e34-6d46-9b9b-7b83-ce78df1b574f@linaro.org>
Date: Sun, 11 Nov 2018 14:55:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181109152119.9242-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: VQpYGyo1PEtQ

On 11/9/18 4:21 PM, Alex Bennée wrote:
> This only fails with some (broken) versions of gdb but we should
> treat the top bits of DBGBVR as RESS. Properly sign extend QEMU's
> reference copy of dbgbvr and also update the register descriptions in
> the comment.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
