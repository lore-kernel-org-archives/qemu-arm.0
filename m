Received: by 10.223.197.9 with SMTP id q9csp1126878wrf;
        Fri, 13 Oct 2017 13:51:04 -0700 (PDT)
X-Received: by 10.98.57.220 with SMTP id u89mr2415050pfj.104.1507927864622;
        Fri, 13 Oct 2017 13:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507927864; cv=none;
        d=google.com; s=arc-20160816;
        b=0qMlcckSbuhY5LcajxxYC6wNdr7poRTOD+l2tNdUt8QPBVd0RZbPAn1MsPm8fagfVr
         O/lQ2mvEYJlaUKtxWGZ3L0YcfejGDcYdqSbp8Ggp6imspvcxIK9i2DSaF/sn97zFyfw3
         AhFgagnsjVQqyZ9Q9K6bAqFpXeYJxzhYoHMbr9uf60lNoOSu65KrLk8gDwkRTDT7gA7Z
         ubRVT7TLUyduVrneuCvi/tdUYCnnw7QFyn+QWFduTAFRHtrf9o3FksPghIIf04RRRIR0
         vWV071MxWk/mEqVHly7bpqaey8EHh7dJJArWjUnfISqRm58gMzzUUaNp9BIJeI8Yn8N8
         TPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=qDwgi/QL0LZNuWTT09znb8n3gvcUqXXnwrTcFk2avGA=;
        b=ajdsw+4P3HJMEi2YxjN/5x0bP7IUuModlVp0n5UJUcs5jjJegJzW3BfQtk8cuBOdTT
         B2p5asVr7nrpJ0iOZ8ygo6tr5tc8XlvKOnBkoEeuWAUNgcLhAkuovOOi+aqkn3L9eXSc
         iTBxZmWuBZtg1KloxcdQLS6I45/Hmr+2ORNh152kNM327ly4yjbVybqmRMeOEOK6rMj3
         tG8oLye9oRxkHttVgDb3j9YnPZew4mxBiE7NnMCzvGkUrEGm6c46yUZTggwIWvWe+b2A
         BbzGman0BrDpfhOdX9KbbHkCcsoHj3f6Rnig5HpGoJkqviZ18OHNq0J/2jGRcvmXOSwu
         5Vqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+iH4pZR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v6sor616201plp.52.2017.10.13.13.51.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2017 13:51:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+iH4pZR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qDwgi/QL0LZNuWTT09znb8n3gvcUqXXnwrTcFk2avGA=;
        b=L+iH4pZReoOti0ziVjxgAyXWlDElLKjAW8YUK2xm9jud0irwktYArRrDJl30XZ0tFv
         DIK9CsXFBMr1wNrqvZEsguyv84ydzO7TnOj/rRUbZLzY/FJD32eEEAMvjY/y/j2E1ppt
         Ryo+f5cE9BqE/62yi0d9M0a7BrHOWmgqqidMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qDwgi/QL0LZNuWTT09znb8n3gvcUqXXnwrTcFk2avGA=;
        b=MPGOJ5rjt0DWSjXGNWZmzQDARgyJghqGxbezVmQiWhVLwug6oP3AmdT6XvbUgxCU5G
         R4TWYq7N5Oy/PVQm6ZziuicuxJeYSZYKoU3VDLwO+wZZXEXpIjMI7qAqG3fgK9qF/Q4V
         lflCaZvNjasdwt3dBpWglp8CZQbgezLHwKfY5cE3lokAvKHNecoFTUyh4J2vNJ2cQiIo
         6kDTD5dnKBA7FLlW1bihZ+fkenjnOa5369X67/KGEwpAlkQ/umf4OKCi2CePv/ljWXGx
         FmW72FLlFiUoGifBVnIFxvp32tOc9NzwwspSJjQ3bVPoO/RMKJpg/IojkGo6utDjsggN
         X21A==
X-Gm-Message-State: AMCzsaVl9rh2kAfovj79SFlN7QPDK7dx2JyFZDc4w/vb0vrcbsiOdFsV
	S+cPpgYcWH7nVrTuiAuNToR6J3pdLCXn9A==
X-Google-Smtp-Source: AOwi7QCZ5OcXwxqVCuQtPO3FksuKgyYgDhFGHxaAN6mN+fTNAvZcozGJFO4HIzUTB1nHibaYbctMFQ==
X-Received: by 10.159.247.199 with SMTP id v7mr2341587plz.321.1507927864243;
        Fri, 13 Oct 2017 13:51:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id l66sm3976418pfl.17.2017.10.13.13.51.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 13:51:03 -0700 (PDT)
Subject: Re: [RFC PATCH 06/30] fpu/softfloat: implement
 float16_squash_input_denormal
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6be71fd3-ae02-2abb-3b83-9b821dc2814a@linaro.org>
Date: Fri, 13 Oct 2017 13:51:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /EDz3c9aRzAF

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> This will be required when expanding the MINMAX() macro for 16
> bit/half-precision operations.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  fpu/softfloat.c         | 15 +++++++++++++++
>  include/fpu/softfloat.h |  1 +
>  2 files changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
